-- Import de l'historique de prospection LinkedIn -> CRM Pyramidev
-- Genere par import/linkedin/csv_to_sql.py  (owner_id=1)
-- 78 prospect(s), 64 contact(s), 64 interaction(s)
-- 10 contact(s) hors perimetre exclus (Recruteur (entrant), Personnel)
-- Idempotent : chaque INSERT est garde par NOT EXISTS, rejouable sans doublon.

BEGIN;

-- ================= PROSPECTS =================
-- IMRASOFT (partenaire Sage)
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'IMRASOFT (partenaire Sage)', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C002). Catégorie : Partenaire potentiel. Statut d''origine : À relancer - intérêt exprimé. Poste LinkedIn : Gérant à IMRASOFT (partenaire Sage).', 1, TIMESTAMPTZ '2026-06-23 12:00:00+01', TIMESTAMPTZ '2026-09-08 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'IMRASOFT (partenaire Sage)');

-- NUMADVISOR
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'NUMADVISOR', 'services', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C001). Catégorie : Partenaire potentiel. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Directeur général chez NUMADVISOR.
Import LinkedIn (C029). Catégorie : Partenaire potentiel. Statut d''origine : Sans réponse. Poste LinkedIn : Directeur des opérations - NumAdvisor.', 1, TIMESTAMPTZ '2026-06-29 12:00:00+01', TIMESTAMPTZ '2026-09-08 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'NUMADVISOR');

-- ABM Distribution
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'ABM Distribution', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C003). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Chargée administrative & financière - ABM Distribution.', 1, TIMESTAMPTZ '2026-09-01 12:00:00+01', TIMESTAMPTZ '2026-09-01 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'ABM Distribution');

-- NewtonX
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'NewtonX', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C004). Catégorie : Sollicitation entrante. Statut d''origine : Non traité. Poste LinkedIn : Recruitment Associate @ NewtonX.', 1, TIMESTAMPTZ '2026-08-26 12:00:00+01', TIMESTAMPTZ '2026-08-26 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'NewtonX');

-- [?] Lars Higham
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Lars Higham', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C005). Catégorie : Réseau. Statut d''origine : Sans réponse. Poste LinkedIn : Network and Security Architect / Engineer. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-08-09 12:00:00+01', TIMESTAMPTZ '2026-08-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Lars Higham');

-- [?] Zakaria Zatni
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Zakaria Zatni', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C009). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Coordinateur national des ventes. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-30 12:00:00+01', TIMESTAMPTZ '2026-07-08 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Zakaria Zatni');

-- [?] Oussama BOUCHAAB
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Oussama BOUCHAAB', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C008). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Directeur général SMCPA. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-28 12:00:00+01', TIMESTAMPTZ '2026-07-08 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Oussama BOUCHAAB');

-- HHT Android / Windows Mobile
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'HHT Android / Windows Mobile', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C007). Catégorie : Expert métier. Statut d''origine : Sans réponse. Poste LinkedIn : Expert systèmes de mobilité - HHT Android / Windows Mobile.', 1, TIMESTAMPTZ '2026-06-26 12:00:00+01', TIMESTAMPTZ '2026-07-08 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'HHT Android / Windows Mobile');

-- Sotherma
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Sotherma', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C015). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Commercial Director - Sotherma.', 1, TIMESTAMPTZ '2026-06-25 12:00:00+01', TIMESTAMPTZ '2026-06-25 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Sotherma');

-- [?] Ali Ahda
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Ali Ahda', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'RDV planifié', 'Import LinkedIn (C013). Catégorie : Prospect DistriMob. Statut d''origine : RDV convenu - relance sans réponse. Poste LinkedIn : Directeur commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-19 12:00:00+01', TIMESTAMPTZ '2026-06-25 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Ali Ahda');

-- [?] Abdeslam Essahraoui
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Abdeslam Essahraoui', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C027). Catégorie : Partenaire potentiel. Statut d''origine : Coordonnées transmises - relance sans réponse. Poste LinkedIn : CEO GRS4CLOUD / consultant SAP EWM. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-04 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Abdeslam Essahraoui');

-- [?] Khalid JOUMAA
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Khalid JOUMAA', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C026). Catégorie : Partenaire potentiel. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Associate-Manager DELTA CLOUD (partenaire Sage). Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-09 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Khalid JOUMAA');

-- [?] EL HILALI ALAOUI NAWFAL
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] EL HILALI ALAOUI NAWFAL', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C025). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Directeur développement commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] EL HILALI ALAOUI NAWFAL');

-- FUNFRIES - Distribution CHR & Retail
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'FUNFRIES - Distribution CHR & Retail', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C024). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Directeur commercial chez FUNFRIES - Distribution CHR & Retail.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'FUNFRIES - Distribution CHR & Retail');

-- FMCG & Distribution | Executive MBA
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'FMCG & Distribution | Executive MBA', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C023). Catégorie : Prospect DistriMob. Statut d''origine : Accord de principe - créneau non fixé. Poste LinkedIn : Commercial Director | FMCG & Distribution | Executive MBA.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'FMCG & Distribution | Executive MBA');

-- Sales Uplift
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Sales Uplift', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C022). Catégorie : Expert métier. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Founder & General Manager at Sales Uplift.', 1, TIMESTAMPTZ '2026-06-15 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Sales Uplift');

-- CR&SG
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'CR&SG', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C021). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Responsable administratif des ventes chez CR&SG.', 1, TIMESTAMPTZ '2026-06-16 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'CR&SG');

-- solutions électriques & Power Quality
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'solutions électriques & Power Quality', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C020). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Directeur Commercial - solutions électriques & Power Quality.', 1, TIMESTAMPTZ '2026-06-15 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'solutions électriques & Power Quality');

-- [?] Achraf Rifaiy
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Achraf Rifaiy', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C019). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Superviseur commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-19 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Achraf Rifaiy');

-- Nodma Horizon (intégrateur Sage/Microsoft/Odoo)
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Nodma Horizon (intégrateur Sage/Microsoft/Odoo)', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'RDV planifié', 'Import LinkedIn (C018). Catégorie : Partenaire potentiel. Statut d''origine : En discussion - démo à planifier. Poste LinkedIn : Responsable marketing - Nodma Horizon (intégrateur Sage/Microsoft/Odoo).', 1, TIMESTAMPTZ '2026-06-02 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Nodma Horizon (intégrateur Sage/Microsoft/Odoo)');

-- Oland Group
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Oland Group', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C017). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : REGIONAL SALES MANAGER - Oland Group.', 1, TIMESTAMPTZ '2026-06-24 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Oland Group');

-- SOMADIR
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'SOMADIR', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'RDV planifié', 'Import LinkedIn (C016). Catégorie : Prospect DistriMob. Statut d''origine : RDV proposé - à confirmer. Poste LinkedIn : Responsable commercial national chez SOMADIR.
Import LinkedIn (C061). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-06-23 12:00:00+01', TIMESTAMPTZ '2026-06-24 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'SOMADIR');

-- GDIRAGRI
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'GDIRAGRI', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C033). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Executive Leader - GDIRAGRI.
Import LinkedIn (C074). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-06-22 12:00:00+01', TIMESTAMPTZ '2026-06-23 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'GDIRAGRI');

-- [?] El Mehdi CHAIR
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] El Mehdi CHAIR', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C032). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Directeur commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-03-06 12:00:00+01', TIMESTAMPTZ '2026-06-23 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] El Mehdi CHAIR');

-- SWISS Distribution
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'SWISS Distribution', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'RDV planifié', 'Import LinkedIn (C031). Catégorie : Prospect DistriMob. Statut d''origine : RDV téléphonique en cours de calage. Poste LinkedIn : Directeur Commercial holding - SWISS Distribution.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', TIMESTAMPTZ '2026-06-23 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'SWISS Distribution');

-- F2V Maroc
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'F2V Maroc', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C030). Catégorie : Partenaire potentiel. Statut d''origine : Coordonnées obtenues - à rappeler. Poste LinkedIn : Directeur-fondateur chez F2V Maroc.', 1, TIMESTAMPTZ '2026-06-23 12:00:00+01', TIMESTAMPTZ '2026-06-23 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'F2V Maroc');

-- [?] AIT EL KAID SALAH EDDINE
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] AIT EL KAID SALAH EDDINE', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C039). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Responsable Systèmes d’informations. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-21 12:00:00+01', TIMESTAMPTZ '2026-06-22 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] AIT EL KAID SALAH EDDINE');

-- [?] YOUSSEF BOUCHGHAL
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] YOUSSEF BOUCHGHAL', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C038). Catégorie : Prospect DistriMob. Statut d''origine : Accord de principe - échange reporté. Poste LinkedIn : Master Système d’information Marketing et Commerce. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-14 12:00:00+01', TIMESTAMPTZ '2026-06-22 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] YOUSSEF BOUCHGHAL');

-- [?] Said EL FDAR
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Said EL FDAR', 'FMCG', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C037). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Régional Sales Manager (FMCG). Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-20 12:00:00+01', TIMESTAMPTZ '2026-06-22 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Said EL FDAR');

-- [?] Med. Adil El Hassani
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Med. Adil El Hassani', 'agroalimentaire', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'perdu', 'Import LinkedIn (C035). Catégorie : Prospect DistriMob. Statut d''origine : Clos - dernière relance sans réponse. Poste LinkedIn : Directeur Commercial Food. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-03-22 12:00:00+01', TIMESTAMPTZ '2026-06-22 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Med. Adil El Hassani');

-- [?] Rhalouty Mohammed
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Rhalouty Mohammed', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C034). Catégorie : Prospect DistriMob. Statut d''origine : Coordonnées obtenues - à rappeler. Poste LinkedIn : Responsable du développement de projets. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-04-21 12:00:00+01', TIMESTAMPTZ '2026-06-22 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Rhalouty Mohammed');

-- [?] Omar Guerouani
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Omar Guerouani', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C040). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Commercial Director. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', TIMESTAMPTZ '2026-06-15 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Omar Guerouani');

-- [?] hicham mansouri
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] hicham mansouri', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C042). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Directeur commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', TIMESTAMPTZ '2026-06-13 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] hicham mansouri');

-- [?] Zakaria El Missaoui
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Zakaria El Missaoui', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C041). Catégorie : Prospect DistriMob. Statut d''origine : Référence obtenue - à contacter. Poste LinkedIn : Regional Sales Manager. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-10 12:00:00+01', TIMESTAMPTZ '2026-06-13 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Zakaria El Missaoui');

-- [?] EL M’KADMI HAMZA
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] EL M’KADMI HAMZA', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C044). Catégorie : Expert métier. Statut d''origine : Coordonnées obtenues - à rappeler. Poste LinkedIn : Merchandiser en Grande Distribution. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-09 12:00:00+01', TIMESTAMPTZ '2026-06-12 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] EL M’KADMI HAMZA');

-- Les Laboratoires Vilion
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Les Laboratoires Vilion', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C043). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Directeur commercial chez Les Laboratoires Vilion.', 1, TIMESTAMPTZ '2026-06-09 12:00:00+01', TIMESTAMPTZ '2026-06-12 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Les Laboratoires Vilion');

-- [?] Mohamed KARIMI
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Mohamed KARIMI', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'perdu', 'Import LinkedIn (C045). Catégorie : Prospect DistriMob. Statut d''origine : Clos - hors périmètre, demande de référence. Poste LinkedIn : Directeur Commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-04-14 12:00:00+01', TIMESTAMPTZ '2026-06-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Mohamed KARIMI');

-- [?] Saad BAGHO
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Saad BAGHO', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C049). Catégorie : Réseau / avis. Statut d''origine : En attente de disponibilité. Poste LinkedIn : Consultant Salesforce Commerce Cloud. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-03 12:00:00+01', TIMESTAMPTZ '2026-06-05 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Saad BAGHO');

-- [?] abdellatif kouhaiz
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] abdellatif kouhaiz', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C048). Catégorie : Prospect DistriMob. Statut d''origine : Coordonnées obtenues - à rappeler. Poste LinkedIn : Responsable développement commercial / Business Developer. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-04 12:00:00+01', TIMESTAMPTZ '2026-06-05 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] abdellatif kouhaiz');

-- KAMSINFO
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'KAMSINFO', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C050). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-06-04 12:00:00+01', TIMESTAMPTZ '2026-06-04 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'KAMSINFO');

