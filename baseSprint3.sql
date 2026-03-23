-- TABLE CLIENT
CREATE TABLE client (
    id_client INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    contact VARCHAR(50)
);

-- TABLE TYPE_DEVIS
CREATE TABLE type_devis (
    id_type_devis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

-- TABLE DEMANDE
CREATE TABLE demande (
    id_demande INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date DATE NOT NULL,
    id_client INT NOT NULL,
    lieu VARCHAR(100),
    district VARCHAR(100),
    CONSTRAINT fk_demande_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client)
        ON DELETE CASCADE
);

-- TABLE DEVIS
CREATE TABLE devis (
    id_devis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    montant_total NUMERIC(10,2),
    id_type_devis INT NOT NULL,
    date DATE,
    id_demande INT NOT NULL,
    CONSTRAINT fk_devis_type
        FOREIGN KEY (id_type_devis)
        REFERENCES type_devis(id_type_devis),
    CONSTRAINT fk_devis_demande
        FOREIGN KEY (id_demande)
        REFERENCES demande(id_demande)
        ON DELETE CASCADE
);

-- TABLE DETAILS_DEVIS
CREATE TABLE details_devis (
    id_details INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_devis INT NOT NULL,
    libelle VARCHAR(100),
    montant NUMERIC(10,2),
    CONSTRAINT fk_details_devis
        FOREIGN KEY (id_devis)
        REFERENCES devis(id_devis)
        ON DELETE CASCADE
);

-- TABLE STATUS
CREATE TABLE status (
    id_status INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

-- TABLE DEMANDE_STATUS
CREATE TABLE demande_status (
    id_demande INT,
    id_status INT,
    date DATE,
    PRIMARY KEY (id_demande, id_status, date),
    CONSTRAINT fk_ds_demande
        FOREIGN KEY (id_demande)
        REFERENCES demande(id_demande)
        ON DELETE CASCADE,
    CONSTRAINT fk_ds_status
        FOREIGN KEY (id_status)
        REFERENCES status(id_status)
);

