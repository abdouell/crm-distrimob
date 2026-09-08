-- V3__add_contact_to_interaction.sql
-- Ajouter la colonne contact_id à la table des interactions
ALTER TABLE interaction ADD COLUMN contact_id BIGINT;

-- Ajouter la clé étrangère pointant vers la table contact avec ON DELETE SET NULL
ALTER TABLE interaction ADD CONSTRAINT fk_interaction_contact FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE SET NULL;
