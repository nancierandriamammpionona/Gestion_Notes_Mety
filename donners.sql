INSERT INTO Correcteur (nom) VALUES
('Correcteur1'),
('Correcteur2'),
('Correcteur3');

INSERT INTO Candidat (nom) VALUES
('Candidat1'), 
('Candidat2'),
('Candidat3');

INSERT INTO Matiere (matiere) VALUES
('JAVA'),
('PHP');   

INSERT INTO Resolution (nom) VALUES
('petit'), 
('grand'), 
('moyenne');   

INSERT INTO Operateur (symbole) VALUES
('<'), 
('<='), 
('>'), 
('>='); 


INSERT INTO Parametre (id_matiere, diff, id_operateur, id_resolution) VALUES
(1, 5, 4, 2), 
(1, 8, 1, 1); 
(2, 2, 2, 1), 
(2, 2, 3, 2); 

INSERT INTO Note (id_candidat, id_matiere, note, id_correcteur) VALUES
(1, 1, 10.00, 1),
(1, 1, 10.00, 2),
(1, 1, 11.00, 3),
(2, 1, 10.00, 1),
(2, 1, 13.00, 2),
(2, 1, 13.00, 3),
(3, 1, 10.00, 1),
(3, 1, 13.00, 2),
(3, 1, 13.25, 3);
(2, 2, 13.00, 2);



