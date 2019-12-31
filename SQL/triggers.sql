-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 31 déc. 2019 à 10:39
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  beent
--

--
-- Déclencheurs cours
--
DELIMITER $$
CREATE TRIGGER `SalleOccupe` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
DECLARE debutT DATETIME;
DECLARE finT DATETIME;
DECLARE done BOOL DEFAULT FALSE;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Salle = new.id_Salle;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
   OPEN C1;
   read_loop: LOOP
   	FETCH C1 INTO debutT,finT;
    	IF done THEN
  	  	CLOSE C1;
             	LEAVE read_loop;
        END IF;
   
	if new.debut>=debutT  and new.debut<finT then
           signal sqlstate '20000' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
    end LOOP;
    
     if new.fin>debutT  and new.fin<=finT then
           signal sqlstate '20001' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
    
    if new.debut<=debutT  and new.fin>=finT then
           signal sqlstate '20002' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `capaciteSalle` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
DECLARE capaciteSalle INTEGER;
DECLARE capaciteGroupe INTEGER;
	select capacite into capaciteSalle from Salle where id = new.id_Salle;
	select capacite into capaciteGroupe from Groupe where id=new.id_Groupe;
	if capaciteSalle<capaciteGroupe then
		signal sqlstate '20010' set message_text = 'Salle trop petite pour la taille du groupe';
	end if;
End
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `coursTP` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
DECLARE libelleType VARCHAR(2);
DECLARE pcSalle INTEGER;
	select libelle into libelleType from Type WHERE id = new.id_Type ;
	select pc into pcSalle from Salle where id = new.id_Salle;
	if (pcSalle=0 and libelleType = 'TP') then
		signal sqlstate '20011' set message_text = 'Salle non adapté pour un TP' ;
	end if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `groupeOccupe` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
DECLARE debutT DATETIME;
DECLARE finT DATETIME;
DECLARE done BOOL DEFAULT FALSE;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Groupe = new.id_Groupe;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
   OPEN C1;
   read_loop: LOOP
   	FETCH C1 INTO debutT,finT;
    	IF done THEN
  	  	CLOSE C1;
            	LEAVE read_loop;
        END IF;
   
	if new.debut>=debutT  and new.debut<finT then
           signal sqlstate '20001' set message_text = 'Groupe déjà programmé sur un autre cours';     
	end if;
    end LOOP;
    
     if new.fin>debutT  and new.fin<=finT then
           signal sqlstate '20002' set message_text = 'Groupe déjà programmé sur un autre cours';     
	end if;
    
    if new.fin<=debutT  and new.fin>=finT then
           signal sqlstate '20003' set message_text = 'Groupe déjà programmé sur un autre cours';     
	end if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `profOccupe` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN
DECLARE debutT DATETIME;
DECLARE finT DATETIME;
DECLARE done BOOL DEFAULT FALSE;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Enseignant = new.id_Enseignant;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;
   OPEN C1;
   read_loop: LOOP
   	FETCH C1 INTO debutT,finT;
    	IF done THEN
  	  	CLOSE C1;
             	LEAVE read_loop;
        END IF;
	if new.debut>=debutT  and new.debut<finT then
           signal sqlstate '20001' set message_text = 'Enseignant déjà programmé sur un autre cours';     
	end if;
    end LOOP;
    
     if new.fin>debutT  and new.fin<=finT then
           signal sqlstate '20002' set message_text = 'Enseignant déjà programmé sur un autre cours';     
	end if;
    
    if new.fin<=debutT  and new.fin>=finT then
           signal sqlstate '20003' set message_text = 'Enseignant déjà programmé sur un autre cours';     
	end if;
     
END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
