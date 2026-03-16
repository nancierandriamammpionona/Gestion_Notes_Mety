CREATE DATABASE correction;

\c correction

-- Table Correcteur
CREATE TABLE Correcteur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table Candidat
CREATE TABLE Candidat (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table Matiere
CREATE TABLE Matiere (
    id SERIAL PRIMARY KEY,
    matiere VARCHAR(255) NOT NULL
);

-- Table Resolution
CREATE TABLE Resolution (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table Operateur
CREATE TABLE Operateur (
    id SERIAL PRIMARY KEY,
    symbole CHAR(1) NOT NULL CHECK (symbole IN ('<', '>'))
);

-- Table Parametre
CREATE TABLE Parametre (
    id SERIAL PRIMARY KEY,
    id_matiere INT NOT NULL REFERENCES Matiere(id),
    diff INT NOT NULL,
    id_operateur INT NOT NULL REFERENCES Operateur(id),
    id_resolution INT NOT NULL REFERENCES Resolution(id)
);

-- Table Note
CREATE TABLE Note (
    id SERIAL PRIMARY KEY,
    id_candidat INT NOT NULL REFERENCES Candidat(id),
    id_matiere INT NOT NULL REFERENCES Matiere(id),
    note NUMERIC(5,2) NOT NULL
);

INSERT INTO Correcteur (nom) VALUES
('Rakoto'),
('Rabe'),
('Rasoa'),
('Randria'),
('Andry');

INSERT INTO Candidat (nom) VALUES
('Marie'),
('Luck'),
('marck'),
('Eliote'),
('Violette');

ALTER TABLE candidat ADD COLUMN prenom VARCHAR(255);
ALTER TABLE note ADD COLUMN id_correcteur INT REFERENCES correcteur(id);

SELECT * FROM correcteur;
SELECT * FROM candidat;
SELECT * FROM matiere;
SELECT * FROM operateur;
SELECT * FROM resolution;
SELECT * FROM parametre;
SELECT * FROM note;

TRUNCATE TABLE note RESTART IDENTITY CASCADE;
TRUNCATE TABLE parametre RESTART IDENTITY CASCADE;
TRUNCATE TABLE correcteur RESTART IDENTITY CASCADE;
TRUNCATE TABLE candidat RESTART IDENTITY CASCADE;
TRUNCATE TABLE matiere RESTART IDENTITY CASCADE;
TRUNCATE TABLE operateur RESTART IDENTITY CASCADE;
TRUNCATE TABLE resolution RESTART IDENTITY CASCADE;     


-- maka somme des difference note donner par correcteur:
SELECT SUM(ABS(n1.note - n2.note)) AS somme_diff
FROM note n1
JOIN note n2 
ON n1.id < n2.id
AND n1.id_matiere = n2.id_matiere
WHERE n1.id_matiere = 1;

-- min et max
SELECT 
MIN(note) AS plus_petit,
MAX(note) AS plus_grand
FROM note
WHERE id_matiere = 1;

