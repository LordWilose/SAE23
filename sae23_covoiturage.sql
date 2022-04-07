-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 07 avr. 2022 à 15:14
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sae23_covoiturage`
--

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `IdIUT` int(11) NOT NULL,
  `Nom` text NOT NULL,
  `Formation` text NOT NULL,
  `Groupe` text NOT NULL,
  `Sous_groupe` text,
  `Localisation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`IdIUT`, `Nom`, `Formation`, `Groupe`, `Sous_groupe`, `Localisation`) VALUES
(1, 'IUTBM', 'BUT R&T', '1ere Annee', 'ALT', 'MONTBELIARD'),
(2, 'IUTBM', 'BUT R&T', '2eme Annee', 'ALT', 'MONTBELIARD'),
(3, 'IUTBM', 'BUT R&T', '1ere Annee', 'FI', 'MONTBELIARD'),
(4, 'IUTBM', 'BUT R&T', '2eme Annee', 'FI', 'MONTBELIARD'),
(5, 'IUTBM', 'BUT GACO', '1ere Annee', 'FI', 'MONTBELIARD'),
(6, 'IUTBM', 'BUT GACO', '2eme Annee', 'FI', 'MONTBELIARD'),
(7, 'IUTBM', 'BUT MMI', '1ere Annee', 'FI', 'BELFORT'),
(8, 'IUTBM', 'BUT MMI', '2eme Annee', 'FI', 'BELFORT'),
(9, 'IUTBM', 'IFMS', '1ere Annee', 'FI', 'BELFORT'),
(10, 'IUTBM', 'IFMS', '2eme Annee', 'FI', 'BELFORT');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `IdE` int(11) NOT NULL,
  `IdIUT` int(11) NOT NULL,
  `Nom` text NOT NULL,
  `Prenom` text NOT NULL,
  `Domicile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`IdE`, `IdIUT`, `Nom`, `Prenom`, `Domicile`) VALUES
(1, 1, 'ECOTIERE', 'Léo', 'MONTBELIARD'),
(2, 1, 'HIRSCH', 'Mateo', 'COUTHENANS'),
(3, 1, 'DEUSCHER', 'Lucas', 'DAMBENOIS'),
(7, 3, 'GIVRON', 'Stephane', 'IUT'),
(8, 4, 'PARRE', 'Aline', 'BELFORT'),
(9, 10, 'CANALDA', 'Philippe', 'BELFORT');

-- --------------------------------------------------------

--
-- Structure de la table `papiers`
--

CREATE TABLE `papiers` (
  `Carte_Grise` tinyint(1) NOT NULL,
  `Controle_Technique` tinyint(1) NOT NULL,
  `Assurance` tinyint(1) NOT NULL,
  `Permis` tinyint(1) NOT NULL,
  `Points_Permis` int(11) NOT NULL,
  `Immatriculation` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `papiers`
--

INSERT INTO `papiers` (`Carte_Grise`, `Controle_Technique`, `Assurance`, `Permis`, `Points_Permis`, `Immatriculation`) VALUES
(1, 1, 1, 1, 1, 'BX-696-DF'),
(1, 1, 1, 1, 12, 'CQ-648-XF'),
(1, 1, 1, 1, 12, 'FT-483-GI'),
(1, 1, 1, 1, 12, 'GA-707-CS'),
(1, 0, 0, 0, 20, 'PI-7A5-DS');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `Immatriculation` varchar(9) NOT NULL,
  `IdE` int(11) NOT NULL,
  `Type` text NOT NULL,
  `Marque` text NOT NULL,
  `Modele` text NOT NULL,
  `Places` int(11) NOT NULL,
  `En_regle` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`Immatriculation`, `IdE`, `Type`, `Marque`, `Modele`, `Places`, `En_regle`) VALUES
('BX-696-DF', 8, 'Sportive', 'Audi', 'A5', 4, 1),
('CQ-648-XF', 1, 'Compacte', 'Volkswagen', 'Golf 3', 4, 1),
('FT-483-GI', 9, 'Familiale', 'Peugeot', '5008', 6, 1),
('GA-707-CS', 2, 'Citadine', 'Peugeot', '206', 4, 1),
('PI-7A5-DS', 7, 'Berline', 'Peugeot', '207', 4, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`IdIUT`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`IdE`);

--
-- Index pour la table `papiers`
--
ALTER TABLE `papiers`
  ADD PRIMARY KEY (`Immatriculation`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`Immatriculation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `IdIUT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `IdE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