-- [?] Sara FILALI
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Sara FILALI', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C053). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Commercial & Marketing Engagement Specialist. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-02 12:00:00+01', TIMESTAMPTZ '2026-06-03 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Sara FILALI');

-- DELTA CLOUD
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'DELTA CLOUD', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C052). Catégorie : Partenaire potentiel. Statut d''origine : Sans réponse. Poste LinkedIn : Chef de projet senior chez DELTA CLOUD.', 1, TIMESTAMPTZ '2026-06-02 12:00:00+01', TIMESTAMPTZ '2026-06-03 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'DELTA CLOUD');

-- [?] RACHID AARABI
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] RACHID AARABI', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C051). Catégorie : Prospect DistriMob. Statut d''origine : Relancé - sans réponse. Poste LinkedIn : Directeur regional commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-03-05 12:00:00+01', TIMESTAMPTZ '2026-06-03 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] RACHID AARABI');

-- LISA & CO
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'LISA & CO', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'démo réalisée', 'Import LinkedIn (C054). Catégorie : Prospect DistriMob. Statut d''origine : RDV tenu - visio du 08/05. Poste LinkedIn : Directeur Associé chez LISA & CO.', 1, TIMESTAMPTZ '2026-03-10 12:00:00+01', TIMESTAMPTZ '2026-04-29 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'LISA & CO');

-- Mediastore Informatique
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Mediastore Informatique', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C060). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-04-21 12:00:00+01', TIMESTAMPTZ '2026-04-21 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Mediastore Informatique');

-- Solarway
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Solarway', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C059). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-04-21 12:00:00+01', TIMESTAMPTZ '2026-04-21 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Solarway');

-- Salipro
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Salipro', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C058). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-04-21 12:00:00+01', TIMESTAMPTZ '2026-04-21 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Salipro');

-- TOP CRAYON
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'TOP CRAYON', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C057). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-04-21 12:00:00+01', TIMESTAMPTZ '2026-04-21 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'TOP CRAYON');

-- TOP STYLO
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'TOP STYLO', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C056). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-04-21 12:00:00+01', TIMESTAMPTZ '2026-04-21 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'TOP STYLO');

-- [?] Najib BELKHAYAT
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Najib BELKHAYAT', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'RDV planifié', 'Import LinkedIn (C062). Catégorie : Expert métier. Statut d''origine : RDV convenu - appel du 27/03. Poste LinkedIn : Contact réseau (proche de la famille). Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-03-01 12:00:00+01', TIMESTAMPTZ '2026-03-27 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Najib BELKHAYAT');

-- FMCG / Distribution multicanale
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'FMCG / Distribution multicanale', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C063). Catégorie : Prospect DistriMob. Statut d''origine : Sans réponse. Poste LinkedIn : Directeur Commercial & Export - FMCG / Distribution multicanale.', 1, TIMESTAMPTZ '2026-03-13 12:00:00+01', TIMESTAMPTZ '2026-03-15 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'FMCG / Distribution multicanale');

-- BAKKAL MARKET
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'BAKKAL MARKET', 'agroalimentaire', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C068). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-09 12:00:00+01', TIMESTAMPTZ '2026-03-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'BAKKAL MARKET');

-- Industape
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Industape', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C067). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-09 12:00:00+01', TIMESTAMPTZ '2026-03-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Industape');

-- QUALAVI S.A.R.L
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'QUALAVI S.A.R.L', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C066). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-09 12:00:00+01', TIMESTAMPTZ '2026-03-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'QUALAVI S.A.R.L');

-- KARA DISTRIBUTION
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'KARA DISTRIBUTION', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C065). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-09 12:00:00+01', TIMESTAMPTZ '2026-03-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'KARA DISTRIBUTION');

-- TENDER FISH
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'TENDER FISH', 'agroalimentaire', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C064). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-09 12:00:00+01', TIMESTAMPTZ '2026-03-09 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'TENDER FISH');

-- Maroc Diabète Plus
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Maroc Diabète Plus', 'pharma', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C070). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Relancé - sans suite.', 1, TIMESTAMPTZ '2026-03-07 12:00:00+01', TIMESTAMPTZ '2026-03-07 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Maroc Diabète Plus');

-- TIMAC AGRO MAROC
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'TIMAC AGRO MAROC', 'agroalimentaire', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C069). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-07 12:00:00+01', TIMESTAMPTZ '2026-03-07 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'TIMAC AGRO MAROC');

-- MAROC ORGANIC
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'MAROC ORGANIC', 'agroalimentaire', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C072). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-05 12:00:00+01', TIMESTAMPTZ '2026-03-05 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'MAROC ORGANIC');

-- abm distribution maroc
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'abm distribution maroc', 'distribution', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'contact établi', 'Import LinkedIn (C071). Catégorie : Prospect DistriMob (page entreprise). Statut d''origine : Sans réponse.', 1, TIMESTAMPTZ '2026-03-05 12:00:00+01', TIMESTAMPTZ '2026-03-05 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'abm distribution maroc');

-- [?] Mohammed DRIF
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Mohammed DRIF', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'qualifié', 'Import LinkedIn (C073). Catégorie : Prospect DistriMob. Statut d''origine : Coordonnées obtenues - à rappeler. Poste LinkedIn : Directeur Commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-03-04 12:00:00+01', TIMESTAMPTZ '2026-03-04 12:00:00+01'
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Mohammed DRIF');

-- [?] Anton Hajdinaj
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Anton Hajdinaj', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C091). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Freelance Technical coach. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-03-04 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Anton Hajdinaj');

-- PHP, Laravel, Vue.js, React.js
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'PHP, Laravel, Vue.js, React.js', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C090). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Senior Full Stack Developer | PHP, Laravel, Vue.js, React.js.', 1, TIMESTAMPTZ '2026-03-04 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'PHP, Laravel, Vue.js, React.js');

-- Brussels
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Brussels', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C089). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Senior Helpdesk / SaaS / ERP / CRM - Brussels.', 1, TIMESTAMPTZ '2026-03-04 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Brussels');

-- Python · SQL · Power BI · BI
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Python · SQL · Power BI · BI', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C088). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Analyste des données | Python · SQL · Power BI · BI.', 1, TIMESTAMPTZ '2026-03-04 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Python · SQL · Power BI · BI');

-- [?] Manon Kerrels
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Manon Kerrels', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C087). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Java / Angular developer. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-02 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Manon Kerrels');

-- GRS4CLOUD & M2ASOFT
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'GRS4CLOUD & M2ASOFT', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C086). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : CFO at GRS4CLOUD & M2ASOFT.', 1, TIMESTAMPTZ '2026-06-08 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'GRS4CLOUD & M2ASOFT');

-- [?] Ibrahim SELBOUK
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Ibrahim SELBOUK', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C085). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Directeur Commercial. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Ibrahim SELBOUK');

-- Insitoo
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Insitoo', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C084). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Responsable d''Agence IDF / Business Manager chez Insitoo.', 1, TIMESTAMPTZ '2026-06-12 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Insitoo');

-- [?] Fouad RAKIB
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Fouad RAKIB', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C083). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Directeur Commercial Adjoint. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-14 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Fouad RAKIB');

-- [?] Ikram AGURIACH
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Ikram AGURIACH', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C082). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : IT Talent Acquisition Specialist & Account Manager. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-20 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Ikram AGURIACH');

-- [?] Jonathan Rockx
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Jonathan Rockx', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C081). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Gestion administrative et financière pour entrepreneurs. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-06-23 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Jonathan Rockx');

-- Partenaire Sage agréé
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Partenaire Sage agréé', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C080). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : CEO FORSOFT - Partenaire Sage agréé.', 1, TIMESTAMPTZ '2026-06-23 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Partenaire Sage agréé');

-- Réseau national 1200 revendeurs (Maroc)
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Réseau national 1200 revendeurs (Maroc)', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C079). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Directeur Commercial & Business Development | Réseau national 1200 revendeurs (Maroc).', 1, TIMESTAMPTZ '2026-07-11 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Réseau national 1200 revendeurs (Maroc)');

-- [?] Achraf Akansous
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT '[?] Achraf Akansous', 'IT / éditeur', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C078). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : IT Manager Oland Group. Entreprise non identifiée sur LinkedIn — à qualifier.', 1, TIMESTAMPTZ '2026-07-30 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = '[?] Achraf Akansous');

-- Sopra Steria | CS Graduate - University of Paris-Saclay
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Sopra Steria | CS Graduate - University of Paris-Saclay', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C077). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : SWE @ Sopra Steria | CS Graduate - University of Paris-Saclay.', 1, TIMESTAMPTZ '2026-08-09 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Sopra Steria | CS Graduate - University of Paris-Saclay');

-- Office de la Naissance et de l'Enfance (ONE)
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'Office de la Naissance et de l''Enfance (ONE)', 'services', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C076). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : Conseiller budgétaire | Office de la Naissance et de l''Enfance (ONE).', 1, TIMESTAMPTZ '2026-08-09 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'Office de la Naissance et de l''Enfance (ONE)');

-- PEPSI - VBM
INSERT INTO prospect (name, activity_sector, city, phone, website, linkedin_url, source, status, notes, owner_id, created_at, last_interaction_at)
SELECT 'PEPSI - VBM', 'autre', 'Inconnue', NULL, NULL, NULL, 'LinkedIn', 'nouveau', 'Import LinkedIn (C075). Catégorie : Relation 2026 (non contactée en message). Statut d''origine : Aucun échange. Poste LinkedIn : CIO at PEPSI - VBM.', 1, TIMESTAMPTZ '2026-09-02 12:00:00+01', NULL
WHERE NOT EXISTS (SELECT 1 FROM prospect WHERE name = 'PEPSI - VBM');

