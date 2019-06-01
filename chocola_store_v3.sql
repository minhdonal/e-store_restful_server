-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 01, 2019 lúc 05:17 AM
-- Phiên bản máy phục vụ: 10.1.30-MariaDB
-- Phiên bản PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chocola_store_v3`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Groceries'),
(2, 'Drink'),
(3, 'Cosmetics'),
(4, 'Candy/Pie'),
(5, 'Fruit');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_line`
--

CREATE TABLE `order_line` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `price_unit` decimal(10,0) DEFAULT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categ_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `product_status_id` int(11) NOT NULL,
  `regular_price` decimal(10,0) DEFAULT '0',
  `discount_price` decimal(10,0) DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  `taxable` tinyint(1) DEFAULT '0',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `categ_id`, `name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `taxable`, `inserted_at`, `updated_at`) VALUES
(1, 2, 'burgers', 'static/product_img/burgers.jpg', ' This is a burgers product made in France and sold only in our store ', 1, '438', '140', 134, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(2, 5, 'chutney', 'static/product_img/burgers.jpg', ' This is a chutney product made in France and sold only in our store ', 1, '81', '35', 30, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(3, 2, 'turkey', 'static/product_img/lowfat_yogurt.jpg', ' This is a turkey product made in France and sold only in our store ', 1, '63', '53', 121, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(4, 4, 'mineral water', 'static/product_img/lowfat_yogurt.jpg', ' This is a mineral water product made in France and sold only in our store ', 1, '172', '113', 37, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(5, 4, 'low fat yogurt', 'static/product_img/pasta.jpg', ' This is a low fat yogurt product made in France and sold only in our store ', 1, '279', '96', 109, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(6, 2, 'whole wheat pasta', 'static/product_img/burgers.jpg', ' This is a whole wheat pasta product made in France and sold only in our store ', 1, '263', '33', 104, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(7, 2, 'soup', 'static/product_img/burgers.jpg', ' This is a soup product made in France and sold only in our store ', 1, '254', '190', 145, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(8, 4, 'frozen vegetables', 'static/product_img/pasta.jpg', ' This is a frozen vegetables product made in France and sold only in our store ', 1, '72', '66', 157, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(9, 3, 'french fries', 'static/product_img/pasta.jpg', ' This is a french fries product made in France and sold only in our store ', 1, '281', '28', 188, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(10, 5, 'eggs', 'static/product_img/burgers.jpg', ' This is a eggs product made in France and sold only in our store ', 1, '385', '175', 35, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(11, 5, 'cookies', 'static/product_img/pasta.jpg', ' This is a cookies product made in France and sold only in our store ', 1, '68', '10', 191, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(12, 3, 'spaghetti', 'static/product_img/pasta.jpg', ' This is a spaghetti product made in France and sold only in our store ', 1, '366', '268', 20, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(13, 1, 'shrimp', 'static/product_img/burgers.jpg', ' This is a shrimp product made in France and sold only in our store ', 1, '25', '13', 188, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(14, 1, 'meatballs', 'static/product_img/burgers.jpg', ' This is a meatballs product made in France and sold only in our store ', 1, '25', '10', 95, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(15, 3, 'red wine', 'static/product_img/lowfat_yogurt.jpg', ' This is a red wine product made in France and sold only in our store ', 1, '153', '73', 8, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(16, 3, 'rice', 'static/product_img/pasta.jpg', ' This is a rice product made in France and sold only in our store ', 1, '479', '197', 21, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(17, 5, 'parmesan cheese', 'static/product_img/pasta.jpg', ' This is a parmesan cheese product made in France and sold only in our store ', 1, '223', '36', 117, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(18, 4, 'ground beef', 'static/product_img/lowfat_yogurt.jpg', ' This is a ground beef product made in France and sold only in our store ', 1, '425', '114', 139, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(19, 4, 'sparkling water', 'static/product_img/pasta.jpg', ' This is a sparkling water product made in France and sold only in our store ', 1, '499', '167', 198, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(20, 1, 'herb & pepper', 'static/product_img/burgers.jpg', ' This is a herb & pepper product made in France and sold only in our store ', 1, '499', '246', 123, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(21, 5, 'pickles', 'static/product_img/burgers.jpg', ' This is a pickles product made in France and sold only in our store ', 1, '266', '19', 4, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(22, 4, 'energy bar', 'static/product_img/burgers.jpg', ' This is a energy bar product made in France and sold only in our store ', 1, '168', '14', 79, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(23, 3, 'fresh tuna', 'static/product_img/lowfat_yogurt.jpg', ' This is a fresh tuna product made in France and sold only in our store ', 1, '436', '44', 114, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(24, 1, 'escalope', 'static/product_img/pasta.jpg', ' This is a escalope product made in France and sold only in our store ', 1, '463', '383', 85, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(25, 3, 'avocado', 'static/product_img/lowfat_yogurt.jpg', ' This is a avocado product made in France and sold only in our store ', 1, '42', '11', 104, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(26, 4, 'tomato sauce', 'static/product_img/lowfat_yogurt.jpg', ' This is a tomato sauce product made in France and sold only in our store ', 1, '96', '81', 54, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(27, 2, 'clothes accessories', 'static/product_img/pasta.jpg', ' This is a clothes accessories product made in France and sold only in our store ', 1, '139', '104', 20, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(28, 2, 'energy drink', 'static/product_img/burgers.jpg', ' This is a energy drink product made in France and sold only in our store ', 1, '103', '95', 77, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(29, 3, 'chocolate', 'static/product_img/lowfat_yogurt.jpg', ' This is a chocolate product made in France and sold only in our store ', 1, '133', '119', 56, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(30, 4, 'grated cheese', 'static/product_img/pasta.jpg', ' This is a grated cheese product made in France and sold only in our store ', 1, '234', '135', 17, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(31, 5, 'yogurt cake', 'static/product_img/lowfat_yogurt.jpg', ' This is a yogurt cake product made in France and sold only in our store ', 1, '78', '28', 137, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(32, 3, 'mint', 'static/product_img/pasta.jpg', ' This is a mint product made in France and sold only in our store ', 1, '43', '35', 57, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(33, 3, 'asparagus', 'static/product_img/burgers.jpg', ' This is a asparagus product made in France and sold only in our store ', 1, '63', '29', 86, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(34, 3, 'champagne', 'static/product_img/burgers.jpg', ' This is a champagne product made in France and sold only in our store ', 1, '183', '117', 137, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(35, 5, 'ham', 'static/product_img/lowfat_yogurt.jpg', ' This is a ham product made in France and sold only in our store ', 1, '137', '39', 180, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(36, 5, 'muffins', 'static/product_img/lowfat_yogurt.jpg', ' This is a muffins product made in France and sold only in our store ', 1, '95', '33', 73, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(37, 4, 'french wine', 'static/product_img/pasta.jpg', ' This is a french wine product made in France and sold only in our store ', 1, '428', '185', 153, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(38, 3, 'chicken', 'static/product_img/burgers.jpg', ' This is a chicken product made in France and sold only in our store ', 1, '276', '208', 139, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(39, 1, 'pasta', 'static/product_img/pasta.jpg', ' This is a pasta product made in France and sold only in our store ', 1, '104', '97', 64, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(40, 4, 'tomatoes', 'static/product_img/lowfat_yogurt.jpg', ' This is a tomatoes product made in France and sold only in our store ', 1, '277', '258', 122, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(41, 4, 'pancakes', 'static/product_img/pasta.jpg', ' This is a pancakes product made in France and sold only in our store ', 1, '398', '141', 119, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(42, 5, 'frozen smoothie', 'static/product_img/lowfat_yogurt.jpg', ' This is a frozen smoothie product made in France and sold only in our store ', 1, '64', '18', 154, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(43, 1, 'carrots', 'static/product_img/burgers.jpg', ' This is a carrots product made in France and sold only in our store ', 1, '379', '85', 118, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(44, 5, 'yams', 'static/product_img/lowfat_yogurt.jpg', ' This is a yams product made in France and sold only in our store ', 1, '65', '39', 92, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(45, 3, 'shallot', 'static/product_img/pasta.jpg', ' This is a shallot product made in France and sold only in our store ', 1, '312', '298', 164, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(46, 3, 'butter', 'static/product_img/burgers.jpg', ' This is a butter product made in France and sold only in our store ', 1, '178', '134', 47, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(47, 4, 'light mayo', 'static/product_img/pasta.jpg', ' This is a light mayo product made in France and sold only in our store ', 1, '29', '13', 196, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(48, 2, 'pepper', 'static/product_img/burgers.jpg', ' This is a pepper product made in France and sold only in our store ', 1, '297', '31', 64, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(49, 3, 'candy bars', 'static/product_img/lowfat_yogurt.jpg', ' This is a candy bars product made in France and sold only in our store ', 1, '36', '26', 28, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(50, 3, 'cooking oil', 'static/product_img/burgers.jpg', ' This is a cooking oil product made in France and sold only in our store ', 1, '170', '134', 156, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(51, 4, 'milk', 'static/product_img/pasta.jpg', ' This is a milk product made in France and sold only in our store ', 1, '187', '158', 184, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(52, 1, 'green tea', 'static/product_img/pasta.jpg', ' This is a green tea product made in France and sold only in our store ', 1, '287', '97', 13, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(53, 5, 'bug spray', 'static/product_img/pasta.jpg', ' This is a bug spray product made in France and sold only in our store ', 1, '43', '22', 116, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(54, 1, 'oil', 'static/product_img/lowfat_yogurt.jpg', ' This is a oil product made in France and sold only in our store ', 1, '78', '46', 191, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(55, 5, 'olive oil', 'static/product_img/lowfat_yogurt.jpg', ' This is a olive oil product made in France and sold only in our store ', 1, '122', '60', 79, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(56, 2, 'salmon', 'static/product_img/burgers.jpg', ' This is a salmon product made in France and sold only in our store ', 1, '148', '62', 125, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(57, 5, 'cake', 'static/product_img/burgers.jpg', ' This is a cake product made in France and sold only in our store ', 1, '459', '330', 73, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(58, 2, 'almonds', 'static/product_img/pasta.jpg', ' This is a almonds product made in France and sold only in our store ', 1, '494', '440', 77, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(59, 5, 'salt', 'static/product_img/burgers.jpg', ' This is a salt product made in France and sold only in our store ', 1, '393', '130', 54, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(60, 3, 'strong cheese', 'static/product_img/pasta.jpg', ' This is a strong cheese product made in France and sold only in our store ', 1, '466', '244', 155, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(61, 4, 'hot dogs', 'static/product_img/pasta.jpg', ' This is a hot dogs product made in France and sold only in our store ', 1, '383', '96', 197, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(62, 2, 'pet food', 'static/product_img/pasta.jpg', ' This is a pet food product made in France and sold only in our store ', 1, '303', '61', 52, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(63, 1, 'whole wheat rice', 'static/product_img/pasta.jpg', ' This is a whole wheat rice product made in France and sold only in our store ', 1, '366', '188', 107, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(64, 1, 'antioxydant juice', 'static/product_img/burgers.jpg', ' This is a antioxydant juice product made in France and sold only in our store ', 1, '166', '97', 4, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(65, 3, 'honey', 'static/product_img/burgers.jpg', ' This is a honey product made in France and sold only in our store ', 1, '445', '205', 81, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(66, 2, 'sandwich', 'static/product_img/lowfat_yogurt.jpg', ' This is a sandwich product made in France and sold only in our store ', 1, '23', '8', 107, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(67, 5, 'salad', 'static/product_img/lowfat_yogurt.jpg', ' This is a salad product made in France and sold only in our store ', 1, '400', '205', 70, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(68, 4, 'magazines', 'static/product_img/pasta.jpg', ' This is a magazines product made in France and sold only in our store ', 1, '303', '293', 39, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(69, 5, 'protein bar', 'static/product_img/pasta.jpg', ' This is a protein bar product made in France and sold only in our store ', 1, '270', '125', 100, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(70, 3, 'mayonnaise', 'static/product_img/lowfat_yogurt.jpg', ' This is a mayonnaise product made in France and sold only in our store ', 1, '284', '249', 148, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(71, 1, 'cider', 'static/product_img/lowfat_yogurt.jpg', ' This is a cider product made in France and sold only in our store ', 1, '12', '7', 130, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(72, 3, 'burger sauce', 'static/product_img/lowfat_yogurt.jpg', ' This is a burger sauce product made in France and sold only in our store ', 1, '95', '85', 136, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(73, 2, 'green grapes', 'static/product_img/lowfat_yogurt.jpg', ' This is a green grapes product made in France and sold only in our store ', 1, '489', '196', 56, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(74, 5, 'vegetables mix', 'static/product_img/lowfat_yogurt.jpg', ' This is a vegetables mix product made in France and sold only in our store ', 1, '189', '161', 179, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(75, 4, 'bramble', 'static/product_img/burgers.jpg', ' This is a bramble product made in France and sold only in our store ', 1, '408', '267', 75, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(76, 5, 'nonfat milk', 'static/product_img/lowfat_yogurt.jpg', ' This is a nonfat milk product made in France and sold only in our store ', 1, '474', '353', 8, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(77, 3, 'tomato juice', 'static/product_img/burgers.jpg', ' This is a tomato juice product made in France and sold only in our store ', 1, '118', '75', 23, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(78, 1, 'green beans', 'static/product_img/lowfat_yogurt.jpg', ' This is a green beans product made in France and sold only in our store ', 1, '147', '45', 21, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(79, 1, 'strawberries', 'static/product_img/lowfat_yogurt.jpg', ' This is a strawberries product made in France and sold only in our store ', 1, '232', '226', 159, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(80, 5, 'eggplant', 'static/product_img/lowfat_yogurt.jpg', ' This is a eggplant product made in France and sold only in our store ', 1, '241', '17', 32, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(81, 3, 'mushroom cream sauce', 'static/product_img/lowfat_yogurt.jpg', ' This is a mushroom cream sauce product made in France and sold only in our store ', 1, '460', '378', 151, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(82, 4, 'gums', 'static/product_img/burgers.jpg', ' This is a gums product made in France and sold only in our store ', 1, '194', '133', 78, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(83, 4, 'cereals', 'static/product_img/lowfat_yogurt.jpg', ' This is a cereals product made in France and sold only in our store ', 1, '381', '85', 97, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(84, 5, 'flax seed', 'static/product_img/lowfat_yogurt.jpg', ' This is a flax seed product made in France and sold only in our store ', 1, '176', '106', 25, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(85, 1, 'spinach', 'static/product_img/burgers.jpg', ' This is a spinach product made in France and sold only in our store ', 1, '28', '6', 32, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(86, 3, 'soda', 'static/product_img/burgers.jpg', ' This is a soda product made in France and sold only in our store ', 1, '111', '92', 34, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(87, 2, 'dessert wine', 'static/product_img/lowfat_yogurt.jpg', ' This is a dessert wine product made in France and sold only in our store ', 1, '336', '19', 44, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(88, 1, 'corn', 'static/product_img/burgers.jpg', ' This is a corn product made in France and sold only in our store ', 1, '140', '94', 55, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(89, 5, 'fresh bread', 'static/product_img/pasta.jpg', ' This is a fresh bread product made in France and sold only in our store ', 1, '465', '149', 191, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(90, 1, 'brownies', 'static/product_img/lowfat_yogurt.jpg', ' This is a brownies product made in France and sold only in our store ', 1, '21', '9', 147, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(91, 1, 'fromage blanc', 'static/product_img/lowfat_yogurt.jpg', ' This is a fromage blanc product made in France and sold only in our store ', 1, '223', '147', 182, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(92, 2, 'chocolate bread', 'static/product_img/pasta.jpg', ' This is a chocolate bread product made in France and sold only in our store ', 1, '204', '109', 172, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(93, 1, 'mashed potato', 'static/product_img/burgers.jpg', ' This is a mashed potato product made in France and sold only in our store ', 1, '493', '390', 53, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(94, 4, 'gluten free bar', 'static/product_img/burgers.jpg', ' This is a gluten free bar product made in France and sold only in our store ', 1, '411', '112', 97, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(95, 1, 'cottage cheese', 'static/product_img/lowfat_yogurt.jpg', ' This is a cottage cheese product made in France and sold only in our store ', 1, '250', '18', 186, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(96, 4, 'whole weat flour', 'static/product_img/burgers.jpg', ' This is a whole weat flour product made in France and sold only in our store ', 1, '426', '32', 67, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(97, 5, 'chili', 'static/product_img/burgers.jpg', ' This is a chili product made in France and sold only in our store ', 1, '393', '155', 29, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(98, 2, 'barbecue sauce', 'static/product_img/pasta.jpg', ' This is a barbecue sauce product made in France and sold only in our store ', 1, '148', '98', 95, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(99, 3, 'light cream', 'static/product_img/burgers.jpg', ' This is a light cream product made in France and sold only in our store ', 1, '176', '31', 11, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(100, 3, 'mint green tea', 'static/product_img/lowfat_yogurt.jpg', ' This is a mint green tea product made in France and sold only in our store ', 1, '351', '148', 1, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(101, 3, 'black tea', 'static/product_img/burgers.jpg', ' This is a black tea product made in France and sold only in our store ', 1, '327', '231', 24, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(102, 2, 'bacon', 'static/product_img/burgers.jpg', ' This is a bacon product made in France and sold only in our store ', 1, '370', '271', 133, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(103, 4, 'shampoo', 'static/product_img/lowfat_yogurt.jpg', ' This is a shampoo product made in France and sold only in our store ', 1, '309', '265', 197, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(104, 1, 'blueberries', 'static/product_img/lowfat_yogurt.jpg', ' This is a blueberries product made in France and sold only in our store ', 1, '331', '196', 67, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(105, 2, 'cauliflower', 'static/product_img/pasta.jpg', ' This is a cauliflower product made in France and sold only in our store ', 1, '55', '45', 131, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(106, 4, 'extra dark chocolate', 'static/product_img/lowfat_yogurt.jpg', ' This is a extra dark chocolate product made in France and sold only in our store ', 1, '130', '23', 132, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(107, 3, 'white wine', 'static/product_img/burgers.jpg', ' This is a white wine product made in France and sold only in our store ', 1, '382', '267', 170, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(108, 3, 'babies food', 'static/product_img/burgers.jpg', ' This is a babies food product made in France and sold only in our store ', 1, '64', '52', 103, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(109, 2, 'toothpaste', 'static/product_img/pasta.jpg', ' This is a toothpaste product made in France and sold only in our store ', 1, '224', '187', 51, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(110, 3, 'melons', 'static/product_img/pasta.jpg', ' This is a melons product made in France and sold only in our store ', 1, '11', '6', 131, 0, '2019-05-30 13:47:58', '0000-00-00 00:00:00'),
(111, 5, 'ketchup', 'static/product_img/burgers.jpg', ' This is a ketchup product made in France and sold only in our store ', 1, '289', '136', 133, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(112, 1, 'cream', 'static/product_img/pasta.jpg', ' This is a cream product made in France and sold only in our store ', 1, '115', '108', 6, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(113, 2, 'hand protein bar', 'static/product_img/lowfat_yogurt.jpg', ' This is a hand protein bar product made in France and sold only in our store ', 1, '290', '250', 32, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(114, 5, 'body spray', 'static/product_img/burgers.jpg', ' This is a body spray product made in France and sold only in our store ', 1, '319', '71', 82, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(115, 1, 'oatmeal', 'static/product_img/burgers.jpg', ' This is a oatmeal product made in France and sold only in our store ', 1, '393', '252', 78, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(116, 1, 'zucchini', 'static/product_img/lowfat_yogurt.jpg', ' This is a zucchini product made in France and sold only in our store ', 1, '40', '17', 153, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(117, 5, 'water spray', 'static/product_img/lowfat_yogurt.jpg', ' This is a water spray product made in France and sold only in our store ', 1, '306', '114', 17, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(118, 4, 'tea', 'static/product_img/burgers.jpg', ' This is a tea product made in France and sold only in our store ', 1, '118', '83', 21, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(119, 2, 'napkins', 'static/product_img/lowfat_yogurt.jpg', ' This is a napkins product made in France and sold only in our store ', 1, '124', '114', 90, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00'),
(120, 2, ' asparagus', 'static/product_img/pasta.jpg', ' This is a  asparagus product made in France and sold only in our store ', 1, '192', '107', 129, 0, '2019-05-30 13:48:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_statuses`
--

