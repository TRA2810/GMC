/*
SALLE_CINEMA (nom_salle, adresse)

FILM (visa, titre, r�alisateur, ann�e_scolaire)

PROJECTION (#nom_salle, #visa)

SPECTATEUR (num�ro, nom, pr�nom, date_naiss, cat_soc, #visa)
*/
CREATE DATABASE cin�ma ;



CREATE TABLE salle_cin�ma (
       nom_salle VARCHAR(10) PRIMARY KEY ,
	   adresse VARCHAR(30) NOT NULL
);

CREATE TABLE film (
       visa VARCHAR(30) PRIMARY KEY ,
	   titre VARCHAR(30) NOT NULL ,
	   r�alisateur VARCHAR(30) NOT NULL ,
	   ann�e_sortie DATE NOT NULL ,
);

CREATE TABLE projection (
       nom_salle VARCHAR(10) FOREIGN KEY REFERENCES  salle_cin�ma (nom_salle) NOT NULL ,
	   visa VARCHAR(30) FOREIGN KEY REFERENCES  film (visa) NOT NULL
);


CREATE TABLE spectateur (
       num�ro INT PRIMARY KEY ,
	   nom VARCHAR(30) ,
	   pr�nom VARCHAR(30) ,
	   date_nais DATE ,
	   cat_soc VARCHAR(30) ,
	   visa VARCHAR(30) FOREIGN KEY REFERENCES  film (visa) NOT NULL
);