-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 12 jan. 2020 à 10:57
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
-- Base de données :  `beent`
--
CREATE DATABASE IF NOT EXISTS `beent` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `beent`;

-- --------------------------------------------------------

--
-- Structure de la table `annee`
--

CREATE TABLE `annee` (
  `id` int(11) NOT NULL,
  `code` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `id_Filiere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `id_Enseignant` int(11) DEFAULT NULL,
  `id_Salle` int(11) DEFAULT NULL,
  `id_Matiere` int(11) DEFAULT NULL,
  `id_Groupe` int(11) DEFAULT NULL,
  `id_Type` int(11) DEFAULT NULL,
  `debut` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_matiere`
--

CREATE TABLE `enseignant_matiere` (
  `id` int(11) NOT NULL,
  `id_Matiere` int(11) NOT NULL,
  `id_Enseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id` int(11) NOT NULL,
  `libelle` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `code` varchar(11) NOT NULL,
  `capacite` int(11) NOT NULL,
  `id_Classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `libelle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `matiere_semestre`
--

CREATE TABLE `matiere_semestre` (
  `id` int(11) NOT NULL,
  `id_Matiere` int(11) NOT NULL,
  `id_Semestre` int(11) NOT NULL,
  `id_Filiere` int(11) NOT NULL,
  `id_Type` int(11) NOT NULL,
  `heure` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `code` varchar(150) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `pc` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `id_Annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `libelle` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annee`
--
ALTER TABLE `annee`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Classe_Filiere_FK` (`id_Filiere`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cours_Enseignant_FK` (`id_Enseignant`),
  ADD KEY `Cours_Salle0_FK` (`id_Salle`),
  ADD KEY `Cours_Matiere1_FK` (`id_Matiere`),
  ADD KEY `Cours_Groupe2_FK` (`id_Groupe`),
  ADD KEY `Cours_Type3_FK` (`id_Type`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Enseignant` (`id_Enseignant`),
  ADD KEY `id_Matiere` (`id_Matiere`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Groupe_Classe_FK` (`id_Classe`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matiere_semestre`
--
ALTER TABLE `matiere_semestre`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `Matiere_Semestre_Semestre0_FK` (`id_Semestre`),
  ADD KEY `Matiere_Semestre_Filiere1_FK` (`id_Filiere`),
  ADD KEY `Matiere_Semestre_Type2_FK` (`id_Type`),
  ADD KEY `Matiere_Semestre_Matiere_FK` (`id_Matiere`);


--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Semestre_Annee_FK` (`id_Annee`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annee`
--
ALTER TABLE `annee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matiere_semestre`
--
ALTER TABLE `matiere_semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `Classe_Filiere_FK` FOREIGN KEY (`id_Filiere`) REFERENCES `filiere` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `Cours_Enseignant_FK` FOREIGN KEY (`id_Enseignant`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `Cours_Groupe2_FK` FOREIGN KEY (`id_Groupe`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `Cours_Matiere1_FK` FOREIGN KEY (`id_Matiere`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `Cours_Salle0_FK` FOREIGN KEY (`id_Salle`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `Cours_Type3_FK` FOREIGN KEY (`id_Type`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD CONSTRAINT `enseignant_matiere_ibfk_1` FOREIGN KEY (`id_Enseignant`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `enseignant_matiere_ibfk_2` FOREIGN KEY (`id_Matiere`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `Groupe_Classe_FK` FOREIGN KEY (`id_Classe`) REFERENCES `classe` (`id`);

--
-- Contraintes pour la table `matiere_semestre`
--
ALTER TABLE `matiere_semestre`
  ADD CONSTRAINT `Matiere_Semestre_Filiere1_FK` FOREIGN KEY (`id_Filiere`) REFERENCES `filiere` (`id`),
  ADD CONSTRAINT `Matiere_Semestre_Matiere_FK` FOREIGN KEY (`id_Matiere`) REFERENCES `matiere` (`id`),
  ADD CONSTRAINT `Matiere_Semestre_Semestre0_FK` FOREIGN KEY (`id_Semestre`) REFERENCES `semestre` (`id`),
  ADD CONSTRAINT `Matiere_Semestre_Type2_FK` FOREIGN KEY (`id_Type`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `Semestre_Annee_FK` FOREIGN KEY (`id_Annee`) REFERENCES `annee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
