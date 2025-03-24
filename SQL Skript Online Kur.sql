
USE OnlineKurse;

-- Tabelle: Kategorien
CREATE TABLE Kategorien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Platform(
    id int Auto_increment Primary Key,
    name VARCHAR(255) not null
);

create TABLE Ort(
    id int Auto_Increment Primary Key,
    name varchar(255) not null,
    PLZ int not null
);
create Table Trainer
(
    id         int Auto_Increment Primary Key,
    name varchar(30) not null,
    Geburtstag Date not null,
    Bio        text not null,
    Ort_id     int not null,
    Email      varchar(255) not null,
    foreign key (Ort_ID) references Ort (id)
);

-- Tabelle: Kurse
CREATE TABLE Kurse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titel VARCHAR(255) NOT NULL,
    datum DATE NOT NULL,
    dauer INT NOT NULL,
    schwierigkeit int not null,
    kategorie_id INT not null,
    Trainer_id int not null,
    Platform_id int not null,
    FOREIGN KEY (Platform_id) REFERENCES Platform(id),
    FOREIGN KEY (Trainer_id) REFERENCES Trainer(id),
  

);

CREATE TABLE Kategorie_Kurs(
    id int Auto_Increment Primary Key,
    kategorie_id int not null,
    Kurs_id int not null,
    Foreign key (kategorie_id) references Kategorien(id),
    foreign key (Kurs_id) references Kurse(id)
);

-- Tabelle: Teilnehmer
CREATE TABLE Portalbenutzer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(30) not null,
    Benutzername VARCHAR(255) NOT NULL,
    email varchar(255) not null,
    Telefonnummer int not null,
    Geburtsdatum date not null,
    Passwort varchar(255)

);

-- Tabelle: Teilnahme (Viele-zu-Viele Beziehung zwischen Kurse und Teilnehmer)
CREATE TABLE Teilnahme (
    kurs_id INT not null,
    teilnehmer_id INT not null,
    bewertung INT CHECK (bewertung BETWEEN 1 AND 5) not null,
    kommentar varchar(255) not null,
    bewertungs_datum date not null,
    PRIMARY KEY (kurs_id, teilnehmer_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurse(id) ON DELETE CASCADE,
    FOREIGN KEY (teilnehmer_id) REFERENCES Portalbenutzer(id) ON DELETE CASCADE
);


CREATE TABLE Platform_Kurs (
    kurs_id INT NOT NULL,
    platform_id INT NOT NULL,
    PRIMARY KEY (kurs_id, platform_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurs(id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES Platform(id) ON DELETE CASCADE
);



