-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  sam. 07 déc. 2019 à 20:17
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

--
-- Déchargement des données de la table `Annee`
--

INSERT INTO `Annee` (`id`, `code`) VALUES
(1, '2019'),
(2, '2020');

--
-- Déchargement des données de la table `Filiere`
--

INSERT INTO `Filiere` (`id`, `libelle`) VALUES
(1, 'L3 MIAGE');

--
-- Déchargement des données de la table `Classe`
--

INSERT INTO `Classe` (`id`, `code`, `id_Filiere`) VALUES
(1, 1, 1);

--
-- Déchargement des données de la table `Enseignant`
--

INSERT INTO `Enseignant` (`id`, `nom`, `prenom`, `rue`, `cp`, `ville`, `tel`, `email`) VALUES
(1, 'COUVREUR', 'Jean-Michel', '210 rue des couvreurs', '45560', 'Saint-Denis-En-Val', '0733223234', 'jean-michel.couvreur@univ-orleans.fr'),
(2, 'JUGE', 'Evan', '510 rue neuve', '45600', 'Olivet', '0777323234', 'evan.juge@univ-oreans.fr');

--
-- Déchargement des données de la table `Salle`
--

INSERT INTO `Salle` (`id`, `code`, `capacite`, `pc`) VALUES
(1, 'E001', 20, 1),
(2, 'E002', 30, 0),
(3, 'E003', 30, 0),
(4, 'E004', 30, 0),
(5, 'E005', 30, 0),
(6, 'AMPHI HERBRAND', 100, 0);

--
-- Déchargement des données de la table `Matiere`
--

INSERT INTO `Matiere` (`id`, `libelle`) VALUES
(1, 'Mise à niveau informatique'),
(2, 'Réseaux');

--
-- Déchargement des données de la table `Groupe`
--

INSERT INTO `Groupe` (`id`, `code`, `capacite`, `id_Classe`) VALUES
(1, 1, 20, 1),
(2, 2, 20, 1);

--
-- Déchargement des données de la table `Type`
--

INSERT INTO `Type` (`id`, `libelle`) VALUES
(1, 'CM'),
(2, 'TD'),
(3, 'TP'),
(4, 'CC'),
(5, 'CT');
COMMIT;

--
-- Déchargement des données de la table `Cours`
--

INSERT INTO `Cours` (`id`, `id_Enseignant`, `id_Salle`, `id_Matiere`, `id_Groupe`, `id_Type`, `debut`, `fin`) VALUES
(1, 1, 1, 1, 1, 1, '2019-12-09 08:00:00', '2019-12-09 10:00:00');

--
-- Déchargement des données de la table `Enseignant_Matiere`
--

INSERT INTO `Enseignant_Matiere` (`id`, `id_Enseignant`) VALUES
(1, 2);

--
-- Déchargement des données de la table `Semestre`
--

INSERT INTO `Semestre` (`id`, `code`, `id_Annee`) VALUES
(1, 5, 1),
(2, 6, 2);
--
-- Déchargement des données de la table `Matiere_Semestre`
--

INSERT INTO `Matiere_Semestre` (`id`, `id_Semestre`, `id_Filiere`, `id_Type`, `heure`) VALUES
(1, 1, 1, 1, 3),
(1, 1, 1, 2, 6),
(1, 1, 1, 3, 18),
(2, 1, 1, 1, 15),
(2, 1, 1, 2, 10),
(2, 1, 1, 3, 24);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
