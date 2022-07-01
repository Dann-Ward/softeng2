-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 01:38 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbciopointswebapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_activity`
--

CREATE TABLE `ci_activity` (
  `activity_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `Max_Value_Points` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_activity`
--

INSERT INTO `ci_activity` (`activity_id`, `title`, `date`, `venue`, `description`, `type`, `dept_id`, `duration`, `Max_Value_Points`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 'long', '2022-06-08', 'lipa batangas', 'to create involvement', 'internal', NULL, 6, 0, NULL, '0000-00-00 00:00:00', '2022-06-30 12:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `division` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_admin` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `address`, `email`, `password`, `contact_number`, `date_created`, `date_updated`) VALUES
(1, 'Juan', 'Bayani', 'Dela Cruz', 'Barangay Mabuti, Batangas City', 'test@email.com', '$2y$10$EbURcrgrD62IjGUM.x.eMugX5lcd8UwZw5c/L.iJTRlSnutpThox.', '09123456789', '2022-06-21 09:27:59', '2022-06-21 09:28:47'),
(2, 'alistaire rafael', 'malabanan', 'carandang', 'Bilogbilog Tanauan City batangas', 'alistaire024@gmail.com', '$2y$10$1IMBwOAiTxdYK0IRBezPMOKlGV.HBnfaCTrDdMINbpqBKoF8ytU6S', '09568423162', '2022-06-30 12:02:13', '2022-06-30 12:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_history`
--

CREATE TABLE `user_activity_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_cip`
--

CREATE TABLE `user_cip` (
  `cip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_cip` int(11) DEFAULT NULL,
  `date_issued` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_request`
--

CREATE TABLE `user_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `supporting_docs` mediumblob NOT NULL,
  `rendered_hours` int(11) NOT NULL,
  `date_requested` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_status`
--

CREATE TABLE `user_request_status` (
  `req_status_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_activity`
--
ALTER TABLE `ci_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_activity_user` (`user_id`),
  ADD KEY `fk_department_dept` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `fk_role_user` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_activity_history`
--
ALTER TABLE `user_activity_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `fk_history_user` (`user_id`),
  ADD KEY `fk_history_activity` (`activity_id`),
  ADD KEY `fk_history_request` (`request_id`);

--
-- Indexes for table `user_cip`
--
ALTER TABLE `user_cip`
  ADD PRIMARY KEY (`cip_id`),
  ADD KEY `fk_cip_user` (`user_id`);

--
-- Indexes for table `user_request`
--
ALTER TABLE `user_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_request_user` (`user_id`),
  ADD KEY `fk_request_activity` (`activity_id`);

--
-- Indexes for table `user_request_status`
--
ALTER TABLE `user_request_status`
  ADD PRIMARY KEY (`req_status_id`),
  ADD KEY `fk_reqstat_request` (`request_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ci_activity`
--
ALTER TABLE `ci_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_activity_history`
--
ALTER TABLE `user_activity_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_cip`
--
ALTER TABLE `user_cip`
  MODIFY `cip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request`
--
ALTER TABLE `user_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request_status`
--
ALTER TABLE `user_request_status`
  MODIFY `req_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ci_activity`
--
ALTER TABLE `ci_activity`
  ADD CONSTRAINT `fk_activity_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_department_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `fk_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_activity_history`
--
ALTER TABLE `user_activity_history`
  ADD CONSTRAINT `fk_history_activity` FOREIGN KEY (`activity_id`) REFERENCES `ci_activity` (`activity_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_history_request` FOREIGN KEY (`request_id`) REFERENCES `user_request` (`request_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_history_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_cip`
--
ALTER TABLE `user_cip`
  ADD CONSTRAINT `fk_cip_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_request`
--
ALTER TABLE `user_request`
  ADD CONSTRAINT `fk_request_activity` FOREIGN KEY (`activity_id`) REFERENCES `ci_activity` (`activity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_request_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_request_status`
--
ALTER TABLE `user_request_status`
  ADD CONSTRAINT `fk_reqstat_request` FOREIGN KEY (`request_id`) REFERENCES `user_request` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
