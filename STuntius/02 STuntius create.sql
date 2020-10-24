USE STuntius;

DROP TABLE IF EXISTS Nachricht;
DROP TABLE IF EXISTS Benutzer;


CREATE TABLE Benutzer(
    BenutzerNr INT NOT NULL AUTO_INCREMENT,
    Benutzername VARCHAR(15) NOT NULL,
    Passwort CHAR(32) NOT NULL,
    vollerName VARCHAR(50),
    Info VARCHAR(50),
    zuletztOnline TIMESTAMP,
    Profilbild VARCHAR(50),
    PRIMARY KEY(BenutzerNr)
);

CREATE TABLE Nachricht(
    NachrichtNr INT NOT NULL AUTO_INCREMENT,
    Sender INT NOT NULL,
    Empfaenger INT NOT NULL,
    Zeitpunkt TIMESTAMP,
    Inhalt VARCHAR(255),
    PRIMARY KEY(NachrichtNr),
    FOREIGN KEY(Sender) REFERENCES Benutzer(BenutzerNr) ON UPDATE CASCADE,
    FOREIGN KEY(Empfaenger) REFERENCES Benutzer(BenutzerNr) ON UPDATE CASCADE
);