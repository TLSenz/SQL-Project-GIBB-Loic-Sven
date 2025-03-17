
USE OnlineKurse;

-- Tabelle: Kategorien
CREATE TABLE Kategorien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE Platform(
    id int Auto_increment Primary Key,
    name VARCHAR(255)
);

create TABLE Ort(
    id int Auto_Increment Primary Key,
    name varchar(255),
    PLZ int
);
create Table Trainer
(
    id         int Auto_Increment Primary Key,
    Geburtstag Date,
    Bio        text,
    Ort_id     int,
    Email      varchar(255),
    foreign key (Ort_ID) references Ort (id)
);

-- Tabelle: Kurse
CREATE TABLE Kurse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titel VARCHAR(255) NOT NULL,
    datum DATE NOT NULL,
    dauer INT NOT NULL,
    schwierigkeit int,
    kategorie_id INT,
    Trainer_id int,
    Platform_id int,
    FOREIGN KEY (Platform_id) REFERENCES Platform(id),
    FOREIGN KEY (Trainer_id) REFERENCES Trainer(id),
    FOREIGN KEY (kategorie_id) REFERENCES Kategorien(id) ON DELETE SET NULL

);

-- Tabelle: Teilnehmer
CREATE TABLE Portalbenutzer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    Benutzername VARCHAR(255) NOT NULL,
    email varchar(255),
    Telefonnummer int,
    Geburtsdatum date,
    Passwort varchar(255)

);

-- Tabelle: Teilnahme (Viele-zu-Viele Beziehung zwischen Kurse und Teilnehmer)
CREATE TABLE Teilnahme (
    kurs_id INT,
    teilnehmer_id INT,
    bewertung INT CHECK (bewertung BETWEEN 1 AND 5),
    kommentar TEXT,
    PRIMARY KEY (kurs_id, teilnehmer_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurse(id) ON DELETE CASCADE,
    FOREIGN KEY (teilnehmer_id) REFERENCES Portalbenutzer(id) ON DELETE CASCADE
);
