-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 07 avr. 2022 à 18:30
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
  `Sous_groupe` text DEFAULT NULL,
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
(4, 3, 'GIVRON', 'Stephane', 'IUT'),
(5, 4, 'PARRE', 'Aline', 'BELFORT'),
(6, 10, 'CANALDA', 'Philippe', 'BELFORT'),
(7, 2, 'CAQUINEAU', 'Elliott', 'MULHOUSE'),
(8, 2, 'GOLDMAN', 'Jean-Jacques', 'LURE'),
(9, 5, 'PAGNY', 'Florent', 'LURE'),
(10, 5, 'HAUCHARD', 'Lucas', 'MONTBELIARD'),
(11, 6, 'HALAL', 'Saucisse', 'LECLERC'),
(12, 6, 'MAUPASSANT', 'Rachid', 'BELFORT'),
(13, 7, 'PLAZA', 'Stephane', 'BROGNARD'),
(14, 7, 'BOURGUIGNON', 'JeanMarc', 'MULHOUSE'),
(15, 8, 'BAECKEOFFE', 'Michel', 'COLMAR'),
(16, 8, 'KOUGELHOPF', 'JeanPierre', 'COLMAR'),
(17, 9, 'PEACE', 'Pan', 'MONTBELIARD'),
(18, 9, 'APPLE', 'Pie', 'MONTBELIARD'),
(19, 10, 'BRETZEL', 'Emmanuel', 'COLMAR'),
(20, 10, 'CHOUCROUTE', 'Alex', 'BELFORT');

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
(1, 1, 1, 1, 12, 'CH-000-RT'),
(1, 1, 1, 1, 12, 'CQ-648-XF'),
(1, 1, 1, 1, 12, 'DE-898-FF'),
(1, 1, 1, 1, 12, 'ER-544-OP'),
(1, 1, 1, 1, 12, 'FT-483-GI'),
(1, 1, 1, 1, 12, 'GA-707-CS'),
(1, 1, 1, 1, 6, 'GT-574-AA'),
(1, 1, 1, 1, 12, 'HA-111-LA'),
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
('CH-000-RT', 20, 'Berline', 'Peugeot', '206', 4, 1),
('CQ-648-XF', 1, 'Compacte', 'Volkswagen', 'Golf 3', 4, 1),
('DE-898-FF', 4, 'Berline', 'Peugeot', '3008', 4, 1),
('ER-544-OP', 16, 'SUV', 'BMW', 'X7', 4, 1),
('FT-483-GI', 6, 'Familiale', 'Peugeot', '5008', 6, 1),
('GA-707-CS', 2, 'Citadine', 'Peugeot', '206', 4, 1),
('GT-574-AA', 13, 'Sportive', 'Ferrari', 'SF90 Stradale', 1, 1),
('HA-111-LA', 11, 'Berline', 'Citroen', 'C4', 4, 1),
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
  MODIFY `IdE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;
