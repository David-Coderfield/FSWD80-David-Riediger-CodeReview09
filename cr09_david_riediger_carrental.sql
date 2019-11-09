-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2019 at 04:37 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_david_riediger_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `color_id` tinyint(3) UNSIGNED NOT NULL,
  `location_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `cust_id` int(10) UNSIGNED DEFAULT NULL,
  `license_plate` varchar(10) NOT NULL,
  `status` enum('active','inactive','repairs') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `model_id`, `color_id`, `location_id`, `cust_id`, `license_plate`, `status`) VALUES
(1, 1, 2, 1, NULL, 'WXYZ001', 'active'),
(2, 2, 1, 2, NULL, 'WXYZ002', 'active'),
(3, 3, 1, NULL, 1, 'WXYZ003', 'active'),
(4, 4, 1, 2, NULL, 'WXYZ004', 'inactive'),
(5, 5, 1, 1, NULL, 'WXYZ005', 'repairs'),
(6, 6, 2, 1, NULL, 'WXYZ006', 'repairs'),
(7, 7, 2, 1, NULL, 'WXYZ007', 'active'),
(8, 8, 2, 1, NULL, 'WXYZ008', 'active'),
(9, 9, 2, 2, NULL, 'WXYZ009', 'active'),
(10, 10, 3, NULL, 3, 'WXYZ011', 'active'),
(11, 11, 1, NULL, 4, 'WXYZ012', 'active'),
(12, 12, 1, 1, NULL, 'WXYZ013', 'active'),
(13, 13, 1, 1, NULL, 'WXYZ014', 'inactive'),
(14, 14, 4, 1, NULL, 'WXYZ015', 'active'),
(15, 1, 5, 1, NULL, 'WXYZ016', 'active'),
(16, 2, 6, 3, NULL, 'WXYZ017', 'active'),
(17, 3, 6, 3, NULL, 'WXYZ018', 'active'),
(18, 4, 6, 1, NULL, 'WXYZ019', 'active'),
(19, 5, 6, 1, NULL, 'WXYZ020', 'active'),
(20, 6, 6, 2, NULL, 'WXYZ021', 'active'),
(21, 7, 1, 1, NULL, 'WXYZ022', 'active'),
(22, 8, 1, 1, NULL, 'WXYZ023', 'active'),
(23, 9, 5, 1, NULL, 'WXYZ024', 'active'),
(24, 10, 5, 1, NULL, 'WXYZ025', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `car_brands`
--

CREATE TABLE `car_brands` (
  `brand_id` smallint(5) UNSIGNED NOT NULL,
  `brand_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_brands`
--

INSERT INTO `car_brands` (`brand_id`, `brand_name`) VALUES
(1, 'Audi'),
(2, 'BMW'),
(3, 'Citroen'),
(4, 'DeLorean'),
(5, 'Lamborghini'),
(6, 'Ferrari');

-- --------------------------------------------------------

--
-- Table structure for table `car_colors`
--

CREATE TABLE `car_colors` (
  `color_id` tinyint(3) UNSIGNED NOT NULL,
  `color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_colors`
--

INSERT INTO `car_colors` (`color_id`, `color`) VALUES
(1, 'red'),
(2, 'green'),
(3, 'blue'),
(4, 'yellow'),
(5, 'silver'),
(6, 'black');

-- --------------------------------------------------------

--
-- Table structure for table `car_fuels`
--

CREATE TABLE `car_fuels` (
  `fuel_id` tinyint(1) UNSIGNED NOT NULL,
  `fuel_type` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_fuels`
--

INSERT INTO `car_fuels` (`fuel_id`, `fuel_type`) VALUES
(1, 'Gasoline'),
(2, 'Diesel'),
(3, 'Electric');

-- --------------------------------------------------------

--
-- Table structure for table `car_models`
--

