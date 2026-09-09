# Deploiement CRM Pyramidev sur le VPS

VPS partage avec l'ERP DistriMob (`37.27.10.140`, user `erp-admin`). Le CRM tourne
a cote sans toucher a l'existant : ports, conteneurs, volume et vhost distincts.

## Architecture retenue

Contrairement a l'ERP (3 sous-domaines : admin / mobile / api), le CRM est un
**monolithe** : le Dockerfile compile Angular puis copie le build dans
`src/main/resources/static/` du JAR. Spring Boot sert donc la SPA **et** l'API sur
le meme port. Le front appelle `/api/...` en relatif -> aucun CORS, aucune URL
d'API a configurer. Le fallback des routes SPA est gere cote Java
(`SpaWebController`), donc nginx n'a pas besoin de `try_files`.

```
Internet ── nginx :443 (crm.distrimob.fr, cert Certbot)
              └── proxy_pass ──> 127.0.0.1:8080  crm-web    (SPA + API, image buildee sur le VPS)
                                 127.0.0.1:5433  crm-postgres (volume Docker crm_postgres_data)
```

Ports choisis pour ne pas croiser l'ERP (backend 8081, postgres 5432) et fermes a
l'exterieur : seul nginx atteint l'application.

---

## Installation initiale (une seule fois)

### 1. DNS

Creer un enregistrement **A** chez le registrar de `distrimob.fr` :

```
crm.distrimob.fr.   A   37.27.10.140
```

Attendre la propagation avant l'etape Certbot :

```bash
dig +short crm.distrimob.fr    # doit renvoyer 37.27.10.140
```

### 2. `.env` de production — FAIT

Le fichier `/home/erp-admin/crm-project/.env` a ete cree sur le VPS avec un mot de
passe PostgreSQL et une cle JWT generes par `openssl rand`, en mode `600`. Il ne
quitte jamais le serveur : `deploy.sh` et `.dockerignore` l'excluent tous les deux.

Les valeurs par defaut du depot (`crm_password123`, la cle JWT en clair dans
`application.yml`) ne sont donc pas utilisees en production.

### 3. Premier deploiement — FAIT

```bash
./deploy.sh
```

Le script envoie les sources (hors `node_modules`, `target`, `.angular`, `data`,
logs), lance `docker compose -f docker-compose.prod.yml up --build -d` sur le VPS
et attend que `crm-web` passe `healthy`.

Etat verifie apres ce premier deploiement :

- `crm-web` et `crm-postgres` : `healthy`
- Flyway : migrations `V1`, `V2`, `V3` appliquees (`success = t`)
- Seed : 2 utilisateurs, 3 prospects, 2 contacts, 4 interactions
- `GET /` : `HTTP 200`, sert bien le build Angular (`<title>Pyramidev - Mini CRM</title>`)
- `POST /api/auth/login` : `HTTP 200` (BCrypt + JWT operationnels)
- `GET /api/prospects` sans token : `HTTP 403`
- Aucune erreur ni exception dans les logs de demarrage
- Conteneurs ERP inchanges

L'application tourne, accessible uniquement depuis le VPS
(`http://127.0.0.1:8080`) tant que les etapes 4 et 5 ne sont pas faites.

### 4. Vhost nginx + certificat TLS — A FAIRE (sudo requis)

Ces deux etapes demandent `sudo`, qui exige un mot de passe : elles ne peuvent pas
etre lancees depuis une session SSH non interactive. Le script
`deploy/setup-privileged.sh` les enchaine et se trouve deja sur le VPS.

Une fois l'enregistrement DNS de l'etape 1 propage :

```bash
ssh erp-admin@37.27.10.140
./crm-project/setup-privileged.sh
```

Il verifie d'abord que `crm.distrimob.fr` resout vers `37.27.10.140` et s'arrete
sinon, installe le vhost, valide la conf avec `nginx -t` avant tout `reload` (les
sites ERP existants ne peuvent donc pas etre casses par une conf invalide), puis
lance Certbot qui ajoute le bloc `listen 443 ssl` et la redirection 80 -> 443.

