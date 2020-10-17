use ultimatedb

drop table if exists Arbeit;
drop table if exists Bemerkung;
drop table if exists Adresse;
drop table if exists Name;
drop table if exists Ereignis;
drop table if exists Eigenschaft;
drop table if exists Gegenstand;
drop table if exists Person_Gruppe;
drop table if exists Gruppe;
drop table if exists Person_Beziehung;
drop table if exists Beziehung;
drop table if exists Konto;
drop table if exists Dienst;
drop table if exists Person;


create table Person (
   PersonNr            INT NOT NULL AUTO_INCREMENT,
   Geburtsdatum        DATE,
   Geburtsort          VARCHAR(50),
   Geschlecht          VARCHAR(50),
   Staatsangehörigkeit VARCHAR(50),
   Augenfarbe          VARCHAR(50),
   Hautfarbe           VARCHAR(50),
   PersonalausweisNr   VARCHAR(50),
   Mutter              INT,
   Vater               INT,
   PRIMARY KEY(PersonNr)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Dienst (
   DienstNr     INT NOT NULL AUTO_INCREMENT,
   Name         VARCHAR(50),
   Website      VARCHAR(50),
   Anmeldeseite VARCHAR(50),
   Bemerkung    VARCHAR(255),
   PRIMARY KEY(DienstNr)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Konto (
   KontoNr      INT NOT NULL AUTO_INCREMENT,
   Person       INT,
   Dienst       INT,
   Benutzername VARCHAR(50),
   Passwort     VARCHAR(50),
   Bemerkung    VARCHAR(255),
   PRIMARY KEY(KontoNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE,
   FOREIGN KEY(Dienst) REFERENCES Dienst (DienstNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Beziehung (
   BeziehungNr INT NOT NULL AUTO_INCREMENT,
   Startdatum  DATE,
   Enddatum    DATE,
   Bemerkung   VARCHAR(255),
   PRIMARY KEY(BeziehungNr)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Person_Beziehung (
   Person    INT not null,
   Beziehung INT not null,
   PRIMARY KEY(Person,Beziehung),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE,
   FOREIGN KEY(Beziehung) REFERENCES Beziehung (BeziehungNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Gruppe (
   GruppeNr  INT NOT NULL AUTO_INCREMENT,
   Name      VARCHAR(50),
   Bemerkung VARCHAR(255),
   PRIMARY KEY(GruppeNr)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Person_Gruppe (
   Person INT not null,
   Gruppe INT not null,
   PRIMARY KEY(Person,Gruppe),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE,
   FOREIGN KEY(Gruppe) REFERENCES Gruppe (GruppeNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Gegenstand (
   GegenstandNr INT NOT NULL AUTO_INCREMENT,
   Person       INT,
   Gruppe       INT,
   Name         VARCHAR(50),
   Bemerkung    VARCHAR(255),
   PRIMARY KEY(GegenstandNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE,
   FOREIGN KEY(Gruppe) REFERENCES Gruppe (GruppeNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Eigenschaft (
   EigenschaftNr INT NOT NULL AUTO_INCREMENT,
   Person        INT,
   Name          VARCHAR(50),
   Bemerkung     VARCHAR(255),
   PRIMARY KEY(EigenschaftNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Ereignis (
   EreignisNr INT NOT NULL AUTO_INCREMENT,
   Person     INT,
   Datum      DATE,
   Name       VARCHAR(50),
   Bemerkung  VARCHAR(255),
   PRIMARY KEY(EreignisNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Name (
   NameNr     INT NOT NULL AUTO_INCREMENT,
   Person     INT,
   Startdatum DATE,
   Enddatum   DATE,
   Name       VARCHAR(50),
   Vorname    VARCHAR(50),
   Bemerkung  VARCHAR(255),
   PRIMARY KEY(NameNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Adresse (
   AdresseNr  INT NOT NULL AUTO_INCREMENT,
   Person     INT,
   Startdatum DATE,
   Enddatum   DATE,
   Strasse    VARCHAR(50),
   Hausnummer VARCHAR(50),
   PLZ        VARCHAR(50),
   Ort        VARCHAR(50),
   Land       VARCHAR(50),
   Bemerkung  VARCHAR(255),
   PRIMARY KEY(AdresseNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Bemerkung (
   BemerkungNr INT NOT NULL AUTO_INCREMENT,
   Person      INT,
   Name        VARCHAR(50),
   Bemerkung   VARCHAR(255),
   PRIMARY KEY(BemerkungNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Arbeit (
   ArbeitNr  INT NOT NULL AUTO_INCREMENT,
   Person    INT,
   Stardatum DATE,
   Enddatum  DATE,
   Name      VARCHAR(50),
   Bemerkung VARCHAR(255),
   PRIMARY KEY(ArbeitNr),
   FOREIGN KEY(Person) REFERENCES Person (PersonNr) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
