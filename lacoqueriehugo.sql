-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 12 jan. 2021 à 14:02
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lacoqueriehugo`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
(1, 'TATOUAGE'),
(2, 'FLEURIE'),
(4, 'FOOD'),
(5, 'GRIPS'),
(6, 'COQUES A MOTIFS'),
(7, 'COQUES A MESSAGES'),
(8, 'JAPONAISE'),
(9, 'INSOLITE'),
(10, 'COLOREE'),
(11, 'COQUES 3D'),
(12, 'ACCESSOIRES'),
(14, 'NOUVELLE CO\''),
(15, 'IDEES CADEAUX'),
(16, 'PRODUITS PERSONNALISABLES'),
(17, 'COQUES A PRENOMS');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `montant` double NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_complement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_cp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `rate` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `produit_id`, `date`, `rate`, `description`, `image`) VALUES
(1, 1, '2020-12-30 10:14:12', 5, 'Superbe !', 'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/e/2/3/e230fbbd33_69321_portable2.jpg'),
(2, 1, '2020-12-30 10:15:12', 4, 'très bien', NULL),
(29, 26, '2021-01-11 19:44:30', 5, 'Parfait', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201227160935', '2020-12-27 17:10:08', 230);

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id`) VALUES
(8);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantites` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `panier_produit`
--

CREATE TABLE `panier_produit` (
  `panier_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `categorie_id`, `libelle`, `ref`, `prix`, `image`, `stock`, `description`) VALUES
