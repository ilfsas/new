-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2024 at 04:28 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `service_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL,
  `request_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_types`
--

CREATE TABLE `device_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int UNSIGNED NOT NULL,
  `device_type_id` int UNSIGNED NOT NULL,
  `device_model_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `problem_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Новая заявка',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_parts`
--

CREATE TABLE `request_parts` (
  `id` int UNSIGNED NOT NULL,
  `request_id` int UNSIGNED NOT NULL,
  `part_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `part_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `part_cost` float NOT NULL DEFAULT '0',
  `count` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_user`
--

CREATE TABLE `request_user` (
  `id` int UNSIGNED NOT NULL,
  `request_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `device_types`
--
ALTER TABLE `device_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_type_id` (`device_type_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `request_parts`
--
ALTER TABLE `request_parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `request_user`
--
ALTER TABLE `request_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_types`
--
ALTER TABLE `device_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_parts`
--
ALTER TABLE `request_parts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_user`
--
ALTER TABLE `request_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`device_type_id`) REFERENCES `device_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_parts`
--
ALTER TABLE `request_parts`
  ADD CONSTRAINT `request_parts_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_user`
--
ALTER TABLE `request_user`
  ADD CONSTRAINT `request_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_user_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
