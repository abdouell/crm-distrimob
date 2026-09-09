-- V5__add_prospect_linkedin_url.sql
-- Lien vers la page LinkedIn de l'entreprise, pendant de contact.linkedin_url.
-- Alimente par l'import LinkedIn : le site web et la page LinkedIn sont deux
-- informations distinctes, website ne doit pas servir de fourre-tout.
ALTER TABLE prospect ADD COLUMN linkedin_url VARCHAR(255);
