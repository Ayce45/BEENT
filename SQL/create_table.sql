-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  sam. 07 déc. 2019 à 20:16
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `beent`
--

-- --------------------------------------------------------

--
-- Structure de la table `Annee`
--

CREATE TABLE `Annee` (
  `id` int(11) NOT NULL,
  `code` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Classe`
--

CREATE TABLE `Classe` (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `id_Filiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Cours`
--

CREATE TABLE `Cours` (
  `id` int(11) NOT NULL,
  `id_Enseignant` int(11) NOT NULL,
  `id_Salle` int(11) NOT NULL,
  `id_Matiere` int(11) NOT NULL,
  `id_Groupe` int(11) NOT NULL,
  `id_Type` int(11) NOT NULL,
  `debut` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déclencheurs `Cours`
--
DELIMITER $$
CREATE TRIGGER `SalleOccupe` BEFORE INSERT ON `Cours` FOR EACH ROW BEGIN
DECLARE debut DATETIME;
DECLARE fin DATETIME;
DECLARE C1 CURSOR FOR SELECT debut,fin FROM Cours where id_Salle = new.id_Salle;
   OPEN C1;
   FETCH C1 INTO debut,fin;
	if new.debut>=debut  and new.debut<fin then
           signal sqlstate '20000' set message_text = 'Salle déja prise dans la tranche d horaire demandé!';     
	end if;
     CLOSE C1;
End
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `Enseignant`
--

CREATE TABLE `Enseignant` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `prenom` varchar(150) DEFAULT NULL,
  `rue` varchar(150) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(75) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Enseignant_Matiere`
--

CREATE TABLE `Enseignant_Matiere` (
  `id` int(11) NOT NULL,
  `id_Enseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Filiere`
--

CREATE TABLE `Filiere` (
  `id` int(11) NOT NULL,
  `libelle` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Groupe`
--

CREATE TABLE `Groupe` (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `id_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Matiere`
--

CREATE TABLE `Matiere` (
  `id` int(11) NOT NULL,
  `libelle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Matiere_Semestre`
--

CREATE TABLE `Matiere_Semestre` (
  `id` int(11) NOT NULL,
  `id_Semestre` int(11) NOT NULL,
  `id_Filiere` int(11) NOT NULL,
  `id_Type` int(11) NOT NULL,
  `heure` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Salle`
--

CREATE TABLE `Salle` (
  `id` int(11) NOT NULL,
  `code` varchar(150) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `pc` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Semestre`
--

CREATE TABLE `Semestre` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `id_Annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Type`
--

CREATE TABLE `Type` (
  `id` int(11) NOT NULL,
  `libelle` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Annee`
--
ALTER TABLE `Annee`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Classe_Filiere_FK` (`id_Filiere`);

--
-- Index pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cours_Enseignant_FK` (`id_Enseignant`),
  ADD KEY `Cours_Salle0_FK` (`id_Salle`),
  ADD KEY `Cours_Matiere1_FK` (`id_Matiere`),
  ADD KEY `Cours_Groupe2_FK` (`id_Groupe`),
  ADD KEY `Cours_Type3_FK` (`id_Type`);

--
-- Index pour la table `Enseignant`
--
ALTER TABLE `Enseignant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Enseignant_Matiere`
--
ALTER TABLE `Enseignant_Matiere`
  ADD PRIMARY KEY (`id`,`id_Enseignant`),
  ADD KEY `Enseignant_Matiere_Enseignant0_FK` (`id_Enseignant`);

--
-- Index pour la table `Filiere`
--
ALTER TABLE `Filiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Groupe`
--
ALTER TABLE `Groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Groupe_Classe_FK` (`id_Classe`);

--
-- Index pour la table `Matiere`
--
ALTER TABLE `Matiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Matiere_Semestre`
--
ALTER TABLE `Matiere_Semestre`
  ADD PRIMARY KEY (`id`,`id_Semestre`,`id_Filiere`,`id_Type`),
  ADD KEY `Matiere_Semestre_Semestre0_FK` (`id_Semestre`),
  ADD KEY `Matiere_Semestre_Filiere1_FK` (`id_Filiere`),
  ADD KEY `Matiere_Semestre_Type2_FK` (`id_Type`);

--
-- Index pour la table `Salle`
--
ALTER TABLE `Salle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Semestre`
--
ALTER TABLE `Semestre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Semestre_Annee_FK` (`id_Annee`);

--
-- Index pour la table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Annee`
--
ALTER TABLE `Annee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Classe`
--
ALTER TABLE `Classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Cours`
--
ALTER TABLE `Cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Enseignant`
--
ALTER TABLE `Enseignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Filiere`
--
ALTER TABLE `Filiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Groupe`
--
ALTER TABLE `Groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Matiere`
--
ALTER TABLE `Matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Salle`
--
ALTER TABLE `Salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Semestre`
--
ALTER TABLE `Semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Type`
--
ALTER TABLE `Type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD CONSTRAINT `Classe_Filiere_FK` FOREIGN KEY (`id_Filiere`) REFERENCES `Filiere` (`id`);

--
-- Contraintes pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD CONSTRAINT `Cours_Enseignant_FK` FOREIGN KEY (`id_Enseignant`) REFERENCES `Enseignant` (`id`),
  ADD CONSTRAINT `Cours_Groupe2_FK` FOREIGN KEY (`id_Groupe`) REFERENCES `Groupe` (`id`),
  ADD CONSTRAINT `Cours_Matiere1_FK` FOREIGN KEY (`id_Matiere`) REFERENCES `Matiere` (`id`),
  ADD CONSTRAINT `Cours_Salle0_FK` FOREIGN KEY (`id_Salle`) REFERENCES `Salle` (`id`),
  ADD CONSTRAINT `Cours_Type3_FK` FOREIGN KEY (`id_Type`) REFERENCES `Type` (`id`);

--
-- Contraintes pour la table `Enseignant_Matiere`
--
ALTER TABLE `Enseignant_Matiere`
  ADD CONSTRAINT `Enseignant_Matiere_Enseignant0_FK` FOREIGN KEY (`id_Enseignant`) REFERENCES `Enseignant` (`id`),
  ADD CONSTRAINT `Enseignant_Matiere_Matiere_FK` FOREIGN KEY (`id`) REFERENCES `Matiere` (`id`);

--
-- Contraintes pour la table `Groupe`
--
ALTER TABLE `Groupe`
  ADD CONSTRAINT `Groupe_Classe_FK` FOREIGN KEY (`id_Classe`) REFERENCES `Classe` (`id`);

--
-- Contraintes pour la table `Matiere_Semestre`
--
ALTER TABLE `Matiere_Semestre`
  ADD CONSTRAINT `Matiere_Semestre_Filiere1_FK` FOREIGN KEY (`id_Filiere`) REFERENCES `Filiere` (`id`),
  ADD CONSTRAINT `Matiere_Semestre_Matiere_FK` FOREIGN KEY (`id`) REFERENCES `Matiere` (`id`),
  ADD CONSTRAINT `Matiere_Semestre_Semestre0_FK` FOREIGN KEY (`id_Semestre`) REFERENCES `Semestre` (`id`),
  ADD CONSTRAINT `Matiere_Semestre_Type2_FK` FOREIGN KEY (`id_Type`) REFERENCES `Type` (`id`);

--
-- Contraintes pour la table `Semestre`
--
ALTER TABLE `Semestre`
  ADD CONSTRAINT `Semestre_Annee_FK` FOREIGN KEY (`id_Annee`) REFERENCES `Annee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
