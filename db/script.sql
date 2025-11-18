CREATE DATABASE sys_inf;

\c sys_inf;

-- genre
CREATE TABLE IF NOT EXISTS genre(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50) UNIQUE NOT NULL
);

-- photo profil
CREATE TABLE IF NOT EXISTS photo(
  id SERIAL PRIMARY KEY,
  fichier VARCHAR(255) UNIQUE NOT NULL
);

-- departement
CREATE TABLE IF NOT EXISTS service(
  id SERIAL PRIMARY KEY,
  nom VARCHAR(150) UNIQUE NOT NULL
);

-- employe statut
CREATE TABLE IF NOT EXISTS statut_employe(
  id SERIAL PRIMARY KEY,
  label VARCHAR(100) UNIQUE NOT NULL
);

-- employe
CREATE TABLE IF NOT EXISTS employe(
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) DEFAULT NULL,
  id_genre INT NOT NULL REFERENCES genre(id),
  date_naissance DATE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  contact VARCHAR(14) UNIQUE DEFAULT NULL,
  adresse VARCHAR(255) NOT NULL,
  id_photo INT NOT NULL REFERENCES photo(id),
  id_service INT NOT NULL REFERENCES service(id),
  date_embauche DATE NOT NULL,
  id_statut INT REFERENCES statut_employe(id)
);

-- contrat type
CREATE TABLE IF NOT EXISTS type_contrat(
  id SERIAL PRIMARY KEY,
  label VARCHAR(250) UNIQUE NOT NULL
);

-- contrat statut
CREATE TABLE IF NOT EXISTS statut_contrat(
  id SERIAL PRIMARY KEY,
  label VARCHAR(100) UNIQUE NOT NULL
);

-- contrat
CREATE TABLE IF NOT EXISTS contrat(
  id SERIAL PRIMARY KEY,
  id_employe INT NOT NULL REFERENCES employe(id),
  id_type INT NOT NULL REFERENCES type_contrat(id),
  debut DATE NOT NULL,
  fin DATE,
  id_statut INT NOT NULL REFERENCES statut_contrat(id)
);

-- periode d'essaie
CREATE TABLE IF NOT EXISTS periode_essaie(
  id SERIAL PRIMARY KEY,
  id_contrat INT NOT NULL REFERENCES contrat(id),
  debut DATE NOT NULL,
  fin DATE NOT NULL,
  renouvellable BOOLEAN DEFAULT FALSE
);

-- renouvellement contrat
CREATE TABLE IF NOT EXISTS renouvellement_contrat(
  id SERIAL PRIMARY KEY,
  id_contrat INT NOT NULL REFERENCES contrat(id),
  ancient_date_fin DATE NOT NULL,
  nouvelle_date_fin DATE NOT NULL
);

-- poste travail
CREATE TABLE IF NOT EXISTS poste(
  id SERIAL PRIMARY KEY,
  label VARCHAR(150) NOT NULL,
  niveau VARCHAR(100) NOT NULL,
  id_service INT NOT NULL REFERENCES service(id)
);

-- historique poste
CREATE TABLE IF NOT EXISTS poste_employe(
  id SERIAL PRIMARY KEY,
  id_employe INT NOT NULL REFERENCES employe(id),
  id_poste INT NOT NULL REFERENCES poste(id),
  debut DATE NOT NULL,
  fin DATE
);

-- document type
CREATE TABLE IF NOT EXISTS type_document(
  id SERIAL PRIMARY KEY,
  label VARCHAR(150) UNIQUE NOT NULL
);

-- document RH
CREATE TABLE IF NOT EXISTS document_rh(
  id SERIAL PRIMARY KEY,
  id_employe INT NOT NULL REFERENCES employe(id),
  id_type_document INT NOT NULL REFERENCES type_document(id),
  fichier VARCHAR(255) NOT NULL,
  date_ajout DATE DEFAULT CURRENT_TIMESTAMP,
  date_expiration DATE
);

