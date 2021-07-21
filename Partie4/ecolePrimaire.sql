#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: eleves
#------------------------------------------------------------

CREATE TABLE eleves(
        id     Int  Auto_increment  NOT NULL ,
        nom    Varchar (50) NOT NULL ,
        prenom Varchar (50) NOT NULL ,
        classe Varchar (50) NOT NULL
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

