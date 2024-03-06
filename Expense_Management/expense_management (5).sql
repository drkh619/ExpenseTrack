-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 06:04 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expense_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_category`
--

CREATE TABLE `add_category` (
  `id` int(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `add_category`
--

INSERT INTO `add_category` (`id`, `category`, `uid`) VALUES
(1, 'salary', '18'),
(2, 'shopping', '18'),
(3, 'food', '18'),
(4, 'transportation', '18'),
(6, 'entertainment', '18'),
(9, 'coffee', '18'),
(10, 'yoga', '18'),
(11, 'film', '18'),
(15, 'emergency', '18'),
(16, 'swiggy', '18'),
(17, 'film', '18'),
(18, 'vegetables', '18'),
(19, 'tea', '12'),
(20, 'shopping', '12'),
(21, 'hospital', '12'),
(22, 'shopping', '12'),
(23, 'film', '12'),
(24, 'grocery', '12'),
(25, 'salary', '14'),
(26, 'shopping', '14'),
(27, 'entertainment', '14'),
(28, 'yoga', '14');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@expense.io', 'Admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `budget_limit`
--

CREATE TABLE `budget_limit` (
  `id` int(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `budget_limit` varchar(255) NOT NULL,
  `uid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `budget_limit`
--

INSERT INTO `budget_limit` (`id`, `category`, `budget_limit`, `uid`) VALUES
(1, 'food', '1000', 0),
(2, 'purchase', '1000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(255) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `feedback`, `uid`, `user`) VALUES
(1, 'It is a good app', '12', 'athira'),
(2, 'The app works fine', '17', 'anuj'),
(3, 'It is a good app', '19', 'maya'),
(4, 'Its a nice app', '12', 'athira');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `goal_amount` decimal(10,2) DEFAULT NULL,
  `goal_category` varchar(50) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `goal_amount`, `goal_category`, `deadline`, `created_at`, `updated_at`, `uid`) VALUES
(9, '3000.00', 'study', '2024-02-03', '2024-02-26 08:51:23', '2024-02-26 08:51:23', 19),
(10, '500.00', 'race', '2024-01-04', '2024-02-26 08:51:50', '2024-02-26 08:51:50', 19),
(11, '500.00', 'bet', '2024-02-08', '2024-02-26 08:52:23', '2024-02-26 08:52:23', 12),
(12, '5000.00', 'plau', '2024-02-03', '2024-02-27 17:56:10', '2024-02-27 17:56:10', 12),
(13, '300.00', 'turf', '2024-10-12', '2024-02-27 18:01:34', '2024-02-27 18:01:34', 12);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `budget_limit_value_send` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `amount`, `type`, `note`, `date`, `category`, `budget_limit_value_send`, `uid`) VALUES
(1, '50000', 'Income', 'salary', '2024-02-26 11:40:58.078022', 'Salary', 'limit', '19'),
(2, '500', 'Expense', 'movie', '2024-02-26 11:41:10.299162', 'Entertainment', '1000', '19'),
(3, '100', 'Expense', 'park', '2024-02-26 11:41:30.282601', 'Entertainment', '1000', '19'),
(4, '2000', 'Expense', 'pune', '2024-02-26 11:41:48.974054', 'Transport', '5000', '19'),
(5, '1000', 'Expense', 'fair', '2024-02-26 11:42:07.268263', 'Entertainment', '1200', '19'),
(6, '500', 'Expense', 'movie', '2024-02-27 23:27:51.119688', 'Entertainment', '2000', '12'),
(7, '20000', 'Income', 'office', '2024-02-27 23:28:08.891980', 'Salary', 'limit', '12'),
(8, '100', 'Expense', 'movie', '2024-02-27 23:28:21.365760', 'Entertainment', '2000', '12'),
(9, '1000', 'Expense', 'Film with frnds', '2024-02-28 20:40:23.205074', 'Entertainment', '2000', '12'),
(10, '500', 'Expense', 'trip', '2024-02-28 20:40:54.700958', 'Transport', '600', '12');

-- --------------------------------------------------------

--
-- Table structure for table `user_registraion`
--

CREATE TABLE `user_registraion` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_registraion`
--

INSERT INTO `user_registraion` (`id`, `username`, `email`, `phone`, `password`) VALUES
(9, 'adithya', 'adi@gmail.com', '7034622124', '123456'),
(12, 'athira', 'athira@gmail.com', '9764531280', '123456'),
(14, 'anu', 'anu@gmail.com', '3564981278', 'S@098765'),
(15, 'meera', 'meera@gmail.com', '9853261498', '09876'),
(16, 'yu', 'yu@gmail.com', '9863521689', '123'),
(17, 'anuj', 'anuj@gmail.com', '6532147890', '98765432'),
(18, 'annu', 'annu@gmail.com', '7034622125', '12345678'),
(19, 'maya', 'may123@gmail.com', '9876543210', 'maya12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_category`
--
ALTER TABLE `add_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_limit`
--
ALTER TABLE `budget_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_registraion`
--
ALTER TABLE `user_registraion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_category`
--
ALTER TABLE `add_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget_limit`
--
ALTER TABLE `budget_limit`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_registraion`
--
ALTER TABLE `user_registraion`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
