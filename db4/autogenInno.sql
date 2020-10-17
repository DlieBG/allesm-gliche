-- Parse::SQL::Dia          version 0.23                              
-- Documentation            http://search.cpan.org/dist/Parse-Dia-SQL/
-- Environment              Perl 5.030000, /usr/bin/perl              
-- Architecture             x86_64-linux-gnu-thread-multi             
-- Target Database          mysql-innodb                              
-- Input file               02 db4 RDM.dia                            
-- Generated at             Sat Oct 17 19:45:27 2020                  
-- Typemap for mysql-innodb not found in input file                   

-- get_constraints_drop 

-- get_permissions_drop 

-- get_view_drop

-- get_schema_drop
drop table if exists Person;
drop table if exists Konto;
drop table if exists Dienst;
drop table if exists Person Beziehung;
drop table if exists Beziehung;
drop table if exists Person Gruppe;
drop table if exists Gruppe;
drop table if exists Gegenstand;
drop table if exists Eigenschaft;
drop table if exists Ereignis;
drop table if exists Name;
drop table if exists Adresse;
drop table if exists Bemerkung;
drop table if exists Arbeit;

-- get_smallpackage_pre_sql 

-- get_schema_create
create table Person (
   PersonNr            INT         not null,
   Geburtsdatum        DATE                ,
   Geburtsort          VARCHAR(50)         ,
   Geschlecht          VARCHAR(50)         ,
   Staatsangehörigkeit VARCHAR(50)         ,
   Augenfarbe          VARCHAR(50)         ,
   Hautfarbe           VARCHAR(50)         ,
   PersonalausweisNr   VARCHAR(50)         ,
   Mutter              INT                 ,
   Vater               INT                 ,
   constraint pk_Person primary key (PersonNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Konto (
   KontoNr      INT          not null,
   Person       INT                  ,
   Dienst       INT                  ,
   Benutzername VARCHAR(50)          ,
   Passwort     VARCHAR(50)          ,
   Bemerkung    VARCHAR(255)         ,
   constraint pk_Konto primary key (KontoNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Dienst (
   DienstNr     INT          not null,
   Name         VARCHAR(50)          ,
   Website      VARCHAR(50)          ,
   Anmeldeseite VARCHAR(50)          ,
   Bemerkung    VARCHAR(255)         ,
   constraint pk_Dienst primary key (DienstNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Person Beziehung (
   Person    INT not null,
   Beziehung INT not null,
   constraint pk_Person Beziehung primary key (Person,Beziehung)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Beziehung (
   BeziehungNr INT          not null,
   Startdatum  DATE                 ,
   Enddatum    DATE                 ,
   Bemerkung   VARCHAR(255)         ,
   constraint pk_Beziehung primary key (BeziehungNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Person Gruppe (
   Person INT not null,
   Gruppe INT not null,
   constraint pk_Person Gruppe primary key (Person,Gruppe)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Gruppe (
   GruppeNr  INT          not null,
   Name      VARCHAR(50)          ,
   Bemerkung VARCHAR(255)         ,
   constraint pk_Gruppe primary key (GruppeNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Gegenstand (
   GegenstandNr INT          not null,
   Person       INT                  ,
   Gruppe       INT                  ,
   Name         VARCHAR(50)          ,
   Bemerkung    VARCHAR(255)         ,
   constraint pk_Gegenstand primary key (GegenstandNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Eigenschaft (
   EigenschaftNr INT          not null,
   Person        INT                  ,
   Name          VARCHAR(50)          ,
   Bemerkung     VARCHAR(255)         ,
   constraint pk_Eigenschaft primary key (EigenschaftNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Ereignis (
   EreignisNr INT          not null,
   Person     INT                  ,
   Datum      DATE                 ,
   Name       VARCHAR(50)          ,
   Bemerkung  VARCHAR(255)         ,
   constraint pk_Ereignis primary key (EreignisNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Name (
   NameNr     INT          not null,
   Person     INT                  ,
   Startdatum DATE                 ,
   Enddatum   DATE                 ,
   Name       VARCHAR(50)          ,
   Vorname    VARCHAR(50)          ,
   Bemerkung  VARCHAR(255)         ,
   constraint pk_Name primary key (NameNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Adresse (
   AdresseNr  INT          not null,
   Person     INT                  ,
   Startdatum DATE                 ,
   Enddatum   DATE                 ,
   Strasse    VARCHAR(50)          ,
   Hausnummer VARCHAR(50)          ,
   PLZ        VARCHAR(50)          ,
   Ort        VARCHAR(50)          ,
   Land       VARCHAR(50)          ,
   Bemerkung  VARCHAR(255)         ,
   constraint pk_Adresse primary key (AdresseNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Bemerkung (
   BemerkungNr INT          not null,
   Person      INT                  ,
   Name        VARCHAR(50)          ,
   Bemerkung   VARCHAR(255)         ,
   constraint pk_Bemerkung primary key (BemerkungNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Arbeit (
   ArbeitNr  INT          not null,
   Person    INT                  ,
   Stardatum DATE                 ,
   Enddatum  DATE                 ,
   Name      VARCHAR(50)          ,
   Bemerkung VARCHAR(255)         ,
   constraint pk_Arbeit primary key (ArbeitNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- get_view_create

-- get_permissions_create

-- get_inserts

-- get_smallpackage_post_sql

-- get_associations_create