-- ================= CONTACTS =================
INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Hicham', 'MAKHELLA', 'Gérant', NULL, NULL, 'https://www.linkedin.com/in/hicham-makhella-16999159', 'A répondu favorablement le 25/06 : DistriMob intéressant pour ses clients Sage avec équipes terrain. Demande de créneau restée sans suite, relance le 08/09.'
FROM prospect p WHERE p.name = 'IMRASOFT (partenaire Sage)'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-makhella-16999159')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Said', 'TOUATE', 'Directeur général', NULL, NULL, 'https://www.linkedin.com/in/saidtouate', 'Prise de contact DistriMob (synergies NumAdvisor) le 08/07, relance le 08/09. Aucune réponse à ce jour.'
FROM prospect p WHERE p.name = 'NUMADVISOR'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/saidtouate')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'zainab', 'Chaaboun', 'Chargée administrative & financière', NULL, NULL, 'https://www.linkedin.com/in/zainab-chaaboun-4b6a36199', 'Prise de contact après ajout : question sur son lien avec les équipes commerciales terrain chez ABM Distribution.'
FROM prospect p WHERE p.name = 'ABM Distribution'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zainab-chaaboun-4b6a36199')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Bilal', 'Farrukh', 'Recruitment Associate', NULL, NULL, NULL, 'InMail NewtonX : sondage rémunéré de 20 min (45 USD) sur l’adoption des outils IA par les développeurs. Sans réponse.'
FROM prospect p WHERE p.name = 'NewtonX'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Bilal' AND c.last_name = 'Farrukh')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Lars', 'Higham', 'Network and Security Architect / Engineer', NULL, NULL, 'https://www.linkedin.com/in/lars-higham-7801b71', 'Demande de mise en relation générique, sans suite.'
FROM prospect p WHERE p.name = '[?] Lars Higham'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/lars-higham-7801b71')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Zakaria', 'Zatni', 'Coordinateur national des ventes', NULL, NULL, 'https://www.linkedin.com/in/zakaria-zatni-b29681186', 'Sollicitation pour un échange de 20 minutes sur son expérience vente / distribution.'
FROM prospect p WHERE p.name = '[?] Zakaria Zatni'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zakaria-zatni-b29681186')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Oussama', 'BOUCHAAB', 'Directeur général SMCPA', NULL, NULL, 'https://www.linkedin.com/in/oussama-bouchaab-10b3b9166', 'Sollicitation pour un avis terrain (distribution alimentaire).'
FROM prospect p WHERE p.name = '[?] Oussama BOUCHAAB'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/oussama-bouchaab-10b3b9166')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'AHMED', 'NAMOUSS', 'Expert systèmes de mobilité', NULL, NULL, 'https://www.linkedin.com/in/ahmed-namouss-49292069', 'Sollicitation pour un avis métier et technique sur DistriMob (expertise HHT / mobilité).'
FROM prospect p WHERE p.name = 'HHT Android / Windows Mobile'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ahmed-namouss-49292069')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Hicham', 'DAKIR', 'Commercial Director', NULL, NULL, 'https://www.linkedin.com/in/hicham-dakir', 'Prise de contact après ajout : sollicitation de son retour d’expérience terrain en distribution.'
FROM prospect p WHERE p.name = 'Sotherma'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-dakir')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Ali', 'Ahda', 'Directeur commercial', NULL, NULL, 'https://www.linkedin.com/in/ali-ahda-5a7463ab', 'A accepté un échange le 25/06 à 11h, mais n’a pas transmis son numéro WhatsApp. Trois relances restées sans réponse.'
FROM prospect p WHERE p.name = '[?] Ali Ahda'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ali-ahda-5a7463ab')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Abdeslam', 'Essahraoui', 'CEO GRS4CLOUD / consultant SAP EWM', NULL, NULL, 'https://www.linkedin.com/in/abdeslam-essahraoui-73684b122', 'A proposé de fixer un créneau le 07/06. Coordonnées (mail + téléphone) transmises le 08/06, puis relance le 24/06 sans réponse.'
FROM prospect p WHERE p.name = '[?] Abdeslam Essahraoui'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/abdeslam-essahraoui-73684b122')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Khalid', 'JOUMAA', 'Associate-Manager DELTA CLOUD (partenaire Sage)', NULL, NULL, 'https://www.linkedin.com/in/khalid-joumaa-5a5121295', 'Prise de contact le 09/06 (angle clients Sage) puis relance le 24/06. Sans réponse.'
FROM prospect p WHERE p.name = '[?] Khalid JOUMAA'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/khalid-joumaa-5a5121295')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'EL', 'HILALI ALAOUI NAWFAL', 'Directeur développement commercial', NULL, NULL, 'https://www.linkedin.com/in/el-hilali-alaoui-nawfal-07b40a27', 'Prise de contact le 13/06 puis relance le 24/06 (réseaux de distribution). Sans réponse.'
FROM prospect p WHERE p.name = '[?] EL HILALI ALAOUI NAWFAL'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-hilali-alaoui-nawfal-07b40a27')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Mohammed Atif', 'SRHEIYER', 'Directeur commercial', NULL, NULL, 'https://www.linkedin.com/in/srheiyer-mohammed-atif-53905482', 'Prise de contact le 13/06 puis relance le 24/06 (distribution CHR & retail). Sans réponse.'
FROM prospect p WHERE p.name = 'FUNFRIES - Distribution CHR & Retail'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/srheiyer-mohammed-atif-53905482')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Yassine', 'Bentassil', 'Commercial Director', NULL, NULL, 'https://www.linkedin.com/in/yassine-bentassil-61bb8751', 'A accepté le principe d’un échange le 13/06 (WhatsApp ou visio) mais n’a jamais proposé de créneau. Deux relances (15/06 et 24/06).'
FROM prospect p WHERE p.name = 'FMCG & Distribution | Executive MBA'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/yassine-bentassil-61bb8751')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Adil', 'RAISS', 'Founder & General Manager', NULL, NULL, 'https://www.linkedin.com/in/adil-raiss-7314ba8', 'Prise de contact le 15/06 puis relance le 24/06 (expertise force de vente FMCG). Sans réponse.'
FROM prospect p WHERE p.name = 'Sales Uplift'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/adil-raiss-7314ba8')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'asmaa', 'A.Zahrane', 'Responsable administratif des ventes', NULL, NULL, 'https://www.linkedin.com/in/asmaa-a-zahrane-17388064', 'Prise de contact le 19/06 (angle Sage) puis relance le 24/06. Sans réponse.'
FROM prospect p WHERE p.name = 'CR&SG'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/asmaa-a-zahrane-17388064')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Hamid', 'Boulahya', 'Directeur Commercial', NULL, NULL, 'https://www.linkedin.com/in/hamid-boulahya-b5721a53', 'Prise de contact le 19/06 puis relance le 24/06. Sans réponse.'
FROM prospect p WHERE p.name = 'solutions électriques & Power Quality'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hamid-boulahya-b5721a53')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Achraf', 'Rifaiy', 'Superviseur commercial', NULL, NULL, 'https://www.linkedin.com/in/achraf-rifaiy-86b7a0246', 'Prise de contact le 19/06 puis relance le 24/06 sur l’organisation des équipes terrain. Sans réponse.'
FROM prospect p WHERE p.name = '[?] Achraf Rifaiy'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/achraf-rifaiy-86b7a0246')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Zineb', 'Bamaarouf', 'Responsable marketing', NULL, NULL, 'https://www.linkedin.com/in/zineb-bamaarouf-5a4293221', 'Échange nourri en juin : intégrateur Sage/Microsoft/Odoo, a demandé le détail de la solution. Proposition de démo 15-20 min, relance du 24/06 sans réponse.'
FROM prospect p WHERE p.name = 'Nodma Horizon (intégrateur Sage/Microsoft/Odoo)'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zineb-bamaarouf-5a4293221')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'MOKHTAR', 'AKOURBAL', 'REGIONAL SALES MANAGER', NULL, NULL, 'https://www.linkedin.com/in/mokhtar-akourbal', 'Prise de contact après ajout, demande de 15 minutes d’échange sur l’organisation terrain.'
FROM prospect p WHERE p.name = 'Oland Group'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mokhtar-akourbal')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Hamza', 'REGGUI', 'Responsable commercial national', NULL, NULL, 'https://www.linkedin.com/in/hamza-reggui-75329b182', 'A répondu « Oui » à une demande d’échange le 24/06. Proposition d’un créneau WhatsApp le lendemain à 10h restée sans confirmation.'
FROM prospect p WHERE p.name = 'SOMADIR'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hamza-reggui-75329b182')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Maryem', 'GUEDIRA', 'Executive Leader', NULL, NULL, 'https://www.linkedin.com/in/maryem-guedira-990573a5', 'Approche ciblée GDIRAGRI (points de vente, accompagnement des agriculteurs au Maroc).'
FROM prospect p WHERE p.name = 'GDIRAGRI'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/maryem-guedira-990573a5')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'El Mehdi', 'CHAIR', 'Directeur commercial', NULL, NULL, 'https://www.linkedin.com/in/el-mehdi-chair-63058b62', 'Premier message en mars sur le suivi des tournées, relance minimale le 23/06. Sans réponse.'
FROM prospect p WHERE p.name = '[?] El Mehdi CHAIR'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-mehdi-chair-63058b62')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Kamal', 'BENOUISSAADEN', 'Directeur Commercial holding', NULL, NULL, 'https://www.linkedin.com/in/kamal-benouissaaden-7b5644135', 'Contact le plus avancé de juin : échange soutenu, numéro transmis, appel convenu le 23/06 (créneau 9h45 ou 11h proposé). Suite à confirmer.'
FROM prospect p WHERE p.name = 'SWISS Distribution'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/kamal-benouissaaden-7b5644135')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Mohamed', 'Bennouna', 'Directeur-fondateur', NULL, NULL, 'https://www.linkedin.com/in/mohamed-bennouna-020b0629', 'A répondu le jour même en transmettant son numéro de mobile. À rappeler.'
FROM prospect p WHERE p.name = 'F2V Maroc'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohamed-bennouna-020b0629')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Salma', 'KARIM', 'Directeur des opérations', NULL, NULL, 'https://www.linkedin.com/in/salma-karim-2a00241a', 'Approche partenariat autour des projets de digitalisation commerciale / force de vente.'
FROM prospect p WHERE p.name = 'NUMADVISOR'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/salma-karim-2a00241a')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'AIT', 'EL KAID SALAH EDDINE', 'Responsable Systèmes d’informations', NULL, NULL, 'https://www.linkedin.com/in/ait-el-kaid-salah-eddine-6378b6ba', 'Prise de contact après ajout (angle Sage).'
FROM prospect p WHERE p.name = '[?] AIT EL KAID SALAH EDDINE'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ait-el-kaid-salah-eddine-6378b6ba')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'YOUSSEF', 'BOUCHGHAL', 'Master Système d’information Marketing et Commerce', NULL, NULL, 'https://www.linkedin.com/in/youssef-bouchghal-540922199', 'A accepté l’échange le 15/06 mais était en congé ; report convenu après son retour. Relance le 22/06 sans réponse.'
FROM prospect p WHERE p.name = '[?] YOUSSEF BOUCHGHAL'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/youssef-bouchghal-540922199')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Said', 'EL FDAR', 'Régional Sales Manager (FMCG)', NULL, NULL, 'https://www.linkedin.com/in/said-el-fdar-40a93533', 'Prise de contact après ajout, demande de 15 minutes d’échange.'
FROM prospect p WHERE p.name = '[?] Said EL FDAR'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/said-el-fdar-40a93533')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Med.', 'Adil El Hassani', 'Directeur Commercial Food', NULL, NULL, 'https://www.linkedin.com/in/med-adil-el-hassani-10277363', 'Trois messages entre mars et juin, aucune réponse. Dernière relance annoncée comme la dernière.'
FROM prospect p WHERE p.name = '[?] Med. Adil El Hassani'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/med-adil-el-hassani-10277363')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Rhalouty', 'Mohammed', 'Responsable du développement de projets', NULL, NULL, 'https://www.linkedin.com/in/rhalouty-mohammed-00634170', 'Relation entretenue depuis avril. A accepté un échange le 22/06 et transmis son numéro. À rappeler.'
FROM prospect p WHERE p.name = '[?] Rhalouty Mohammed'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/rhalouty-mohammed-00634170')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Omar', 'Guerouani', 'Commercial Director', NULL, NULL, 'https://www.linkedin.com/in/omar-guerouani-16951b55', 'Premier message envoyé avec une erreur de prénom, corrigée le 15/06. Sans réponse.'
FROM prospect p WHERE p.name = '[?] Omar Guerouani'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/omar-guerouani-16951b55')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'hicham', 'mansouri', 'Directeur commercial', NULL, NULL, 'https://www.linkedin.com/in/hicham-mansouri-aa929a29', 'Prise de contact après ajout.'
FROM prospect p WHERE p.name = '[?] hicham mansouri'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-mansouri-aa929a29')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Zakaria', 'El Missaoui', 'Regional Sales Manager', NULL, NULL, 'https://www.linkedin.com/in/zakaria-el-missaoui-441856211', 'Échange chaleureux : a transmis deux numéros et recommandé un contact (Mondil Abdellah) à qui présenter la solution.'
FROM prospect p WHERE p.name = '[?] Zakaria El Missaoui'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zakaria-el-missaoui-441856211')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'EL', 'M’KADMI HAMZA', 'Merchandiser en Grande Distribution', NULL, NULL, 'https://www.linkedin.com/in/el-m%E2%80%99kadmi-hamza-86071b277', 'Disponible pour partager son expérience terrain, a transmis son numéro le 11/06. À rappeler.'
FROM prospect p WHERE p.name = '[?] EL M’KADMI HAMZA'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-m%E2%80%99kadmi-hamza-86071b277')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Wadii', 'Elkamali', 'Directeur commercial', NULL, NULL, 'https://www.linkedin.com/in/wadii-elkamali-436a103a6', 'Premier message en avril, relance le 12/06. Sans réponse.'
FROM prospect p WHERE p.name = 'Les Laboratoires Vilion'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/wadii-elkamali-436a103a6')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Mohamed', 'KARIMI', 'Directeur Commercial', NULL, NULL, 'https://www.linkedin.com/in/mohamed-karimi-747243a6', 'A indiqué le 09/06 ne pas traiter ce volet. Demande de mise en relation avec la bonne personne restée sans réponse.'
FROM prospect p WHERE p.name = '[?] Mohamed KARIMI'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohamed-karimi-747243a6')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Saad', 'BAGHO', 'Consultant Salesforce Commerce Cloud', NULL, NULL, NULL, 'Contact amical de longue date. Sollicité en juin pour un avis sur la solution ; a répondu ne plus maîtriser le sujet, un call reste à caler.'
FROM prospect p WHERE p.name = '[?] Saad BAGHO'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Saad' AND c.last_name = 'BAGHO')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'abdellatif', 'kouhaiz', 'Responsable développement commercial / Business Developer', NULL, NULL, 'https://www.linkedin.com/in/abdellatif-kouhaiz-04155110a', 'A répondu avec plaisir et transmis son numéro le jour même (05/06). À rappeler.'
FROM prospect p WHERE p.name = '[?] abdellatif kouhaiz'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/abdellatif-kouhaiz-04155110a')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Sara', 'FILALI', 'Commercial & Marketing Engagement Specialist', NULL, NULL, 'https://www.linkedin.com/in/sara-filali-29623376', 'Prise de contact après ajout (angle Sage).'
FROM prospect p WHERE p.name = '[?] Sara FILALI'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/sara-filali-29623376')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'FAHD', 'IDRISSI FALLAKI', 'Chef de projet senior', NULL, NULL, 'https://www.linkedin.com/in/fahd-idrissi-fallaki-49b17a41', 'Prise de contact après ajout (angle Sage).'
FROM prospect p WHERE p.name = 'DELTA CLOUD'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/fahd-idrissi-fallaki-49b17a41')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'RACHID', 'AARABI', 'Directeur regional commercial', NULL, NULL, 'https://www.linkedin.com/in/rachid-aarabi-3b734210b', 'Trois messages entre mars et juin, aucune réponse.'
FROM prospect p WHERE p.name = '[?] RACHID AARABI'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/rachid-aarabi-3b734210b')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Elmerini', 'Imane', 'Directeur Associé', NULL, NULL, 'https://www.linkedin.com/in/elmerini-imane-39b143aa', 'Contact le plus abouti : introduite par Marouane, échanges de mars à avril, visio fixée au vendredi 08/05 à 9h (Maroc) / 10h (France), adresse mail transmise pour l’invitation.'
FROM prospect p WHERE p.name = 'LISA & CO'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/elmerini-imane-39b143aa')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Najib', 'BELKHAYAT', 'Contact réseau (proche de la famille)', NULL, NULL, NULL, 'Relation de confiance. Après report pour cause de maladie et de Ramadan, appel convenu le 27/03 entre 18h et 19h (heure marocaine) avec envoi d’un lien Google Meet pour présenter la solution.'
FROM prospect p WHERE p.name = '[?] Najib BELKHAYAT'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Najib' AND c.last_name = 'BELKHAYAT')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'MOHAMMED', 'BENNANI', 'Directeur Commercial & Export', NULL, NULL, 'https://www.linkedin.com/in/mohammed-bennani-6876b3159', 'Prise de contact après ajout sur l’organisation des tournées.'
FROM prospect p WHERE p.name = 'FMCG / Distribution multicanale'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohammed-bennani-6876b3159')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Mohammed', 'DRIF', 'Directeur Commercial', NULL, NULL, 'https://www.linkedin.com/in/mohammed-drif-40a53059', 'A répondu avec plaisir et transmis son numéro le 04/03. Aucun suivi depuis.'
FROM prospect p WHERE p.name = '[?] Mohammed DRIF'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohammed-drif-40a53059')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Anton', 'Hajdinaj', 'Freelance Technical coach', NULL, NULL, 'https://www.linkedin.com/in/antonhajdinaj', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Anton Hajdinaj'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/antonhajdinaj')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Youness', 'ZBAIR', 'Senior Full Stack Developer', NULL, NULL, 'https://www.linkedin.com/in/youness-zbair', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'PHP, Laravel, Vue.js, React.js'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/youness-zbair')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'David', 'Jorigas', 'Senior Helpdesk / SaaS / ERP / CRM', NULL, NULL, 'https://www.linkedin.com/in/david-jorigas-95514910b', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Brussels'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/david-jorigas-95514910b')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Claude', 'Olukoya', 'Analyste des données', NULL, NULL, 'https://www.linkedin.com/in/claude-olukoya', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Python · SQL · Power BI · BI'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/claude-olukoya')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Manon', 'Kerrels', 'Java / Angular developer', NULL, NULL, 'https://www.linkedin.com/in/manon-kerrels-ba6245229', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Manon Kerrels'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/manon-kerrels-ba6245229')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Manal', 'Chahoubi', 'CFO', NULL, NULL, 'https://www.linkedin.com/in/manal-chahoubi-6177a6157', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'GRS4CLOUD & M2ASOFT'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/manal-chahoubi-6177a6157')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Ibrahim', 'SELBOUK', 'Directeur Commercial', NULL, NULL, 'https://www.linkedin.com/in/ibrahim-selbouk-8752a24b', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Ibrahim SELBOUK'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ibrahim-selbouk-8752a24b')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Moussa', 'BEN BALLA', 'Responsable d''Agence IDF / Business Manager', NULL, NULL, 'https://www.linkedin.com/in/moussa-ben-balla-544551106', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Insitoo'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/moussa-ben-balla-544551106')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Fouad', 'RAKIB', 'Directeur Commercial Adjoint', NULL, NULL, 'https://www.linkedin.com/in/fouad-rakib-10945a30', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Fouad RAKIB'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/fouad-rakib-10945a30')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Ikram', 'AGURIACH', 'IT Talent Acquisition Specialist & Account Manager', NULL, NULL, 'https://www.linkedin.com/in/ikram-aguriach-103334252', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Ikram AGURIACH'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ikram-aguriach-103334252')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Jonathan', 'Rockx', 'Gestion administrative et financière pour entrepreneurs', NULL, NULL, 'https://www.linkedin.com/in/jonathan-rockx', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Jonathan Rockx'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/jonathan-rockx')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Zineb', 'Baza', 'CEO FORSOFT', NULL, NULL, 'https://www.linkedin.com/in/zineb-baza-1521b343', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Partenaire Sage agréé'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zineb-baza-1521b343')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Ilies', 'MENIF', 'Directeur Commercial & Business Development', NULL, NULL, 'https://www.linkedin.com/in/ilies-menif-667ab829', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Réseau national 1200 revendeurs (Maroc)'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ilies-menif-667ab829')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Achraf', 'Akansous', 'IT Manager Oland Group', NULL, NULL, 'https://www.linkedin.com/in/achraf-akansous-9721b249', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = '[?] Achraf Akansous'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/achraf-akansous-9721b249')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Fatima-Zahra', 'Merimi', 'SWE', NULL, NULL, 'https://www.linkedin.com/in/fatima-zahra-merimi-0605a67b', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Sopra Steria | CS Graduate - University of Paris-Saclay'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/fatima-zahra-merimi-0605a67b')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Geoffrey', 'Robert', 'Conseiller budgétaire', NULL, NULL, 'https://www.linkedin.com/in/geoffrey-robert-91b80a21b', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'Office de la Naissance et de l''Enfance (ONE)'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/geoffrey-robert-91b80a21b')
ORDER BY p.id LIMIT 1;

