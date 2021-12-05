-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2021 at 06:48 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `active`) VALUES
(1, 'Puffs', 1),
(2, 'Sandwich', 1),
(3, 'Snacks', 1),
(4, 'Burgers', 1),
(8, 'Pastries', 1),
(9, 'Beverages', 1),
(10, 'Combos', 1),
(11, 'Starters', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `service_charge_value` varchar(255) NOT NULL,
  `vat_charge_value` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `company_name`, `service_charge_value`, `vat_charge_value`, `address`, `phone`, `country`, `message`, `currency`) VALUES
(1, 'S5 Restaurant', '0', '0', 'Hyderabad', '234234235', 'India', 'Restaurant automation system', 'INR');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `permission`) VALUES
(1, 'Super Administrator', 'a:32:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createStore\";i:9;s:11:\"updateStore\";i:10;s:9:\"viewStore\";i:11;s:11:\"deleteStore\";i:12;s:11:\"createTable\";i:13;s:11:\"updateTable\";i:14;s:9:\"viewTable\";i:15;s:11:\"deleteTable\";i:16;s:14:\"createCategory\";i:17;s:14:\"updateCategory\";i:18;s:12:\"viewCategory\";i:19;s:14:\"deleteCategory\";i:20;s:13:\"createProduct\";i:21;s:13:\"updateProduct\";i:22;s:11:\"viewProduct\";i:23;s:13:\"deleteProduct\";i:24;s:11:\"createOrder\";i:25;s:11:\"updateOrder\";i:26;s:9:\"viewOrder\";i:27;s:11:\"deleteOrder\";i:28;s:10:\"viewReport\";i:29;s:13:\"updateCompany\";i:30;s:11:\"viewProfile\";i:31;s:13:\"updateSetting\";}'),
(4, 'Members', 'a:9:{i:0;s:9:\"viewStore\";i:1;s:11:\"deleteStore\";i:2;s:9:\"viewTable\";i:3;s:11:\"deleteTable\";i:4;s:12:\"viewCategory\";i:5;s:11:\"viewProduct\";i:6;s:11:\"createOrder\";i:7;s:11:\"updateOrder\";i:8;s:9:\"viewOrder\";}'),
(5, 'Staff', 'a:6:{i:0;s:9:\"viewTable\";i:1;s:11:\"viewProduct\";i:2;s:11:\"createOrder\";i:3;s:11:\"updateOrder\";i:4;s:9:\"viewOrder\";i:5;s:11:\"viewProfile\";}');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `gross_amount` varchar(255) NOT NULL,
  `service_charge_rate` varchar(255) NOT NULL,
  `service_charge_amount` varchar(255) NOT NULL,
  `vat_charge_rate` varchar(255) NOT NULL,
  `vat_charge_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `bill_no`, `date_time`, `gross_amount`, `service_charge_rate`, `service_charge_amount`, `vat_charge_rate`, `vat_charge_amount`, `discount`, `net_amount`, `user_id`, `table_id`, `paid_status`, `store_id`) VALUES
(1, 'BKRWL-C625', '1593853140', '219.00', '0', '0', '0', '0', '0', '219.00', 1, 1, 1, 1),
(2, 'BKRWL-6B14', '1593853440', '439.00', '0', '0', '0', '0', '0', '439.00', 1, 1, 1, 1),
(3, 'BKRWL-D8AE', '1593853920', '60.00', '0', '0', '0', '0', '0', '60.00', 1, 1, 1, 1),
(4, 'BKRWL-06EC', '1593854460', '90.00', '0', '0', '0', '0', '0', '90.00', 1, 1, 1, 0),
(5, 'BKRWL-CA1B', '1593855360', '438.00', '0', '0', '0', '0', '0', '438.00', 1, 1, 1, 0),
(6, 'BKRWL-3C53', '1593855780', '30.00', '0', '0', '0', '0', '0', '30.00', 1, 1, 1, 1),
(7, 'BKRWL-CD11', '1593855900', '220.00', '0', '0', '0', '0', '0', '220.00', 1, 1, 1, 0),
(8, 'BKRWL-51E1', '1593856680', '2200.00', '0', '0', '0', '0', '0', '2200.00', 1, 1, 1, 0),
(9, 'BKRWL-DDB4', '1593870720', '219.00', '0', '0', '0', '0', '0', '219.00', 1, 1, 1, 0),
(10, 'BKRWL-AD6C', '1593870840', '219.00', '0', '0', '0', '0', '0', '219.00', 1, 1, 1, 1),
(11, 'BKRWL-3ACB', '1638594780', '219.00', '0', '0', '0', '0', '0', '219.00', 1, 1, 1, 1),
(12, 'BKRWL-3FFE', '1638602580', '219.00', '0', '0', '0', '0', '0', '219.00', 1, 1, 1, 1),
(13, 'BKRWL-ADD7', '1638602640', '438.00', '0', '0', '0', '0', '0', '438.00', 1, 4, 1, 1),
(14, 'BKRWL-F1E8', '1638616620', '12.00', '0', '0', '0', '0', '0', '12.00', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `rate`, `amount`) VALUES
(2, 1, 68, '1', '219', '219.00'),
(5, 2, 66, '1', '220', '220.00'),
(6, 2, 70, '1', '219', '219.00'),
(9, 3, 62, '1', '30', '30.00'),
(10, 3, 65, '1', '30', '30.00'),
(11, 4, 51, '1', '40', '40.00'),
(12, 4, 40, '1', '50', '50.00'),
(13, 5, 72, '1', '219', '219.00'),
(14, 5, 70, '1', '219', '219.00'),
(16, 6, 48, '1', '30', '30.00'),
(17, 7, 66, '1', '220', '220.00'),
(18, 8, 67, '10', '220', '2200.00'),
(19, 9, 70, '1', '219', '219.00'),
(22, 10, 71, '1', '219', '219.00'),
(24, 11, 68, '1', '219', '219.00'),
(26, 12, 68, '1', '219', '219.00'),
(29, 13, 68, '1', '219', '219.00'),
(30, 13, 73, '1', '219', '219.00'),
(32, 14, 1, '1', '12', '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` text NOT NULL,
  `category_name` text NOT NULL,
  `code` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `active` int(11) NOT NULL,
  `store` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `category_name`, `code`, `name`, `price`, `description`, `image`, `active`, `store`) VALUES