CREATE TABLE `car_models` (
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_name` varchar(20) NOT NULL,
  `brand_id` smallint(5) UNSIGNED NOT NULL,
  `fuel_id` tinyint(1) UNSIGNED NOT NULL,
  `seats` smallint(5) UNSIGNED NOT NULL,
  `baseprice` decimal(5,2) UNSIGNED DEFAULT 0.00,
  `dailyprice` decimal(5,2) UNSIGNED DEFAULT 20.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_models`
--

INSERT INTO `car_models` (`model_id`, `model_name`, `brand_id`, `fuel_id`, `seats`, `baseprice`, `dailyprice`) VALUES
(1, 'Audi S4', 1, 1, 4, '30.00', '20.00'),
(2, 'Audi S6', 1, 1, 4, '30.00', '20.00'),
(3, 'Audi S6 Avant', 1, 2, 4, '35.00', '24.00'),
(4, 'BMW Z4 Roadster', 2, 1, 2, '40.00', '25.00'),
(5, 'BMW M6 Cabrio', 2, 1, 2, '40.00', '25.00'),
(6, 'BMW 5 Series Gran To', 2, 1, 5, '30.00', '22.00'),
(7, 'Citroen Berlingo', 3, 2, 4, '30.00', '20.00'),
(8, 'Citroen E-Mehari', 3, 3, 4, '32.00', '22.00'),
(9, 'Citroen C4 Picasso', 3, 1, 5, '30.00', '20.00'),
(10, 'Delorean DMC-12', 4, 1, 2, '100.00', '77.00'),
(11, 'Lamborghini Huracan ', 5, 1, 2, '80.00', '60.00'),
(12, 'Ferrari FF', 6, 1, 2, '50.00', '30.00'),
(13, 'Ferrari California T', 6, 1, 2, '52.00', '26.00'),
(14, 'Ferrari Monza', 6, 1, 2, '70.00', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(32) NOT NULL,
  `sname` varchar(32) NOT NULL,
  `bdate` date NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reg_location_id` tinyint(3) UNSIGNED NOT NULL,
  `hasValidLicense` tinyint(1) NOT NULL,
  `hasValidPass` tinyint(1) NOT NULL,
  `pass_expire` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `fname`, `sname`, `bdate`, `gender`, `reg_date`, `reg_location_id`, `hasValidLicense`, `hasValidPass`, `pass_expire`) VALUES
(1, 'Arnold', 'Schwarz', '1960-01-01', 'm', '2015-12-31 23:00:00', 1, 1, 1, '2024-09-01'),
(2, 'Bran', 'Throwns', '1961-01-01', 'm', '2016-12-31 23:00:00', 4, 1, 1, '2024-09-02'),
(3, 'Camilla', 'Queen', '1962-01-01', 'f', '2017-12-31 23:00:00', 5, 1, 1, '2024-09-03'),
(4, 'Dave', 'R.', '1990-01-01', 'm', '2018-12-31 23:00:00', 1, 1, 1, '2024-09-04'),
(5, 'Ernst', 'Lustig', '1980-01-01', 'm', '2019-01-31 23:00:00', 1, 1, 1, '2019-01-01'),
(6, 'Gina', 'G.', '1970-01-01', 'f', '2019-11-08 12:37:01', 4, 1, 1, '2023-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `our_locations`
--

CREATE TABLE `our_locations` (
  `location_id` tinyint(3) UNSIGNED NOT NULL,
  `zip` mediumint(5) UNSIGNED NOT NULL,
  `city` varchar(20) NOT NULL,
  `country_code` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_locations`
--

INSERT INTO `our_locations` (`location_id`, `zip`, `city`, `country_code`) VALUES
(1, 1150, 'Vienna', 'AT'),
(2, 1210, 'Vienna', 'AT'),
(3, 1034, 'Budapest', 'HU'),
(4, 12800, 'Prague', 'CZ'),
(5, 79102, 'Freiburg', 'DE');

-- --------------------------------------------------------

--
-- Table structure for table `recommendation_program`
--

CREATE TABLE `recommendation_program` (
  `id` int(10) UNSIGNED NOT NULL,
  `cust_id` int(10) UNSIGNED NOT NULL,
  `person1_id` int(10) UNSIGNED DEFAULT NULL,
  `person2_id` int(10) UNSIGNED DEFAULT NULL,
  `person3_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recommendation_program`
--

INSERT INTO `recommendation_program` (`id`, `cust_id`, `person1_id`, `person2_id`, `person3_id`) VALUES
(1, 1, 2, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `rent_id` int(10) UNSIGNED NOT NULL,
  `cust_id` int(10) UNSIGNED NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `days_wanted` tinyint(3) UNSIGNED NOT NULL,
  `startdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `enddate` timestamp NULL DEFAULT NULL,
  `invoice` decimal(5,2) UNSIGNED NOT NULL,
  `pay_status` enum('paid','pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`rent_id`, `cust_id`, `car_id`, `days_wanted`, `startdate`, `enddate`, `invoice`, `pay_status`) VALUES
(1, 1, 1, 7, '2016-12-31 23:00:00', '2017-01-10 23:00:00', '350.00', 'paid'),
(2, 1, 2, 7, '2018-01-01 23:00:00', '2018-01-08 23:00:00', '355.00', 'paid'),
(3, 1, 3, 7, '2019-01-02 23:00:00', NULL, '239.00', 'paid'),
(4, 3, 10, 6, '2019-11-08 00:00:00', NULL, '219.00', 'pending'),
(5, 4, 11, 2, '2019-11-08 01:00:00', NULL, '59.00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `rental_extra_fines`
--

CREATE TABLE `rental_extra_fines` (
  `fine_id` int(10) UNSIGNED NOT NULL,
  `rent_id` int(10) UNSIGNED NOT NULL,
  `refill` varchar(10) DEFAULT NULL,
  `extra_days` tinyint(3) UNSIGNED DEFAULT NULL,
  `refill_bill` decimal(5,2) UNSIGNED DEFAULT NULL,
  `extra_bill` decimal(5,2) UNSIGNED DEFAULT NULL,
  `pay_status2` enum('paid','pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental_extra_fines`
--

INSERT INTO `rental_extra_fines` (`fine_id`, `rent_id`, `refill`, `extra_days`, `refill_bill`, `extra_bill`, `pay_status2`) VALUES
(1, 1, '\"2.3L Gas\"', 3, '10.00', '73.00', 'paid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `car_colors`
--
ALTER TABLE `car_colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `car_fuels`
--
ALTER TABLE `car_fuels`
  ADD PRIMARY KEY (`fuel_id`);

--
-- Indexes for table `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fuel_id` (`fuel_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `reg_location_id` (`reg_location_id`);

--
-- Indexes for table `our_locations`
--
ALTER TABLE `our_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `recommendation_program`
--
ALTER TABLE `recommendation_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `person1_id` (`person1_id`),
  ADD KEY `person2_id` (`person2_id`),
  ADD KEY `person3_id` (`person3_id`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `rental_extra_fines`
--
ALTER TABLE `rental_extra_fines`
  ADD PRIMARY KEY (`fine_id`),
  ADD KEY `rent_id` (`rent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `brand_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `car_colors`
--
ALTER TABLE `car_colors`
  MODIFY `color_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `car_fuels`
--
ALTER TABLE `car_fuels`
  MODIFY `fuel_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_models`
--
ALTER TABLE `car_models`
  MODIFY `model_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `our_locations`
--
ALTER TABLE `our_locations`
  MODIFY `location_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recommendation_program`
--
ALTER TABLE `recommendation_program`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `rent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rental_extra_fines`
--
ALTER TABLE `rental_extra_fines`
  MODIFY `fine_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `car_models` (`model_id`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `car_colors` (`color_id`),
  ADD CONSTRAINT `cars_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `our_locations` (`location_id`),
  ADD CONSTRAINT `cars_ibfk_5` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`);

--
-- Constraints for table `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_ibfk_1` FOREIGN KEY (`fuel_id`) REFERENCES `car_fuels` (`fuel_id`),
  ADD CONSTRAINT `car_models_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `car_brands` (`brand_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`reg_location_id`) REFERENCES `our_locations` (`location_id`);

--
-- Constraints for table `recommendation_program`
--
ALTER TABLE `recommendation_program`
  ADD CONSTRAINT `recommendation_program_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  ADD CONSTRAINT `recommendation_program_ibfk_2` FOREIGN KEY (`person1_id`) REFERENCES `customers` (`cust_id`),
  ADD CONSTRAINT `recommendation_program_ibfk_3` FOREIGN KEY (`person2_id`) REFERENCES `customers` (`cust_id`),
  ADD CONSTRAINT `recommendation_program_ibfk_4` FOREIGN KEY (`person3_id`) REFERENCES `customers` (`cust_id`);

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `rental_extra_fines`
--
ALTER TABLE `rental_extra_fines`
  ADD CONSTRAINT `rental_extra_fines_ibfk_1` FOREIGN KEY (`rent_id`) REFERENCES `rentals` (`rent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