INSERT INTO contact (prospect_id, first_name, last_name, job_title, email, phone, linkedin_url, notes)
SELECT p.id, 'Rida', 'OURICH, MBA', 'CIO', NULL, NULL, 'https://www.linkedin.com/in/ridaourich', 'Relation acceptée en 2026, aucun échange en messagerie.'
FROM prospect p WHERE p.name = 'PEPSI - VBM'
  AND NOT EXISTS (SELECT 1 FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ridaourich')
ORDER BY p.id LIMIT 1;

-- ================= INTERACTIONS (1 par conversation) =================
-- C002 Hicham MAKHELLA (4 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-makhella-16999159' LIMIT 1), TIMESTAMPTZ '2026-09-08 12:00:00+01', 'LinkedIn', 'Résumé : A répondu favorablement le 25/06 : DistriMob intéressant pour ses clients Sage avec équipes terrain. Demande de créneau restée sans suite, relance le 08/09.

--- Fil LinkedIn (4 message(s)) ---
[2026-06-24 14:19] Moi : Bonjour Hicham, Je travaille actuellement sur DistriMob, une solution mobile destinée aux équipes commerciales terrain : visites clients, commandes, encaissements, suivi des soldes et reporting manager, avec synchronisation possible vers Sage. J’ai vu qu’IMRASOFT accompagne les entreprises marocaines sur les solutions Sage. Je serais ravi d’échanger rapidement avec vous pour voir s’il peut y avoir des complémentarités autour des besoins terrain de vos clients Sage.
[2026-06-25 15:41] Hicham : Bonjour, Merci pour votre message. Votre solution semble très intéressante, notamment pour les clients Sage ayant des équipes commerciales terrain. Je serais ravi d''échanger avec vous pour découvrir davantage DistriMob et voir les synergies possibles avec IMRASOFT. Au plaisir d''en discuter. Bien cordialement,
[2026-06-25 16:12] Moi : Bonjour Hicham, Merci pour votre retour. Avez-vous une disponibilité dans les prochains jours pour une présentation rapide de DistriMob ?
[2026-09-08 19:07] Moi : Bonjour Hicham, J’espère que vous allez bien. Je reviens vers vous concernant DistriMob. Êtes-vous toujours disponible pour une courte présentation ? Bonne journée.'
FROM prospect p WHERE p.name = 'IMRASOFT (partenaire Sage)'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-09-08 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-makhella-16999159' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C001 Said TOUATE (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/saidtouate' LIMIT 1), TIMESTAMPTZ '2026-09-08 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact DistriMob (synergies NumAdvisor) le 08/07, relance le 08/09. Aucune réponse à ce jour.

--- Fil LinkedIn (2 message(s)) ---
[2026-07-08 19:52] Moi : Bonjour Said, Je travaille sur DistriMob, une solution mobile pour les commerciaux terrain : tournées, visites clients, prise de commande et suivi d’activité. Vu l’activité de NumAdvisor, je pense qu’il peut y avoir des synergies intéressantes. Seriez-vous disponible pour un échange rapide ? Bien cordialement, Abdelmouneim
[2026-09-08 19:28] Moi : Bonjour, je me permets de revenir vers vous concernant DistriMob. J’aimerais beaucoup échanger avec vous sur les besoins que vous rencontrez chez vos clients ayant des équipes commerciales terrain, afin de voir si DistriMob pourrait y répondre.'
FROM prospect p WHERE p.name = 'NUMADVISOR'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-09-08 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/saidtouate' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C003 zainab Chaaboun (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zainab-chaaboun-4b6a36199' LIMIT 1), TIMESTAMPTZ '2026-09-01 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout : question sur son lien avec les équipes commerciales terrain chez ABM Distribution.

--- Fil LinkedIn (1 message(s)) ---
[2026-09-01 20:29] Moi : Bonjour Zainab, merci pour l’ajout. J’ai vu que vous travaillez chez ABM Distribution. Je me demandais si vous êtes aussi en contact avec les équipes commerciales et les vendeurs terrain ?'
FROM prospect p WHERE p.name = 'ABM Distribution'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-09-01 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zainab-chaaboun-4b6a36199' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C004 Bilal Farrukh (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Bilal' AND c.last_name = 'Farrukh' LIMIT 1), TIMESTAMPTZ '2026-08-26 12:00:00+01', 'LinkedIn', 'Résumé : InMail NewtonX : sondage rémunéré de 20 min (45 USD) sur l’adoption des outils IA par les développeurs. Sans réponse.

--- Fil LinkedIn (1 message(s)) ---
[2026-08-26 17:53] Bilal : Hi Abdelmouneim, I read through your LinkedIn profile and wanted to reach out to you about a consulting opportunity : a 20 minute anonymous online survey about how developers and technical teams evaluate, adopt and use AI tools, paid 45 USD. NewtonX Expert Community.'
FROM prospect p WHERE p.name = 'NewtonX'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-08-26 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Bilal' AND c.last_name = 'Farrukh' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C005 Lars Higham (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/lars-higham-7801b71' LIMIT 1), TIMESTAMPTZ '2026-08-09 12:00:00+01', 'LinkedIn', 'Résumé : Demande de mise en relation générique, sans suite.

--- Fil LinkedIn (1 message(s)) ---
[2026-08-09 16:27] Lars : Bonjour Abdelmouneim, let''s connect and keep in touch, we might have the opportunity to work together in the future! Best, Lars'
FROM prospect p WHERE p.name = '[?] Lars Higham'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-08-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/lars-higham-7801b71' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C009 Zakaria Zatni (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zakaria-zatni-b29681186' LIMIT 1), TIMESTAMPTZ '2026-07-08 12:00:00+01', 'LinkedIn', 'Résumé : Sollicitation pour un échange de 20 minutes sur son expérience vente / distribution.