(1, '[\"1\"]', 'Puffs', 'vgp01', 'Veg Puff', '12', '', '<p>You did not select a file to upload.</p>', 1, 1),
(2, '[\"1\"]', 'Puffs', 'egp01', 'Egg Puff', '12', '', '<p>You did not select a file to upload.</p>', 1, 1),
(3, '[\"1\"]', 'Puffs', 'pnp01', 'Paneer Puff', '15', '', '<p>You did not select a file to upload.</p>', 1, 1),
(4, '[\"1\"]', 'Puffs', 'cnp01', 'Chicken Puff', '15', '', '<p>You did not select a file to upload.</p>', 1, 1),
(5, '[\"2\"]', 'Sandwich', 'vgs02', 'Veg Sandwich', '20', '', '<p>You did not select a file to upload.</p>', 1, 1),
(6, '[\"2\"]', 'Sandwich', 'cks02', 'Chicken Sandwich', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(7, '[\"2\"]', 'Sandwich', 'vcs02', 'Veg Cheese Grill Sandwich', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(8, '[\"2\"]', 'Sandwich', 'ccs02', 'Chicken Cheese Grill Sandwich', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(9, '[\"2\"]', 'Sandwich', 'cbs02', 'Club Sandwich', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(10, '[\"3\"]', 'Sandwich', 'vma03', 'Veg Manchuria', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(11, '[\"3\"]', 'Snacks', 'v6503', 'Veg 65', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(12, '[\"3\"]', 'Snacks', 'vsp03', 'Veg Spring Roll', '25', '', '<p>You did not select a file to upload.</p>', 1, 1),
(13, '[\"3\"]', 'Snacks', 'vet03', 'Veg Toast', '25', '', '<p>You did not select a file to upload.</p>', 1, 1),
(14, '[\"3\"]', 'Snacks', 'vht03', 'Veg Hot Dog', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(15, '[\"3\"]', 'Snacks', 'vchd3', 'Veg Cheese Hot Dog', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(16, '[\"3\"]', 'Snacks', 'vmhd3', 'Veg Manchurian Hot Dog', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(17, '[\"3\"]', 'Snacks', 'pchd3', 'Plain Cheese Hot Dog', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(18, '[\"3\"]', 'Snacks', 'vcsr3', 'Veg Cheese Stuff Roll', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(19, '[\"3\"]', 'Snacks', 'ivcr3', 'Italiyan Veg Cheese Roll', '35', '', '<p>You did not select a file to upload.</p>', 1, 1),
(20, '[\"3\"]', 'Snacks', 'c6503', 'Chicken 65', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(21, '[\"3\"]', 'Snacks', 'clp03', 'Chicken Leg Piece', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(22, '[\"3\"]', 'Snacks', 'cds03', 'Chicken Drumstick', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(23, '[\"3\"]', 'Snacks', 'ckb03', 'Chicken Kabab', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(24, '[\"3\"]', 'Snacks', 'chc03', 'Chilly Chicken', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(25, '[\"3\"]', 'Snacks', 'clop3', 'Chicken Lolly Pop', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(26, '[\"3\"]', 'Snacks', 'cspr3', 'Chicken Spring Roll', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(27, '[\"3\"]', 'Snacks', 'cht03', 'Chicken Toast', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(28, '[\"3\"]', 'Snacks', 'btrc3', 'Butter Chicken', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(29, '[\"3\"]', 'Snacks', 'lmnc3', 'Lemon Chicken', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(30, '[\"3\"]', 'Snacks', 'ginc3', 'Ginger Chicken', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(31, '[\"3\"]', 'Snacks', 'mejc3', 'Mejastic Chicken', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(32, '[\"3\"]', 'Snacks', 'chco3', 'Chicken Chops', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(33, '[\"3\"]', 'Snacks', 'cchd3', 'Chicken Cheese Hot Dog', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(34, '[\"3\"]', 'Snacks', 'ccsr3', 'Chicken Cheese Stuff Roll', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(35, '[\"3\"]', 'Snacks', 'icsr3', 'Italiyan Cheese Stuff Roll', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(36, '[\"4\"]', 'Burgers', 'vmb04', 'Veg Manchuriyan Burger', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(37, '[\"4\"]', 'Burgers', 'veb04', 'Veg Burger', '45', '', '<p>You did not select a file to upload.</p>', 1, 1),
(38, '[\"4\"]', 'Burgers', 'vecb4', 'Veg Cheese Burger', '55', '', '<p>You did not select a file to upload.</p>', 1, 1),
(39, '[\"4\"]', 'Burgers', 'pacb4', 'Paneer Cheese Burger', '60', '', '<p>You did not select a file to upload.</p>', 1, 1),
(40, '[\"4\"]', 'Burgers', 'chb04', 'Chicken Burger', '50', '', '<p>You did not select a file to upload.</p>', 1, 1),
(41, '[\"4\"]', 'Burgers', 'chcb4', 'Chicken Cheese Burger', '60', '', '<p>You did not select a file to upload.</p>', 1, 1),
(42, '[\"4\"]', 'Burgers', 'c65b4', 'Chicken 65 Burger', '60', '', '<p>You did not select a file to upload.</p>', 1, 1),
(43, '[\"10\"]', 'Combos', 'com-1', 'Combo-1 (Paneer Cheese Burger + Coca-Cola(250ML))', '75', '', '<p>You did not select a file to upload.</p>', 1, 1),
(44, '[\"10\"]', 'Combos', 'com-2', 'Combo-2 (Veg Pizza + Coca-Cola(250ML))', '95', '', '<p>You did not select a file to upload.</p>', 1, 1),
(45, '[\"10\"]', 'Combos', 'com-3', 'Combo-3 (Chicken Cheese Pizza + Coca-Cola(250ML))', '130', '', '<p>You did not select a file to upload.</p>', 1, 1),
(46, '[\"9\"]', 'Beverages', 'coke9', 'Coca-Cola 250ML - Pet', '20', '', '<p>You did not select a file to upload.</p>', 1, 1),
(47, '[\"9\"]', 'Beverages', 'thum9', 'Thums Up 250ML - Pet', '20', '', '<p>You did not select a file to upload.</p>', 1, 1),
(48, '[\"8\"]', 'Pastries', 'pine8', 'Pineapple', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(49, '[\"8\"]', 'Pastries', 'btrs8', 'Butter Scotch', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(50, '[\"8\"]', 'Pastries', 'blkf8', 'Black Forest', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(51, '[\"8\"]', 'Pastries', 'strb8', 'Strawberry', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(52, '[\"8\"]', 'Pastries', 'blub8', 'Blue Berry', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(53, '[\"8\"]', 'Pastries', 'blkc8', 'Black Current', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(54, '[\"8\"]', 'Pastries', 'vani8', 'Vanilla', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(55, '[\"8\"]', 'Pastries', 'fref8', 'Fresh Fruit', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(56, '[\"8\"]', 'Pastries', 'kiwf8', 'Kiwi Fruit', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(57, '[\"8\"]', 'Pastries', 'pis08', 'Pista', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(58, '[\"8\"]', 'Pastries', 'chot8', 'Chocolate Turffle', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(59, '[\"8\"]', 'Pastries', 'choc8', 'Choco Chips', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(60, '[\"8\"]', 'Pastries', 'chor8', 'Choco Rice', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(61, '[\"8\"]', 'Pastries', 'chol8', 'Choco Lava', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(62, '[\"8\"]', 'Pastries', 'chod8', 'Choco Donut', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(63, '[\"8\"]', 'Pastries', 'dryf8', 'Dry Fruit', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(64, '[\"8\"]', 'Pastries', 'mixf8', 'Mixed Fruit', '40', '', '<p>You did not select a file to upload.</p>', 1, 1),
(65, '[\"8\"]', 'Pastries', 'pudc8', 'Pudding Cup', '30', '', '<p>You did not select a file to upload.</p>', 1, 1),
(66, '[\"11\"]', 'Starters', 'c6511', 'Chicken 65', '220', '', '<p>The</p>', 1, 1),
(67, '[\"11\"]', 'Starters', 'cmj11', 'Chicken Majestic', '220', '', '<p>The</p>', 1, 1),
(68, '[\"11\"]', 'Starters', 'och11', 'Onion Chicken', '219', '', '<p>The</p>', 1, 1),
(69, '[\"11\"]', 'Starters', 'sch11', 'Schezwan Chicken', '219', '', '<p>The</p>', 1, 1),
(70, '[\"11\"]', 'Starters', 'clp11', 'Chicken Lolly Pops', '219', '', '<p>The</p>', 1, 1),
(71, '[\"11\"]', 'Starters', 'sbc11', 'Slide Bar Chicken', '219', '', '<p>The</p>', 1, 1),
(72, '[\"11\"]', 'Starters', 'cbc11', 'Cheese Bite Chicken', '219', '', '<p>The</p>', 1, 1),
(73, '[\"11\"]', 'Starters', 'c55511', 'Chicken 555', '219', '', '<p>The</p>', 1, 1),

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `Tableno` varchar(255) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Mobile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `active`) VALUES
(1, 'BDP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `available` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `table_name`, `capacity`, `available`, `active`, `store_id`) VALUES
(1, '1', '4', 1, 1, 1),
(2, '2', '5', 1, 1, 1),
(3, '3', '6', 1, 1, 1),
(4, '4', '5', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `phone`, `gender`, `store_id`) VALUES
(1, 'admin', '$2y$10$yfi5nUQGXUZtMdl27dWAyOd/jMOmATBpiUvJDmUu9hJ5Ro6BE5wsK', 'admin@admin.com', 'swakhil', 'rao', '80789998', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
