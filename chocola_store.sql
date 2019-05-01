-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2019 at 05:50 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chocola_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status_id` int(11) NOT NULL,
  `regular_price` decimal(10,0) DEFAULT '0',
  `discount_price` decimal(10,0) DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  `taxable` tinyint(1) DEFAULT '0',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `img_url`, `description`, `title`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `taxable`, `inserted_at`, `updated_at`) VALUES
(1, 'sku1', 'burgers', '1.jpg', ' This is a burgers product made in France and sold only in our store', ' This is a This is a burgers product made in France and sold only in our store ', 1, '459', '8', 96, 0, '2019-05-01 15:37:47', '0000-00-00 00:00:00'),
(2, 'sku2', 'chutney', '2.jpg', ' This is a chutney product made in France and sold only in our store', ' This is a This is a chutney product made in France and sold only in our store ', 1, '182', '10', 39, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(3, 'sku3', 'turkey', '3.jpg', ' This is a turkey product made in France and sold only in our store', ' This is a This is a turkey product made in France and sold only in our store ', 1, '345', '124', 79, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(4, 'sku4', 'mineral water', '4.jpg', ' This is a mineral water product made in France and sold only in our store', ' This is a This is a mineral water product made in France and sold only in our store ', 1, '127', '24', 198, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(5, 'sku5', 'low fat yogurt', '5.jpg', ' This is a low fat yogurt product made in France and sold only in our store', ' This is a This is a low fat yogurt product made in France and sold only in our store ', 1, '155', '6', 138, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(6, 'sku6', 'whole wheat pasta', '6.jpg', ' This is a whole wheat pasta product made in France and sold only in our store', ' This is a This is a whole wheat pasta product made in France and sold only in our store ', 1, '213', '159', 44, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(7, 'sku7', 'soup', '7.jpg', ' This is a soup product made in France and sold only in our store', ' This is a This is a soup product made in France and sold only in our store ', 1, '402', '78', 28, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(8, 'sku8', 'frozen vegetables', '8.jpg', ' This is a frozen vegetables product made in France and sold only in our store', ' This is a This is a frozen vegetables product made in France and sold only in our store ', 1, '180', '142', 188, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(9, 'sku9', 'french fries', '9.jpg', ' This is a french fries product made in France and sold only in our store', ' This is a This is a french fries product made in France and sold only in our store ', 1, '332', '320', 27, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(10, 'sku10', 'eggs', '10.jpg', ' This is a eggs product made in France and sold only in our store', ' This is a This is a eggs product made in France and sold only in our store ', 1, '480', '56', 28, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(11, 'sku11', 'cookies', '11.jpg', ' This is a cookies product made in France and sold only in our store', ' This is a This is a cookies product made in France and sold only in our store ', 1, '369', '80', 5, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(12, 'sku12', 'spaghetti', '12.jpg', ' This is a spaghetti product made in France and sold only in our store', ' This is a This is a spaghetti product made in France and sold only in our store ', 1, '490', '353', 51, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(13, 'sku13', 'shrimp', '13.jpg', ' This is a shrimp product made in France and sold only in our store', ' This is a This is a shrimp product made in France and sold only in our store ', 1, '139', '19', 68, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(14, 'sku14', 'meatballs', '14.jpg', ' This is a meatballs product made in France and sold only in our store', ' This is a This is a meatballs product made in France and sold only in our store ', 1, '465', '416', 79, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(15, 'sku15', 'red wine', '15.jpg', ' This is a red wine product made in France and sold only in our store', ' This is a This is a red wine product made in France and sold only in our store ', 1, '102', '57', 79, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(16, 'sku16', 'rice', '16.jpg', ' This is a rice product made in France and sold only in our store', ' This is a This is a rice product made in France and sold only in our store ', 1, '297', '219', 198, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(17, 'sku17', 'parmesan cheese', '17.jpg', ' This is a parmesan cheese product made in France and sold only in our store', ' This is a This is a parmesan cheese product made in France and sold only in our store ', 1, '254', '230', 168, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(18, 'sku18', 'ground beef', '18.jpg', ' This is a ground beef product made in France and sold only in our store', ' This is a This is a ground beef product made in France and sold only in our store ', 1, '242', '75', 54, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(19, 'sku19', 'sparkling water', '19.jpg', ' This is a sparkling water product made in France and sold only in our store', ' This is a This is a sparkling water product made in France and sold only in our store ', 1, '128', '53', 66, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(20, 'sku20', 'herb & pepper', '20.jpg', ' This is a herb & pepper product made in France and sold only in our store', ' This is a This is a herb & pepper product made in France and sold only in our store ', 1, '121', '67', 130, 0, '2019-05-01 15:38:09', '0000-00-00 00:00:00'),
(21, 'sku21', 'pickles', '21.jpg', ' This is a pickles product made in France and sold only in our store', ' This is a This is a pickles product made in France and sold only in our store ', 1, '147', '33', 174, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(22, 'sku22', 'energy bar', '22.jpg', ' This is a energy bar product made in France and sold only in our store', ' This is a This is a energy bar product made in France and sold only in our store ', 1, '440', '52', 76, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(23, 'sku23', 'fresh tuna', '23.jpg', ' This is a fresh tuna product made in France and sold only in our store', ' This is a This is a fresh tuna product made in France and sold only in our store ', 1, '216', '79', 135, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(24, 'sku24', 'escalope', '24.jpg', ' This is a escalope product made in France and sold only in our store', ' This is a This is a escalope product made in France and sold only in our store ', 1, '268', '213', 133, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(25, 'sku25', 'avocado', '25.jpg', ' This is a avocado product made in France and sold only in our store', ' This is a This is a avocado product made in France and sold only in our store ', 1, '457', '70', 200, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(26, 'sku26', 'tomato sauce', '26.jpg', ' This is a tomato sauce product made in France and sold only in our store', ' This is a This is a tomato sauce product made in France and sold only in our store ', 1, '296', '206', 145, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(27, 'sku27', 'clothes accessories', '27.jpg', ' This is a clothes accessories product made in France and sold only in our store', ' This is a This is a clothes accessories product made in France and sold only in our store ', 1, '147', '70', 30, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(28, 'sku28', 'energy drink', '28.jpg', ' This is a energy drink product made in France and sold only in our store', ' This is a This is a energy drink product made in France and sold only in our store ', 1, '270', '133', 95, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(29, 'sku29', 'chocolate', '29.jpg', ' This is a chocolate product made in France and sold only in our store', ' This is a This is a chocolate product made in France and sold only in our store ', 1, '282', '172', 89, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(30, 'sku30', 'grated cheese', '30.jpg', ' This is a grated cheese product made in France and sold only in our store', ' This is a This is a grated cheese product made in France and sold only in our store ', 1, '261', '164', 81, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(31, 'sku31', 'yogurt cake', '31.jpg', ' This is a yogurt cake product made in France and sold only in our store', ' This is a This is a yogurt cake product made in France and sold only in our store ', 1, '432', '420', 61, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(32, 'sku32', 'mint', '32.jpg', ' This is a mint product made in France and sold only in our store', ' This is a This is a mint product made in France and sold only in our store ', 1, '194', '34', 68, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(33, 'sku33', 'asparagus', '33.jpg', ' This is a asparagus product made in France and sold only in our store', ' This is a This is a asparagus product made in France and sold only in our store ', 1, '296', '257', 135, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(34, 'sku34', 'champagne', '34.jpg', ' This is a champagne product made in France and sold only in our store', ' This is a This is a champagne product made in France and sold only in our store ', 1, '81', '27', 53, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(35, 'sku35', 'ham', '35.jpg', ' This is a ham product made in France and sold only in our store', ' This is a This is a ham product made in France and sold only in our store ', 1, '249', '227', 130, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(36, 'sku36', 'muffins', '36.jpg', ' This is a muffins product made in France and sold only in our store', ' This is a This is a muffins product made in France and sold only in our store ', 1, '161', '141', 162, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(37, 'sku37', 'french wine', '37.jpg', ' This is a french wine product made in France and sold only in our store', ' This is a This is a french wine product made in France and sold only in our store ', 1, '201', '21', 149, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(38, 'sku38', 'chicken', '38.jpg', ' This is a chicken product made in France and sold only in our store', ' This is a This is a chicken product made in France and sold only in our store ', 1, '334', '37', 68, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(39, 'sku39', 'pasta', '39.jpg', ' This is a pasta product made in France and sold only in our store', ' This is a This is a pasta product made in France and sold only in our store ', 1, '74', '25', 154, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(40, 'sku40', 'tomatoes', '40.jpg', ' This is a tomatoes product made in France and sold only in our store', ' This is a This is a tomatoes product made in France and sold only in our store ', 1, '206', '123', 2, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(41, 'sku41', 'pancakes', '41.jpg', ' This is a pancakes product made in France and sold only in our store', ' This is a This is a pancakes product made in France and sold only in our store ', 1, '481', '162', 67, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(42, 'sku42', 'frozen smoothie', '42.jpg', ' This is a frozen smoothie product made in France and sold only in our store', ' This is a This is a frozen smoothie product made in France and sold only in our store ', 1, '91', '61', 45, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(43, 'sku43', 'carrots', '43.jpg', ' This is a carrots product made in France and sold only in our store', ' This is a This is a carrots product made in France and sold only in our store ', 1, '474', '40', 102, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(44, 'sku44', 'yams', '44.jpg', ' This is a yams product made in France and sold only in our store', ' This is a This is a yams product made in France and sold only in our store ', 1, '247', '134', 130, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(45, 'sku45', 'shallot', '45.jpg', ' This is a shallot product made in France and sold only in our store', ' This is a This is a shallot product made in France and sold only in our store ', 1, '53', '9', 194, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(46, 'sku46', 'butter', '46.jpg', ' This is a butter product made in France and sold only in our store', ' This is a This is a butter product made in France and sold only in our store ', 1, '232', '58', 105, 0, '2019-05-01 15:38:10', '0000-00-00 00:00:00'),
(47, 'sku47', 'light mayo', '47.jpg', ' This is a light mayo product made in France and sold only in our store', ' This is a This is a light mayo product made in France and sold only in our store ', 1, '17', '8', 41, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(48, 'sku48', 'pepper', '48.jpg', ' This is a pepper product made in France and sold only in our store', ' This is a This is a pepper product made in France and sold only in our store ', 1, '149', '77', 165, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(49, 'sku49', 'candy bars', '49.jpg', ' This is a candy bars product made in France and sold only in our store', ' This is a This is a candy bars product made in France and sold only in our store ', 1, '362', '265', 173, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(50, 'sku50', 'cooking oil', '50.jpg', ' This is a cooking oil product made in France and sold only in our store', ' This is a This is a cooking oil product made in France and sold only in our store ', 1, '190', '110', 171, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(51, 'sku51', 'milk', '51.jpg', ' This is a milk product made in France and sold only in our store', ' This is a This is a milk product made in France and sold only in our store ', 1, '214', '25', 14, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(52, 'sku52', 'green tea', '52.jpg', ' This is a green tea product made in France and sold only in our store', ' This is a This is a green tea product made in France and sold only in our store ', 1, '204', '88', 113, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(53, 'sku53', 'bug spray', '53.jpg', ' This is a bug spray product made in France and sold only in our store', ' This is a This is a bug spray product made in France and sold only in our store ', 1, '14', '8', 159, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(54, 'sku54', 'oil', '54.jpg', ' This is a oil product made in France and sold only in our store', ' This is a This is a oil product made in France and sold only in our store ', 1, '193', '35', 152, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(55, 'sku55', 'olive oil', '55.jpg', ' This is a olive oil product made in France and sold only in our store', ' This is a This is a olive oil product made in France and sold only in our store ', 1, '59', '51', 154, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(56, 'sku56', 'salmon', '56.jpg', ' This is a salmon product made in France and sold only in our store', ' This is a This is a salmon product made in France and sold only in our store ', 1, '476', '78', 53, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(57, 'sku57', 'cake', '57.jpg', ' This is a cake product made in France and sold only in our store', ' This is a This is a cake product made in France and sold only in our store ', 1, '91', '65', 148, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(58, 'sku58', 'almonds', '58.jpg', ' This is a almonds product made in France and sold only in our store', ' This is a This is a almonds product made in France and sold only in our store ', 1, '106', '46', 51, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(59, 'sku59', 'salt', '59.jpg', ' This is a salt product made in France and sold only in our store', ' This is a This is a salt product made in France and sold only in our store ', 1, '298', '18', 186, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(60, 'sku60', 'strong cheese', '60.jpg', ' This is a strong cheese product made in France and sold only in our store', ' This is a This is a strong cheese product made in France and sold only in our store ', 1, '126', '97', 193, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(61, 'sku61', 'hot dogs', '61.jpg', ' This is a hot dogs product made in France and sold only in our store', ' This is a This is a hot dogs product made in France and sold only in our store ', 1, '284', '30', 185, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(62, 'sku62', 'pet food', '62.jpg', ' This is a pet food product made in France and sold only in our store', ' This is a This is a pet food product made in France and sold only in our store ', 1, '328', '40', 83, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(63, 'sku63', 'whole wheat rice', '63.jpg', ' This is a whole wheat rice product made in France and sold only in our store', ' This is a This is a whole wheat rice product made in France and sold only in our store ', 1, '278', '221', 36, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(64, 'sku64', 'antioxydant juice', '64.jpg', ' This is a antioxydant juice product made in France and sold only in our store', ' This is a This is a antioxydant juice product made in France and sold only in our store ', 1, '142', '105', 190, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(65, 'sku65', 'honey', '65.jpg', ' This is a honey product made in France and sold only in our store', ' This is a This is a honey product made in France and sold only in our store ', 1, '337', '149', 142, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(66, 'sku66', 'sandwich', '66.jpg', ' This is a sandwich product made in France and sold only in our store', ' This is a This is a sandwich product made in France and sold only in our store ', 1, '186', '26', 168, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(67, 'sku67', 'salad', '67.jpg', ' This is a salad product made in France and sold only in our store', ' This is a This is a salad product made in France and sold only in our store ', 1, '238', '174', 95, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(68, 'sku68', 'magazines', '68.jpg', ' This is a magazines product made in France and sold only in our store', ' This is a This is a magazines product made in France and sold only in our store ', 1, '27', '7', 53, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(69, 'sku69', 'protein bar', '69.jpg', ' This is a protein bar product made in France and sold only in our store', ' This is a This is a protein bar product made in France and sold only in our store ', 1, '351', '94', 171, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(70, 'sku70', 'mayonnaise', '70.jpg', ' This is a mayonnaise product made in France and sold only in our store', ' This is a This is a mayonnaise product made in France and sold only in our store ', 1, '462', '236', 199, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(71, 'sku71', 'cider', '71.jpg', ' This is a cider product made in France and sold only in our store', ' This is a This is a cider product made in France and sold only in our store ', 1, '137', '108', 129, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(72, 'sku72', 'burger sauce', '72.jpg', ' This is a burger sauce product made in France and sold only in our store', ' This is a This is a burger sauce product made in France and sold only in our store ', 1, '315', '166', 62, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(73, 'sku73', 'green grapes', '73.jpg', ' This is a green grapes product made in France and sold only in our store', ' This is a This is a green grapes product made in France and sold only in our store ', 1, '340', '277', 141, 0, '2019-05-01 15:38:11', '0000-00-00 00:00:00'),
(74, 'sku74', 'vegetables mix', '74.jpg', ' This is a vegetables mix product made in France and sold only in our store', ' This is a This is a vegetables mix product made in France and sold only in our store ', 1, '421', '325', 143, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(75, 'sku75', 'bramble', '75.jpg', ' This is a bramble product made in France and sold only in our store', ' This is a This is a bramble product made in France and sold only in our store ', 1, '119', '37', 197, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(76, 'sku76', 'nonfat milk', '76.jpg', ' This is a nonfat milk product made in France and sold only in our store', ' This is a This is a nonfat milk product made in France and sold only in our store ', 1, '356', '46', 94, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(77, 'sku77', 'tomato juice', '77.jpg', ' This is a tomato juice product made in France and sold only in our store', ' This is a This is a tomato juice product made in France and sold only in our store ', 1, '349', '319', 87, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(78, 'sku78', 'green beans', '78.jpg', ' This is a green beans product made in France and sold only in our store', ' This is a This is a green beans product made in France and sold only in our store ', 1, '38', '24', 5, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(79, 'sku79', 'strawberries', '79.jpg', ' This is a strawberries product made in France and sold only in our store', ' This is a This is a strawberries product made in France and sold only in our store ', 1, '499', '8', 37, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(80, 'sku80', 'eggplant', '80.jpg', ' This is a eggplant product made in France and sold only in our store', ' This is a This is a eggplant product made in France and sold only in our store ', 1, '463', '333', 114, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(81, 'sku81', 'mushroom cream sauce', '81.jpg', ' This is a mushroom cream sauce product made in France and sold only in our store', ' This is a This is a mushroom cream sauce product made in France and sold only in our store ', 1, '129', '11', 74, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(82, 'sku82', 'gums', '82.jpg', ' This is a gums product made in France and sold only in our store', ' This is a This is a gums product made in France and sold only in our store ', 1, '448', '59', 53, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(83, 'sku83', 'cereals', '83.jpg', ' This is a cereals product made in France and sold only in our store', ' This is a This is a cereals product made in France and sold only in our store ', 1, '152', '46', 32, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(84, 'sku84', 'flax seed', '84.jpg', ' This is a flax seed product made in France and sold only in our store', ' This is a This is a flax seed product made in France and sold only in our store ', 1, '44', '32', 87, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(85, 'sku85', 'spinach', '85.jpg', ' This is a spinach product made in France and sold only in our store', ' This is a This is a spinach product made in France and sold only in our store ', 1, '150', '136', 103, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(86, 'sku86', 'soda', '86.jpg', ' This is a soda product made in France and sold only in our store', ' This is a This is a soda product made in France and sold only in our store ', 1, '406', '72', 15, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(87, 'sku87', 'dessert wine', '87.jpg', ' This is a dessert wine product made in France and sold only in our store', ' This is a This is a dessert wine product made in France and sold only in our store ', 1, '472', '33', 73, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(88, 'sku88', 'corn', '88.jpg', ' This is a corn product made in France and sold only in our store', ' This is a This is a corn product made in France and sold only in our store ', 1, '213', '31', 59, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(89, 'sku89', 'fresh bread', '89.jpg', ' This is a fresh bread product made in France and sold only in our store', ' This is a This is a fresh bread product made in France and sold only in our store ', 1, '67', '9', 17, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(90, 'sku90', 'brownies', '90.jpg', ' This is a brownies product made in France and sold only in our store', ' This is a This is a brownies product made in France and sold only in our store ', 1, '158', '88', 8, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(91, 'sku91', 'fromage blanc', '91.jpg', ' This is a fromage blanc product made in France and sold only in our store', ' This is a This is a fromage blanc product made in France and sold only in our store ', 1, '183', '102', 129, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(92, 'sku92', 'chocolate bread', '92.jpg', ' This is a chocolate bread product made in France and sold only in our store', ' This is a This is a chocolate bread product made in France and sold only in our store ', 1, '205', '51', 110, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(93, 'sku93', 'mashed potato', '93.jpg', ' This is a mashed potato product made in France and sold only in our store', ' This is a This is a mashed potato product made in France and sold only in our store ', 1, '435', '424', 182, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(94, 'sku94', 'gluten free bar', '94.jpg', ' This is a gluten free bar product made in France and sold only in our store', ' This is a This is a gluten free bar product made in France and sold only in our store ', 1, '433', '399', 73, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(95, 'sku95', 'cottage cheese', '95.jpg', ' This is a cottage cheese product made in France and sold only in our store', ' This is a This is a cottage cheese product made in France and sold only in our store ', 1, '179', '114', 160, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(96, 'sku96', 'whole weat flour', '96.jpg', ' This is a whole weat flour product made in France and sold only in our store', ' This is a This is a whole weat flour product made in France and sold only in our store ', 1, '80', '39', 126, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(97, 'sku97', 'chili', '97.jpg', ' This is a chili product made in France and sold only in our store', ' This is a This is a chili product made in France and sold only in our store ', 1, '346', '23', 33, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(98, 'sku98', 'barbecue sauce', '98.jpg', ' This is a barbecue sauce product made in France and sold only in our store', ' This is a This is a barbecue sauce product made in France and sold only in our store ', 1, '454', '134', 86, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(99, 'sku99', 'light cream', '99.jpg', ' This is a light cream product made in France and sold only in our store', ' This is a This is a light cream product made in France and sold only in our store ', 1, '314', '169', 86, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(100, 'sku100', 'mint green tea', '100.jpg', ' This is a mint green tea product made in France and sold only in our store', ' This is a This is a mint green tea product made in France and sold only in our store ', 1, '449', '7', 20, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(101, 'sku101', 'black tea', '101.jpg', ' This is a black tea product made in France and sold only in our store', ' This is a This is a black tea product made in France and sold only in our store ', 1, '382', '142', 5, 0, '2019-05-01 15:38:12', '0000-00-00 00:00:00'),
(102, 'sku102', 'bacon', '102.jpg', ' This is a bacon product made in France and sold only in our store', ' This is a This is a bacon product made in France and sold only in our store ', 1, '13', '6', 3, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(103, 'sku103', 'shampoo', '103.jpg', ' This is a shampoo product made in France and sold only in our store', ' This is a This is a shampoo product made in France and sold only in our store ', 1, '417', '49', 60, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(104, 'sku104', 'blueberries', '104.jpg', ' This is a blueberries product made in France and sold only in our store', ' This is a This is a blueberries product made in France and sold only in our store ', 1, '374', '38', 143, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(105, 'sku105', 'cauliflower', '105.jpg', ' This is a cauliflower product made in France and sold only in our store', ' This is a This is a cauliflower product made in France and sold only in our store ', 1, '480', '207', 184, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(106, 'sku106', 'extra dark chocolate', '106.jpg', ' This is a extra dark chocolate product made in France and sold only in our store', ' This is a This is a extra dark chocolate product made in France and sold only in our store ', 1, '207', '36', 40, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(107, 'sku107', 'white wine', '107.jpg', ' This is a white wine product made in France and sold only in our store', ' This is a This is a white wine product made in France and sold only in our store ', 1, '141', '127', 79, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(108, 'sku108', 'babies food', '108.jpg', ' This is a babies food product made in France and sold only in our store', ' This is a This is a babies food product made in France and sold only in our store ', 1, '237', '219', 177, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(109, 'sku109', 'toothpaste', '109.jpg', ' This is a toothpaste product made in France and sold only in our store', ' This is a This is a toothpaste product made in France and sold only in our store ', 1, '214', '98', 1, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(110, 'sku110', 'melons', '110.jpg', ' This is a melons product made in France and sold only in our store', ' This is a This is a melons product made in France and sold only in our store ', 1, '316', '186', 156, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(111, 'sku111', 'ketchup', '111.jpg', ' This is a ketchup product made in France and sold only in our store', ' This is a This is a ketchup product made in France and sold only in our store ', 1, '249', '228', 51, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(112, 'sku112', 'cream', '112.jpg', ' This is a cream product made in France and sold only in our store', ' This is a This is a cream product made in France and sold only in our store ', 1, '412', '374', 50, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(113, 'sku113', 'hand protein bar', '113.jpg', ' This is a hand protein bar product made in France and sold only in our store', ' This is a This is a hand protein bar product made in France and sold only in our store ', 1, '120', '45', 32, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(114, 'sku114', 'body spray', '114.jpg', ' This is a body spray product made in France and sold only in our store', ' This is a This is a body spray product made in France and sold only in our store ', 1, '36', '15', 98, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(115, 'sku115', 'oatmeal', '115.jpg', ' This is a oatmeal product made in France and sold only in our store', ' This is a This is a oatmeal product made in France and sold only in our store ', 1, '77', '66', 124, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(116, 'sku116', 'zucchini', '116.jpg', ' This is a zucchini product made in France and sold only in our store', ' This is a This is a zucchini product made in France and sold only in our store ', 1, '61', '10', 109, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(117, 'sku117', 'water spray', '117.jpg', ' This is a water spray product made in France and sold only in our store', ' This is a This is a water spray product made in France and sold only in our store ', 1, '213', '152', 189, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(118, 'sku118', 'tea', '118.jpg', ' This is a tea product made in France and sold only in our store', ' This is a This is a tea product made in France and sold only in our store ', 1, '50', '14', 142, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(119, 'sku119', 'napkins', '119.jpg', ' This is a napkins product made in France and sold only in our store', ' This is a This is a napkins product made in France and sold only in our store ', 1, '60', '40', 133, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00'),
(120, 'sku120', ' asparagus', '120.jpg', ' This is a  asparagus product made in France and sold only in our store', ' This is a This is a  asparagus product made in France and sold only in our store ', 1, '332', '159', 90, 0, '2019-05-01 15:38:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_statuses`
--