--- Fil LinkedIn (1 message(s)) ---
[2026-07-08 19:50] Moi : Bonjour Zakaria, Je travaille sur DistriMob, une solution mobile pour les commerciaux terrain : tournées, visites clients, prise de commande et suivi d’activité. Vu votre expérience dans la vente et la distribution, j’aimerais beaucoup avoir votre avis métier. Seriez-vous disponible pour un échange rapide de 20 minutes ?'
FROM prospect p WHERE p.name = '[?] Zakaria Zatni'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-07-08 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zakaria-zatni-b29681186' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C008 Oussama BOUCHAAB (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/oussama-bouchaab-10b3b9166' LIMIT 1), TIMESTAMPTZ '2026-07-08 12:00:00+01', 'LinkedIn', 'Résumé : Sollicitation pour un avis terrain (distribution alimentaire).

--- Fil LinkedIn (1 message(s)) ---
[2026-07-08 19:55] Moi : Bonjour Oussama, Je travaille sur DistriMob, une solution mobile pour les équipes commerciales terrain : tournées, visites clients, prise de commande et suivi d’activité. Vu votre activité dans la distribution alimentaire, j’aimerais beaucoup avoir votre avis terrain. Seriez-vous disponible pour un échange rapide ?'
FROM prospect p WHERE p.name = '[?] Oussama BOUCHAAB'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-07-08 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/oussama-bouchaab-10b3b9166' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C007 AHMED NAMOUSS (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ahmed-namouss-49292069' LIMIT 1), TIMESTAMPTZ '2026-07-08 12:00:00+01', 'LinkedIn', 'Résumé : Sollicitation pour un avis métier et technique sur DistriMob (expertise HHT / mobilité).

--- Fil LinkedIn (1 message(s)) ---
[2026-07-08 19:56] Moi : Bonjour Ahmed, Je travaille sur DistriMob, une solution mobile pour les équipes commerciales terrain : tournées, visites clients, prise de commande et suivi d’activité. Vu votre expertise sur les systèmes de mobilité HHT / Android, j’aimerais beaucoup avoir votre avis métier et technique sur la solution. Seriez-vous disponible pour un échange rapide ?'
FROM prospect p WHERE p.name = 'HHT Android / Windows Mobile'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-07-08 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ahmed-namouss-49292069' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C015 Hicham DAKIR (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-dakir' LIMIT 1), TIMESTAMPTZ '2026-06-25 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout : sollicitation de son retour d’expérience terrain en distribution.

--- Fil LinkedIn (1 message(s)) ---
[2026-06-25 10:25] Moi : Bonjour Hicham, Merci pour l''ajout. J’ai vu votre profil et votre expérience dans la direction commerciale, notamment sur des sujets très terrain dans la distribution. Je travaille actuellement sur DistriMob, une solution mobile pour aider les équipes commerciales à mieux suivre les visites clients, commandes, encaissements et reporting manager. Votre retour d’expérience sur ces sujets m’intéresserait beaucoup.'
FROM prospect p WHERE p.name = 'Sotherma'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-25 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-dakir' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C013 Ali Ahda (7 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ali-ahda-5a7463ab' LIMIT 1), TIMESTAMPTZ '2026-06-25 12:00:00+01', 'LinkedIn', 'Résumé : A accepté un échange le 25/06 à 11h, mais n’a pas transmis son numéro WhatsApp. Trois relances restées sans réponse.

--- Fil LinkedIn (7 message(s)) ---
[2026-06-19 20:30] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Je serais intéressé d’en savoir plus sur vos activités. Auriez-vous 15 minutes pour échanger la semaine prochaine ?
[2026-06-24 15:08] Moi : Bonjour Ali, J’espère que vous allez bien. Je me permets de revenir vers vous. Seriez-vous disponible quelques minutes cette semaine pour un court échange ?
[2026-06-24 16:13] Ali : Bonjour Demain vers 11 h
[2026-06-24 16:31] Moi : Ok pour moi merci
[2026-06-24 19:22] Moi : Par whatsapp ? Donnez-moi votre numéro svp
[2026-06-25] Moi : Vous pouvez me donner votre numéro whatsapp?
[2026-06-25 12:05] Moi : Bonjour'
FROM prospect p WHERE p.name = '[?] Ali Ahda'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-25 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ali-ahda-5a7463ab' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C027 Abdeslam Essahraoui (5 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/abdeslam-essahraoui-73684b122' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : A proposé de fixer un créneau le 07/06. Coordonnées (mail + téléphone) transmises le 08/06, puis relance le 24/06 sans réponse.

--- Fil LinkedIn (5 message(s)) ---
[2026-06-05 12:44] Moi : Bonjour Ssi Abdeslam, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-07] Abdeslam : Bonjour la semaine prochaine, on fixe un créneau
[2026-06-07 15:21] Abdeslam : Bonjour Abdelmouneim,
[2026-06-08 12:06] Moi : Bonjour Ssi Abdeslam, Parfait, merci. Voici mes coordonnées. N''hésitez pas à me proposer un créneau qui vous convient cette semaine. Au plaisir d''échanger.
[2026-06-24 14:25] Moi : Bonjour Abdeslam, Seriez-vous disponible cette semaine pour un court échange ? Bonne journée.'
FROM prospect p WHERE p.name = '[?] Abdeslam Essahraoui'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/abdeslam-essahraoui-73684b122' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C026 Khalid JOUMAA (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/khalid-joumaa-5a5121295' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 09/06 (angle clients Sage) puis relance le 24/06. Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-09 10:57] Moi : Bonjour Ssi Khalid, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-24 14:28] Moi : Bonjour Khalid, Je serais ravi d’échanger quelques minutes autour des besoins mobiles terrain chez les clients Sage. Bonne journée.'
FROM prospect p WHERE p.name = '[?] Khalid JOUMAA'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/khalid-joumaa-5a5121295' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C025 EL HILALI ALAOUI NAWFAL (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-hilali-alaoui-nawfal-07b40a27' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 13/06 puis relance le 24/06 (réseaux de distribution). Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-13 13:07] Moi : Bonjour Ssi El Hilali, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-24 14:42] Moi : Bonjour El Hilali, Votre retour d’expérience sur les équipes terrain et les réseaux de distribution m’intéresserait beaucoup. Seriez-vous disponible pour un court échange cette semaine ?'
FROM prospect p WHERE p.name = '[?] EL HILALI ALAOUI NAWFAL'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-hilali-alaoui-nawfal-07b40a27' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C024 Mohammed Atif SRHEIYER (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/srheiyer-mohammed-atif-53905482' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 13/06 puis relance le 24/06 (distribution CHR & retail). Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-13 13:08] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger ?
[2026-06-24 14:48] Moi : Bonjour Mohammed, Votre expérience dans la distribution CHR & retail m’intéresserait beaucoup pour échanger sur les besoins des équipes terrain. Seriez-vous disponible pour un court échange cette semaine ?'
FROM prospect p WHERE p.name = 'FUNFRIES - Distribution CHR & Retail'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/srheiyer-mohammed-atif-53905482' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C023 Yassine Bentassil (6 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/yassine-bentassil-61bb8751' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : A accepté le principe d’un échange le 13/06 (WhatsApp ou visio) mais n’a jamais proposé de créneau. Deux relances (15/06 et 24/06).

--- Fil LinkedIn (6 message(s)) ---
[2026-06-13 13:06] Moi : Bonjour Ssi Yassine, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-13 13:52] Yassine : Bonjour, Ok bien sûr
[2026-06-13 15:02] Moi : On pourrait organiser un échange par whatsapp ou par visio comme vous préférez. Je vous laisse choisir le créneau, bonne journée
[2026-06-13 15:08] Yassine : 👍
[2026-06-15 14:59] Moi : Parfait, merci. Je vous laisse me proposer un créneau qui vous arrange cette semaine. L’échange peut se faire par WhatsApp ou visio, comme vous préférez.
[2026-06-24 14:52] Moi : Bonjour Yassine, Je me permets de revenir vers vous pour notre échange. Bonne journée.'
FROM prospect p WHERE p.name = 'FMCG & Distribution | Executive MBA'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/yassine-bentassil-61bb8751' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C022 Adil RAISS (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/adil-raiss-7314ba8' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 15/06 puis relance le 24/06 (expertise force de vente FMCG). Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-15 23:05] Moi : Bonjour Ssi Adil, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-24 14:55] Moi : Bonjour Si Adil, Votre expérience sur la force de vente et la distribution FMCG m’intéresserait beaucoup. Seriez-vous disponible pour un court échange cette semaine ?'
FROM prospect p WHERE p.name = 'Sales Uplift'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/adil-raiss-7314ba8' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C021 asmaa A.Zahrane (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/asmaa-a-zahrane-17388064' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 19/06 (angle Sage) puis relance le 24/06. Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-19 13:12] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger la semaine prochaine ?
[2026-06-24 14:59] Moi : Bonjour Asmaa, Je me permets de revenir vers vous concernant DistriMob, une solution mobile pour les équipes terrain avec synchronisation possible vers Sage. Je serais ravi d’échanger rapidement pour voir s’il peut y avoir des complémentarités autour des besoins mobiles de vos clients Sage.'
FROM prospect p WHERE p.name = 'CR&SG'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/asmaa-a-zahrane-17388064' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C020 Hamid Boulahya (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hamid-boulahya-b5721a53' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 19/06 puis relance le 24/06. Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-19 13:16] Moi : Bonjour Ssi Hamid, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger la semaine prochaine ?
[2026-06-24 15:02] Moi : Bonjour Si Hamid, J’aimerais échanger rapidement avec vous sur l’organisation commerciale terrain, notamment le suivi des clients, revendeurs, commandes et reporting. Seriez-vous disponible quelques minutes cette semaine ?'
FROM prospect p WHERE p.name = 'solutions électriques & Power Quality'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hamid-boulahya-b5721a53' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C019 Achraf Rifaiy (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/achraf-rifaiy-86b7a0246' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact le 19/06 puis relance le 24/06 sur l’organisation des équipes terrain. Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-19 20:29] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger la semaine prochaine ?
[2026-06-24 15:05] Moi : Bonjour Si Achraf, J’aimerais échanger rapidement avec vous sur l’organisation de vos équipes terrain : clients, commandes, encaissements et reporting commercial. Seriez-vous disponible quelques minutes cette semaine ?'
FROM prospect p WHERE p.name = '[?] Achraf Rifaiy'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/achraf-rifaiy-86b7a0246' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C018 Zineb Bamaarouf (8 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zineb-bamaarouf-5a4293221' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Échange nourri en juin : intégrateur Sage/Microsoft/Odoo, a demandé le détail de la solution. Proposition de démo 15-20 min, relance du 24/06 sans réponse.

--- Fil LinkedIn (8 message(s)) ---
[2026-06-03 10:58] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-05 12:13] Zineb : Bonjour,
[2026-06-05 12:38] Moi : Bonjour
[2026-06-19 20:43] Zineb : Je suis Zineb responsable marketing chez la société nodma horizon, nous sommes spécialisés dans l’intégration de logiciels sage Microsoft et odoo aussi développement spécifique…
[2026-06-19 21:08] Moi : Merci pour votre retour Zineb. C’est intéressant, de mon côté je travaille surtout sur la partie mobile terrain pour les équipes commerciales : visites, commandes, encaissements, suivi client, avec synchronisation possible vers Sage. Je serais ravi d’échanger rapidement avec vous pour voir s’il peut y avoir des complémentarités.
[2026-06-19 21:12] Zineb : Avec grand plaisir, peux-tu m’expliquer en détail la solution
[2026-06-19 21:18] Moi : Avec plaisir. Le plus simple serait de vous présenter la solution en 15-20 minutes. DistriMob est une application mobile destinée aux équipes terrain : visites clients, prise de commandes, encaissements, suivi des soldes clients et reporting manager, avec possibilité de synchronisation vers Sage. Vous seriez disponible quand pour un rapide échange ?
[2026-06-24 15:10] Moi : Bonjour Zineb, Seriez-vous disponible cette semaine pour une courte visio de 15 minutes afin de vous présenter DistriMob ? Je pense qu’il peut y avoir des complémentarités avec vos projets Sage / Odoo autour de la partie mobile terrain.'
FROM prospect p WHERE p.name = 'Nodma Horizon (intégrateur Sage/Microsoft/Odoo)'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zineb-bamaarouf-5a4293221' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C017 MOKHTAR AKOURBAL (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mokhtar-akourbal' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout, demande de 15 minutes d’échange sur l’organisation terrain.

