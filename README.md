# Mini CRM Pyramidev (Spring Boot 3 & SPA Frontend)

Ce projet est la version **Java & Spring Boot** du **Mini CRM** conçu pour l'équipe commerciale de **Pyramidev SARL** afin de suivre les prospects de leur solution B2B **DistriMob**. Elle implémente l'ensemble des contraintes techniques imposées par le cahier des charges d'origine.

---

## 🌟 Fonctionnalités Implémentées

1. **Sécurisation de l'accès (Spring Security + JWT)** : Authentification via `POST /api/auth/login` retournant `{ token, user }`. Les tokens ont une durée de validité de 24 heures. Toutes les routes `/api/**` sont sécurisées par défaut.
2. **Hashage BCrypt** : Les mots de passe des utilisateurs sont hashés avant d'être insérés ou validés (via `BCryptPasswordEncoder`).
3. **Seeding automatique au démarrage (Flyway)** : Les tables et les données d'exemples (utilisateurs, prospects, contacts, interactions) sont créées et insérées par Flyway sur la base de scripts de migration.
4. **Calcul automatique `last_interaction_at`** : Lors de tout ajout, modification ou suppression d'interaction, la date maximale des échanges est recalculée et persistée sur le prospect associé.
5. **Tri "Prospects oubliés"** : Le tri `last_interaction_at_asc` remonte en premier les prospects n'ayant **jamais** eu d'interactions (`NULLS FIRST`), suivis par les plus anciens.
6. **Interface SPA intégrée** : Le frontend monopage moderne et réactif (HTML5/CSS Moderne/JS) est servi en tant que ressources statiques directement par Spring Boot.

---

## 🛠️ Architecture Technique

- **Backend** : Spring Boot 3.3, Java 21, JPA/Hibernate, Spring Data JPA, Spring Security, JJWT (JWT library), Flyway.
- **Base de données** : PostgreSQL (avec Flyway pour les migrations automatiques).
- **Frontend** : Application Angular 19 moderne avec une charte graphique claire premium (Blanc, Vert, Jaune), développée avec des composants autonomes (standalone), gestion d'un intercepteur JWT pour l'authentification sécurisée et garde de routes.
- **Conteneurisation** : Docker & Docker Compose (Base de données PostgreSQL et serveur web Spring Boot).

---

## 🚀 Lancement Recommandé avec Docker Compose

Le moyen le plus simple et recommandé pour lancer l'application avec **PostgreSQL** sans rien installer :

1. Ouvrez un terminal dans le dossier racine du projet.
2. Exécutez :
   ```bash
   docker-compose up --build -d
   ```
   *Docker va automatiquement démarrer la base de données **PostgreSQL**, appliquer les migrations Flyway, compiler le frontend Angular 19 et le backend Java, et rendre le site immédiatement disponible.*
3. Ouvrez votre navigateur sur : **`http://localhost:8080`**

---

## 🛠️ Lancement Local Manuel (sans Docker)

Si vous disposez d'un serveur PostgreSQL local (`localhost:5432`) avec une base `pyramidev_crm` :

1. **Démarrer le Serveur Backend (Spring Boot)** :
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\run_local.ps1
   ```
2. **Démarrer le Serveur Frontend (Angular 19 en mode dev)** :
   ```powershell
   cd frontend
   npm start
   ```
3. Ouvrez votre navigateur sur : **`http://localhost:4200`** (ou `http://localhost:8080`).

---

## 🐋 Lancement en Production avec Docker Compose

Pour déployer l'application avec la base de données **PostgreSQL** :

1. Ouvrez un terminal dans le dossier racine.
2. Exécutez la commande :
   ```bash
   docker-compose up --build -d
   ```
   *Docker compile d'abord l'application Angular 19, copie les fichiers de build dans les ressources statiques de Spring Boot, compile le code source Java, lance le conteneur PostgreSQL, applique les migrations Flyway et expose l'ensemble de l'application sur le port `8080`.*
3. Accédez à l'application sur **`http://localhost:8080`**.

---

## 🔑 Identifiants d'accès (Flyway Seed)

Connectez-vous avec :

- **Compte Administrateur** :
  - **Email** : `admin@pyramidev.com`
  - **Mot de passe** : `Pyramidev2026!`
- **Compte Commercial** :
  - **Email** : `com1@pyramidev.com`
  - **Mot de passe** : `Pyramidev2026!`

---

## 🧪 Exécuter les tests unitaires Java

Pour lancer les tests unitaires (validation de la sécurité, de l'authentification JWT, et du calcul automatique de dernière interaction) :
```powershell
powershell -ExecutionPolicy Bypass -File .\run_local.ps1 test
```