CREATE TABLE `product_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_statuses`
--

INSERT INTO `product_statuses` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'active', '2019-05-01 09:18:57', '0000-00-00 00:00:00'),
(2, 'out of stock', '2019-05-01 09:18:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`product_id`, `tag_id`, `inserted_at`, `updated_at`) VALUES
(1, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(2, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(3, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(4, 4, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(5, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(6, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(7, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(8, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(9, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(10, 4, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(11, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(12, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(13, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(14, 3, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(15, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(16, 3, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(17, 3, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(18, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(19, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(20, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(21, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(22, 3, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(23, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(24, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(25, 1, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(26, 3, '2019-05-01 15:40:20', '0000-00-00 00:00:00'),
(27, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(28, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(29, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(30, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(31, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(32, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(33, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(34, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(35, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(36, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(37, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(38, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(39, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(40, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(41, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(42, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(43, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(44, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(45, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(46, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(47, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(48, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(49, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(50, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(51, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(52, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(53, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(54, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(55, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(56, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(57, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(58, 3, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(59, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(60, 2, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(61, 1, '2019-05-01 15:40:21', '0000-00-00 00:00:00'),
(62, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(63, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(64, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(65, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(66, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(67, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(68, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(69, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(70, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(71, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(72, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(73, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(74, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(75, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(76, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(77, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(78, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(79, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(80, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(81, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(82, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(83, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(84, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(85, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(86, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(87, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(88, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(89, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(90, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(91, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(92, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(93, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(94, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(95, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(96, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(97, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(98, 2, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(99, 3, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(100, 1, '2019-05-01 15:40:22', '0000-00-00 00:00:00'),
(101, 3, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(102, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(103, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(104, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(105, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(106, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(107, 3, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(108, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(109, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(110, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(111, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(112, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(113, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(114, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(115, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(116, 2, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(117, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(118, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(119, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00'),
(120, 1, '2019-05-01 15:40:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'admin', '2019-05-01 08:51:01', '0000-00-00 00:00:00'),
(2, 'employer', '2019-05-01 08:52:13', '0000-00-00 00:00:00'),
(3, 'customer', '2019-05-01 08:52:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'few', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(2, 'take', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(3, 'buy a lot', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(4, 'overbuy', '2019-05-01 09:01:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pass` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `active`, `inserted_at`, `updated_at`, `pass`, `adress`, `phone`) VALUES
(1, 'admin@admin.com', 'Admin', 'super', 1, '2019-05-01 15:46:24', '0000-00-00 00:00:00', 'admin', 'hell', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`, `inserted_at`, `updated_at`) VALUES
(1, 1, '2019-05-01 15:48:27', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_status_id` (`product_status_id`);

--
-- Indexes for table `product_statuses`
--
ALTER TABLE `product_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `product_statuses`
--
ALTER TABLE `product_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `sales_orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_status_id`) REFERENCES `product_statuses` (`id`);

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `sales_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
