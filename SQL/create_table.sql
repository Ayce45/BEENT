#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Enseignant
#------------------------------------------------------------

CREATE TABLE Enseignant(
        id     Int  Auto_increment  NOT NULL ,
        nom    Varchar (150) ,
        prenom Varchar (150) ,
        rue    Varchar (150) NOT NULL ,
        cp     Varchar (5) NOT NULL ,
        ville  Varchar (75) NOT NULL ,
        tel    Varchar (15) ,
        email  Varchar (150)
	,CONSTRAINT Enseignant_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Salle
#------------------------------------------------------------

CREATE TABLE Salle(
        id       Int  Auto_increment  NOT NULL ,
        code     Varchar (150) ,
        capacite Int ,
        pc       Bool
	,CONSTRAINT Salle_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Filiere
#------------------------------------------------------------

CREATE TABLE Filiere(
        id      Int  Auto_increment  NOT NULL ,
        libelle Varchar (150)
	,CONSTRAINT Filiere_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Classe
#------------------------------------------------------------

CREATE TABLE Classe(
        id         Int  Auto_increment  NOT NULL ,
        code       Int ,
        id_Filiere Int NOT NULL
	,CONSTRAINT Classe_PK PRIMARY KEY (id)

	,CONSTRAINT Classe_Filiere_FK FOREIGN KEY (id_Filiere) REFERENCES Filiere(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Groupe
#------------------------------------------------------------

CREATE TABLE Groupe(
        id        Int  Auto_increment  NOT NULL ,
        code      Int ,
        capacite  Int ,
        id_Classe Int NOT NULL
	,CONSTRAINT Groupe_PK PRIMARY KEY (id)

	,CONSTRAINT Groupe_Classe_FK FOREIGN KEY (id_Classe) REFERENCES Classe(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Matiere
#------------------------------------------------------------

CREATE TABLE Matiere(
        id      Int  Auto_increment  NOT NULL ,
        libelle Varchar (150) NOT NULL
	,CONSTRAINT Matiere_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Annee
#------------------------------------------------------------

CREATE TABLE Annee(
        id   Int  Auto_increment  NOT NULL ,
        code Varchar (4) NOT NULL
	,CONSTRAINT Annee_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Semestre
#------------------------------------------------------------

CREATE TABLE Semestre(
        id       Int  Auto_increment  NOT NULL ,
        code     Int NOT NULL ,
        id_Annee Int NOT NULL
	,CONSTRAINT Semestre_PK PRIMARY KEY (id)

	,CONSTRAINT Semestre_Annee_FK FOREIGN KEY (id_Annee) REFERENCES Annee(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cours
#------------------------------------------------------------

CREATE TABLE Cours(
        id         Int NOT NULL ,
        id_Salle   Int NOT NULL ,
        id_Matiere Int NOT NULL ,
        id_Groupe  Int NOT NULL ,
        debut      Date ,
        fin        Date
	,CONSTRAINT Cours_PK PRIMARY KEY (id,id_Salle,id_Matiere,id_Groupe)

	,CONSTRAINT Cours_Enseignant_FK FOREIGN KEY (id) REFERENCES Enseignant(id)
	,CONSTRAINT Cours_Salle0_FK FOREIGN KEY (id_Salle) REFERENCES Salle(id)
	,CONSTRAINT Cours_Matiere1_FK FOREIGN KEY (id_Matiere) REFERENCES Matiere(id)
	,CONSTRAINT Cours_Groupe2_FK FOREIGN KEY (id_Groupe) REFERENCES Groupe(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Enseignant_Matiere
#------------------------------------------------------------

CREATE TABLE Enseignant_Matiere(
        id            Int NOT NULL ,
        id_Enseignant Int NOT NULL
	,CONSTRAINT Enseignant_Matiere_PK PRIMARY KEY (id,id_Enseignant)

	,CONSTRAINT Enseignant_Matiere_Matiere_FK FOREIGN KEY (id) REFERENCES Matiere(id)
	,CONSTRAINT Enseignant_Matiere_Enseignant0_FK FOREIGN KEY (id_Enseignant) REFERENCES Enseignant(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Matiere_Semestre
#------------------------------------------------------------

CREATE TABLE Matiere_Semestre(
        id          Int NOT NULL ,
        id_Semestre Int NOT NULL ,
        id_Filiere  Int NOT NULL ,
        heure       Int NOT NULL
	,CONSTRAINT Matiere_Semestre_PK PRIMARY KEY (id,id_Semestre,id_Filiere)

	,CONSTRAINT Matiere_Semestre_Matiere_FK FOREIGN KEY (id) REFERENCES Matiere(id)
	,CONSTRAINT Matiere_Semestre_Semestre0_FK FOREIGN KEY (id_Semestre) REFERENCES Semestre(id)
	,CONSTRAINT Matiere_Semestre_Filiere1_FK FOREIGN KEY (id_Filiere) REFERENCES Filiere(id)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: Type
#------------------------------------------------------------

CREATE TABLE Type(
        id      Int  Auto_increment  NOT NULL ,
        libelle Varchar (4) NOT NULL
	,CONSTRAINT Type_PK PRIMARY KEY (id)
)ENGINE=InnoDB;