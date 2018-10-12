-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2018 at 03:57 PM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jorges`
--

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE `crew` (
  `member` int(11) NOT NULL,
  `member2` int(11) NOT NULL,
  `member3` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `task` int(11) NOT NULL,
  `vehicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(16) NOT NULL,
  `type` varchar(36) NOT NULL,
  `address` varchar(256) NOT NULL,
  `timeavg` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(16) NOT NULL,
  `day` varchar(16) NOT NULL,
  `houses` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `addresses` text NOT NULL,
  `phonenumbers` text NOT NULL,
  `type` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `accountcreated` varchar(32) NOT NULL,
  `passwordexpire` varchar(32) NOT NULL,
  `lastlogin` varchar(32) NOT NULL,
  `loginfailure` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `addresses`, `phonenumbers`, `type`, `password`, `accountcreated`, `passwordexpire`, `lastlogin`, `loginfailure`) VALUES
('frankngo', 'frankngomusic@gmail.com', '6501 NE Cherry Dr,\r\nAPT #1103\r\nHillsboro, Oregon. 97124', '5035556969', 'user', 'azn4lyfe', '2018-09-19', '20180926', '2018-09-19', 0),
('itaku', 'collegeboundscholar@gmail.com', '2951 SE Timberlake Dr,\r\n\r\nHillsboro, Oregon. 97123', '5031694200', 'user', 'Ineed@job2', '2018-09-20', '20180927', '2018-09-20', 0),
('NemisisTType', 'gabino.chaparro@gmail.com', '2994 NE Overlook Dr \n #xxxx\n Hillsboro, Oregon. 97124', '1234567890', 'user', 'IamG@bino', '2018-09-21T18:57:37+00:00', '2018-09-21T18:57:37+00:00', '2018-09-21T18:57:37+00:00', 0),
('NemisisTType3', 'gabino.chaparro@gmail.com', '2994 NE Overlook Dr \n #xxxx\n Hillsboro, Oregon. 97124', '1234567890', 'user', 'MyN3wP@assw0rd', '2018-09-21T18:57:37+00:00', '2018-09-21T18:57:37+00:00', '2018-09-21T18:57:37+00:00', 0),
('saramander', 'saramander@gmail.com', '6501 NE Cherry Dr \n #1103\n Hillsboro, Oregon. 97123', '1234567890', 'user', 'Saramanderasinsaramandersara', '2018-09-20T18:57:37+00:00', '2018-09-20T18:57:37+00:00', '2018-09-20T18:57:37+00:00', 0),
('smithyRPG', 'dobrinsa@gmail.com', '2978 SE Rosespring Dr \n\n Hillsboro, Oregon. 97123', '6969696969', 'user', 'rUnEsCaPeRuLeS', '2018-09-20T18:57:37+00:00', '2018-09-20T18:57:37+00:00', '2018-09-20T18:57:37+00:00', 0),
('valdesj', 'valdesj271@gmail.com', '6501 NE Cherry dr,\r\nAPT #1103\r\nHillsboro, Oregon. 97124', '5037800571', 'admin', 'Valdj271', '2018-09-14', '20180921', '2018-09-15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(16) NOT NULL,
  `model` varchar(128) NOT NULL,
  `form` varchar(32) NOT NULL,
  `miles` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
