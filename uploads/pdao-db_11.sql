-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2024 at 03:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdao-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(11) NOT NULL,
  `pwd_id_no` varchar(50) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `suffix` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `disability_type` varchar(255) NOT NULL,
  `date_applied` date NOT NULL,
  `date_issued` date NOT NULL,
  `validity` varchar(255) NOT NULL,
  `pwd_info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive`
--

INSERT INTO `archive` (`id`, `pwd_id_no`, `last_name`, `first_name`, `middle_name`, `suffix`, `age`, `birthdate`, `address`, `disability_type`, `date_applied`, `date_issued`, `validity`, `pwd_info_id`) VALUES
(20, '08-3747-000-0000002', 'Ernesto', 'Abarientos', '', '', 11, '2013-02-01', 'tacloban', 'Cancer (RA11215)', '2024-10-30', '2003-02-28', '3 years', 164),
(21, '08-3747-000-0000004', 'Marimar', 'Aw', '', '', 88, '1936-03-04', 'housing', 'learning', '2024-10-30', '2024-10-30', '3 years', 166),
(25, '08-3747-000-0000005', 'Abarientos', 'Dave', '', '', 4, '2020-01-01', 'housing', 'psychosocial', '2024-11-06', '2018-02-06', '3 years', 167),
(33, '08-3747-000-0000006', 'sdas', 'Dave', '', '', 7, '2017-06-06', 'housing', 'Cancer (RA11215)', '2024-11-06', '2019-02-06', '3 years', 168),
(34, '08-3747-000-0000007', 'Cinco', 'Rafael', '', '', 4, '2020-06-09', 'housing', 'learning', '2024-11-06', '2019-06-06', '3 years', 169),
(35, '08-3747-000-0000008', 'Cinco', 'Ernesto', '', '', 7, '2017-01-11', 'housing', 'hearing', '2019-02-06', '2019-03-06', '3 years', 170),
(41, '08-3747-000-0000009', 'ocio', 'Rafael', '', '', 7, '2017-02-06', 'housing', 'deaf', '2024-11-06', '2021-02-01', '3 years', 171);

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `pwd_id` int(255) DEFAULT NULL,
  `date_created` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `user_id`, `action`, `pwd_id`, `date_created`) VALUES