--- Fil LinkedIn (1 message(s)) ---
[2026-06-24 15:13] Moi : Bonjour Mokhtar, Merci pour l’ajout. Je travaille sur DistriMob, une solution mobile destinée aux équipes commerciales terrain dans la distribution : visites clients, commandes, encaissements, suivi des soldes et reporting manager. J’ai vu votre rôle chez Oland Group sur la partie régionale commerciale. Auriez-vous 15 minutes cette semaine ?'
FROM prospect p WHERE p.name = 'Oland Group'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mokhtar-akourbal' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C016 Hamza REGGUI (3 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hamza-reggui-75329b182' LIMIT 1), TIMESTAMPTZ '2026-06-24 12:00:00+01', 'LinkedIn', 'Résumé : A répondu « Oui » à une demande d’échange le 24/06. Proposition d’un créneau WhatsApp le lendemain à 10h restée sans confirmation.

--- Fil LinkedIn (3 message(s)) ---
[2026-06-24 14:17] Moi : Bonjour Hamza, Je travaille actuellement sur DistriMob, une solution mobile destinée aux équipes commerciales terrain dans la distribution : visites clients, commandes, encaissements, suivi des soldes et reporting manager. J’ai vu que SOMADIR est un acteur important dans l’agroalimentaire avec une forte activité commerciale terrain. Auriez-vous 15 minutes cette semaine ?
[2026-06-24 16:00] Hamza : Oui
[2026-06-24 16:31] Moi : Demain vers 10h sur whatsapp?'
FROM prospect p WHERE p.name = 'SOMADIR'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-24 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hamza-reggui-75329b182' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C033 Maryem GUEDIRA (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/maryem-guedira-990573a5' LIMIT 1), TIMESTAMPTZ '2026-06-23 12:00:00+01', 'LinkedIn', 'Résumé : Approche ciblée GDIRAGRI (points de vente, accompagnement des agriculteurs au Maroc).

--- Fil LinkedIn (1 message(s)) ---
[2026-06-23 09:47] Moi : Bonjour Maryem, Je travaille actuellement sur une solution mobile destinée aux équipes commerciales terrain dans la distribution : visites clients, commandes, encaissements, suivi des soldes et reporting manager. J’ai vu que GDIRAGRI dispose de plusieurs points de vente et accompagne les agriculteurs au Maroc. Auriez-vous 15 minutes cette semaine ?'
FROM prospect p WHERE p.name = 'GDIRAGRI'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-23 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/maryem-guedira-990573a5' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C032 El Mehdi CHAIR (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-mehdi-chair-63058b62' LIMIT 1), TIMESTAMPTZ '2026-06-23 12:00:00+01', 'LinkedIn', 'Résumé : Premier message en mars sur le suivi des tournées, relance minimale le 23/06. Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-03-07 22:36] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je serais curieux de comprendre comment vous gérez aujourd’hui le suivi des tournées et des équipes commerciales terrain. Seriez-vous ouvert à un échange rapide ?
[2026-06-23 09:48] Moi : Bonjour'
FROM prospect p WHERE p.name = '[?] El Mehdi CHAIR'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-23 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-mehdi-chair-63058b62' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C031 Kamal BENOUISSAADEN (12 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/kamal-benouissaaden-7b5644135' LIMIT 1), TIMESTAMPTZ '2026-06-23 12:00:00+01', 'LinkedIn', 'Résumé : Contact le plus avancé de juin : échange soutenu, numéro transmis, appel convenu le 23/06 (créneau 9h45 ou 11h proposé). Suite à confirmer.

--- Fil LinkedIn (12 message(s)) ---
[2026-06-21] Kamal : Biensur. Avec plaisir.
[2026-06-21 15:25] Moi : Bonjour Kamal, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-21 18:37] Kamal : Bonjour Abdelmouneim,
[2026-06-21 18:40] Moi : Merci Kamal, avec plaisir. Je suis disponible cette semaine pour un échange rapide par WhatsApp ou visio, comme vous préférez. Je vous laisse me proposer un créneau qui vous arrange.
[2026-06-21 18:42] Kamal : Rappelez moi mardi matin inchae allah.
[2026-06-21 18:47] Moi : ok c''est noté, à mardi inchallah
[2026-06-21 18:55] Kamal : 👍
[2026-06-23] Kamal : [numéro de téléphone transmis]
[2026-06-23] Kamal : On fait a 10h
[2026-06-23 09:52] Moi : Bonjour Kamal, Comme convenu pour ce matin, je voulais voir avec vous quel créneau vous arrange. Pouvez-vous m’envoyer votre numéro WhatsApp pour que je vous appelle ?
[2026-06-23 09:56] Kamal : Bonjour.
[2026-06-23 10:15] Moi : Merci Kamal. J’ai un engagement à 10h, mais je peux vous appeler à 9h45 si cela vous arrange. Sinon je peux aussi vous appeler à 11h.'
FROM prospect p WHERE p.name = 'SWISS Distribution'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-23 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/kamal-benouissaaden-7b5644135' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C030 Mohamed Bennouna (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohamed-bennouna-020b0629' LIMIT 1), TIMESTAMPTZ '2026-06-23 12:00:00+01', 'LinkedIn', 'Résumé : A répondu le jour même en transmettant son numéro de mobile. À rappeler.

--- Fil LinkedIn (2 message(s)) ---
[2026-06-23 11:54] Moi : Bonjour Mohamed, Je travaille actuellement sur DistriMob, une solution mobile destinée aux équipes commerciales terrain : visites clients, commandes, encaissements, suivi des soldes et reporting manager. J’ai vu que F2V Maroc accompagne les entreprises sur les sujets force de vente, recrutement, formation et audit commercial. Je serais ravi d’échanger rapidement pour mieux comprendre les besoins terrain que vous observez chez vos clients.
[2026-06-23 12:27] Mohamed : Mrahba. Voici mon mobile.'
FROM prospect p WHERE p.name = 'F2V Maroc'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-23 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohamed-bennouna-020b0629' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C029 Salma KARIM (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/salma-karim-2a00241a' LIMIT 1), TIMESTAMPTZ '2026-06-23 12:00:00+01', 'LinkedIn', 'Résumé : Approche partenariat autour des projets de digitalisation commerciale / force de vente.

--- Fil LinkedIn (1 message(s)) ---
[2026-06-23 16:31] Moi : Bonjour Salma, Je travaille actuellement sur DistriMob, une solution mobile destinée aux équipes commerciales terrain : visites clients, commandes, encaissements, suivi des soldes et reporting manager. J’ai vu que NumAdvisor accompagne les entreprises dans leur transition numérique. Je serais ravi d’échanger rapidement pour voir s’il peut y avoir des complémentarités, notamment autour des projets de digitalisation commerciale et force de vente.'
FROM prospect p WHERE p.name = 'NUMADVISOR'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-23 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/salma-karim-2a00241a' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C039 AIT EL KAID SALAH EDDINE (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ait-el-kaid-salah-eddine-6378b6ba' LIMIT 1), TIMESTAMPTZ '2026-06-22 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout (angle Sage).

--- Fil LinkedIn (1 message(s)) ---
[2026-06-22 11:51] Moi : Bonjour Salah Eddine, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?'
FROM prospect p WHERE p.name = '[?] AIT EL KAID SALAH EDDINE'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-22 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/ait-el-kaid-salah-eddine-6378b6ba' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C038 YOUSSEF BOUCHGHAL (8 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/youssef-bouchghal-540922199' LIMIT 1), TIMESTAMPTZ '2026-06-22 12:00:00+01', 'LinkedIn', 'Résumé : A accepté l’échange le 15/06 mais était en congé ; report convenu après son retour. Relance le 22/06 sans réponse.

--- Fil LinkedIn (8 message(s)) ---
[2026-06-15] YOUSSEF : Ui ui avec grand plaisir
[2026-06-15 14:51] Moi : Bonjour Ssi Youssef, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-15 14:52] YOUSSEF : Bonjour Ssi abdelmouneim
[2026-06-15 14:53] Moi : on pourrai faire un premier échange par whatsapp quand vous voulez
[2026-06-15 14:57] YOUSSEF : Merhba ndiro apres jeudi ri ndkhel mn conge, ana mashi flmghreb
[2026-06-15 14:58] Moi : ah khod rahtak wila knti f Lille ola bruxel merhba
[2026-06-15 16:02] YOUSSEF : Lah yhfdeek Ssi Abdelmouneim merci bcp
[2026-06-22 15:52] Moi : Salam Youssef, ça va ?'
FROM prospect p WHERE p.name = '[?] YOUSSEF BOUCHGHAL'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-22 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/youssef-bouchghal-540922199' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C037 Said EL FDAR (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/said-el-fdar-40a93533' LIMIT 1), TIMESTAMPTZ '2026-06-22 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout, demande de 15 minutes d’échange.

--- Fil LinkedIn (1 message(s)) ---
[2026-06-22 16:43] Moi : Bonjour Said, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?'
FROM prospect p WHERE p.name = '[?] Said EL FDAR'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-22 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/said-el-fdar-40a93533' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C035 Med. Adil El Hassani (3 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/med-adil-el-hassani-10277363' LIMIT 1), TIMESTAMPTZ '2026-06-22 12:00:00+01', 'LinkedIn', 'Résumé : Trois messages entre mars et juin, aucune réponse. Dernière relance annoncée comme la dernière.

--- Fil LinkedIn (3 message(s)) ---
[2026-03-22 11:12] Moi : Bonjour, Je travaille sur des solutions pour structurer les équipes de distribution terrain. Ravi de vous ajouter à mon réseau
[2026-04-16 13:44] Moi : Salam Ssi Adil, Par curiosité, comment organisez-vous aujourd’hui le suivi de vos équipes commerciales sur le terrain (visites, commandes, reporting) ?
[2026-06-22 21:21] Moi : Salam Si Adil, Je me permets une dernière relance. Je travaille sur une solution mobile pour les équipes commerciales terrain dans la distribution, et votre retour d’expérience m’intéresserait beaucoup. Si le sujet n’est pas prioritaire de votre côté, aucun souci.'
FROM prospect p WHERE p.name = '[?] Med. Adil El Hassani'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-22 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/med-adil-el-hassani-10277363' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C034 Rhalouty Mohammed (8 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/rhalouty-mohammed-00634170' LIMIT 1), TIMESTAMPTZ '2026-06-22 12:00:00+01', 'LinkedIn', 'Résumé : Relation entretenue depuis avril. A accepté un échange le 22/06 et transmis son numéro. À rappeler.

--- Fil LinkedIn (8 message(s)) ---
[2026-04-21] Rhalouty : Avec un grand plaisir
[2026-04-21 11:56] Moi : Bonjour Ssi Mohamed, ravi de vous avoir parmi mes contacts, merci pour l’ajout.
[2026-04-21 11:58] Rhalouty : Merci Abdelmounim
[2026-04-21 12:44] Moi : Je travaille actuellement sur une solution dédiée aux entreprises de distribution pour améliorer l’organisation des tournées et le suivi des équipes terrain. Votre expérience dans ce domaine serait très précieuse pour confronter notre approche à la réalité du terrain.
[2026-06-03 10:21] Moi : Bonjour, Je travaille actuellement sur une solution mobile-first destinée aux équipes de distribution terrain. J''aimerais recueillir votre avis sur quelques problématiques que rencontrent les forces de vente sur le terrain. Auriez-vous 10 minutes cette semaine pour un rapide échange WhatsApp ?
[2026-06-22] Rhalouty : [numéro de téléphone transmis]
[2026-06-22 21:35] Moi : Salam Ssi Mohamed, est ce que c''est possible d''échanger 15 minutes cette semaine par whatsapp?
[2026-06-22 21:36] Rhalouty : Oui, bien sûr'
FROM prospect p WHERE p.name = '[?] Rhalouty Mohammed'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-22 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/rhalouty-mohammed-00634170' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C040 Omar Guerouani (3 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/omar-guerouani-16951b55' LIMIT 1), TIMESTAMPTZ '2026-06-15 12:00:00+01', 'LinkedIn', 'Résumé : Premier message envoyé avec une erreur de prénom, corrigée le 15/06. Sans réponse.

