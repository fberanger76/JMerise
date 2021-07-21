#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: eleves
#------------------------------------------------------------

CREATE TABLE eleves(
        id     Int  Auto_increment  NOT NULL ,
        nom    Varchar (50) NOT NULL ,
        prenom Varchar (50) NOT NULL
	,CONSTRAINT eleves_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: matieres
#------------------------------------------------------------

CREATE TABLE matieres(
        id      Int  Auto_increment  NOT NULL ,
        matiere Varchar (50) NOT NULL
	,CONSTRAINT matieres_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: notes
#------------------------------------------------------------

CREATE TABLE notes(
        id          Int  Auto_increment  NOT NULL ,
        notes       Int NOT NULL ,
        id_eleves   Int NOT NULL ,
        id_matieres Int NOT NULL
	,CONSTRAINT notes_PK PRIMARY KEY (id)

	,CONSTRAINT notes_eleves_FK FOREIGN KEY (id_eleves) REFERENCES eleves(id)
	,CONSTRAINT notes_matieres0_FK FOREIGN KEY (id_matieres) REFERENCES matieres(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: prof
#------------------------------------------------------------

CREATE TABLE prof(
        id          Int  Auto_increment  NOT NULL ,
        nom         Varchar (50) NOT NULL ,
        prenom      Varchar (50) NOT NULL ,
        email       Varchar (50) NOT NULL ,
        id_matieres Int
	,CONSTRAINT prof_PK PRIMARY KEY (id)

	,CONSTRAINT prof_matieres_FK FOREIGN KEY (id_matieres) REFERENCES matieres(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: classes
#------------------------------------------------------------

CREATE TABLE classes(
        id        Int  Auto_increment  NOT NULL ,
        classe    Varchar (50) NOT NULL ,
        id_prof   Int NOT NULL ,
        id_eleves Int NOT NULL
	,CONSTRAINT classes_PK PRIMARY KEY (id)

	,CONSTRAINT classes_prof_FK FOREIGN KEY (id_prof) REFERENCES prof(id)
	,CONSTRAINT classes_eleves0_FK FOREIGN KEY (id_eleves) REFERENCES eleves(id)
)ENGINE=InnoDB;

USE `ecole_primaire`;
INSERT INTO `matieres` (`matiere`)
VALUES ('Maths'),
       ('Sport'),
       ('Francais'),
       ('Anglais'),
       ('Histoire'),
       ('Geographie');

INSERT INTO `eleves` (`nom`, `prenom`)
VALUES ('Holloway','Destiny'),('Lancaster','Kylie'),('Moss','Timon'),('William','Sheila'),('Gamble','Ria'),('Nixon','Irma'),('Rose','Drew'),('Dorsey','Barrett'),('Hanson','Amal'),('Frank','Amery'),('Kirk','Harriet'),('Mack','Patrick'),('Rush','Cooper'),('Nicholson','Ryder'),('Dotson','Jakeem'),('Hoffman','Stuart'),('Waters','MacKenzie'),('Tillman','Amber'),('Bolton','Imogene'),('Cross','Kitra'),('Hansen','Emery'),('Crawford','Glenna'),('Decker','Shannon'),('Kelly','Mark'),('Sanford','Maisie'),('Jarvis','Venus'),('Rocha','Avye'),('Valenzuela','Kadeem'),('Hall','Ariel'),('Shepherd','Dieter');

INSERT INTO `notes` (`notes`, `id_eleves`, `id_matieres`)
VALUES ('15','24','3'),('13','14','6'),('2','15','2'),('12','1','4'),('12','26','1'),('18','20','5'),('13','16','5'),('1','29','5'),('14','21','4'),('15','3','6'),('0','24','6'),('18','16','4'),('20','7','2'),('12','1','3'),('10','21','4'),('8','21','3'),('7','25','2'),('5','19','2'),('1','11','3'),('9','12','4'),('19','1','2'),('6','4','4'),('17','8','6'),('8','29','3'),('4','10','1'),('9','20','4'),('11','17','4'),('6','21','4'),('8','25','6'),('3','22','5'),('11','24','5'),('11','11','6'),('18','3','3'),('9','14','3'),('15','26','5'),('7','19','2'),('1','18','1'),('17','8','4'),('14','21','1'),('9','14','1'),('9','14','5'),('16','27','2'),('11','22','5'),('18','29','6'),('16','16','4'),('19','15','1'),('11','16','5'),('17','2','4'),('13','4','1'),('14','25','4');

INSERT INTO `prof`(`nom`, `prenom`, `email`, `id_matieres`)
VALUES ('Simon','Lillian','amet.risus@lorem.co.uk','2'),('Workman','Emery','non.lobortis.quis@dolorsit.ca','3'),('Owen','Lila','ac@duinec.org','6'),('Haynes','Sophia','commodo.hendrerit.Donec@vulputatevelit.ca','4'),('Parks','Tyrone','Fusce.feugiat.Lorem@Utsagittislobortis.net','6'),('Morgan','Howard','Integer.vitae.nibh@ridiculus.org','4'),('Scott','Ann','metus@aliquetlibero.org','1');

INSERT INTO `classes` (`classe`, `id_prof`, `id_eleves`)
VALUES ('CP','5','16'),('CP','2','25'),('CP','2','20'),('CP','5','21'),('CP','6','17'),('CP','6','2'),
       ('CE1','1','1'),('CE1','3','3'),('CE1','3','4'),('CE1','1','5'),('CE1','4','12'),('CE1','7','30'),
       ('CE2','1','6'),('CE2','2','7'),('CE2','3','11'),('CE2','4','18'),('CE2','5','19'),('CE2','6','29'),
       ('CM1','7','8'),('CM1','7','9'),('CM1','1','10'),('CM1','4','13'),('CM1','5','14'),('CM1','6','15'),
       ('CM2','4','22'),('CM2','4','23'),('CM2','2','24'),('CM2','3','26'),('CM2','4','27'),('CM2','5','28');

UPDATE `prof`
SET `id_matieres` = '5'
WHERE `id_matieres` = '6' && `nom` = 'Parks';

Fonctionnalité 1:
SELECT `nom`, `prenom`, `notes`, `matiere`
FROM `notes`
LEFT JOIN `eleves` ON `notes`.id_eleves = `eleves`.id
LEFT JOIN `matieres` ON `notes`.id_matieres = `matieres`.id;