(179, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000001', 163, '2024-10-30 15:16:05.466950'),
(180, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000002', 164, '2024-10-30 15:18:15.397985'),
(181, 11, 'Admin logged in', NULL, '2024-10-30 15:36:41.059652'),
(182, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000003', 165, '2024-10-30 15:42:26.511488'),
(183, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000004', 166, '2024-10-30 15:43:52.602958'),
(184, 11, 'Admin logged in', NULL, '2024-10-30 17:55:41.992609'),
(185, 11, 'Admin logged in', NULL, '2024-10-31 04:58:30.754119'),
(186, 11, 'Admin logged in', NULL, '2024-11-06 09:18:01.089217'),
(187, 11, 'Admin logged in', NULL, '2024-11-06 09:18:45.149210'),
(188, 10, 'User logged in', NULL, '2024-11-06 09:20:30.967684'),
(189, 11, 'Admin logged in', NULL, '2024-11-06 09:24:46.236239'),
(190, 10, 'User logged in', NULL, '2024-11-06 09:24:58.717687'),
(191, 11, 'Admin logged in', NULL, '2024-11-06 09:37:56.981483'),
(192, 11, 'Admin logged in', NULL, '2024-11-06 09:39:13.917689'),
(193, 10, 'User logged in', NULL, '2024-11-06 09:42:23.941553'),
(194, 11, 'Admin logged in', NULL, '2024-11-06 09:53:29.081872'),
(195, 10, 'User logged in', NULL, '2024-11-06 09:53:46.772461'),
(196, 11, 'Admin logged in', NULL, '2024-11-06 10:09:22.626385'),
(197, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000005', 167, '2024-11-06 10:10:28.761370'),
(198, 10, 'User logged in', NULL, '2024-11-06 10:10:49.657238'),
(199, 11, 'Admin logged in', NULL, '2024-11-06 10:11:33.897996'),
(202, 11, 'Admin logged in', NULL, '2024-11-06 10:19:58.804707'),
(204, 11, 'Admin logged in', NULL, '2024-11-06 10:20:54.497042'),
(207, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000006', 168, '2024-11-06 10:24:06.984506'),
(208, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000007', 169, '2024-11-06 10:25:55.142676'),
(209, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000008', 170, '2024-11-06 11:17:46.290826'),
(210, 11, 'Archived record ID 170 for user ID 11', NULL, '2024-11-06 11:18:02.368635'),
(211, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000009', 171, '2024-11-06 11:24:22.073128'),
(212, 11, 'Archived record ID 171', NULL, '2024-11-06 11:28:50.741665'),
(213, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000010', 172, '2024-11-06 11:30:55.778581'),
(214, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000011', 173, '2024-11-06 11:55:57.384404'),
(215, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000012', 174, '2024-11-06 11:57:36.906634'),
(216, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000013', 175, '2024-11-06 11:59:04.624855'),
(217, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000014', 176, '2024-11-06 12:00:41.654762'),
(218, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000015', 177, '2024-11-06 12:02:46.717313'),
(219, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000016', 178, '2024-11-06 12:04:55.400611'),
(220, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000017', 179, '2024-11-06 12:07:54.071770'),
(221, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000018', 180, '2024-11-06 12:09:25.332546'),
(222, 11, 'Added new PWD information for PWD ID: 08-3747-000-0000019', 181, '2024-11-06 12:10:53.453923'),
(223, 10, 'User logged in', NULL, '2024-11-06 12:24:49.058631'),
(224, 11, 'Admin logged in', NULL, '2024-11-06 12:26:19.239935'),
(225, 10, 'User logged in', NULL, '2024-11-06 12:35:06.879933'),
(226, 16, 'Head logged in', NULL, '2024-11-06 12:36:28.031484'),
(227, 11, 'Admin logged in', NULL, '2024-11-06 12:55:40.490569'),
(228, 10, 'User logged in', NULL, '2024-11-06 13:27:52.618313'),
(229, 11, 'Admin logged in', NULL, '2024-11-06 13:28:54.627495'),
(230, 10, 'User logged in', NULL, '2024-11-06 13:30:50.216961'),
(231, 11, 'Admin logged in', NULL, '2024-11-06 13:48:16.866578');

-- --------------------------------------------------------

--
-- Table structure for table `pwd_info`
--

CREATE TABLE `pwd_info` (
  `id` int(255) NOT NULL,
  `pwd_id_no` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `suffix` varchar(255) NOT NULL,
  `disability_type` varchar(255) NOT NULL,
  `disability_cause` varchar(255) NOT NULL,
  `cause_type` varchar(255) NOT NULL,
  `date_applied` date NOT NULL,
  `date_issued` date NOT NULL,
  `validity` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `age` int(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `civil_status` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `attainment` varchar(255) NOT NULL,
  `employment` varchar(255) NOT NULL,
  `employment_type` varchar(255) NOT NULL,
  `is_archived` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pwd_info`
--

INSERT INTO `pwd_info` (`id`, `pwd_id_no`, `last_name`, `first_name`, `middle_name`, `suffix`, `disability_type`, `disability_cause`, `cause_type`, `date_applied`, `date_issued`, `validity`, `birthdate`, `age`, `gender`, `civil_status`, `area`, `barangay`, `address`, `contact_number`, `attainment`, `employment`, `employment_type`, `is_archived`) VALUES
(163, '08-3747-000-0000001', 'Abar', 'Ernesto', '', '', 'Cancer (RA11215)', 'Congenital/Inborn', 'adhd', '2024-10-30', '2024-10-30', '5 years', '2010-03-01', 14, 'male', 'widow', 'Area 1', 'BRGY. 72', 'tacloban', '09924421654', 'Post Graduate', 'Government', 'Seasonal', 0),
(164, '08-3747-000-0000002', 'Ernesto', 'Abarientos', '', '', 'Cancer (RA11215)', 'Congenital/Inborn', 'adhd', '2024-10-30', '2003-02-28', '3 years', '2013-02-01', 11, 'male', 'widow', 'Area 3', 'BRGY 82', 'tacloban', '09924421654', 'Vocational', 'Self-Employed', 'Seasonal', 1),
(165, '08-3747-000-0000003', 'Abarientos', 'Dave', '', 'jr', 'mental', 'Congenital/Inborn', 'adhd', '2024-10-30', '2024-10-30', '3 years', '2017-02-01', 7, 'male', 'single', 'Area 1', 'BRGY. 72', 'housing', '09924421654', 'Vocational', 'Government', 'Casual', 0),
(166, '08-3747-000-0000004', 'Marimar', 'Aw', '', '', 'learning', 'Congenital/Inborn', 'adhd', '2024-10-30', '2024-10-30', '3 years', '1936-03-04', 88, 'female', 'widow', 'Area 2', 'BRGY. 6', 'housing', '09924421654', 'Vocational', 'Private', 'Contractual', 1),
(167, '08-3747-000-0000005', 'Abarientos', 'Dave', '', '', 'psychosocial', 'Acquired', 'adhd', '2024-11-06', '2018-02-06', '3 years', '2020-01-01', 4, 'male', 'widow', 'Area 3', 'BRGY 83', 'housing', '09924421654', 'Vocational', 'Private', 'Seasonal', 1),
(168, '08-3747-000-0000006', 'sdas', 'Dave', '', '', 'Cancer (RA11215)', 'Acquired', 'adhd', '2024-11-06', '2019-02-06', '3 years', '2017-06-06', 7, 'male', 'widow', 'Area 4', 'BRGY 59B', 'housing', '09924421654', 'College', 'Self-Employed', 'Seasonal', 1),
(169, '08-3747-000-0000007', 'Cinco', 'Rafael', '', '', 'learning', 'Congenital/Inborn', 'adhd', '2024-11-06', '2019-06-06', '3 years', '2020-06-09', 4, 'male', 'widow', 'Area 6', 'BRGY 18', 'housing', '09924421654', 'Senior High School', 'Self-Employed', 'Casual', 1),
(170, '08-3747-000-0000008', 'Cinco', 'Ernesto', '', '', 'hearing', 'Congenital/Inborn', 'amputee', '2019-02-06', '2019-03-06', '3 years', '2017-01-11', 7, 'male', 'live_in', 'Area 4', 'BRGY 59A', 'housing', '09924421654', 'Kindergarten', 'Unemployed', 'None', 1),
(171, '08-3747-000-0000009', 'ocio', 'Rafael', '', '', 'deaf', 'Congenital/Inborn', 'adhd', '2024-11-06', '2021-02-01', '3 years', '2017-02-06', 7, 'male', 'married', 'Area 1', 'BRGY. 67', 'housing', '09924421654', 'Elementary', 'None', 'None', 1),
(172, '08-3747-000-0000010', 'Abarientosasdasdasdasd', 'Dave', '', '', 'Speech & Language Impairment', 'Congenital/Inborn', 'adhd', '2024-11-06', '2019-02-06', '3 years', '2020-06-09', 4, 'female', 'married', 'Area 6', 'BRGY 26', 'housing', '09924421654', 'None', 'Unemployed', 'Regular', 0),
(173, '08-3747-000-0000011', 'Castillo', 'Marty', 'dumara', '', 'deaf', 'Congenital/Inborn', 'adhd', '2020-01-01', '2020-01-02', '3 years', '2008-01-05', 32, 'male', 'married', 'Area 1', 'BRGY. 72', 'Housing', '09924421654', 'Elementary', 'Unemployed', 'None', 0),
(174, '08-3747-000-0000012', 'Samson', 'Cristine', '', 'III', 'orthopedic', 'Congenital/Inborn', 'adhd', '2004-01-10', '2004-02-10', '3 years', '1992-05-06', 17, 'male', 'married', 'Area 3', 'BRGY 83B', 'NPA', '09924421654', 'Senior High School', 'Government', 'Permanent', 0),
(175, '08-3747-000-0000013', 'Pascual', 'Piolo', '', '', 'Speech & Language Impairment', 'Acquired', 'amputee', '2024-11-06', '2024-11-07', '5 years', '2007-02-06', 76, 'male', 'single', 'Area 5', 'BRGY 44A', 'BIsla hain', '09924421654', 'None', 'None', 'None', 0),
(176, '08-3747-000-0000014', 'Soho', 'Jessica', '', '', 'deaf', 'Acquired', 'adhd', '2022-05-06', '2022-06-06', '3 years', '1948-01-02', 60, 'female', 'widower', 'Area 3', 'BRGY 84', 'kunoha', '09924421654', 'College', 'Unemployed', 'None', 0),
(177, '08-3747-000-0000015', 'Raval', 'Jeric', '', '', 'orthopedic', 'Acquired', 'adhd', '2020-01-06', '2020-12-06', '3 years', '1964-05-06', 60, 'male', 'widow', 'Area 3', 'BRGY 83A', 'kunoha', '09924421654', 'Elementary', 'None', 'None', 0),
(178, '08-3747-000-0000016', 'Rivera', 'Marian', '', '', 'mental', 'Congenital/Inborn', 'adhd', '2024-11-06', '2024-11-06', '5 years', '1998-02-08', 26, 'male', 'married', 'Area 1', 'BRGY. 72', 'housing', '09924421654', 'Junior High School', 'Private', 'Regular', 0),
(179, '08-3747-000-0000017', 'Caluag', 'Eddy', '', 'III', 'deaf', 'Congenital/Inborn', 'amputee', '2006-01-06', '2006-02-06', '5 years', '1950-02-08', 74, 'male', 'widow', 'Area 1', 'BRGY. 68', 'housing', '09924421654', 'Kindergarten', 'Unemployed', 'None', 0),
(180, '08-3747-000-0000018', 'Hermosa', 'Cristine', '', 'jr', 'Speech & Language Impairment', 'Congenital/Inborn', 'adhd', '2022-01-06', '2022-02-06', '5 years', '1967-02-05', 57, 'male', 'married', 'Area 9', 'BRGY 94A', 'kunoha', '09924421654', 'College', 'Government', 'Regular', 0),
(181, '08-3747-000-0000019', 'Panganiban', 'Angelica', '', '', 'Visual/Blind', 'Acquired', 'adhd', '2023-05-20', '2023-05-21', '3 years', '1995-05-03', 29, 'female', 'single', 'Area 4', 'BRGY 60', 'kunoha', '09924421654', 'College', 'Unemployed', 'None', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role` enum('user','admin','head') NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role`, `username`, `password`, `name`) VALUES
(10, 'user', 'user', '$2y$10$uv0DZKtWe5syaeF3gGPZjeFLlb2AHqeUyeyoW8zmZDMK.p2l4Fx7q', 'sample user'),
(11, 'admin', 'admin', '$2y$10$qp3p5yvIaCNbf3St7TANwOSqjwv4Hgv2MTfsw93AYYfBIyqWF5MEG', 'sample admin'),
(12, 'user', 'samuel', '$2y$10$NXXYEZj0LTtERGo22wJXsuKsL9n/iFjN7SmFc47oj2iT9M2Ww6fi6', 'samuel'),
(14, 'admin', 'dave12', '$2y$10$pXd6H0aPgpv3YSACwKlEi.BRfvcW9xdM2C/GXflkSiFpnxxHTv7AG', 'Julius'),
(15, 'user', 'genson901', '$2y$10$SnUqLP49CDczFYy.daaSpOEqgraHpZ/966NvsYTfNzPyFB.2yf0hy', 'genson901'),
(16, 'head', 'head', '$2y$10$ZmpjR.MUEGKZNvGBJAx/JOJ35uIZn.MN5B3CHuPUYjxUyVt2ozEpS', 'sample head');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pwd_info_id` (`pwd_info_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_pwd_id` (`pwd_id`);

--
-- Indexes for table `pwd_info`
--
ALTER TABLE `pwd_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `pwd_info`
--
ALTER TABLE `pwd_info`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archive`
--
ALTER TABLE `archive`
  ADD CONSTRAINT `archive_ibfk_1` FOREIGN KEY (`pwd_info_id`) REFERENCES `pwd_info` (`id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_pwd_id` FOREIGN KEY (`pwd_id`) REFERENCES `pwd_info` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
