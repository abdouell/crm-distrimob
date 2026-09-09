-- V4__relax_linkedin_optional_fields.sql
-- Les imports LinkedIn ne fournissent ni email ni téléphone : ces colonnes
-- deviennent optionnelles pour permettre la création de contacts/prospects
-- issus du réseau sans inventer de coordonnées.
ALTER TABLE prospect ALTER COLUMN phone DROP NOT NULL;
ALTER TABLE contact  ALTER COLUMN email DROP NOT NULL;
ALTER TABLE contact  ALTER COLUMN phone DROP NOT NULL;
