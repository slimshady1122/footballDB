-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2024 at 08:39 PM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `footballDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `leagues`
--

CREATE TABLE `leagues` (
  `league_id` int NOT NULL,
  `league_name` varchar(100) NOT NULL,
  `league_country` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leagues`
--

INSERT INTO `leagues` (`league_id`, `league_name`, `league_country`, `start_date`, `end_date`) VALUES
(1, 'Premier League', 'England', '2024-08-01', '2025-05-30'),
(2, 'La Liga', 'Spain', '2024-09-01', '2025-06-30'),
(3, 'Serie A', 'Italy', '2024-07-15', '2025-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_id` int NOT NULL,
  `match_date` date NOT NULL,
  `match_time` time NOT NULL,
  `home_team` varchar(100) NOT NULL,
  `away_team` varchar(100) NOT NULL,
  `stadium_id` int DEFAULT NULL,
  `league_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_id`, `match_date`, `match_time`, `home_team`, `away_team`, `stadium_id`, `league_id`) VALUES
(1, '2024-08-10', '15:00:00', 'Liverpool', 'Manchester City', 1, 1),
(2, '2024-08-12', '16:30:00', 'Barcelona', 'Real Madrid', 3, 2),
(3, '2024-08-15', '14:00:00', 'AC Milan', 'Juventus', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int NOT NULL,
  `player_name` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `team_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `player_name`, `position`, `age`, `nationality`, `team_id`) VALUES
(1, 'Adrian (13)', 'Goalkeeper', 20, 'Lithuania', 1),
(2, 'Alisson (1)', 'Goalkeeper', 38, 'Albania', 1),
(3, 'Caoimhín Kelleher (62)', 'Goalkeeper', 38, 'Cape Verde', 1),
(4, 'Fabian Mrozek (93)', 'Goalkeeper', 38, 'Martinique', 1),
(5, 'Amara Nallo (65)', 'Defender', 37, 'Estonia', 1),
(6, 'Andrew Robertson (26)', 'Defender', 34, 'Bulgaria', 1),
(7, 'Calum Scanlon (48)', 'Defender', 19, 'Vanuatu', 1),
(8, 'Conor Bradley (84)', 'Defender', 38, 'French Polynesia', 1),
(9, 'Ibrahima Konaté (5)', 'Defender', 27, 'Qatar', 1),
(10, 'James Norris', 'Defender', 32, 'Cape Verde', 1),
(11, 'Jarell Quansah (78)', 'Defender', 20, 'Sierra Leone', 1),
(12, 'Joe Gomez (2)', 'Defender', 28, 'Guadeloupe', 1),
(13, 'Joel Matip (32)', 'Defender', 18, 'Barbados', 1),
(14, 'Kostas Tsimikas (21)', 'Defender', 24, 'Guadeloupe', 1),
(15, 'Rhys Williams', 'Defender', 34, 'Samoa', 1),
(16, 'Trent Alexander-Arnold (66)', 'Defender', 37, 'Philippines', 1),
(17, 'Virgil van Dijk (4)', 'Defender', 18, 'New Caledonia', 1),
(18, 'Alexis Mac Allister (10)', 'Midfielder', 33, 'Israel', 1),
(19, 'Bobby Clark (42)', 'Midfielder', 35, 'Chad', 1),
(20, 'Curtis Jones (17)', 'Midfielder', 23, 'Maldives', 1),
(21, 'Dominik Szoboszlai (8)', 'Midfielder', 35, 'Czech Republic', 1),
(22, 'Harvey Elliott (19)', 'Midfielder', 31, 'Mongolia', 1),
(23, 'James McConnell (53)', 'Midfielder', 22, 'Sweden', 1),
(24, 'Luca Stephenson', 'Midfielder', 34, 'Brazil', 1),
(25, 'Mateusz Musiałowski (92)', 'Midfielder', 40, 'Turkey', 1),
(26, 'Ryan Gravenberch (38)', 'Midfielder', 39, 'Saudi Arabia', 1),
(27, 'Stefan Bajčetić (43)', 'Midfielder', 37, 'Dominica', 1),
(28, 'Thiago (6)', 'Midfielder', 33, 'Singapore', 1),
(29, 'Thomas Hill (83)', 'Midfielder', 22, 'Ecuador', 1),
(30, 'Treymaurice Nyoni (98)', 'Midfielder', 35, 'Afghanistan', 1),
(31, 'Wataru Endo (3)', 'Midfielder', 31, 'Central African Republic', 1),
(32, 'Ben Doak (50)', 'Forward', 21, 'Iran', 1),
(33, 'Cody Gakpo (18)', 'Forward', 40, 'Eritrea', 1),
(34, 'Darwin Núñez (9)', 'Forward', 29, 'Liberia', 1),
(35, 'Diogo Jota (20)', 'Forward', 25, 'Hong Kong', 1),
(36, 'Jayden Danns (76)', 'Forward', 20, 'Myanmar', 1),
(37, 'Kaide Gordon (49)', 'Forward', 33, 'Malta', 1),
(38, 'Lewis Koumas (67)', 'Forward', 39, 'Cuba', 1),
(39, 'Luis Díaz (7)', 'Forward', 38, 'Netherlands', 1),
(40, 'Mohamed Salah (11)', 'Forward', 38, 'Ethiopia', 1),
(41, 'Kang Ju-Hyok (21)', 'Goalkeeper', 24, 'Nicaragua', 2),
(42, 'Sin Tae-Song', 'Goalkeeper', 20, 'Tokelau', 2),
(43, 'Yu Kwang-Jun', 'Goalkeeper', 19, 'Iraq', 2),
(44, 'Choe Jin-Nam', 'Defender', 26, 'Western Sahara', 2),
(45, 'Choe Ok-Chol', 'Defender', 25, 'Eritrea', 2),
(46, 'Jang Kuk-Chol (3)', 'Defender', 32, 'Oman', 2),
(47, 'Jong Kum-Song', 'Defender', 21, 'Liberia', 2),
(48, 'Kang Kuk-Chol (14)', 'Defender', 24, 'Cayman Islands', 2),
(49, 'Kim Kyong-Sok', 'Defender', 32, 'Australia', 2),
(50, 'Kim Yu-Song', 'Defender', 33, 'Croatia', 2),
(51, 'Jong Il-Gwan (11)', 'Midfielder', 36, 'Iraq', 2),
(52, 'Kim Hyon', 'Midfielder', 27, 'Marshall Islands', 2),
(53, 'Kim Kuk-Bom (8)', 'Midfielder', 40, 'Greenland', 2),
(54, 'Kim Pom-Hyok', 'Midfielder', 33, 'Moldova', 2),
(55, 'Kim Sung-Hye', 'Midfielder', 37, 'Suriname', 2),
(56, 'Kye Tam', 'Midfielder', 38, 'Guadeloupe', 2),
(57, 'Mun In-Ju', 'Midfielder', 18, 'Puerto Rico', 2),
(58, 'Paek Chung-Song', 'Midfielder', 21, 'Saudi Arabia', 2),
(59, 'Ri Un-Chol (15)', 'Midfielder', 21, 'Georgia', 2),
(60, 'Choe Ju-Song (27)', 'Forward', 39, 'Timor-Leste', 2),
(61, 'Han Kwang-Song (7)', 'Forward', 36, 'Moldova', 2),
(62, 'Kim Kuk-Jin', 'Forward', 38, 'Vietnam', 2),
(63, 'Ri Il-Song', 'Forward', 38, 'Azerbaijan', 2),
(64, 'Ri Jo-Guk', 'Forward', 26, 'Lao People\'s Democratic Republic', 2),
(65, 'Ander Astralaga (26)', 'Goalkeeper', 39, 'Nigeria', 3),
(66, 'Diego Kochen (31)', 'Goalkeeper', 25, 'Russian Federation', 3),
(67, 'Iñaki Peña (13)', 'Goalkeeper', 32, 'Italy', 3),
(68, 'Marc-André ter Stegen (1)', 'Goalkeeper', 30, 'Cook Islands', 3),
(69, 'Áron Yaakobishvili (36)', 'Goalkeeper', 32, 'Wallis and Futuna', 3),
(70, 'Alejandro Baldé (3)', 'Defender', 35, 'Senegal', 3),
(71, 'Andreas Christensen (15)', 'Defender', 33, 'Djibouti', 3),
(72, 'Héctor Fort (39)', 'Defender', 24, 'Cuba', 3),
(73, 'Inigo Martinez (5)', 'Defender', 26, 'Bouvet Island (Bouvetoya)', 3),
(74, 'João Cancelo (2)', 'Defender', 26, 'Bouvet Island (Bouvetoya)', 3),
(75, 'Jules Koundé (23)', 'Defender', 33, 'Venezuela', 3),
(76, 'Marcos Alonso (17)', 'Defender', 19, 'Tunisia', 3),
(77, 'Mikayil Faye (41)', 'Defender', 36, 'Bolivia', 3),
(78, 'Pau Cubarsí (33)', 'Defender', 32, 'Monaco', 3),
(79, 'Ronald Araújo (4)', 'Defender', 20, 'Singapore', 3),
(80, 'Sergi Roberto (20)', 'Defender', 28, 'Guinea-Bissau', 3),
(81, 'Aleix Garrido (34)', 'Midfielder', 31, 'Togo', 3),
(82, 'Fermín (32)', 'Midfielder', 38, 'Panama', 3),
(83, 'Frenkie de Jong (21)', 'Midfielder', 21, 'Isle of Man', 3),
(84, 'Gavi (6)', 'Midfielder', 31, 'Martinique', 3),
(85, 'Ilkay Gündoğan (22)', 'Midfielder', 35, 'Lao People\'s Democratic Republic', 3),
(86, 'Marc Casadó (30)', 'Midfielder', 29, 'Korea', 3),
(87, 'Oriol Romeu (18)', 'Midfielder', 38, 'Jersey', 3),
(88, 'Pau Prim (40)', 'Midfielder', 36, 'Niue', 3),
(89, 'Pedri (8)', 'Midfielder', 32, 'British Virgin Islands', 3),
(90, 'Unai Hernández (35)', 'Midfielder', 33, 'Brunei Darussalam', 3),
(91, 'Ferran Torres (7)', 'Forward', 39, 'Heard Island and McDonald Islands', 3),
(92, 'João Félix (14)', 'Forward', 36, 'Sierra Leone', 3),
(93, 'Lamine Yamal (27)', 'Forward', 27, 'Cook Islands', 3),
(94, 'Marc Guiu (38)', 'Forward', 30, 'Christmas Island', 3),
(95, 'Pau Victor (37)', 'Forward', 19, 'Wallis and Futuna', 3),
(96, 'Raphinha (11)', 'Forward', 36, 'Burundi', 3),
(97, 'Robert Lewandowski (9)', 'Forward', 37, 'Cayman Islands', 3),
(98, 'Vitor Roque (19)', 'Forward', 19, 'Russian Federation', 3),
(99, 'Ángel Alarcón (29)', 'Forward', 29, 'Madagascar', 3),
(100, 'Andriy Lunin (13)', 'Goalkeeper', 39, 'Palestinian Territory', 4),
(101, 'Diego Piñeiro (26)', 'Goalkeeper', 39, 'Kiribati', 4),
(102, 'Fran González (30)', 'Goalkeeper', 25, 'Bangladesh', 4),
(103, 'Kepa Arrizabalaga (25)', 'Goalkeeper', 24, 'Guadeloupe', 4),
(104, 'Lucas Cañizares (31)', 'Goalkeeper', 25, 'Gabon', 4),
(105, 'Mario de Luis (39)', 'Goalkeeper', 34, 'Benin', 4),
(106, 'Thibaut Courtois (1)', 'Goalkeeper', 24, 'Honduras', 4),
(107, 'Antonio Rüdiger (22)', 'Defender', 24, 'Vietnam', 4),
(108, 'Álvaro Carrillo (34)', 'Defender', 18, 'Colombia', 4),
(109, 'Dani Carvajal (2)', 'Defender', 33, 'Hong Kong', 4),
(110, 'David Alaba (4)', 'Defender', 34, 'Kyrgyz Republic', 4),
(111, 'Edgar Pujol (37)', 'Defender', 37, 'Czech Republic', 4),
(112, 'Ferland Mendy (23)', 'Defender', 19, 'Kazakhstan', 4),
(113, 'Fran García (20)', 'Defender', 35, 'Italy', 4),
(114, 'Jacobo Ramón (41)', 'Defender', 18, 'Turkey', 4),
(115, 'Nacho (6)', 'Defender', 31, 'Tanzania', 4),
(116, 'Vinícius Tobias (36)', 'Defender', 38, 'Paraguay', 4),
(117, 'Éder Militão (3)', 'Defender', 40, 'Turks and Caicos Islands', 4),
(118, 'Arda Güler (24)', 'Midfielder', 23, 'Pitcairn Islands', 4),
(119, 'Aurélien Tchouaméni (18)', 'Midfielder', 37, 'Guinea', 4),
(120, 'Brahim Diaz (21)', 'Midfielder', 19, 'Honduras', 4),
(121, 'Dani Ceballos (19)', 'Midfielder', 29, 'Turkey', 4),
(122, 'Eduardo Camavinga (12)', 'Midfielder', 19, 'Portugal', 4),
(123, 'Federico Valverde (15)', 'Midfielder', 24, 'Moldova', 4),
(124, 'Jude Bellingham (5)', 'Midfielder', 34, 'Azerbaijan', 4),
(125, 'Lucas Vazquez (17)', 'Midfielder', 32, 'Egypt', 4),
(126, 'Luka Modrić (10)', 'Midfielder', 29, 'Guernsey', 4),
(127, 'Mario Martín (28)', 'Midfielder', 24, 'Paraguay', 4),
(128, 'Nico Paz (32)', 'Midfielder', 39, 'Congo', 4),
(129, 'Théo Zidane (38)', 'Midfielder', 22, 'Equatorial Guinea', 4),
(130, 'Toni Kroos (8)', 'Midfielder', 25, 'Chad', 4),
(131, 'Gonzalo García (33)', 'Forward', 39, 'Ukraine', 4),
(132, 'Joselu (14)', 'Forward', 36, 'Guinea-Bissau', 4),
(133, 'Rodrygo (11)', 'Forward', 36, 'Nepal', 4),
(134, 'Vinícius Júnior (7)', 'Forward', 22, 'United States Minor Outlying Islands', 4),
(135, 'Álvaro Rodríguez (29)', 'Forward', 29, 'Grenada', 4),
(136, 'Andrea Bartoccioni (78)', 'Goalkeeper', 26, 'Cook Islands', 5),
(137, 'Antonio Mirante (83)', 'Goalkeeper', 38, 'Cook Islands', 5),
(138, 'Lapo Nava (69)', 'Goalkeeper', 36, 'Dominican Republic', 5),
(139, 'Lorenzo Torriani (96)', 'Goalkeeper', 22, 'Afghanistan', 5),
(140, 'Marco Sportiello (57)', 'Goalkeeper', 24, 'Iceland', 5),
(141, 'Mike Maignan (16)', 'Goalkeeper', 36, 'Niger', 5),
(142, 'Noah Raveyre (92)', 'Goalkeeper', 27, 'Argentina', 5),
(143, 'Alessandro Florenzi (42)', 'Defender', 30, 'Gibraltar', 5),
(144, 'Clinton Nsiala-Makengo (84)', 'Defender', 32, 'Norway', 5),
(145, 'Davide Bartesaghi (95)', 'Defender', 32, 'Denmark', 5),
(146, 'Davide Calabria (2)', 'Defender', 21, 'Vietnam', 5),
(147, 'Fikayo Tomori (23)', 'Defender', 32, 'Swaziland', 5),
(148, 'Jan Šimić (82)', 'Defender', 35, 'Algeria', 5),
(149, 'Malick Thiaw (28)', 'Defender', 36, 'Dominican Republic', 5),
(150, 'Matteo Gabbia (46)', 'Defender', 28, 'Namibia', 5),
(151, 'Mattia Caldara (30)', 'Defender', 26, 'Maldives', 5),
(152, 'Pierre Kalulu (20)', 'Defender', 27, 'Iraq', 5),
(153, 'Simon Kjær (24)', 'Defender', 37, 'Singapore', 5),
(154, 'Theo Hernandez (19)', 'Defender', 33, 'Indonesia', 5),
(155, 'Álex Jiménez (74)', 'Defender', 24, 'Antigua and Barbuda', 5),
(156, 'Christian Pulisic (11)', 'Midfielder', 28, 'Guernsey', 5),
(157, 'Filippo Terracciano (38)', 'Midfielder', 24, 'Antigua and Barbuda', 5),
(158, 'Ismaël Bennacer (4)', 'Midfielder', 23, 'Poland', 5),
(159, 'Kevin Zeroli (85)', 'Midfielder', 18, 'Tokelau', 5),
(160, 'Ruben Loftus-Cheek (8)', 'Midfielder', 39, 'Mali', 5),
(161, 'Tijjani Reijnders (14)', 'Midfielder', 25, 'British Indian Ocean Territory (Chagos Archipelago)', 5),
(162, 'Tommaso Pobega (32)', 'Midfielder', 38, 'Tunisia', 5),
(163, 'Victor Eletu (81)', 'Midfielder', 21, 'Tuvalu', 5),
(164, 'Yacine Adli (7)', 'Midfielder', 26, 'Kenya', 5),
(165, 'Yunus Musah (80)', 'Midfielder', 26, 'Kuwait', 5),
(166, 'Diego Sia (97)', 'Forward', 19, 'Ecuador', 5),
(167, 'Emil Roback', 'Forward', 21, 'Azerbaijan', 5),
(168, 'Francesco Camarda (73)', 'Forward', 22, 'Uruguay', 5),
(169, 'Luka Jović (15)', 'Forward', 38, 'Zimbabwe', 5),
(170, 'Noah Okafor (17)', 'Forward', 22, 'Bahamas', 5),
(171, 'Olivier Giroud (9)', 'Forward', 18, 'Guam', 5),
(172, 'Rafael Leão (10)', 'Forward', 35, 'Puerto Rico', 5),
(173, 'Samuel Chukwueze (21)', 'Forward', 24, 'Germany', 5),
(174, 'Carlo Pinsoglio (23)', 'Goalkeeper', 22, 'El Salvador', 6),
(175, 'Giovanni Daffara (38)', 'Goalkeeper', 18, 'Grenada', 6),
(176, 'Giovanni Garofani (42)', 'Goalkeeper', 39, 'Trinidad and Tobago', 6),
(177, 'Mattia Perin (36)', 'Goalkeeper', 21, 'Somalia', 6),
(178, 'Simone Scaglia (49)', 'Goalkeeper', 23, 'Namibia', 6),
(179, 'Wojciech Szczęsny (1)', 'Goalkeeper', 27, 'Ukraine', 6),
(180, 'Alex Sandro (12)', 'Defender', 29, 'Georgia', 6),
(181, 'Andrea Cambiaso (27)', 'Defender', 31, 'United Arab Emirates', 6),
(182, 'Bremer (3)', 'Defender', 28, 'Botswana', 6),
(183, 'Daniele Rugani (24)', 'Defender', 19, 'Gabon', 6),
(184, 'Danilo (6)', 'Defender', 32, 'El Salvador', 6),
(185, 'Federico Gatti (4)', 'Defender', 39, 'Zambia', 6),
(186, 'Mattia De Sciglio (2)', 'Defender', 38, 'United States Minor Outlying Islands', 6),
(187, 'Tarik Muharemović (44)', 'Defender', 33, 'Kuwait', 6),
(188, 'Tiago Djaló (33)', 'Defender', 38, 'Northern Mariana Islands', 6),
(189, 'Adrien Rabiot (25)', 'Midfielder', 25, 'Palau', 6),
(190, 'Carlos Alcaraz (26)', 'Midfielder', 28, 'Cocos (Keeling) Islands', 6),
(191, 'Fabio Miretti (20)', 'Midfielder', 27, 'Faroe Islands', 6),
(192, 'Filip Kostić (11)', 'Midfielder', 34, 'Guernsey', 6),
(193, 'Hans Nicolussi (41)', 'Midfielder', 26, 'Gibraltar', 6),
(194, 'Joseph Nonge Boende (47)', 'Midfielder', 37, 'Kenya', 6),
(195, 'Luis Hasa (50)', 'Midfielder', 34, 'Algeria', 6),
(196, 'Manuel Locatelli (5)', 'Midfielder', 20, 'Bahamas', 6),
(197, 'Nicolò Fagioli (21)', 'Midfielder', 23, 'Christmas Island', 6),
(198, 'Paul Pogba (10)', 'Midfielder', 22, 'Niue', 6),
(199, 'Tim Weah (22)', 'Midfielder', 31, 'Macao', 6),
(200, 'Weston McKennie (16)', 'Midfielder', 36, 'Togo', 6),
(201, 'Arek Milik (14)', 'Forward', 34, 'Antarctica (the territory South of 60 deg S)', 6),
(202, 'Dušan Vlahović (9)', 'Forward', 30, 'Dominican Republic', 6),
(203, 'Federico Chiesa (7)', 'Forward', 32, 'South Georgia and the South Sandwich Islands', 6),
(204, 'Kenan Yıldız (15)', 'Forward', 25, 'Argentina', 6),
(205, 'Leonardo Cerri (45)', 'Forward', 24, 'Germany', 6),
(206, 'Moise Kean (18)', 'Forward', 21, 'United States of America', 6),
(207, 'Nikola Sekulov (39)', 'Forward', 22, 'Bulgaria', 6),
(208, 'Samuel Iling-Junior (17)', 'Forward', 27, 'Brazil', 6),
(209, 'Tommaso Mancini (40)', 'Forward', 24, 'Myanmar', 6);

-- --------------------------------------------------------

--
-- Table structure for table `stadiums`
--

CREATE TABLE `stadiums` (
  `stadium_id` int NOT NULL,
  `stadium_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `capacity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stadiums`
--

INSERT INTO `stadiums` (`stadium_id`, `stadium_name`, `city`, `capacity`) VALUES
(1, 'Anfield', 'Liverpool', 54074),
(2, 'Etihad Stadium', 'Manchester', 55097),
(3, 'Camp Nou', 'Barcelona', 99354),
(4, 'Santiago Bernabeu', 'Madrid', 81044),
(5, 'San Siro', 'Milan', 80018),
(6, 'Allianz Stadium', 'Turin', 41507);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `coach` varchar(100) NOT NULL,
  `league_id` int DEFAULT NULL,
  `stadium_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`, `coach`, `league_id`, `stadium_id`) VALUES
