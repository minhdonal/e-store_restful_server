-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2019 at 08:45 AM
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
-- Table structure for table `order_line`
--

CREATE TABLE  IF NOT EXISTS `order_line` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
   `prices_unit` decimal(10,0),
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `product`
--
Create table  IF NOT EXISTS `category` (
    `id` int(11) NOT NULL,
    `name` varchar(255)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

insert into category (`id`, `name`) values (1, 'Groceries');
insert into category (`id`, `name`) values (2, 'Drink');
insert into category  (`id`, `name`) values (3, 'Cosmetics');
insert into category  (`id`, `name`) values (4, 'Candy/Pie');
insert into category (`id`, `name`) values (5, 'Fruit');

CREATE TABLE  IF NOT EXISTS `product` (
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
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Dumping data for table `product`
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (1,'burgers','1.jpg',' This is a burgers product made in France and sold only in our store ',1,438,140,134,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (2,'chutney','2.jpg',' This is a chutney product made in France and sold only in our store ',1,81,35,30,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (3,'turkey','3.jpg',' This is a turkey product made in France and sold only in our store ',1,63,53,121,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (4,'mineral water','4.jpg',' This is a mineral water product made in France and sold only in our store ',1,172,113,37,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (5,'low fat yogurt','5.jpg',' This is a low fat yogurt product made in France and sold only in our store ',1,279,96,109,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (6,'whole wheat pasta','6.jpg',' This is a whole wheat pasta product made in France and sold only in our store ',1,263,33,104,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (7,'soup','7.jpg',' This is a soup product made in France and sold only in our store ',1,254,190,145,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (8,'frozen vegetables','8.jpg',' This is a frozen vegetables product made in France and sold only in our store ',1,72,66,157,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (9,'french fries','9.jpg',' This is a french fries product made in France and sold only in our store ',1,281,28,188,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (10,'eggs','10.jpg',' This is a eggs product made in France and sold only in our store ',1,385,175,35,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (11,'cookies','11.jpg',' This is a cookies product made in France and sold only in our store ',1,68,10,191,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (12,'spaghetti','12.jpg',' This is a spaghetti product made in France and sold only in our store ',1,366,268,20,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (13,'shrimp','13.jpg',' This is a shrimp product made in France and sold only in our store ',1,25,13,188,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (14,'meatballs','14.jpg',' This is a meatballs product made in France and sold only in our store ',1,25,10,95,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (15,'red wine','15.jpg',' This is a red wine product made in France and sold only in our store ',1,153,73,8,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (16,'rice','16.jpg',' This is a rice product made in France and sold only in our store ',1,479,197,21,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (17,'parmesan cheese','17.jpg',' This is a parmesan cheese product made in France and sold only in our store ',1,223,36,117,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (18,'ground beef','18.jpg',' This is a ground beef product made in France and sold only in our store ',1,425,114,139,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (19,'sparkling water','19.jpg',' This is a sparkling water product made in France and sold only in our store ',1,499,167,198,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (20,'herb & pepper','20.jpg',' This is a herb & pepper product made in France and sold only in our store ',1,499,246,123,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (21,'pickles','21.jpg',' This is a pickles product made in France and sold only in our store ',1,266,19,4,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (22,'energy bar','22.jpg',' This is a energy bar product made in France and sold only in our store ',1,168,14,79,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (23,'fresh tuna','23.jpg',' This is a fresh tuna product made in France and sold only in our store ',1,436,44,114,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (24,'escalope','24.jpg',' This is a escalope product made in France and sold only in our store ',1,463,383,85,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (25,'avocado','25.jpg',' This is a avocado product made in France and sold only in our store ',1,42,11,104,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (26,'tomato sauce','26.jpg',' This is a tomato sauce product made in France and sold only in our store ',1,96,81,54,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (27,'clothes accessories','27.jpg',' This is a clothes accessories product made in France and sold only in our store ',1,139,104,20,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (28,'energy drink','28.jpg',' This is a energy drink product made in France and sold only in our store ',1,103,95,77,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (29,'chocolate','29.jpg',' This is a chocolate product made in France and sold only in our store ',1,133,119,56,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (30,'grated cheese','30.jpg',' This is a grated cheese product made in France and sold only in our store ',1,234,135,17,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (31,'yogurt cake','31.jpg',' This is a yogurt cake product made in France and sold only in our store ',1,78,28,137,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (32,'mint','32.jpg',' This is a mint product made in France and sold only in our store ',1,43,35,57,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (33,'asparagus','33.jpg',' This is a asparagus product made in France and sold only in our store ',1,63,29,86,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (34,'champagne','34.jpg',' This is a champagne product made in France and sold only in our store ',1,183,117,137,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (35,'ham','35.jpg',' This is a ham product made in France and sold only in our store ',1,137,39,180,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (36,'muffins','36.jpg',' This is a muffins product made in France and sold only in our store ',1,95,33,73,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (37,'french wine','37.jpg',' This is a french wine product made in France and sold only in our store ',1,428,185,153,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (38,'chicken','38.jpg',' This is a chicken product made in France and sold only in our store ',1,276,208,139,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (39,'pasta','39.jpg',' This is a pasta product made in France and sold only in our store ',1,104,97,64,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (40,'tomatoes','40.jpg',' This is a tomatoes product made in France and sold only in our store ',1,277,258,122,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (41,'pancakes','41.jpg',' This is a pancakes product made in France and sold only in our store ',1,398,141,119,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (42,'frozen smoothie','42.jpg',' This is a frozen smoothie product made in France and sold only in our store ',1,64,18,154,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (43,'carrots','43.jpg',' This is a carrots product made in France and sold only in our store ',1,379,85,118,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (44,'yams','44.jpg',' This is a yams product made in France and sold only in our store ',1,65,39,92,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (45,'shallot','45.jpg',' This is a shallot product made in France and sold only in our store ',1,312,298,164,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (46,'butter','46.jpg',' This is a butter product made in France and sold only in our store ',1,178,134,47,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (47,'light mayo','47.jpg',' This is a light mayo product made in France and sold only in our store ',1,29,13,196,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (48,'pepper','48.jpg',' This is a pepper product made in France and sold only in our store ',1,297,31,64,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (49,'candy bars','49.jpg',' This is a candy bars product made in France and sold only in our store ',1,36,26,28,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (50,'cooking oil','50.jpg',' This is a cooking oil product made in France and sold only in our store ',1,170,134,156,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (51,'milk','51.jpg',' This is a milk product made in France and sold only in our store ',1,187,158,184,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (52,'green tea','52.jpg',' This is a green tea product made in France and sold only in our store ',1,287,97,13,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (53,'bug spray','53.jpg',' This is a bug spray product made in France and sold only in our store ',1,43,22,116,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (54,'oil','54.jpg',' This is a oil product made in France and sold only in our store ',1,78,46,191,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (55,'olive oil','55.jpg',' This is a olive oil product made in France and sold only in our store ',1,122,60,79,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (56,'salmon','56.jpg',' This is a salmon product made in France and sold only in our store ',1,148,62,125,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (57,'cake','57.jpg',' This is a cake product made in France and sold only in our store ',1,459,330,73,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (58,'almonds','58.jpg',' This is a almonds product made in France and sold only in our store ',1,494,440,77,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (59,'salt','59.jpg',' This is a salt product made in France and sold only in our store ',1,393,130,54,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (60,'strong cheese','60.jpg',' This is a strong cheese product made in France and sold only in our store ',1,466,244,155,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (61,'hot dogs','61.jpg',' This is a hot dogs product made in France and sold only in our store ',1,383,96,197,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (62,'pet food','62.jpg',' This is a pet food product made in France and sold only in our store ',1,303,61,52,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (63,'whole wheat rice','63.jpg',' This is a whole wheat rice product made in France and sold only in our store ',1,366,188,107,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (64,'antioxydant juice','64.jpg',' This is a antioxydant juice product made in France and sold only in our store ',1,166,97,4,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (65,'honey','65.jpg',' This is a honey product made in France and sold only in our store ',1,445,205,81,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (66,'sandwich','66.jpg',' This is a sandwich product made in France and sold only in our store ',1,23,8,107,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (67,'salad','67.jpg',' This is a salad product made in France and sold only in our store ',1,400,205,70,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (68,'magazines','68.jpg',' This is a magazines product made in France and sold only in our store ',1,303,293,39,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (69,'protein bar','69.jpg',' This is a protein bar product made in France and sold only in our store ',1,270,125,100,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (70,'mayonnaise','70.jpg',' This is a mayonnaise product made in France and sold only in our store ',1,284,249,148,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (71,'cider','71.jpg',' This is a cider product made in France and sold only in our store ',1,12,7,130,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (72,'burger sauce','72.jpg',' This is a burger sauce product made in France and sold only in our store ',1,95,85,136,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (73,'green grapes','73.jpg',' This is a green grapes product made in France and sold only in our store ',1,489,196,56,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (74,'vegetables mix','74.jpg',' This is a vegetables mix product made in France and sold only in our store ',1,189,161,179,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (75,'bramble','75.jpg',' This is a bramble product made in France and sold only in our store ',1,408,267,75,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (76,'nonfat milk','76.jpg',' This is a nonfat milk product made in France and sold only in our store ',1,474,353,8,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (77,'tomato juice','77.jpg',' This is a tomato juice product made in France and sold only in our store ',1,118,75,23,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (78,'green beans','78.jpg',' This is a green beans product made in France and sold only in our store ',1,147,45,21,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (79,'strawberries','79.jpg',' This is a strawberries product made in France and sold only in our store ',1,232,226,159,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (80,'eggplant','80.jpg',' This is a eggplant product made in France and sold only in our store ',1,241,17,32,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (81,'mushroom cream sauce','81.jpg',' This is a mushroom cream sauce product made in France and sold only in our store ',1,460,378,151,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (82,'gums','82.jpg',' This is a gums product made in France and sold only in our store ',1,194,133,78,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (83,'cereals','83.jpg',' This is a cereals product made in France and sold only in our store ',1,381,85,97,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (84,'flax seed','84.jpg',' This is a flax seed product made in France and sold only in our store ',1,176,106,25,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (85,'spinach','85.jpg',' This is a spinach product made in France and sold only in our store ',1,28,6,32,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (86,'soda','86.jpg',' This is a soda product made in France and sold only in our store ',1,111,92,34,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (87,'dessert wine','87.jpg',' This is a dessert wine product made in France and sold only in our store ',1,336,19,44,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (88,'corn','88.jpg',' This is a corn product made in France and sold only in our store ',1,140,94,55,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (89,'fresh bread','89.jpg',' This is a fresh bread product made in France and sold only in our store ',1,465,149,191,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (90,'brownies','90.jpg',' This is a brownies product made in France and sold only in our store ',1,21,9,147,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (91,'fromage blanc','91.jpg',' This is a fromage blanc product made in France and sold only in our store ',1,223,147,182,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (92,'chocolate bread','92.jpg',' This is a chocolate bread product made in France and sold only in our store ',1,204,109,172,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (93,'mashed potato','93.jpg',' This is a mashed potato product made in France and sold only in our store ',1,493,390,53,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (94,'gluten free bar','94.jpg',' This is a gluten free bar product made in France and sold only in our store ',1,411,112,97,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (95,'cottage cheese','95.jpg',' This is a cottage cheese product made in France and sold only in our store ',1,250,18,186,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (96,'whole weat flour','96.jpg',' This is a whole weat flour product made in France and sold only in our store ',1,426,32,67,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (97,'chili','97.jpg',' This is a chili product made in France and sold only in our store ',1,393,155,29,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (98,'barbecue sauce','98.jpg',' This is a barbecue sauce product made in France and sold only in our store ',1,148,98,95,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (99,'light cream','99.jpg',' This is a light cream product made in France and sold only in our store ',1,176,31,11,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (100,'mint green tea','100.jpg',' This is a mint green tea product made in France and sold only in our store ',1,351,148,1,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (101,'black tea','101.jpg',' This is a black tea product made in France and sold only in our store ',1,327,231,24,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (102,'bacon','102.jpg',' This is a bacon product made in France and sold only in our store ',1,370,271,133,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (103,'shampoo','103.jpg',' This is a shampoo product made in France and sold only in our store ',1,309,265,197,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (104,'blueberries','104.jpg',' This is a blueberries product made in France and sold only in our store ',1,331,196,67,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (105,'cauliflower','105.jpg',' This is a cauliflower product made in France and sold only in our store ',1,55,45,131,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (106,'extra dark chocolate','106.jpg',' This is a extra dark chocolate product made in France and sold only in our store ',1,130,23,132,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (107,'white wine','107.jpg',' This is a white wine product made in France and sold only in our store ',1,382,267,170,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (108,'babies food','108.jpg',' This is a babies food product made in France and sold only in our store ',1,64,52,103,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (109,'toothpaste','109.jpg',' This is a toothpaste product made in France and sold only in our store ',1,224,187,51,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (110,'melons','110.jpg',' This is a melons product made in France and sold only in our store ',1,11,6,131,3,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (111,'ketchup','111.jpg',' This is a ketchup product made in France and sold only in our store ',1,289,136,133,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (112,'cream','112.jpg',' This is a cream product made in France and sold only in our store ',1,115,108,6,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (113,'hand protein bar','113.jpg',' This is a hand protein bar product made in France and sold only in our store ',1,290,250,32,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (114,'body spray','114.jpg',' This is a body spray product made in France and sold only in our store ',1,319,71,82,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (115,'oatmeal','115.jpg',' This is a oatmeal product made in France and sold only in our store ',1,393,252,78,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (116,'zucchini','116.jpg',' This is a zucchini product made in France and sold only in our store ',1,40,17,153,1,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (117,'water spray','117.jpg',' This is a water spray product made in France and sold only in our store ',1,306,114,17,5,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (118,'tea','118.jpg',' This is a tea product made in France and sold only in our store ',1,118,83,21,4,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (119,'napkins','119.jpg',' This is a napkins product made in France and sold only in our store ',1,124,114,90,2,0.1);
insert into product (`id`,`name`, `img_url`, `description`, `product_status_id`, `regular_price`, `discount_price`, `quantity`, `categ_id`,`taxable`) values (120,' asparagus','120.jpg',' This is a  asparagus product made in France and sold only in our store ',1,192,107,129,2,0.1);


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
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
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
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `inserted_at`, `updated_at`) VALUES
(1, 'few', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(2, 'take', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(3, 'buy a lot', '2019-05-01 09:01:21', '0000-00-00 00:00:00'),
(4, 'overbuy', '2019-05-01 09:01:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password_hash` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `active`, `inserted_at`, `updated_at`, `password_hash`, `adress`, `phone`) VALUES
(1, 'admin@admin.com', 'Admin', 'super', 1, '2019-05-01 15:46:24', '0000-00-00 00:00:00', 'admin', 'hell', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`, `inserted_at`, `updated_at`) VALUES
(1, 1, '2019-05-01 15:48:27', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_line`
--
ALTER TABLE `category` ADD PRIMARY KEY (`id`);
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `FK_ProductOrder` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product` ADD PRIMARY KEY (`id`),
  ADD KEY `product_status_id` (`product_status_id`),
  ADD KEY categ_id (categ_id);

select * from product;
-- Indexes for table `product_statuses`
--
ALTER TABLE `product_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_ProductOrder` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_SaleOrder` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`id`),
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_status_id`) REFERENCES `product_statuses` (`id`);
  
ALTER TABLE `product`
  ADD CONSTRAINT `product_categ_1` FOREIGN KEY (`categ_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `sales_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
