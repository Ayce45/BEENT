-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 12 jan. 2020 à 10:58
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
-- Déchargement des données de la table `annee`
--

INSERT INTO `annee` (`id`, `code`) VALUES
(1, '2019'),
(2, '2020');

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `nom`, `prenom`) VALUES
(1, 'Couvreur', 'Jean-Michel'),
(3, 'Moal', 'Frédéric'),
(4, 'Todinca', 'Ludovic'),
(5, 'Dion', 'Nadine'),
(6, 'Alzy', 'Anne-Cécile'),
(7, 'Boichut', 'Yoan'),
(8, 'Exbrayat', 'Mathieu'),
(9, 'Delacourt', 'Martin'),
(10, 'Lefevre', 'Lucie');

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id`, `libelle`) VALUES
(1, 'L3 MIAGE');

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `libelle`) VALUES
(1, 'Mise à niveau informatique'),
(2, 'Réseaux'),
(3, 'Programmation avancée'),
(4, 'Statistiques'),
(5, 'Gestion comptable'),
(6, 'Anglais'),
(7, 'Technique de communication'),
(8, 'Projet personnel et professionnel');

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `code`, `capacite`, `pc`) VALUES
(1, 'E001', 20, 1),
(2, 'E002', 30, 0),
(3, 'E003', 30, 0),
(4, 'E004', 30, 0),
(5, 'E005', 30, 0),
(6, 'AMPHI HERBRAND', 100, 0);

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `libelle`) VALUES
(1, 'CM'),
(2, 'TD'),
(3, 'TP'),
(4, 'CC'),
(5, 'CT');

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `code`, `id_Filiere`) VALUES
(1, 1, 1);

--
-- Déchargement des données de la table `enseignant_matiere`
--

INSERT INTO `enseignant_matiere` (`id`, `id_Matiere`, `id_Enseignant`) VALUES
(1, 6, 6),
(2, 5, 10),
(3, 3, 3),
(4, 3, 7),
(6, 2, 9),
(7, 4, 4),
(8, 7, 1),
(9, 1, 5);

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `code`, `capacite`, `id_Classe`) VALUES
(1, '1', 20, 1),
(2, '2', 20, 1),
(3, '1, 2', 40, 1);

--
-- Déchargement des données de la table `semestre`
--

INSERT INTO `semestre` (`id`, `code`, `id_Annee`) VALUES
(5, 5, 1),
(6, 6, 2);

--
-- Déchargement des données de la table `matiere_semestre`
--

INSERT INTO `matiere_semestre` (`id`, `id_Matiere`, `id_Semestre`, `id_Filiere`, `id_Type`, `heure`) VALUES
(1, 1, 6, 1, 1, 10),
(2, 1, 6, 1, 3, 20),
(3, 5, 6, 1, 1, 20),
(4, 6, 6, 1, 2, 10);

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `id_Enseignant`, `id_Salle`, `id_Matiere`, `id_Groupe`, `id_Type`, `debut`, `fin`) VALUES
(22, 6, 1, 6, 1, 1, '2020-01-13 08:00:00', '2020-01-13 10:00:00'),
(23, 6, 1, 6, 2, 1, '2020-01-13 10:00:00', '2020-01-13 12:00:00'),
(24, 1, 6, 1, 3, 1, '2020-01-13 13:00:00', '2020-01-13 15:00:00'),
(25, 7, 6, 3, 3, 1, '2020-01-12 15:00:00', '2020-01-12 17:00:00'),
(26, 10, 6, 5, 3, 1, '2020-01-14 08:00:00', '2020-01-14 10:00:00'),
(27, 3, 1, 3, 1, 3, '2020-01-14 10:00:00', '2020-01-14 12:00:00'),
(28, 9, 6, 2, 3, 1, '2020-01-14 13:00:00', '2020-01-14 14:00:00'),
(29, 9, 1, 2, 1, 3, '2020-01-14 14:00:00', '2020-01-14 16:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
