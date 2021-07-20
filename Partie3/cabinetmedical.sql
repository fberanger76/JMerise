#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: patients
#------------------------------------------------------------

CREATE TABLE patients(
        id              Int  Auto_increment  NOT NULL ,
        nom             Varchar (50) NOT NULL ,
        prenom          Varchar (50) NOT NULL ,
        dateDeNaissance Date NOT NULL
	,CONSTRAINT patients_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: specialites
#------------------------------------------------------------

CREATE TABLE specialites(
        id            Int  Auto_increment  NOT NULL ,
        nomSpecialite Varchar (50) NOT NULL
	,CONSTRAINT specialites_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: medecins
#------------------------------------------------------------

CREATE TABLE medecins(
        id             Int  Auto_increment  NOT NULL ,
        nom            Varchar (50) NOT NULL ,
        prenom         Varchar (50) NOT NULL ,
        mail           Varchar (50) NOT NULL ,
        id_specialites Int NOT NULL
	,CONSTRAINT medecins_PK PRIMARY KEY (id)

	,CONSTRAINT medecins_specialites_FK FOREIGN KEY (id_specialites) REFERENCES specialites(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rdv
#------------------------------------------------------------

CREATE TABLE rdv(
        id             Int  Auto_increment  NOT NULL ,
        date           Date NOT NULL ,
        creneauHoraire Time NOT NULL ,
        id_medecins    Int NOT NULL ,
        id_patients    Int NOT NULL
	,CONSTRAINT rdv_PK PRIMARY KEY (id)

	,CONSTRAINT rdv_medecins_FK FOREIGN KEY (id_medecins) REFERENCES medecins(id)
	,CONSTRAINT rdv_patients0_FK FOREIGN KEY (id_patients) REFERENCES patients(id)
)ENGINE=InnoDB;

USE `cabinet_medical`;
INSERT INTO `specialites` (`nomSpecialite`)
VALUES ('Généraliste'),
       ('Neurologue'),
       ('Oncologue');


INSERT INTO `medecins` (`nom`, `prenom`, `mail`, `id_specialites`)
VALUES ('Beranger', 'Franck', 'berangerfranck@gmail.com', '1'),
       ('Dupond', 'Pierre', 'dupondpierre@gmail.com', '2'),
       ('Durand', 'Jean', 'durandjean@gmail.com', '3'),
       ('Smith', 'John', 'smithjohn@gmail.com', '1'),
       ('Hello', 'World', 'helloworld@gmail.com', '2');

       INSERT INTO `patients` (`nom`, `prenom`, `dateDeNaissance`)
VALUES ('Fox','Kane','1990-03-12'),('Rhodes','Griffith','1946-11-17'),('Parrish','Harper','1984-01-03'),('Gillespie','Dennis','1986-11-08'),('Mcneil','Lunea','1953-11-28'),('Pittman','Jade','1959-05-28'),('Dudley','Tasha','1961-11-05'),('Jackson','Nero','1941-10-16'),('Joyner','Emerald','1975-07-22'),('Holmes','Colette','1995-11-11'),('Mcdaniel','Sylvester','2001-12-10'),('Hatfield','Regina','2014-12-25'),('Clay','Irma','1982-11-28'),('Bennett','Avram','1960-02-24'),('Richards','Yetta','1992-08-29'),('Conner','Dolan','2014-03-21'),('Fernandez','Guy','1949-03-13'),('Walter','Lila','1960-03-22'),('Summers','Madonna','2021-01-21'),('Compton','Austin','2000-12-22'),('Meadows','Xavier','2018-10-18'),('Adkins','Basil','1992-02-15'),('Pugh','Sybill','1963-08-29'),('Daniel','Montana','1980-12-31'),('Gomez','Samson','1945-01-21'),('Baldwin','Kaseem','1986-02-05'),('Sullivan','Elvis','1953-12-28'),('Wynn','Emily','2005-03-24'),('Santos','Zachary','1979-11-08'),('Gillespie','Summer','1989-08-15');

INSERT INTO `rdv` (`date`, `creneauHoraire`, `id_medecins`, `id_patients`)
VALUES ('2016-01-09', '09:00:00', '1', '1'),('2006-10-19', '10:00:00', '2', '2'),('2002-03-07', '11:00:00', '3', '3'),('2013-04-21', '12:00:00', '2', '4'),('2016-06-08', '16:00:00', '1', '5'),('2021-05-04', '17:30:00', '3', '6'),('2010-01-17', '13:00:00', '1', '7'),('2012-07-08', '10:15:00', '2', '8'),('2019-04-21', '15:45:00', '3', '9'),('2021-02-08', '14:45:00', '1', '10'),('2020-12-01', '10:00:00', '2', '11'),('2021-11-09', '09:30:00', '1', '12'),('2003-07-14', '11:20:00', '1', '13'),('2014-02-17', '16:00:00', '3', '14'),('2021-09-16', '12:00:00', '3', '15'),('2021-02-05', '17:20:00', '1', '16'),('2017-07-01', '10:00:00', '3', '17'),('2022-10-07', '08:30:00', '1', '18'),('2019-06-01', '14:00:00', '1', '19'),('2001-05-09', '18:15:00', '1', '20'),('2002-04-02', '10:30:00', '3', '21'),('2020-04-16', '15:00:00', '1', '22'),('2011-07-02', '18:45:00', '3', '23'),('2020-01-07', '10:40:00', '1', '24'),('2005-09-19', '11:45:00', '3', '25'),('2021-06-17', '17:30:00', '1', '26'),('2026-03-07', '09:00:00', '1', '27'),('2025-02-20', '14:45:00', '3', '28'),('2017-09-12', '10:00:00', '2', '29'),('2008-02-14', '16:00:00', '1', '30');

fonctionnalité 1:
SELECT `date`, `creneauHoraire`, `patients`.`nom` as `nomPatient`, `patients`.`prenom` as `prenomPatient`, `medecins`.`nom` as `nomMedecin`, `nomSpecialite`
FROM `rdv`
INNER JOIN `patients` ON `rdv`.id_patients = `patients`.id
LEFT JOIN `medecins` ON `rdv`.id_medecins = `medecins`.id
LEFT JOIN `specialites` ON `medecins`.id_specialites = `specialites`.id;

fonctionnalité 2:
UPDATE `rdv`
SET `id_medecins` = '4'
WHERE `id_medecins` = '1' && `id_patients` = '1';
UPDATE `rdv`
SET `id_medecins` = '5'
WHERE `id_medecins` = '1' && `id_patients` = '7';
UPDATE `rdv`
SET `id_medecins` = '4'
WHERE `id_medecins` = '1' && `id_patients` = '10';
UPDATE `rdv`
SET `id_medecins` = '5'
WHERE `id_medecins` = '1' && `id_patients` = '12';
UPDATE `rdv`
SET `id_medecins` = '4'
WHERE `id_medecins` = '1' && `id_patients` = '13';

SELECT `medecins`.`nom` as `nomMedecin`, `date`, `creneauHoraire`, `patients`.`nom` as `nomPatient`, `patients`.`prenom` as `prenomPatient`
FROM `rdv`
INNER JOIN `medecins` ON `rdv`.id_medecins = (`medecins`.id = '1')
INNER JOIN `patients` ON `rdv`.id_patients = `patients`.id;

fonctionnalité 3:
SELECT `patients`.`nom` as `nomPatient`, `patients`.`prenom` as `prenomPatient`, `nomSpecialite`, `medecins`.`nom` as `nomMedecin`, `medecins`.`prenom` as `prenomMedecin`, `date`, `creneauHoraire` 
FROM `rdv`
INNER JOIN `patients` ON `rdv`.id_patients = (`patients`.id = '15')
INNER JOIN `medecins` ON `rdv`.id_medecins = `medecins`.id
INNER JOIN `specialites` ON `medecins`.id_specialites = `specialites`.id;

