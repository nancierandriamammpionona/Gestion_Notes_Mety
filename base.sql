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

ALTER TABLE candidat
ADD COLUMN prenom VARCHAR(255);

UPDATE candidat SET prenom = 'Marie-Claire' WHERE id = 1;
UPDATE candidat SET prenom = 'Lucas' WHERE id = 2;
UPDATE candidat SET prenom = 'Marck-Antony' WHERE id = 3;
UPDATE candidat SET prenom = 'Eliot' WHERE id = 4;
UPDATE candidat SET prenom = 'Violette-Lou' WHERE id = 5;

-- Table Matiere
INSERT INTO Matiere (matiere) VALUES
('Mathematique'),
('Physique'),
('Chimie');

-- Table Resolution
INSERT INTO Resolution (nom) VALUES
('plus petit'),
('plus grand');

-- Table Operateur
INSERT INTO Operateur (symbole) VALUES
('>'),
('<');

-- Table Parametre
-- Exemple: id=1, id_matiere=1 (Mathematique), diff=2, id_operateur=1 (>), id_resolution=1 (plus petit)
INSERT INTO Parametre (id_matiere, diff, id_operateur, id_resolution) VALUES
(1, 2, 1, 1),
(1, 8, 2, 1),
(1, 3, 2, 2);



-- Table Note
-- Exemple: id=1, id_candidat=1 (Marie), id_matiere=1 (Mathematique), note=13
INSERT INTO Note (id_candidat, id_matiere, note) VALUES
(1, 1, 15.00),
(1, 1, 14.50),
(1, 1, 14.00),
(1, 1, 12.50),
(1, 1, 14.00);

ALTER TABLE note ADD COLUMN id_correcteur INT REFERENCES correcteur(id);

SELECT * FROM correcteur;
SELECT * FROM candidat;
SELECT * FROM matiere;
SELECT * FROM note;
SELECT * FROM operateur;
SELECT * FROM parametre;
SELECT * FROM resolution;

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

UPDATE note SET id_correcteur = 8 WHERE id = 15;
UPDATE note SET id_correcteur = 9 WHERE id = 16;
UPDATE note SET id_correcteur = 10 WHERE id = 17;


-- test de donnee
INSERT INTO Note (id_candidat, id_matiere, note) VALUES
(2, 2, 15.00),
(2, 2, 14.00),
(2, 2, 16.00);

INSERT INTO operateur (symbole) VALUES ('>=');
INSERT INTO operateur (symbole) VALUES ('<=');

INSERT INTO Parametre (id_matiere, diff, id_operateur, id_resolution)
VALUES 
(1, 2, 3, 1);  -- opérateur >=, résolution plus petit

-- Pour Physique
INSERT INTO Parametre (id_matiere, diff, id_operateur, id_resolution)
VALUES
(2, 1, 4, 2);  -- opérateur <=, résolution plus grand