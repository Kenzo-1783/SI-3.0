-- genres
INSERT INTO genre(type) VALUES
  ('Homme'), ('Femme'), ('Autre');

-- departement
INSERT INTO service(nom) VALUES
  ('Ressources Humaines'),
  ('Finance'),
  ('Informatique'),
  ('Production');

-- employe statut
INSERT INTO statut_employe(label) VALUES
  ('Actif'), ('En conge'), ('Suspendu'), ('Sorti');

-- contrat type
INSERT INTO type_contrat(label) VALUES
  ('CDI'), ('CDD'), ('Stage'), ('Freelance');

-- contrat statut
INSERT INTO statut_contrat(label) VALUES
  ('En cours'), ('Expire'), ('Rompus'), ('Renouvele');

-- document type
INSERT INTO type_document(label) VALUES
  ('CIN'),
  ('Diplome'),
  ('CV'),
  ("Attestation d'emploi"),
  ('Contrat signe');

-- photo test
INSERT INTO photo(fichier) VALUES
  ('photo1.jpg'), ('photo2.jpg');

-- employe
INSERT INTO employe
  (nom, prenom, id_genre, date_naissance, email, contact, adresse, id_photo, id_service, date_embauche, id_statut) VALUES
  ('Rakoto', 'Jean', 1, '1990-05-12', 'jeanrakoto@mail.com', '0340011223', 'Antananarivo', 1, 3, '2020-01-10', 1),
  ('Rasoa', 'Marie', 2, '2000-03-08', 'marierasoa@mail.com', '0348877665', 'Mahajanga', 2, 1, '2021-06-01', 1);

-- poste travail
INSERT INTO poste(label, niveau, id_service) VALUES
  ('Developpeur', 'Junior', 3),
  ('Responsable RH', 'Senior', 1);

-- historique poste
INSERT INTO poste_employe(id_employe, id_poste, debut) VALUES
(1, 1, '2020-01-10'),
(2, 2, '2021-06-01');
