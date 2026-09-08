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
                                 127.0.0.1:5433  crm-postgres (bind mount /var/lib/crm-postgres)
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

### 2. Preparer le volume PostgreSQL

```bash
ssh erp-admin@37.27.10.140
sudo mkdir -p /var/lib/crm-postgres
sudo chown -R 70:70 /var/lib/crm-postgres     # UID postgres dans les images alpine
```

Sans cette etape, `initdb` echoue au premier demarrage (permission denied).

### 3. Creer le `.env` de production (sur le VPS uniquement)

```bash
mkdir -p /home/erp-admin/crm-project
cd /home/erp-admin/crm-project
```

Depuis le poste local, un premier `./deploy.sh` echouera volontairement en
signalant l'absence du `.env` — mais il aura deja copie `.env.example`. Sinon
creer le fichier a la main :

```bash
cat > /home/erp-admin/crm-project/.env <<'EOF'
POSTGRES_DB=pyramidev_crm
POSTGRES_USER=crm_user
POSTGRES_PASSWORD=<openssl rand -base64 32>
JWT_SECRET_KEY=<openssl rand -base64 48>
EOF
chmod 600 /home/erp-admin/crm-project/.env
```

> Les valeurs par defaut du depot (`crm_password123`, la cle JWT en clair dans
> `application.yml`) ne doivent **pas** partir en production. Le `.env` reste sur
> le VPS : `deploy.sh` l'exclut explicitement de l'envoi.

### 4. Premier deploiement

Depuis le poste local, a la racine du projet :

```bash
./deploy.sh
```

Le script envoie les sources (hors `node_modules`, `target`, `.angular`, `data`,
logs), lance `docker compose -f docker-compose.prod.yml up --build -d` sur le VPS
et attend que `crm-web` passe `healthy`. Flyway cree le schema et injecte le seed
au premier demarrage.

Verifier avant de brancher nginx :

```bash
ssh erp-admin@37.27.10.140 "curl -sI http://127.0.0.1:8080/ | head -1"   # HTTP/1.1 200
```

### 5. Vhost nginx

```bash
scp deploy/nginx/crm.distrimob.fr.conf erp-admin@37.27.10.140:/tmp/
ssh erp-admin@37.27.10.140
sudo mv /tmp/crm.distrimob.fr.conf /etc/nginx/sites-available/crm-pyramidev
sudo ln -s /etc/nginx/sites-available/crm-pyramidev /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

### 6. Certificat TLS

```bash
sudo certbot --nginx -d crm.distrimob.fr
```

Certbot ajoute lui-meme le bloc `listen 443 ssl` et la redirection 80 -> 443, comme
pour les vhosts existants. Le renouvellement automatique est deja en place sur la
machine.

L'application est alors accessible sur **https://crm.distrimob.fr**.

### 7. Sauvegarde (optionnel, recommande)

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
./deploy.sh stop       # arreter
```

Le build tourne dans Docker sur le VPS : aucun JDK, Maven ou Node requis en local.
Les couches `npm ci` et `mvn dependency:go-offline` sont mises en cache tant que
`package.json` / `pom.xml` ne changent pas, donc un redeploiement courant prend
~1 min.

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