L'application est alors accessible sur **https://crm.distrimob.fr**.

### 5. Sauvegarde (optionnel, recommande)

Le VPS a deja un cron de backup pour l'ERP (`/home/erp-admin/backup-db.sh`, 3h du
matin, upload S3). Pour couvrir aussi le CRM, dupliquer le script en changeant
trois variables :

```
POSTGRES_CONTAINER="crm-postgres"
POSTGRES_USER="crm_user"
POSTGRES_DB="pyramidev_crm"
BACKUP_FILE="crm_backup_${DATE}.sql.gz"
```

puis ajouter une ligne au crontab (`crontab -e`) :

```
15 3 * * * /home/erp-admin/backup-crm-db.sh >> /home/erp-admin/backup-crm.log 2>&1
```

---

## Deploiements suivants

```bash
./deploy.sh            # sync sources + rebuild + restart
./deploy.sh logs       # suivre les logs applicatifs
./deploy.sh status     # etat des conteneurs CRM
./deploy.sh restart    # redemarrer sans rebuild
./deploy.sh psql       # console PostgreSQL
./import-linkedin.sh   # import LinkedIn (script separe : sauvegarde + import + controle)
./deploy.sh stop       # arreter
```

Le build tourne dans Docker sur le VPS : aucun JDK, Maven ou Node requis en local.
Les couches `npm ci` et `mvn dependency:go-offline` sont mises en cache tant que
`package.json` / `pom.xml` ne changent pas, donc un redeploiement courant prend
~1 min.

---

## Import de l'historique LinkedIn

```bash
./deploy.sh            # d'abord : deploie front + back, Flyway applique V4 et V5
./import-linkedin.sh   # ensuite : sauvegarde, import, controle
```

`import-linkedin.sh` est independant du deploiement et ne touche que la base.
Il refuse de s'executer tant que les migrations V4 et V5 ne sont pas en base
(le script ecrit dans `prospect.linkedin_url`, colonne creee par V5). Il enchaine :

1. controle des migrations, arret net si V4/V5 manquent ;
2. `pg_dump` horodate dans `~/crm_avant_import_AAAAMMJJ_HHMMSS.sql.gz` ;
3. transfert du SQL, application avec `ON_ERROR_STOP=1` puis **effacement du fichier
   distant** — il contient des messages LinkedIn prives ;
4. comptage de controle : 78 prospects, 64 contacts, 64 interactions attendus.

Le SQL est encadre par `BEGIN/COMMIT` : en cas d'erreur, rien n'est ecrit a moitie.
Il est idempotent, le rejouer ne cree aucun doublon.

`csv/` et `import/` sont exclus de `sync_sources` : les messages bruts ne sont plus
envoyes sur le VPS partage, seul le SQL y transite le temps de l'import.

Voir `import/linkedin/PLAN_REPRISE.md` pour le detail des donnees et des choix de mapping.

---

## Points de vigilance

- **`ddl-auto: validate`** : toute evolution du modele JPA exige une migration
  Flyway `V4__...sql`, sinon l'application refuse de demarrer.
- **Comptes du seed** (`admin@pyramidev.com` / `Pyramidev2026!`) : changer le mot
  de passe apres la premiere connexion, ils sont publics dans le README.
- **`CorsConfiguration.setAllowedOrigins(List.of("*"))`** dans `SecurityConfig`
  n'est pas necessaire ici (front et API sont sur la meme origine) et ouvre l'API
  a n'importe quel site. A restreindre a `https://crm.distrimob.fr` ou a supprimer.
- **Le projet n'est pas sous Git.** Un `git init` + commit initial avant le premier
  deploiement evite de deployer un etat non reproductible.
- Fichiers a supprimer du depot : `hs_err_pid*.log`, `replay_pid*.log`,
  `docker-compose.yml.bak`, `data/crmdb.mv.db` (reliquat H2), `target/`. Ils sont
  deja exclus du build et de l'envoi, mais polluent le livrable.
