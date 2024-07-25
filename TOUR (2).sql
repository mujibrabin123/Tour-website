-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 23, 2024 at 12:50 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TOUR`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'rabin', 'rabin@gmail.com', 'rabin123');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `place_name` varchar(255) NOT NULL,
  `number_of_guests` int NOT NULL,
  `arrival_date` date NOT NULL,
  `leaving_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `place_name`, `number_of_guests`, `arrival_date`, `leaving_date`, `created_at`, `user_id`) VALUES
(1, 'messina', 2, '2024-06-21', '2024-06-22', '2024-06-14 16:48:05', 0),
(2, 'toarmina', 3, '2024-06-15', '2024-06-29', '2024-06-14 18:05:06', 1),
(3, 'messina', 3, '2024-06-28', '2024-06-30', '2024-06-14 18:55:41', 1),
(4, 'catania', 2, '2024-06-23', '2024-06-27', '2024-06-14 23:26:39', 10),
(5, 'toarmina', 2, '2024-06-28', '2024-06-22', '2024-06-15 15:54:34', 1),
(6, 'toarmina', 2, '2024-06-22', '2024-06-23', '2024-06-15 16:14:07', 1),
(7, 'toarmina', 2, '2024-06-22', '2024-06-23', '2024-06-15 16:14:23', 1),
(8, 'toarmina', 2, '2024-06-22', '2024-06-23', '2024-06-15 16:17:37', 1),
(9, 'catania', 6, '2024-06-28', '2024-06-28', '2024-06-17 18:04:51', 1),
(10, 'messina', 4, '2024-07-31', '2024-07-06', '2024-07-02 19:45:07', 11),
(11, 'toarmina', 4, '2024-07-18', '2024-07-18', '2024-07-02 19:50:54', 11),
(12, 'catania', 2, '2024-07-25', '2024-07-26', '2024-07-04 21:58:08', 11),
(13, 'messina', 4, '2024-07-27', '2024-07-30', '2024-07-05 08:19:34', 11),
(14, 'faryab', 4, '2024-07-27', '2024-07-30', '2024-07-05 08:20:21', 11),
(15, 'naples', 3, '2024-07-06', '2024-07-07', '2024-07-05 09:53:52', 11);

-- --------------------------------------------------------

--
-- Table structure for table `contact_forms`
--