--- Fil LinkedIn (3 message(s)) ---
[2026-06-13 13:19] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger ?
[2026-06-15 14:52] Moi : Bonjour Ssi Omar désolé je me suis trompé de prénom
[2026-06-15 14:56] Moi : Je serais ravi d’échanger rapidement avec vous pour mieux comprendre votre organisation terrain et les outils que vous utilisez aujourd’hui côté commerciaux, commandes et suivi client.'
FROM prospect p WHERE p.name = '[?] Omar Guerouani'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-15 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/omar-guerouani-16951b55' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C042 hicham mansouri (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-mansouri-aa929a29' LIMIT 1), TIMESTAMPTZ '2026-06-13 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout.

--- Fil LinkedIn (1 message(s)) ---
[2026-06-13 13:08] Moi : Bonjour Ssi Hicham, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain. Auriez-vous 15 minutes pour échanger cette semaine ?'
FROM prospect p WHERE p.name = '[?] hicham mansouri'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-13 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/hicham-mansouri-aa929a29' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C041 Zakaria El Missaoui (12 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zakaria-el-missaoui-441856211' LIMIT 1), TIMESTAMPTZ '2026-06-13 12:00:00+01', 'LinkedIn', 'Résumé : Échange chaleureux : a transmis deux numéros et recommandé un contact (Mondil Abdellah) à qui présenter la solution.

--- Fil LinkedIn (12 message(s)) ---
[2026-06-11 09:54] Moi : Bonjour Zakaria, Je travaille actuellement sur une solution destinée aux équipes commerciales terrain dans la distribution et j''essaie de mieux comprendre les problématiques du secteur. Votre retour d''expérience m''intéresserait beaucoup. Seriez-vous disponible pour un rapide échange téléphonique ou WhatsApp cette semaine ?
[2026-06-11 18:18] Zakaria : Bonjour Abdelmouneim,
[2026-06-12 14:05] Moi : Bonjour Zakaria
[2026-06-12 15:15] Zakaria : Cv sidi
[2026-06-12 20:29] Moi : C’est possible d’échanger quelques minutes quand vous êtes disponibles ?
[2026-06-12 21:25] Zakaria : [numéro de téléphone transmis]
[2026-06-13 17:41] Zakaria : [second numéro transmis] Hada D C dyalna. Sift lih i9dar ijarab m3ak
[2026-06-13 17:43] Moi : Salam chokran bzaf. Chno smito ?
[2026-06-13 17:45] Zakaria : Mondil Abdellah
[2026-06-13 17:47] Zakaria : Oui, machi mochkil LAH isakhal lik ntmana lik najah
[2026-06-13 18:26] Moi : chokran bzaf inchallah mli nji darouri ndiro chi café
[2026-06-13 21:12] Zakaria : Marhba hada charaf liya'
FROM prospect p WHERE p.name = '[?] Zakaria El Missaoui'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-13 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/zakaria-el-missaoui-441856211' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C044 EL M’KADMI HAMZA (5 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-m%E2%80%99kadmi-hamza-86071b277' LIMIT 1), TIMESTAMPTZ '2026-06-12 12:00:00+01', 'LinkedIn', 'Résumé : Disponible pour partager son expérience terrain, a transmis son numéro le 11/06. À rappeler.

--- Fil LinkedIn (5 message(s)) ---
[2026-06-10 19:30] Moi : Salam Hamza, Je travaille actuellement sur une solution destinée aux équipes terrain dans la distribution et j''essaie de mieux comprendre les défis du métier. Votre retour d''expérience m''intéresserait beaucoup si vous êtes disponible pour échanger quelques minutes.
[2026-06-10 20:29] Hamza : Bonjour, Merci pour votre message. Je suis disponible pour discuter de mon expérience. Quels sont les sujets qui vous intéressent ?
[2026-06-11 09:46] Moi : Bonjour Hamza, Merci pour votre retour. Je travaille actuellement sur une solution destinée aux équipes terrain dans la distribution et je cherche à mieux comprendre les réalités du métier. Si vous êtes disponible, nous pouvons échanger quelques minutes sur WhatsApp, ce sera plus simple.
[2026-06-11 19:48] Hamza : Ok. [numéro de téléphone transmis]
[2026-06-12 20:31] Moi : Merci Hamza'
FROM prospect p WHERE p.name = '[?] EL M’KADMI HAMZA'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-12 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/el-m%E2%80%99kadmi-hamza-86071b277' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C043 Wadii Elkamali (2 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/wadii-elkamali-436a103a6' LIMIT 1), TIMESTAMPTZ '2026-06-12 12:00:00+01', 'LinkedIn', 'Résumé : Premier message en avril, relance le 12/06. Sans réponse.

--- Fil LinkedIn (2 message(s)) ---
[2026-04-14 21:35] Moi : Bonjour, Merci pour l’ajout. J’ai vu que vous travaillez dans la distribution. Je m’intéresse actuellement à l’organisation des tournées et au suivi des équipes commerciales terrain. Comment gérez-vous cela aujourd’hui dans votre entreprise ?
[2026-06-12 21:17] Moi : Bonjour M. Elkamali, Je me permets une petite relance. Je travaille actuellement sur un projet lié au suivi des équipes terrain et j’aimerais comprendre comment vous gérez aujourd’hui le suivi des visites, des commandes et des remontées terrain. Auriez-vous 10 minutes cette semaine pour un échange WhatsApp ?'
FROM prospect p WHERE p.name = 'Les Laboratoires Vilion'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-12 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/wadii-elkamali-436a103a6' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C045 Mohamed KARIMI (7 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohamed-karimi-747243a6' LIMIT 1), TIMESTAMPTZ '2026-06-09 12:00:00+01', 'LinkedIn', 'Résumé : A indiqué le 09/06 ne pas traiter ce volet. Demande de mise en relation avec la bonne personne restée sans réponse.

--- Fil LinkedIn (7 message(s)) ---
[2026-04-14 21:48] Moi : Bonjour, Je travaille sur des solutions pour structurer les équipes de distribution terrain. Ravi de vous ajouter à mon réseau.
[2026-04-14 21:48] Mohamed : Merci Abdelmounim
[2026-04-15 21:53] Moi : Salam Ssi Mohamed, Par curiosité, comment organisez-vous aujourd’hui le suivi de vos équipes commerciales sur le terrain (visites, commandes, reporting) ?
[2026-06-03 10:21] Moi : Bonjour, Je travaille actuellement sur une solution mobile-first destinée aux équipes de distribution terrain. J''aimerais recueillir votre avis sur quelques problématiques que rencontrent les forces de vente sur le terrain. Auriez-vous 10 minutes cette semaine pour un rapide échange WhatsApp ?
[2026-06-09 11:15] Moi : Salam Ssi Mohamed
[2026-06-09 13:52] Mohamed : Bonjour. Je ne traite pas ce volet. Désolé
[2026-06-09 14:41] Moi : Bonjour Mohamed, Merci pour votre retour. Si jamais vous connaissez dans votre réseau ou au sein de votre société une personne qui traite les sujets liés à la distribution, à la force de vente ou aux solutions terrain, je serais ravi d''échanger avec elle.'
FROM prospect p WHERE p.name = '[?] Mohamed KARIMI'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohamed-karimi-747243a6' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C049 Saad BAGHO (3 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Saad' AND c.last_name = 'BAGHO' LIMIT 1), TIMESTAMPTZ '2026-06-05 12:00:00+01', 'LinkedIn', 'Résumé : Contact amical de longue date. Sollicité en juin pour un avis sur la solution ; a répondu ne plus maîtriser le sujet, un call reste à caler.

--- Fil LinkedIn (3 message(s)) ---
[2026-06-03 11:09] Moi : Salam ba Saad, chaft rak deja khdmti 3la Salesforce Commerce Cloud interessant ! ana khdam 3la une solution mobile-first destinée aux équipes de distribution terrain, makrahtch mli ikon 3ndak w9t nwriha lik otgolia achno ban lik
[2026-06-05 12:13] Saad : Ça va Khouya Abdelmouneim. Saraha kente khdemte 3lih un an f 2017, maab9itch 3a9el 3la dakchi
[2026-06-05 12:37] Moi : Ba Saad machi mochkil, dans tous les cas l''avis dyalk radi ynf3ni. Mli tkon mssali inchallah ndiro chi call nwrik 3lach khdam si ça t''intéresse'
FROM prospect p WHERE p.name = '[?] Saad BAGHO'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-05 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Saad' AND c.last_name = 'BAGHO' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C048 abdellatif kouhaiz (3 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/abdellatif-kouhaiz-04155110a' LIMIT 1), TIMESTAMPTZ '2026-06-05 12:00:00+01', 'LinkedIn', 'Résumé : A répondu avec plaisir et transmis son numéro le jour même (05/06). À rappeler.

--- Fil LinkedIn (3 message(s)) ---
[2026-06-05 12:43] Moi : Bonjour Ssi Abdellatif, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?
[2026-06-05 12:59] abdellatif : Bonjour Abdelmouneim, Avec plaisir
[2026-06-05 13:06] abdellatif : [numéro de téléphone transmis]'
FROM prospect p WHERE p.name = '[?] abdellatif kouhaiz'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-05 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/abdellatif-kouhaiz-04155110a' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C050 KAMSINFO - (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-06-04 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise (angle Sage).

--- Fil LinkedIn (1 message(s)) ---
[2026-06-04 10:05] Moi : Bonjour, Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Ravi de vous ajouter à mon réseau.'
FROM prospect p WHERE p.name = 'KAMSINFO'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-04 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C053 Sara FILALI (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/sara-filali-29623376' LIMIT 1), TIMESTAMPTZ '2026-06-03 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout (angle Sage).

--- Fil LinkedIn (1 message(s)) ---
[2026-06-03 09:58] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?'
FROM prospect p WHERE p.name = '[?] Sara FILALI'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-03 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/sara-filali-29623376' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C052 FAHD IDRISSI FALLAKI (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/fahd-idrissi-fallaki-49b17a41' LIMIT 1), TIMESTAMPTZ '2026-06-03 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout (angle Sage).

--- Fil LinkedIn (1 message(s)) ---
[2026-06-03 10:03] Moi : Bonjour, Merci pour l’ajout. Je travaille sur un projet mobile-first destiné aux équipes de distribution terrain, avec des intégrations autour de Sage. Auriez-vous 15 minutes pour échanger cette semaine ?'
FROM prospect p WHERE p.name = 'DELTA CLOUD'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-03 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/fahd-idrissi-fallaki-49b17a41' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C051 RACHID AARABI (3 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/rachid-aarabi-3b734210b' LIMIT 1), TIMESTAMPTZ '2026-06-03 12:00:00+01', 'LinkedIn', 'Résumé : Trois messages entre mars et juin, aucune réponse.

--- Fil LinkedIn (3 message(s)) ---
[2026-03-05 01:45] Moi : Bonjour, Je travaille sur des solutions pour structurer les équipes de distribution terrain. Ravi de vous ajouter à mon réseau
[2026-03-05 09:25] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?
[2026-06-03 10:21] Moi : Bonjour, Je travaille actuellement sur une solution mobile-first destinée aux équipes de distribution terrain. J''aimerais recueillir votre avis sur quelques problématiques que rencontrent les forces de vente sur le terrain. Auriez-vous 10 minutes cette semaine pour un rapide échange WhatsApp ?'
FROM prospect p WHERE p.name = '[?] RACHID AARABI'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-06-03 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/rachid-aarabi-3b734210b' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C054 Elmerini Imane (13 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/elmerini-imane-39b143aa' LIMIT 1), TIMESTAMPTZ '2026-04-29 12:00:00+01', 'LinkedIn', 'Résumé : Contact le plus abouti : introduite par Marouane, échanges de mars à avril, visio fixée au vendredi 08/05 à 9h (Maroc) / 10h (France), adresse mail transmise pour l’invitation.

