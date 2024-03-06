-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2024 at 08:04 AM
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
(27, 'entertainment', '14');

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
(1, '10000', 'Income', 'salary', '2024-02-23 10:51:57.388889', 'salary', '20000', '18'),
(2, '280', 'Expense', 'bought fruits', '2024-02-23 10:54:14.428280', 'shopping', '1000', '18'),
(3, '500', 'Expense', 'town', '2024-02-23 11:03:43.591316', 'transportation', '1000', '18'),
(5, '500', 'Expense', 'bhh', '2024-02-23 11:08:36.355958', 'entertainment', '1000', '18'),
(6, '500', 'Expense', 'ojj', '2024-02-23 11:10:02.241564', 'entertainment', '1000', '18'),
(7, '500', 'Expense', 'food', '2024-02-23 11:21:08.890454', 'food', '1000', '15'),
(8, '2000', 'Income', 'salary', '2024-01-12 00:00:00.000', 'salary', '20000', '18'),
(11, '500', 'Expense', 'coffe e', '2024-02-23 12:00:11.558215', 'shopping', '1000', '12'),
(12, '1000', 'Income', 'salary', '2024-02-23 16:21:05.695282', 'salary', '10000', '14'),
(13, '500', 'Expense', 'shop', '2024-02-24 11:49:01.090153', 'shopping', '2000', '14'),
(14, '2000', 'Expense', 'a', '2024-02-24 11:58:43.849168', 'shopping', '2000', '14'),
(15, '500', 'Expense', 'movie', '2024-02-24 12:19:11.268594', 'entertainment', '1000', '14');

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
(11, 'abhi', 'abh123@gmail.com', '556298282929', '0000'),
(12, 'athira', 'athira@gmail.com', '9764531280', '123456'),
(13, 'abhinand', 'abhi@gmail.com', '3254681256', '098765'),
(14, 'anu', 'anu@gmail.com', '3564981278', 'S@098765'),
(15, 'meera', 'meera@gmail.com', '9853261498', '09876'),
(16, 'yu', 'yu@gmail.com', '9863521689', '123'),
(17, 'anuj', 'anuj@gmail.com', '6532147890', '98765432'),
(18, 'annu', 'annu@gmail.com', '7034622125', '12345678');

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_registraion`
--
ALTER TABLE `user_registraion`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
