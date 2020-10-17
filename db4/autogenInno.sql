-- Parse::SQL::Dia          version 0.23                              
-- Documentation            http://search.cpan.org/dist/Parse-Dia-SQL/
-- Environment              Perl 5.030000, /usr/bin/perl              
-- Architecture             x86_64-linux-gnu-thread-multi             
-- Target Database          mysql-innodb                              
-- Input file               02 db4 RDM.dia                            
-- Generated at             Sat Oct 17 18:39:38 2020                  
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
   PersonNr             not null,
   Geburtsdatum                 ,
   Geburtsort                   ,
   Geschlecht                   ,
   Staatsangehörigkeit          ,
   Augenfarbe                   ,
   Hautfarbe                    ,
   PersonalausweisNr            ,
   Mutter                       ,
   Vater                        ,
   constraint pk_Person primary key (PersonNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Konto (
   KontoNr       not null,
   Person                ,
   Dienst                ,
   Benutzername          ,
   Passwort              ,
   Bemerkung             ,
   constraint pk_Konto primary key (KontoNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Dienst (
   DienstNr      not null,
   Name                  ,
   Website               ,
   Anmeldeseite          ,
   Bemerkung             ,
   constraint pk_Dienst primary key (DienstNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Person Beziehung (
   PersonNr     not null,
   BeziehungNr  not null,
   constraint pk_Person Beziehung primary key (PersonNr,BeziehungNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Beziehung (
   BeziehungNr  not null,
   Startdatum           ,
   Enddatum             ,
   Bemerkung            ,
   constraint pk_Beziehung primary key (BeziehungNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Person Gruppe (
   PersonNr  not null,
   GruppeNr  not null,
   constraint pk_Person Gruppe primary key (PersonNr,GruppeNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Gruppe (
   GruppeNr   not null,
   Name               ,
   Bemerkung          ,
   constraint pk_Gruppe primary key (GruppeNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Gegenstand (
   GegenstandNr  not null,
   PersonNr              ,
   GruppeNr              ,
   Name                  ,
   Bemerkung             ,
   constraint pk_Gegenstand primary key (GegenstandNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Eigenschaft (
   EigenschaftNr  not null,
   PersonNr               ,
   Name                   ,
   Bemerkung              ,
   constraint pk_Eigenschaft primary key (EigenschaftNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Ereignis (
   EreignisNr  not null,
   Person              ,
   Datum               ,
   Name                ,
   Bemerkung           ,
   constraint pk_Ereignis primary key (EreignisNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Name (
   NameNr      not null,
   PersonNr            ,
   Startdatum          ,
   Enddatum            ,
   Name                ,
   Vorname             ,
   Bemerkung           ,
   constraint pk_Name primary key (NameNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Adresse (
   AdresseNr   not null,
   PersonNr            ,
   Startdatum          ,
   Enddatum            ,
   Strasse             ,
   Hausnummer          ,
   PLZ                 ,
   Ort                 ,
   Land                ,
   Bemerkung           ,
   constraint pk_Adresse primary key (AdresseNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Bemerkung (
   BemerkungNr  not null,
   PersonNr             ,
   Name                 ,
   Bemerkung            ,
   constraint pk_Bemerkung primary key (BemerkungNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table Arbeit (
   ArbeitNr   not null,
   Person             ,
   Stardatum          ,
   Enddatum           ,
   Name               ,
   Bemerkung          ,
   constraint pk_Arbeit primary key (ArbeitNr)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- get_view_create

-- get_permissions_create

-- get_inserts

-- get_smallpackage_post_sql

-- get_associations_create