--- Fil LinkedIn (13 message(s)) ---
[2026-03-10 22:26] Moi : Bonjour, Marouane m’a dit qu’il vous avait parlé de mon projet. Je développe actuellement un outil mobile pour le suivi des commerciaux terrain dans les entreprises de distribution (tournées, visites clients, prise de commandes). Je serais curieux d’avoir votre avis sur ce sujet. Seriez-vous ouverte à un échange rapide ?
[2026-03-12 23:25] Elmerini : Bonsoir, marouane m''en a parlé effectivement. On peut organiser une réunion après le ramadan pour en parler
[2026-03-13 11:04] Moi : Oui bien sûr, avec plaisir. Nous pourrons organiser un échange après le Ramadan inchallah.
[2026-03-26 13:20] Moi : Aid Moubarak. Quand vous aurez un peu de temps disponible, on pourra organiser une petite discussion pour vous présenter l’avancement et avoir votre retour.
[2026-04-12 20:42] Moi : Bonjour, Je me permets de revenir vers vous suite à mon précédent message. Lorsque vous aurez un moment, nous serions ravis d’organiser une courte discussion pour vous présenter l’avancement et recueillir votre retour.
[2026-04-14 16:42] Elmerini : Bonjour, je vous promets que dès que j''ai un moment je vous propose un créneau. Nous sommes un peu sous l''eau. Désolée et à bientôt
[2026-04-14 21:10] Moi : Bonjour, merci pour votre retour. Je comprends tout à fait, bon courage pour cette période chargée. Je reste disponible et ce sera avec plaisir lorsque vous aurez un moment.
[2026-04-29 18:50] Elmerini : Je te propose inchaallah vendredi 08 à l''heure qui te convient
[2026-04-29 20:12] Moi : Bonjour c’est bon pour moi je vous laisse choisir l’heure qui vous convient.
[2026-04-29 20:22] Elmerini : On fait 9h00 maroc, ça fera 10h00 france. C''est bon ?
[2026-04-29 20:40] Moi : C''est noté, merci
[2026-04-29 21:23] Moi : Pouvez-vous me donner votre adresse mail pour créer un meeting ?
[2026-04-29 21:30] Elmerini : [adresse e-mail transmise]'
FROM prospect p WHERE p.name = 'LISA & CO'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-29 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/elmerini-imane-39b143aa' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C060 Mediastore Informatique (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-04-21 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-04-21 13:36] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?'
FROM prospect p WHERE p.name = 'Mediastore Informatique'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-21 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C059 Solarway - (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-04-21 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-04-21 13:38] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?'
FROM prospect p WHERE p.name = 'Solarway'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-21 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C058 Salipro - (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-04-21 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-04-21 13:39] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?'
FROM prospect p WHERE p.name = 'Salipro'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-21 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C057 TOP CRAYON (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-04-21 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-04-21 13:43] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?'
FROM prospect p WHERE p.name = 'TOP CRAYON'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-21 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C056 TOP STYLO (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-04-21 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-04-21 13:43] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?'
FROM prospect p WHERE p.name = 'TOP STYLO'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-21 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C061 SOMADIR - (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-04-14 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise (voir aussi Hamza REGGUI, C016).

--- Fil LinkedIn (1 message(s)) ---
[2026-04-14 21:41] Moi : Bonjour, Je travaille actuellement sur des sujets liés à l’organisation des équipes commerciales terrain dans la distribution. Est-ce que votre entreprise dispose de commerciaux qui visitent les clients ?'
FROM prospect p WHERE p.name = 'SOMADIR'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-04-14 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C062 Najib BELKHAYAT (6 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Najib' AND c.last_name = 'BELKHAYAT' LIMIT 1), TIMESTAMPTZ '2026-03-27 12:00:00+01', 'LinkedIn', 'Résumé : Relation de confiance. Après report pour cause de maladie et de Ramadan, appel convenu le 27/03 entre 18h et 19h (heure marocaine) avec envoi d’un lien Google Meet pour présenter la solution.

--- Fil LinkedIn (6 message(s)) ---
[2026-03-01 13:29] Moi : Salam ssi Najib, Ramadan karim. Je travaille sur une solution mobile pour structurer les équipes de distribution terrain (tournées, suivi des visites, commandes, dashboard manager). J’aimerais beaucoup avoir ton avis dessus et échanger avec toi quand tu seras disponible.
[2026-03-04 02:24] Najib : Salam alaikoum Abdelmouneim. Ça sera avec plaisir. Je suis malheureusement souffrant cette semaine et j''ai un rythme un peu compliqué ce Ramadan. Je te suggère qu''on le fasse la semaine prochaine inchaaAllah, sinon juste après l''Aid.
[2026-03-04 09:23] Moi : Wa alaikoum salam Si Najib. Prenez le temps. On pourra faire ça tranquillement après l’Aïd inchaaAllah, je vous renverrai un message à ce moment-là.
[2026-03-26 13:18] Moi : Aid Moubarak Si Najib. Quand tu seras disponible, on pourra organiser une petite discussion pour te présenter l’avancement et avoir ton retour.
[2026-03-27 14:25] Najib : Salam alaikoum Abdelmouneim. Merci. Aid moubarak à toi aussi. Appelle moi aujourd''hui entre 18h et 19h marocaine inchaaAllah si tu peux.
[2026-03-27 15:09] Moi : Ok c’est noté. Je t’envoie aussi un lien Google Meet pour que je puisse te montrer la solution et échanger ensemble inchaaAllah.'
FROM prospect p WHERE p.name = '[?] Najib BELKHAYAT'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-27 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.prospect_id = p.id AND c.first_name = 'Najib' AND c.last_name = 'BELKHAYAT' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C063 MOHAMMED BENNANI (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohammed-bennani-6876b3159' LIMIT 1), TIMESTAMPTZ '2026-03-15 12:00:00+01', 'LinkedIn', 'Résumé : Prise de contact après ajout sur l’organisation des tournées.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-15 20:23] Moi : Bonjour, Merci pour l’ajout. J’ai vu que vous travaillez dans la distribution. Je m’intéresse actuellement à l’organisation des tournées et au suivi des équipes commerciales terrain dans ce secteur. Comment gérez-vous cela aujourd’hui dans votre entreprise ?'
FROM prospect p WHERE p.name = 'FMCG / Distribution multicanale'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-15 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohammed-bennani-6876b3159' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- C068 BAKKAL MARKET (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-09 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-09 12:24] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je serais curieux de comprendre comment vous gérez aujourd’hui le suivi des tournées et des équipes commerciales terrain. Seriez-vous ouvert à un échange rapide ?'
FROM prospect p WHERE p.name = 'BAKKAL MARKET'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C067 Industape - (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-09 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise le 09/03.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-09 14:30] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je m’intéresse actuellement à l’organisation des tournées et au suivi des équipes commerciales terrain dans ce secteur. Comment gérez-vous cela aujourd’hui dans votre entreprise ?'
FROM prospect p WHERE p.name = 'Industape'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C066 QUALAVI S.A.R.L (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-09 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise le 09/03.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-09 14:30] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je m’intéresse actuellement à l’organisation des tournées et au suivi des équipes commerciales terrain dans ce secteur. Comment gérez-vous cela aujourd’hui dans votre entreprise ?'
FROM prospect p WHERE p.name = 'QUALAVI S.A.R.L'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C065 KARA DISTRIBUTION (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-09 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise le 09/03.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-09 14:30] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je m’intéresse actuellement à l’organisation des tournées et au suivi des équipes commerciales terrain dans ce secteur. Comment gérez-vous cela aujourd’hui dans votre entreprise ?'
FROM prospect p WHERE p.name = 'KARA DISTRIBUTION'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C064 TENDER FISH (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-09 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise le 09/03.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-09 14:30] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je m’intéresse actuellement à l’organisation des tournées et au suivi des équipes commerciales terrain dans ce secteur. Comment gérez-vous cela aujourd’hui dans votre entreprise ?'
FROM prospect p WHERE p.name = 'TENDER FISH'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-09 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C070 Maroc Diabète Plus (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-07 12:00:00+01', 'LinkedIn', 'Résumé : Avait donné un premier retour ; demande de créneau de 10-15 min restée sans suite.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-07 11:03] Moi : Bonjour, Merci pour votre retour. Quand seriez-vous disponible pour un échange rapide de 10-15 minutes afin que je comprenne comment vous gérez aujourd’hui les tournées et le suivi des équipes terrain ?'
FROM prospect p WHERE p.name = 'Maroc Diabète Plus'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-07 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C069 TIMAC AGRO MAROC (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-07 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-07 16:28] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je serais curieux de comprendre comment vous gérez aujourd’hui le suivi des tournées et des équipes commerciales terrain. Seriez-vous ouvert à un échange rapide ?'
FROM prospect p WHERE p.name = 'TIMAC AGRO MAROC'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-07 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C072 MAROC ORGANIC (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-05 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise.

--- Fil LinkedIn (1 message(s)) ---
[2026-03-05 21:14] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je serais curieux de comprendre comment vous gérez aujourd’hui le suivi des tournées et des équipes commerciales terrain. Seriez-vous ouvert à un échange rapide ?'
FROM prospect p WHERE p.name = 'MAROC ORGANIC'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-05 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C071 abm distribution maroc (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-05 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise (voir aussi zainab Chaaboun, C003).

--- Fil LinkedIn (1 message(s)) ---
[2026-03-05 21:19] Moi : Bonjour, J’ai vu que vous travaillez dans la distribution. Je serais curieux de comprendre comment vous gérez aujourd’hui le suivi des tournées et des équipes commerciales terrain. Seriez-vous ouvert à un échange rapide ?'
FROM prospect p WHERE p.name = 'abm distribution maroc'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-05 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C074 GDIRAGRI - (1 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, NULL, TIMESTAMPTZ '2026-03-04 12:00:00+01', 'LinkedIn', 'Résumé : Message d’approche envoyé à la page entreprise (voir aussi Maryem GUEDIRA, C033).

--- Fil LinkedIn (1 message(s)) ---
[2026-03-04 21:47] Moi : Bonjour, J’ai vu que vous êtes dans la distribution de produits agricoles. Je travaille sur une solution mobile pour structurer les tournées vendeurs et le suivi terrain. Je serais curieux de comprendre comment vous gérez cela aujourd’hui. Seriez-vous ouvert à un échange rapide ?'
FROM prospect p WHERE p.name = 'GDIRAGRI'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-04 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM NULL)
ORDER BY p.id LIMIT 1;

-- C073 Mohammed DRIF (4 msg)
INSERT INTO interaction (prospect_id, contact_id, date, type, notes)
SELECT p.id, (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohammed-drif-40a53059' LIMIT 1), TIMESTAMPTZ '2026-03-04 12:00:00+01', 'LinkedIn', 'Résumé : A répondu avec plaisir et transmis son numéro le 04/03. Aucun suivi depuis.

--- Fil LinkedIn (4 message(s)) ---
[2026-03-04 20:36] Moi : Bonjour, Je travaille sur des solutions pour structurer les équipes de distribution terrain. Ravi de vous ajouter à mon réseau.
[2026-03-04 20:39] Mohammed : Bonsoir. Le plaisir est partagé. Bien à vous
[2026-03-04 22:05] Moi : Bonsoir, Merci pour votre réponse. Je travaille actuellement sur une solution pour aider les entreprises de distribution à mieux organiser les tournées et le suivi des équipes commerciales terrain. Ce serait intéressant d’échanger quelques minutes pour comprendre comment vous gérez cela aujourd’hui de votre côté.
[2026-03-04 22:06] Mohammed : Avec plaisir. [numéro de téléphone transmis]'
FROM prospect p WHERE p.name = '[?] Mohammed DRIF'
  AND NOT EXISTS (SELECT 1 FROM interaction i WHERE i.prospect_id = p.id AND i.date = TIMESTAMPTZ '2026-03-04 12:00:00+01' AND i.type = 'LinkedIn' AND i.contact_id IS NOT DISTINCT FROM (SELECT c.id FROM contact c WHERE c.linkedin_url = 'https://www.linkedin.com/in/mohammed-drif-40a53059' LIMIT 1))
ORDER BY p.id LIMIT 1;

-- ================= Recalage de last_interaction_at =================
UPDATE prospect p SET last_interaction_at = agg.max_date
FROM (SELECT prospect_id, MAX(date) AS max_date FROM interaction GROUP BY prospect_id) agg
WHERE p.id = agg.prospect_id
  AND (p.last_interaction_at IS NULL OR p.last_interaction_at < agg.max_date);

COMMIT;