(1, 'Liverpool', 'Jurgen Klopp', 1, 1),
(2, 'Manchester City', 'Pep Guardiola', 1, 2),
(3, 'Barcelona', 'Xavi', 2, 3),
(4, 'Real Madrid', 'Carlo Ancelotti', 2, 4),
(5, 'AC Milan', 'Stefano Pioli', 3, 5),
(6, 'Juventus', 'Massimiliano Allegri', 3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`league_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `home_team` (`home_team`),
  ADD KEY `away_team` (`away_team`),
  ADD KEY `stadium_id` (`stadium_id`),
  ADD KEY `league_id` (`league_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `stadiums`
--
ALTER TABLE `stadiums`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `team_name` (`team_name`),
  ADD KEY `league_id` (`league_id`),
  ADD KEY `stadium_id` (`stadium_id`),
  ADD KEY `idx_team_name` (`team_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leagues`
--
ALTER TABLE `leagues`
  MODIFY `league_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `match_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `stadiums`
--
ALTER TABLE `stadiums`
  MODIFY `stadium_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_team`) REFERENCES `teams` (`team_name`) ON DELETE CASCADE,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_team`) REFERENCES `teams` (`team_name`) ON DELETE CASCADE,
  ADD CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`stadium_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matches_ibfk_4` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`) ON DELETE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`stadium_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