(1, 1, 'COQUE CRANE FLEURIE TRANSPARENTE', 'COQUE CRÂNE FLEURIE TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-crane-fleurie-transparente-14171220967533_510x@2x.progressive.jpg?v=1606304580', 10000, '<ul>\r\n<li><strong>Coque en silicone transparent et résistant</strong></li>\r\n<li><strong>Impression Ultra HD</strong></li>\r\n<li><strong>Fabrication française 🇫🇷</strong></li>\r\n<li><strong>Livraison express par lettre suivie ✉️</strong></li>\r\n<li><strong>Garantie 1 an</strong></li>\r\n</ul>\r\n<p>Disponible pour des centaines de modèles de téléphones (iPhone, Samsung, Huawei..). Imprimées directement dans notre atelier, en France. Création en ULTRA HAUTE DÉFINITION pour un rendu optimal sur votre téléphone !</p>\r\n<p>Avec LA COQUERIE™, habillez votre téléphone portable avec tout types de coques, et de motifs ! Notre objectif ? Protéger votre téléphone, avec un produit français. </p>\r\n<p>Ce produit a été imaginé et dessiné à Lille. 📍</p>'),
(2, 1, 'COQUE FLOWER TATTOO TRANSPARENTE', 'COQUE FLOWER TATTOO TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-flower-tattoo-transparente-14164699578477_510x@2x.progressive.jpg?v=1606304623', 10000, NULL),
(3, 1, 'COQUE ROSES TRANSPARENTE', 'COQUE ROSES TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-roses-transparente-14164366131309_510x@2x.progressive.jpg?v=1606304690', 10000, NULL),
(4, 1, 'COQUE BIRD TATTOO TRANSPARENTE\r\n', 'COQUE BIRD TATTOO TRANSPARENTE\r\n', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-bird-tattoo-transparente-14171083898989_510x@2x.progressive.jpg?v=1606304556', 10000, NULL),
(5, 1, 'COQUE PATCHS OLD SCHOOL TRANSPARENTE', 'COQUE PATCHS OLD SCHOOL TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-patchs-old-school-transparente-14164441858157_510x@2x.progressive.jpg?v=1606304662', 10000, NULL),
(6, 1, 'COQUE PANTHÈRE TATTOO TRANSPARENTE', 'COQUE PANTHÈRE TATTOO TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-panthere-tattoo-transparente-14268910731373_510x@2x.progressive.jpg?v=1606304715', 10000, NULL),
(7, 1, 'COQUE HAWAII TATTOO TRANSPARENTE', 'COQUE HAWAII TATTOO TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-hawaii-tattoo-transparente-14268704555117_510x@2x.progressive.jpg?v=1606304612', 10000, NULL),
(8, 1, 'COQUE CRÂNES ET ROSES TRANSPARENTE', 'COQUE CRÂNES ET ROSES TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-cranes-et-roses-transparente-14171212185709_510x@2x.progressive.jpg?v=1606304582', 10000, NULL),
(9, 1, 'COQUE BATEAU TATTOO TRANSPARENTE', 'COQUE BATEAU TATTOO TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-bateau-tattoo-transparente-14268827467885_510x@2x.progressive.jpg?v=1606304566', 10000, NULL),
(10, 1, 'COQUE TIGRES TATTOO TRANSPARENTE', 'COQUE TIGRES TATTOO TRANSPARENTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-tigres-tattoo-transparente-14268551823469_510x@2x.progressive.jpg?v=1606304703', 10000, NULL),
(12, 5, 'GRIP PERSONNALISÉ AVEC PHOTO', 'GRIP PERSONNALISÉ AVEC PHOTO', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-personnalise-avec-photo-12023311073389_510x@2x.progressive.jpg?v=1606014213', 10000, NULL),
(13, 5, 'GRIP Liberty rose', 'GRIP Liberty rose', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-liberty-rose-14225329061997_510x@2x.progressive.jpg?v=1605987093', 10000, NULL),
(14, 5, 'GRIP Liberty of London', 'GRIP Liberty of London', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-liberty-of-london-14225117184109_510x@2x.progressive.jpg?v=1605987035', 10000, NULL),
(15, 5, 'GRIP PIERRE PRÉCIEUSE', 'GRIP PIERRE PRÉCIEUSE', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-pierre-precieuse-11879756267629_510x@2x.progressive.jpg?v=1606014334', 10000, NULL),
(16, 5, 'GRIP KARMA', 'GRIP KARMA', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-karma-12919049977965_510x@2x.progressive.jpg?v=1605986767', 10000, NULL),
(17, 5, 'GRIP PANDA', 'GRIP PANDA', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-panda-12919090905197_510x@2x.progressive.jpg?v=1606013607', 10000, NULL),
(18, 5, 'GRIP Marbre rose', 'GRIP Marbre rose', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-marbre-rose-14225036836973_510x@2x.progressive.jpg?v=1605988048', 10000, NULL),
(19, 5, 'GRIP LIBERTY HORTENSIA', 'GRIP LIBERTY HORTENSIA', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/grip-liberty-hortensia-15880948154477_510x@2x.progressive.jpg?v=1605953489', 10000, NULL),
(20, 12, 'PROTÉCTION D\'ÉCRAN EN VERRE TREMPÉ', 'PROTÉCTION D\'ÉCRAN EN VERRE TREMPÉ', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/protection-d-ecran-en-verre-trempe-15862346711149_510x@2x.progressive.jpg?v=1605953641', 10000, NULL),
(21, 12, 'CÂBLE DE RECHARGE + PRISE SECTEUR', 'CÂBLE DE RECHARGE + PRISE SECTEUR', 14.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/cable-de-recharge-prise-secteur-13685421736045_510x@2x.progressive.jpg?v=1605976684', 10000, NULL),
(22, 7, 'COQUE TRANSPARENTE BRUNETTE', 'COQUE TRANSPARENTE BRUNETTE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-brunette-15719193182317.jpg?v=1606304350', 10000, NULL),
(23, 7, 'COQUE TRANSPARENTE FEMME EN BASKETS', 'COQUE TRANSPARENTE FEMME EN BASKETS', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-femme-en-baskets-15719185645677.jpg?v=1606304351', 10000, NULL),
(24, 7, 'COQUE TRANSPARENTE COEUR D\'ARTICHAUT', 'COQUE TRANSPARENTE COEUR D\'ARTICHAUT', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-coeur-d-artichaut-15719167787117.jpg?v=1606304351', 10000, NULL),
(25, 6, 'COQUE TRANSPARENTE MALMÖ', 'COQUE TRANSPARENTE MALMÖ', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-malmo-15725125927021_510x@2x.progressive.jpg?v=1606304351', 10000, NULL),
(26, 6, 'COQUE TRANSPARENTE GJOVIK', 'COQUE TRANSPARENTE GJOVIK', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-gjovik-15725132873837_510x@2x.progressive.jpg?v=1606304350', 10000, NULL),
(27, 6, 'COQUE TRANSPARENTE LULEA', 'COQUE TRANSPARENTE LULEA', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-lulea-15725136052333_510x@2x.progressive.jpg?v=1606304350', 10000, NULL),
(28, 8, 'COQUE INELLE', 'COQUE INELLE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-inelle-15740654387309.jpg?v=1606304286', 10000, NULL),
(29, 8, 'COQUE ÉVENTAILS', 'COQUE ÉVENTAILS', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-eventails-15360462979181.jpg?v=1606304459', 10000, NULL),
(30, 8, 'COQUE PANDAS', 'COQUE PANDAS', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-pandas-15360931233901.jpg?v=1606304420', 0, NULL),
(31, 9, 'COQUE T\'AS DE BEAUX YEUX', 'COQUE T\'AS DE BEAUX YEUX', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-t-as-de-beaux-yeux-15360630063213.jpg?v=1606304443', 10000, NULL),
(32, 9, 'COQUE PORTE FRIENDS', 'COQUE PORTE FRIENDS', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-porte-friends-15360808386669.jpg?v=1606304422', 10000, NULL),
(33, 9, 'COQUE ALPAGA', 'COQUE ALPAGA', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-alpaga-15359877513325.jpg?v=1606304474', 10000, NULL),
(34, 4, 'COQUE LONG BURGER', 'COQUE LONG BURGER', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-long-burger-15360636551277.jpg?v=1606304443', 10000, NULL),
(35, 4, 'COQUE CERISES ROSES', 'COQUE CERISES ROSES', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-cerises-roses-15360250937453.jpg?v=1606304467', 10000, NULL),
(36, 4, 'COQUE POP BANANA', 'COQUE POP BANANA', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-pop-banana-15360828506221.jpg?v=1606304423', 10000, NULL),
(37, 2, 'COQUE PRINTEMPS', 'COQUE PRINTEMPS', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-pop-banana-15360828506221.jpg?v=1606304423', 10000, NULL),
(38, 2, 'COQUE ORIENTALE FLORAL', 'COQUE ORIENTALE FLORAL', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-orientale-floral-15360952467565.jpg?v=1606304420', 10000, NULL),
(39, 2, 'COQUE LIBERTY ROSE', 'COQUE LIBERTY ROSE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-liberty-rose-15114303471725.jpg?v=1606308546', 10000, NULL),
(40, 10, 'COQUE FORÊT FANTAISIE', 'COQUE FORÊT FANTAISIE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-foret-fantaisie-15360592674925.jpg?v=1606304443', 10000, NULL),
(41, 10, 'COQUE ABSTRAIT JAUNE', 'COQUE ABSTRAIT JAUNE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-abstrait-jaune-15359866077293.jpg?v=1606304474', 10000, NULL),
(42, 10, 'COQUE ABSTRAIT JAUNE', 'COQUE ABSTRAIT JAUNE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-abstrait-jaune-15359866077293.jpg?v=1606304474', 10000, NULL),
(43, 11, 'COQUE 3D MARBRE BLEU', 'COQUE 3D MARBRE BLEU', 34.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-3d-marbre-bleu-12023733190765_510x@2x.progressive.jpg?v=1606304534', 10000, NULL),
(44, 11, 'COQUE 3D MARBRE NOIR', 'COQUE 3D MARBRE NOIR', 34.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-3d-marbre-noir-12023717494893_510x@2x.progressive.jpg?v=1606304532', 10000, NULL),
(45, 11, 'COQUE 3D GALAXITE', 'COQUE 3D GALAXITE', 34.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-3d-galaxite-12023761174637_510x@2x.progressive.jpg?v=1606304491', 10000, NULL),
(46, 14, 'COQUE LAUDALIE', 'COQUE LAUDALIE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-laudalie-15740598321261.jpg?v=1606304296', 10000, NULL),
(47, 14, 'COQUE MARBRE DIAMANT BLEU', 'COQUE MARBRE DIAMANT BLEU', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-marbre-diamant-bleu-15733245575277.jpg?v=1606304322', 10000, NULL),
(48, 14, 'COQUE TRANSPARENTE DJUR', 'COQUE TRANSPARENTE DJUR', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-djur-15725159678061_510x@2x.progressive.jpg?v=1606304350', 10000, NULL),
(49, 15, 'COQUE TRANSPARENTE PIZZA ADDICT', 'COQUE TRANSPARENTE PIZZA ADDICT', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-pizza-addict-22822742950066_510x@2x.progressive.jpg?v=1606304286', 10000, NULL),
(50, 15, 'COQUE TRANSPARENTE RENNES', 'COQUE TRANSPARENTE RENNES', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-rennes-22822729973938_510x@2x.progressive.jpg?v=1606304286', 10000, NULL),
(51, 15, 'COQUE TRANSPARENTE PETIT BISCUIT', 'COQUE TRANSPARENTE PETIT BISCUIT', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-transparente-petit-biscuit-22822698778802_510x@2x.progressive.jpg?v=1606304286', 10000, NULL),
(52, 17, 'COQUE 3D \"FLORA\"', 'COQUE 3D \"FLORA\"', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-3d-flora-12926101979245_510x@2x.progressive.jpg?v=1606304493', 10000, NULL),
(53, 17, 'COQUE 3D \"MAGGIE\"', 'COQUE 3D \"MAGGIE\"', 34.99, '//cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-3d-maggie-12926125015149_510x@2x.progressive.jpg?v=1606304481', 10000, NULL),
(54, 11, 'COQUE 3D \"CHARLIE\"', 'COQUE 3D \"CHARLIE\"', 34.99, '//cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-3d-charlie-12926000529517_510x@2x.progressive.jpg?v=1606304481', 10000, NULL),
(55, 16, 'COQUE RENFORCÉE PERSONNALISÉE AVEC PHOTO', 'COQUE RENFORCÉE PERSONNALISÉE AVEC PHOTO', 24.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-renforcee-personnalisee-avec-photo-22977870528690_510x@2x.progressive.jpg?v=1607350179', 10000, NULL),
(56, 16, 'COQUE POLAROID GROUPE', 'COQUE POLAROID GROUPE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-polaroid-groupe-15757693812845_510x@2x.progressive.jpg?v=1606304286', 10000, NULL),
(57, 16, 'COQUE POLAROID PERSONNALISÉE', 'COQUE POLAROID PERSONNALISÉE', 19.99, 'https://cdn.shopify.com/s/files/1/0032/9223/3837/products/coque-polaroid-personnalisee-14305207746669_510x@2x.progressive.jpg?v=1606304682', 10000, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit_commande`
--

CREATE TABLE `produit_commande` (
  `produit_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit_favoris`
--

CREATE TABLE `produit_favoris` (
  `produit_id` int(11) NOT NULL,
  `favoris_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit_favoris`
--

INSERT INTO `produit_favoris` (`produit_id`, `favoris_id`) VALUES
(43, 8);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `favoris_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:array)' CHECK (json_valid(`roles`)),
  `adresse_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_complement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_cp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `favoris_id`, `email`, `password`, `roles`, `adresse_num`, `adresse_libelle`, `adresse_complement`, `adresse_cp`, `ville`, `pays`) VALUES
(8, 8, 'test@test.com', '$argon2id$v=19$m=65536,t=4,p=1$TjFFMjFhdHhiTk5HS2ZYYg$k/UOgywpaPSC/XFj/OSurO+HEpK3+wP02PELbPteUI0', '[\"ROLE_ADMIN\"]', NULL, '10 Rue de Oskour', NULL, '59999', 'Oskour', 'France');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DFB88E14F` (`utilisateur_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCF347EFB` (`produit_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_24CC0DF2A76ED395` (`user_id`);

--
-- Index pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD PRIMARY KEY (`panier_id`,`produit_id`),
  ADD KEY `IDX_D31F28A6F77D927C` (`panier_id`),
  ADD KEY `IDX_D31F28A6F347EFB` (`produit_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`);

--
-- Index pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  ADD PRIMARY KEY (`produit_id`,`commande_id`),
  ADD KEY `IDX_47F5946EF347EFB` (`produit_id`),
  ADD KEY `IDX_47F5946E82EA2E54` (`commande_id`);

--
-- Index pour la table `produit_favoris`
--
ALTER TABLE `produit_favoris`
  ADD PRIMARY KEY (`produit_id`,`favoris_id`),
  ADD KEY `IDX_4FC84F4BF347EFB` (`produit_id`),
  ADD KEY `IDX_4FC84F4B51E8871B` (`favoris_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B351E8871B` (`favoris_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `FK_24CC0DF2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `panier_produit`
--
ALTER TABLE `panier_produit`
  ADD CONSTRAINT `FK_D31F28A6F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D31F28A6F77D927C` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `produit_commande`
--
ALTER TABLE `produit_commande`
  ADD CONSTRAINT `FK_47F5946E82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_47F5946EF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit_favoris`
--
ALTER TABLE `produit_favoris`
  ADD CONSTRAINT `FK_4FC84F4B51E8871B` FOREIGN KEY (`favoris_id`) REFERENCES `favoris` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4FC84F4BF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B351E8871B` FOREIGN KEY (`favoris_id`) REFERENCES `favoris` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
