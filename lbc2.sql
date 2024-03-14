-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 mars 2024 à 23:31
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lbc2`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `ida` int(2) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `vendeur` int(2) NOT NULL,
  `date` varchar(30) NOT NULL,
  `detail` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `categorie` int(2) NOT NULL,
  `prix` int(10) NOT NULL,
  `etat` varchar(40) NOT NULL,
  `favoris` int(4) NOT NULL,
  `livraison` int(2) NOT NULL,
  `vue` int(6) NOT NULL,
  `time` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`ida`, `titre`, `vendeur`, `date`, `detail`, `photo`, `categorie`, `prix`, `etat`, `favoris`, `livraison`, `vue`, `time`) VALUES
(9, 'chaise', 4, '2024-03-14 23:25:38', 'je  vend ma chaise', 'image/annonce/chaise.png', 1, 50, 'Neuf', 1, 0, 0, 1710455138);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idc` int(2) NOT NULL,
  `nomCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idc`, `nomCat`) VALUES
(1, 'mobilier salon'),
(2, 'mobilier de salle manger'),
(3, 'mobilier chambre'),
(4, 'mobilier salle de bain'),
(5, 'mobilier cuisine');

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

CREATE TABLE `conversation` (
  `idc` int(11) NOT NULL,
  `idan` int(11) NOT NULL,
  `idu` int(11) NOT NULL,
  `idv` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`idc`, `idan`, `idu`, `idv`, `time`) VALUES
(7, 9, 5, 4, 1710455185);

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `idf` int(4) NOT NULL,
  `ida` int(2) NOT NULL,
  `idu` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`idf`, `ida`, `idu`) VALUES
(12, 9, 5);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idm` int(2) NOT NULL,
  `idu_q` int(2) NOT NULL,
  `idu_r` int(2) NOT NULL,
  `idc` int(2) NOT NULL,
  `contenu` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idm`, `idu_q`, `idu_r`, `idc`, `contenu`, `time`) VALUES
(12, 5, 4, 6, 'salut on peux négocier pour le prix', 1710454753),
(13, 5, 4, 6, 'd\'accord', 1710454778),
(14, 5, 4, 7, 'SALUT', 1710455185),
(15, 4, 5, 7, 'je besoin de vendre', 1710455223);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idu` int(2) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `numRue` varchar(10) NOT NULL,
  `nomRue` varchar(50) NOT NULL,
  `nomVille` varchar(30) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `statue` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idu`, `nom`, `prenom`, `mail`, `tel`, `mdp`, `numRue`, `nomRue`, `nomVille`, `cp`, `avatar`, `statue`) VALUES
(4, 'Menayame', 'Perside', 'menayameperside3@gmail.com', '0745598169', '8af67b5b562bd9dd1143647cf22badae', '102 ', '14 Rue de Michelet', 'Saint-Ouen-sur-Seine', '93400', 'image/avatar/4.png', 0),
(5, 'ONDIYO', 'CHRISTIAN', 'ondiyochristian12@gmail.com', '0758982621', '9bf2201895576f8884cb745a25f6d79b', '102 ', '102 rue de strasbourg', 'Le mée-sur-seine', '77350', NULL, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`ida`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idc`);

--
-- Index pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`idc`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`idf`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idm`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idu`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `ida` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idc` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `idc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `idf` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idm` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idu` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