CREATE TABLE `product_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_statuses`
--

INSERT INTO `product_statuses` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'active', '2019-05-01 09:18:57', '0000-00-00 00:00:00'),
(2, 'out of stock', '2019-05-01 09:18:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tag`
--

INSERT INTO `product_tag` (`product_id`, `tag_id`, `inserted_at`, `updated_at`) VALUES
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
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'admin', '2019-05-01 08:51:01', '0000-00-00 00:00:00'),
(2, 'employer', '2019-05-01 08:52:13', '0000-00-00 00:00:00'),
(3, 'customer', '2019-05-01 08:52:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales_order`
--

CREATE TABLE `sales_order` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tag`
--

INSERT INTO `tag` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'few', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(2, 'take', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(3, 'buy a lot', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(4, 'overbuy', '2019-05-01 09:01:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `active`, `inserted_at`, `updated_at`, `password_hash`, `address`, `phone`) VALUES
(1, 'admin@admin.com', 'Admin', 'super', 1, '2019-05-01 15:46:24', '0000-00-00 00:00:00', 'admin', 'hell', 1111),
(2, 'test@gmail.com', 'test123456', NULL, 1, '2019-05-31 16:04:07', '0000-00-00 00:00:00', 'pbkdf2:sha256:50000$4TPC7f9f$fae868a750849aa61027e4e0301587fefad6008382bfc8ad32de76315bbf0429', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`, `inserted_at`, `updated_at`) VALUES
(1, 1, '2019-05-01 15:48:27', '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `FK_ProductOrder` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_status_id` (`product_status_id`),
  ADD KEY `categ_id` (`categ_id`);

--
-- Chỉ mục cho bảng `product_statuses`
--
ALTER TABLE `product_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT cho bảng `product_statuses`
--
ALTER TABLE `product_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_ProductOrder` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_SaleOrder` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`id`),
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_categ_1` FOREIGN KEY (`categ_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_status_id`) REFERENCES `product_statuses` (`id`);

--
-- Các ràng buộc cho bảng `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Các ràng buộc cho bảng `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `sales_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
