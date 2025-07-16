--
-- Base de données : `sport_club_db`
--

DROP DATABASE IF EXISTS `sport_club_db`;
CREATE DATABASE `sport_club_db`;
USE sport_club_db;

-- --------------------------------------------------------

--
-- Structure de la table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activities`
--

INSERT INTO `activities` (`id`, `label`, `description`) VALUES
(1, 'Evangelin', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(2, 'Julietta', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(3, 'Darryl', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_booking` (`user_id`,`session_id`),
  KEY `session_id` (`session_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `capacity` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `coach_id` (`coach_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `activity_id`, `coach_id`, `datetime`, `capacity`, `created_at`) VALUES
(1, 0, 0, '0000-00-00 00:00:00', 99, '0000-00-00 00:00:00'),
(2, 0, 0, '0000-00-00 00:00:00', 68, '0000-00-00 00:00:00'),
(3, 0, 0, '0000-00-00 00:00:00', 32, '0000-00-00 00:00:00'),
(4, 0, 0, '0000-00-00 00:00:00', 55, '0000-00-00 00:00:00'),
(5, 0, 0, '0000-00-00 00:00:00', 49, '0000-00-00 00:00:00'),
(6, 0, 0, '0000-00-00 00:00:00', 51, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `password_hash` text NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `role` enum('client','coach','gestionnaire') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `prenom`, `nom`, `role`, `created_at`) VALUES
(1, 'lgarfirth0@bloglovin.com', '$2a$04$38YTJNyPg69wVH/JBCfPUe/Zp//IDTin50xYdb13CdtkHThQRaAeS', 'Laryssa', 'Garfirth', 'coach', '0000-00-00 00:00:00'),
(2, 'lblyden1@github.io', '$2a$04$gPHp6MlmGZRaCECpvq/utuZvb9LWbQTvkpYGU53FCqef1XQJAf8yO', 'Livvy', 'Blyden', 'coach', '0000-00-00 00:00:00'),
(3, 'dbuttrey2@g.co', '$2a$04$rgGmXLtUNye8bUFu5qhVWepucf0HkZ2n3ekjLmKzTJBYenFSN2IT6', 'Dario', 'Buttrey', 'coach', '0000-00-00 00:00:00'),
(4, 'cjeyes0@jigsy.com', '$2a$04$6xl3mUUzomlmdXWnWmPxNuXlK5PDB9Qp8PBhLl0V0XHWV8K/hNTlq', 'Cathy', 'Jeyes', 'client', '0000-00-00 00:00:00'),
(5, 'nsnary1@wikispaces.com', '$2a$04$5VLmYt8IyxXxqmpv/IccbufbTNErqy9YW8wnCCKE4vvXfZxe3GR3a', 'Neron', 'Snary', 'client', '0000-00-00 00:00:00'),
(6, 'mguise2@a8.net', '$2a$04$Gfp563rr1wALh/Dj.TiF9eZrP.xmzzOi1O0WK36dQupSIdzvGFM4.', 'Maegan', 'Guise', 'client', '0000-00-00 00:00:00'),
(7, 'mbooker3@instagram.com', '$2a$04$uwpf2hSr/0XhFgEmxNrgsO/fM2IFHj5qtHzJ68NBc063E.EFjvEDO', 'Mabelle', 'Booker', 'client', '0000-00-00 00:00:00'),
(8, 'cbuse4@sohu.com', '$2a$04$WMJC58rX/p4PqEIkiNOlruXbMSD9Hud4mNzBmAmdg1bOnX7WFeNHi', 'Clemence', 'Buse', 'client', '0000-00-00 00:00:00');
COMMIT;