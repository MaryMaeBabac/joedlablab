-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 06:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dashboard_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_earnings`
--

CREATE TABLE `admin_earnings` (
  `ID` int(11) NOT NULL DEFAULT 0,
  `EARNINGS_MONTHLY` int(10) DEFAULT NULL,
  `EARNINGS_ANNUALY` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_earnings`
--

INSERT INTO `admin_earnings` (`ID`, `EARNINGS_MONTHLY`, `EARNINGS_ANNUALY`) VALUES
(1, 0, 0),
(2, 780, 780);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pending_requests`
--

CREATE TABLE `admin_pending_requests` (
  `ID` int(11) NOT NULL DEFAULT 0,
  `PENDING_REQUESTS` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_pending_requests`
--

INSERT INTO `admin_pending_requests` (`ID`, `PENDING_REQUESTS`) VALUES
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `admin_tasks`
--

CREATE TABLE `admin_tasks` (
  `ID` int(11) NOT NULL DEFAULT 0,
  `TASKS` varchar(255) DEFAULT NULL,
  `STATUS` enum('Completed','Not Completed') DEFAULT 'Not Completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_tasks`
--

INSERT INTO `admin_tasks` (`ID`, `TASKS`, `STATUS`) VALUES
(1, 'Review reports', 'Not Completed'),
(2, 'Update database', 'Not Completed'),
(3, 'Drink coffee', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(24, 12, 9, 1),
(25, 12, 7, 12),
(26, 12, 6, 1),
(27, 12, 5, 1),
(28, 12, 4, 1),
(29, 12, 3, 1),
(30, 12, 2, 1),
(31, 12, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`) VALUES
(1, 1, 'Completed', '2025-03-04 04:58:09'),
(2, 1, 'Completed', '2024-01-15 02:00:00'),
(3, 1, 'Completed', '2025-03-04 05:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 10),
(3, 2, 1, 10),
(4, 3, 1, 2),
(5, 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `stock`, `created_at`, `picture`) VALUES
(1, 'Eggs - Small (per tray)', 110.00, 'Small-sized eggs per tray', 100, '2025-03-03 17:14:18', 'static/img/egg.jpg'),
(2, 'Eggs - Medium (per tray)', 150.00, 'Medium-sized eggs per tray', 100, '2025-03-03 17:14:18', 'static/img/egg.jpg'),
(3, 'Eggs - Large (per tray)', 180.00, 'Large-sized eggs per tray', 100, '2025-03-03 17:14:18', 'static/img/egg.jpg'),
(4, 'Eggs - XL (per tray)', 200.00, 'Extra large-sized eggs per tray', 100, '2025-03-03 17:14:18', 'static/img/egg.jpg'),
(5, 'Eggs - Jumbo (per tray)', 250.00, 'Jumbo-sized eggs per tray', 100, '2025-03-03 17:14:18', 'static/img/egg.jpg'),
(6, 'Piglet (Live)', 255.00, 'Live piglet for sale', 50, '2025-03-03 17:14:18', 'static/img/piglet.jpg'),
(7, 'Fattening Pig (per kg)', 300.00, 'Fattening pig price per kilogram', 30, '2025-03-03 17:14:18', 'static/img/pi.jpeg'),
(8, 'Mother Pig (per kg)', 215.00, 'Mother pig price per kilogram', 20, '2025-03-03 17:14:18', 'static/img/pigget.jpg'),
(9, 'Father Pig (per kg)', 215.00, 'Father pig price per kilogram', 20, '2025-03-03 17:14:18', 'static/img/pigget.jpg'),
(10, 'Artificial Insemination (100ml)', 750.00, '100ml dose for artificial insemination', 10, '2025-03-03 17:14:18', 'static/img/pigget.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(255) NOT NULL,
  `date_order` varchar(255) NOT NULL,
  `total_price` int(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date_order`, `total_price`, `product_name`, `quantity`) VALUES
(1, '03-05-2025', 500, 'Egg', 3),
(2, '2025-03-04', 200, 'Live Chicken', 1),
(3, '213626-09-10', 350, 'Egg', 2),
(4, '213626-09-10', 350, 'Egg', 2),
(5, '2025-05-08', 1500, 'Live Pig', 3),
(6, '2025-05-08', 1000, 'A.I', 1),
(7, '2025-05-05', 1000, 'Live Pig', 2),
(8, '2025-05-03', 500, 'Egg', 3),
(9, '2025-05-10', 500, 'Live Chicken', 2),
(10, '2025-05-21', 1500, 'Live Chicken', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'vage andrea', 'jayme', 'kathmae', 'maea9658@gmail.com', '$2y$10$f/.TMpQu4v.sIezB4XRmWeRGIwq/rHUWD/O3Jv7TvDkpp29xoQJt6', 'user', '2025-03-02 07:24:59'),
(2, 'mae', 'jayme', 'mae almario', 'vage@gmail.com', '$2y$10$qCEyBGDJBnCmALg4aDfnyubf3834CdR0sEEueN0vYH2lwKPpmr6F.', 'user', '2025-03-02 07:26:58'),
(11, 'Admin', 'User', 'admin', 'admin@gmail.com', '123', 'admin', '2025-03-02 08:50:43'),
(12, 'selwyn', 'gwpo', 'jayme', 'jaymeselwyn@gmail.copm', 'gwapoako', 'user', '2025-03-03 16:19:34'),
(13, 'SELWYN', 'GWAPO', '12@', 'AA@gmail.com', 'gwapogwapo', 'user', '2025-03-04 05:40:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