CREATE TABLE `contact_forms` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_forms`
--

INSERT INTO `contact_forms` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`) VALUES
(1, 'Mujibullah Rabin', 'mujib.rabin@gmail.com', '3246236071', 'city', 'i can not book its giving error about my card\r\n', '2024-06-06 13:35:15'),
(2, '', '', '', '', '', '2024-06-06 15:04:06'),
(3, '', '', '', '', '', '2024-06-14 11:59:56'),
(4, 'Mujibullah Rabin', 'mujib.rabin@gmail.com', '3246236071', 'city', 'i can not book', '2024-06-14 18:55:24'),
(5, 'Mujibullah Rabin', 'mujib.rabin@gmail.com', '3246236071', 'city', 'what the is this', '2024-06-14 19:40:38'),
(6, 'mola', 'mola@gmnail.com', '3246236071', 'book', 'i can not book', '2024-06-14 19:41:19'),
(7, 'Mujibullah Rabin', 'Mujibullah.rabin@studenti.unime.it', '3246236071', 'book', ';l,mk;l', '2024-06-15 16:00:24'),
(8, 'farhad', 'ata@gmail.com', '3474202323', 'begi khoda', 'bsdfsa', '2024-06-15 18:13:28'),
(9, 'farhad', 'ata@gmail.com', '3474202323', 'begi khoda', 'i can not book a ticket please guide me how can i do it?', '2024-06-15 18:25:24'),
(10, '', '', '', '', '', '2024-06-17 15:59:45'),
(11, '', '', '', '', '', '2024-06-17 15:59:45'),
(12, 'Mujibullah Rabin', 'mujib.rabin@gmail.com', '3246236071', 'book', 'shfiuawhndf', '2024-07-02 19:53:54'),
(13, '', '', '', '', '', '2024-07-04 21:49:07'),
(14, 'ahmad', 'ahmad@gmail.com', '12345678', 'checking', 'i am checkin gdoes it work or not\r\n', '2024-07-05 08:18:12'),
(15, 'checking', 'admin@example.com', '7897', 'sdkfb', 'sdkifbiusdhf', '2024-07-05 08:19:09'),
(16, 'shahir', 'shahir@gmail.com', '21651', '465sd4fs', 'sdjfiasdfsadf', '2024-07-05 08:21:47'),
(17, 'lsdhf', 'kjsdfh@gmail.com', '45564764', 'sladihfiuasdh', 'sdpofjoiasdfj', '2024-07-23 12:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `review_text` text NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `review_text`, `rating`, `created_at`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel neque sapien. Integer accumsan lectus at lorem pharetra, at bibendum odio tristique.', 4.50, '2024-05-18 17:25:16'),
(2, 2, 'Donec auctor ex eget urna fermentum, in tempor nunc cursus. Nulla facilisi. Fusce non ante aliquam, vehicula lorem ut, ultricies magna.', 5.00, '2024-05-18 17:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `phone`, `address`, `email`, `password`, `registration_date`, `role`) VALUES
(1, 'adeebullah', 'asad', 'hamidi', 'male', '3246236071', 'Viale palatucci 13\r\nCUS-Unime residence', 'adeeb@gmail.com', 'adeeb', '2024-06-14 14:23:51', 'user'),
(10, 'Mujibullah', 'kh', 'Rabin', 'male', '3246236071', 'Viale palatucci 13\r\nCUS-Unime residence', 'mujib.rabin@gmail.com', '$2y$10$5wQfbc/fQZIgQTXCdUlk3OMDnt4snsuKQ3zs7Slmlf/OYvU5b0YVa', '2024-06-14 22:29:13', 'user'),
(11, 'ahmad', '', 'noory', 'male', '3246236071', 'Viale palatucci 13\r\nCUS-Unime residence', 'ahmad@gmail.com', '$2y$10$aIqjoWZ08Bx74hxt93MO7.bBptORIUq4rwuYDxl7IdU2IiZh9H8x.', '2024-07-02 19:25:14', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `login_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `login_time`) VALUES
(1, 1, '2024-06-27 21:19:07'),
(2, 1, '2024-06-27 21:21:35'),
(3, 1, '2024-06-27 21:30:50'),
(4, 1, '2024-06-27 21:31:32'),
(5, 1, '2024-06-27 21:31:37'),
(6, 1, '2024-06-27 21:55:25'),
(7, 1, '2024-06-27 22:23:10'),
(8, 1, '2024-06-27 22:49:46'),
(9, 1, '2024-06-27 23:18:56'),
(10, 1, '2024-06-27 23:19:35'),
(11, 1, '2024-06-27 23:19:54'),
(12, 1, '2024-06-27 23:21:51'),
(13, 1, '2024-06-27 23:24:06'),
(14, 1, '2024-06-28 19:59:40'),
(15, 11, '2024-07-02 19:25:26'),
(16, 11, '2024-07-02 19:25:38'),
(17, 11, '2024-07-02 19:36:44'),
(18, 11, '2024-07-02 19:40:33'),
(19, 11, '2024-07-02 19:44:31'),
(20, 11, '2024-07-02 19:49:22'),
(21, 11, '2024-07-02 19:50:37'),
(22, 11, '2024-07-02 19:51:34'),
(23, 11, '2024-07-02 19:52:22'),
(24, 11, '2024-07-02 19:53:39'),
(25, 11, '2024-07-03 14:04:52'),
(26, 11, '2024-07-03 14:05:50'),
(27, 11, '2024-07-03 14:10:16'),
(28, 11, '2024-07-03 15:57:37'),
(29, 11, '2024-07-04 19:40:49'),
(30, 11, '2024-07-04 19:42:24'),
(31, 11, '2024-07-04 20:18:02'),
(32, 11, '2024-07-04 21:49:59'),
(33, 11, '2024-07-04 21:51:34'),
(34, 11, '2024-07-04 22:53:49'),
(35, 11, '2024-07-05 08:15:19'),
(36, 11, '2024-07-05 08:17:17'),
(37, 11, '2024-07-05 08:18:53'),
(38, 11, '2024-07-05 09:34:03'),
(39, 11, '2024-07-05 09:52:20'),
(40, 11, '2024-07-11 18:06:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_forms`
--
ALTER TABLE `contact_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_forms`
--
ALTER TABLE `contact_forms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD CONSTRAINT `user_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
