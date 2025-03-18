/*
SALLE_CINEMA (nom_salle, adresse)

FILM (visa, titre, réalisateur, année_scolaire)

PROJECTION (#nom_salle, #visa)

SPECTATEUR (numéro, nom, prénom, date_naiss, cat_soc, #visa)
*/
CREATE DATABASE cinéma ;



CREATE TABLE salle_cinéma (
       nom_salle VARCHAR(10) PRIMARY KEY ,
	   adresse VARCHAR(30) NOT NULL
);

CREATE TABLE film (
       visa VARCHAR(30) PRIMARY KEY ,
	   titre VARCHAR(30) NOT NULL ,
	   réalisateur VARCHAR(30) NOT NULL ,
	   année_sortie DATE NOT NULL ,
);

CREATE TABLE projection (
       nom_salle VARCHAR(10) FOREIGN KEY REFERENCES  salle_cinéma (nom_salle) NOT NULL ,
	   visa VARCHAR(30) FOREIGN KEY REFERENCES  film (visa) NOT NULL
);


CREATE TABLE spectateur (
       numéro INT PRIMARY KEY ,
	   nom VARCHAR(30) ,
	   prénom VARCHAR(30) ,
	   date_nais DATE ,
	   cat_soc VARCHAR(30) ,
	   visa VARCHAR(30) FOREIGN KEY REFERENCES  film (visa) NOT NULL
);