USE db4;

DROP TABLE IF EXISTS Konto;
DROP TABLE IF EXISTS Dienst;
DROP TABLE IF EXISTS Person_Beziehung;
DROP TABLE IF EXISTS Beziehung;
DROP TABLE IF EXISTS Gegenstand;
DROP TABLE IF EXISTS Person_Gruppe;
DROP TABLE IF EXISTS Gruppe;
DROP TABLE IF EXISTS Kontaktinfo;
DROP TABLE IF EXISTS Bemerkung;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Name;
DROP TABLE IF EXISTS Person_Ereignis;
DROP TABLE IF EXISTS Ereignis;
DROP TABLE IF EXISTS Eigenschaft;
DROP TABLE IF EXISTS Arbeit;
DROP TABLE IF EXISTS Standort;
DROP TABLE IF EXISTS Person;


CREATE TABLE IF NOT EXISTS Person(
    PersonNr INT NOT NULL AUTO_INCREMENT,
    Bezeichnung VARCHAR(50),
    Geburtsdatum DATE,
    Geburtsort VARCHAR(50),
    Geschlecht VARCHAR(50),
    Staatsangehoerigkeit VARCHAR(50),
    Augenfarbe VARCHAR(50),
    Hautfarbe VARCHAR(50),
    PersonalausweisNr VARCHAR(50),
    Mutter INT,
    Vater INT,
    PRIMARY KEY(PersonNr)
);

CREATE TABLE IF NOT EXISTS Standort(
    StandortNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Zeit TIMESTAMP,
    Laenge FLOAT,
    Breite FLOAT,
    PRIMARY KEY(StandortNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Arbeit(
    ArbeitNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Startdatum DATE,
    Enddatum DATE,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(ArbeitNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Eigenschaft(
    EigenschaftNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(EigenschaftNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Ereignis(
    EreignisNr INT NOT NULL AUTO_INCREMENT,
    Datum DATE,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(EreignisNr)
);

CREATE TABLE IF NOT EXISTS Person_Ereignis(
    Person INT NOT NULL,
    Ereignis INT NOT NULL,
    PRIMARY KEY(Person, Ereignis),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE,
    FOREIGN KEY(Ereignis) REFERENCES Ereignis(EreignisNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Name(
    NameNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Startdatum DATE,
    Enddatum DATE,
    Name VARCHAR(50),
    Vorname VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(NameNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Adresse(
    AdresseNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Startdatum DATE,
    Enddatum DATE,
    Strasse VARCHAR(50),
    Hausnummer VARCHAR(50),
    PLZ VARCHAR(50),
    Ort VARCHAR(50),
    Land VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(AdresseNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Bemerkung(
    BemerkungNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(BemerkungNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Kontaktinfo(
    KontaktinfoNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(KontaktinfoNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Gruppe(
    GruppeNr INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(GruppeNr)
);

CREATE TABLE IF NOT EXISTS Person_Gruppe(
    Person INT NOT NULL,
    Gruppe INT NOT NULL,
    PRIMARY KEY(Person, Gruppe),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE,
    FOREIGN KEY(Gruppe) REFERENCES Gruppe(GruppeNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Gegenstand(
    GegenstandNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Gruppe INT,
    Name VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(GegenstandNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE,
    FOREIGN KEY(Gruppe) REFERENCES Gruppe(GruppeNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Beziehung(
    BeziehungNr INT NOT NULL AUTO_INCREMENT,
    Startdatun DATE,
    Enddatum DATE,
    Bemerkung VARCHAR(255),
    PRIMARY KEY(BeziehungNr)
);

CREATE TABLE IF NOT EXISTS Person_Beziehung(
    Person INT NOT NULL,
    Beziehung INT NOT NULL,
    PRIMARY KEY(Person, Beziehung),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE,
    FOREIGN KEY(Beziehung) REFERENCES Beziehung(BeziehungNr) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Dienst(
    DienstNr INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50),
    Website VARCHAR(50),
    Anmeldeseite VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(DienstNr)
);

CREATE TABLE IF NOT EXISTS Konto(
    KontoNr INT NOT NULL AUTO_INCREMENT,
    Person INT,
    Dienst INT,
    Benutzername VARCHAR(50),
    Passwort VARCHAR(50),
    Bemerkung VARCHAR(255),
    PRIMARY KEY(KontoNr),
    FOREIGN KEY(Person) REFERENCES Person(PersonNr) ON UPDATE CASCADE,
    FOREIGN KEY(Dienst) REFERENCES Dienst(DienstNr) ON UPDATE CASCADE
);