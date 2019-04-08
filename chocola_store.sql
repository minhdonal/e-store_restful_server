-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2019 at 08:43 AM
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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `users`, `pass`) VALUES
(1, 'nam', 'nam', 'nam');

-- --------------------------------------------------------

--
-- Table structure for table `oder_line`
--

CREATE TABLE `oder_line` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oder_line`
--

INSERT INTO `oder_line` (`id`, `id_product`, `quantity`) VALUES
(11, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_customer`) VALUES
(2, 1),
(3, 1),
(4, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `title`, `price`, `amount`) VALUES
(1, ' burgers ', '', '  ', 344, 5),
(2, ' chutney ', '', '  ', 22, 12),
(3, ' turkey ', '', '  ', 475, 15),
(4, ' mineral water ', '', '  ', 453, 3),
(5, ' low fat yogurt ', '', '  ', 471, 4),
(6, ' whole wheat pasta ', '', '  ', 79, 10),
(7, ' soup ', '', '  ', 308, 15),
(8, ' frozen vegetables ', '', '  ', 208, 13),
(9, ' french fries ', '', '  ', 466, 4),
(10, ' eggs ', '', '  ', 427, 11),
(11, ' cookies ', '', '  ', 34, 11),
(12, ' spaghetti ', '', '  ', 27, 8),
(13, ' shrimp ', '', '  ', 191, 10),
(14, ' meatballs ', '', '  ', 37, 11),
(15, ' red wine ', '', '  ', 310, 17),
(16, ' rice ', '', '  ', 452, 10),
(17, ' parmesan cheese ', '', '  ', 326, 4),
(18, ' ground beef ', '', '  ', 195, 1),
(19, ' sparkling water ', '', '  ', 432, 4),
(20, ' herb & pepper ', '', '  ', 61, 9),
(21, ' pickles ', '', '  ', 169, 11),
(22, ' energy bar ', '', '  ', 475, 1),
(23, ' fresh tuna ', '', '  ', 255, 19),
(24, ' escalope ', '', '  ', 149, 6),
(25, ' avocado ', '', '  ', 286, 10),
(26, ' tomato sauce ', '', '  ', 247, 5),
(27, ' clothes accessories ', '', '  ', 301, 13),
(28, ' energy drink ', '', '  ', 180, 12),
(29, ' chocolate ', '', '  ', 494, 15),
(30, ' grated cheese ', '', '  ', 362, 14),
(31, ' yogurt cake ', '', '  ', 458, 20),
(32, ' mint ', '', '  ', 76, 16),
(33, ' asparagus ', '', '  ', 306, 9),
(34, ' champagne ', '', '  ', 113, 8),
(35, ' ham ', '', '  ', 50, 1),
(36, ' muffins ', '', '  ', 31, 8),
(37, ' french wine ', '', '  ', 174, 4),
(38, ' chicken ', '', '  ', 388, 11),
(39, ' pasta ', '', '  ', 405, 16),
(40, ' tomatoes ', '', '  ', 410, 15),
(41, ' pancakes ', '', '  ', 232, 6),
(42, ' frozen smoothie ', '', '  ', 287, 8),
(43, ' carrots ', '', '  ', 160, 1),
(44, ' yams ', '', '  ', 372, 15),
(45, ' shallot ', '', '  ', 341, 9),
(46, ' butter ', '', '  ', 125, 19),
(47, ' light mayo ', '', '  ', 320, 12),
(48, ' pepper ', '', '  ', 241, 12),
(49, ' candy bars ', '', '  ', 68, 8),
(50, ' cooking oil ', '', '  ', 129, 2),
(51, ' milk ', '', '  ', 235, 1),
(52, ' green tea ', '', '  ', 66, 7),
(53, ' bug spray ', '', '  ', 271, 8),
(54, ' oil ', '', '  ', 407, 17),
(55, ' olive oil ', '', '  ', 389, 15),
(56, ' salmon ', '', '  ', 469, 5),
(57, ' cake ', '', '  ', 311, 10),
(58, ' almonds ', '', '  ', 456, 3),
(59, ' salt ', '', '  ', 453, 7),
(60, ' strong cheese ', '', '  ', 405, 16),
(61, ' hot dogs ', '', '  ', 395, 17),
(62, ' pet food ', '', '  ', 279, 12),
(63, ' whole wheat rice ', '', '  ', 40, 19),
(64, ' antioxydant juice ', '', '  ', 195, 10),
(65, ' honey ', '', '  ', 126, 20),
(66, ' sandwich ', '', '  ', 181, 20),
(67, ' salad ', '', '  ', 186, 13),
(68, ' magazines ', '', '  ', 453, 9),
(69, ' protein bar ', '', '  ', 40, 15),
(70, ' mayonnaise ', '', '  ', 268, 18),
(71, ' cider ', '', '  ', 441, 15),
(72, ' burger sauce ', '', '  ', 247, 13),
(73, ' green grapes ', '', '  ', 82, 2),
(74, ' vegetables mix ', '', '  ', 331, 18),
(75, ' bramble ', '', '  ', 155, 5),
(76, ' nonfat milk ', '', '  ', 20, 13),
(77, ' tomato juice ', '', '  ', 106, 20),
(78, ' green beans ', '', '  ', 431, 7),
(79, ' strawberries ', '', '  ', 89, 16),
(80, ' eggplant ', '', '  ', 199, 4),
(81, ' mushroom cream sauce ', '', '  ', 15, 20),
(82, ' gums ', '', '  ', 378, 16),
(83, ' cereals ', '', '  ', 465, 2),
(84, ' flax seed ', '', '  ', 174, 3),
(85, ' spinach ', '', '  ', 66, 14),
(86, ' soda ', '', '  ', 117, 12),
(87, ' dessert wine ', '', '  ', 27, 16),
(88, ' corn ', '', '  ', 115, 19),
(89, ' fresh bread ', '', '  ', 221, 19),
(90, ' brownies ', '', '  ', 282, 20),
(91, ' fromage blanc ', '', '  ', 289, 13),
(92, ' chocolate bread ', '', '  ', 246, 13),
(93, ' mashed potato ', '', '  ', 427, 8),
(94, ' gluten free bar ', '', '  ', 39, 7),
(95, ' cottage cheese ', '', '  ', 195, 14),
(96, ' whole weat flour ', '', '  ', 301, 15),
(97, ' chili ', '', '  ', 94, 15),
(98, ' barbecue sauce ', '', '  ', 236, 18),
(99, ' light cream ', '', '  ', 297, 20),
(100, ' mint green tea ', '', '  ', 210, 8),
(101, ' black tea ', '', '  ', 88, 7),
(102, ' bacon ', '', '  ', 435, 17),
(103, ' shampoo ', '', '  ', 490, 13),
(104, ' blueberries ', '', '  ', 283, 11),
(105, ' cauliflower ', '', '  ', 116, 18),
(106, ' extra dark chocolate ', '', '  ', 110, 8),
(107, ' white wine ', '', '  ', 74, 12),
(108, ' babies food ', '', '  ', 418, 12),
(109, ' toothpaste ', '', '  ', 361, 9),
(110, ' melons ', '', '  ', 378, 11),
(111, ' ketchup ', '', '  ', 232, 3),
(112, ' cream ', '', '  ', 105, 20),
(113, ' hand protein bar ', '', '  ', 271, 8),
(114, ' body spray ', '', '  ', 371, 20),
(115, ' oatmeal ', '', '  ', 266, 15),
(116, ' zucchini ', '', '  ', 427, 6),
(117, ' water spray ', '', '  ', 208, 4),
(118, ' tea ', '', '  ', 288, 3),
(119, ' napkins ', '', '  ', 304, 12),
(120, '  asparagus ', '', '  ', 281, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oder_line`
--
ALTER TABLE `oder_line`
  ADD PRIMARY KEY (`id`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oder_line`
--
ALTER TABLE `oder_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oder_line`
--
ALTER TABLE `oder_line`
  ADD CONSTRAINT `oder_line_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `oder_line_ibfk_2` FOREIGN KEY (`id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
