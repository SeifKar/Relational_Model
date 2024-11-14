-- Hotel Database Relational Schema

-- CHAMBRE (Room) Table
CREATE TABLE Chambre (
    NumChambre INT PRIMARY KEY,
    TypeChambre VARCHAR(50),
    Prix DECIMAL(10,2),
    Etage INT
);

-- CLIENT Table
CREATE TABLE Client (
    CodeClient INT PRIMARY KEY,
    Nom VARCHAR(100),
    Prenom VARCHAR(100),
    Adresse VARCHAR(200),
    Ville VARCHAR(100),
    CodePostal VARCHAR(20),
    Pays VARCHAR(100),
    Tel VARCHAR(20),
    Email VARCHAR(100)
);

-- RESERVATION Table
CREATE TABLE Reservation (
    NumReservation INT PRIMARY KEY,
    DateDebut DATE,
    DateFin DATE,
    CodeClient INT,
    NumChambre INT,
    FOREIGN KEY (CodeClient) REFERENCES Client(CodeClient),
    FOREIGN KEY (NumChambre) REFERENCES Chambre(NumChambre)
);

-- FACTURE (Invoice) Table
CREATE TABLE Facture (
    NumFacture INT PRIMARY KEY,
    DateFacture DATE,
    MontantTotal DECIMAL(10,2),
    NumReservation INT,
    FOREIGN KEY (NumReservation) REFERENCES Reservation(NumReservation)
);

-- Comments explaining the relationships:
/*
1. Each CHAMBRE (Room) can have multiple RESERVATIONS (one-to-many)
2. Each CLIENT can make multiple RESERVATIONS (one-to-many)
3. Each RESERVATION generates one FACTURE (Invoice) (one-to-one)
4. The relationships are implemented using foreign keys
*/
