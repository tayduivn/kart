-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 27, 2019 lúc 07:07 AM
-- Phiên bản máy phục vụ: 10.3.14-MariaDB-log
-- Phiên bản PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kingsportq_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_address`
--

CREATE TABLE `ks_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_api`
--

CREATE TABLE `ks_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_api`
--

INSERT INTO `ks_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'TFQjqSYJKsbZCKOAraz9qzYILE3rfvrQaqkq0bxporr7P2JPrw1um5n3PVo7isqLmgsJoUFIEqr0mz1Ug7bokw1MUOxj0wmudHGBL2KjqVbnwHvp3imLReBNdJfUocGt6YhVDkxLmy62Q7yreIydXArxxLFpt3fAYJjl14OOeDnGVeoGOfKdHnBU06XfSQ1rZ6406driW2rFYpFulkCWjFHZRm0VEdthkMa4qk1QuyogmDnMdYDyXfX4h4ARBfju', 1, '2019-05-21 21:16:46', '2019-05-21 21:16:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_api_ip`
--

CREATE TABLE `ks_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_api_ip`
--

INSERT INTO `ks_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_api_session`
--

CREATE TABLE `ks_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_api_session`
--

INSERT INTO `ks_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, 'bffa404ba5530b264b568e7013', '127.0.0.1', '2019-05-25 16:49:59', '2019-05-25 16:49:59'),
(2, 1, 'f781f3d2b2e7892dd1a542e86e', '127.0.0.1', '2019-05-25 16:50:03', '2019-05-25 16:50:04'),
(3, 1, 'b09c0158a1e23bc6cc0b9c5007', '127.0.0.1', '2019-05-25 16:50:18', '2019-05-25 16:50:18'),
(4, 1, 'f56095b1b7b9b115e21170fad5', '127.0.0.1', '2019-05-26 13:26:39', '2019-05-26 13:26:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_attribute`
--

CREATE TABLE `ks_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_attribute`
--

INSERT INTO `ks_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 4, 2),
(2, 4, 5),
(3, 4, 1),
(4, 4, 3),
(5, 4, 4),
(6, 4, 6),
(7, 4, 7),
(8, 4, 8),
(9, 4, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 4, 13),
(14, 4, 14),
(15, 7, 1),
(16, 7, 2),
(17, 7, 3),
(18, 7, 4),
(19, 7, 5),
(20, 7, 6),
(21, 7, 7),
(22, 7, 8),
(23, 7, 9),
(24, 7, 10),
(25, 7, 11),
(26, 7, 12),
(27, 7, 13),
(28, 7, 14),
(29, 8, 1),
(30, 8, 2),
(31, 8, 3),
(32, 8, 4),
(33, 8, 5),
(34, 8, 6),
(35, 8, 7),
(36, 8, 8),
(37, 8, 9),
(38, 8, 10),
(39, 9, 1),
(40, 9, 2),
(41, 9, 3),
(42, 9, 4),
(43, 9, 5),
(44, 9, 6),
(45, 9, 7),
(46, 9, 8),
(47, 9, 9),
(48, 9, 10),
(49, 9, 11),
(50, 9, 12),
(51, 9, 13),
(52, 4, 15),
(54, 4, 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_attribute_description`
--

CREATE TABLE `ks_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_attribute_description`
--

INSERT INTO `ks_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(2, 2, 'Tốc độ tối đa'),
(1, 2, 'Điện Áp'),
(4, 2, 'Công suất'),
(5, 2, 'Tải trọng người dùng'),
(6, 2, 'Kích thước vùng chạy'),
(7, 2, 'Chế độ nâng dốc tự động'),
(8, 2, 'Hệ thống giảm sốc'),
(10, 2, 'Đai massage,tạ tay, thanh gập bụng'),
(11, 2, 'Nghe nhạc HIFi Chất Lượng Cao'),
(3, 2, 'Model'),
(9, 2, 'Chương trình tập'),
(12, 2, 'Cổng kết nối'),
(13, 2, 'Di chuyển bằng bánh xe'),
(14, 2, 'Chế độ bảo hành'),
(15, 2, 'Sơn'),
(16, 2, 'Tem xe'),
(17, 2, 'Màu sắc'),
(18, 2, 'Khung sườn'),
(19, 2, 'Phuộc nhún'),
(20, 2, 'Tay lái'),
(21, 2, 'Cốt yên'),
(22, 2, 'Yên ngồi'),
(23, 2, 'Thắng'),
(24, 2, 'Sên xe - Chain'),
(25, 2, 'Niềng xe - Rim'),
(26, 2, 'Vỏ xe – Tire'),
(27, 2, 'Tải trọng'),
(28, 2, 'Bảo hành'),
(29, 2, 'Điện áp'),
(30, 2, 'Công suất'),
(31, 2, 'Sức hút tuyệt đối'),
(32, 2, 'Kích thước buồng hút khí'),
(33, 2, 'Kích thước thanh hàn (ép nhiệt)'),
(34, 2, 'Buồng hút khí'),
(35, 2, 'Lượng khí cung cấp'),
(36, 2, 'Chu trình làm việc'),
(37, 2, 'Kích thước đóng gói'),
(38, 2, 'Trọng lượng (G.W/N.W)'),
(39, 2, 'Màn hình hiễn thị'),
(40, 2, 'Bộ nhớ'),
(41, 2, 'Chức năng thoại'),
(42, 2, 'Phạm vi đo'),
(43, 2, 'Sai số'),
(44, 2, 'Điện áp làm việc'),
(45, 2, 'Shut off the Current'),
(46, 2, 'Inrush Current'),
(47, 2, 'Đường kính có thể đo'),
(48, 2, 'Tự động tắt nguồn'),
(49, 2, 'Nhiệt độ lưu trữ'),
(50, 2, 'Độ Ẩm'),
(51, 2, 'Trọng lượng máy'),
(2, 3, 'Tốc độ tối đa'),
(1, 3, 'Điện Áp'),
(4, 3, 'Công suất'),
(5, 3, 'Tải trọng người dùng'),
(6, 3, 'Kích thước vùng chạy'),
(7, 3, 'Chế độ nâng dốc tự động'),
(8, 3, 'Hệ thống giảm sốc'),
(10, 3, 'Đai massage,tạ tay, thanh gập bụng'),
(11, 3, 'Nghe nhạc HIFi Chất Lượng Cao'),
(3, 3, 'Model'),
(9, 3, 'Chương trình tập'),
(12, 3, 'Cổng kết nối'),
(13, 3, 'Di chuyển bằng bánh xe'),
(14, 3, 'Chế độ bảo hành'),
(15, 3, 'Sơn'),
(16, 3, 'Tem xe'),
(17, 3, 'Màu sắc'),
(18, 3, 'Khung sườn'),
(19, 3, 'Phuộc nhún'),
(20, 3, 'Tay lái'),
(21, 3, 'Cốt yên'),
(22, 3, 'Yên ngồi'),
(23, 3, 'Thắng'),
(24, 3, 'Sên xe - Chain'),
(25, 3, 'Niềng xe - Rim'),
(26, 3, 'Vỏ xe – Tire'),
(27, 3, 'Tải trọng'),
(28, 3, 'Bảo hành'),
(29, 3, 'Điện áp'),
(30, 3, 'Công suất'),
(31, 3, 'Sức hút tuyệt đối'),
(32, 3, 'Kích thước buồng hút khí'),
(33, 3, 'Kích thước thanh hàn (ép nhiệt)'),
(34, 3, 'Buồng hút khí'),
(35, 3, 'Lượng khí cung cấp'),
(36, 3, 'Chu trình làm việc'),
(37, 3, 'Kích thước đóng gói'),
(38, 3, 'Trọng lượng (G.W/N.W)'),
(39, 3, 'Màn hình hiễn thị'),
(40, 3, 'Bộ nhớ'),
(41, 3, 'Chức năng thoại'),
(42, 3, 'Phạm vi đo'),
(43, 3, 'Sai số'),
(44, 3, 'Điện áp làm việc'),
(45, 3, 'Shut off the Current'),
(46, 3, 'Inrush Current'),
(47, 3, 'Đường kính có thể đo'),
(48, 3, 'Tự động tắt nguồn'),
(49, 3, 'Nhiệt độ lưu trữ'),
(50, 3, 'Độ Ẩm'),
(51, 3, 'Trọng lượng máy'),
(52, 2, 'Đai massage, thanh gập bụng'),
(52, 3, 'Đai massage, thanh gập bụng'),
(54, 2, 'Xếp gọn, di chuyển bằng bánh xe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_attribute_group`
--

CREATE TABLE `ks_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_attribute_group`
--

INSERT INTO `ks_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_attribute_group_description`
--

CREATE TABLE `ks_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_attribute_group_description`
--

INSERT INTO `ks_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor'),
(7, 2, 'Bicycle technical'),
(8, 2, 'Machine Tech'),
(9, 2, 'Health machine'),
(3, 3, 'Memory'),
(4, 3, 'Technical'),
(5, 3, 'Motherboard'),
(6, 3, 'Processor'),
(7, 3, 'Bicycle technical'),
(8, 3, 'Machine Tech'),
(9, 3, 'Health machine');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_banner`
--

CREATE TABLE `ks_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_banner`
--

INSERT INTO `ks_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_banner_image`
--

CREATE TABLE `ks_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_banner_image`
--

INSERT INTO `ks_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(97, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(100, 6, 2, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(101, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(102, 8, 2, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(103, 8, 2, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(104, 8, 2, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(105, 8, 2, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(106, 8, 2, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(107, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(108, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(109, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(111, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(112, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(129, 7, 2, 'youtube', 'https://www.youtube.com/embed/8oiLRkgfsOU', 'catalog/demo/banners/MacBookAir.jpg', 0),
(114, 6, 3, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(115, 8, 3, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(116, 8, 3, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(117, 8, 3, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(118, 8, 3, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(119, 8, 3, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(120, 8, 3, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(121, 8, 3, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(122, 8, 3, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(123, 8, 3, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(130, 7, 2, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/discount-images-1.png', 0),
(125, 8, 3, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(126, 8, 3, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_block`
--

CREATE TABLE `ks_block` (
  `block_id` int(11) UNSIGNED NOT NULL,
  `bottom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_block`
--

INSERT INTO `ks_block` (`block_id`, `bottom`, `status`, `sort_order`, `date_added`, `date_modified`) VALUES
(3, 0, 1, 0, NULL, NULL),
(4, 0, 1, 0, NULL, NULL),
(5, 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_block_description`
--

CREATE TABLE `ks_block_description` (
  `block_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `category_id` int(255) DEFAULT NULL,
  `banner_id` int(11) DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_block_description`
--

INSERT INTO `ks_block_description` (`block_id`, `language_id`, `title`, `category_id`, `banner_id`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 2, 'Xe đạp thể thao', 33, 7, 'Xe đạp thể thao', '', ''),
(4, 2, '  Ghế Massage', 33, 7, '  Ghế Massage', '', ''),
(5, 2, 'Máy chạy bộ', 33, 7, 'Máy chạy bộ', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_block_to_layout`
--

CREATE TABLE `ks_block_to_layout` (
  `block_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_block_to_layout`
--

INSERT INTO `ks_block_to_layout` (`block_id`, `store_id`, `layout_id`) VALUES
(3, 0, 0),
(4, 0, 0),
(5, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_block_to_store`
--

CREATE TABLE `ks_block_to_store` (
  `block_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_block_to_store`
--

INSERT INTO `ks_block_to_store` (`block_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog`
--

CREATE TABLE `ks_blog` (
  `blog_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `bottom` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_blog`
--

INSERT INTO `ks_blog` (`blog_id`, `category_id`, `bottom`, `image`, `status`, `sort_order`, `date_added`, `date_modified`) VALUES
(1, NULL, 0, NULL, 1, 0, '2019-06-20 21:51:46', NULL),
(2, NULL, 0, NULL, 1, 0, '2019-06-20 21:51:48', NULL),
(3, NULL, 0, NULL, 1, 0, '2019-06-20 21:51:50', NULL),
(4, 4, 0, 'catalog/360_crop_h1.png', 1, 1, '2019-06-20 21:51:51', NULL),
(5, 1, 0, NULL, 1, 0, '2019-06-10 21:51:55', NULL),
(6, 4, 0, 'catalog/360_crop_HDsaison.jpg', 1, 3, '2019-06-20 21:52:00', NULL),
(7, 4, 0, 'catalog/360_crop_banner_1.jpg', 1, 2, '2019-06-20 21:52:02', NULL),
(8, 4, 0, 'catalog/360_crop_48425327_1999995203450226_8898718826204495872_n.jpg', 1, 7, NULL, NULL),
(9, 5, 0, 'catalog/360_crop_2_2.jpg', 1, 0, NULL, NULL),
(10, 5, 0, 'catalog/360_crop_1_3.jpg', 1, 0, NULL, NULL),
(11, 5, 0, 'catalog/360_crop_3.png', 1, 0, NULL, NULL),
(12, 5, 0, 'catalog/360_crop_img20180621154811857.jpg', 1, 0, NULL, NULL),
(13, 9, 0, 'catalog/360_crop_1-6_1.png', 1, 0, NULL, NULL),
(14, 9, 0, 'catalog/360_crop_1-6_1.png', 1, 0, NULL, NULL),
(15, 9, 0, 'catalog/360_crop_GMS.jpg', 1, 0, NULL, NULL),
(16, 9, 0, '', 1, 0, NULL, NULL),
(17, 9, 0, 'catalog/360_crop_banner_2_3.jpg', 1, 0, NULL, NULL),
(18, 9, 0, 'catalog/360_crop_MCB.jpg', 1, 0, NULL, NULL),
(19, 6, 0, 'catalog/360_crop_mon-qua-to-tinh-bat-ngo-luong-the-thanh.jpg', 1, 0, NULL, NULL),
(20, 6, 0, 'catalog/360_crop_630x420_saoviet.jpg', 1, 0, NULL, NULL),
(21, 6, 0, '', 0, 0, NULL, NULL),
(22, 6, 0, 'catalog/360_crop_2.jpg', 1, 0, NULL, NULL),
(23, 6, 0, 'catalog/360_crop_thi-sinh-miss-world-viet-nam-2019-010_1_1.jpg', 1, 0, NULL, NULL),
(24, 7, 0, 'catalog/360_crop_photo1514508438740-1514508438740.jpg', 1, 0, NULL, NULL),
(25, 7, 0, 'catalog/360_crop_photo1514508438740-1514508438740.jpg', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_category`
--

CREATE TABLE `ks_blog_category` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `bottom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_home` int(11) DEFAULT 0,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_category`
--

INSERT INTO `ks_blog_category` (`category_id`, `bottom`, `status`, `is_home`, `sort_order`, `date_added`, `date_modified`) VALUES
(1, 0, 1, 1, 1, NULL, NULL),
(2, 0, 1, 1, 2, NULL, NULL),
(3, 0, 1, 0, 0, NULL, NULL),
(4, 0, 1, 1, 3, NULL, NULL),
(5, 0, 1, 1, 4, NULL, NULL),
(6, 0, 1, 1, 5, NULL, NULL),
(7, 0, 1, 1, 6, NULL, NULL),
(8, 0, 0, 0, 7, NULL, NULL),
(9, 0, 1, 1, 8, NULL, NULL),
(10, 0, 0, 0, 9, NULL, NULL),
(11, 0, 0, 0, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_category_description`
--

CREATE TABLE `ks_blog_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_category_description`
--

INSERT INTO `ks_blog_category_description` (`category_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 2, 'Thông tin Kingsport', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;THÔNG TIN KINGSPORT&lt;/h1&gt;', 'THÔNG TIN KINGSPORT', '', ''),
(2, 2, 'Khách hàng tin dùng', '&lt;p&gt;KHÁCH HÀNG TIN DÙNG&lt;/p&gt;', 'KHÁCH HÀNG TIN DÙNG', '', ''),
(4, 2, 'Hoạt động cộng đồng', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;HOẠT ĐỘNG CỘNG ĐỒNG&lt;/h1&gt;', 'HOẠT ĐỘNG CỘNG ĐỒNG', '', ''),
(5, 2, 'Hot Trend', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;HOT TREND&lt;/h1&gt;', 'HOT TREND', '', ''),
(6, 2, 'Sao Việt tin dùng', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;SAO VIỆT TIN DÙNG&lt;/h1&gt;', 'SAO VIỆT TIN DÙNG', '', ''),
(7, 2, 'Sống khỏe cùng King Sport', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;SỐNG KHỎE CÙNG KINGSPORT&lt;/h1&gt;', 'SỐNG KHỎE CÙNG KINGSPORT', '', ''),
(8, 2, 'TIN TỨC CÔNG NGHỆ', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;TIN TỨC CÔNG NGHỆ&lt;/h1&gt;', 'TIN TỨC CÔNG NGHỆ', '', ''),
(9, 2, 'Khuyến mãi', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;TIN KHUYẾN MÃI&lt;/h1&gt;', 'TIN KHUYẾN MÃI', '', ''),
(10, 2, 'TIN TUYỂN DỤNG', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;TIN TUYỂN DỤNG&lt;/h1&gt;', 'TIN TUYỂN DỤNG', '', ''),
(11, 2, 'SETUP PHÒNG GYM', '&lt;h1 style=&quot;font-family: Arial, Tahoma; line-height: 35px; color: rgb(51, 51, 51); margin-bottom: 0px; font-size: 25px; padding: 0px; text-transform: uppercase;&quot;&gt;SETUP PHÒNG GYM&lt;/h1&gt;', 'SETUP PHÒNG GYM', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_category_to_layout`
--

CREATE TABLE `ks_blog_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_category_to_layout`
--

INSERT INTO `ks_blog_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 11),
(2, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_category_to_store`
--

CREATE TABLE `ks_blog_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_category_to_store`
--

INSERT INTO `ks_blog_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_description`
--

CREATE TABLE `ks_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_description`
--

INSERT INTO `ks_blog_description` (`blog_id`, `language_id`, `title`, `intro`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, 'NGỠ NGÀNG VÌ HOA HẬU ĐỖ MỸ LINH TRỞ THÀNH ĐẠI SỨ THƯƠNG HIỆU', 'Đỗ Mỹ Linh - Đương kim hoa hậu năm 2016, tài giỏi, xinh đẹp và nhận được nhiều thiện cảm trong lòng người dân với những hoạt động cộng đồng và xã hội ý nghĩa, tích cực mà cô mang đến. ', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Đỗ Mỹ Linh - Đương kim hoa hậu năm 2016, tài giỏi, xinh đẹp và nhận được nhiều thiện cảm trong lòng người dân với những hoạt động cộng đồng và xã hội ý nghĩa, tích cực mà cô mang đến. Năm 2019, Đỗ Mỹ Linh tiếp tục sứ mệnh, trở thành đại sứ thương hiệu cho tập đoàn thể thao Kingsport khiến nhiều người ngỡ ngàng bởi đây là lĩnh vực thể thao hoàn toàn mới. Vậy lý do vì sao Đỗ Mỹ Linh lựa chọn Kingsport làm đại sứ thương hiệu?&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;h1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/h1.png&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Vì sao Hoa hậu Đỗ Mỹ Linh chọn Kingsport làm đại sứ thương hiệu?&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;a href=&quot;https://www.facebook.com/kingsportvietnam/?epa=SEARCH_BOX&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;Kingsport&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;– Tập đoàn thể thao uy tín hàng đầu Việt Nam, lấy con người làm giá trị cốt lõi, mang sức khỏe và cuộc sống viên mãn đến mọi người là sứ mệnh công ty. Tập đoàn và Hoa hậu Đỗ Mỹ Linh đều chung chí hướng lấy hoạt động vì lợi ích cộng đồng làm kim chỉ nam. Chính vì lẽ đó, tháng 5/2019 Đỗ Mỹ&amp;nbsp; Linh đã lựa chọn Tập đoàn thể thao Kingsport trở thành đại sứ thương hiệu, cùng nhau mang đến cho mọi người nguồn năng lượng sống tích cực, một sức khỏe vững bền và thịnh vượng.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;h2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/h2.png&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Cùng Hoa hậu Đỗ Mỹ Linh và Tập đoàn Kingsport chung sức góp xây cho sức khỏe mai sau (CEO Lê Mạnh Trường)&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Qua buổi trao đổi, Hoa hậu Đỗ Mỹ Linh chia sẻ:&amp;nbsp;&lt;em&gt;“Linh là người của công chúng, nên việc giữ gìn vóc dáng qua những dụng cụ thể thao là một việc hiển nhiên, tuy nhiên vì lịch làm việc quá kín, Linh không có nhiều thời gian đến phòng tập.&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Được sự giới thiệu của một người bạn về những sản phẩm của Kingsport như:Máy chạy bộ, giàn ta đa năng, xe đạp tại nhà hoặc những sản phẩm chăm sóc sức khỏe như&amp;nbsp;&lt;/em&gt;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;em&gt;ghế massage&lt;/em&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;&amp;nbsp;giúp Linh ngủ ngon hơn, giảm đau nhức và căng thẳng. Trước hiệu quả mang đến cho sức khỏe, khi Tập đoàn Kingsport ngỏ ý mời Linh là đại sứ thương hiệu, thì Linh đã vui vẻ chấp nhận ngay mà không suy&amp;nbsp; nghĩ nhiều”.&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;h3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/h3.png&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Thư giãn cùng Hoa hậu Đỗ Mỹ Linh trên ghế massage của Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chia sẻ chân thật của Đỗ Mỹ Linh vẫn còn khi nói về doanh nghiệp, không chỉ về giá trị và lợi ích sản phẩm của doanh nghiệp đã mang đến mà còn những dịch vụ chuyên nghiệp cũng như chính sách, chế độ hậu mãi, bảo trì đến trọn đời cho khách hàng.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;&lt;img alt=&quot;h4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/h4.png&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Vì sức khỏe cộng đồng, Kingsport luôn bên bạn&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;h5&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/h5.png&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Trải nghiệm dịch vụ chuyên nghiệp tại Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Qua những trải nghiệm thực tế của Hoa hậu Đỗ Mỹ Linh, chúng tôi tin rằng Tập đoàn thể thao Kingsport đã thực hiện rất tốt với sứ mệnh của công ty, đưa sức khỏe con người lên một tầm cao mới bằng những thiết bị thể thao Kingsport mang lại.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;h6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/h6.png&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Lựa chọn những sản phẩm của Kingsport là giải pháp cho sức khỏe tương lai&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Trước những sứ mệnh vì cộng đồng, Tập đoàn thể thao Kingsport hứa hẹn sẽ là một doanh nghiệp lớn mạnh và vươn cao vươn xa trong lĩnh vực chăm sóc sức khỏe và thiết bị thể thao phục vụ cho cả trong và ngoài nước.&lt;/span&gt;&lt;/p&gt;', 'NGỠ NGÀNG VÌ HOA HẬU ĐỖ MỸ LINH TRỞ THÀNH ĐẠI SỨ THƯƠNG HIỆU TẬP ĐOÀN KINGSPORT', '', ''),
(6, 2, 'TRẢ GÓP ĐƠN GIẢN – LÃI SUẤT THẤP BẤT NGỜ CÙNG HD SAISON', 'Hợp tác với HD SAISON thực hiện chương trình mua hàng trả góp, Kingsport mang đến cho bạn cơ hội rinh ngay những sản phẩm chăm sóc sức khỏe yêu thích vô cùng dễ dàng với thủ tục đơn giản...', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Sau Tết các mặt hàng thiết bị thể thao &amp;amp; chăm sóc sức khỏe như: Ghế massage, máy chạy bộ, xe đạp tập, máy rung, giàn tạ đa năng,... đã và đang được “săn đón” bởi nhiều cá nhân và gia đình.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Nắm bắt được tâm lý ấy, tập đoàn Kingsport đã hợp tác cùng HD SAISON để mang đến cho khách hàng chương trình mua hàng trả góp với lãi suất cực kỳ hấp dẫn!&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;HDsaison&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/03_2019/HDsaison.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 500px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Trải nghiệm các dòng sản phẩm Kingsport đạt chất lượng chuẩn Hoa Kỳ từng là ước mơ với bạn? Nhưng bạn lại không có đủ tiền mặt, không thể mua sản phẩm mong muốn. Hoặc bạn muốn có nhiều tiền hơn để muốn mua sản phẩm tốt hơn?&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Đừng lo lắng! Hợp tác cùng ngân hàng &amp;nbsp;HD SAISON nhằm thực hiện&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/h-tro-mua-hang-tra-gop-tren-toan-he-thong-kingsport.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;chương trình mua hàng trả góp&lt;/a&gt;&amp;nbsp;hằng tháng, Kingsport mang đến cho bạn cơ hội rinh ngay sản phẩm chăm sóc sức khỏe yêu thích vô cùng dễ dàng với thủ tục đơn giản, lãi suất cạnh tranh, thời gian chi trả linh động.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;THỦ TỤC MUA TRẢ GÓP ĐƠN GIẢN VỚI HD SAISON&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;Không cần thẻ tín dụng&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;Thủ tục hồ sơ đơn giản và nhanh chóng với các khoản vay linh hoạt&lt;/li&gt;&lt;/ul&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;CMND + Hộ Khẩu/Bằng lái cho khoản vay ≤ 13 triệu&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;CMND + Hộ Khẩu/BL + POA(*) cho khoản vay &amp;gt; 13 triệu&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;CMND + Hộ Khẩu + POA + POI(**) cho khoản vay ≥ 30 triệu&lt;/li&gt;&lt;/ul&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;Trả trước chỉ từ 10%&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;Lãi suất cạnh tranh&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Áp dụng tại hầu hết các hệ thống cửa hàng Kingsport trên toàn quốc (trừ các chi nhánh mới, Big C &amp;amp; Vincom). Để có thông tin chi tiết hoặc tìm điểm mua gần nhất khách hàng vui lòng liên hệ:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Tổng đài miễn cước:&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;TP HCM: 1800 6862 - 1800 6852&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none; text-align: justify;&quot;&gt;HÀ NỘI: 1800 6824&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Hoặc Hotline : 0918648419 – 0936211210&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;(*) POA: Hóa đơn điện, nước, cáp&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;(**) POI: Xác nhận bảng lương có mộc công ty + sao kê tài khoản ngân hàng (áp dụng cho khoản vay lớn tiền)&lt;/p&gt;', 'TRẢ GÓP ĐƠN GIẢN – LÃI SUẤT THẤP BẤT NGỜ CÙNG HD SAISON', '', ''),
(7, 2, 'CÙNG ĐẠI SỨ HOA HẬU ĐỖ MỸ LINH ĐEM SỨC KHỎE ĐẾN MỌI NHÀ', 'Tháng 5/2019 , Hoa hậu Việt Nam Đỗ Mỹ Linh hay còn được cả cộng đồng Việt gọi với cái tên “Hoa hậu nhân ái” chính thức trở thành đại sứ thương hiệu của Tập đoàn thể thao Kingsport.', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Tháng 5/2019 , Hoa hậu Việt Nam Đỗ Mỹ Linh hay còn được cả cộng đồng Việt gọi với cái tên “Hoa hậu nhân ái” chính thức trở thành đại sứ thương hiệu của Tập đoàn thể thao Kingsport.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đỗ Mỹ Linh - Đại sứ thương hiệu&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.facebook.com/kingsportvietnam/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;Kingsport&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;đã mở đầu sứ mệnh bằng chương trình tri ân với những giải thưởng may mắn giá trị lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;100 triệu đồng&lt;/span&gt;&amp;nbsp;dành cho khách hàng nhân dịp mùa đại lễ của đất nước Việt Nam.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;banner_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_2.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Cùng Hoa hậu Đỗ Mỹ Linh mang sức khỏe đến mọi nhà&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đỗ Mỹ Linh đồng hành cùng Kingsport gửi trao một sứ mệnh cộng đồng, mong muốn mang đến lợi ích sức khỏe dài lâu cho mọi người, mọi nhà.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Tập đòan Kingsport đã đi một bước khởi nguồn đầu tiên, nhận thấy những điều cần thiết cho cuộc sống của chúng ta. Chúng ta muốn sống trẻ, đẹp, vui tươi, năng động hơn, năng lượng dồi dào và căng tràn sức sống hơn là bạn phải duy trì thói quen luyện tập thể thao. Trong đó, sử dụng các thiết bị chăm sóc sức khỏe, thể chất tại nhà đang là xu thế thịnh hành&amp;nbsp; ngày nay.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;banner_2_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_2_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Lựa chọn Kingsport – lựa chọn hoàn mỹ cho sức khỏe bạn&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Trải nghiệm những sản phẩm uy tín, chất lượng với công nghệ chuẩn Hoa Kỳ, đi cùng đó là dây chuyền &amp;nbsp;phục vụ chuyên nghiệp từ khâu tư vấn cho đến chế độ hậu mãi, cam kết bảo trì sản phẩm đến trọn đời khi khách hàng đã tin dung và sử dụng sản phẩm của Kingsport – nhãn hàng số uy tín hàng đầu tại Việt Nam.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;banner_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_3.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Nhãn hàng tin dùng số 1 Việt Nam&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đến với Kingsport, là bạn đang mang về sức khỏe tích cực, thể lực tràn đầy năng lượng cho dù bạn là một người bận rộn nhất giữa cuộc sống công nghệ số, chỉ duy nhất 15-30 phút mỗi ngày sử dụng sản phẩm, Kingsport tin chắc rằng bạn sẽ nhìn thấy sự khác biệt.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;banner_4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_4.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Lựa chọn Kingsport, là bạn đang nhận về hạnh phúc và sự thịnh vượng. Bởi giờ&amp;nbsp; đây, sản phẩm của Kingsport như:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage-pho-thong-h-series.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;Ghế massage&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;, máy chạy bộ, xe đạp tại nhà, máy rung, giàn tạ…còn có thể là món quà sức khỏe dành tặng cho những người thân yêu của chúng ta.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;banner_5&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_5.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Cho yêu thương bằng món quà sức khỏe, nhận hạnh phúc đong đầy cho sức trẻ an khang. Cùng Kingsport gửi trao sức khỏe đến mọi nhà bạn nhé!&lt;/span&gt;&lt;/p&gt;', 'CÙNG ĐẠI SỨ HOA HẬU ĐỖ MỸ LINH ĐEM SỨC KHỎE ĐẾN MỌI NHÀ', '', ''),
(8, 2, 'LỄ TRAO GIẢI XE VESPA TỪ CHƯƠNG TRÌNH BLACK FRIDAY', 'Sáng ngày 19/12 Kingsport đã tổ chức buổi lễ trao giải Xe Vespa cho khách hàng may mắn khi tham gia chương trình “Black Friday Giảm Ngất Ngây Say Ngay Quà Khủng”. Sau 1 tháng diễn ra chương trình Kingsport đã tìm ra...', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; line-height: 22px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Sáng ngày 19/12 Kingsport đã tổ chức buổi lễ trao giải Xe Vespa cho khách hàng may mắn khi tham gia chương trình&amp;nbsp;&lt;em&gt;“&lt;/em&gt;&lt;em&gt;Bl&lt;/em&gt;&lt;em&gt;a&lt;/em&gt;&lt;em&gt;ck&lt;/em&gt;&lt;em&gt;Friday&lt;/em&gt;&amp;nbsp;&lt;em&gt;Giảm&lt;/em&gt;&amp;nbsp;&lt;em&gt;Ngất&lt;/em&gt;&amp;nbsp;&lt;em&gt;Ngây&lt;/em&gt;&amp;nbsp;&lt;em&gt;Say&lt;/em&gt;&amp;nbsp;&lt;em&gt;Ngay&lt;/em&gt;&amp;nbsp;&lt;em&gt;Quà&lt;/em&gt;&amp;nbsp;&lt;em&gt;Khủng”&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; font-weight: 400; text-align: center;&quot;&gt;&lt;img alt=&quot;48425327_1999995203450226_8898718826204495872_n&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/12_2018/48425327_1999995203450226_8898718826204495872_n.jpg&quot; style=&quot;max-width: 100%; width: 960px; height: 720px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; font-weight: 400; text-align: start;&quot;&gt;Sau 1 tháng diễn ra chương trình Kingsport đã tìm ra khách hàng may mắn trúng xe tay ga Vespa từ chương trình “&lt;span style=&quot;font-weight: 700;&quot;&gt;T&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Ặ&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;NG XE VESPA – NH&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Ậ&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;N QUÀ TH&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Ả&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;GA&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; font-weight: 400; text-align: start;&quot;&gt;Chương trình áp dụng cho tất cả khách hàng mua bất kỳ sản phẩm nào tại Kingsport trong thời gian từ 5/11/2018 đến hết 5/12/2018 . Kết thúc chương trình, khách hàng trúng giải là người có 4 số cuối CMND trùng hoặc LỚN HƠN gần nhất với 4 số cuối giải đặc biệt KQXS Miền Bắc ngày 07/12/2018. Danh sách các khách hàng may mắn sẽ được đếm từ đầu danh sách xuống.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; font-weight: 400; text-align: start;&quot;&gt;Với kết quả sổ đặc biệt Miền Bắc ngày 07/12/2018 là 25367 &amp;nbsp;xin chúc &amp;nbsp;mừng anh Phạm Minh Tuấn đến từ Hải Phòng với số cmnd xxxxxxxx5368 đã là chủ nhân của xe Vespa thời trang khi mua máy chạy bộ Kungfu Đơn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; font-weight: 400; text-align: start;&quot;&gt;Một lần nữa xin chúc mừng anh, cảm ơn anh đã tin dùng sản phẩm Kingsport, chúc anh và gia đình thật nhiều sức khỏe cùng nhau chuẩn bị đón tết an lành và hạnh phúc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; font-weight: 400; text-align: start;&quot;&gt;Ngoài ra, Kingsport đang triển khai chương trình ưu đãi “Đại tiệc cuối năm – rinh ngàn deal khủng” cùng cơ hội nhận sổ tiết kiệm 100 Triệu đồng đừng bỏ qua cơ hội mua hàng với giá tốt nhất cùng cơ hội nhận quà lộc phúc từ Kingsport nhé!&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;', 'LỄ TRAO GIẢI XE VESPA TỪ CHƯƠNG TRÌNH BLACK FRIDAY', '', ''),
(9, 2, 'THÂN HÌNH THÊU ĐỐT MỌI ÁNH NHÌN CỦA BÀ XÃ ƯNG HOÀNG PHÚC', 'Ưng Hoàng Phúc và siêu mẫu Kim Cương đang có một gia đình hạnh phúc với 2 bé trai, dù đã là mẹ của hai bé nhưng bà xã của Ưng Hoàng Phúc vẫn sở hữu một thân hình khiến bất kì chàng trai nào cũng phải ngước nhìn.', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ưng Hoàng Phúc và siêu mẫu Kim Cương đang có một gia đình hạnh phúc với 2 bé trai, dù đã là mẹ của hai bé nhưng bà xã của Ưng Hoàng Phúc vẫn sở hữu một thân hình khiến bất kì chàng trai nào cũng phải ngước nhìn.&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/08_2018/1.jpg&quot; style=&quot;max-width: 100%; width: 650px; height: 943px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Kim Cương sở hữu thân hình cực kì nóng bỏng&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Trước khi được biết đến với mối quan hệ tình cảm với ca sĩ Ưng Hoàng Phúc, Kim Cương từng là một trong những siêu mẫu nổi tiếng trong những năm 2008 – 2009, cũng trong thời gian này cô đã đoạt giải siêu mẫu 2008.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Hiện nay, dù đã không còn theo đuổi sự nghiệp catwalk thế nhưng Kim Cương vẫn khiến nhiều người hâm mộ phải mê mệt vì body cực kỳ săn chắc, nóng bỏng như những cô gái đôi mươi.&amp;nbsp; Cô chia sẻ, để giữ được body như hiện giờ, cô rất chăm chỉ tập thể dục, đặc biệt là nhờ có ông xã Ưng Hoàng Phúc đã trang bị hẳn một&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/combo-phong-gym-gia-dinh.html#utm_source=eva&amp;amp;utm_medium=cpc&amp;amp;utm_campaign=pr&amp;amp;utm_term=sinhnhat&amp;amp;utm_content=bodykimcuong&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;phòng gym tại nhà&lt;/a&gt;&amp;nbsp;&lt;/span&gt;nên cô luôn có thể tập luyện đều đặn mỗi ngày.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;2_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/08_2018/2_2.jpg&quot; style=&quot;max-width: 100%; width: 650px; height: 975px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;em&gt;Bí quyết của cô là chăm chỉ tập luyện mỗi ngày…&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;em&gt;&lt;img alt=&quot;4_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/08_2018/4_1.jpg&quot; style=&quot;max-width: 100%; width: 650px; height: 433px;&quot;&gt;&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;em&gt;… Cùng với ông xã Ưng Hoàng Phúc&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;em&gt;&lt;img alt=&quot;3_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/08_2018/3_2.jpg&quot; style=&quot;max-width: 100%; width: 650px; height: 975px;&quot;&gt;&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Kim Cương cho biết cô đặc biệt yêu thích máy rung toàn thân, đây là thiết bị giúp cô giữ được vòng eo thon gọn dù mà không phải kiêng cữ bất cứ thứ gì trong chế độ ăn hằng ngày.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Ngoài ra, cô cũng rất chăm chỉ tập các bài tập giúp săn chắc đùi, mông với xe đạp tập tại chỗ, để nâng cao sức bền, siêu mẫu lựa chọn các bài tập cùng với&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html#utm_source=eva&amp;amp;utm_medium=cpc&amp;amp;utm_campaign=pr&amp;amp;utm_term=sinhnhat&amp;amp;utm_content=bodykimcuong&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;máy chạy bộ Kingsport&lt;/span&gt;&lt;/a&gt;&amp;nbsp;cô cho biết rất thích chế độ chạy nâng dốc, vì nó để giúp tiêu hao calo nhiều hơn cũng như xây dựng được thể lực tốt hơn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Ngoài những bài tập trên, Kim Cương cho biết bản thân chỉ cố gắng ăn uống thật đúng giờ, đầy đủ chất dinh dưỡng và giữ tâm trạng vui tươi, thoải mái để có được thân hình chuẩn như hiện nay.&lt;/p&gt;', 'THÂN HÌNH THÊU ĐỐT MỌI ÁNH NHÌN CỦA BÀ XÃ ƯNG HOÀNG PHÚC', '', ''),
(10, 2, 'CUỘC SỐNG VIÊN MÃN VỚI VỢ HOT GIRL, CON NGOAN CỦA CA SĨ LÝ HẢI', 'Lý Hải chia sẻ: “Hạnh phúc viên mãn chính là khi sức khỏe, tinh thần, tình yêu, tiền bạc được cân bằng, dung hòa một cách ổn định với nhau, vòng quay cuộc đời sẽ mang những thứ đến với bạn, miễn là bạn phải nỗ lực hết mình.”', '&lt;div class=&quot;the-content desc&quot; style=&quot;margin: 0px 0px 20px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; line-height: 22px; font-family: Arial, Tahoma;&quot;&gt;&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lý Hải chia sẻ: “Hạnh phúc viên mãn chính là khi sức khỏe, tinh thần, tình yêu, tiền bạc được cân bằng, dung hòa một cách ổn định với nhau, vòng quay cuộc đời sẽ mang những thứ đến với bạn, miễn là bạn phải nỗ lực hết mình.”&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;Giọng ca “Trọn đời bên em” giờ đã có một cuộc sống viên mãn, hạnh phúc mới vợ đẹp con ngoan nhưng anh vẫn không khỏi xúc động khi nhớ lại những kỉ niệm mặn đắng lúc mới bước vào nghề. Để có được thành công hiện tại, nam ca sĩ, đạo diễn Lý Hải đã trải qua nhiều thăng trầm mà không nhiều người có thể đương đầu được.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;1_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/1_3.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 660px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Lý Hải – tên thật là Nguyễn Văn Hải, sinh ra tại Tiền Giang, sau khi học hết phổ thông, Lý Hải đã rời xa miền Tây sông nước để bước chân lên Sài Gòn bắt đầu giấc mơ nghệ thuật tại trường Nghệ Thuật – Sân Khấu 2. Tuy nhiên, ngay từ lúc bắt đầu dường như sự nghiệp của anh đã không được suôn sẻ, khi mà sân khấu kịch lúc này đang tuột dốc không phanh.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Đến những năm 1997 – 1998, Lý Hải khi bị lấn áp bởi Làn Sóng Xanh, khán giả ghẻ lạnh, bầu show từ chối, anh quyết định đánh cuộc với một canh bạc thật sự khi cầm cố tất cả nhà cửa, tài sản để thực hiện video ca nhạc hài Trọn đời bên em, chính cú chơi liều này đã mang đến cho anh thành công ngoài mong đợi, tạo bàn đạp giúp Lý Hải quay trở lại với ánh hào quang, tiếp đà phát triển anh cho ra đời thêm những album trọn đời bên em kế tiếp và đều ít nhiều mang đến tiếng vang nhất định.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;2_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/2_3.jpg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Chính series video ca nhạc hài này cùng với sự động viên của bã xã Minh Hà đã là động lực mạnh mẽ, vững chắc giúp Lý Hải quyết tâm để trở đạo diễn, anh không ngừng tự thu thập kiến thức, tài liệu tự học hỏi và thành quả cuối cùng đã được đến đáp vào năm 2015, khi bộ phim Lật Mặt 1 chính thức được công chiếu rộng rãi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Tiếp đà thăng tiến, Lý Hải đã cho ra mắt thêm 2 phần tiếp theo của bộ phim hành động Lật Mặt, tất cả đều nhận được nhiều đánh giá tích cực, gây ấn tượng tốt đến khán giả trong nước và rất thành công về mặt doanh thu. Hiện nay, Lý Hải cũng đã có có kế hoạch sản xuất tiếp Lật Mặt 4, rất có thể phim sẽ ra mắt vào năm sau.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;3_4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/3_4.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 440px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;em&gt;Lý Hải trên phim trường&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Sau những thành công trên con đường nghệ thuật, giọng ca “trọn đời bên em” đã dành nhiều thời gian hơn cho gia đình, bản thân để tận hưởng cuộc sống một cách trọn vẹn nhất. Lý Hải lúc nào cũng hết mực lo lắng cho gia đình nhỏ của mình. Anh cho biết, mình rất quan tâm đến sức khỏe của cả gia đình, vì thế anh đã đầu tư các thiết bị tập luyện và thư giãn tại nhà để gia đình có thể tập luyện những lúc rảnh rỗi cũng như tăng cường sức khỏe.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;4_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/4_2.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 440px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;em&gt;Mặc dù Lý Hải đã bước qua tuổi 40 nhưng anh vẫn rất mạnh khỏe và trẻ trung.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Nam ca sĩ cũng không rượu bia, thuốc lá nhiều, sinh hoạt điều độ nên lúc nào cũng giữ được vóc dáng cân đối, khỏe mạnh. Anh và vợ thường tập thể dục ít nhất 2 ngày/ tuần để luôn có một cơ thể cường tráng và sức đề kháng tốt, có lẽ đây chính là bí quyết giúp gia đình Lý Hải luôn hạnh phúc và hòa thuận.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;5&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/5.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 661px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;i&gt;Gia đình hạnh phúc của Lý Hải&lt;/i&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Bây giờ, khi cuộc sống đã viên mãn, Lý Hải cho biết sẽ không bao giờ quên đi giai đoạn ấy và lấy nó làm bài học để dạy các con vươn lên.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;', 'CUỘC SỐNG VIÊN MÃN VỚI VỢ HOT GIRL, CON NGOAN CỦA CA SĨ LÝ HẢI', '', '');
INSERT INTO `ks_blog_description` (`blog_id`, `language_id`, `title`, `intro`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(11, 2, 'TẠI SAO MÁY CHẠY BỘ LẠI ĐƯỢC NHIỀU NGƯỜI QUAN TÂM', 'Máy chạy bộ không còn là thiết bị quá xa lạ với mọi người trong việc tập luyện thể dục hằng ngày.  Vậy lý do gì đặc biệt khiến nó được ưa chuộng trong thời gian gần đây? Theo quan sát thị trường, dễ dàng nhận thấy nhu cầu tìm mua máy chạy bộ của người dân...', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ không còn là thiết bị quá xa lạ với mọi người trong việc tập luyện thể dục hằng ngày. &amp;nbsp;Vậy lý do gì đặc biệt khiến nó được ưa chuộng trong thời gian gần đây?&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Theo quan sát thị trường, dễ dàng nhận thấy nhu cầu tìm mua máy chạy bộ của người dân tăng lên khá cao, tại các cửa hàng thể thao ở những thành phố lỡn, có thể nhanh chóng tìm thấy sản phẩm này với nhiều mẫu mã và mức giá khác nhau.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Sở dĩ có điều này là do nhu cầu tập luyện thể thao, duy trì sức khỏe của người dân đang tăng lên, nếu như khoảng 2,3 năm trước, làn sóng rèn luyện thể chất với hệ thống phòng tập thể hình, phòng gym chuyên nghiệp mọc lên như nấm sau mưa thì hiện nay, đã có sự thay đổi khá nhiều trong thói quen, sở thích luyện tập của mọi người. Đây được xem là sự thay đổi tất yếu khi kinh tế, xã hội phát triển, chất lượng sống&amp;nbsp; nâng cao hơn thì sự cá nhân hóa trong việc tập luyện được chú trọng hơn. Vì thế, thay vì đến phòng tập, mọi người muốn lựa chọn cho mình sư riêng tư, tự chủ về thời gian với một chiếc máy chạy bộ gia đình.&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;1_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/1_1.jpg&quot; style=&quot;max-width: 100%; width: 600px; height: 371px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Điều này được chứng minh rõ nhất qua sức tiêu thụ mạnh ở các dòng máy chạy bộ gia đình, có đến hơn 80% khách hàng đều chọn dòng máy gia đình. Lý giải cho vấn đề trên, anh Trung – Thủ Đức, TP.HCM, một khách hàng vừa mua máy chạy bộ cá nhân cho biết: “ Vì nó tiện dụng và đa năng hơn so với máy phòng gym, gia đình mình ai cũng tập được. Hơn nữa, công việc khá nhiều nên hai vợ chồng không có nhiều thời gian đến phòng tập, tập trên máy sẽ nhanh hơn, dễ dàng hơn, &amp;nbsp;máy lại có thể xếp gọn nếu không dùng nên không sợ chật chội nhà cửa”. Tuy nhiên, đây không phải là lý do duy nhất khiến người dùng yêu thích sản phẩm này.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Ngoài sự tiện dụng, còn phải kế đến thiết kế hiện đại, chắc chắn của máy chạy bộ, kết hợp cùng với diện tích thảm chạy lớn, mang đến sự thoải mái tối đa cho người chạy, không hề gò bó, tù túng như suy nghĩ của nhiều người khi tập trên máy, khung sườn làm bằng thép kích thước lớn, đầm chắc, giúp máy không bị rung lắc khi chạy.&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/3.jpg&quot; style=&quot;max-width: 100%; width: 600px; height: 320px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Đặc biệt, máy cũng hỗ trợ đầy đủ các chức năng cho những ai muốn tập luyện chuyện nghiệp, các thông số như: quảng đường, vận tốc, thời gian, calories tiêu thụ, nhịp tim đều được theo dõi chính xác nếu bạn tập trên máy chạy bộ, các bài tập nâng cao như vượt dốc, chạy nước rút cũng được hỗ trợ bởi chức năng tăng độ dốc và khả năng tùy biến tốc độ dễ dàng. Ở phương diện giải trí, các dòng máy chạy cao cấp được tích hợp hệ thống loa Hi-fi cùng cổng kết nối MP3 để người tập vừa chạy, vừa nghe nhạc thư giãn cùng những bài hát yêu thích.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Ông Hà Thế Nhân – giám đốc bán hàng khu vực miền Nam của tập đoàn thể thao Kingsport, một đơn vị khá uy tín trong lĩnh vực sản xuất và phân phối thiết bị này cho biết: “Hiểu được tâm lý của khách hàng, đặc biệt là những ai nhu cầu tìm mua thiết bị tập luyện thể thao, nên chúng tôi luôn cố gắng tạo ra những mẫu máy chạy bộ phù hợp với nhu cầu của người dùng với giá cả cạnh tranh nhất, ngoài những mẫu cao cấp, hiện nay Kingsport cũng đang cố gắng mở rộng thị trường đến phân khúc bình dân nhằm mang đến nhiều sự lựa chọn hơn cho khách hàng.”&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/07_2018/3.png&quot; style=&quot;max-width: 100%; width: 600px; height: 400px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Nếu bạn đang tìm mua máy chạy bộ cho gia đình, hãy đến với cửa hàng của Kingsport để trải nghiệm miễn phí, trước khi mua máy. Kingsport cũng luôn sẵn sàng giải đáp những thắc mắc từ khách hàng trong quá trình mua hàng,&amp;nbsp; sử dụng , bảo hành sản phẩm với hệ thống tổng đài miễn cước:&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;1800 6862 – 1800 6852&lt;/span&gt;.&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Xem thông tin chi tiết tại đây:&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html?utm_source=baozing&amp;amp;utm_medium=cpc&amp;amp;utm_campaign=pr&amp;amp;utm_term=mcb&amp;amp;utm_content=post&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;https://goo.gl/ug2SHB&lt;/a&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Hệ thống chi nhánh trên toàn quốc:&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html?utm_source=baozing&amp;amp;utm_medium=cpc&amp;amp;utm_campaign=pr&amp;amp;utm_term=mcb&amp;amp;utm_content=post&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;https://goo.gl/AFVb9n&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;', 'TẠI SAO MÁY CHẠY BỘ LẠI ĐƯỢC NHIỀU NGƯỜI QUAN TÂM', '', ''),
(12, 2, 'CƠN SỐT GIÀY THỂ THAO TĂNG CHIỀU CAO MANG TÊN MAGIC', 'Hiện nay, những đôi giày tăng chiều ca o đều rất chú trọng đến yếu tố thời trang trong thiết kế, nhằm khẳng định được cá tính của người mang chứ không thô kệch như những mẫu giày trước đây...', '&lt;div class=&quot;imgDetail_left&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify; width: 460px;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/vnt_upload/news/06_2018/img20180621154811857.jpg&quot; title=&quot;Zoom&quot; class=&quot;thickbox&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2018/img20180621154811857.jpg&quot; width=&quot;460&quot; alt=&quot;Cơn sốt giày tăng chiều cao mang tên Magic&quot; title=&quot;Cơn sốt giày tăng chiều cao mang tên Magic&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;/a&gt;&lt;p class=&quot;fDespic&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Cơn sốt giày tăng chiều cao mang tên Magic&lt;/p&gt;&lt;/div&gt;&lt;h2 class=&quot;knc-sapo&quot; style=&quot;font-weight: bold; line-height: 40px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 30px; padding: 0px;&quot;&gt;&lt;span style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 18px;&quot;&gt;Xu hướng giày tăng chiều cao với thiết kế thời trang đã không còn là điều mới mẻ, tuy nhiên để chiếm được cảm tình của người dùng là điều không hề dễ dàng&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Hiện nay, những đôi giày tăng chiều ca o đều rất chú trọng đến yếu tố thời trang trong thiết kế, nhằm khẳng định được cá tính của người mang chứ không thô kệch như những mẫu giày trước đây. Chỉ cần có gu thẩm mỹ ổn một tí là bạn có thể tha hồ phối nó với những bộ cánh yêu thích để tự tin tung tăng dạo phố, cà phê cùng bạn bè.&lt;/p&gt;&lt;div type=&quot;Photo&quot; class=&quot;VCSortableInPreviewMode noCaption&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;a data-fancybox-group=&quot;img-lightbox&quot; href=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154810882.jpg&quot; target=&quot;_blank&quot; title=&quot;&quot; class=&quot;detail-img-lightbox&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 1.&quot; data-original=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154810882.jpg&quot; height=&quot;&quot; rel=&quot;lightbox&quot; src=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154810882.jpg&quot; title=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 1.&quot; width=&quot;&quot; class=&quot;lightbox-content&quot; style=&quot;max-width: 100%; width: 870px;&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Một trong số đó là giày tăng chiều cao Magic, ngoài công dụng tăng chiều cao từ 5 đến 7cm, vẻ ngoài thời trang sẽ giúp bạn luôn thu hút, hấp dẫn trong mắt người đối diện. Bạn sẽ không còn phải tự ti về chiều cao cũng như ngoại hình khi đi dạo phố, shopping hay tham gia các hoạt động giải trí..&lt;/p&gt;&lt;div type=&quot;Photo&quot; class=&quot;VCSortableInPreviewMode noCaption&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;a data-fancybox-group=&quot;img-lightbox&quot; href=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154811857.jpg&quot; target=&quot;_blank&quot; title=&quot;&quot; class=&quot;detail-img-lightbox&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 2.&quot; data-original=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154811857.jpg&quot; height=&quot;&quot; rel=&quot;lightbox&quot; src=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154811857.jpg&quot; title=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 2.&quot; width=&quot;&quot; class=&quot;lightbox-content&quot; style=&quot;max-width: 100%; width: 870px;&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Nếu như đế độn vẫn luôn là phần xấu xí nhất trên các đôi giày tăng chiều cao thì ở giày Magic, phần đế được thiết kế tinh tế, gần như “tàng hình” giúp tăng thêm tính thẩm mỹ khi mang. Đặc biệt, với thiên hướng unisex (free giới tính), dù là nam hay nữ bạn cũng có thể tin sải bước mà không phải lăn tăn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Sở hữu trọng lượng nhẹ, đế chống trơn trượt cùng công nghệ chế tạo đế giày mới nhất, giày Magic sẽ mang đến cho bạn những bước chân thật êm ái, an toàn và thoải mái trong mọi hoạt động hàng ngày.&lt;/p&gt;&lt;div type=&quot;Photo&quot; class=&quot;VCSortableInPreviewMode noCaption&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;a data-fancybox-group=&quot;img-lightbox&quot; href=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154812579.jpg&quot; target=&quot;_blank&quot; title=&quot;&quot; class=&quot;detail-img-lightbox&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 3.&quot; data-original=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154812579.jpg&quot; height=&quot;&quot; rel=&quot;lightbox&quot; src=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154812579.jpg&quot; title=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 3.&quot; width=&quot;&quot; class=&quot;lightbox-content&quot; style=&quot;max-width: 100%; width: 870px;&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Chất liệu để&amp;nbsp;gia công giày hoàn toàn được nhập khẩu, kiểu dáng thiết kế thời trang, cá tính, trẻ trung, năng động, phom giày thiết kế riêng phù hợp với kiểu bàn chân của người Việt Nam, vừa khít, không quá ôm chân, loại trừ tuyệt đối vấn đề bí hơi, mùi hôi chân do mang quá lâu.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Mẫu mã cũng là điểm mạnh của giày tăng chiều cao Magic, để đáp ứng nhu cầu sử dụng đa dạng của người dùng, Magic cung cấp hai nhánh sản phẩm chính gồm giày tây (giày da công sở) và giày thể thao, tất cả đều là những mẫu mới nhất với thiết kế thời thượng cá tính, phù hợp.&lt;/p&gt;&lt;div type=&quot;Photo&quot; class=&quot;VCSortableInPreviewMode noCaption&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;a data-fancybox-group=&quot;img-lightbox&quot; href=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154813709.jpg&quot; target=&quot;_blank&quot; title=&quot;&quot; class=&quot;detail-img-lightbox&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 4.&quot; data-original=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154813709.jpg&quot; height=&quot;&quot; rel=&quot;lightbox&quot; src=&quot;http://channel.mediacdn.vn/prupload/879/2018/06/img20180621154813709.jpg&quot; title=&quot;Cơn sốt giày thể thao tăng chiều cao mang tên Magic - Ảnh 4.&quot; width=&quot;&quot; class=&quot;lightbox-content&quot; style=&quot;max-width: 100%; width: 870px;&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id=&quot;admzone474524&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;div id=&quot;ads_zone474524&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div id=&quot;ads_zone474524_slot1&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div id=&quot;ads_zone474524_banner553389&quot; class=&quot;banner0&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div data-admssprqid=&quot;3a9c03a5-729f-47d9-83f7-7c75708a6f45&quot; data-height=&quot;360&quot; data-ssp=&quot;sspbid_3192&quot; data-width=&quot;640&quot; id=&quot;iplayzone_474461&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Với những cải tiến ưu việt trên, không hề ngạc hiên khi giày tăng chiều cao Magic đã trở thành món phụ kiện yêu thích của giới học sinh sinh viên, nhân viên văn phòng và giới trẻ đặc biệt là những bạn có chiều cao khiêm tốn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Magic là thương hiệu hàng đầu hiện nay với các dòng giày thể thao, giày tây tăng chiều cao, nếu bạn vẫn đang tự ti về chiều cao của mình thì nhanh nhanh tới ngay showroom giày Magic để “xách” ngay một đôi về để trải nghiệm đi nào!&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;• Địa chỉ mua hàng trên toàn quốc:&amp;nbsp;&lt;a href=&quot;https://goo.gl/BoEkkd&quot; rel=&quot;nofollow&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;https://goo.gl/BoEkkd&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;• Sản phẩm được phân phối độc quyền bởi Tập đoàn thể thao Kingsport, thông tin chi tiết về giày Magic, vui lòng truy cập tại&amp;nbsp;&lt;a href=&quot;https://goo.gl/JfqAcb&quot; rel=&quot;nofollow&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;ĐÂY&lt;/a&gt;.&lt;/p&gt;', 'CƠN SỐT GIÀY THỂ THAO TĂNG CHIỀU CAO MANG TÊN MAGIC', '', ''),
(13, 2, 'MỪNG QUỐC TẾ THIẾU NHI 1/6 MẸ ĐƯỢC KHỎE BÉ ĐƯỢC QUÀ', 'Hòa chung không khí háo hức cùng các em nhỏ nhân dịp tết thiếu nhi 1/6, tập đoàn thể thao Kingsport phát động chương trình khuyến mãi cực hấp dẫn giúp “mẹ được khỏe bé được quà”...', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hòa chung không khí háo hức cùng các em nhỏ nhân dịp tết thiếu nhi 1/6, tập đoàn thể thao Kingsport phát động chương trình khuyến mãi cực hấp dẫn giúp “mẹ được khỏe bé được quà”.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;1-6-trangchu&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/1-6-trangchu.jpg&quot; style=&quot;max-width: 100%; width: 630px; height: 420px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình bắt đầu từ ngày 01-03/06/2019 với mức ưu đãi cực lớn lên đến 50%++ khi mua sắm các thiết bị thể thao tại hệ thống các cửa hàng bán lẻ của&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;Kingsport&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;trên toàn quốc.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Nhằm đem lại niềm vui cho bé sức khỏe cho mẹ, nhân dịp quốc tế Thiếu nhi năm nay khi mua hàng tại chuỗi hệ thống 98 cửa hàng của Kingsport trên 63 tỉnh thành. Quý khách hàng sẽ được tặng xe đạp trẻ em, giúp bé rèn luyện sức khỏe và tự do khám phá thế giới xung quanh trong dịp nghỉ hè.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Bên cạnh đó, quý khách hàng tham dự CTKM &quot;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;MẸ ĐƯỢC KHỎE BÉ ĐƯỢC QUÀ&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&quot;&amp;nbsp;còn được hưởng ưu đãi với mức giảm giá lên đến 10% cho tất cả các mẫu xe đạp ngoài trời. Ngoài ra, khi đến với Kingsport quý khách còn được vi vu sắm quà với chính sách mua hàng trả góp 0% vô cùng hấp dẫn. Không cần phải ngần ngại hay chờ đợi lâu vì hồ sơ của bạn sẽ được xét duyệt rất nhanh chóng. Giờ đây quý khách hàng có thể sở hữu bất kỳ món đồ nào mà mình mong muốn để cải thiện vóc dáng và nâng cao sức khỏe tại Kingsport.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;600&quot; src=&quot;https://www.youtube.com/embed/-6ULsrA9n5E&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Là doanh nghiệp bán lẻ các thiết bị thể thao hàng đầu Việt Nam hiện nay, Kingsport tự hào là doanh nghiệp đi tiên phong đưa các sản phẩm thể thao có công nghệ đạt chuẩn Hoa Kỳ mà giá thành lại cạnh tranh, phù hợp với mọi đối tượng khách hàng Việt Nam. Cùng với tính năng vận hành đơn giản, dễ dàng sử dụng lại thân thiện với môi trường, những sản phẩm của Kingsport luôn khiến người tiêu dùng có cảm giác tiện lợi và thoải mái khi luyện tập tại nhà.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Có thể nói những sản phẩm chất lượng của Kingsport đã nhận được sự đón nhận của rất nhiều sao Việt hiện nay, trong đó phải kể đến Hoa hậu Việt Nam 2016 Đỗ Mỹ Linh. Với sự quan tâm đặc biệt của cô dành cho các thiết bị thể thao trong việc duy trì vóc dáng, hoa hậu Đỗ Mỹ Linh đã được lựa chọn làm Đại sứ thương hiệu của tập đoàn Kingsport. Hãy cùng hoa hậu Đỗ Mỹ Linh hưởng ứng chương trình ưu đãi cực khủng trong dịp tết thiếu nhi đặc biệt này.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình ưu đãi được áp dụng rộng rãi trên tất cả các mặt hàng như:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;ghế massage&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;toàn thân, máy massage chân,&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;máy chạy bộ&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;, giàn tạ đa năng, máy rung, xe đạp tại nhà và xe đạp ngoài trời. Đây thực sự là cơ hội để bạn rèn luyện sức khỏe, đồng thời góp phần vào việc bảo vệ môi trường vô cùng ý nghĩa.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Để biết thêm chi tiết về thông tin khuyến mãi, quý khách hàng có thể gọi ngay đến tổng đài 1800 6862 hoặc số&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;Hotline&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;0936 211 210 để được hỗ trợ và tư vấn trực tiếp về sản phẩm.&lt;/span&gt;&lt;/p&gt;', 'MỪNG QUỐC TẾ THIẾU NHI 1/6 MẸ ĐƯỢC KHỎE BÉ ĐƯỢC QUÀ', '', ''),
(14, 2, 'MỪNG QUỐC TẾ THIẾU NHI 1/6 MẸ ĐƯỢC KHỎE BÉ ĐƯỢC QUÀ', 'Hòa chung không khí háo hức cùng các em nhỏ nhân dịp tết thiếu nhi 1/6, tập đoàn thể thao Kingsport phát động chương trình khuyến mãi cực hấp dẫn giúp “mẹ được khỏe bé được quà”...', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hòa chung không khí háo hức cùng các em nhỏ nhân dịp tết thiếu nhi 1/6, tập đoàn thể thao Kingsport phát động chương trình khuyến mãi cực hấp dẫn giúp “mẹ được khỏe bé được quà”.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;1-6-trangchu&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/1-6-trangchu.jpg&quot; style=&quot;max-width: 100%; width: 630px; height: 420px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình bắt đầu từ ngày 01-03/06/2019 với mức ưu đãi cực lớn lên đến 50%++ khi mua sắm các thiết bị thể thao tại hệ thống các cửa hàng bán lẻ của&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;Kingsport&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;trên toàn quốc.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Nhằm đem lại niềm vui cho bé sức khỏe cho mẹ, nhân dịp quốc tế Thiếu nhi năm nay khi mua hàng tại chuỗi hệ thống 98 cửa hàng của Kingsport trên 63 tỉnh thành. Quý khách hàng sẽ được tặng xe đạp trẻ em, giúp bé rèn luyện sức khỏe và tự do khám phá thế giới xung quanh trong dịp nghỉ hè.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Bên cạnh đó, quý khách hàng tham dự CTKM &quot;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;MẸ ĐƯỢC KHỎE BÉ ĐƯỢC QUÀ&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&quot;&amp;nbsp;còn được hưởng ưu đãi với mức giảm giá lên đến 10% cho tất cả các mẫu xe đạp ngoài trời. Ngoài ra, khi đến với Kingsport quý khách còn được vi vu sắm quà với chính sách mua hàng trả góp 0% vô cùng hấp dẫn. Không cần phải ngần ngại hay chờ đợi lâu vì hồ sơ của bạn sẽ được xét duyệt rất nhanh chóng. Giờ đây quý khách hàng có thể sở hữu bất kỳ món đồ nào mà mình mong muốn để cải thiện vóc dáng và nâng cao sức khỏe tại Kingsport.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;600&quot; src=&quot;https://www.youtube.com/embed/-6ULsrA9n5E&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Là doanh nghiệp bán lẻ các thiết bị thể thao hàng đầu Việt Nam hiện nay, Kingsport tự hào là doanh nghiệp đi tiên phong đưa các sản phẩm thể thao có công nghệ đạt chuẩn Hoa Kỳ mà giá thành lại cạnh tranh, phù hợp với mọi đối tượng khách hàng Việt Nam. Cùng với tính năng vận hành đơn giản, dễ dàng sử dụng lại thân thiện với môi trường, những sản phẩm của Kingsport luôn khiến người tiêu dùng có cảm giác tiện lợi và thoải mái khi luyện tập tại nhà.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Có thể nói những sản phẩm chất lượng của Kingsport đã nhận được sự đón nhận của rất nhiều sao Việt hiện nay, trong đó phải kể đến Hoa hậu Việt Nam 2016 Đỗ Mỹ Linh. Với sự quan tâm đặc biệt của cô dành cho các thiết bị thể thao trong việc duy trì vóc dáng, hoa hậu Đỗ Mỹ Linh đã được lựa chọn làm Đại sứ thương hiệu của tập đoàn Kingsport. Hãy cùng hoa hậu Đỗ Mỹ Linh hưởng ứng chương trình ưu đãi cực khủng trong dịp tết thiếu nhi đặc biệt này.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình ưu đãi được áp dụng rộng rãi trên tất cả các mặt hàng như:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;ghế massage&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;toàn thân, máy massage chân,&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;máy chạy bộ&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;, giàn tạ đa năng, máy rung, xe đạp tại nhà và xe đạp ngoài trời. Đây thực sự là cơ hội để bạn rèn luyện sức khỏe, đồng thời góp phần vào việc bảo vệ môi trường vô cùng ý nghĩa.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Để biết thêm chi tiết về thông tin khuyến mãi, quý khách hàng có thể gọi ngay đến tổng đài 1800 6862 hoặc số&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;Hotline&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;0936 211 210 để được hỗ trợ và tư vấn trực tiếp về sản phẩm.&lt;/span&gt;&lt;/p&gt;', 'MỪNG QUỐC TẾ THIẾU NHI 1/6 MẸ ĐƯỢC KHỎE BÉ ĐƯỢC QUÀ', '', ''),
(15, 2, 'MUA GHẾ MASSAGE KINGSPORT NHẬN ƯU ĐÃI LÊN ĐẾN 50%', 'Gia đình, nơi cho ta niềm vui niềm hạnh phúc, nơi để yêu thương và được thương yêu.  Cùng ghế massage Kingsport trao yêu thương tặng sức khỏe cho ngày hội gia đình thêm ý nghĩa với ưu đãi lên đến 50%.', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Gia đình, nơi cho ta niềm vui niềm hạnh phúc, nơi để yêu thương và được thương yêu. &amp;nbsp;Cùng ghế massage Kingsport trao yêu thương tặng sức khỏe cho ngày hội gia đình thêm ý nghĩa với&amp;nbsp;&lt;em&gt;ưu đãi lên đến 50%.&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;GMS&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/GMS.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 603px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Ngày Hội Gia Đình - Nhân Đôi Khuyến Mãi Với Ưu Đãi Lên Đến 50%&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Gắn kết yêu thương cho gia đình hạnh phúc cùng ghế massage Kingsport chăm sóc sức khỏe cho cả gia đình. Bố Mẹ có một sức khỏe an nhàn, Vợ có một tinh thần an nhiên khỏe mạnh. Ngày hội gia đình càng thêm gắn kết khi mua ghế massage Kingsport giá giảm mạnh lên đến 50% cùng cơ hội hội nhận ngay một trong những món quà sức khỏe ý nghĩa từ Kingsport&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style: circle; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Giàn Tạ Đa Năng Kingsport BK-1998 NEW 2017 trị giá đến 8 triệu&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy Chạy Bộ Kingsport BK-2023 Đơn trị giá 7.5 triệu&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy Rung Giảm Cân Super Fit Massage trị giá 6.65 triệu&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy Xay Sinh Tố Kingblender CB7600-C3 trị giá đến 2.6 triệu&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Xe Đạp Tập Kingsport X-Bike trị giá đến 2.6 triệu&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy Massage chân Kingsport DF-834 trị giá 2.5 triệu&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Xe Đạp Ngoài Trời trị giá lên đến 2.5 triệu&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC BIỆT:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;ƯU ĐÃI NHÂN ĐÔI ƯU ĐÃI&lt;/em&gt;&lt;/span&gt;&amp;nbsp;với&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;GÓI COMBO&lt;/em&gt;&lt;/span&gt;&amp;nbsp;tiện ích khi bạn mua kèm thêm 2 sản phẩm bất kì (Máy chạy bộ, Giàn tạ, Xe đạp tập, Máy rung)&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;GIẢM LIỀN TAY 10%&lt;/em&gt;&lt;/span&gt;&amp;nbsp;trên tổng đơn hàng cùng nhiều quà tặng hấp dẫn.&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;900x630_WEB_CTKM_COMBO_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/900x630_web_ctkm_combo_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 630px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Giảm thêm 10% và quà tặng hấp dẫn khi mau COMBO 3 món từ Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Thời gian diễn ra chương trình&lt;/em&gt;&amp;nbsp;ưu đãi từ&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;01/06/2019&lt;/span&gt;&amp;nbsp;đến hết&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;31/07/2019&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;khuyen-mai-button&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/khuyen-mai-button_1.gif&quot; style=&quot;max-width: 100%; width: 235px; height: 59px;&quot;&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Ngày hội gia đình sẽ thật sự ý nghĩa hơn với món quà chăm sóc sức khỏe ghế massage Kingsport. Còn chần chờ gì mà không&amp;nbsp; nhanh tay gọi ngay đến&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tổng đài miễn cước 1800 6862&lt;/span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;hoặc&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Hotline 0936 211 210&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;để được tư vấn và đặt hàng nhanh nhất. Hoặc đến ngay hệ thống showroom trên toàn quốc&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;a href=&quot;https://bit.ly/2IBrsi7&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;https://bit.ly/2IBrsi7&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;để tham khảo và nhận quà nhé!&lt;/span&gt;&lt;/p&gt;', 'MUA GHẾ MASSAGE KINGSPORT NHẬN ƯU ĐÃI LÊN ĐẾN 50%', '', '');
INSERT INTO `ks_blog_description` (`blog_id`, `language_id`, `title`, `intro`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(16, 2, 'NGÀY GIA ĐÌNH VIỆT NAM, CÙNG KINGSPORT NHÂN ĐÔI KHUYẾN MÃI!', 'Gia đình - nơi cho ta sự yêu thương không bao giờ tắt, hãy thắp sáng tình yêu ấy cùng Kingsport với “Ngày hội gia đình - Nhân đôi khuyến mãi”. Tập đoàn thể thao Kingsport là doanh nghiệp bán lẻ thiết bị thể thao hàng đầu...', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;Gia đình - nơi cho ta sự yêu thương không bao giờ tắt, hãy thắp sáng tình yêu ấy cùng Kingsport với “Ngày hội gia đình - Nhân đôi khuyến mãi”.&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;banner_1_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_1_1.jpg&quot; style=&quot;max-width: 100%; font-size: 16px; text-align: center; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Mừng ngày hội gia đình Việt Nam, Tập đoàn thể thao Kingsport nhân đôi ưu đãi từ 1/6 đến 31/7/2019&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Tập đoàn thể thao Kingsport là doanh nghiệp bán lẻ thiết bị thể thao hàng đầu Việt Nam như:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Máy chạy bộ&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;, giàn tạ, máy rung, xe đạp tại nhà, xe đạp ngoài&amp;nbsp; trời, ngoài ra còn có máy massage chân,&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;ghế massage toàn thân&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;…Kingsport là doanh nghiệp tiên phong trong việc sản xuất với chất lượng sản phẩm có công nghệ đạt chuẩn Hoa Kỳ mà giá thành cạnh tranh, phù hợp mọi khách hàng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đến với Kingsport, quý khách hàng sẽ được trải nghiệm dịch vụ sử dụng sản phẩm hoàn toàn miễn phí. Chuỗi hệ thống lên đến 98 showroom trên toàn quốc, đáp ứng như cầu cũng như lộ trình phục vụ quý khách nhanh chóng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_5_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_5_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Tập đoàn bản lẻ uy tín tại Việt Nam&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Nhân dịp ngày hội gia đình Việt Nam cùng một mùa hè sôi động, Tập đoàn thể thao Kingsport mang đến cho quý khách hàng những ưu đãi cực khủng, giúp bạn thoải mái lựa chọn những món quà ý nghĩa dành tặng những người thân.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Từ 1/6 đến 31/7/2019&lt;/span&gt;, Kingsport&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;giảm giá lên đến&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;50%&lt;/span&gt;&amp;nbsp;khi khách hàng tham gia mua lẻ. Ngoài ra khi sử dụng gói combo từ 3 sản phẩm trở lên như: Ghế massage, máy chạy bô, máy rung, xe đạp, giàn tạ… Quý khách sẽ được&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;giảm thêm 10%&lt;/span&gt;trên giá trị đơn hàng đã được khuyến mãi.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_2_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_2_3.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Chương trình giảm giá đặc biệt lên đến 50% dành cho khách hàng trong mùa hè này.&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đặc biệt, sản phẩm&amp;nbsp;từ&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;10 triệu đến 20 triệu&lt;/span&gt;, quý khách nhận ngay quà tặng trị giá&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;450.000 VNĐ&lt;/span&gt;&amp;nbsp;như: Máy đo huyết áp G088 hoặc giày Magic.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Sản phẩm&amp;nbsp;trên&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;20 triệu đến 60 triệu&lt;/span&gt;, quý khách nhận ngay quà tặng bất kỳ trị giá&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;2.500.000 VNĐ&lt;/span&gt;&amp;nbsp;như: Máy massage chân DF-834, máy xay C3 hoặc xe đạp XBike tại nhà.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hấp dẫn hơn thế, sản phẩm&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;trên 60 triệu&lt;/span&gt;, quý khách nhận ngay quà tặng bất kỳ trị giá&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;7.350.000 VNĐ&lt;/span&gt;&amp;nbsp;như: Máy chạy bộ BK-2023 đơn, giàn tạ BK-1998 hoặc máy rung Super Fit.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_3_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_3_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Rinh quà thật to khi mua ngay combo khuyến mãi 3 sản phẩm trở lên chỉ có tại Kingsport.&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình khuyến mãi của Tập đoàn thể thao Kingsport không dừng lại ở đó. Từ ngày 1/6 đến 3/6/2019, chào mừng ngày Quốc tế thiếu nhi giảm thêm 10% cho&amp;nbsp; tất cả các sản phẩm xe&amp;nbsp; đạp ngoài trời. Hưởng ứng đồng khẩu hiệu : “Mẹ được khỏe bé được quà” áp dụng khi bạn mua bất kỳ sản phẩm của Kingsport có hóa đơn từ 20 triệu trở lên sẽ nhận ngay xe đạp cho bé trị giá 2.500.000 VNĐ.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_4_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_4_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Chào mừng ngày Quốc tế thiếu nhi giảm thêm 10% cho các sản phẩm xe đạp ngoài trời.&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Mùa hè này hứa hẹn là một mùa hè đầy bùng nổ với những chương trình liên hoàn mà tập đoàn Kingsport gửi tặng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;500&quot; src=&quot;https://www.youtube.com/embed/0s_yNPfTQz4&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;Nhanh tay truy cập vào website:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700; font-size: 16px;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;https://www.kingsport.vn/&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;hoặc&amp;nbsp; gọi ngay&amp;nbsp;tổng đài miễn cước:&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;Miền Bắc:&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;18006824&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;- Miền Nam:&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;18006862&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;để được biết thêm chi tiết và rinh ngay những&amp;nbsp; phần quà ý nghĩa về gia đình mình nhé!&lt;/span&gt;&lt;/p&gt;', 'NGÀY GIA ĐÌNH VIỆT NAM, CÙNG KINGSPORT NHÂN ĐÔI KHUYẾN MÃI!', '', ''),
(17, 2, 'NGÀY GIA ĐÌNH VIỆT NAM, CÙNG KINGSPORT NHÂN ĐÔI KHUYẾN MÃI!', 'Gia đình - nơi cho ta sự yêu thương không bao giờ tắt, hãy thắp sáng tình yêu ấy cùng Kingsport với “Ngày hội gia đình - Nhân đôi khuyến mãi”. Tập đoàn thể thao Kingsport là doanh nghiệp bán lẻ thiết bị thể thao hàng đầu...', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;Gia đình - nơi cho ta sự yêu thương không bao giờ tắt, hãy thắp sáng tình yêu ấy cùng Kingsport với “Ngày hội gia đình - Nhân đôi khuyến mãi”.&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;banner_1_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_1_1.jpg&quot; style=&quot;max-width: 100%; font-size: 16px; text-align: center; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Mừng ngày hội gia đình Việt Nam, Tập đoàn thể thao Kingsport nhân đôi ưu đãi từ 1/6 đến 31/7/2019&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Tập đoàn thể thao Kingsport là doanh nghiệp bán lẻ thiết bị thể thao hàng đầu Việt Nam như:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Máy chạy bộ&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;, giàn tạ, máy rung, xe đạp tại nhà, xe đạp ngoài&amp;nbsp; trời, ngoài ra còn có máy massage chân,&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;ghế massage toàn thân&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;…Kingsport là doanh nghiệp tiên phong trong việc sản xuất với chất lượng sản phẩm có công nghệ đạt chuẩn Hoa Kỳ mà giá thành cạnh tranh, phù hợp mọi khách hàng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đến với Kingsport, quý khách hàng sẽ được trải nghiệm dịch vụ sử dụng sản phẩm hoàn toàn miễn phí. Chuỗi hệ thống lên đến 98 showroom trên toàn quốc, đáp ứng như cầu cũng như lộ trình phục vụ quý khách nhanh chóng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_5_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_5_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Tập đoàn bản lẻ uy tín tại Việt Nam&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Nhân dịp ngày hội gia đình Việt Nam cùng một mùa hè sôi động, Tập đoàn thể thao Kingsport mang đến cho quý khách hàng những ưu đãi cực khủng, giúp bạn thoải mái lựa chọn những món quà ý nghĩa dành tặng những người thân.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Từ 1/6 đến 31/7/2019&lt;/span&gt;, Kingsport&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;giảm giá lên đến&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;50%&lt;/span&gt;&amp;nbsp;khi khách hàng tham gia mua lẻ. Ngoài ra khi sử dụng gói combo từ 3 sản phẩm trở lên như: Ghế massage, máy chạy bô, máy rung, xe đạp, giàn tạ… Quý khách sẽ được&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;giảm thêm 10%&lt;/span&gt;trên giá trị đơn hàng đã được khuyến mãi.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_2_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_2_3.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Chương trình giảm giá đặc biệt lên đến 50% dành cho khách hàng trong mùa hè này.&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đặc biệt, sản phẩm&amp;nbsp;từ&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;10 triệu đến 20 triệu&lt;/span&gt;, quý khách nhận ngay quà tặng trị giá&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;450.000 VNĐ&lt;/span&gt;&amp;nbsp;như: Máy đo huyết áp G088 hoặc giày Magic.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Sản phẩm&amp;nbsp;trên&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;20 triệu đến 60 triệu&lt;/span&gt;, quý khách nhận ngay quà tặng bất kỳ trị giá&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;2.500.000 VNĐ&lt;/span&gt;&amp;nbsp;như: Máy massage chân DF-834, máy xay C3 hoặc xe đạp XBike tại nhà.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hấp dẫn hơn thế, sản phẩm&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;trên 60 triệu&lt;/span&gt;, quý khách nhận ngay quà tặng bất kỳ trị giá&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;7.350.000 VNĐ&lt;/span&gt;&amp;nbsp;như: Máy chạy bộ BK-2023 đơn, giàn tạ BK-1998 hoặc máy rung Super Fit.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_3_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_3_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Rinh quà thật to khi mua ngay combo khuyến mãi 3 sản phẩm trở lên chỉ có tại Kingsport.&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình khuyến mãi của Tập đoàn thể thao Kingsport không dừng lại ở đó. Từ ngày 1/6 đến 3/6/2019, chào mừng ngày Quốc tế thiếu nhi giảm thêm 10% cho&amp;nbsp; tất cả các sản phẩm xe&amp;nbsp; đạp ngoài trời. Hưởng ứng đồng khẩu hiệu : “Mẹ được khỏe bé được quà” áp dụng khi bạn mua bất kỳ sản phẩm của Kingsport có hóa đơn từ 20 triệu trở lên sẽ nhận ngay xe đạp cho bé trị giá 2.500.000 VNĐ.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;banner_4_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/banner_4_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Chào mừng ngày Quốc tế thiếu nhi giảm thêm 10% cho các sản phẩm xe đạp ngoài trời.&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Mùa hè này hứa hẹn là một mùa hè đầy bùng nổ với những chương trình liên hoàn mà tập đoàn Kingsport gửi tặng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;500&quot; src=&quot;https://www.youtube.com/embed/0s_yNPfTQz4&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;Nhanh tay truy cập vào website:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700; font-size: 16px;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;https://www.kingsport.vn/&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;hoặc&amp;nbsp; gọi ngay&amp;nbsp;tổng đài miễn cước:&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;Miền Bắc:&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;18006824&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;- Miền Nam:&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;18006862&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size: 16px; color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;để được biết thêm chi tiết và rinh ngay những&amp;nbsp; phần quà ý nghĩa về gia đình mình nhé!&lt;/span&gt;&lt;/p&gt;', 'NGÀY GIA ĐÌNH VIỆT NAM, CÙNG KINGSPORT NHÂN ĐÔI KHUYẾN MÃI!', '', ''),
(18, 2, 'ĐÓN HÈ RỘN RÀNG CÙNG MÁY CHẠY BỘ KINGSPORT VỚI ƯU ĐÃI LÊN 21%', '', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Bắt đầu hè rực lửa cùng máy chạy bộ Kingsport ưu đãi lên đến 21% cùng nhiều quà tặng hấp dẫn, đón hè rộn ràng cùng sức khỏe tràn đầy bên gia đình.&lt;/span&gt;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;MCB&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/MCB.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 603px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Đón hè rộn ràng cùng máy chạy bộ Kingsport với ưu đãi lên 21%&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy chạy bộ Kingsport giúp cơ bắp săn chắc, cơ xương khỏe mạnh, sức khỏe dẻo dai, cả gia đình cùng luyện tập bên nhau mọi lúc mà không ngại nắng chẳng ngại mưa cho hạnh phúc gia đình trọn vẹn với món quà sức khỏe ý nghĩa&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hưởng ứng ngày hội gia đình Kingsport gửi đến khách hàng chương trình&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;em&gt;“Ngày Hội Gia Đình- Nhân Đôi Ưu Đãi”&lt;/em&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;mua máy chạy bộ Kingsport nhận ngay ưu đãi đến 21% và cơ hội rinh ngay một trong những phần quà hấp dẫn&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Bóng/thảm tập yoga&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy đo huyết áp G088 trị giá 490.000&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Giày thể thao Magic thời trang&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy Xay Sinh Tố Kingblender CB7600-C3 trị giá đến 2.6 triệu&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Xe Đạp Tập Kingsport X-Bike trị giá đến 2.6 triệu&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy Massage chân Kingsport DF-834 trị giá 2.5 triệu&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Xe Đạp Ngoài Trời trị giá lên đến 2.5 triệu&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 128);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC BIỆT:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;ƯU ĐÃI NHÂN ĐÔI ƯU ĐÃI&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;với&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;GÓI COMBO&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;tiện ích khi bạn mua kèm thêm 2 sản phẩm bất kì (Ghế Massage, Giàn tạ, Xe đạp tập, Máy rung)&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;GIẢM LIỀN TAY 10%&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;trên tổng đơn hàng cùng nhiều quà tặng hấp dẫn.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;900x630_web_ctkm_combo_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/900x630_web_ctkm_combo_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 630px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Giảm thêm 10% và quà tặng hấp dẫn khi mua&amp;nbsp;COMBO 3 món từ Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;XEM THÊM ƯU ĐÃI GIẢM ĐẾN 21% MÁY CHẠY BỘ TẠI ĐÂY!&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;may_chay_bo&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/may_chay_bo.gif&quot; style=&quot;max-width: 100%; width: 235px; height: 59px;&quot;&gt;&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Thời gian diễn ra chương trình&lt;/em&gt;&amp;nbsp;ưu đãi từ&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;01/06/2019&amp;nbsp;&lt;/span&gt;đến hết&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;31/07/2019&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đón hè rộn ràng cùng ngày hội gia đình ấm áp hơn với máy chạy bộ Kingsport cho bạn và gia đình sức khỏe và tràn đầy hạnh phúc với những món quà ý nghĩa. Mua ngay máy chạy bộ Kingsport để nhận ngay những ưu đãi hấp dẫn chưa từng có từ Kingsport nhé!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;TẬP ĐOÀN THỂ THAO KINGSPORT&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;a href=&quot;https://bit.ly/2GTHXcH&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;Hệ thống cửa hàng&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;98 chi nhánh trên toàn quốc&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;Hotline:&amp;nbsp;&lt;/em&gt;&lt;em&gt;0918648419 - 0936211210&lt;/em&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Qúy khách có thể liên hệ&amp;nbsp;&lt;em&gt;tổng đài 1800 6862 hoặc 1800 6852&lt;/em&gt;&amp;nbsp;để được tư vấn chi tiết hơn về sản phẩm, mọi nhu cầu về hậu mãi, thắc mắc, khiếu nại cũng sẽ được kết nối và hỗ trợ trong thời gian nhanh nhất.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;', 'ĐÓN HÈ RỘN RÀNG CÙNG MÁY CHẠY BỘ KINGSPORT VỚI ƯU ĐÃI LÊN 21%', '', ''),
(19, 2, 'LƯƠNG THẾ THÀNH BẤT NGỜ &quot;TỎ TÌNH&quot; VỢ', 'Ngày 20/10 vừa qua là dịp tri ân phái đẹp, các chị em tha hồ khoe quà tặng ngập tràn trên các trang mạng xã hội . Nữ diễn viên Thúy Diễm cũng đã có một màn livestream khoe quà hoành tráng mà ông xã đã dành tặng cho cô nàng.', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngày 20/10 vừa qua là dịp tri ân phái đẹp, các chị em tha hồ khoe quà tặng ngập tràn trên các trang mạng xã hội . Nữ diễn viên Thúy Diễm cũng đã có một màn livestream khoe quà hoành tráng mà ông xã đã dành tặng cho cô nàng.&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Được biết Lương Thế Thành là một người đàn ông hết mực yêu thương yêu chiều vợ và đặc biệt là luôn quan tâm đến sức khỏe của Thúy Diễm sau khi sinh. Anh luôn dành những gì tốt nhất đến vợ và cậu ấm nhà mình. &amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Qùa tặng không chỉ nói lên thành ý mà đó còn là sự quan tâm và chăm sóc và các ông chồng dành cho vợ của mình. Mới đây trong đoạn livestream cô nàng Thúy Diễm đã chia sẻ món quà đặc biệt mà ông xã đã tặng mình nhân dịp&amp;nbsp;&lt;a href=&quot;https://bit.ly/2OMavbL&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;ngày phụ nữ Việt Nam&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;mon-qua-to-tinh-bat-ngo-luong-the-thanh&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/10_2018/mon-qua-to-tinh-bat-ngo-luong-the-thanh.jpg&quot; style=&quot;max-width: 100%; width: 650px; height: 563px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Thúy Diễm Livestream chia sẻ món quà ý nghĩa được ông xã tặng nhân ngày 20/10&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Thúy Diễm chia sẻ:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;“&lt;em&gt;Trời ơi sanh xong cái đau ơi là đau luôn! ngày nào cũng than thở than thở, không ngờ bữa nay anh chồng lại tâm lý quá tặng cho mình một chiếc ghế massage Kingsport mà từ lâu mình mong ước, bây giờ mà mua ghế sẽ được tặng nhẫn Kim Cương PNJ. Ngồi trên ghế này ngủ một giấc thật sâu là bao nhiêu mệt mỏi tan biến hết luôn&lt;/em&gt;”&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Món quà được ông xã tâm lý dành tặng với sự yêu thương và sự san sẻ về tinh thần cũng như sức khỏe đã làm cho nữ diễn viên xinh đẹp của chúng ta vui không tả được.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;360&quot; src=&quot;https://www.youtube.com/embed/Sv4vOLiOMsE&quot; width=&quot;640&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Đoạn livestream khoe ghế massage Kingsport thu hút hàng nghìn lượt xem&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Màn livestream của cô nàng đã thu hút hàng nghìn lượt xem, món quà sức khỏe là&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html?utm_source=EVA&amp;amp;utm_medium=PR&amp;amp;utm_campaign=PHUNUVIETNAM&amp;amp;utm_term=THANG10&amp;amp;utm_content=THANG10&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;ghế massage Kingsport&lt;/a&gt;&amp;nbsp;đã khiến cho ngày 20/10 của Diễm trọn vẹn và hạnh phúc khi cô nàng còn được tặng nhẫn Kim Cương PNJ lấp lánh từ chương trình “Đặc Quyền&amp;nbsp; Phái Đẹp – Nhận Kèm Kim Cương” từ Kingsport. &amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Cô nàng còn vui vẻ gợi ý cho các ông chồng chọn mua món quà sức khỏe để tặng vợ của mình&amp;nbsp;&lt;em&gt;“20/10 này mấy anh chồng&amp;nbsp; thấy hay hay về món quà này cũng bắt chước tặng cho bà xã mình một chiếc ghế massage giống như Diễm thì chắc cũng hạnh phúc lắm đó”&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Có niềm vui nào bằng việc nhìn thấy người phụ nữ mình yêu luôn khỏe mạnh và vui vẻ mỗi ngày. Hãy yêu thương chăm sóc và san sẻ gánh nặng cùng vợ mình không chỉ 20/10 mới là dịp tặng quà và yêu thương mà 365 ngày đều là ngày của phụ nữ, đều được che chở và yêu thương, mua ngay món quà sức khỏe dành tặng cho người ấy ngay hôm nay nhé các ông chồng quốc dân!&lt;/p&gt;', 'LƯƠNG THẾ THÀNH BẤT NGỜ &quot;TỎ TÌNH&quot; VỢ', '', ''),
(20, 2, 'KINGSPORT - SỰ LỰA CHỌN HÀNG ĐẦU CỦA SAO VIỆT', 'Tập đoàn thể thao Kingsport tự hào là thương hiệu được nhiều ca sĩ diễn viên làng giải trí Việt tin tưởng lựa chọn và sử dụng. Thời gian qua Kingsport đã cho ra đời thêm nhiều dòng sản phẩm mới với những cải biến công nghệ hiện đại...', '&lt;div class=&quot;the-content desc&quot; style=&quot;margin: 0px 0px 20px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; line-height: 22px; font-family: Arial, Tahoma;&quot;&gt;&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Tập đoàn thể thao Kingsport tự hào là thương hiệu được nhiều ca sĩ diễn viên làng giải trí Việt tin tưởng lựa chọn và sử dụng.&lt;/span&gt;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;630x420_saoviet&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/12_2018/630x420_saoviet.jpg&quot; style=&quot;max-width: 100%; width: 630px; height: 420px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;em&gt;Kingsport - Sự lựa chọn hàng đầu của Sao Việt&amp;nbsp;&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Thời gian qua Kingsport đã cho ra đời thêm nhiều dòng sản phẩm mới với những cải biến công nghệ hiện đại góp phần nâng cao chất lượng sản phẩm, đáp ứng nhu cầ&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;u ngày càng tăng của xã hội. Với các sản phẩm Ghế massage, Máy chạy bộ, Xe đạp tập, Giàn tạ, Máy rung được nghiên cứu và phát triển bởi các chuyên gia Hoa Kỳ sẽ mang đến cho khách hàng sản phẩm chất lượng với giá tốt nhất. Ngoài ra, với chính sách hậu mãi lâu dài và dịch vụ chăm sóc khách hàng chuyên nghiệp bạn sẽ an tâm khi quyết định chọn mua tại Kingsport. Không chỉ mang cái tâm trong từng sản phẩm Kingsport còn mang đến cái tình qua từng sản phẩm với mong muốn mang đến một sức khỏe thật tốt&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Với trăn trở làm thế nào để mọi gia đình tại Việt Nam đều có thể sở hữu những sản phẩm chăm sóc sức khỏe chất lượng tốt nhất, Kingsport luôn nỗ lực không ngừng trong những năm qua, mong muốn mang lại những giá trị tốt đẹp nâng cao chất lượng cuộc sống và tiện ích cho mọi người dân Việt.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Cùng Cẩm Ly, Ưng Hoàng Phúc, Nhã Phương, Thúy Diễm, Trương Quỳnh Anh đồng hành với Kingsport trên chặng đường chăm sóc sức khỏe gia đình nhé!&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;360&quot; src=&quot;https://www.youtube.com/embed/FRMVsW7-aqE&quot; width=&quot;640&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;', 'KINGSPORT - SỰ LỰA CHỌN HÀNG ĐẦU CỦA SAO VIỆT', '', '');
INSERT INTO `ks_blog_description` (`blog_id`, `language_id`, `title`, `intro`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(21, 2, 'HÃY XUỐNG ĐƯỜNG BẰNG XE ĐẠP CÙNG HOA HẬU ĐỖ MỸ LINH', 'Ô nhiễm không khí tại các thành phố lớn đang trong hồi báo động với lượng khí độc được thải ra từ những phương tiện giao thông ngày một tăng cao. Trước tình hình ấy, Tập đoàn Kingsport bắt tay cùng Hoa hậu...', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Ô nhiễm không khí tại các thành phố lớn đang trong hồi báo động với lượng khí độc được thải ra từ những phương tiện giao thông ngày một tăng cao. Trước tình hình ấy, Tập đoàn Kingsport bắt tay cùng Hoa hậu Đỗ Mỹ Linh xuống đường bằng xe đạp góp phần bảo vệ môi trường.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Theo thống kê của Sở Giao thông vận tải thành phố Hồ Chí Minh hiện nay “có gần 8,5 triệu phương tiện giao thông đường bộ, xe máy chiếm 95% và thải ra 94% HC, 87% CO và 57% Nox trong tổng lượng phát thải của các loại xe cơ giới” gây ảnh hưởng đến sức khỏe con người. Tháng 5 năm 2019, Hoa hậu Đỗ Mỹ Linh được Tập đoàn thể thao Kingsport gửi gắm một sứ mệnh nhỏ với niềm tin lớn: Đồng hành xuống đường bằng đạp xe tạo xu hướng giao thông xanh.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Cùng Hoa hậu Đỗ Mỹ Linh xuống đường bằng xe đạp Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Với sứ mệnh mang sức khỏe về đến mọi nhà, xây dựng một môi trường xanh cho cuộc sống mỗi chúng ta luôn thịnh vượng, Hoa hậu Đỗ Mỹ Linh đã xuống đường ngay hôm nay góp phần bảo vệ môi trường xanh - sạch - đẹp.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Với niềm tin vững mạnh, Tập đoàn Kingsport mong muốn mang đến cho khách hàng những mẫu xe đạp tiện nghi và chất lượng, kiểu dáng thời trang phù hợp cho nhiều đối tượng với các mức giá ưu đãi cực hấp dẫn, lựa chọn&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/xe-dap-the-thao.html?utm_source=KENH14&amp;amp;utm_medium=PRBAO&amp;amp;utm_campaign=THANG5&amp;amp;utm_term=BAOVEMOITRUONGB%C3%83NGEDAP&amp;amp;utm_content=BAOVEMOITRUONGBANGXEDAP&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;xe đạp Kingsport&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;góp phần giảm thiểu ô nhiễm môi trường, nâng cao sức khỏe, xây dựng tương lai với môi trương xanh sạch, hòa cùng niềm tin lớn chính là sự đồng hành của cô “Hoa hậu nhân ái” Đỗ Mỹ Linh, cô nàng đã nhanh tay mang về nhà ngay xe đạp làm phương tiện di chuyển của mình.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/2.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Chung tay bảo về môi trường, xuống đường cùng Linh hôm nay nhé!&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Lựa chọn xe đạp là mang về một môi trường xanh và một sức sống khỏe. Nếu quay lại hơn 10 năm về trước, có lẽ xe đạp là 1 trong những phương tiện phổ biến nhất, tuy nhiên ngày nay đời sống lên cao nhiều gia đình đã lựa chọn những phương tiện khác để phục vụ cho nhu cầu của mình việc này đồng nghĩa với mức độ khí thải tăng cao, kéo theo những tình trạng ô nhiễm giao thông, tiếng ồn và đáng quan ngại nhất chính là ô nhiễm không khí gây ảnh hưởng lớn đến sức khỏe của chúng ta và tương lai sau này của đất nước.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/4.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;em&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Lựa chọn xe đạp, xây môi trường sạch dựng sức khỏe xanh&lt;/span&gt;&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hành động nhỏ nhưng ý nghĩa lớn, Hoa hậu Đỗ Mỹ Linh đã lựa chọn xe đạp của Tập đoàn thể thao Kingsport xứng đáng là một việc làm đẹp bảo vệ môi trường, sức khỏe và sự sống. Ngoài ra lựa chọn xe đạp để di chuyển còn đáp ứng cao tính an toàn cho người tham gia giao thông. Bên cạnh đó, việc đạp xe đạp còn nâng cao sức khỏe, giúp cơ thể săn chắc, dẻo dai và linh hoạt hơn.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/3.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Cho cuộc sống mãi xanh hãy chọn xe đạp Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đồng hành cùng Kingsport, Hoa hậu Đỗ Mỹ Linh đã góp phần bảo vệ môi trường sạch mang về sức khỏe xanh, còn bạn thì sao?&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Sở hữu ngay những dòng xe đạp chất lượng được sản xuất chuẩn theo công nghệ Hoa Kỳ phục vụ cho việc đi lại đồng thời góp phần giảm thiểu khói bụi và khí thải, bảo vệ môi trường thì truy cập ngay vào website:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;https://www.kingsport.vn&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;. Cùng Kingsport giữ cho môi trường mãi xanh!&lt;/span&gt;&lt;/p&gt;', 'HÃY XUỐNG ĐƯỜNG BẰNG XE ĐẠP CÙNG HOA HẬU ĐỖ MỸ LINH', '', ''),
(22, 2, 'HÃY XUỐNG ĐƯỜNG BẰNG XE ĐẠP CÙNG HOA HẬU ĐỖ MỸ LINH', 'Ô nhiễm không khí tại các thành phố lớn đang trong hồi báo động với lượng khí độc được thải ra từ những phương tiện giao thông ngày một tăng cao. Trước tình hình ấy, Tập đoàn Kingsport bắt tay cùng Hoa hậu...', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Ô nhiễm không khí tại các thành phố lớn đang trong hồi báo động với lượng khí độc được thải ra từ những phương tiện giao thông ngày một tăng cao. Trước tình hình ấy, Tập đoàn Kingsport bắt tay cùng Hoa hậu Đỗ Mỹ Linh xuống đường bằng xe đạp góp phần bảo vệ môi trường.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Theo thống kê của Sở Giao thông vận tải thành phố Hồ Chí Minh hiện nay “có gần 8,5 triệu phương tiện giao thông đường bộ, xe máy chiếm 95% và thải ra 94% HC, 87% CO và 57% Nox trong tổng lượng phát thải của các loại xe cơ giới” gây ảnh hưởng đến sức khỏe con người. Tháng 5 năm 2019, Hoa hậu Đỗ Mỹ Linh được Tập đoàn thể thao Kingsport gửi gắm một sứ mệnh nhỏ với niềm tin lớn: Đồng hành xuống đường bằng đạp xe tạo xu hướng giao thông xanh.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Cùng Hoa hậu Đỗ Mỹ Linh xuống đường bằng xe đạp Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Với sứ mệnh mang sức khỏe về đến mọi nhà, xây dựng một môi trường xanh cho cuộc sống mỗi chúng ta luôn thịnh vượng, Hoa hậu Đỗ Mỹ Linh đã xuống đường ngay hôm nay góp phần bảo vệ môi trường xanh - sạch - đẹp.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Với niềm tin vững mạnh, Tập đoàn Kingsport mong muốn mang đến cho khách hàng những mẫu xe đạp tiện nghi và chất lượng, kiểu dáng thời trang phù hợp cho nhiều đối tượng với các mức giá ưu đãi cực hấp dẫn, lựa chọn&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/xe-dap-the-thao.html?utm_source=KENH14&amp;amp;utm_medium=PRBAO&amp;amp;utm_campaign=THANG5&amp;amp;utm_term=BAOVEMOITRUONGB%C3%83NGEDAP&amp;amp;utm_content=BAOVEMOITRUONGBANGXEDAP&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;xe đạp Kingsport&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;góp phần giảm thiểu ô nhiễm môi trường, nâng cao sức khỏe, xây dựng tương lai với môi trương xanh sạch, hòa cùng niềm tin lớn chính là sự đồng hành của cô “Hoa hậu nhân ái” Đỗ Mỹ Linh, cô nàng đã nhanh tay mang về nhà ngay xe đạp làm phương tiện di chuyển của mình.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/2.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Chung tay bảo về môi trường, xuống đường cùng Linh hôm nay nhé!&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Lựa chọn xe đạp là mang về một môi trường xanh và một sức sống khỏe. Nếu quay lại hơn 10 năm về trước, có lẽ xe đạp là 1 trong những phương tiện phổ biến nhất, tuy nhiên ngày nay đời sống lên cao nhiều gia đình đã lựa chọn những phương tiện khác để phục vụ cho nhu cầu của mình việc này đồng nghĩa với mức độ khí thải tăng cao, kéo theo những tình trạng ô nhiễm giao thông, tiếng ồn và đáng quan ngại nhất chính là ô nhiễm không khí gây ảnh hưởng lớn đến sức khỏe của chúng ta và tương lai sau này của đất nước.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;img alt=&quot;4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/4.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;em&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Lựa chọn xe đạp, xây môi trường sạch dựng sức khỏe xanh&lt;/span&gt;&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hành động nhỏ nhưng ý nghĩa lớn, Hoa hậu Đỗ Mỹ Linh đã lựa chọn xe đạp của Tập đoàn thể thao Kingsport xứng đáng là một việc làm đẹp bảo vệ môi trường, sức khỏe và sự sống. Ngoài ra lựa chọn xe đạp để di chuyển còn đáp ứng cao tính an toàn cho người tham gia giao thông. Bên cạnh đó, việc đạp xe đạp còn nâng cao sức khỏe, giúp cơ thể săn chắc, dẻo dai và linh hoạt hơn.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2019/3.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;em&gt;Cho cuộc sống mãi xanh hãy chọn xe đạp Kingsport&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đồng hành cùng Kingsport, Hoa hậu Đỗ Mỹ Linh đã góp phần bảo vệ môi trường sạch mang về sức khỏe xanh, còn bạn thì sao?&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Sở hữu ngay những dòng xe đạp chất lượng được sản xuất chuẩn theo công nghệ Hoa Kỳ phục vụ cho việc đi lại đồng thời góp phần giảm thiểu khói bụi và khí thải, bảo vệ môi trường thì truy cập ngay vào website:&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;https://www.kingsport.vn&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;. Cùng Kingsport giữ cho môi trường mãi xanh!&lt;/span&gt;&lt;/p&gt;', 'HÃY XUỐNG ĐƯỜNG BẰNG XE ĐẠP CÙNG HOA HẬU ĐỖ MỸ LINH', '', ''),
(23, 2, 'MISS WORLD VIỆT NAM 2019 THAM QUAN VÀ TRẢI NGHIỆM TẠI KINGSPORT', 'Ngày 17/6 vừa qua, các thí sinh Miss World Việt Nam 2019 đã có chuyến tham quan trụ sở chính của Tập đoàn thể thao Kingsport. Tại đây, các thí sinh đã cùng nhau tham quan Showroom cũng như trải nghiệm tất các dòng sản phẩm...', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;360&quot; src=&quot;https://www.youtube.com/embed/GVWvnfRwhC0&quot; width=&quot;98%&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Ngày 17/6 vừa qua, các thí sinh Miss World Việt Nam 2019 đã có chuyến tham quan trụ sở chính của Tập đoàn thể thao Kingsport. Tại đây, các thí sinh đã cùng nhau tham quan Showroom cũng như trải nghiệm tất các dòng sản phẩm chăm sóc sức khỏe của Kingsport.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Theo lịch trình, các người đẹp đã tới Showroom Kingsport để tham quan đồng thời&amp;nbsp;trải nghiệm tất cả các dòng sản phẩm chăm sóc sức khỏe. Tại đây, các thí sinh được trực tiếp trải nghiệm những sản phẩm chất lượng, với công nghệ cao chuẩn Hoa Kỳ của Kingsport.&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-007_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-007_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Các&amp;nbsp;thí sinh hào hứng khi được nhân viên&amp;nbsp;&lt;/em&gt;&lt;em&gt;Kingsport tận tình hướng dẫn về chức năng và công dụng của máy.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Thông điệp “Sống xanh-&amp;nbsp;Sống Khỏe” đang được cuộc thi Miss World Việt Nam 2019 tuyên truyền không chỉ dừng lại ở việc bảo vệ môi trường, mà còn nằm ở việc duy trì thói quen luyện tập thể thao và rèn luyện sức khỏe cho mỗi chúng ta. Đem đến nguồn năng lượng sống dồi dào và lan truyền đến cả cộng đồng, để ai ai cũng nắm rõ tầm quan trọng của sức khỏe.&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-006_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-006_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Các người đẹp thích thú trải nghiệm các dòng&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;u&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;máy chạy bộ&lt;/span&gt;&lt;/u&gt;&lt;/span&gt;&lt;/a&gt;&amp;nbsp;hiện đại nhất của Kingsport&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Việc Miss World Việt Nam 2019 chọn Kingsport là điểm dừng chân cho chuyến hành trình của các thí sinh, điều đó góp phần đẩy mạnh tuyên truyền đến cộng đồng về nét đẹp thể thao và ý thức nâng cao rèn luyện thể chất đến với mọi người.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-001_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-001_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Các thí sinh chia sẻ rằng: để có một dáng vóc thon gọn, săn chắc và một sức khỏe dẻo dai họ đã phải nỗ lực tập luyện thể thao rất nhiều để luôn sẵn sàng chinh phục đỉnh cao nhan sắc.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Kingsport tự hào là nhãn hàng số 1 uy tín hàng đầu tại Việt Nam. Với cung cách phục vụ tận tâm từ khâu tư vấn cho đến chế độ hậu mãi về sau, cam kết bảo trì sản phẩm đến trọn đời khi khách hàng đã lựa chọn và sử dụng sản phẩm của Kingsport.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-002_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-002_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Với các cô gái, đây là một trải nghiệm thú vị và mới mẻ.&lt;/em&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-009_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-009_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Các thí sinh Miss World Việt Nam 2019 đã có những phút giây thư giãn thoải mái bên sản phẩm ghế massage Kingsport.&lt;/em&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-003_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-003_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;em&gt;Các thí sinh trải nghiệm sản phẩm sau khi được nhân viên tư vấn cách sử dụng và lợi ích của&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;u&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ghế massage&lt;/span&gt;&lt;/u&gt;&lt;/span&gt;&lt;/a&gt;&amp;nbsp;toàn thân.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;em&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-004_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-004_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/em&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Qua những hình ảnh khỏe đẹp năng động của các thí sinh Miss World Việt Nam 2019, Kingsport muốn truyền đi thông điệp về sự chăm sóc, rèn luyện sức khỏe toàn diện.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Các thí sinh Miss World Việt Nam 2019 chính là đại diện cho thế hệ trẻ xinh đẹp và năng động sẽ tạo nên ảnh hưởng rất lớn đến với cộng đồng. Khát khao mang đến thông điệp “Sống Xanh, Sống Khỏe” nhằm mang lại lợi ích sức khỏe bền lâu cho mọi người, mọi nhà.&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-008_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-008_2.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Mục tiêu mà các thí sinh&amp;nbsp;&lt;/em&gt;&lt;em&gt;Miss World Việt Nam 2019 hướng tới đó là tích cực xây dựng hình ảnh khỏe đẹp, năng động, và có trách nhiệm với cộng đồng.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Sau hành trình tham quan và trải nghiệm, các thí sinh cho biết họ rất ấn tượng và thích thú với những sản phẩm giúp rèn luyện sức khỏe, và cải thiện vóc dáng của Kingsport. Và cho rằng đây là những sản phẩm hữu ích và thiết thực giúp chăm sóc sức khỏe toàn diện cho cả cộng đồng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;em&gt;Kết thúc chuyến hành trình, các thí sinh Miss World&amp;nbsp;&lt;/em&gt;&lt;em style=&quot;text-align: -webkit-center;&quot;&gt;Việt Nam 2019&amp;nbsp;&lt;/em&gt;&lt;em&gt;lưu lại những hình ảnh đẹp về chuyến trải nghiệm đáng nhớ này cùng các nhân viên của Kingsport.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;em&gt;&lt;img alt=&quot;thi-sinh-miss-world-viet-nam-2019-010_1_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/06_2019/thi-sinh-miss-world-viet-nam-2019-010_1_1.jpg&quot; style=&quot;max-width: 100%; width: 900px; height: 600px;&quot;&gt;&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Cùng Kingsport và các thí sinh Miss World Việt Nam 2019 gửi trao thông điệp vì một thế giới Xanh, một sức khỏe bền vững dài lâu bạn nhé!&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Xem thêm những dòng sản phẩm&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;u&gt;&lt;em&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ghế massage&lt;/span&gt;&lt;/em&gt;&lt;/u&gt;&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;u&gt;&lt;em&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;máy chạy bộ&lt;/span&gt;&lt;/em&gt;&lt;/u&gt;&lt;/a&gt;,... của Kingsport tại đây.&lt;/p&gt;', 'MISS WORLD VIỆT NAM 2019 THAM QUAN VÀ TRẢI NGHIỆM TẠI KINGSPORT', '', ''),
(24, 2, 'MẤT NGỦ KINH NIÊN, PHẢI LÀM THẾ NÀO?', '', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Giấc ngủ sâu rất cần thiết để ổn định các hoạt động sinh lý của cơ thể, là trạng thái tạm thời để cơ thể nghỉ ngơi hoàn toàn và khôi phục sức khỏe. Tuy nhiên hiện nay theo thống kê cho thấy có đến hơn&amp;nbsp; 20% dân số gặp phải tình trạng mất ngủ về đêm.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;H1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/H1.jpg&quot; style=&quot;max-width: 100%; width: 630px; height: 350px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Ngủ là phản ứng tự nhiên của con người để lấy lại thăng bằng cho cơ thể. Một giấc ngủ ngon sẽ làm tiêu hao mệt mỏi, khôi phục lại sức lực, giữ cho thần kinh được cân bằng, bảo vệ não bộ. Ngược lại ngủ không đủ giấc, mất ngủ, ngủ không sâu, trằn trọc về đêm là một trong những tác nhân gây ảnh hưởng nghiêm trọng đến sức khỏe thể chất và tinh thần của bất cứ ai.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Matthew Walker, một nhà thần kinh học và là một chuyên gia về giấc ngủ, cũng từng nói &quot;Thời gian ngủ của bạn càng ngắn, cuộc sống của bạn càng bị rút ngắn đi&quot;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Cùng&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Kingsport&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;điểm qua một số tác hại của việc mất ngủ kinh niên:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;1. Mất ngủ khiến não bộ kém tập trung: Nếu giấc ngủ thường xuyên bị gián đoạn, người sẽ cảm thấy chậm chạp và gặp khó khăn khi thực hiện nhiệm vụ và ghi nhớ mọi thứ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;2. Mất ngủ có thể gây bệnh tim mạch: Vì khi đó hệ thần kinh giao cảm hoạt động nhiều hơn, mạch máu co lại, huyết áp tăng, tạo áp lực thêm cho trái tim.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;3. Hậu quả của mất ngủ gây bệnh tiểu đường: Mất ngủ sẽ dẫn đến viêm cứng lòng mạch máu vì gia tăng hormon gây stress, đường huyết, huyết áp,... các nguy cơ dẫn tới bệnh tiểu đường.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;4. Tác hại của mất ngủ làm gia tăng nguy cơ bị ung thư cao: Một cuộc nghiên cứu vào năm 2008 được thực hiện ở Anh cho thấy, phụ nữ ngủ ít hơn 6 tiếng đồng hồ/đêm có nguy cơ phát triển bệnh ung thư vú.Thêm nữa, một nghiên cứu tại Trường Y Harvard (Mỹ) cho kết quả, những ai ngủ ít hơn 6 tiếng/đêm có nguy cơ phát triển khối u đại trực tràng dẫn đến ung thư.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;5. Tác hại của việc mất ngủ đến khả năng học tập và làm việc: Cũng theo nghiên cứu được trình bày tại cuộc họp thường niên APSS năm 2009, một giấc ngủ trưa ngắn có thể thúc đẩy tâm trạng và hiệu suất công việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;tram-cam-de-doa-tinh-mang-nguoi-benh&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/tram-cam-de-doa-tinh-mang-nguoi-benh.jpg&quot; style=&quot;max-width: 100%; width: 640px; height: 427px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;6. Hậu quả của mất ngủ làm tăng cân: Các nghiên cứu chỉ ra rằng, khi mất ngủ, cơ thể bạn sẽ rơi vào trạng thái mệt mỏi, căng thẳng, các cơ quan không đảm trách được chức năng vốn có của cơ thể, khiến cho lượng calo không thể tiêu hao, tăng lượng mỡ tích tụ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;7. Tác hại của mất ngủ làm tăng huyết áp: Giấc ngủ bị gián đoạn sẽ gây căng thẳng vào ban đêm và căng thẳng này cũng gây hại như bất kỳ căng thẳng khác xảy ra trong ngày. Khi mất ngủ, cơ thể sẽ đối mặt với nguy cơ tăng huyết áp.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;8. Tác hại của mất ngủ gây trầm cảm: Mất ngủ là nguyên nhân làm giảm chất dẫn truyền thần kinh có tác dụng điều chỉnh tâm trạng con người.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;9. Tác hại của mất ngủ làm suy giảm trí nhớ: Mất ngủ dẫn đến giảm trí nhớ, khó tập trung chú ý, giảm sút khả năng lao động và hậu quả tất yếu là giảm tính tích cực trong cuộc sống.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;11. Tác hại của mất ngủ gây rối loạn tâm lý: Mất ngủ thường dẫn đến tình trạng rối loạn, lo âu, cáu gắt, uể oải, mệt mỏi,… Đồng thời gây nảy sinh rất nhiều vấn đề về sức khỏe tâm thần như trầm cảm, tự kỷ,…&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Có nhiều nguyên nhân dẫn đến mất ngủ như:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Mất ngủ do tuổi tác.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Mất ngủ do căng thẳng, stress.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Mất ngủ do bệnh lý như: Đau xương khớp, viêm xoang, cảm cúm,...&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Vậy làm thế nào để chữa mất ngủ hiệu quả?&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Khi mắc phải chứng mất ngủ, câu hỏi chúng ta thường đặt ra là bệnh có chữa được dứt điểm không? Làm cách nào chữa khỏi chứng mất ngủ? Hay là làm thế nào để dễ ngủ? Có cách nào để đi vào giấc ngủ nhanh? Có cách ngủ nào giúp ngủ dễ hơn không?…. Và một số người đã đi tìm đến giải pháp nhanh chóng nhất nhưng “nguy hiểm” nhất đó chính là thuốc ngủ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;photo1514508438740-1514508438740&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/photo1514508438740-1514508438740.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 410px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Người mất ngủ hiểu rõ rằng việc sử dụng thuốc ngủ tây y chỉ có tác dụng mồi cho &quot;dễ ngủ&quot; chứ không thể điều trị tận gốc mất ngủ. Ngoài ra sử dụng lạm dụng thường xuyên hoặc quá liều sẽ gây tác hại rất lớn cho sức khỏe như mệt mỏi, suy giảm trí nhớ và bị lệ thuộc vào thuốc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Nên tập thể dục, chơi thể thao vào buổi sáng. Cân bằng giữa lao động trí óc, lao động tay chân, thư giãn giải trí. Tạo môi trường tuyệt đối yên tĩnh, không có ánh sáng khi ngủ. Chủ động thư giãn cơ thể không suy nghĩ miên man tập trung vào nhịp thở, làm cho cơ thể dễ chìm vào giấc ngủ. Một trong những phương pháp hiện đại ngày nay để cải thiện giấc ngủ an toàn được nhiều gia đình áp dụng đó chính là sử dụng&amp;nbsp;&lt;u&gt;&lt;em&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ghế massage toàn thân&lt;/span&gt;&lt;/a&gt;&lt;/em&gt;&lt;/u&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Với các bài xoa bóp thuần thục như một nhân viên mát xa chuyên nghiệp, ghế massage &amp;nbsp;sẽ xoa, day ấn vào các huyệt đạo một cách chính xác giúp cho hệ thống dây thần kinh hoạt động linh hoạt, vận chuyển dưỡng chất, oxy lên não được tốt nhất. Khi đươc “đủ đầy” , tinh thần sẽ &amp;nbsp;minh mẫn, cơ thể sảng khoái từ đó giấc ngủ cũng sẽ ngon hơn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Trong trường hợp mất ngủ do xương khớp,&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;u&gt;&lt;em&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ghế mát xa&lt;/span&gt;&lt;/em&gt;&lt;/u&gt;&lt;/a&gt;&amp;nbsp;toàn thân sẽ sử dụng công nghệ mát xa 4D với hệ thống con lăn bố trí ở nhiều vị trí từ đầu đến chân giúp ấn, day, miết, ... giảm đau nhức vô cùng hiệu quả, đặc biệt là con lăn mát xa ở lòng bàn chân giúp tăng cường tuần hoàn máu, kích thích khu phản xạ giấc ngủ, từ đó giúp cho bộ não trở nên thoải mái và thư giãn hơn. Kiên trì mát xa ở lòng bàn chân &amp;nbsp;sẽ giúp nâng cao chất lượng giấc ngủ, giảm tình trạng mất ngủ hoặc ngủ không ngon giấc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;H4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/H4.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 410px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Với ghế massage toàn thân, các cơn đau được xoa dịu, mọi căng thẳng mệt mỏi tan biến, một giấc ngủ ngon sẽ chẳng còn là vấn đề. Đồng thời còn loại bỏ được việc dùng thuốc ngủ, thuốc an thần trong trị bệnh.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Hy vọng với những chia sẻ trên đây sẽ giúp bạn tìm được phương pháp chữa mất ngủ hiệu quả ngay tại nhà. Để biết thêm thông tin chi tiết, hãy nhanh tay gọi ngay đến Tổng đài miễn cước 1800 6862 hoặc Hotline 0936 211 210 để được các chuyên viên Kingsport tư vấn tận tình nhất nhé!&lt;/span&gt;&lt;/p&gt;', 'MẤT NGỦ KINH NIÊN, PHẢI LÀM THẾ NÀO?', '', '');
INSERT INTO `ks_blog_description` (`blog_id`, `language_id`, `title`, `intro`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(25, 2, 'MẤT NGỦ KINH NIÊN, PHẢI LÀM THẾ NÀO?', '', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Giấc ngủ sâu rất cần thiết để ổn định các hoạt động sinh lý của cơ thể, là trạng thái tạm thời để cơ thể nghỉ ngơi hoàn toàn và khôi phục sức khỏe. Tuy nhiên hiện nay theo thống kê cho thấy có đến hơn&amp;nbsp; 20% dân số gặp phải tình trạng mất ngủ về đêm.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;H1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/H1.jpg&quot; style=&quot;max-width: 100%; width: 630px; height: 350px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Ngủ là phản ứng tự nhiên của con người để lấy lại thăng bằng cho cơ thể. Một giấc ngủ ngon sẽ làm tiêu hao mệt mỏi, khôi phục lại sức lực, giữ cho thần kinh được cân bằng, bảo vệ não bộ. Ngược lại ngủ không đủ giấc, mất ngủ, ngủ không sâu, trằn trọc về đêm là một trong những tác nhân gây ảnh hưởng nghiêm trọng đến sức khỏe thể chất và tinh thần của bất cứ ai.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Matthew Walker, một nhà thần kinh học và là một chuyên gia về giấc ngủ, cũng từng nói &quot;Thời gian ngủ của bạn càng ngắn, cuộc sống của bạn càng bị rút ngắn đi&quot;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Cùng&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Kingsport&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;điểm qua một số tác hại của việc mất ngủ kinh niên:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;1. Mất ngủ khiến não bộ kém tập trung: Nếu giấc ngủ thường xuyên bị gián đoạn, người sẽ cảm thấy chậm chạp và gặp khó khăn khi thực hiện nhiệm vụ và ghi nhớ mọi thứ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;2. Mất ngủ có thể gây bệnh tim mạch: Vì khi đó hệ thần kinh giao cảm hoạt động nhiều hơn, mạch máu co lại, huyết áp tăng, tạo áp lực thêm cho trái tim.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;3. Hậu quả của mất ngủ gây bệnh tiểu đường: Mất ngủ sẽ dẫn đến viêm cứng lòng mạch máu vì gia tăng hormon gây stress, đường huyết, huyết áp,... các nguy cơ dẫn tới bệnh tiểu đường.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;4. Tác hại của mất ngủ làm gia tăng nguy cơ bị ung thư cao: Một cuộc nghiên cứu vào năm 2008 được thực hiện ở Anh cho thấy, phụ nữ ngủ ít hơn 6 tiếng đồng hồ/đêm có nguy cơ phát triển bệnh ung thư vú.Thêm nữa, một nghiên cứu tại Trường Y Harvard (Mỹ) cho kết quả, những ai ngủ ít hơn 6 tiếng/đêm có nguy cơ phát triển khối u đại trực tràng dẫn đến ung thư.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;5. Tác hại của việc mất ngủ đến khả năng học tập và làm việc: Cũng theo nghiên cứu được trình bày tại cuộc họp thường niên APSS năm 2009, một giấc ngủ trưa ngắn có thể thúc đẩy tâm trạng và hiệu suất công việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;tram-cam-de-doa-tinh-mang-nguoi-benh&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/tram-cam-de-doa-tinh-mang-nguoi-benh.jpg&quot; style=&quot;max-width: 100%; width: 640px; height: 427px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;6. Hậu quả của mất ngủ làm tăng cân: Các nghiên cứu chỉ ra rằng, khi mất ngủ, cơ thể bạn sẽ rơi vào trạng thái mệt mỏi, căng thẳng, các cơ quan không đảm trách được chức năng vốn có của cơ thể, khiến cho lượng calo không thể tiêu hao, tăng lượng mỡ tích tụ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;7. Tác hại của mất ngủ làm tăng huyết áp: Giấc ngủ bị gián đoạn sẽ gây căng thẳng vào ban đêm và căng thẳng này cũng gây hại như bất kỳ căng thẳng khác xảy ra trong ngày. Khi mất ngủ, cơ thể sẽ đối mặt với nguy cơ tăng huyết áp.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;8. Tác hại của mất ngủ gây trầm cảm: Mất ngủ là nguyên nhân làm giảm chất dẫn truyền thần kinh có tác dụng điều chỉnh tâm trạng con người.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;9. Tác hại của mất ngủ làm suy giảm trí nhớ: Mất ngủ dẫn đến giảm trí nhớ, khó tập trung chú ý, giảm sút khả năng lao động và hậu quả tất yếu là giảm tính tích cực trong cuộc sống.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;11. Tác hại của mất ngủ gây rối loạn tâm lý: Mất ngủ thường dẫn đến tình trạng rối loạn, lo âu, cáu gắt, uể oải, mệt mỏi,… Đồng thời gây nảy sinh rất nhiều vấn đề về sức khỏe tâm thần như trầm cảm, tự kỷ,…&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Có nhiều nguyên nhân dẫn đến mất ngủ như:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Mất ngủ do tuổi tác.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Mất ngủ do căng thẳng, stress.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Mất ngủ do bệnh lý như: Đau xương khớp, viêm xoang, cảm cúm,...&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Vậy làm thế nào để chữa mất ngủ hiệu quả?&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Khi mắc phải chứng mất ngủ, câu hỏi chúng ta thường đặt ra là bệnh có chữa được dứt điểm không? Làm cách nào chữa khỏi chứng mất ngủ? Hay là làm thế nào để dễ ngủ? Có cách nào để đi vào giấc ngủ nhanh? Có cách ngủ nào giúp ngủ dễ hơn không?…. Và một số người đã đi tìm đến giải pháp nhanh chóng nhất nhưng “nguy hiểm” nhất đó chính là thuốc ngủ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;photo1514508438740-1514508438740&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/photo1514508438740-1514508438740.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 410px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Người mất ngủ hiểu rõ rằng việc sử dụng thuốc ngủ tây y chỉ có tác dụng mồi cho &quot;dễ ngủ&quot; chứ không thể điều trị tận gốc mất ngủ. Ngoài ra sử dụng lạm dụng thường xuyên hoặc quá liều sẽ gây tác hại rất lớn cho sức khỏe như mệt mỏi, suy giảm trí nhớ và bị lệ thuộc vào thuốc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Nên tập thể dục, chơi thể thao vào buổi sáng. Cân bằng giữa lao động trí óc, lao động tay chân, thư giãn giải trí. Tạo môi trường tuyệt đối yên tĩnh, không có ánh sáng khi ngủ. Chủ động thư giãn cơ thể không suy nghĩ miên man tập trung vào nhịp thở, làm cho cơ thể dễ chìm vào giấc ngủ. Một trong những phương pháp hiện đại ngày nay để cải thiện giấc ngủ an toàn được nhiều gia đình áp dụng đó chính là sử dụng&amp;nbsp;&lt;u&gt;&lt;em&gt;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ghế massage toàn thân&lt;/span&gt;&lt;/a&gt;&lt;/em&gt;&lt;/u&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Với các bài xoa bóp thuần thục như một nhân viên mát xa chuyên nghiệp, ghế massage &amp;nbsp;sẽ xoa, day ấn vào các huyệt đạo một cách chính xác giúp cho hệ thống dây thần kinh hoạt động linh hoạt, vận chuyển dưỡng chất, oxy lên não được tốt nhất. Khi đươc “đủ đầy” , tinh thần sẽ &amp;nbsp;minh mẫn, cơ thể sảng khoái từ đó giấc ngủ cũng sẽ ngon hơn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Trong trường hợp mất ngủ do xương khớp,&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/ghe-massage.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;u&gt;&lt;em&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ghế mát xa&lt;/span&gt;&lt;/em&gt;&lt;/u&gt;&lt;/a&gt;&amp;nbsp;toàn thân sẽ sử dụng công nghệ mát xa 4D với hệ thống con lăn bố trí ở nhiều vị trí từ đầu đến chân giúp ấn, day, miết, ... giảm đau nhức vô cùng hiệu quả, đặc biệt là con lăn mát xa ở lòng bàn chân giúp tăng cường tuần hoàn máu, kích thích khu phản xạ giấc ngủ, từ đó giúp cho bộ não trở nên thoải mái và thư giãn hơn. Kiên trì mát xa ở lòng bàn chân &amp;nbsp;sẽ giúp nâng cao chất lượng giấc ngủ, giảm tình trạng mất ngủ hoặc ngủ không ngon giấc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;H4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/04_2019/H4.jpg&quot; style=&quot;max-width: 100%; width: 660px; height: 410px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Với ghế massage toàn thân, các cơn đau được xoa dịu, mọi căng thẳng mệt mỏi tan biến, một giấc ngủ ngon sẽ chẳng còn là vấn đề. Đồng thời còn loại bỏ được việc dùng thuốc ngủ, thuốc an thần trong trị bệnh.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Hy vọng với những chia sẻ trên đây sẽ giúp bạn tìm được phương pháp chữa mất ngủ hiệu quả ngay tại nhà. Để biết thêm thông tin chi tiết, hãy nhanh tay gọi ngay đến Tổng đài miễn cước 1800 6862 hoặc Hotline 0936 211 210 để được các chuyên viên Kingsport tư vấn tận tình nhất nhé!&lt;/span&gt;&lt;/p&gt;', 'MẤT NGỦ KINH NIÊN, PHẢI LÀM THẾ NÀO?', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_to_layout`
--

CREATE TABLE `ks_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_to_layout`
--

INSERT INTO `ks_blog_to_layout` (`blog_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(4, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(21, 0, 0),
(22, 0, 0),
(23, 0, 0),
(24, 0, 0),
(25, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_blog_to_store`
--

CREATE TABLE `ks_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_blog_to_store`
--

INSERT INTO `ks_blog_to_store` (`blog_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_branch`
--

CREATE TABLE `ks_branch` (
  `branch_id` int(11) UNSIGNED NOT NULL,
  `bottom` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `parking` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_branch`
--

INSERT INTO `ks_branch` (`branch_id`, `bottom`, `area`, `parking`, `status`, `sort_order`, `date_added`, `date_modified`, `image`) VALUES
(3, 0, 0, 1, 1, 1, NULL, NULL, ''),
(4, 0, 0, 1, 1, 2, NULL, NULL, ''),
(5, 0, 0, 1, 1, 4, NULL, NULL, ''),
(6, 0, 0, 1, 1, 3, NULL, NULL, ''),
(7, 0, 0, 1, 1, 7, NULL, NULL, ''),
(8, 0, 0, 1, 1, 6, NULL, NULL, ''),
(9, 0, 0, 1, 1, 5, NULL, NULL, ''),
(10, 0, 0, 1, 1, 8, NULL, NULL, ''),
(11, 0, 0, 1, 1, 9, NULL, NULL, 'catalog/vt.jpg'),
(12, 0, 0, 1, 1, 10, NULL, NULL, 'catalog/tn.jpg'),
(13, 0, 0, 1, 1, 11, NULL, NULL, ''),
(14, 0, 0, 1, 1, 12, NULL, NULL, 'catalog/dt.jpg'),
(15, 0, 0, 1, 1, 15, NULL, NULL, 'catalog/hg.jpg'),
(16, 0, 0, 1, 1, 13, NULL, NULL, 'catalog/kg.jpg'),
(17, 0, 1, 1, 1, 16, NULL, NULL, ''),
(18, 0, 0, 1, 1, 14, NULL, NULL, 'catalog/bl.png'),
(19, 0, 1, 1, 1, 17, NULL, NULL, 'catalog/h.jpg'),
(20, 0, 1, 1, 1, 18, NULL, NULL, 'catalog/bdi.jpg'),
(21, 0, 1, 1, 1, 19, NULL, NULL, 'catalog/car.jpg'),
(22, 0, 1, 1, 1, 20, NULL, NULL, 'catalog/gl.jpg'),
(23, 0, 1, 1, 1, 21, NULL, NULL, 'catalog/bal.jpg'),
(24, 0, 2, 1, 1, 22, NULL, NULL, 'catalog/cghn.jpg'),
(25, 0, 2, 1, 1, 23, NULL, NULL, 'catalog/lbhn.jpg'),
(26, 0, 2, 1, 1, 24, NULL, NULL, 'catalog/tlhn.jpg'),
(27, 0, 2, 1, 1, 25, NULL, NULL, 'catalog/ddhn.jpg'),
(28, 0, 2, 1, 1, 29, NULL, NULL, 'catalog/na.png'),
(29, 0, 2, 1, 1, 26, NULL, NULL, 'catalog/thn.jpg'),
(30, 0, 2, 1, 1, 27, NULL, NULL, 'catalog/ban.jpg'),
(31, 0, 2, 1, 1, 28, NULL, NULL, 'catalog/hd.jpg'),
(32, 0, 2, 1, 1, 30, NULL, NULL, ''),
(33, 0, 2, 1, 1, 31, NULL, NULL, ''),
(34, 0, 2, 1, 1, 32, NULL, NULL, ''),
(35, 0, 2, 0, 1, 33, NULL, NULL, ''),
(36, 0, 2, 0, 1, 34, NULL, NULL, ''),
(37, 0, 2, 0, 1, 35, NULL, NULL, ''),
(38, 0, 2, 0, 1, 36, NULL, NULL, ''),
(39, 0, 2, 0, 1, 37, NULL, NULL, ''),
(40, 0, 2, 0, 1, 38, NULL, NULL, ''),
(41, 0, 2, 0, 1, 39, NULL, NULL, ''),
(42, 0, 2, 0, 1, 40, NULL, NULL, ''),
(43, 0, 1, 0, 1, 41, NULL, NULL, ''),
(44, 0, 0, 0, 1, 42, NULL, NULL, ''),
(45, 0, 0, 1, 1, 43, NULL, NULL, ''),
(46, 0, 0, 1, 1, 46, NULL, NULL, ''),
(47, 0, 0, 1, 1, 44, NULL, NULL, ''),
(48, 0, 0, 1, 1, 45, NULL, NULL, ''),
(49, 0, 0, 1, 1, 47, NULL, NULL, ''),
(50, 0, 0, 1, 1, 47, NULL, NULL, ''),
(51, 0, 0, 1, 1, 51, NULL, NULL, ''),
(52, 0, 0, 1, 1, 48, NULL, NULL, ''),
(53, 0, 0, 1, 1, 49, NULL, NULL, ''),
(54, 0, 0, 1, 1, 50, NULL, NULL, ''),
(55, 0, 0, 1, 1, 52, NULL, NULL, ''),
(56, 0, 0, 1, 1, 53, NULL, NULL, ''),
(57, 0, 0, 1, 1, 54, NULL, NULL, ''),
(58, 0, 0, 1, 1, 55, NULL, NULL, ''),
(59, 0, 0, 1, 1, 56, NULL, NULL, ''),
(60, 0, 1, 1, 1, 57, NULL, NULL, ''),
(61, 0, 1, 1, 1, 58, NULL, NULL, ''),
(62, 0, 1, 1, 1, 59, NULL, NULL, ''),
(63, 0, 1, 1, 1, 60, NULL, NULL, ''),
(64, 0, 1, 1, 1, 61, NULL, NULL, ''),
(65, 0, 1, 1, 1, 62, NULL, NULL, ''),
(66, 0, 2, 1, 1, 63, NULL, NULL, ''),
(67, 0, 2, 1, 1, 64, NULL, NULL, ''),
(68, 0, 2, 1, 1, 65, NULL, NULL, ''),
(69, 0, 2, 1, 1, 66, NULL, NULL, ''),
(70, 0, 2, 1, 1, 67, NULL, NULL, ''),
(71, 0, 2, 1, 1, 68, NULL, NULL, ''),
(72, 0, 2, 1, 1, 71, NULL, NULL, ''),
(73, 0, 2, 1, 1, 69, NULL, NULL, ''),
(74, 0, 2, 1, 1, 70, NULL, NULL, ''),
(75, 0, 2, 1, 1, 72, NULL, NULL, ''),
(76, 0, 2, 1, 1, 73, NULL, NULL, ''),
(77, 0, 2, 0, 1, 74, NULL, NULL, ''),
(78, 0, 2, 0, 1, 75, NULL, NULL, ''),
(79, 0, 2, 0, 1, 76, NULL, NULL, ''),
(80, 0, 2, 0, 1, 77, NULL, NULL, ''),
(81, 0, 2, 0, 1, 78, NULL, NULL, ''),
(82, 0, 2, 0, 1, 79, NULL, NULL, ''),
(83, 0, 2, 0, 1, 80, NULL, NULL, ''),
(84, 0, 1, 0, 1, 81, NULL, NULL, ''),
(85, 0, 1, 1, 1, 82, NULL, NULL, ''),
(86, 0, 0, 1, 1, 83, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_branch_description`
--

CREATE TABLE `ks_branch_description` (
  `branch_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `car_park` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_branch_description`
--

INSERT INTO `ks_branch_description` (`branch_id`, `language_id`, `title`, `phone`, `car_park`, `description`, `lat`, `lng`, `meta_title`, `meta_description`, `meta_keyword`, `address`) VALUES
(3, 2, 'KINGSPORT NAM SÀI GÒN', '(028) 5431 6511', NULL, '&lt;p&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; background-color: rgb(255, 255, 255); font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Địa chỉ:&lt;/span&gt;&amp;nbsp;Số 161A-163-165 Đường số 9A, Khu Dân Cư Trung Sơn, Bình Chánh&lt;/a&gt;&lt;br&gt;&lt;/p&gt;', 10.734947462040745, 106.68970629572868, 'KINGSPORT NAM SÀI GÒN', '', '', ''),
(4, 2, 'KINGSPORT TÂN PHÚ - TP.HCM', '(028) 6658 9910', NULL, '&lt;p&gt;KINGSPORT TÂN PHÚ - TP.HCM&lt;/p&gt;', 10.77853, 106.63489800000002, 'KINGSPORT TÂN PHÚ - TP.HCM', '', '', ''),
(5, 2, 'KINGSPORT BIGC TRƯỜNG CHINH', '(028)66 561 230', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BIGC TRƯỜNG CHINH&lt;/a&gt;&lt;/h3&gt;', 10.806421154296986, 106.63439649073791, 'KINGSPORT BIGC TRƯỜNG CHINH', '', '', 'L?u 1 Siêu Th? BigC Pandora - Tr??ng Chinh, Q. Tân Phú'),
(6, 2, 'KINGSPORT QUẬN 5 - TP.HCM', '(028) 62 71 79 43', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT QUẬN 5 - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.754412245623113, 106.66862079685052, 'KINGSPORT QUẬN 5 - TP.HCM', '', '', ''),
(7, 2, 'KINGSPORT BIÊN HÒA - ĐỒNG NAI', '(0251) 3823 648', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BIÊN HÒA - ĐỒNG NAI&lt;/a&gt;&lt;/h3&gt;', 10.963347395000474, 106.839850632869, 'KINGSPORT BIÊN HÒA - ĐỒNG NAI', '', '', '410 Nguyễn Ái Quốc, P. Tân Tiến, TP. Biên Hòa'),
(8, 2, 'KINGSPORT THỦ ĐỨC-TP.HCM', '(028) 6680 0344', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT THỦ ĐỨC-TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.855327201923743, 106.75547025169521, 'KINGSPORT THỦ ĐỨC-TP.HCM', '', '', '769 Kha Vạn Cân, P. Linh Tây, Q. Thủ Đức'),
(9, 2, 'KINGSPORT PHÚ NHUẬN - TP.HCM', '(028)6658 6131', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT PHÚ NHUẬN - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.799523, 106.67785300000003, 'KINGSPORT PHÚ NHUẬN - TP.HCM', '', '', '82 Hoàng Văn Thụ, P. 9, Q. Phú Nhuận'),
(10, 2, 'KINGSPORT TDM- BÌNH DƯƠNG', '(0274) 3825 952', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TDM- BÌNH DƯƠNG&lt;/a&gt;&lt;/h3&gt;', 10.987496479747795, 106.6650424565529, 'KINGSPORT TDM- BÌNH DƯƠNG', '', '', '458 Đại Lộ Bình Dương, P. Hiệp Thành, TP. Thủ Dầu Một'),
(11, 2, 'KINGSPORT VŨNG TÀU', ' (0254) 380 7191', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT VŨNG TÀU&lt;/a&gt;&lt;/h3&gt;', 10.345196541720016, 107.08363188186195, 'KINGSPORT VŨNG TÀU', '', '', '39 Nam Kỳ Khởi Nghĩa, P.3, Tp. Vũng Tàu'),
(12, 2, 'KINGSPORT TÂY NINH', '(0276) 6559 667', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TÂY NINH&lt;/a&gt;&lt;/h3&gt;', 11.306995393101747, 106.1229894012406, 'KINGSPORT TÂY NINH', '', '', '954 Cách Mạng Tháng Tám, P.4, TP.Tây Ninh'),
(13, 2, 'KINGSPORT TIỀN GIANG', '(0273) 6577 163', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TIỀN GIANG&lt;/a&gt;&lt;/h3&gt;', 10.364818980729261, 106.34076998518071, 'KINGSPORT TIỀN GIANG', '', '', '163 Nguyễn Thị Thập, P. 5. Tp. Mỹ Tho'),
(14, 2, 'KINGSPORT ĐỒNG THÁP', '(0277) 6506 050', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐỒNG THÁP&lt;/a&gt;&lt;/h3&gt;', 10.474007568199939, 105.64596582275385, 'KINGSPORT ĐỒNG THÁP', '', '', '276-278 Điện Biên Phủ, P. Mỹ Phú, TP. Cao Lãnh'),
(15, 2, 'KINGSPORT HẬU GIANG', '(037)366 9090', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HẬU GIANG&lt;/a&gt;&lt;/h3&gt;', 9.767677, 105.4634302, 'KINGSPORT HẬU GIANG', '', '', '96-98 Lê Quý Đôn, KV1, P.3, Thành phố Vị thanh'),
(16, 2, 'KINGSPORT KIÊN GIANG', '(0297)6537 393', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT KIÊN GIANG&lt;/a&gt;&lt;/h3&gt;', 9.99125062366415, 105.08741732747808, 'KINGSPORT KIÊN GIANG', '', '', 'Lô D5 29-30, Đường 3/2, P. Vĩnh Lạc, Tp. Rạch Giá'),
(17, 2, 'KINGSPORT ĐÀ NẴNG', '(0236) 655 8792', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐÀ NẴNG&lt;/a&gt;&lt;/h3&gt;', 16.076575516407974, 108.21582182609484, 'KINGSPORT ĐÀ NẴNG', '', '', '280 Đống Đa, P. Thanh Bình, Q. Hải Châu'),
(18, 2, 'KINGSPORT BẠC LIÊU', '(0291) 6555 755', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BẠC LIÊU&lt;/a&gt;&lt;/h3&gt;', 9.300056439061438, 105.72355472554773, 'KINGSPORT BẠC LIÊU', '', '', '99 Võ Văn Kiệt, Phường 1, TP.Bạc Liêu'),
(19, 2, 'KINGSPORT HUẾ', '(0234) 6272 777', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HUẾ&lt;/a&gt;&lt;/h3&gt;', 16.45675570276807, 107.61075860830078, 'KINGSPORT HUẾ', '', '', 'Tòa nhà Văn Phòng, ĐS 7, KĐT mới An Cựu, P. An Đông, Tp. Huế'),
(20, 2, 'KINGSPORT BÌNH ĐỊNH', '(0256)6505 777', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BÌNH ĐỊNH&lt;/a&gt;&lt;/h3&gt;', 13.762349484733615, 109.20160759048656, 'KINGSPORT BÌNH ĐỊNH', '', '', '424 Tây Sơn, P. Quang Trung, Tp. Quy Nhơn'),
(21, 2, 'KINGSPORT CAM RANH', '(0258) 2210 068', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT CAM RANH&lt;/a&gt;&lt;/h3&gt;', 11.912244567101437, 109.13161684746956, 'KINGSPORT CAM RANH', '', '', '2621 Hùng Vương, P.Ba Ngòi, TP. Cam Ranh'),
(22, 2, 'KINGSPORT GIA LAI', '(0269) 653 6373', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT GIA LAI&lt;/a&gt;&lt;/h3&gt;', 13.9669072, 108.0170587, 'KINGSPORT GIA LAI', '', '', '77 Trường Chinh, phường Trà Bá, Thành phố Pleiku'),
(23, 2, 'KINGSPORT BẢO LỘC', '(0263) 6272 925', NULL, '&lt;p&gt;KINGSPORT BẢO LỘC&lt;br&gt;&lt;/p&gt;', 11.548964417984687, 107.81491914742128, 'KINGSPORT BẢO LỘC', '', '', 'Lô 48 Dãy CH2A, Nguyễn Công Trứ, P1, Tp. Bảo Lộc'),
(24, 2, 'KINGSPORT CẦU GIẤY -HN', '18006824', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT CẦU GIẤY -HN&lt;/a&gt;&lt;/h3&gt;', 21.0444578, 105.80531489999998, 'KINGSPORT CẦU GIẤY -HN', '', '', '96 Nguyễn Đình Hoàn, P. Nghĩa Đô, Q. Cầu Giấy, Hà Nội'),
(25, 2, 'KINGSPORT LONG BIÊN -HN', '024 3652 3464', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT LONG BIÊN -HN&lt;/a&gt;&lt;/h3&gt;', 21.053963474702364, 105.90282594529117, 'KINGSPORT LONG BIÊN -HN', '', '', '59 phố Việt Hưng, P. Việt Hưng, Q. Long Biên, Hà Nội'),
(26, 2, 'KINGSPORT BẮC TỪ LIÊM -HN', '024 6685 2424', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BẮC TỪ LIÊM -HN&lt;/a&gt;&lt;/h3&gt;', 21.056179749790925, 105.73052537829585, 'KINGSPORT BẮC TỪ LIÊM -HN', '', '', ' 86-88 Phố Nhổn, P. Tây Tựu, Q. Bắc Từ Liêm, Hà Nội'),
(27, 2, 'KINGSPORT ĐỐNG ĐA-HN', '(024) 6656 6424', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐỐNG ĐA-HN&lt;/a&gt;&lt;/h3&gt;', 21.023528864207567, 105.83233052334822, 'KINGSPORT ĐỐNG ĐA-HN', '', '', '119 Phố Tôn Đức Thắng, P. Hàng Bột, Q. Đống Đa, Đống Đa, Hà Nội'),
(28, 2, 'KINGSPORT NGHỆ AN', '(0238) 6677 778', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT NGHỆ AN&lt;/a&gt;&lt;/h3&gt;', 18.674485505267047, 105.69823028566668, 'KINGSPORT NGHỆ AN', '', '', '7 Mai Hắc Đế, Phường Quán Bàu, TP Vinh, Nghệ An'),
(29, 2, 'KINGSPORT THÁI NGUYÊN', '(0208) 6339 988', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT THÁI NGUYÊN&lt;/a&gt;&lt;/h3&gt;', 21.585760522050784, 105.82583241676332, 'KINGSPORT THÁI NGUYÊN', '', '', '373 Hoàng Văn Thụ, TP. Thái Nguyên'),
(30, 2, 'KINGSPORT BẮC NINH', '(0222) 650 2323', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BẮC NINH&lt;/a&gt;&lt;/h3&gt;', 21.19655393147587, 106.08698905896904, 'KINGSPORT BẮC NINH', '', '', '404 Lý Thường Kiệt, P. Thị Cầu, TP. Bắc Ninh, TP. Bắc Ninh'),
(31, 2, 'KINGSPORT HẢI DƯƠNG', '(0220) 6524 566', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HẢI DƯƠNG&lt;/a&gt;&lt;/h3&gt;', 20.9208597, 106.32112740000002, 'KINGSPORT HẢI DƯƠNG', '', '', '1029 Lê Thanh Nghị, P. Hải Tân, TP. Hải Dương'),
(32, 2, 'KINGSPORT NAM ĐỊNH', '(0228)658 3939', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT NAM ĐỊNH&lt;/a&gt;&lt;/h3&gt;', 20.4376491, 106.180027, 'KINGSPORT NAM ĐỊNH', '', '', '(0228)658 3939'),
(33, 2, 'KINGSPORT ĐÔNG TRIỀU - QUẢNG NINH', '(0203) 6286 663', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐÔNG TRIỀU - QUẢNG NINH&lt;/a&gt;&lt;/h3&gt;', 21.0549167, 106.6034995, 'KINGSPORT ĐÔNG TRIỀU - QUẢNG NINH', '', '', 'Khu Hoàng Hoa Thám, TT Mạo Khê, TX Đông Triều'),
(34, 2, 'KINGSPORT Hà NAM', '(0226) 654 3333', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT Hà NAM&lt;/a&gt;&lt;/h3&gt;', 20.5452374, 105.9151426, 'KINGSPORT Hà NAM', '', '', '16 Châu Cầu, P.Lương Khánh Thiện, Thành phố Phủ Lý'),
(35, 2, 'KINGSPORT NINH BÌNH', '(0229) 6286 860', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT NINH BÌNH&lt;/a&gt;&lt;/h3&gt;', 20.2499876, 105.974034, 'KINGSPORT NINH BÌNH', '', '', '10 Nguyễn Công Trứ, Phố Vườn Hoa, TP. Ninh Bình'),
(36, 2, 'KINGSPORT SƠN LA', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT SƠN LA&lt;/a&gt;&lt;/h3&gt;', 20.2499876, 105.974034, 'KINGSPORT SƠN LA', '', '', '10 Nguyễn Công Trứ, Phố Vườn Hoa, TP. Ninh Bình'),
(37, 2, 'KINGSPORT LAI CHÂU', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT LAI CHÂU&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT LAI CHÂU', '', '', 'Thành phố Lai Châu'),
(38, 2, 'KINGSPORT YÊN BÁI', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT YÊN BÁI&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT YÊN BÁI', '', '', 'Thành phố Yên Bái'),
(39, 2, 'KINGSPORT TUYÊN QUANG', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TUYÊN QUANG&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT TUYÊN QUANG', '', '', 'Thành phố Tuyên Quang'),
(40, 2, 'KINGSPORT BẮC KẠN', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BẮC KẠN&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT BẮC KẠN', '', '', 'Thành phố Bắc Kạn'),
(41, 2, 'KINGSPORT BẮC GIANG', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BẮC GIANG&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT BẮC GIANG', '', '', 'Thành phố Bắc Giang'),
(42, 2, 'KINGSPORT PHÚ YÊN', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT PHÚ YÊN&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT PHÚ YÊN', '', '', 'Thành phố Tuy Hòa'),
(43, 2, 'KINGSPORT KON TUM', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT KON TUM&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT KON TUM', '', '', 'Thành phố Kon Tum'),
(44, 2, 'KINGSPORT CÀ MAU', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT CÀ MAU&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT CÀ MAU', '', '', 'Thành phố Cà Mau'),
(45, 2, 'KINGSPORT TÂN BÌNH - TP.HCM', '(028) 66 80 83 76', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TÂN BÌNH - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.79128, 106.65593799999999, 'KINGSPORT TÂN BÌNH - TP.HCM', '', '', '1051-1053 Cách Mạng Tháng 8, P.7, Q. Tân Bình'),
(46, 2, 'KINGSPORT GÒ VẤP-TP.HCM', '(028)6286 6216', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT GÒ VẤP-TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.829509, 106.68090800000004, 'KINGSPORT GÒ VẤP-TP.HCM', '', '', '901-903 Phan Văn Trị, P. 7, Q. Gò Vấp'),
(47, 2, 'KINGSPORT BÌNH TÂN - TP.HCM', '(028) 6650 2909', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BÌNH TÂN - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.768587186369617, 106.60965534418028, 'KINGSPORT BÌNH TÂN - TP.HCM', '', '', '206 Bình Trị Đông( Đất Mới ), P. Bình Trị Đông, Q. Bình Tân'),
(48, 2, 'KINGSPORT QUẬN 6 - TP.HCM', '(028) 6271 0298', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT QUẬN 6 - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.754412245623113, 106.66862079685052, 'KINGSPORT QUẬN 6 - TP.HCM', '', '', '167A Nguyễn Văn Luông, P. 10, Quận 6'),
(49, 2, 'KINGSPORT BÌNH THẠNH - TP.HCM', '(028) 6258 2298', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BÌNH THẠNH - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.800333, 106.70859700000005, 'KINGSPORT BÌNH THẠNH - TP.HCM', '', '', '384 Điện Biên Phủ, P. 17, Q. Bình Thạnh'),
(50, 2, 'KINGSPORT QUẬN 12 - TP.HCM', '(028) 3589 5679', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT QUẬN 12 - TP.HCM&lt;/a&gt;&lt;/h3&gt;', 10.862824224385124, 106.61678323677063, 'KINGSPORT QUẬN 12 - TP.HCM', '', '', '504A Tô Ký, P.Tân Chánh Hiệp, Q.12'),
(51, 2, 'KINGSPORT LONG AN', '(0272) 658 6939', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT LONG AN&lt;/a&gt;&lt;/h3&gt;', 10.545604591377302, 106.40124883743454, 'KINGSPORT LONG AN', '', '', '122-124 Hùng Vương (nối dài), Phường 6, TP. Tân An'),
(52, 2, 'KINGSPORT THUẬN AN- BÌNH DƯƠNG', '(0274) 652 0274', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT THUẬN AN- BÌNH DƯƠNG&lt;/a&gt;&lt;/h3&gt;', 10.905980117759315, 106.73151248632985, 'KINGSPORT THUẬN AN- BÌNH DƯƠNG', '', '', '123/1/10A đường TL743B, KP Đồng An 3, P.Bình Hoà, Tx Thuận An'),
(53, 2, 'KINGSPORT BÌNH PHƯỚC', '(0271) 6500 775', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BÌNH PHƯỚC&lt;/a&gt;&lt;/h3&gt;', 10.862824224385124, 106.61678323677063, 'KINGSPORT BÌNH PHƯỚC', '', '', '749 QL. 14 - P. Tân Bình - TX.Đồng Xoài - Bình Phước'),
(54, 2, 'KINGSPORT BÀ RỊA', '(0254) 6530 647', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BÀ RỊA&lt;/a&gt;&lt;/h3&gt;', 10.503749, 107.17499169999996, 'KINGSPORT BÀ RỊA', '', '', '67 Hùng Vương, Khu Phố 7, P. Phước Hưng, TP. BRVT'),
(55, 2, 'KINGSPORT CẦN THƠ', '(0292) 373 5093', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT CẦN THƠ&lt;/a&gt;&lt;/h3&gt;', 10.022460446488934, 105.74400162862207, 'KINGSPORT CẦN THƠ', '', '', '279AA Nguyễn Văn Cừ, KDC Cái Sơn- Hàng Bàng, Q.Ninh Kiều'),
(56, 2, 'KINGSPORT AN GIANG', '(0296) 6299 236', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT AN GIANG&lt;/a&gt;&lt;/h3&gt;', 10.369825851105961, 105.44608956879199, 'KINGSPORT AN GIANG', '', '', '152/5 Trần Hưng Đạo, P. Mỹ Phước, TP. Long Xuyên'),
(57, 2, 'KINGSPORT VĨNH LONG', '(0270) 6536 365', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT VĨNH LONG&lt;/a&gt;&lt;/h3&gt;', 10.230945, 105.95548800000006, 'KINGSPORT VĨNH LONG', '', '', '138C Đinh Tiên Hoàng, P.8, TP. Vĩnh Long'),
(58, 2, 'KINGSPORT SÓC TRĂNG', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hcm1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT SÓC TRĂNG&lt;/a&gt;&lt;/h3&gt;', 9.300056439061438, 105.72355472554773, 'KINGSPORT SÓC TRĂNG', '', '', '29 Lê Hồng Phong, phường 3, Sóc Trăng'),
(59, 2, 'KINGSPORT BẾN TRE', '(0275) 6598 986', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT BẾN TRE&lt;/a&gt;&lt;/h3&gt;', 10.2579464, 106.3609975, 'KINGSPORT BẾN TRE', '', '', '36 Đại Lộ Đồng Khởi, P.Phú Tân, TP.Bến Tre'),
(60, 2, 'KINGSPORT QUẢNG BÌNH', '(0232) 6280 280', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT QUẢNG BÌNH&lt;/a&gt;&lt;/h3&gt;', 17.48106163354731, 106.61570480845944, 'KINGSPORT QUẢNG BÌNH', '', '', '179 Lý Thường Kiệt, phường Đồng Phú, TP. Đồng Hới, Quảng Bình'),
(61, 2, 'KINGSPORT QUẢNG NGÃI', '(0255) 6553 000', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT QUẢNG NGÃI&lt;/a&gt;&lt;/h3&gt;', 15.1209175, 108.78806959999997, 'KINGSPORT QUẢNG NGÃI', '', '', '200 Hùng Vương, P. Trần Phú, Tp. Quảng Ngãi'),
(62, 2, 'KINGSPORT NHA TRANG', '(0258) 6253 538', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT NHA TRANG&lt;/a&gt;&lt;/h3&gt;', 12.238070167165441, 109.18265574047541, 'KINGSPORT NHA TRANG', '', '', '32 Cửu Long, P. Phước Hòa, TP. Nha Trang'),
(63, 2, 'KINGSPORT PHAN THIẾT', '(0252)6506 508', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT PHAN THIẾT&lt;/a&gt;&lt;/h3&gt;', 10.932935874292088, 108.11458000555729, 'KINGSPORT PHAN THIẾT', '', '', '262 Thủ Khoa Huân, P. Phú Thủy, TP.Phan Thiết'),
(64, 2, 'KINGSPORT ĐẮK LẮK', '(0262) 3571 777', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐẮK LẮK&lt;/a&gt;&lt;/h3&gt;', 12.688150404252799, 108.05171430443806, 'KINGSPORT ĐẮK LẮK', '', '', 'C3-C5 Nguyễn Đình Chiểu, P. Tân Lợi, TP. Buôn Ma Thuột'),
(65, 2, 'KINGSPORT ĐÀ LẠT', '(0263)6253 627', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;tn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐÀ LẠT&lt;/a&gt;&lt;/h3&gt;', 11.9436111, 108.4327614, 'KINGSPORT ĐÀ LẠT', '', '', '49 Hai Bà Trưng, Phường 6, Tp. Đà Lạt'),
(66, 2, 'KINGSPORT HÀ ĐÔNG -HN', '024 3225 2131', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HÀ ĐÔNG -HN&lt;/a&gt;&lt;/h3&gt;', 20.965082504201455, 105.79325770202172, 'KINGSPORT HÀ ĐÔNG -HN', '', '', 'Lô E9 - E10 Tỉnh Lộ 70, Q. Thanh Trì (Ngã 3 Yên Xá)'),
(67, 2, 'KINGSPORT TÂY HỒ -HN', '024 6688 2433', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TÂY HỒ -HN&lt;/a&gt;&lt;/h3&gt;', 21.064977, 105.82899900000007, 'KINGSPORT TÂY HỒ -HN', '', '', '145 Âu Cơ, P. Tứ Liên, Q. Tây Hồ, Hà Nội'),
(68, 2, 'KINGSPORT THANH XUÂN-HN', '(024) 6655 6424', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT THANH XUÂN-HN&lt;/a&gt;&lt;/h3&gt;', 20.9941928, 105.84136209999997, 'KINGSPORT THANH XUÂN-HN', '', '', '441 Giải Phóng, P. Phương Liệt, Q. Thanh Xuân, Hà Nội'),
(69, 2, 'KINGSPORT PHÚ THỌ', '(0210) 2476 999', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT PHÚ THỌ&lt;/a&gt;&lt;/h3&gt;', 10.804866895605, 106.64199984239, 'KINGSPORT PHÚ THỌ', '', '', '755 Đại Lộ Hùng Vương, P.Bến Gót, TP.Việt Trì, TP. Việt Trì, Phú Thọ'),
(70, 2, 'KINGSPORT VĨNH PHÚC', '(0211) 2477 999', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT VĨNH PHÚC&lt;/a&gt;&lt;/h3&gt;', 21.2893993, 105.57980880000002, 'KINGSPORT VĨNH PHÚC', '', '', '29 Lê Hồng Phong, P. Đồng Tâm, TP. Vĩnh Yên, Vĩnh Phúc'),
(71, 2, 'KINGSPORT HƯNG YÊN', '(0221) 652 5456', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HƯNG YÊN&lt;/a&gt;&lt;/h3&gt;', 21.2893993, 105.57980880000002, 'KINGSPORT HƯNG YÊN', '', '', '57 phố Chùa Chuông, P. Hiến Nam, Tp. Hưng Yên, TP. Hưng Yên'),
(72, 2, 'KINGSPORT HẠ LONG', '(0203) 6293 636', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HẠ LONG&lt;/a&gt;&lt;/h3&gt;', 20.95127020445574, 107.13582875037048, 'KINGSPORT HẠ LONG', '', '', '733 Vũ Văn Hiếu, Tổ 08, Khu 06, P. Hà Tu, TP. Hạ Long'),
(73, 2, 'KINGSPORT HÀ TĨNH', '(0239)656 6667', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HÀ TĨNH&lt;/a&gt;&lt;/h3&gt;', 18.3392017, 105.8882673, 'KINGSPORT HÀ TĨNH', '', '', 'Số nhà 33, Đường Lê Duẩn, P. Trần Phú, TP. Hà Tĩnh'),
(74, 2, 'KINGSPORT THANH HÓA', '(0237) 899 9996', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT THANH HÓA&lt;/a&gt;&lt;/h3&gt;', 19.813822903756368, 105.758019157425, 'KINGSPORT THANH HÓA', '', '', '789A Nguyễn Trãi, P. Phú Sơn, Tp. Thanh Hóa');
INSERT INTO `ks_branch_description` (`branch_id`, `language_id`, `title`, `phone`, `car_park`, `description`, `lat`, `lng`, `meta_title`, `meta_description`, `meta_keyword`, `address`) VALUES
(75, 2, 'KINGSPORT HẢI PHÒNG', '(0225) 2299 029', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HẢI PHÒNG&lt;/a&gt;&lt;/h3&gt;', 20.8340363, 106.6703313, 'KINGSPORT HẢI PHÒNG', '', '', '510 Nguyễn Văn Linh, Q. Lê Chân, Tp. Hải Phòng'),
(76, 2, 'KINGSPORT THÁI BÌNH', '(0227) 6547 666', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT THÁI BÌNH&lt;/a&gt;&lt;/h3&gt;', 20.4438593, 106.3245431, 'KINGSPORT THÁI BÌNH', '', '', '447B Trần Thái Tông, P. Trần Hưng Đạo, Thành phố Thái Bình'),
(77, 2, 'KINGSPORT HÒA BÌNH', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HÒA BÌNH&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT HÒA BÌNH', '', '', 'Thành phố Hòa Bình'),
(78, 2, 'KINGSPORT ĐIỆN BIÊN', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐIỆN BIÊN&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT ĐIỆN BIÊN', '', '', 'Thành phố Điện Biên Phủ'),
(79, 2, 'KINGSPORT LÀO CAI', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT LÀO CAI&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT LÀO CAI', '', '', 'Thành phố Lào Cai'),
(80, 2, 'KINGSPORT HÀ GIANG', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT HÀ GIANG&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT HÀ GIANG', '', '', 'Thành phố Hà Giang'),
(81, 2, 'KINGSPORT CAO BẰNG', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT CAO BẰNG&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT CAO BẰNG', '', '', 'Thành phố Cao Bằng'),
(82, 2, 'KINGSPORT LẠNG SƠN', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT LẠNG SƠN&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT LẠNG SƠN', '', '', 'Thành phố Lạng Sơn'),
(83, 2, 'KINGSPORT QUẢNG TRỊ', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT QUẢNG TRỊ&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT QUẢNG TRỊ', '', '', 'Thành phố Đông Hà'),
(84, 2, 'KINGSPORT NINH THUẬN', '1800 6862', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT NINH THUẬN&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT NINH THUẬN', '', '', 'Thành phố Phan Rang - Tháp Chàm'),
(85, 2, 'KINGSPORT ĐẮK NÔNG', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT ĐẮK NÔNG&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT ĐẮK NÔNG', '', '', 'Thị xã Gia Nghĩa'),
(86, 2, 'KINGSPORT TRÀ VINH', '1800 68 62', NULL, '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(255, 0, 0); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 1.2em; padding: 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html#&quot; class=&quot;hn1&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: inherit;&quot;&gt;KINGSPORT TRÀ VINH&lt;/a&gt;&lt;/h3&gt;', 0, 0, 'KINGSPORT TRÀ VINH', '', '', 'Thành phố Trà Vinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_branch_image`
--

CREATE TABLE `ks_branch_image` (
  `branch_image_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_branch_image`
--

INSERT INTO `ks_branch_image` (`branch_image_id`, `branch_id`, `image`, `sort_order`) VALUES
(77, 6, 'catalog/q54.jpg', 4),
(29, 3, 'catalog/nsg4.jpg', 4),
(28, 3, 'catalog/nsg3.jpg', 3),
(27, 3, 'catalog/nsg2.jpg', 2),
(26, 3, 'catalog/nsg1.jpg', 1),
(81, 4, 'catalog/tp4.jpg', 4),
(80, 4, 'catalog/tp3.jpg', 3),
(79, 4, 'catalog/tp2.jpg', 2),
(78, 4, 'catalog/tp1.jpg', 1),
(76, 6, 'catalog/q53.jpg', 3),
(75, 6, 'catalog/q52.jpg', 2),
(74, 6, 'catalog/q51.jpg', 1),
(37, 5, 'catalog/tc4.jpg', 4),
(36, 5, 'catalog/tc3.jpg', 3),
(35, 5, 'catalog/tc2.jpg', 2),
(34, 5, 'catalog/tc1.jpg', 1),
(73, 9, 'catalog/pn4.jpg', 4),
(72, 9, 'catalog/pn3.jpg', 3),
(71, 9, 'catalog/pn2.jpg', 2),
(70, 9, 'catalog/pn1.jpg', 1),
(89, 8, 'catalog/td4.jpg', 4),
(88, 8, 'catalog/td3.jpg', 3),
(87, 8, 'catalog/td2.jpg', 2),
(86, 8, 'catalog/td1.jpg', 1),
(65, 7, 'catalog/dn4.jpg', 4),
(64, 7, 'catalog/dn3.jpg', 3),
(63, 7, 'catalog/dn2.jpg', 2),
(62, 7, 'catalog/dn1.jpg', 1),
(85, 10, 'catalog/bd4.jpg', 4),
(84, 10, 'catalog/bd3.jpg', 3),
(83, 10, 'catalog/bd2.jpg', 2),
(82, 10, 'catalog/bd1.jpg', 1),
(58, 11, 'catalog/vt1.jpg', 1),
(59, 11, 'catalog/vt2.jpg', 2),
(60, 11, 'catalog/vt3.jpg', 3),
(61, 11, 'catalog/vt4.jpg', 4),
(90, 12, 'catalog/tn1.jpg', 1),
(91, 12, 'catalog/tn2.jpg', 2),
(92, 12, 'catalog/tn3.jpg', 3),
(93, 12, 'catalog/tn4.jpg', 4),
(113, 13, 'catalog/tg4.jpg', 4),
(112, 13, 'catalog/tg3.jpg', 3),
(111, 13, 'catalog/tg2.jpg', 2),
(110, 13, 'catalog/tg1.jpg', 1),
(109, 14, 'catalog/dt4.png', 4),
(108, 14, 'catalog/dt3.png', 3),
(107, 14, 'catalog/dt2.png', 2),
(106, 14, 'catalog/dt1.png', 1),
(114, 13, 'catalog/tg5.jpg', 5),
(134, 15, 'catalog/hg4.jpg', 4),
(133, 15, 'catalog/hg3.jpg', 3),
(132, 15, 'catalog/hg2.jpg', 2),
(131, 15, 'catalog/hg1.jpg', 1),
(119, 16, 'catalog/kg1.jpg', 1),
(120, 16, 'catalog/kg2.jpg', 2),
(121, 16, 'catalog/kg3.jpg', 3),
(122, 16, 'catalog/kg4.jpg', 4),
(150, 17, 'catalog/dng4.jpg', 4),
(149, 17, 'catalog/dng3.jpg', 3),
(148, 17, 'catalog/dng2.jpg', 2),
(147, 17, 'catalog/dng1.jpg', 1),
(127, 18, 'catalog/bl1.jpg', 1),
(128, 18, 'catalog/bl2.jpg', 2),
(129, 18, 'catalog/bl3.jpg', 3),
(130, 18, 'catalog/bl4.png', 4),
(139, 19, 'catalog/h1.jpg', 1),
(140, 19, 'catalog/h2.jpg', 2),
(141, 19, 'catalog/h3.jpg', 3),
(142, 19, 'catalog/h4.jpg', 4),
(152, 20, 'catalog/bdi2.png', 2),
(151, 20, 'catalog/bdi1.png', 1),
(153, 20, 'catalog/bdi3.png', 3),
(154, 20, 'catalog/bdi4.png', 4),
(155, 21, 'catalog/car1.jpg', 1),
(156, 21, 'catalog/car2.jpg', 2),
(157, 21, 'catalog/car3.jpg', 3),
(158, 21, 'catalog/car4.jpg', 4),
(159, 22, 'catalog/gl1.jpg', 1),
(160, 22, 'catalog/gl2.jpg', 2),
(161, 22, 'catalog/gl3.jpg', 3),
(162, 22, 'catalog/gl4.jpg', 4),
(163, 23, 'catalog/bal1.jpg', 1),
(164, 23, 'catalog/bal2.jpg', 2),
(165, 23, 'catalog/bal3.jpg', 3),
(166, 23, 'catalog/bal4.jpg', 4),
(167, 24, 'catalog/cghn1.jpg', 1),
(168, 24, 'catalog/cghn2.jpg', 2),
(169, 24, 'catalog/cghn3.jpg', 3),
(170, 24, 'catalog/cghn4.jpg', 4),
(171, 25, 'catalog/lbhn1.jpg', 1),
(172, 25, 'catalog/lbhn2.jpg', 2),
(173, 25, 'catalog/lbhn3.jpg', 3),
(174, 25, 'catalog/lbhn4.jpg', 4),
(175, 26, 'catalog/tlhn1.jpg', 1),
(176, 26, 'catalog/tlhn2.jpg', 2),
(177, 26, 'catalog/tlhn3.jpg', 3),
(178, 26, 'catalog/tlhn4.jpg', 4),
(179, 27, 'catalog/ddhn1.jpg', 1),
(180, 27, 'catalog/ddhn2.jpg', 2),
(181, 27, 'catalog/ddhn3.jpg', 3),
(182, 27, 'catalog/ddhn4.jpg', 4),
(202, 28, 'catalog/na4.png', 4),
(201, 28, 'catalog/na3.jpg', 3),
(200, 28, 'catalog/na2.jpg', 2),
(199, 28, 'catalog/na1.jpg', 1),
(187, 29, 'catalog/thn1.jpg', 1),
(188, 29, 'catalog/thn2.jpg', 2),
(189, 29, 'catalog/thn3.jpg', 3),
(190, 29, 'catalog/thn4.jpg', 4),
(191, 30, 'catalog/ban1.jpg', 1),
(192, 30, 'catalog/ban2.jpg', 2),
(193, 30, 'catalog/ban3.jpg', 3),
(194, 30, 'catalog/ban4.jpg', 4),
(195, 31, 'catalog/hd1.jpg', 1),
(196, 31, 'catalog/hd2.jpg', 2),
(197, 31, 'catalog/hd3.jpg', 3),
(198, 31, 'catalog/hd4.jpg', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_branch_to_layout`
--

CREATE TABLE `ks_branch_to_layout` (
  `branch_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_branch_to_layout`
--

INSERT INTO `ks_branch_to_layout` (`branch_id`, `store_id`, `layout_id`) VALUES
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(21, 0, 0),
(22, 0, 0),
(23, 0, 0),
(24, 0, 0),
(25, 0, 0),
(26, 0, 0),
(27, 0, 0),
(28, 0, 0),
(29, 0, 0),
(30, 0, 0),
(31, 0, 0),
(32, 0, 0),
(33, 0, 0),
(34, 0, 0),
(35, 0, 0),
(36, 0, 0),
(37, 0, 0),
(38, 0, 0),
(39, 0, 0),
(40, 0, 0),
(41, 0, 0),
(42, 0, 0),
(43, 0, 0),
(44, 0, 0),
(45, 0, 0),
(46, 0, 0),
(47, 0, 0),
(48, 0, 0),
(49, 0, 0),
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(53, 0, 0),
(54, 0, 0),
(55, 0, 0),
(56, 0, 0),
(57, 0, 0),
(58, 0, 0),
(59, 0, 0),
(60, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_branch_to_store`
--

CREATE TABLE `ks_branch_to_store` (
  `branch_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_branch_to_store`
--

INSERT INTO `ks_branch_to_store` (`branch_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_cart`
--

CREATE TABLE `ks_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_category`
--

CREATE TABLE `ks_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_category`
--

INSERT INTO `ks_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2019-06-23 13:52:23'),
(27, '', 20, 0, 1, 1, 1, '2009-01-31 01:55:34', '2019-06-23 14:12:16'),
(20, 'catalog/300_crop_avatar-1.jpg', 0, 1, 0, 1, 1, '2009-01-05 21:49:43', '2019-06-23 22:45:34'),
(71, '', 70, 0, 1, 1, 1, '2019-06-23 14:36:11', '2019-06-23 14:36:11'),
(18, 'catalog/300_crop_ghe-massage-toan-than-kingsport-g22-1-600x600.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2019-06-23 13:40:46'),
(70, '', 0, 1, 1, 5, 1, '2019-06-23 14:34:55', '2019-06-23 14:34:55'),
(28, '', 25, 0, 2, 2, 1, '2009-02-02 13:11:12', '2019-06-23 14:17:36'),
(26, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:14', '2019-06-23 14:16:06'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2019-06-23 14:17:51'),
(31, '', 29, 0, 1, 2, 1, '2009-02-03 14:17:24', '2019-06-23 14:34:15'),
(32, '', 29, 0, 1, 1, 1, '2009-02-03 14:17:34', '2019-06-23 14:34:03'),
(63, '', 60, 0, 1, 2, 1, '2019-06-23 14:25:25', '2019-06-23 14:25:25'),
(62, '', 60, 0, 1, 2, 1, '2019-06-23 14:21:47', '2019-06-23 14:21:47'),
(35, '', 28, 0, 2, 1, 1, '2010-09-17 10:06:48', '2019-06-23 14:33:41'),
(36, '', 28, 0, 2, 2, 1, '2010-09-17 10:07:13', '2019-06-23 14:33:20'),
(60, '', 59, 0, 1, 1, 1, '2019-06-23 14:20:07', '2019-06-23 14:20:07'),
(61, '', 60, 0, 1, 2, 1, '2019-06-23 14:20:59', '2019-06-23 14:20:59'),
(69, '', 64, 0, 1, 5, 1, '2019-06-23 14:30:33', '2019-06-23 14:32:34'),
(45, '', 18, 0, 0, 2, 1, '2010-09-24 18:29:16', '2019-06-23 13:46:08'),
(46, '', 18, 0, 0, 1, 1, '2010-09-24 18:29:31', '2019-06-23 14:16:38'),
(68, '', 64, 0, 1, 4, 1, '2019-06-23 14:30:03', '2019-06-23 14:32:20'),
(67, '', 64, 0, 1, 3, 1, '2019-06-23 14:29:28', '2019-06-23 14:32:06'),
(66, '', 64, 0, 1, 2, 1, '2019-06-23 14:28:58', '2019-06-23 14:28:58'),
(65, '', 64, 0, 1, 1, 1, '2019-06-23 14:28:10', '2019-06-23 14:31:48'),
(64, '', 59, 0, 1, 2, 1, '2019-06-23 14:26:27', '2019-06-23 14:26:27'),
(59, '', 0, 1, 1, 4, 1, '2019-06-23 14:19:15', '2019-06-23 14:23:37'),
(72, '', 71, 0, 1, 1, 1, '2019-06-23 14:37:42', '2019-06-23 14:37:42'),
(73, '', 71, 0, 1, 2, 1, '2019-06-23 14:38:35', '2019-06-23 14:38:35'),
(74, '', 71, 0, 1, 3, 1, '2019-06-23 14:39:29', '2019-06-23 14:39:29'),
(75, '', 71, 0, 1, 4, 1, '2019-06-23 14:40:19', '2019-06-23 14:40:19'),
(76, '', 71, 0, 1, 5, 1, '2019-06-23 14:41:05', '2019-06-23 14:41:05'),
(77, '', 71, 0, 1, 6, 1, '2019-06-23 14:41:59', '2019-06-23 14:41:59'),
(78, '', 71, 0, 1, 7, 1, '2019-06-23 14:42:27', '2019-06-23 14:42:27'),
(79, '', 71, 0, 1, 8, 1, '2019-06-23 14:43:14', '2019-06-23 14:43:14'),
(80, '', 70, 0, 1, 2, 1, '2019-06-23 14:44:12', '2019-06-23 14:44:12'),
(81, '', 80, 0, 1, 1, 1, '2019-06-23 14:45:22', '2019-06-23 14:45:22'),
(82, '', 80, 0, 1, 2, 1, '2019-06-23 14:45:55', '2019-06-23 14:45:55'),
(83, '', 70, 0, 1, 3, 1, '2019-06-23 14:46:45', '2019-06-23 14:46:45'),
(84, '', 83, 0, 1, 1, 1, '2019-06-23 14:47:19', '2019-06-23 14:47:19'),
(85, '', 83, 0, 1, 2, 1, '2019-06-23 14:47:46', '2019-06-23 14:47:46'),
(86, '', 83, 0, 1, 3, 1, '2019-06-23 14:48:16', '2019-06-23 14:48:16'),
(87, '', 70, 0, 1, 4, 1, '2019-06-23 14:49:20', '2019-06-23 14:49:20'),
(88, '', 87, 0, 1, 1, 1, '2019-06-23 14:49:55', '2019-06-23 14:49:55'),
(89, '', 87, 0, 1, 2, 1, '2019-06-23 14:50:29', '2019-06-23 14:50:29'),
(90, '', 87, 0, 1, 3, 1, '2019-06-23 14:51:14', '2019-06-23 14:51:14'),
(91, '', 87, 0, 1, 4, 1, '2019-06-23 14:51:42', '2019-06-23 14:51:42'),
(92, '', 87, 0, 1, 5, 1, '2019-06-23 14:52:29', '2019-06-23 14:52:29'),
(93, '', 87, 0, 1, 6, 1, '2019-06-23 14:52:57', '2019-06-23 14:52:57'),
(94, '', 0, 1, 1, 6, 1, '2019-06-23 14:55:30', '2019-06-23 14:55:30'),
(95, '', 0, 1, 1, 7, 1, '2019-06-23 14:56:07', '2019-06-23 14:56:07'),
(96, '', 0, 1, 1, 8, 1, '2019-06-23 14:56:39', '2019-06-23 14:56:39'),
(97, '', 0, 1, 1, 9, 1, '2019-06-23 14:57:31', '2019-06-23 14:57:31'),
(98, '', 97, 0, 1, 1, 1, '2019-06-23 14:58:08', '2019-06-23 14:58:08'),
(99, '', 97, 0, 1, 2, 1, '2019-06-23 14:58:54', '2019-06-23 14:58:54'),
(100, '', 97, 0, 1, 3, 1, '2019-06-23 14:59:21', '2019-06-23 14:59:21'),
(101, '', 97, 0, 1, 4, 1, '2019-06-23 15:00:00', '2019-06-23 15:00:00'),
(102, '', 97, 0, 1, 5, 1, '2019-06-23 15:00:32', '2019-06-23 15:00:32'),
(103, '', 98, 0, 1, 1, 1, '2019-06-23 15:01:09', '2019-06-23 15:01:09'),
(104, '', 98, 0, 1, 2, 1, '2019-06-23 15:01:54', '2019-06-23 15:01:54'),
(105, '', 98, 0, 1, 3, 1, '2019-06-23 15:02:33', '2019-06-23 15:02:33'),
(106, '', 98, 0, 1, 4, 1, '2019-06-23 15:03:00', '2019-06-23 15:03:00'),
(107, '', 99, 0, 1, 1, 1, '2019-06-23 15:03:34', '2019-06-23 15:03:34'),
(108, '', 99, 0, 1, 2, 1, '2019-06-23 15:04:02', '2019-06-23 15:04:02'),
(109, '', 100, 0, 1, 1, 1, '2019-06-23 15:04:39', '2019-06-23 15:04:39'),
(110, '', 100, 0, 1, 2, 1, '2019-06-23 15:05:06', '2019-06-23 15:05:06'),
(111, '', 100, 0, 1, 3, 1, '2019-06-23 15:05:43', '2019-06-23 15:05:43'),
(112, '', 100, 0, 1, 4, 1, '2019-06-23 15:06:22', '2019-06-23 15:06:22'),
(113, '', 100, 0, 1, 5, 1, '2019-06-23 15:06:44', '2019-06-23 15:06:44'),
(114, '', 100, 0, 1, 6, 1, '2019-06-23 15:07:43', '2019-06-23 15:07:43'),
(115, '', 100, 0, 1, 7, 1, '2019-06-23 15:08:15', '2019-06-23 15:08:15'),
(116, '', 101, 0, 1, 1, 1, '2019-06-23 15:08:50', '2019-06-23 15:08:50'),
(117, '', 101, 0, 1, 2, 1, '2019-06-23 15:09:24', '2019-06-23 15:09:24'),
(118, '', 101, 0, 1, 3, 1, '2019-06-23 15:09:51', '2019-06-23 15:09:51'),
(119, '', 101, 0, 1, 4, 1, '2019-06-23 15:10:30', '2019-06-23 15:10:30'),
(120, '', 102, 0, 1, 1, 1, '2019-06-23 15:11:24', '2019-06-23 15:11:24'),
(121, '', 102, 0, 1, 2, 1, '2019-06-23 15:11:53', '2019-06-23 15:11:53'),
(122, '', 0, 1, 1, 10, 1, '2019-06-23 15:12:25', '2019-06-23 15:12:25'),
(123, '', 0, 1, 1, 11, 1, '2019-06-23 15:12:56', '2019-06-23 15:12:56'),
(124, '', 0, 1, 1, 12, 1, '2019-06-23 15:13:23', '2019-06-23 15:13:23'),
(125, '', 124, 0, 1, 1, 1, '2019-06-23 15:14:45', '2019-06-23 15:14:45'),
(126, '', 124, 0, 1, 2, 1, '2019-06-23 15:15:20', '2019-06-23 15:15:20'),
(127, '', 124, 0, 1, 3, 1, '2019-06-23 15:15:56', '2019-06-23 15:15:56'),
(128, '', 124, 0, 1, 4, 1, '2019-06-23 15:16:58', '2019-06-23 15:16:58'),
(129, '', 124, 0, 1, 5, 1, '2019-06-23 15:17:27', '2019-06-23 15:17:27'),
(130, '', 125, 0, 1, 1, 1, '2019-06-23 15:18:15', '2019-06-23 15:18:15'),
(131, '', 126, 0, 1, 1, 1, '2019-06-23 15:19:00', '2019-06-23 15:19:00'),
(132, '', 126, 0, 1, 2, 1, '2019-06-23 15:19:30', '2019-06-23 15:19:30'),
(133, '', 126, 0, 1, 3, 1, '2019-06-23 15:20:02', '2019-06-23 15:20:02'),
(134, '', 127, 0, 1, 1, 1, '2019-06-23 15:20:51', '2019-06-23 15:20:51'),
(135, '', 128, 0, 1, 1, 1, '2019-06-23 15:21:32', '2019-06-23 15:21:32'),
(136, '', 128, 0, 1, 2, 1, '2019-06-23 15:22:02', '2019-06-23 15:22:02'),
(137, '', 128, 0, 1, 3, 1, '2019-06-23 15:22:24', '2019-06-23 15:22:24'),
(138, '', 128, 0, 1, 4, 1, '2019-06-23 15:23:02', '2019-06-23 15:23:02'),
(139, '', 128, 0, 1, 5, 1, '2019-06-23 15:23:30', '2019-06-23 15:23:30'),
(140, '', 128, 0, 1, 6, 1, '2019-06-23 15:23:53', '2019-06-23 15:23:53'),
(141, '', 129, 0, 1, 1, 1, '2019-06-23 15:24:22', '2019-06-23 15:24:22'),
(142, '', 129, 0, 1, 2, 1, '2019-06-23 15:24:58', '2019-06-23 15:24:58'),
(143, '', 129, 0, 1, 3, 1, '2019-06-23 15:25:34', '2019-06-23 15:25:34'),
(144, '', 129, 0, 1, 4, 1, '2019-06-23 15:26:05', '2019-06-23 15:26:05'),
(145, '', 129, 0, 1, 5, 1, '2019-06-23 15:26:35', '2019-06-23 15:26:35'),
(146, '', 129, 0, 1, 6, 1, '2019-06-23 15:26:59', '2019-06-23 15:26:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_category_description`
--

CREATE TABLE `ks_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_category_description`
--

INSERT INTO `ks_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 2, 'Xe đạp tập ngoài trời', '', 'xe đạp tập ngoài trời', '', ''),
(31, 2, 'Phòng Gym', '', 'phòng gym', '', ''),
(59, 2, 'MÁY RUNG GIẢM CÂN', '', 'máy rung giảm cân', '', ''),
(60, 2, 'Máy rung', '', 'máy rung', '', ''),
(61, 2, 'Máy rung toàn thân', '', 'máy rung toàn thân', '', ''),
(110, 2, 'Gym &amp; Training', '', 'Gym &amp; Training', '', ''),
(26, 2, 'Hạng phổ thông', '', 'hạng phổ thông', '', ''),
(62, 2, 'Máy rung đánh bụng', '', 'máy rung đánh bụng', '', ''),
(35, 2, 'Xe đạp trẻ em', '', 'xe đạp trẻ em', '', ''),
(67, 2, 'Massage đứng', '', 'massage đứng', '', ''),
(68, 2, 'Máy massage chân', '', 'máy massage chân', '', ''),
(71, 2, 'Máy tập nhóm cơ', '', 'máy tập nhóm cơ', '', ''),
(108, 2, 'Giày tăng chiều cao', '', 'Giày tăng chiều cao', '', ''),
(81, 2, 'Giàn tập PT đa năng 360', '', 'Giàn tập PT đa năng 360', '', ''),
(82, 2, 'Giàn tạ khối', '', 'Giàn tạ khối', '', ''),
(83, 2, 'Máy tập Cadio', '', 'Máy tập Cadio', '', ''),
(84, 2, 'Máy chạy bộ', '', 'Máy chạy bộ', '', ''),
(85, 2, 'Xe đạp', '', 'Xe đạp', '', ''),
(86, 2, 'Máy rung giảm cân', '', 'Máy rung giảm cân', '', ''),
(87, 2, 'PHỤ KIỆN PHÒNG GYM', '', 'PHỤ KIỆN PHÒNG GYM', '', ''),
(88, 2, 'Thanh đòn', '', 'Thanh đòn', '', ''),
(89, 2, 'Tạ tay - Tạ đĩa', '', 'Tạ tay - Tạ đĩa', '', ''),
(90, 2, 'Thảm - Bóng YOGA', '', 'Thảm - Bóng YOGA', '', ''),
(91, 2, 'Bóng đấm thể lực', '', 'Bóng đấm thể lực', '', ''),
(92, 2, 'Máy tập bụng', '', 'Máy tập bụng', '', ''),
(93, 2, 'Máy tăng chiều cao', '', 'Máy tăng chiều cao', '', ''),
(94, 2, 'GIÀN TẠ ĐA NĂNG', '', 'GIÀN TẠ ĐA NĂNG', '', ''),
(95, 2, 'MÁY XAY SINH TỐ', '', 'MÁY XAY SINH TỐ', '', ''),
(96, 2, 'QUẠT ĐIỀU HÒA', '', 'QUẠT ĐIỀU HÒA', '', ''),
(97, 2, 'GIÀY NHẬP CHÍNH HÃNG', '', 'GIÀY NHẬP CHÍNH HÃNG', '', ''),
(46, 2, 'Hạng thương gia', '', 'hạng thương gia', '', ''),
(107, 2, 'Giày thể thao magic', '', 'Giày thể thao magic', '', ''),
(99, 2, 'Giày Magic', '', 'Giày Magic', '', ''),
(104, 2, 'Gym &amp; Training', '', 'Gym &amp; Training', '', ''),
(32, 2, 'Gia đình', '', 'gia đình', '', ''),
(70, 2, 'THIẾT BỊ PHÒNG GYM', '', 'thiết bị phòng gym', '', ''),
(29, 2, 'Xe đạp tập trong nhà', '', 'xe đạp tập trong nhà', '', ''),
(25, 2, 'XE ĐẠP THỂ THAO', '', 'xe đạp thể thao', '', ''),
(109, 2, 'Running', '', 'Running', '', ''),
(20, 2, 'MÁY CHẠY BỘ', 'Mô tả của máy chạy bộ :D', 'máy chạy bộ', '', ''),
(27, 2, 'Hạng thương gia', '', 'hạng thương gia', '', ''),
(69, 2, 'Thảm nhiệt massage', '', 'thảm nhiệt massage', '', ''),
(112, 2, 'Football', '', 'Football', '', ''),
(111, 2, 'Lifestyle', '', 'Lifestyle', '', ''),
(73, 2, 'Nhóm cơ TZ-4 series', '', 'nhóm cơ tz-4 series', '', ''),
(74, 2, 'Nhóm cơ TZ-5 series', '', 'Nhóm cơ TZ-5 series', '', ''),
(75, 2, 'Nhóm cơ TZ-9 series', '', 'Nhóm cơ TZ-9 series', '', ''),
(76, 2, 'Nhóm Robot LA', '', 'Nhóm Robot LA', '', ''),
(77, 2, 'Nhóm ghế đẩy tạ KM', '', 'Nhóm ghế đẩy tạ KM', '', ''),
(78, 2, 'Nhóm cơ KV', '', 'Nhóm cơ KV', '', ''),
(79, 2, 'Nhóm cơ H series', '', 'Nhóm cơ H series', '', ''),
(80, 2, 'Giàn tập đa năng', '', 'Giàn tập đa năng', '', ''),
(18, 2, 'GHẾ MASSAGE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'ghế massage', '', ''),
(36, 2, 'Xe đạp người lớn', '', 'xe đạp người lớn', '', ''),
(63, 2, 'Đai massage bụng', '', 'đai massage bụng', '', ''),
(64, 2, 'Máy massage các loại', '', 'máy massage các loại', '', ''),
(65, 2, 'Máy massage cầm tay cao cấp', '', 'máy massage cầm tay cao cấp', '', ''),
(66, 2, 'Đai massage bụng', '', 'đai massage bụng', '', ''),
(45, 2, 'Hạng phổ thông', '', 'hạng phổ thông', '', ''),
(72, 2, 'Nhóm cơ M7', '', 'nhóm cơ m7', '', ''),
(106, 2, 'Tennis', '', 'tennis', '', ''),
(105, 2, 'Lifestyle', '', 'Lifestyle', '', ''),
(102, 2, 'Giày Wilson', '', 'Giày Wilson', '', ''),
(101, 2, 'Giày Lining', '', 'Giày Lining', '', ''),
(100, 2, 'Giày Adidas', '', 'Giày Adidas', '', ''),
(98, 2, 'Giày Nike', '', 'Giày Nike', '', ''),
(103, 2, 'Running', '', 'running', '', ''),
(113, 2, 'Tennis', '', 'tennis', '', ''),
(114, 2, 'Golf', '', 'golf', '', ''),
(115, 2, 'Basketball', '', 'Basketball', '', ''),
(116, 2, 'Running', '', 'running', '', ''),
(117, 2, 'Gym &amp; Training', '', 'Gym &amp; Training', '', ''),
(118, 2, 'Lifestyle', '', 'Lifestyle', '', ''),
(119, 2, 'Badminton', '', 'Badminton', '', ''),
(120, 2, 'Tennis', '', 'tennis', '', ''),
(121, 2, 'Giày thể thao', '', 'Giày thể thao', '', ''),
(122, 2, 'THẢM LÓT SÀN', '', 'THẢM LÓT SÀN', '', ''),
(123, 2, 'MÁY HÚT CHÂN KHÔNG', '', 'MÁY HÚT CHÂN KHÔNG', '', ''),
(124, 2, 'SẢN PHẨM KHÁC', '', 'SẢN PHẨM KHÁC', '', ''),
(125, 2, 'Thiết bị y khoa', '', 'thiết bị y khoa', '', ''),
(126, 2, 'Vợt tennis - Vợt cầu lông', '', 'Vợt tennis - Vợt cầu lông', '', ''),
(127, 2, 'Sản phẩm phong thủy', '', 'Sản phẩm phong thủy', '', ''),
(128, 2, 'Thiết bị vệ sinh', '', 'Thiết bị vệ sinh', '', ''),
(129, 2, 'Thiết bị gia dụng', '', 'Thiết bị gia dụng', '', ''),
(130, 2, 'Máy đo huyết áp', '', 'máy đo huyết áp', '', ''),
(131, 2, 'Vợt tennis Kingsport', '', 'Vợt tennis Kingsport', '', ''),
(132, 2, 'Vợt cầu lông Kingsport', '', 'Vợt cầu lông Kingsport', '', ''),
(133, 2, 'Vợt tennis Wilson', '', 'Vợt tennis Wilson', '', ''),
(134, 2, 'Hốc thạch anh', '', 'Hốc thạch anh', '', ''),
(135, 2, 'Bồn cầu một khối', '', 'Bồn cầu một khối', '', ''),
(136, 2, 'Bồn rửa tay', '', 'Bồn rửa tay', '', ''),
(137, 2, 'Bồn tiểu nam', '', 'Bồn tiểu nam', '', ''),
(138, 2, 'Vòi hoa sen', '', 'Vòi hoa sen', '', ''),
(139, 2, 'Vòi rửa chén', '', 'Vòi rửa chén', '', ''),
(140, 2, 'Vòi xã', '', 'Vòi xã', '', ''),
(141, 2, 'Robot hút bụi', '', 'Robot hút bụi', '', ''),
(142, 2, 'Đèn năng lượng mặt trời', '', 'Đèn năng lượng mặt trời', '', ''),
(143, 2, 'Máy bào đá', '', 'Máy bào đá', '', ''),
(144, 2, 'Máy cắt cỏ cầm tay', '', 'Máy cắt cỏ cầm tay', '', ''),
(145, 2, 'Bàn bóng bàn', '', 'Bàn bóng bàn', '', ''),
(146, 2, 'Máy xông tinh dầu', '', 'Máy xông tinh dầu', '', ''),
(28, 3, 'Xe đạp tập ngoài trời', '', 'xe đạp tập ngoài trời', '', ''),
(31, 3, 'Phòng Gym', '', 'phòng gym', '', ''),
(59, 3, 'MÁY RUNG GIẢM CÂN', '', 'máy rung giảm cân', '', ''),
(60, 3, 'Máy rung', '', 'máy rung', '', ''),
(61, 3, 'Máy rung toàn thân', '', 'máy rung toàn thân', '', ''),
(110, 3, 'Gym &amp; Training', '', 'Gym &amp; Training', '', ''),
(26, 3, 'Hạng phổ thông', '', 'hạng phổ thông', '', ''),
(62, 3, 'Máy rung đánh bụng', '', 'máy rung đánh bụng', '', ''),
(35, 3, 'Xe đạp trẻ em', '', 'xe đạp trẻ em', '', ''),
(67, 3, 'Massage đứng', '', 'massage đứng', '', ''),
(68, 3, 'Máy massage chân', '', 'máy massage chân', '', ''),
(71, 3, 'Máy tập nhóm cơ', '', 'máy tập nhóm cơ', '', ''),
(108, 3, 'Giày tăng chiều cao', '', 'Giày tăng chiều cao', '', ''),
(81, 3, 'Giàn tập PT đa năng 360', '', 'Giàn tập PT đa năng 360', '', ''),
(82, 3, 'Giàn tạ khối', '', 'Giàn tạ khối', '', ''),
(83, 3, 'Máy tập Cadio', '', 'Máy tập Cadio', '', ''),
(84, 3, 'Máy chạy bộ', '', 'Máy chạy bộ', '', ''),
(85, 3, 'Xe đạp', '', 'Xe đạp', '', ''),
(86, 3, 'Máy rung giảm cân', '', 'Máy rung giảm cân', '', ''),
(87, 3, 'PHỤ KIỆN PHÒNG GYM', '', 'PHỤ KIỆN PHÒNG GYM', '', ''),
(88, 3, 'Thanh đòn', '', 'Thanh đòn', '', ''),
(89, 3, 'Tạ tay - Tạ đĩa', '', 'Tạ tay - Tạ đĩa', '', ''),
(90, 3, 'Thảm - Bóng YOGA', '', 'Thảm - Bóng YOGA', '', ''),
(91, 3, 'Bóng đấm thể lực', '', 'Bóng đấm thể lực', '', ''),
(92, 3, 'Máy tập bụng', '', 'Máy tập bụng', '', ''),
(93, 3, 'Máy tăng chiều cao', '', 'Máy tăng chiều cao', '', ''),
(94, 3, 'GIÀN TẠ ĐA NĂNG', '', 'GIÀN TẠ ĐA NĂNG', '', ''),
(95, 3, 'MÁY XAY SINH TỐ', '', 'MÁY XAY SINH TỐ', '', ''),
(96, 3, 'QUẠT ĐIỀU HÒA', '', 'QUẠT ĐIỀU HÒA', '', ''),
(97, 3, 'GIÀY NHẬP CHÍNH HÃNG', '', 'GIÀY NHẬP CHÍNH HÃNG', '', ''),
(46, 3, 'Hạng thương gia', '', 'hạng thương gia', '', ''),
(107, 3, 'Giày thể thao magic', '', 'Giày thể thao magic', '', ''),
(99, 3, 'Giày Magic', '', 'Giày Magic', '', ''),
(104, 3, 'Gym &amp; Training', '', 'Gym &amp; Training', '', ''),
(32, 3, 'Gia đình', '', 'gia đình', '', ''),
(70, 3, 'THIẾT BỊ PHÒNG GYM', '', 'thiết bị phòng gym', '', ''),
(29, 3, 'Xe đạp tập trong nhà', '', 'xe đạp tập trong nhà', '', ''),
(25, 3, 'XE ĐẠP THỂ THAO', '', 'xe đạp thể thao', '', ''),
(109, 3, 'Running', '', 'Running', '', ''),
(20, 3, 'MÁY CHẠY BỘ', 'Mô tả của máy chạy bộ :D', 'máy chạy bộ', '', ''),
(27, 3, 'Hạng thương gia', '', 'hạng thương gia', '', ''),
(69, 3, 'Thảm nhiệt massage', '', 'thảm nhiệt massage', '', ''),
(112, 3, 'Football', '', 'Football', '', ''),
(111, 3, 'Lifestyle', '', 'Lifestyle', '', ''),
(73, 3, 'Nhóm cơ TZ-4 series', '', 'nhóm cơ tz-4 series', '', ''),
(74, 3, 'Nhóm cơ TZ-5 series', '', 'Nhóm cơ TZ-5 series', '', ''),
(75, 3, 'Nhóm cơ TZ-9 series', '', 'Nhóm cơ TZ-9 series', '', ''),
(76, 3, 'Nhóm Robot LA', '', 'Nhóm Robot LA', '', ''),
(77, 3, 'Nhóm ghế đẩy tạ KM', '', 'Nhóm ghế đẩy tạ KM', '', ''),
(78, 3, 'Nhóm cơ KV', '', 'Nhóm cơ KV', '', ''),
(79, 3, 'Nhóm cơ H series', '', 'Nhóm cơ H series', '', ''),
(80, 3, 'Giàn tập đa năng', '', 'Giàn tập đa năng', '', ''),
(18, 3, 'GHẾ MASSAGE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'ghế massage', '', ''),
(36, 3, 'Xe đạp người lớn', '', 'xe đạp người lớn', '', ''),
(63, 3, 'Đai massage bụng', '', 'đai massage bụng', '', ''),
(64, 3, 'Máy massage các loại', '', 'máy massage các loại', '', ''),
(65, 3, 'Máy massage cầm tay cao cấp', '', 'máy massage cầm tay cao cấp', '', ''),
(66, 3, 'Đai massage bụng', '', 'đai massage bụng', '', ''),
(45, 3, 'Hạng phổ thông', '', 'hạng phổ thông', '', ''),
(72, 3, 'Nhóm cơ M7', '', 'nhóm cơ m7', '', ''),
(106, 3, 'Tennis', '', 'tennis', '', ''),
(105, 3, 'Lifestyle', '', 'Lifestyle', '', ''),
(102, 3, 'Giày Wilson', '', 'Giày Wilson', '', ''),
(101, 3, 'Giày Lining', '', 'Giày Lining', '', ''),
(100, 3, 'Giày Adidas', '', 'Giày Adidas', '', ''),
(98, 3, 'Giày Nike', '', 'Giày Nike', '', ''),
(103, 3, 'Running', '', 'running', '', ''),
(113, 3, 'Tennis', '', 'tennis', '', ''),
(114, 3, 'Golf', '', 'golf', '', ''),
(115, 3, 'Basketball', '', 'Basketball', '', ''),
(116, 3, 'Running', '', 'running', '', ''),
(117, 3, 'Gym &amp; Training', '', 'Gym &amp; Training', '', ''),
(118, 3, 'Lifestyle', '', 'Lifestyle', '', ''),
(119, 3, 'Badminton', '', 'Badminton', '', ''),
(120, 3, 'Tennis', '', 'tennis', '', ''),
(121, 3, 'Giày thể thao', '', 'Giày thể thao', '', ''),
(122, 3, 'THẢM LÓT SÀN', '', 'THẢM LÓT SÀN', '', ''),
(123, 3, 'MÁY HÚT CHÂN KHÔNG', '', 'MÁY HÚT CHÂN KHÔNG', '', ''),
(124, 3, 'SẢN PHẨM KHÁC', '', 'SẢN PHẨM KHÁC', '', ''),
(125, 3, 'Thiết bị y khoa', '', 'thiết bị y khoa', '', ''),
(126, 3, 'Vợt tennis - Vợt cầu lông', '', 'Vợt tennis - Vợt cầu lông', '', ''),
(127, 3, 'Sản phẩm phong thủy', '', 'Sản phẩm phong thủy', '', ''),
(128, 3, 'Thiết bị vệ sinh', '', 'Thiết bị vệ sinh', '', ''),
(129, 3, 'Thiết bị gia dụng', '', 'Thiết bị gia dụng', '', ''),
(130, 3, 'Máy đo huyết áp', '', 'máy đo huyết áp', '', ''),
(131, 3, 'Vợt tennis Kingsport', '', 'Vợt tennis Kingsport', '', ''),
(132, 3, 'Vợt cầu lông Kingsport', '', 'Vợt cầu lông Kingsport', '', ''),
(133, 3, 'Vợt tennis Wilson', '', 'Vợt tennis Wilson', '', ''),
(134, 3, 'Hốc thạch anh', '', 'Hốc thạch anh', '', ''),
(135, 3, 'Bồn cầu một khối', '', 'Bồn cầu một khối', '', ''),
(136, 3, 'Bồn rửa tay', '', 'Bồn rửa tay', '', ''),
(137, 3, 'Bồn tiểu nam', '', 'Bồn tiểu nam', '', ''),
(138, 3, 'Vòi hoa sen', '', 'Vòi hoa sen', '', ''),
(139, 3, 'Vòi rửa chén', '', 'Vòi rửa chén', '', ''),
(140, 3, 'Vòi xã', '', 'Vòi xã', '', ''),
(141, 3, 'Robot hút bụi', '', 'Robot hút bụi', '', ''),
(142, 3, 'Đèn năng lượng mặt trời', '', 'Đèn năng lượng mặt trời', '', ''),
(143, 3, 'Máy bào đá', '', 'Máy bào đá', '', ''),
(144, 3, 'Máy cắt cỏ cầm tay', '', 'Máy cắt cỏ cầm tay', '', ''),
(145, 3, 'Bàn bóng bàn', '', 'Bàn bóng bàn', '', ''),
(146, 3, 'Máy xông tinh dầu', '', 'Máy xông tinh dầu', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_category_filter`
--

CREATE TABLE `ks_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_category_path`
--

CREATE TABLE `ks_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_category_path`
--

INSERT INTO `ks_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 28, 1),
(35, 25, 0),
(35, 35, 2),
(36, 28, 1),
(36, 25, 0),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(76, 71, 1),
(76, 70, 0),
(31, 25, 0),
(31, 31, 2),
(32, 25, 0),
(32, 32, 2),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(70, 70, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(69, 69, 2),
(60, 59, 0),
(59, 59, 0),
(74, 71, 1),
(74, 70, 0),
(75, 70, 0),
(74, 74, 2),
(73, 73, 2),
(73, 71, 1),
(73, 70, 0),
(72, 72, 2),
(72, 71, 1),
(72, 70, 0),
(71, 71, 1),
(71, 70, 0),
(69, 64, 1),
(68, 68, 2),
(68, 59, 0),
(68, 64, 1),
(67, 67, 2),
(67, 59, 0),
(67, 64, 1),
(66, 66, 2),
(66, 64, 1),
(66, 59, 0),
(65, 65, 2),
(65, 59, 0),
(65, 64, 1),
(64, 64, 1),
(64, 59, 0),
(63, 63, 2),
(63, 60, 1),
(63, 59, 0),
(62, 62, 2),
(62, 60, 1),
(62, 59, 0),
(61, 61, 2),
(61, 60, 1),
(61, 59, 0),
(60, 60, 1),
(75, 75, 2),
(75, 71, 1),
(69, 59, 0),
(32, 29, 1),
(31, 29, 1),
(76, 76, 2),
(77, 70, 0),
(77, 71, 1),
(77, 77, 2),
(78, 70, 0),
(78, 71, 1),
(78, 78, 2),
(79, 70, 0),
(79, 71, 1),
(79, 79, 2),
(80, 70, 0),
(80, 80, 1),
(81, 70, 0),
(81, 80, 1),
(81, 81, 2),
(82, 70, 0),
(82, 80, 1),
(82, 82, 2),
(83, 70, 0),
(83, 83, 1),
(84, 70, 0),
(84, 83, 1),
(84, 84, 2),
(85, 70, 0),
(85, 83, 1),
(85, 85, 2),
(86, 70, 0),
(86, 83, 1),
(86, 86, 2),
(87, 70, 0),
(87, 87, 1),
(88, 70, 0),
(88, 87, 1),
(88, 88, 2),
(89, 70, 0),
(89, 87, 1),
(89, 89, 2),
(90, 70, 0),
(90, 87, 1),
(90, 90, 2),
(91, 70, 0),
(91, 87, 1),
(91, 91, 2),
(92, 70, 0),
(92, 87, 1),
(92, 92, 2),
(93, 70, 0),
(93, 87, 1),
(93, 93, 2),
(94, 94, 0),
(95, 95, 0),
(96, 96, 0),
(97, 97, 0),
(98, 97, 0),
(98, 98, 1),
(99, 97, 0),
(99, 99, 1),
(100, 97, 0),
(100, 100, 1),
(101, 97, 0),
(101, 101, 1),
(102, 97, 0),
(102, 102, 1),
(103, 97, 0),
(103, 98, 1),
(103, 103, 2),
(104, 97, 0),
(104, 98, 1),
(104, 104, 2),
(105, 97, 0),
(105, 98, 1),
(105, 105, 2),
(106, 97, 0),
(106, 98, 1),
(106, 106, 2),
(107, 97, 0),
(107, 99, 1),
(107, 107, 2),
(108, 97, 0),
(108, 99, 1),
(108, 108, 2),
(109, 97, 0),
(109, 100, 1),
(109, 109, 2),
(110, 97, 0),
(110, 100, 1),
(110, 110, 2),
(111, 97, 0),
(111, 100, 1),
(111, 111, 2),
(112, 97, 0),
(112, 100, 1),
(112, 112, 2),
(113, 97, 0),
(113, 100, 1),
(113, 113, 2),
(114, 97, 0),
(114, 100, 1),
(114, 114, 2),
(115, 97, 0),
(115, 100, 1),
(115, 115, 2),
(116, 97, 0),
(116, 101, 1),
(116, 116, 2),
(117, 97, 0),
(117, 101, 1),
(117, 117, 2),
(118, 97, 0),
(118, 101, 1),
(118, 118, 2),
(119, 97, 0),
(119, 101, 1),
(119, 119, 2),
(120, 97, 0),
(120, 102, 1),
(120, 120, 2),
(121, 97, 0),
(121, 102, 1),
(121, 121, 2),
(122, 122, 0),
(123, 123, 0),
(124, 124, 0),
(125, 124, 0),
(125, 125, 1),
(126, 124, 0),
(126, 126, 1),
(127, 124, 0),
(127, 127, 1),
(128, 124, 0),
(128, 128, 1),
(129, 124, 0),
(129, 129, 1),
(130, 124, 0),
(130, 125, 1),
(130, 130, 2),
(131, 124, 0),
(131, 126, 1),
(131, 131, 2),
(132, 124, 0),
(132, 126, 1),
(132, 132, 2),
(133, 124, 0),
(133, 126, 1),
(133, 133, 2),
(134, 124, 0),
(134, 127, 1),
(134, 134, 2),
(135, 124, 0),
(135, 128, 1),
(135, 135, 2),
(136, 124, 0),
(136, 128, 1),
(136, 136, 2),
(137, 124, 0),
(137, 128, 1),
(137, 137, 2),
(138, 124, 0),
(138, 128, 1),
(138, 138, 2),
(139, 124, 0),
(139, 128, 1),
(139, 139, 2),
(140, 124, 0),
(140, 128, 1),
(140, 140, 2),
(141, 124, 0),
(141, 129, 1),
(141, 141, 2),
(142, 124, 0),
(142, 129, 1),
(142, 142, 2),
(143, 124, 0),
(143, 129, 1),
(143, 143, 2),
(144, 124, 0),
(144, 129, 1),
(144, 144, 2),
(145, 124, 0),
(145, 129, 1),
(145, 145, 2),
(146, 124, 0),
(146, 129, 1),
(146, 146, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_category_to_layout`
--

CREATE TABLE `ks_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_category_to_layout`
--

INSERT INTO `ks_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(20, 0, 0),
(27, 0, 0),
(26, 0, 0),
(18, 0, 0),
(46, 0, 0),
(45, 0, 0),
(25, 0, 0),
(29, 0, 0),
(32, 0, 0),
(31, 0, 0),
(28, 0, 0),
(35, 0, 0),
(36, 0, 0),
(60, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0),
(105, 0, 0),
(106, 0, 0),
(107, 0, 0),
(108, 0, 0),
(109, 0, 0),
(110, 0, 0),
(111, 0, 0),
(112, 0, 0),
(113, 0, 0),
(114, 0, 0),
(115, 0, 0),
(116, 0, 0),
(117, 0, 0),
(118, 0, 0),
(119, 0, 0),
(120, 0, 0),
(121, 0, 0),
(122, 0, 0),
(123, 0, 0),
(124, 0, 0),
(125, 0, 0),
(126, 0, 0),
(127, 0, 0),
(128, 0, 0),
(129, 0, 0),
(130, 0, 0),
(131, 0, 0),
(132, 0, 0),
(133, 0, 0),
(134, 0, 0),
(135, 0, 0),
(136, 0, 0),
(137, 0, 0),
(138, 0, 0),
(139, 0, 0),
(140, 0, 0),
(141, 0, 0),
(142, 0, 0),
(143, 0, 0),
(144, 0, 0),
(145, 0, 0),
(146, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_category_to_store`
--

CREATE TABLE `ks_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_category_to_store`
--

INSERT INTO `ks_category_to_store` (`category_id`, `store_id`) VALUES
(18, 0),
(20, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(31, 0),
(32, 0),
(35, 0),
(36, 0),
(45, 0),
(46, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_country`
--

CREATE TABLE `ks_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_country`
--

INSERT INTO `ks_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_coupon`
--

CREATE TABLE `ks_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_coupon`
--

INSERT INTO `ks_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_coupon_category`
--

CREATE TABLE `ks_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_coupon_history`
--

CREATE TABLE `ks_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_coupon_product`
--

CREATE TABLE `ks_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_currency`
--

CREATE TABLE `ks_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_currency`
--

INSERT INTO `ks_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'Việt Nam đồng', 'VND', '', 'đ', '0', 1.00000000, 1, '2019-06-26 04:10:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer`
--

CREATE TABLE `ks_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text DEFAULT NULL,
  `wishlist` text DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_activity`
--

CREATE TABLE `ks_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_affiliate`
--

CREATE TABLE `ks_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_approval`
--

CREATE TABLE `ks_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_group`
--

CREATE TABLE `ks_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_customer_group`
--

INSERT INTO `ks_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_group_description`
--

CREATE TABLE `ks_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_customer_group_description`
--

INSERT INTO `ks_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test'),
(1, 3, 'Default', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_history`
--

CREATE TABLE `ks_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_ip`
--

CREATE TABLE `ks_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_login`
--

CREATE TABLE `ks_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_customer_login`
--

INSERT INTO `ks_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'admin', '127.0.0.1', 4, '2019-05-25 14:18:48', '2019-06-19 15:27:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_online`
--

CREATE TABLE `ks_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_product_viewed`
--

CREATE TABLE `ks_customer_product_viewed` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'customer_id from `ks_customer',
  `product_id` int(11) DEFAULT NULL COMMENT 'product_id from `ks_product',
  `viewed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_reward`
--

CREATE TABLE `ks_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_search`
--

CREATE TABLE `ks_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_transaction`
--

CREATE TABLE `ks_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_customer_wishlist`
--

CREATE TABLE `ks_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_custom_field`
--

CREATE TABLE `ks_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_custom_field_customer_group`
--

CREATE TABLE `ks_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_custom_field_description`
--

CREATE TABLE `ks_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_custom_field_value`
--

CREATE TABLE `ks_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_custom_field_value_description`
--

CREATE TABLE `ks_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_download`
--

CREATE TABLE `ks_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_download_description`
--

CREATE TABLE `ks_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_ebay_image_import`
--

CREATE TABLE `ks_ebay_image_import` (
  `id` int(11) NOT NULL,
  `image_original` text NOT NULL,
  `image_new` text NOT NULL,
  `name` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `imgcount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_ebay_order_lock`
--

CREATE TABLE `ks_ebay_order_lock` (
  `smp_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_ebay_setting_option`
--

CREATE TABLE `ks_ebay_setting_option` (
  `ebay_setting_option_id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `last_updated` datetime NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_ebay_shipping_location_exclude`
--

CREATE TABLE `ks_ebay_shipping_location_exclude` (
  `ebay_shipping_exclude_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_ebay_stock_reserve`
--

CREATE TABLE `ks_ebay_stock_reserve` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` varchar(100) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `reserve` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_ebay_template`
--

CREATE TABLE `ks_ebay_template` (
  `template_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `html` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_event`
--

CREATE TABLE `ks_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_event`
--

INSERT INTO `ks_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0),
(46, 'openbay_product_del_after', 'admin/model/catalog/product/deleteProduct/after', 'marketplace/openbay/eventDeleteProduct', 1, 0),
(47, 'openbay_product_edit_after', 'admin/model/catalog/product/editProduct/after', 'marketplace/openbay/eventEditProduct', 1, 0),
(48, 'openbay_menu', 'admin/view/common/column_left/before', 'marketplace/openbay/eventMenu', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_extension`
--

CREATE TABLE `ks_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_extension`
--

INSERT INTO `ks_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google'),
(43, 'module', 'latest'),
(53, 'theme', 'kingsport'),
(45, 'module', 'special'),
(46, 'module', 'html'),
(47, 'module', 'filter'),
(48, 'feed', 'google_base'),
(49, 'feed', 'google_sitemap'),
(50, 'feed', 'openbaypro'),
(51, 'module', 'bestseller'),
(52, 'shipping', 'free'),
(54, 'module', 'recently_viewed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_extension_install`
--

CREATE TABLE `ks_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_extension_install`
--

INSERT INTO `ks_extension_install` (`extension_install_id`, `extension_download_id`, `filename`, `date_added`) VALUES
(1, 0, 'recentlyviewed.ocmod.zip', '2019-06-16 20:34:45'),
(2, 0, 'facebookadsextension.ocmod.zip', '2019-06-24 14:42:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_extension_path`
--

CREATE TABLE `ks_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_extension_path`
--

INSERT INTO `ks_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(1, 1, 'admin/model/extension/module', '2019-06-16 20:34:45'),
(2, 1, 'admin/controller/extension/module/recently_viewed.php', '2019-06-16 20:34:45'),
(3, 1, 'admin/model/extension/module/recently_viewed.php', '2019-06-16 20:34:45'),
(4, 1, 'catalog/controller/extension/module/recently_viewed.php', '2019-06-16 20:34:45'),
(5, 1, 'catalog/model/extension/module/recently_viewed.php', '2019-06-16 20:34:45'),
(6, 1, 'admin/language/en-gb/extension/module/recently_viewed.php', '2019-06-16 20:34:45'),
(7, 1, 'admin/view/template/extension/module/recently_viewed.twig', '2019-06-16 20:34:45'),
(8, 1, 'catalog/language/en-gb/extension/module/recently_viewed.php', '2019-06-16 20:34:45'),
(9, 1, 'catalog/view/theme/default/template/extension/module/recently_viewed.twig', '2019-06-16 20:34:45'),
(10, 2, 'admin/language/english', '2019-06-24 14:42:46'),
(11, 2, 'system/library/facebookcommonutils.php', '2019-06-24 14:42:46'),
(12, 2, 'system/library/facebookgraphapi.php', '2019-06-24 14:42:46'),
(13, 2, 'system/library/facebookgraphapierror.php', '2019-06-24 14:42:46'),
(14, 2, 'system/library/facebookproductapiformatter.php', '2019-06-24 14:42:46'),
(15, 2, 'system/library/facebookproductfeedformatter.php', '2019-06-24 14:42:46'),
(16, 2, 'system/library/facebookproductformatter.php', '2019-06-24 14:42:46'),
(17, 2, 'system/library/facebooksampleproductfeedformatter.php', '2019-06-24 14:42:46'),
(18, 2, 'system/library/facebooktax.php', '2019-06-24 14:42:46'),
(19, 2, 'admin/controller/extension/facebookadsextension.php', '2019-06-24 14:42:46'),
(20, 2, 'admin/controller/extension/facebookproduct.php', '2019-06-24 14:42:46'),
(21, 2, 'admin/controller/extension/facebookproductfeed.php', '2019-06-24 14:42:46'),
(22, 2, 'admin/controller/extension/facebookproducttrait.php', '2019-06-24 14:42:46'),
(23, 2, 'admin/language/english/extension', '2019-06-24 14:42:46'),
(24, 2, 'admin/model/extension/facebookproduct.php', '2019-06-24 14:42:46'),
(25, 2, 'admin/model/extension/facebooksetting.php', '2019-06-24 14:42:46'),
(26, 2, 'admin/view/image/facebook', '2019-06-24 14:42:46'),
(27, 2, 'admin/view/javascript/facebook', '2019-06-24 14:42:46'),
(28, 2, 'admin/view/stylesheet/facebook', '2019-06-24 14:42:46'),
(29, 2, 'catalog/controller/extension/facebookeventparameters.php', '2019-06-24 14:42:46'),
(30, 2, 'catalog/controller/extension/facebookpageshopcheckoutredirect.php', '2019-06-24 14:42:46'),
(31, 2, 'catalog/controller/extension/facebookproduct.php', '2019-06-24 14:42:46'),
(32, 2, 'catalog/view/javascript/facebook', '2019-06-24 14:42:46'),
(33, 2, 'catalog/view/theme/css', '2019-06-24 14:42:46'),
(34, 2, 'admin/controller/extension/module/facebookadsextension_installer.php', '2019-06-24 14:42:46'),
(35, 2, 'admin/language/en-gb/extension/facebookadsextension.php', '2019-06-24 14:42:46'),
(36, 2, 'admin/language/english/extension/facebookadsextension.php', '2019-06-24 14:42:46'),
(37, 2, 'admin/language/english/extension/module', '2019-06-24 14:42:46'),
(38, 2, 'admin/view/image/facebook/background.png', '2019-06-24 14:42:46'),
(39, 2, 'admin/view/image/facebook/buttonbg.png', '2019-06-24 14:42:46'),
(40, 2, 'admin/view/image/facebook/fbicons.png', '2019-06-24 14:42:46'),
(41, 2, 'admin/view/image/facebook/loadingicon.gif', '2019-06-24 14:42:46'),
(42, 2, 'admin/view/javascript/facebook/dia_2_1_10.js', '2019-06-24 14:42:46'),
(43, 2, 'admin/view/stylesheet/facebook/dia.css', '2019-06-24 14:42:46'),
(44, 2, 'admin/view/stylesheet/facebook/feed.css', '2019-06-24 14:42:46'),
(45, 2, 'admin/view/stylesheet/facebook/pixel.css', '2019-06-24 14:42:46'),
(46, 2, 'admin/view/template/extension/facebookadsextension.tpl', '2019-06-24 14:42:46'),
(47, 2, 'admin/view/template/extension/facebookadsextension.twig', '2019-06-24 14:42:46'),
(48, 2, 'catalog/view/javascript/facebook/cookieconsent.min.js', '2019-06-24 14:42:46'),
(49, 2, 'catalog/view/javascript/facebook/facebook_pixel_2_1_10.js', '2019-06-24 14:42:46'),
(50, 2, 'catalog/view/theme/css/facebook', '2019-06-24 14:42:46'),
(51, 2, 'admin/language/en-gb/extension/module/facebookadsextension_installer.php', '2019-06-24 14:42:46'),
(52, 2, 'admin/language/english/extension/module/facebookadsextension_installer.php', '2019-06-24 14:42:46'),
(53, 2, 'admin/view/template/extension/module/facebookadsextension_installer.tpl', '2019-06-24 14:42:46'),
(54, 2, 'admin/view/template/extension/module/facebookadsextension_installer.twig', '2019-06-24 14:42:46'),
(55, 2, 'catalog/view/theme/css/facebook/cookieconsent.min.css', '2019-06-24 14:42:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_filter`
--

CREATE TABLE `ks_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_filter_description`
--

CREATE TABLE `ks_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_filter_group`
--

CREATE TABLE `ks_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_filter_group_description`
--

CREATE TABLE `ks_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_geo_zone`
--

CREATE TABLE `ks_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_geo_zone`
--

INSERT INTO `ks_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2009-01-06 23:26:25', '2010-02-26 22:33:24'),
(4, 'UK Shipping', 'UK Shipping Zones', '2009-06-23 01:14:53', '2010-12-15 15:18:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_googleshopping_category`
--

CREATE TABLE `ks_googleshopping_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_googleshopping_product`
--

CREATE TABLE `ks_googleshopping_product` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `conversions` int(11) NOT NULL DEFAULT 0,
  `cost` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `conversion_value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_googleshopping_product`
--

INSERT INTO `ks_googleshopping_product` (`product_advertise_google_id`, `product_id`, `store_id`, `has_issues`, `destination_status`, `impressions`, `clicks`, `conversions`, `cost`, `conversion_value`, `google_product_category`, `condition`, `adult`, `multipack`, `is_bundle`, `age_group`, `color`, `gender`, `size_type`, `size_system`, `size`, `is_modified`) VALUES
(1, 50, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 51, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 52, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 62, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 54, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_googleshopping_product_status`
--

CREATE TABLE `ks_googleshopping_product_status` (
  `product_id` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_googleshopping_product_target`
--

CREATE TABLE `ks_googleshopping_product_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_googleshopping_target`
--

CREATE TABLE `ks_googleshopping_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused',
  `date_added` date DEFAULT NULL,
  `roas` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_google_base_category`
--

CREATE TABLE `ks_google_base_category` (
  `google_base_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_google_base_category_to_category`
--

CREATE TABLE `ks_google_base_category_to_category` (
  `google_base_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_info`
--

CREATE TABLE `ks_info` (
  `info_id` int(11) UNSIGNED NOT NULL,
  `bottom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_info`
--

INSERT INTO `ks_info` (`info_id`, `bottom`, `status`, `sort_order`, `date_added`, `date_modified`) VALUES
(1, 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_information`
--

CREATE TABLE `ks_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `left` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_information`
--

INSERT INTO `ks_information` (`information_id`, `bottom`, `sort_order`, `status`, `left`) VALUES
(3, 1, 3, 1, 1),
(4, 1, 4, 1, 1),
(5, 1, 6, 1, 1),
(6, 1, 5, 1, 1),
(7, 1, 2, 1, 1),
(8, 1, 1, 1, 1),
(9, 1, 1, 1, 0),
(10, 1, 2, 1, 0),
(11, 1, 3, 1, 0),
(12, 1, 4, 1, 0),
(13, 1, 5, 1, 0),
(14, 1, 6, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_information_description`
--

CREATE TABLE `ks_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_information_description`
--

INSERT INTO `ks_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, 'Chính Sách Bảo Mật', '&lt;p&gt;&lt;span style=&quot;font-weight: 700; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px; text-align: justify;&quot;&gt;Cám ơn quý khách đã truy cập vào website www.kingsport.vn. Chúng tôi tin rằng việc tôn trọng và bảo mật những thông tin mang tính riêng tư của khách hàng là một trong những ưu tiên hàng đầu của chúng tôi. Xin vui lòng đọc bản Chính sách bảo mật dưới đây để hiểu hơn những cam kết mà chúng tôi thực hiện nhằm tôn trọng và bảo vệ quyền lợi của người truy cập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Chính sách bảo mật sẽ giải thích cách chúng tôi tiếp nhận, sử dụng và (trong trường hợp nào đó) tiết lộ thông tin cá nhân của bạn. Chính sách cũng sẽ giải thích các bước chúng tôi thực hiện để bảo mật thông tin cá nhân của khách hàng. Cuối cùng, Chính sách bảo mật sẽ giải thích quyền lựa chọn của quý khách về việc thu thập, sử dụng và tiết lộ thông tin cá nhân của mình.&lt;br&gt;Bảo vệ dữ liệu cá nhân và gây dựng được niềm tin cho quý khách là vấn đề rất quan trọng với chúng tôi. Vì vậy, chúng tôi sẽ dùng tên và các thông tin khác liên quan đến quý khách tuân thủ theo nội dung của Chính sách bảo mật. Chúng tôi chỉ thu thập những thông tin cần thiết liên quan đến giao dịch mua bán.&lt;br&gt;Chúng tôi cam kết bảo mật toàn bộ dữ liệu cá nhân của người tham gia trang web phù hợp theo qui định của Bộ Luật Dân Sự Nước Cộng Hòa Xã Hội Chủ Nghĩa Việt Nam và các qui định pháp lý có liên quan. Nội dung trang chính sách bả0 mật thông tin cá nhân nêu tóm lược các hình thức thông tin nào mà công ty chúng tôi thu thập được qua trang web này, cách thức chúng tôi sử dụng và quản lý dữ liệu. Trong nội dung trang này còn đề cập đến các quyền lợi bạn được hưởng liên quan đến việc bảo mật thông tin dữ liệu và cung cấp cách thức bạn cần thực hiện để liên lạc với chúng tôi.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Nhà quản trị dữ liệu (Data Controller)&amp;nbsp;&lt;/span&gt;&lt;br&gt;Nhà quản trị dữ liệu có liên quan đến cá nhân những người tham gia vào trang mạng này là: Công ty TNHH XNK Phát Triển Đông Dương.&lt;br&gt;Địa chỉ:&amp;nbsp;Số 17, Lô B, Đường sô 1, KDC Phú Mỹ, KP1, P. Phú Mỹ, Q.7&lt;br&gt;MST: 0310037930&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2. Thu thập thông tin cá nhân &amp;amp; cách thức sử dụng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;b&gt;Mọi kết nối đến website https://kingsport.vn đều được mã hóa và xác thực bằng chuẩn AES_256_GCM đồng thời sử dụng ECDHE_RSA làm cơ chế trao đổi chính&lt;/b&gt;&lt;br&gt;Để đặt hàng thành công trên Web, chúng tôi sẽ thu thập các thông tin liên quan của quý khách để phục vụ cho mục đích giao hàng một cách nhanh chóng và thuận tiện đồng thời tránh vấn nạn spam từ các hệ thống khác.&lt;br&gt;Chúng tôi thu thập, lưu trữ và xử lý thông tin của bạn cho quá trình mua hàng và cho những thông báo về dịch vụ của chúng tôi sau này. Các thông tin cá nhân có thể bao gồm: họ tên, giới tính, ngày sinh, email, địa chỉ, địa chỉ giao hàng, số điện thoại…&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Các thông tin liên quan đến tài khoản ngân hàng, thông tin thẻ tín dụng đều mã hóa và thực hiện qua cổng thanh toán Ngân Lượng (chúng tôi không có quyền truy cập vào các thông tin này)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Việc thanh toán trực tuyến trên website www.kingsport.vn được kết qua cổng thanh toán ALEPAY (thẻ quốc tế) và NGÂN LƯỢNG (cổng nội địa) thuộc quản lý của Công ty cổ phần Ngân Lượng,&amp;nbsp;theo đó các tiêu chuẩn bảo mật thanh toán của kingsport đảm bảo tuân thủ theo các tiêu chuẩn bảo mật của ngân lượng.&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;(Cổng thanh toán Alepay &amp;amp; Ngân lượng&amp;nbsp;đã được Ngân hàng nhà nước Việt Nam thẩm định về độ an toàn bảo mật và cấp phép hoạt động chính thức)&lt;/em&gt;&lt;/span&gt;&lt;br&gt;- Chúng tôi sẽ dùng thông tin quý khách đã cung cấp để xử lý đơn đặt hàng, cung cấp các dịch vụ và thông tin yêu cầu thông qua website và theo yêu cầu của bạn. Hơn nữa, chúng tôi sẽ sử dụng các thông tin đó để xác minh và thực hiện giao dịch trực tuyến, nghiên cứu nhân khẩu học, gửi thông tin bao gồm thông tin sản phẩm và dịch vụ, nếu bạn không có dấu hiệu từ chối. Nếu quý khách không muốn nhận bất cứ thông tin tiếp thị của chúng tôi thì có thể từ chối bất cứ lúc nào.&lt;br&gt;- Trong một số trường hợp, việc vận chuyển sản phẩm phải thông qua đơn vị vận chuyển trung gian, chúng tôi có thể chuyển các thông tin cá nhân của bạn như (sdt, tên, địa chỉ) cho bên thứ ba (ví dụ dịch vụ chuyển phát nhanh hoặc nhà xe).&lt;br&gt;Điều lệ khác về thông tin cá nhân&lt;br&gt;- Quý khách sẽ nhận được thông tin về chúng tôi, về website, các chương trình khuyến mãi, sản phẩm mới, bản tin, bất cứ những gì liên quan đến các công ty liên quan. Nếu bạn không muốn nhận những thông tin này, vui lòng nhấn vào link từ chối trong bất kỳ email chúng tôi gửi cho bạn. Trong vòng 7 ngày nhận chỉ dẫn của bạn, chúng tôi sẽ ngừng gửi thông tin. Nếu thấy không rõ, chúng tôi sẽ liên lạc với bạn.&lt;br&gt;Chúng tôi sẽ tiếp tục giấu tên dữ liệu người dùng trên website và sử dụng cho nhiều mục đích khác nhau, bao gồm việc xác định vị trí của người dùng và cách sử dụng các khía cạnh nhất định của website hoặc đường link chứa trong email tới người dùng và cung cấp dữ liệu ẩn danh đó cho bên thứ 3 là nhà xuất bản. Tuy nhiên, dữ liệu này không có khả năng xác định cá nhân.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;3. Đối tác thứ ba và Liên kết&lt;/span&gt;&lt;br&gt;Chúng tôi có thể chuyển thông tin của quý khách cho các công ty khác trong nhóm trong khuôn khổ quy định của Chính sách bảo mật. Ví dụ: chúng tôi sẽ nhờ bên thứ ba giao hàng, nhận tiền thanh toán, phân tích dữ liệu, tiếp thị và hỗ trợ dịch vụ khách hàng. Chúng tôi có thể trao đổi thông tin với bên thứ ba với mục đích chống gian lận.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Trong khuôn khổ Chính sách bảo mật, chúng tôi không bán hay tiết lộ dữ liệu cá nhân của bạn cho bên thứ ba mà không được đồng ý trước trừ khi điều này là cần thiết cho các điều khoản trong Chính sách bảo mật hoặc chúng tôi được yêu cầu phải làm như vậy theo quy định của Pháp luật. Website có thể bao gồm quảng cáo của bên thứ ba và các liên kết đến các trang web khác hoặc khung của các trang web khác. Xin lưu ý rằng chúng tôi không có nhiệm vụ bảo mật thông tin hay nội dung của bên thứ ba hay các website khác, hay bất kỳ bên thứ ba nào mà chúng tôi chuyển giao dữ liệu cho phù hợp với Chính sách bảo mật.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Hệ thống theo dõi hành vi của khách hàng được chúng tôi sử dụng trên kênh Hiển Thị Quảng Cáo (ví dụ như Tiếp Thị Lại Khách Hàng, hệ thống quản lý các chiến dịch quảng cáo DoubleClick, báo cáo về nhân khẩu, sở thích của khách hàng với công cụ Google Analytics...) có thể thu thập được các thông tin như độ tuổi, giới tính, sở thích và số lần tương tác với số lần xuất hiện của quảng cáo.&lt;br&gt;Với tính năng cài đặt quảng cáo, người dùng hoặc khác hàng có thể lựa chọn thoát ra khỏi tính năng theo dõi hành vi khách hàng của Google Analytics và lựa chọn cách xuất hiện của kênh Hiển Thị Quảng Cáo trên Google&lt;br&gt;Kingsport và các nhà cung cấp bên thứ ba, bao gồm Google, Facebook… có thể sử dụng cookies của Google Analytics hoặc cookies của bên thứ ba (như DoubleClick) để thu thập thông tin, tối ưu hóa và phục vụ cho mục đích quảng cáo dựa trên lần truy cập website của người dùng trong quá khứ.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;4. Sử dụng Cookie&lt;/span&gt;&lt;br&gt;Cookie là tập tin văn bản nhỏ có thể nhận dạng tên truy cập duy nhất từ máy tính của bạn đến máy chủ của chúng tôi khi bạn truy cập vào các trang nhất định trên website và sẽ được lưu bởi trình duyệt internet lên ổ cứng máy tính của bạn. Cookie được dùng để nhận dạng địa chỉ IP, lưu lại thời gian. Chúng tôi dùng cookie để tiện cho quý khách vào web (ví dụ: ghi nhớ tên truy cập khi bạn muốn vào thay đổi lại giỏ mua hàng mà không cần phải nhập lại địa chỉ email của mình) và không đòi hỏi bất kỳ thông tin nào về bạn (ví dụ: mục tiêu quảng cáo). Trình duyệt của bạn có thể được thiết lập không sử dụng cookie nhưng điều này sẽ hạn chế quyền sử dụng của bạn trên web. Xin vui lòng chấp nhận cam kết của chúng tôi là cookie không bao gồm bất cứ chi tiết cá nhân riêng tư nào và an toàn với virus. Muốn biết thêm về cookie, vui lòng truy cập web http://www.allaboutcookies.org hoặc để tìm hiểu cách loại bỏ cookie khỏi trình duyệt, vui lòng vào http://www.allaboutcookies.org/manage-cookies/index.html.&lt;br&gt;Trình duyệt này sử dụng Google Analytics, một dịch vụ phân tích web được cung cấp bởi Google, Inc. (“Google”). Google Analytics dùng cookie, là những tập tin văn bản đặt trong máy tính để giúp website phân tích người dùng vào web như thế nào. Thông tin được tổng hợp từ cookie sẽ được truyền tới và lưu bởi Google trên các máy chủ tại Hoa Kỳ. Google sẽ dùng thông tin này để đánh giá cách dùng web của bạn, lập báo cáo về các hoạt động trên web cho các nhà khai thác web và cung cấp các dịch vụ khác liên quan đến các hoạt động internet và cách dùng internet. Google cũng có thể chuyển giao thông tin này cho bên thứ ba theo yêu cầu của pháp luật hoặc các bên thứ ba xử lý thông tin trên danh nghĩa của Google. Google sẽ không kết hợp địa chỉ IP của bạn với bất kỳ dữ liệu nào khác mà Google đang giữ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Quý khách có thể từ chối dùng cookie bằng cách chọn các thiết lập thích hợp trên trình duyệt của mình, tuy nhiên lưu ý rằng điều này sẽ ngăn bạn sử dụng triệt để chức năng của website. Bằng cách sử dụng trang web này, bạn đã đồng ý cho Google xử lý dữ liệu về bạn theo cách thức và các mục đích nêu trên.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;5. Bảo mật thông tin thanh toán&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Hình thức thanh toán trực tuyến tại website Kingsport.vn được thực hiện thông qua cổng thanh toán trung gian (ngân lượng) &amp;amp; Alepay đã được ngân hàng nhà nước Việt Nam cấp phép hoạt động.&lt;/span&gt;&lt;br&gt;Bạn không nên gửi đầy đủ chi tiết của thẻ tín dụng hay thẻ ghi nợ khi chưa được mã hóa cho chúng tôi. Chúng tôi duy trì các biện pháp bảo vệ vật lý và điện tử trong mối liên kết với thu thập, lưu trữ và tiết lộ thông tin của bạn. Các thủ tục an toàn của chúng tôi nghĩa là chúng tôi có thể đôi khi yêu cầu giấy tờ chứng minh trước khi tiết lộ thông tin cá nhân cho bạn.&lt;br&gt;Chúng tôi khuyên quý khách rằng không nên đưa thông tin chi tiết về việc thanh toán với bất kỳ ai bằng e-mail, chúng tôi không chịu trách nhiệm về những mất mát quý khách có thể gánh chịu trong việc trao đổi thông tin của quý khách qua internet hoặc email.&lt;br&gt;Mọi thông tin giao dịch trực tuyến tại website Kingsport.vn đều được bảo mật qua đối tác thanh toán Alepay.&amp;nbsp;&lt;br&gt;Các điều kiện, điều khoản và nội dung của trang web này được điều chỉnh bởi luật pháp Việt Nam và tòa án Việt Nam có thẩm quyền xem xét.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;6. Quy định về Spam.&lt;/span&gt;&lt;br&gt;Chúng tôi thực sự quan ngại đến vấn nạn Spam (thư rác), các Email giả mạo danh tín chúng tôi gởi đi. Do đó, chúng tôi &amp;nbsp;khẳng định chỉ gởi Email đến quý khách khi và chỉ khi quý khách có đăng ký hoặc sử dụng dịch vụ từ hệ thống của chúng tôi.&lt;br&gt;Chúng tôi cam kết sẽ không bán, thuê lại hoặc cho thuê email của quý khách từ bên thứ ba. Nếu quý khách vô tình nhận được Email không theo yêu cầu từ hệ thống chúng tôi do một nguyên nhân ngoài ý muốn, xin vui lòng nhấn vào link từ chối nhận Email này kèm theo, hoặc thông báo trực tiếp đến ban quản trị Website.&amp;nbsp;&lt;br&gt;Quý khách có quyền yêu cầu truy cập vào dữ liệu cá nhân của mình, có quyền yêu cầu chúng tôi sửa lại những sai sót trong dữ liệu của bạn mà không mất phí. Bất cứ lúc nào bạn cũng có quyền yêu cầu chúng tôi ngưng sử dụng dữ liệu cá nhân của bạn cho mục đích tiếp thị.&amp;nbsp;&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;7. Thay đổi về chính sách.&lt;/span&gt;&lt;br&gt;Chúng tôi hoàn toàn có thể thay đổi nội dung trong trang này mà không cần phải thông báo trước, để phù hợp với các nhu cầu của chúng tôi cũng như nhu cầu và sự phản hồi từ khách hàng nếu có. Khi cập nhật nội dung chính sách này, chúng tôi sẽ chỉnh sửa lại thời gian “Cập nhật lần cuối” bên dưới.&lt;br&gt;&amp;nbsp;Nội dung “Chính sách bảo mật” này chỉ áp dụng tại kingsport.vn , không bao gồm hoặc liên quan đến các bên thứ ba đặt quảng cáo hay có links tại website kingsport.vn . Chúng tôi khuyến khích bạn đọc kỹ chính sách An toàn và Bảo mật của các trang web của bên thứ ba trước khi cung cấp thông tin cá nhân cho các trang web đó. Chúng tôi không chịu trách nhiệm dưới bất kỳ hình thức nào về nội dung và tính pháp lý của trang web thuộc bên thứ ba.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;8. Thông tin liên hệ.&lt;/span&gt;&lt;br&gt;Chúng tôi luôn hoan nghênh các ý kiến đóng góp, liên hệ và phản hồi thông tin từ bạn về “Chính sách bảo mật” này. Nếu bạn có những thắc mắc liên quan xin vui lòng liên hệ theo địa chỉ Email: kingsport.vn@gmail.com.&lt;br&gt;Chúng tôi cam kết giữ riêng tư và an toàn mọi thông tin cá nhân của bạn — đồng thời, bạn nắm quyền kiểm soát.&lt;/p&gt;\r\n', 'Chính Sách Bảo Mật', '', 'chinh sach bao mat, chinh sach bao mat kingsport, chính sách bảo mật thông tin'),
(5, 2, 'Trả góp qua thẻ tín dụng', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;span style=&quot;font-weight: 700; font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;Từ tháng 5/2017 Kingsport triển khai chương trình ưu đãi trả góp cho khách hàng thanh toán bằng thẻ tín dụng tại khu vực TP. HCM, Hà Nội.&lt;/span&gt;&lt;/p&gt;&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;lai_suat_10_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/05_2017/lai_suat_10_1.jpg&quot; style=&quot;max-width: 100%; width: 630px; height: 420px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;u&gt;Điều kiện:&amp;nbsp;&lt;/u&gt;&lt;/span&gt;Áp dụng cho khách hàng khi mua sản phẩm Máy Chạy Bộ hoặc Ghế Massage, với thủ tục đơn giản thuận tiện, nhận sản phẩm ngay, không cần chứng minh tài chính thu nhập hay thế chấp tài sản.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Chương trình tạm thời&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;chỉ áp dụng&lt;/span&gt;&amp;nbsp;cho khách hàng có&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;thẻ tín dụng (VISA/MASTER/JCB)&lt;/span&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;được phát hành bởi&amp;nbsp;các&amp;nbsp;ngân hàng:&lt;/span&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;SACOMBANK, ANZ, SHINHAN, SEABANK, TP BANK, HSBC, VIB, SCB, EXIMBANK, MARITIMEBANK, VP BANK, TECHCOMBANK, FE CREDIT, CITIBANK, STANDARD CHARTERED, NAM A BANK, OCB, KIÊN LONG BANK, SHB, BIDV, VIETCOM BANK&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;Lưu ý:&amp;nbsp;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;Thẻ tín dụng là thẻ&amp;nbsp;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;thanh toán trước trả tiền sau&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;, được ngân hàng phát hành cho những chủ thẻ &quot;đủ điều kiện&quot;,&amp;nbsp;không phải thẻ ATM nội địa thông thường.&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Quy trình mua hàng trả góp qua thẻ tín dụng:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Chọn và mua sản phẩm:&amp;nbsp;&lt;/span&gt;Quý khách vui lòng chọn sản phẩm&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;&lt;/span&gt;có giá trị từ 5 triệu đồng trở lên để tham gia chương trình trả góp.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;2. Quý khách đến trực tiếp&amp;nbsp;showroom tại HN và HCM (bên dưới) để được tư vấn cụ thể các biểu phí liên quan và làm thủ tục thanh toán trả góp&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;- HCM:&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;1051 - 1053 Cách Mạng Tháng Tám, P.7, Q. Tân Bình.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;- Hà Nội:&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;96 Nguyễn Đình Hoàn, P. Nghĩa Đô, Q. Cầu Giấy.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Khi đi nhớ mang theo thẻ tín dụng (của chủ thẻ).&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700; color: rgb(0, 0, 0);&quot;&gt;3. Xác nhận với ngân hàng:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Tùy theo ngân hàng phát hành thẻ, trong một số trường hợp&amp;nbsp;chủ thẻ phải thông báo với ngân hàng phát hành thẻ để xác nhận về giao dịch trả góp vừa thực hiện. (Nhân viên tại cửa hàng sẽ tư vấn cụ thể)&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700; color: rgb(0, 0, 0);&quot;&gt;4. Giao hàng:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Sau khi hoàn tất thủ tục và thanh toán bằng máy pos tại&amp;nbsp;cửa hàng, Kingsport sẽ tiến hành giao hàng tận nhà cho quý khách theo thời gian quy định.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700; color: rgb(0, 0, 0);&quot;&gt;5. Thanh toán hàng tháng:&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;Hàng tháng, ngân hàng phát hành thẻ sẽ gửi sao kê số tiền tối thiểu&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;cần thanh toán và quý khách sẽ thanh toán số tiền như trên sao kê theo quy định&amp;nbsp;của ngân hàng.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;- Trừ phí chuyển đổi trả góp ban đầu quý khách sẽ không bị tính chi phí phát sinh nào khác nếu thanh toán đủ số tiền hàng tháng thể hiện trên sao kê.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;- Ngoài ra quý khách cũng có thể trả trước kỳ hạn trả góp mà không phải chịu phí phạt hay bất cứ ràng buộc&amp;nbsp;nào khác.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;- Tương ứng với mỗi đợt thanh toán hàng tháng, hạn mức thẻ của quý khách sẽ được nâng lên với giá trị tương ứng.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Quý khách có nhu cầu tham gia chương trình thanh toán&lt;/span&gt;&amp;nbsp;&lt;a href=&quot;http://kingsport.vn/&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;trả góp bằng thẻ tín dụng&lt;/span&gt;&lt;/a&gt;&amp;nbsp;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;vui lòng liên hệ.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Tp. HCM:&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;08. 22 377 084 - 08. 6679 7967&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Hà Nội:&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;(04) 2247 7979-(04) 3212 1773 -(04) 6292 2318&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hoặc email:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 205);&quot;&gt;kingsport.vn@gmail.com&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;để được hướng dẫn chi tiết..&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Hiện tại Kingsport chưa áp dụng hình thức trả góp qua công ty tài chính, rất mong Quý khách thông cảm vì sự bất tiện này.&lt;/span&gt;&lt;/p&gt;\r\n', 'THANH TOÁN TRẢ GÓP BẰNG THẺ TÍN DỤNG TẠI KINGSPORT', '', 'ghe massage mua tra gop, ghế massage mua trả góp, may chay bo mua tra gop, mua ghế massage trả góp, mua ghe massage tra gop, mua máy chạy bộ trả góp, mua may chay bo tra gop, tra gop bang the tin dụng, trả góp bằng thẻ tín dụng, trả góp máy chạy bộ'),
(3, 2, 'Định hướng phát triển', '&lt;p&gt;&lt;a href=&quot;https://www.kingsport.vn/&quot; target=&quot;_self&quot; title=&quot;Định hướng phát triển&quot; style=&quot;color: rgb(223, 32, 37); outline: 0px; background-color: rgb(255, 255, 255); font-size: 14px; line-height: 20px; transition: all 0.5s ease 0s; display: block; position: relative; padding: 0px 0px 0px 27px; font-family: Arial, Tahoma;&quot;&gt;Định hướng phát triển&lt;/a&gt;&lt;/p&gt;\r\n', 'Định hướng phát triển', '', 'Định hướng phát triển'),
(6, 2, 'Cam Kết Về Thông Tin', '&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px;&quot;&gt;Chào mừng bạn đến với website:&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://www.kingsport.vn/&quot; style=&quot;box-sizing: border-box; color: rgb(0, 0, 0); text-decoration: none; outline: 0px; background-color: transparent; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;www.kingsport.vn&lt;/a&gt;. Cảm ơn bạn đã sử dụng và ủng hộ dịch vụ của chúng tôi. Website này được duy trì và quản lý bởi Công ty TNHH XNK Phát Triển Đông Dương, có trụ sở đặt tại: Số 17, Lô B, Đường sô 1, KDC Phú Mỹ, KP1, P. Phú Mỹ, Q.7, Tp. HCM (Sau đây gọi chung là KINGSPORT hoặc Chúng Tôi)&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;em style=&quot;box-sizing: border-box; font-style: italic;&quot;&gt;Kingsport.vn là một trang thông tin chính thức cung cấp cho khách hàng những thông tin chi tiết giới thiệu về sản phẩm, dịch vụ &amp;amp; các tin tức liên quan đến dịch vụ kinh doanh của KINGSPORT.&lt;/em&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;Thông qua việc tiếp cận nội dung trên Trang web này, BẠN toàn quyền quyết định việc tiếp nhận thông tin cung cấp từ chúng tôi &amp;amp; có trách nhiệm đánh giá tính chính xác, đầy đủ hay độ tin cậy của các thông tin này. Chúng tôi khẳng định rằng những nội dung mà chúng tôi cung cấp trên website này không nhằm mục đích ép buộc, dụ dỗ, gây hiểu nhầm hoặc cố tình gây hiểu nhầm ảnh hưởng đến quyết định của người dùng.&lt;br style=&quot;box-sizing: border-box;&quot;&gt;Vui lòng đọc qua các nội dung dưới đây và hiểu rõ trách nhiệm của bạn, của chúng tôi đối với các thông tin đăng tải trên website: kingsport.vn&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;1. Trách nhiệm của chúng tôi với sản phẩm.&lt;/strong&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;Tất cả các sản phẩm được cung cấp tại website kingsport .vn là chính hãng và đều có nguồn gốc xuất xứ rõ ràng, minh bạch.&lt;br style=&quot;box-sizing: border-box;&quot;&gt;Chúng tôi luôn cố gắng đảm bảo rằng mọi sản phẩm đến tay người tiêu dùng đều an toàn, trải qua những quy trình kiểm định chất lượng và không gây nguy hại đến sức khoẻ người sử dụng.&amp;nbsp;Việc cung cấp cho khách hàng những sản phẩm chất lượng và dịch vụ tốt nhất là ưu tiên hàng đầu của chúng tôi.&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;2. Trách nhiệm đối với thông tin:&lt;/strong&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;Tất cả các thông tin liên quan đến THÔNG SỐ KỸ THUẬT, đặc tính/quy cách sản phẩm &amp;amp; các cam kết về dịch vụ đi kèm như bảo hành, bảo trì mà chúng tôi cung cấp trên website (tại thời điểm bạn mua hàng) là hoàn toàn chính xác.&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;Định kỳ chúng tôi có thể bổ sung, thay đổi hoặc làm mới các thông tin (khi sản phẩm của chúng tôi có sự thay đổi về tính năng mẫu mã) mà không cần phải báo trước.&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;Các thông tin/nội dung liên quan về tác dụng/công dụng của việc sử dụng sản phẩm đến sức khỏe người sử dụng chỉ mang tính chất tham khảo chung, được lấy từ các nguồn khác nhau trên internet theo các nghiên cứu của các chuyên gia y tế, sức khỏe… mặc dù các thông tin này có thể tin cậy được, tuy nhiên Kingsport sẽ không cam kết đảm bảo hoặc chứng nhận độ chính xác, độ tin cậy, sự đầy đủ hay tính cập nhật của nội dung đó.&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;3. Tuyên bố từ chối đảm bảo (trách nhiệm)&lt;/strong&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;Chúng tôi tin rằng việc luyện tập thể thao để có một sức khỏe tốt là điều ai củng công nhận mà không cần phải chứng minh hay dẫn chứng cụ thể,Tuy nhiên&amp;nbsp;do tùy theo cơ địa mỗi người, tùy theo cách thức sử dụng và thói quen sinh hoạt mà kết quả mang lại có thể khác đi so với thông tin ban đầu về công dụng của sản phẩm đã được cung cấp trên website kingsport.vn. Tuyên bố từ chối đảm bảo này áp dụng đối với những phản hồi về việc sử dụng sản phẩm nhưng kết quả không như mong đợi.&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;Ngoài ra đối với những trường hợp khách hàng đang có vấn đề về sức khỏe và thuộc diện “chăm sóc đặc biệt” từ nhân viên y tế, chúng tôi khuyến khích việc tham vấn ý kiến của bác sỹ trước khi sử dụng sản phẩm.&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;Chúng tôi không cam kết việc sử dụng sản phẩm tại kingsport.vn nhằm mục đích điều trị hoặc thay thế các phương pháp chữa bệnh thông thường.&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;Mọi phản hồi hoặc ý kiến đóng góp về nội dung website&amp;nbsp;vui lòng gửi về Phòng Truyền Thông (Tập đoàn Kingsort) qua&amp;nbsp;mail: kingsport.vn@gmail.com.&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;https://www.kingsport.vn/cam-ket-ve-san-pham-va-cac-thong-tin-cung-cap-cua-kingsport.html&quot; target=&quot;_self&quot; title=&quot;Cam Kết Về Thông Tin&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; background-color: rgb(255, 255, 255); font-size: 14px; line-height: 20px; transition: all 0.5s ease 0s; display: block; position: relative; padding: 0px 10px 0px 17px; font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700; color: rgb(102, 102, 102); text-align: justify;&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: right;&quot;&gt;&amp;nbsp;Theo Phòng Truyền Thông&amp;nbsp;Kingsport Việt Nam&lt;/p&gt;\r\n', 'CAM KẾT VỀ SẢN PHẨM VÀ CÁC THÔNG TIN CUNG CẤP CỦA KINGSPORT', '', 'cam kết về nội dung, trách nhiệm nội dung, tuyen bo tu choi trach nhiem, tuyên bố từ chối trách nhiệm'),
(7, 2, 'Tầm nhìn và sứ mệnh', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;u&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Sứ mệnh của chúng tôi:&lt;/span&gt;&lt;/u&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Là tập đoàn bán lẻ hàng đầu Việt Nam trong lĩnh vực thể thao, cung cấp các sản phẩm và dịch vụ theo chuẩn mực quốc tế với giá cả hợp lý, với mong muốn mang lại sức khỏe và thịnh vượng cho dân tộc thông qua việc cung cấp các sản phẩm thiết bị “chăm sóc sức khỏe” giá cả hợp lý phù hợp cho mọi người mọi nhà. Qua đó góp phần xây dựng đất nước, hỗ trợ cộng đồng và đem lại cho mỗi thành viên của mình một môi trường làm việc tốt nhất để phát triển tài năng nghề nghiệp, đồng thời có một cuộc sống đầy đủ về vật chất, phong phú về tinh thần.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;u&gt;Tầm nhìn dài hạn:&lt;/u&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Việt Nam đang trên đà đổi mới và phát triển mạnh mẽ, mong muốn được đóng góp vào quá trình phát triển của dân tộc là khát vọng của mọi cá nhân, tổ chức. Chúng tôi lựa chọn con đường kinh doanh “bán lẻ dụng cụ thể thao” với mục tiêu trước tiên “mang lại sức khỏe” cho người sử dụng, tạo điều kiện tốt nhất cho mọi cá nhân được cống hiến vào quá trình xây dựng và phát triển đất nước. Hơn thế nữa các sản phẩm chúng tôi đang cung cấp chứa đựng tính nhân văn, cộng đồng sâu sắc nhằm góp phần “nâng cao thể lực &amp;amp; chiều cao” của người Việt so với khu vực và tiến tới đạt chuẩn trung bình trên thế giới.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Nằm trong chiến lược lâu dài của nhà nước về việc hạn chế nhập siêu, chúng tôi đang hướng đến việc đầu tư dây chuyền sản xuất máy chạy bộ tại Việt Nam không chỉ phục vụ thị trường trong nước mà còn xuất khẩu ra các thị trường nước ngoài nhằm đem lại nguồn ngoại tệ đóng góp vào sự phát triển của nước nhà.&lt;br&gt;Kingsport đã đang và sẽ kinh doanh theo hướng:&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chuyên nghiệp – Chất Lượng – Luôn đổi mới&lt;/span&gt;&amp;nbsp;và hoàn thiện, những năm qua Kingsport không ngừng nỗ lực phấn đấu trở thành công ty được khách hàng đánh giá cao về chất lượng, chiến lược phát triển dài hạn của kingsport được thể hiện qua các định hướng như sau:&lt;br&gt;•&amp;nbsp;Chất lượng sản phẩm và dịch vụ là yếu tố quyết định, xây dựng thương hiệu dựa trên uy tín chất lượng.&lt;br&gt;•&amp;nbsp;Nâng cao năng lực cạnh tranh bằng cách đa dạng hóa mẫu mã, cải thiện tính năng các sản phẩm mới.&lt;br&gt;•&amp;nbsp;Phát triển hệ thống phân phối bán lẻ trực tiếp đến tay người tiêu dùng trên toàn lãnh thổ Việt Nam.&lt;br&gt;•&amp;nbsp;Phát triển nguồn nhân lực bền vững với con người là yếu tố trọng tâm.&lt;/p&gt;', 'TẦM NHÌN &amp; SỨ MỆNH', '', 'tầm nhìn, tam nhin su menh'),
(8, 2, 'Giới thiệu chung', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;TỔNG QUAN VỀ KINGSPORT&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/1.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 445px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;div class=&quot;style-box&quot; style=&quot;margin: 0px; padding: 25px; background: rgb(245, 245, 245); color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Kingsport tự hào là tập đoàn bán lẻ hàng đầu Việt Nam với các dịch vụ và hệ sinh thái chăm sóc sức khỏe.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Hơn 10 năm qua Kingsport đã thể hiện một cam kết kiên định trong hoạt động kinh doanh, đó là tập trung vào chất lượng sản phẩm lấy khách hàng là yếu tố cốt lõi để phát triển, với sự chính trực và quyết liệt. Bằng cách làm đúng theo cam kết này chúng tôi đã tạo dựng được uy tín hàng đầu tại Việt Nam trong lĩnh vực cung cấp thiết bị thể thao &amp;amp; thiết bị chăm sóc sức khỏe thông minh.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Vì chúng tôi tin rằng cách chúng tôi kinh doanh cũng quan trọng như những kết quả mà chúng tôi đã đạt được, chúng tôi không ngừng phấn đấu để nâng cấp cũng như đẩy mạnh những chức năng đa dạng của mình và triển vọng mở rộng trên khắp lãnh thổ Việt Nam để xây dựng một doanh nghiệp có đóng góp cho cộng đồng và trách nhiệm với xã hội.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/2.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 489px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;TẦM NHÌN &amp;amp; SỨ MỆNH&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/3.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 676px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;THÔNG ĐIỆP - SỨ MỆNH -SLOGAN|&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;ÔNG HOÀNG CHO SỨC KHỎE&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;em&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 28px;&quot;&gt;“&amp;nbsp;&lt;/span&gt;Cuộc sống là một hành trình dài, có một sức khỏe tốt là hành trang vững vàng để bạn có thể tự tin bước đi trên hành trình ấy. Đó cũng chính là thông điệp mà chúng tôi muốn thông qua những sản phẩm của mình sẽ mang lại những giá trị tốt đẹp nâng cao chất lượng cuộc sống và tiện ích cho mọi người dân Việt Nam. Làm thế nào để mọi Gia Đình tại Việt Nam đều có thể sở hữu những sản phẩm chăm sóc sức khỏe chất lượng tốt nhất, đó là việc mà chúng tôi luôn nỗ lực không ngừng trong những năm qua.&lt;span style=&quot;font-size: 28px;&quot;&gt;”&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;5giatri&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/5giatri.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 500px;&quot;&gt;&lt;img alt=&quot;4_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/4_1.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 901px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;3.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;GIÁ TRỊ CỐT LÕI&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;5&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/5.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 744px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;4.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MẠNG LƯỚI HỆ THỐNG KINGSPORT&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;img alt=&quot;6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/about/6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 1189px;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;', 'Giới thiệu chung', '', ''),
(9, 2, 'Hướng dẫn mua hàng', '&lt;ul style=&quot;box-sizing: inherit; margin-bottom: 1rem; list-style: none; padding-inline-start: 0px; color: rgb(33, 37, 41); font-family: Roboto, sans-serif; font-size: 16px; background-color: rgb(245, 245, 245);&quot;&gt;&lt;li style=&quot;box-sizing: inherit; margin-bottom: -1rem;&quot;&gt;&lt;a href=&quot;http://kingsport.tqdesign.vn/html/#&quot; style=&quot;box-sizing: inherit; color: rgb(102, 102, 102); font-size: 1rem; font-family: Muli; letter-spacing: 0.05469rem; line-height: 1.5rem;&quot;&gt;Hướng dẫn mua hàng&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;', 'Hướng dẫn mua hàng', '', '');
INSERT INTO `ks_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(10, 2, 'Tiêu chí bán hàng', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Tại Kingsport chúng tôi đảm bảo sẽ gửi đến Quý khách những sản phẩm chất lượng tốt nhất, Chúng tôi tin rằng việc lựa chọn một sản phẩm giá trị và đặt hàng qua điện thoại, hay mạng internet là một việc khó khăn và chưa phải thói quen mua sắm của người Việt, nhưng bằng cách nào đó chúng tôi mong muốn rằng điều này sẽ thay đổi khi bạn quyết định mua hàng tại Kingsport, và chúng tôi đang nỗ lực hết mình để làm được điều đó.&amp;nbsp;&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Tập trung vào sản phẩm:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Chúng tôi tin rằng việc khuyến mãi hay quà tặng đi kèm không phải là yếu tố ảnh hưởng đến quyết định mua hàng của bạn tại Kingsport mà đó là vì chất lượng thực sự trong mỗi sản phẩm mà chúng tôi cung cấp. Điều chúng tôi quan tâm đó là làm sao để bạn mua hàng của chúng tôi vào những lần sau và sau nữa, chúng tôi cho rằng sự trung thành của khách hàng không phải là điều mà chúng tôi có thể mua (hoặc giành) được mà nó đến từ một nơi sâu hơn, có thể là việc kinh doanh bằng những cách trung thực, những cách không thể quảng bá hay mã hoá bằng công nghệ.&amp;nbsp;&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2. Tập trung vào khách hàng:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Chúng tôi quan niệm rằng khách hàng là yếu tố cốt lõi để chúng tôi tồn tại và phát triển vì vậy định hướng phục vụ và chăm sóc khách hàng tận tình, ân cần, chu đáo là tiêu chí xuyên suốt trong quá trình hoạt động kinh doanh của chúng tôi. Làm thế nào để thoả mãn đến mức tối đa nhu cầu ngày càng cao của khách hàng về chất lượng sản phẩm phong cách phục vụ và tính hiệu quả của chi phí là đều vô cùng quan trọng đối với chúng tôi, cũng như là động lực của chúng tôi trên đường phát triển&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;3. Có trách nhiệm với sản phẩm:&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Tại kingsport, chúng tôi đảm bảo sẽ gửi đến người dùng những sản phẩm an toàn cam kết không gây nguy hại đến sức khỏe với chất lượng tốt nhất. Chúng tôi luôn xem xét kỹ mọi thứ trước khi chuyển đến Quý khách để đảm bảo chúng trong tình trạng tốt nhất, đồng thời cũng cố gắng hết sức để đóng gói và bảo vệ tất cả chúng không bị hư hại trên đường vận chuyển. Tuy nhiên nếu quý khách gặp phải vấn đề không mong muốn do lỗi từ chúng tôi, chúng tôi rất xin lỗi và sẽ có phương án đổi trả, đền bù hợp lý nhất.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;4. Giá tốt nhất:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Bằng chính sách cung cấp sản phẩm trực tiếp từ nhà sản xuất đến người sử dụng, không qua bất cứ đơn vị trung gian nào. Bằng cách làm này chúng tôi đã giảm thiểu tối đa các chi phí phát sinh trung gian ảnh hưởng đến giá thành sản phẩm đồng thời đảm bảo mức giá hợp lý nhất đến người sử dụng. Với mong muốn mọi người dân Việt Nam đều có cơ hội tiếp cận những sản phẩm chăm sóc sức khỏe thông minh hiện đại.&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;5. Đa dạng hóa sản phẩm:&amp;nbsp;&lt;/span&gt;&lt;br&gt;Với vị thế là hệ thống chuỗi Trung tâm mua sắm chuyên ngành hàng thể thao, thiết bị chăm sóc sức khỏe lớn nhất hiện nay, sản phẩm bày bán tại hệ thống Kingsport vô cùng đa dạng và phong phú. Từ những dòng sử dụng cho cá nhân, gia đình đến thiết bị cao cấp cho phòng GYM, khách sạn, resort…&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;6. Miễn phí vận chuyển.&lt;/span&gt;&lt;br&gt;Khi mua hàng tại Kingsport quý khách hàng sẽ được cung cấp chính sách giao nhận lắp đặt miễn phí toàn bộ các dịch vụ chi phí lắp ráp và vận chuyển tùy theo một số sản phẩm nằm trong chính sách của chúng tôi (Xem thêm chi tiết chính sách giao nhận).&lt;br&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;7. Hậu mãi chu đáo tận tâm:&lt;/span&gt;&amp;nbsp;Tất cả các sản phẩm Kingsport cung cấp sẽ được bảo hành (trong thời hạn quy định) và bảo trì trọn đời, hỗ trợ sửa chữa, thay thế linh phụ kiện trong suốt quá trình sử dụng sản phẩm. Với những chính sách bảo hành, bảo trì trung thực &amp;amp; rõ ràng, phong cách phục vụ chuyên nghiệp &amp;amp; hiện đại đó là sự khác biệt từ chúng tôi.&lt;/p&gt;', 'TIÊU CHÍ BÁN HÀNG', '', 'may chay bo kingsport co tot khong, máy chạy bộ kingsport có tốt không, tieu chi ban hang, tiêu chí bán hàng, tieu chi ban hang kingsport'),
(11, 2, 'Hướng dẫn thanh toán', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;I. Các hình thức thanh toán:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Thanh toán trả trước:&amp;nbsp;&lt;/span&gt;là hình thức thanh toán trực tuyến mà khách hàng sử dụng để&amp;nbsp;thanh toán cho đơn hàng, bao gồm:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Voucher/giftcode.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Thẻ ATM (thẻ ghi nợ, thanh toán, trả trước nội địa)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Thẻ thanh toán quốc tế, thẻ tín dụng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Thanh toán trả góp bằng thẻ tín dụng (của một số ngân hàng)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Thanh toán bằng tiền mặt hoặc qua máy cà thẻ tại cửa hàng của kingsport.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Trường hợp thanh toán bằng tài khoản điểm thành viên Kingsport hoặc voucher/giftcode quý khách vui lòng xem trước các điều kiện áp dụng riêng đối với các hình thức thanh toán này hoặc theo hướng dẫn của nhân viên tư vấn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2. Thanh toán trả sau tại nhà:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Thanh toán tiền mặt.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Thẻ ATM, thẻ tín dụng, thẻ thanh toán quốc tế qua máy cà thẻ của ngân hàng. (trường hợp quý khách chọn thanh toán qua hình thức cà thẻ vui lòng báo trước cho chúng tôi tại thời điểm đặt hàng)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;II. Hình thức thanh toán trước qua tài khoản ngân hàng:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Khi lựa chọn hình thức thanh toán thủ công bằng cách chuyển tiền qua tài khoản ngân hàng của chúng tôi (từ dịch vụ chuyên tiền qua internet banking, mobile banking, nộp tiền mặt tại ngân hàng… ) quý khách vui lòng lựa chọn 1 trong số các tài khoản dưới đây và làm theo hướng dẫn bên dưới:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;chinh-sach-thanh-toan-01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/11_2016/chinh-sach-thanh-toan-01.png&quot; style=&quot;max-width: 100%; width: 800px; height: 556px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Nội dung chuyển tiền:&lt;/span&gt;&amp;nbsp;Để được xác nhận thông tin chuyển tiền nhanh hơn, trong phần nội dung chuyển tiền quý khách vui lòng soạn theo mẫu: (họ tên, tỉnh, sdt, thông tin sản phẩm đơn đặt hàng)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Ví dụ: “NGUYEN VAN A, QUANG NINH, DT:0914 xxx 245, TT TIEN HANG SAN PHAM ABC…”&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2. Lựa chọn ngân hàng:&lt;/span&gt;&amp;nbsp;vui lòng lựa chọn ngân hàng phù hợp nhất với tài khoản ngân hàng quý khách đang sử dụng để thời gian nhận tiền và xử lý đơn đặt hàng của quý khách được nhanh hơn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Trường hợp chuyển khoản khác hệ thống ngân hàng thời gian xác nhận tiền vào tài khoản có thể mất 2-3 ngày làm việc. Chúng tôi sẽ phản hồi ngay đến quý khách sau khi nhận được thông báo hoàn tất giao dịch từ ngân hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;III. Hình thức thanh toán trực tuyến tại website kingsport.vn.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Thanh toán bằng thẻ nội địa: Áp dụng cho những khách hàng có đăng ký sử dụng dịch vụ Internet Banking.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;2. Thanh toán bằng thẻ Visa/Master/JCB.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;3. Thanh toán trả góp bằng thẻ tín dụng&lt;/p&gt;', 'CHÍNH SÁCH THANH TOÁN', '', 'chinh sach kingsport, chinh sach mua hang, chinh sach thanh toan'),
(12, 2, 'Chính sách đổi trả', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Chính sách đổi trả sản phẩm của Kingsport: quy định các lý do chấp nhận đổi trả, yêu cầu cho sản phẩm được đổi trả và thời gian xử lý đổi trả cho khách hàng.&lt;/p&gt;&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;I. Lý do chấp nhận đổi trả:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Sản phẩm giao không đúng chủng loại, mẫu mã như đơn đặt hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Bị giao sai về số lượng, thiếu linh phụ kiện đi kèm so với đơn đặt hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Sản phẩm bị hỏng do lỗi nhà sản xuất (&lt;em&gt;hỏng hóc về kỹ thuật, lỗi về thiết kế, nội dung, các lỗi ẩn tì/nội tì, khác biệt so với tiêu chuẩn chất lượng đã công bố của nhà sản xuất) hoặc lỗi trong quá trình vận chuyển (bị biến dạng, trầy xước, vấy bẩn, nứt vỡ v.v.)&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Khách hàng thay đổi nhu cầu sử dụng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;II. Điều kiện đổi trả:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;1. Yêu cầu cho sản phẩm đổi trả&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Sản phẩm phải còn nguyên vẹn theo quy cách ban đầu, đầy đủ nhãn mác, tem (nếu có). Trừ trường hợp sản phẩm bị lỗi hoặc hư hại trong quá trình vận chuyển)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Sản phẩm phải còn đủ phụ kiện (hướng dẫn sử dụng, phiếu bảo hành) và linh phụ kiện hoặc tặng phẩm đi kèm (nếu có)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Sản phẩm không bị biến dạng, dơ bẩn hoặc các dấu hiệu khác chứng tỏ đã qua sử dụng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Khi có yêu cầu đổi trả hàng khách hàng vui lòng liên hệ với chúng tôi qua các số điện thoại tại chi nhánh gần nhất hoặc tổng đài 18006862 đồng thời cung cấp đầy đủ các giấy tờ chứng minh khách hàng đã mua sản phẩm tại Kingsport (hóa đơn bán hàng, phiếu bảo hành, biên nhận giao hàng, sao kê ngân hàng…) sản phẩm cần đổi trả và tặng phẩm đi kèm (nếu có)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;2. Thời gian đổi trả:&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Trừ khi có những quy định khác trong phần giới thiệu mô tả cụ thể của sản phẩm trên website www.kingsport.vn. Yêu cầu đổi trả hàng của quý khách phải được thông báo đến chúng tôi trong vòng 7 ngày kể từ ngày nhận được sản phẩm. Thời gian xác nhận đổi trả hàng là lúc khách hàng cung cấp đầy đủ yêu cầu đổi trả và hóa đơn chứng từ hợp lệ chứng minh đã mua hàng tại Kingsport.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;3. Chi phí đổi trả:&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Đối với các sản phẩm do lỗi của Kingsport, khách hàng sẽ được miễn phí đổi trả.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Đối với các sản phẩm trả lại do khách hàng thay đổi nhu cầu sử dụng (lưu ý: sản phẩm phải đủ điều kiện yêu cầu cho sản phẩm đổi trả và thời gian quy định) khách hàng sẽ được miễn phí đổi trả và sẽ phải thanh toán chi phí vận chuyển theo chính sách giao nhận của Kingsport.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;III. Quy định hoàn tiền:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;1. Nguyên tắc hoàn tiền:&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Phương thức hoàn tiền căn cứ theo phương thức thanh toán tương ứng của khách hàng khi mua hàng (trừ khi có những giải pháp được 2 bên thỏa thuận).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Hoàn tiền khi khách hàng sử dụng Voucher/Giftcode/Điểm tích lũy: trong các trường hợp đặc biệt được Kingsport chấp nhận hoàn tiền khi khách hàng sử dụng Voucher/Giftcode/Điểm tích lũy. Kingsport sẽ không hoàn lại khoản giá trị Voucher/Giftcode/Điểm tích lũy khách hàng đã sử dụng mà chỉ hoàn lại khoản tiền thực tế bỏ ra mua hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;2. Phương thức hoàn tiền:&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Hoàn tiền mặt tại các trung tâm Kingsport.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Hoàn tiền thông qua ngân hàng chấp nhận thẻ (thanh toán bằng thẻ tín dụng)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Hoàn tiền thông qua chuyển khoản ngân hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;u&gt;3. Thời gian xử lý:&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Kingsport sẽ phản hồi yêu cầu đổi trả của khách hàng qua email,sms, điện thoại trong tối đa 2 ngày làm việc kể từ khi chúng tôi tiếp nhận yêu cầu đổi trả hợp lệ từ khách hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Nếu yêu cầu đổi trả của khách hàng đáp ứng các điều kiện quy định (trong các mục của chính sách đổi trả Kingsport như trên) Kingsport sẽ thực hiện thủ tục hoàn tiền cho khách hàng kể từ khi yêu cầu đổi trả được thực hiện trong thời gian như sau:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;+ Với phương thức thanh toán không thông qua ngân hàng hoặc dịch vụ COD: khách hàng sẽ nhận được tiền từ 5-7 ngày làm việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;+ Với phương thức thanh toán thông qua ngân hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;++ Giao dịch chuyển khoản từ các thẻ ATM nội địa của quý khách đến tài khoản ngân hàng của Kingsport: khách hàng sẽ nhận được tiền từ 5-7 ngày làm việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;++ Giao dịch thanh toán bằng thẻ tín dụng của các tổ chức quốc Tế: Việc thanh toán bằng thẻ tín dụng khi có phát sinh hoàn tiền sẽ phải qua nhiều thủ tục nhằm mục đích chống gian lận và thời gian tra soát từ ngân hàng. Kingsport sẽ hoàn tất thủ tục hoàn tiền để chuyển đến ngân hàng trong vòng 3-5 ngày làm việc. Sau đó, ngân hàng sẽ tiếp tục xử lý yêu cầu hoàn tiền của quý khách trong vòng 7-15 ngày làm việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;em&gt;Lưu ý: để đảm bảo quyền lợi của quý khách, trước khi nhận hàng quý khách vui lòng kiểm tra kỹ tình trạng hàng hóa và xác nhận bằng việc ký tên vào biên nhận giao hàng.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;chinh-sach-YYi-trY-hang-600x107&quot; src=&quot;https://www.kingsport.vn/vnt_upload/news/11_2016/chinh-sach-YYi-trY-hang-600x107.jpg&quot; style=&quot;max-width: 100%; opacity: 0.9; width: 600px; height: 107px;&quot;&gt;&lt;/p&gt;', 'CHÍNH SÁCH ĐỔI TRẢ SẢN PHẨM', '', 'CHINH SACH BÁN HANG, CHINH SACH DOI TRA HANG, DOI TRA HANG'),
(13, 2, 'Chính sách vận chuyển', '&lt;div align=&quot;justify&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Kingsport luôn hướng đến việc cung cấp dịch vụ vận chuyển tốt nhất với chi phí cạnh tranh cho tất cả các đơn đặt hàng từ quý khách. Chúng tôi giao hàng trên toàn quốc với chính sách cụ thể như sau:&lt;/span&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;I. Các hình thức giao hàng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1.&lt;/span&gt;&amp;nbsp;Giao hàng &amp;nbsp;tận nhà: đối với các sản phẩm nặng, cồng kềnh… trong phạm vi có hỗ trợ giao hàng tận nhà theo quy định từ Kingsport (*)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2.&lt;/span&gt;&amp;nbsp;Giao hàng qua dịch vụ vận tải: Trong một số trường hợp, hoặc để rút ngắn thời gian nhận hàng quý khách có thể lựa chọn hình thức vận chuyển qua dịch vụ vận chuyển (bên tứ ba) như nhà xe khách, xe tải, công ty vận chuyển …&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;3.&lt;/span&gt;&amp;nbsp;Giao hàng qua bưu điện hoặc dịch vụ chuyển phát nhánh: hình thức này ít được sử dụng tại kingsport vì đa số sản phẩm nặng cồng kềnh… Quý khách có nhu cầu nhận hàng qua hình thức này phải thanh toán mọi chi phí phát sinh trong quá trình giao nhận với đơn vị vận chuyển.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;4.&lt;/span&gt;&amp;nbsp;Nhận hàng tại cửa hàng: Quý khách có thể đến các showroom Kingsport thanh toán và nhận hàng ngay tại showroom.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;II. Chi phí vận chuyển:&lt;/span&gt;&amp;nbsp;Trong những trường hợp cụ thể chi phí vận chuyển có thể phát sinh thêm, nhân viên của Kingsport sẽ liên hệ xác nhận cụ thể với quý khách hàng trước khi chúng tôi tiến hành giao hàng cho Quý khách.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1.&lt;/span&gt;&amp;nbsp;Vận chuyển miễn phí&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;đối với những đơn hàng trên 2.000.000đ&lt;/span&gt;&amp;nbsp;trong những trường hợp sau:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Tất cả các đơn đặt hàng trong Bán kính 50km từ chi nhánh gần nhất của Kingsport điều được miễn phí vận chuyển (trừ những đơn hàng thanh lý hoặc đã giảm giá…)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Đối với các đơn hàng: Máy chạy bộ, ghế massage, xe đạp tập… sản phẩm cồng kềnh sẽ được giao hàng miễn phí với điều kiện thời gian giao hàng sẽ do Kingsport quy định.&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;Ngoại trừ các trường hợp sau:&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;+ Yêu cầu nhận hàng nhanh:&lt;/span&gt;&amp;nbsp;có thể sẽ phát sinh thêm chi phí vận chuyển, chi phí này do 2 bên thống nhất tại thời điểm mua hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;+ Các khu vực chưa hỗ trợ giao hàng miễn phí:&lt;/span&gt;&amp;nbsp;Hải đảo (Phú Quốc, Côn Đảo, Lý Sơn, Cát Bà…) và các Tỉnh: Hà Giang, Điện Biên, Sơn la, Lai Châu, Tuyên Quang, Yên Bái, Cao Bằng, Bắc Cạn, Thành phố Móng Cái (Quảng Ninh), một phần tỉnh Kon Tum, Gia Lai .&amp;nbsp; Trong những trường hợp cụ thể tùy theo giá trị của đơn hàng, Kingsport có thể linh động hỗ trợ miễn phí giao nhận cho Quý khách.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;III. Thời gian giao hàng:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;1. Bán kính 50km từ showroom gần nhất: Thời gian giao hàng không quá 2 ngày làm việc&amp;nbsp; (trừ khi sản phẩm đang tạm hết hàng đã thông báo trước với Quý khách)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;2. Bán kính 50 – 100km từ showroom gần nhất: thời gian giao hàng từ 2-3 ngày làm việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;3. Bán kính 100km – 200km từ showroom gần nhất: thời gian giao hàng từ 5- 7 ngày làm việc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;4. Bán kính trên 200km từ showroom gần nhất: thời gian giao hàng từ 5-15 ngày làm việc (trường hợp có đơn hàng cùng tuyến có thể ghép đơn chúng tôi có thể hỗ trợ giao sớm hơn)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;IV.&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;Trách nhiệm với hàng hóa vận chuyển:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Nếu dịch vụ vận chuyển do Kingsport giao nhận sẽ chịu trách nhiệm với hàng hóa và các rủi ro như mất mát hoặc hư hại của hàng hóa trong suốt quá trình vận chuyển hàng từ chúng tôi đến quí khách&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Quí khách có trách nhiệm kiểm tra hàng hóa khi nhận hàng. Khi phát hiện hàng hóa bị hư hại, trầy xước, bể vỡ, mốp méo, hoặc sai hàng hóa thì ký xác nhận tình trạng hàng hóa với Nhân viên giao nhận và thông báo ngay cho Bộ phận chăm sóc khách hàng :&amp;nbsp;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Sau khi quí khách đã ký nhận hàng mà không ghi chú hoặc có ý kiến về hàng hóa. Kingsport không có trách nhiệm với những yêu cầu đổi trả vì hư hỏng, trầy xước, bể vỡ, mốp méo, sai hàng hóa,… từ quí khách sau này.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;- Nếu dịch vụ vận chuyển do quí khách chỉ định và lựa chọn thì quí khách sẽ chịu trách nhiệm với hàng hóa và các rủi ro như mất mát hoặc hư hại của hàng hóa trong suốt quá trình vận chuyển hàng từ Kingsport &amp;nbsp;đến quí khách. Khách hàng sẽ chịu trách nhiệm cước phí và tổn thất liên quan&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Ghi chú(*):&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Phạm vi&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;chưa hỗ trợ giao hàng tận nhà:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Khu vực hải đảo: Phú Quốc, Cát Bà, Côn Đảo, Lý Sơn…&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Khu vực các Tỉnh: Hà Giang, Điện Biên, Sơn la, Lai Châu, Tuyên Quang, Cao Bằng, Bắc Cạn.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Một phần các tỉnh: Yên Bái, Quảng Ninh (Tp. Móng Cái), Kon Tum, Gia Lai, Quảng Ngãi, Bình Định, Phú Yên, Ninh Thuận, Bình Thuận, Đăk Nông, Lâm Đồng, Hà Tĩnh, Quảng Bình, Quảng Trị.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma;&quot;&gt;Phạm vi&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;có hỗ trợ giao hàng tận nhà:&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(102, 102, 102); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Toàn bộ khu vực các tỉnh Miền Đông &amp;amp; Miền Tây Nam Bộ, Đồng bằng Bắc Bộ (ngoại trừ một phần tỉnh Quảng Ninh) và các tỉnh&amp;nbsp;Huế. Đà Nẵng, Quảng Nam, Nghệ An, Khánh Hòa, Đăk Lăk.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Một phần các tỉnh (khu vực thành phố và huyện thị xã có giao thông thuận lợi): Yên Bái, Quảng Ninh (ngoại trừ Tp. Móng Cái &amp;amp; khu vực lân cận Móng Cái), Kon Tum, Gia Lai, Quảng Ngãi, Bình Định, Phú Yên, Ninh Thuận, Bình Thuận, Đăk Nông, Lâm Đồng, Hà Tĩnh, Quảng Bình, Quảng Trị, Thanh Hóa.&lt;/li&gt;&lt;/ul&gt;', 'CHÍNH SÁCH VẬN CHUYỂN GIAO NHẬN', '', 'chính sach mua hang, chinh sach van chuyen');
INSERT INTO `ks_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(14, 2, 'Chính sách bảo hành', '&lt;blockquote style=&quot;padding: 0px; margin-bottom: 0px; font-size: 17.5px; line-height: 24px; font-style: italic; color: rgb(153, 153, 153); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; margin-left: 40px; font-size: 14px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Thông báo về việc chuyển sang hình thức bảo hành điện tử.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; margin-left: 40px; font-size: 14px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;TẬP ĐOÀN THỂ THAO KINGSPORT xin trân trọng thông báo đến quý khách hàng về việc triển khai hình thức &quot;Bảo hành điện tử&quot; thay cho phiếu bảo hành từ ngày 22/03/2019.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; margin-left: 40px; font-size: 14px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Đây là hình thức mới mà hãng mong muốn đảm bảo quyền lợi cho khách hàng cũng như việc đưa ra các chương trình chăm sóc khách hàng tốt hơn.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-left: 40px; font-size: 14px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;KHÁCH HÀNG CHỈ CẦN CUNG CẤP SỐ ĐIỆN THOẠI LÚC MUA HÀNG&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;I. Thống nhất việc diễn giải và sử dụng từ ngữ:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Bảo hành: khắc phục những lỗi hỏng hóc, sự cố kỹ thuật xảy ra do lỗi của nhà sản xuất.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Bảo trì, bảo dưỡng: bao gồm vệ sinh lau chùi sản phẩm, cài đặt các chương trình, tra dầu, quét bụi bên trong, sửa chữa những hỏng hóc nhỏ có thể sửa được (không bao gồm thay thế thiết bị). Thời gian bảo trì, bảo dưỡng tùy thuộc vào sự thỏa thuận giữa Kingsport và Quý khách hàng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Kingsport, công ty TNHH XNK Phát triển Đông Dương sau đây gọi tắt là Chúng tôi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;II. Bảo Hành.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Quy định về bảo hành:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Sản phẩm được bảo hành miễn phí nếu sản phẩm đó còn thời hạn bảo hành được tính kể từ ngày giao hàng, sản phẩm được bảo hành trong thời hạn bảo hành&amp;nbsp;theo quy định riêng của từng chủng loại sản phẩm liên quan đến tất cả các sự cố về mặt kỹ thuật.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;u&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;em&gt;- Bảo hành theo số điện thoại khách hàng cung cấp lúc mua hàng&lt;/em&gt;&lt;/span&gt;&lt;/u&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2. Quy định về thời gian bảo hành (tham khảo)&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;- Nhóm sản phẩm Máy Chạy Bộ:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+&amp;nbsp;&amp;nbsp;Hạng thương gia: bảo hành&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;6 năm&amp;nbsp;&lt;/span&gt;(ván thảm&amp;nbsp;bảo hành 2 năm)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+ Hạng phổ thông:&amp;nbsp;Bảo hành&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;5 năm&lt;/span&gt;&amp;nbsp;(ván thảm bảo hành 1 năm)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+ Bảo hành&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;2&amp;nbsp;năm&lt;/span&gt;&amp;nbsp;trường hợp sử dụng cho phòng tập hoặc kinh doanh.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Riêng thảm chạy, ván máy chạy bộ được bảo hành 2 năm: hỗ trợ thay thế miễn phí lần đầu.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;- Nhóm sản phẩm Ghế Massage:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+ &amp;nbsp;Hạng thương gia: bảo hành&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;6 năm&amp;nbsp;&lt;/span&gt;(da bảo hành 2 năm)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+ Hạng phổ thông: Bảo hành&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;5 năm&lt;/span&gt;&amp;nbsp;(da bảo hành 1 năm)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;-&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;Nhóm sản phẩm xe đạp và máy tập thể thao khác:&lt;/span&gt;&amp;nbsp;&lt;/span&gt;bảo hành 2 năm.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;-&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;Nhóm giàn tạ đa năng:&amp;nbsp;&lt;/span&gt;&lt;/span&gt;bảo hành 6&amp;nbsp;năm.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;- Nhóm sản phâm quạt điều hòa hơi nước/máy làm mát&lt;/span&gt;:&lt;/span&gt;&amp;nbsp;bảo hành 2 năm&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;- Nhóm sản phẩm hàng gia dụng dùng điện khác:&lt;/span&gt;&lt;/span&gt;&amp;nbsp;bảo hành 1 năm.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;em&gt;Đối với những sản phẩm mới không nằm trong danh mục trên quý khách vui lòng tham khảo quy định thời gian bảo hành cụ thể của sản phẩm trong trang chi tiết hoặc nhân viên tư vấn.&lt;/em&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;3. Những trường hợp không bảo hành:&lt;/span&gt;&amp;nbsp;(sẽ được hỗ trợ thay thế sữa chữa có tính phí)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Sản phẩm đã hết thời hạn bảo hành hoặc mất Phiếu bảo hành.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Phiếu bảo hành không hợp lệ, đã bị tẩy xóa chỉnh sửa, bị rách quá 1/3, nhàu nát không thể xem được nội dung hoặc không có con dấu của chúng tôi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Sản phẩm bị hư hại, bể vở, rách do cố ý hoặc ngoại lực tác động vào như thiên tai, va đập, rơi vỡ, côn trùng xâm nhập (chuột cắn…)&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Sử dụng sản phẩm không theo quy định của nhà sản xuất (hoặc sách hướng dẫn sử dụng). Sử dụng không đúng điện áp theo quy định gây hư hỏng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;- Không bảo hành các linh kiện: dây nguồn,&amp;nbsp;ốp nhựa , khóa an toàn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;4. Chế độ bảo hành:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;- Bảo hành tận nhà:&amp;nbsp;&lt;/span&gt;áp dụng cho các nhóm sản phẩm Máy chạy bộ, xe đạp tập, ghế massage,&amp;nbsp; thiết bị phòng gym hoặc các thiết bị khác cồng kềnh quá khổ.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+ Khu vực trong bán kính 50km (từ showroom Kingsport gần nhất): miễn phí đi lại.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;+ Khu vực ngoài bán kính 50km (từ showroom Kingsport gần nhất): Quý khách vui lòng hỗ trợ phí đi lại cho nhân viên bảo hành.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;- Bảo hành tại showroom Kingsport:&amp;nbsp;&amp;nbsp;&lt;/span&gt;áp dụng cho các nhóm sản phẩm: máy xay, quạt điều hòa loại nhỏ, máy massage cầm tay, đai massage bụng… Khi có sự cố trong việc sử dụng sản phẩm Quý khách vui lòng mang trực tiếp (hoặc gửi qua nhà xe,dịch vụ vận chuyển) đến các trung tâm bảo hành của Kingsport để được sữa chữa và bảo hành theo quy định. Các chi phí phát sinh trong quá trình vận chuyển do quý khách thanh toán với đơn vị vận chuyển.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;- Hướng dẫn xử lý sự cố tận nhà:&lt;/span&gt;&amp;nbsp;trong một số trường hợp do khó khăn về địa lý, chúng tôi có thể hướng dẫn khách hàng tự khắc phục các sự cố (lỗi) cơ bản qua điện thoại hoặc tài liệu hướng dẫn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;III.&lt;/span&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;BảoTrì:&lt;/span&gt;&amp;nbsp;Tất cả các sản phẩm của Kingsport đều được bảo trì trọn đời, hỗ trợ thay thế linh phụ kiện trong suốt quá trình sử dụng sản phẩm.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;1. Chi phí:&lt;/span&gt;&amp;nbsp;việc bảo trì sản phẩm có thể phát sinh thêm chi phí, chi phí này sẽ được thông báo trước hoặc tại thời điểm kiểm tra sản phẩm hư hại không do lỗi của nhà sản xuất.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;2. Hỗ trợ thay thế linh phụ kiện:&lt;/span&gt;&amp;nbsp;theo quy định, linh kiện của tất cả sản phẩm được cung cấp bởi chúng tôi khi hết thời hạn bảo hành quý khách sẽ được hỗ trợ với mức giá ưu đãi.&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;3. Di dời và tháo lắp:&amp;nbsp;&lt;/span&gt;Việc tháo lắp và di chuyển sản phẩm theo mục đích (nhu cầu) sử dụng của quý khách sẽ không nằm trong ràng buộc của quy định bảo hành, bảo trì. Chúng tôi chỉ hỗ trợ di chuyển (lắp đặt ) có tính phí, chi phí này sẽ được hai bên thống nhất khi tham khảo hiện trạng thực tế.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;IV. Quy trình tiếp nhận bảo hành, bảo trì:&lt;/span&gt;&amp;nbsp;Đối với nhóm sản phẩm được bảo hành tận nhà&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Bước 1: gọi đến tổng đài&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;18006862&lt;/span&gt;&amp;nbsp;hoặc sdt chi nhánh gần nhất.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Bước 2: cho thông tin tên, địa chỉ, sdt của quý khách.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Bước 3: thông báo trình trạng lỗi cụ thể của sản phẩm. Việc cung cấp cụ thể chi tiết về tình trạng lỗi sẽ giúp chúng tôi xử lý sự cố nhanh hơn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;V. Liên hệ, thắc mắc, khiếu nại các vấn đề liên quan đến bảo hành, bảo trì:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;Nếu quý khách chưa hài lòng hoặc có thắc mắc khiếu nại các vấn đề liên quan đến bảo hành xin quý khách vui lòng liên hệ với&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;TRUNG TÂM BẢO HÀNH &amp;amp; DỊCH VỤ KHÁCH HÀNG&lt;/span&gt;&amp;nbsp;của KINGSPORT tại địa chỉ&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;161A-163-165 Đường số 9A, KDC Trung Sơn, Bình Chánh, Tp. HCM&lt;/span&gt;, Điện thoại:&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;18006862&lt;/span&gt;&amp;nbsp; hoặc địa chỉ email:&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;kingsport.vn@gmail.com&lt;/span&gt;&lt;/p&gt;', 'CHÍNH SÁCH BẢO HÀNH', '', 'chính sách bảo hành, nội dung bảo hành, quy định bảo hành');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_information_to_layout`
--

CREATE TABLE `ks_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_information_to_layout`
--

INSERT INTO `ks_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(7, 0, 0),
(8, 0, 0),
(4, 0, 0),
(3, 0, 0),
(6, 0, 0),
(5, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_information_to_store`
--

CREATE TABLE `ks_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_information_to_store`
--

INSERT INTO `ks_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_info_description`
--

CREATE TABLE `ks_info_description` (
  `info_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_info_description`
--

INSERT INTO `ks_info_description` (`info_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 2, 'dd', '&lt;p&gt;aa&lt;/p&gt;', 'xx', 'xx', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_info_to_layout`
--

CREATE TABLE `ks_info_to_layout` (
  `info_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_info_to_layout`
--

INSERT INTO `ks_info_to_layout` (`info_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_info_to_store`
--

CREATE TABLE `ks_info_to_store` (
  `info_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_info_to_store`
--

INSERT INTO `ks_info_to_store` (`info_id`, `store_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_language`
--

CREATE TABLE `ks_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_language`
--

INSERT INTO `ks_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, 'Tiếng Việt', 'vi-vn', 'vi, vi-vn', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_layout`
--

CREATE TABLE `ks_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_layout`
--

INSERT INTO `ks_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_layout_module`
--

CREATE TABLE `ks_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_layout_module`
--

INSERT INTO `ks_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(81, 1, 'bestseller.33', 'content_top', 3),
(80, 1, 'carousel.29', 'content_top', 2),
(79, 1, 'featured.28', 'content_top', 1),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2),
(78, 1, 'filter', 'content_top', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_layout_route`
--

CREATE TABLE `ks_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_layout_route`
--

INSERT INTO `ks_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(55, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_length_class`
--

CREATE TABLE `ks_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_length_class`
--

INSERT INTO `ks_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_length_class_description`
--

CREATE TABLE `ks_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_length_class_description`
--

INSERT INTO `ks_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in'),
(1, 3, 'Centimeter', 'cm'),
(2, 3, 'Millimeter', 'mm'),
(3, 3, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_location`
--

CREATE TABLE `ks_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_manufacturer`
--

CREATE TABLE `ks_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_manufacturer`
--

INSERT INTO `ks_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'Lining', 'catalog/demo/htc_logo.jpg', 4),
(6, 'Wilson', '', 5),
(7, 'Adidas', '', 3),
(8, 'Kingsport', '', 1),
(9, 'Nike', '', 2),
(10, 'KingBlender', '', 6),
(11, 'Vitamix', '', 7),
(12, 'Magic', '', 8),
(13, 'Deli', '', 9),
(14, 'Pro Green', '', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_manufacturer_to_store`
--

CREATE TABLE `ks_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_manufacturer_to_store`
--

INSERT INTO `ks_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_marketing`
--

CREATE TABLE `ks_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_modification`
--

CREATE TABLE `ks_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_modification`
--

INSERT INTO `ks_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 1, 'Recently Viewed', 'RecentlyViewed', '', '1.0', '', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n    <name>Recently Viewed</name>\r\n    <version>1.0</version>\r\n    <author></author>\r\n    <link></link>\r\n	<code>RecentlyViewed</code>\r\n	<!--\r\n	Start\r\n	==========================\r\n	add product id in table if customer viewed some product when logged in else set product id in cookies\r\n	==========================\r\n	-->\r\n	<file path=\"catalog/controller/product/product.php\">\r\n		<operation>\r\n			<search trim=\"true\" index=\"0\"><![CDATA[if ($product_info) {]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			$this->load->model(\'extension/module/recently_viewed\');\r\n			if($this->model_extension_module_recently_viewed->isEnabled()){\r\n				if ($this->customer->isLogged()) {\r\n					$this->model_extension_module_recently_viewed->setRecentlyViewedProducts($this->customer->getId(), $product_info[\'product_id\']);\r\n				} else {\r\n				\r\n					if(isset($this->request->cookie[\'recently_viewed\']) && !empty($this->request->cookie[\'recently_viewed\'])) {\r\n						$recently_viewed = json_decode(base64_decode($this->request->cookie[\'recently_viewed\']), true);\r\n						$recently_viewed[$product_info[\'product_id\']] = date(\"Y-m-d H:i:s\");\r\n						// sort by in recent viewed order\r\n						uasort($recently_viewed, function($a, $b){ return strtotime($a) > strtotime($b); });\r\n						array_unique($recently_viewed); // remove duplicates\r\n					} else {\r\n						$recently_viewed[$product_info[\'product_id\']] = date(\"Y-m-d H:i:s\");\r\n					}\r\n					\r\n					$recently_viewed = base64_encode(json_encode($recently_viewed));\r\n					setcookie(\'recently_viewed\', $recently_viewed, 0, \'/\', $this->request->server[\'HTTP_HOST\']);\r\n				}\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<!--\r\n	End\r\n	==========================\r\n	add product id in table if customer viewed some product when logged in else set product id in cookies\r\n	==========================\r\n	-->\r\n</modification>', 1, '2019-06-16 20:34:46');
INSERT INTO `ks_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(2, 2, 'Facebook Business Extension', 'facebook_business_extension', 'Facebook', '2.1.10', 'https://github.com/facebookincubator/Facebook-For-OpenCart', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<!-- Copyright 2017-present, Facebook, Inc. -->\n<!-- All rights reserved. -->\n\n<!-- This source code is licensed under the license found in the -->\n<!-- LICENSE file in the root directory of this source tree. -->\n\n<!-- system auto generated, DO NOT MODIFY. -->\n<modification>\n	<name>Facebook Business Extension</name>\n	<code>facebook_business_extension</code>\n	<version>2.1.10</version>\n	<author>Facebook</author>\n	<link>https://github.com/facebookincubator/Facebook-For-OpenCart</link>\n\n  <!-- Admin panel settings -->\n  <file path=\"admin/controller/common/column_left.php\">\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $token = (isset($this->session->data[\'user_token\']))\n          ? $this->session->data[\'user_token\']\n          : $this->session->data[\'token\'];\n        $tokenString = \'token=\' . $token . \'&user_token=\' . $token;\n        $facebookBusinessExtension = array();\n        $facebookBusinessExtension[] = array(\n          \'name\'     => \'Facebook Business Extension\',\n          \'href\'     => $this->url->link(\'extension/facebookadsextension\', $tokenString, true),\n          \'children\' => array()\n        );\n\n        $data[\'menus\'][] = array(\n          \'id\'       => \'menu-facebook-business-extension\',\n          \'icon\'     => \'fa-facebook-square\',\n          \'name\'     => \'Facebook Business Extension\',\n          \'href\'     => \'\',\n          \'children\' => $facebookBusinessExtension\n        );\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- Admin dashboard settings -->\n  <file path=\"admin/controller/common/dashboard.php\">\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $this->load->language(\'common/dashboard\');\n        try {\n          $operation = \', dashboard module\';\n\n          // validates the plugin\n          if (!is_file(DIR_APPLICATION . \'/controller/extension/facebookadsextension.php\')) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n          $all_error_messages = $this->load->controller(\n            \'extension/facebookadsextension/validate\');\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $this->load->controller(\n            \'extension/facebookproduct/validateFAEAndCatalogSetupAndProductUploadComplete\',\n            $operation);\n\n          $hasNewUpgradeAvailable = $this->load->controller(\n            \'extension/facebookadsextension/hasNewUpgradeAvailable\',\n            $operation);\n          $data[\'plugin_upgrade_message\'] = ($hasNewUpgradeAvailable)\n            ? FacebookCommonUtils::PLUGIN_UPGRADE_MESSAGE\n            : \'\';\n        } catch (Exception $e) {\n          $data[\'error_facebook_sync\'] =\n            ($e->getCode() === FacebookGraphAPIError::ACCESS_TOKEN_EXCEPTION_CODE)\n            ? $this->language->get(\'text_warning_facebook_access_token_problem\')\n            : $e->getMessage();\n        }\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/view/template/common/dashboard.tpl\">\n    <operation>\n      <search><![CDATA[<?php if ($error_install) { ?>]]></search>\n      <add position=\"before\"><![CDATA[\n        <?php if (isset($error_facebook_sync) && !!($error_facebook_sync)) {?>\n        <div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> <?php echo $error_facebook_sync; ?>\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        <?php } ?>\n        <?php if (isset($plugin_upgrade_message) && !!($plugin_upgrade_message)) {?>\n        <div class=\"alert alert-info\"><i class=\"fa fa-exclamation-circle\"></i> <?php echo $plugin_upgrade_message; ?>\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        <?php } ?>\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- For opencart v2.x and not v2.3.x, -->\n  <!-- the method of displaying the functions on menu sidebar of admin panel -->\n  <!-- is via explicit hardcoding on the menu controller and template -->\n  <!-- This code insertion is to handle for v2.x and not v2.3.x -->\n  <!-- by explicitly adding FAE to menu controller and template -->\n  <!-- In v2.3.x, there are no menu.php and menu.tpl files -->\n\n  <!-- Seach syntax for opencart v2.2.0.0 and below -->\n  <file path=\"admin/controller/common/menu.php\">\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $token = (isset($this->session->data[\'user_token\']))\n          ? $this->session->data[\'user_token\']\n          : $this->session->data[\'token\'];\n        $tokenString = \'token=\' . $token . \'&user_token=\' . $token;\n        $data[\'text_facebook_ads_extension\'] = \'Facebook Business Extension\';\n        $data[\'facebookadsextension\'] = $this->url->link(\'extension/facebookadsextension\', $tokenString, \'SSL\');\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/view/template/common/menu.tpl\">\n    <operation>\n      <search><![CDATA[<ul id=\"menu\">]]></search>\n      <add position=\"after\"><![CDATA[\n        <li id=\"facebookadsextension\"><a class=\"parent\"><i class=\"fa fa-facebook-square fa-fw\"></i> <span><?php echo $text_facebook_ads_extension; ?></span></a>\n          <ul>\n            <li>\n              <a href=\"<?php echo $facebookadsextension; ?>\">\n                <?php echo $text_facebook_ads_extension; ?>\n              </a>\n            </li>\n          </ul>\n        </li>\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/model/catalog/product.php\">\n    <!-- This operation is to store in the new product id -->\n    <!-- in the request->post variable. -->\n    <!-- Using this new product id, we can then access from -->\n    <!-- the controller and sync it with facebook catalog -->\n    <operation>\n      <search><![CDATA[return $product_id;]]></search>\n      <add position=\"before\"><![CDATA[\n        $this->request->post[\'facebook_id_of_new_product\'] = $product_id;\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/controller/catalog/product.php\">\n    <operation>\n      <!-- We want to provide feedback to merchant on their FAE status -->\n      <!-- when they access the product management module entry screen-->\n      <!-- The feedback could be either FAE not setup or  -->\n      <!-- a problem with the FAE setup -->\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $this->load->language(\'catalog/product\');\n        try {\n          $operation = \', access product module\';\n\n          // validates the plugin\n          if (!$this->validateFacebookAdsExtensionFilePresent()) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n          $all_error_messages = $this->load->controller(\n            \'extension/facebookadsextension/validate\');\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $this->load->controller(\n            \'extension/facebookproduct/validateFAEAndCatalogSetupAndProductUploadComplete\',\n            $operation);\n\n          $hasNewUpgradeAvailable = $this->load->controller(\n            \'extension/facebookadsextension/hasNewUpgradeAvailable\',\n            $operation);\n          $this->session->data[\'plugin_upgrade_message\'] = ($hasNewUpgradeAvailable)\n            ? FacebookCommonUtils::PLUGIN_UPGRADE_MESSAGE\n            : \'\';\n        } catch (Exception $e) {\n          $this->session->data[\'error_facebook_sync\'] =\n            ($e->getCode() === FacebookGraphAPIError::ACCESS_TOKEN_EXCEPTION_CODE)\n            ? $this->language->get(\'text_warning_facebook_access_token_problem\')\n            : $e->getMessage();\n        }\n      ]]></add>\n    </operation>\n\n    <operation>\n      <!-- We need to retrieve out the new product id after it is -->\n      <!-- created in the database. Although the addProduct method -->\n      <!-- returns the product_id, but the default Opencart code -->\n      <!-- does not read in the return product_id -->\n      <!-- As it is riskier if to modify and replace original base codes, -->\n      <!-- the approach is to use the request->post variable to pass back -->\n      <!-- the new product id from model to controller -->\n      <search><![CDATA[$this->model_catalog_product->addProduct($this->request->post);]]></search>\n      <add position=\"after\"><![CDATA[\n        try {\n          // validates the plugin\n          if (!$this->validateFacebookAdsExtensionFilePresent()) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n          $all_error_messages = $this->load->controller(\n            \'extension/facebookadsextension/validate\');\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $product_id = $this->request->post[\'facebook_id_of_new_product\'];\n          $result = $this->load->controller(\n            \'extension/facebookproduct/syncProductForProductId\',\n            $product_id);\n          if (!isset($result[\'success_count\'])\n            || $result[\'success_count\'] !== $result[\'total_count\']) {\n            $this->session->data[\'error_facebook_sync\'] =\n              $this->language->get(\'text_warning_facebook_sync\');\n          }\n        } catch (Exception $e) {\n          $this->load->language(\'catalog/product\');\n          $this->session->data[\'error_facebook_sync\'] =\n            ($e->getCode() === FacebookGraphAPIError::ACCESS_TOKEN_EXCEPTION_CODE)\n            ? $this->language->get(\'text_warning_facebook_access_token_problem\')\n            : $e->getMessage();\n        }\n      ]]></add>\n    </operation>\n\n    <operation>\n      <search><![CDATA[$this->model_catalog_product->editProduct($this->request->get[\'product_id\'], $this->request->post);]]></search>\n      <add position=\"after\"><![CDATA[\n        try {\n          // validates the plugin\n          if (!$this->validateFacebookAdsExtensionFilePresent()) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n          $all_error_messages = $this->load->controller(\n            \'extension/facebookadsextension/validate\');\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $result = $this->load->controller(\n            \'extension/facebookproduct/syncProductForProductId\',\n            $this->request->get[\'product_id\']);\n          if (!isset($result[\'success_count\'])\n            || $result[\'success_count\'] !== $result[\'total_count\']) {\n            $this->session->data[\'error_facebook_sync\'] =\n              $this->language->get(\'text_warning_facebook_sync\');\n          }\n        } catch (Exception $e) {\n          $this->load->language(\'catalog/product\');\n          $this->session->data[\'error_facebook_sync\'] =\n            ($e->getCode() === FacebookGraphAPIError::ACCESS_TOKEN_EXCEPTION_CODE)\n            ? $this->language->get(\'text_warning_facebook_access_token_problem\')\n            : $e->getMessage();\n        }\n      ]]></add>\n    </operation>\n\n    <operation>\n      <search><![CDATA[if (isset($this->request->post[\'selected\']) && $this->validateDelete()) {]]></search>\n      <add position=\"after\"><![CDATA[\n        try {\n          // validates the plugin\n          if (!$this->validateFacebookAdsExtensionFilePresent()) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n          $all_error_messages = $this->load->controller(\n            \'extension/facebookadsextension/validate\');\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $result = $this->load->controller(\n            \'extension/facebookproduct/deleteProductsForProductId\',\n            $this->request->post[\'selected\']);\n          if (!isset($result[\'success_count\'])\n            || $result[\'success_count\'] !== $result[\'total_count\']) {\n            $this->session->data[\'error_facebook_sync\'] =\n              $this->language->get(\'text_warning_facebook_sync\');\n          }\n        } catch (Exception $e) {\n          $this->load->language(\'catalog/product\');\n          $this->session->data[\'error_facebook_sync\'] =\n            ($e->getCode() === FacebookGraphAPIError::ACCESS_TOKEN_EXCEPTION_CODE)\n            ? $this->language->get(\'text_warning_facebook_access_token_problem\')\n            : $e->getMessage();\n        }\n      ]]></add>\n    </operation>\n\n    <operation>\n      <search><![CDATA[protected function getList() {]]></search>\n      <add position=\"after\"><![CDATA[\n        if (isset($this->session->data[\'error_facebook_sync\'])) {\n          $data[\'error_facebook_sync\'] = $this->session->data[\'error_facebook_sync\'];\n          unset($this->session->data[\'error_facebook_sync\']);\n        } else {\n          $data[\'error_facebook_sync\'] = \'\';\n        }\n\n        if (isset($this->session->data[\'error_facebook_delete\'])) {\n          $data[\'error_facebook_delete\'] = $this->session->data[\'error_facebook_delete\'];\n          unset($this->session->data[\'error_facebook_delete\']);\n        } else {\n          $data[\'error_facebook_delete\'] = \'\';\n        }\n\n        if (isset($this->session->data[\'plugin_upgrade_message\'])) {\n          $data[\'plugin_upgrade_message\'] = $this->session->data[\'plugin_upgrade_message\'];\n          unset($this->session->data[\'plugin_upgrade_message\']);\n        } else {\n          $data[\'plugin_upgrade_message\'] = \'\';\n        }\n      ]]></add>\n    </operation>\n\n    <!-- Removes away this modification from the plugin -->\n    <!-- as this is only used primarily for debugging -->\n    <!-- This is also due to incompatibility with external plugins -->\n    <!-- https://github.com/facebookincubator/Facebook-For-OpenCart/issues/52 -->\n<!--     <operation>\n      <search><![CDATA[$url = \'\';]]></search>\n      <add position=\"after\"><![CDATA[\n        if (isset($this->request->get[\'debug_facebook_sync_error\'])) {\n          $url .= \'&debug_facebook_sync_error=1\';\n        }\n      ]]></add>\n    </operation> -->\n\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"before\"><![CDATA[\n        private function validateFacebookAdsExtensionFilePresent() {\n          return is_file(DIR_APPLICATION . \'/controller/extension/facebookadsextension.php\');\n        }\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/product_list.tpl\">\n    <operation>\n      <search><![CDATA[    <?php if ($error_warning) { ?>]]></search>\n      <add position=\"before\"><![CDATA[\n        <?php if (isset($error_facebook_sync) && !!($error_facebook_sync)) {?>\n        <div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> <?php echo $error_facebook_sync; ?>\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        <?php } ?>\n        <?php if (isset($error_facebook_delete) && !!($error_facebook_delete)) {?>\n        <div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> <?php echo $error_facebook_delete; ?>\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        <?php } ?>\n        <?php if (isset($plugin_upgrade_message) && !!($plugin_upgrade_message)) {?>\n        <div class=\"alert alert-info\"><i class=\"fa fa-exclamation-circle\"></i> <?php echo $plugin_upgrade_message; ?>\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        <?php } ?>\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/language/*/catalog/product.php\">\n    <operation>\n      <search><![CDATA[<?php]]></search>\n      <add position=\"after\"><![CDATA[\n        $_[\'text_warning_facebook_sync\']           = \'Warning: Encountered problem updating product(s) to Facebook. Please retry again. Check the error log file for more details\';\n        $_[\'text_warning_facebook_delete\']           = \'Warning: Encountered problem deleting product(s) to Facebook. Check the error log file for more details.\';\n        $_[\'text_warning_facebook_access_token_problem\'] = \'Warning: There is a problem with your Facebook access token. Please go to Facebook Business Extension to refresh the access token.\';\n        $_[\'text_warning_facebook_fae_install_problem\'] = \'Warning: There is a problem with your Facebook Business Extension installation. Please go to Facebook Business Extension to view more details.\';\n        $_[\'text_warning_facebook_missing_facebookadsextension\'] = \'Warning: There is a problem with your Facebook Business Extension installation. We are unable to locate the admin/controller/extension/facebookadsextension.php file on your webserver. Please ensure that you have given read+write+execute permission to the admin/controller folder and reinstall the plugin again. Click <a href=\"https://github.com/facebookincubator/Facebook-For-OpenCart/blob/master/INSTALL_GUIDE.md\" target=\"_blank\">here</a> for details on the plugin installation.\';\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"catalog/controller/api/order.php\">\n    <!-- This is to handle for Adding of new orders -->\n    <operation>\n      <search><![CDATA[$this->model_checkout_order->addOrderHistory($json[\'order_id\'], $order_status_id);]]></search>\n      <add position=\"after\"><![CDATA[\n        try {\n          // validates the plugin\n          $facebookadsextensionFilename =\n            DIR_APPLICATION . \'../admin/controller/extension/facebookadsextension.php\';\n          if (!is_file($facebookadsextensionFilename)) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n\n          require_once $facebookadsextensionFilename;\n          $facebookadsextensionController =\n            new ControllerExtensionFacebookAdsExtension($this->registry);\n          $all_error_messages = $facebookadsextensionController->validate();\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $products = $this->cart->getProducts();\n          if ($products && sizeof($products)) {\n            $this->facebookcommonutils = new FacebookCommonUtils();\n            $this->facebookcommonutils->updateProductAvailability(\n              $this->registry,\n              $products);\n          }\n        } catch (Exception $e) {\n          error_log($e->getMessage());\n        }\n      ]]></add>\n    </operation>\n\n    <!-- This is to handle for Editing of existing orders. -->\n    <!-- There may be cases where the user removes existing products -->\n    <!-- and adds in new products. In these cases, we need to -->\n    <!-- get the full list of affected products and update the -->\n    <!-- availability for them -->\n    <!-- This gets the products pre edit -->\n    <operation>\n      <search><![CDATA[$this->model_checkout_order->editOrder($order_id, $order_data);]]></search>\n      <add position=\"before\"><![CDATA[\n        $products_pre_edit = $this->model_checkout_order->getOrderProductIds($order_id);\n      ]]></add>\n    </operation>\n\n    <!-- This gets the products post edit and merges the pre and post lists together -->\n    <!-- for product availability update -->\n    <operation>\n      <search><![CDATA[$this->model_checkout_order->addOrderHistory($order_id, $order_status_id);]]></search>\n      <add position=\"after\"><![CDATA[\n        try {\n          // validates the plugin\n          $facebookadsextensionFilename =\n            DIR_APPLICATION . \'../admin/controller/extension/facebookadsextension.php\';\n          if (!is_file($facebookadsextensionFilename)) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n\n          require_once $facebookadsextensionFilename;\n          $facebookadsextensionController =\n            new ControllerExtensionFacebookAdsExtension($this->registry);\n          $all_error_messages = $facebookadsextensionController->validate();\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $products_post_edit = $this->cart->getProducts();\n          $this->facebookcommonutils = new FacebookCommonUtils();\n          $products_for_availabilty_update =\n            array_merge($products_pre_edit, $products_post_edit);\n          $this->facebookcommonutils->updateProductAvailability(\n            $this->registry,\n            $products_for_availabilty_update);\n        } catch (Exception $e) {\n          error_log($e->getMessage());\n        }\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- This function retrieves out the product_ids for an order_id -->\n  <file path=\"catalog/model/checkout/order.php\">\n    <operation>\n      <search><![CDATA[class ModelCheckoutOrder extends Model]]></search>\n      <add position=\"after\"><![CDATA[\n          public function getOrderProductIds($order_id) {\n            $sql = \"SELECT product_id FROM \" . DB_PREFIX . \"order_product \" .\n              \"WHERE order_id = \'\" . (int)$order_id . \"\'\";\n            return $this->db->query($sql)->rows;\n          }\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- Firing the pixel init and event code -->\n  <!-- The facebook_pixel_event_params_FAE is retrieved from the request->post -->\n  <file path=\"catalog/controller/common/header.php\">\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $data[\'facebook_pixel_id_FAE\'] =\n          $this->fbevents[\'facebook_pixel_id_FAE\'];\n        $data[\'facebook_pixel_pii_FAE\'] =\n          $this->fbevents[\'facebook_pixel_pii_FAE\'];\n        $data[\'facebook_pixel_params_FAE\'] =\n          $this->fbevents[\'facebook_pixel_params_FAE\'];\n        $data[\'facebook_pixel_params_FAE\'] =\n          $this->fbevents[\'facebook_pixel_params_FAE\'];\n        $data[\'facebook_pixel_event_params_FAE\'] =\n          $this->fbevents[\'facebook_pixel_event_params_FAE\'];\n        $data[\'facebook_enable_cookie_bar\'] =\n          $this->fbevents[\'facebook_enable_cookie_bar\'];\n\n        // remove away the facebook_pixel_event_params_FAE in session data\n        // to avoid duplicate firing after the 1st fire\n        unset($this->session->data[\'facebook_pixel_event_params_FAE\']);\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- Showing up the customer chat plugin -->\n  <!-- The customer chat plugin options are retrieved from the settings -->\n  <file path=\"catalog/controller/common/header.php\">\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $data[\'facebook_page_id_FAE\'] =\n          $this->config->get(FacebookCommonUtils::FACEBOOK_PAGE_ID);\n        $data[\'facebook_jssdk_version_FAE\'] =\n          $this->config->get(FacebookCommonUtils::FACEBOOK_JSSDK_VER);\n        $data[\'facebook_messenger_enabled_FAE\'] =\n          $this->config->get(FacebookCommonUtils::FACEBOOK_MESSENGER);\n        // default greeting code to empty string if setting is not available\n        $customization_greeting_code = $this->config->get(\n          FacebookCommonUtils::FACEBOOK_CUSTOMIZATION_GREETING_TEXT_CODE);\n        $data[\'facebook_customization_greeting_text_code_FAE\'] =\n          ($customization_greeting_code)\n          ? sprintf(\'logged_in_greeting=\"%s\" logged_out_greeting=\"%s\"\',\n            $customization_greeting_code,\n            $customization_greeting_code)\n          : \'\';\n        // default locale to en_US if setting is not available\n        $customization_locale = $this->config->get(\n          FacebookCommonUtils::FACEBOOK_CUSTOMIZATION_LOCALE);\n        $data[\'facebook_customization_locale_FAE\'] =\n          ($customization_locale)\n          ? $customization_locale\n          : \'en_US\';\n        // default theme color code to empty string if setting is not available\n        $customization_theme_color_code = $this->config->get(\n          FacebookCommonUtils::FACEBOOK_CUSTOMIZATION_THEME_COLOR_CODE);\n        $data[\'facebook_customization_theme_color_code_FAE\'] =\n          ($customization_theme_color_code)\n          ? sprintf(\'theme_color=\"%s\"\', $customization_theme_color_code)\n          : \'\';\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- The actual firing of the pixel code is done in the header file -->\n  <!-- The injection for the header file is based on locating -->\n  <!-- the tag </head> which should give the lowest chance to break -->\n  <!-- with custom plugins -->\n  <file path=\"catalog/view/theme/*/template/common/header.tpl\">\n    <operation>\n      <search><![CDATA[</head>]]></search>\n      <add position=\"before\"><![CDATA[\n        <script type=\"text/javascript\">\n          function facebook_loadScript(url, callback) {\n            var script = document.createElement(\"script\");\n            script.type = \"text/javascript\";\n            if(script.readyState) {  // only required for IE <9\n              script.onreadystatechange = function() {\n                if (script.readyState === \"loaded\" || script.readyState === \"complete\") {\n                  script.onreadystatechange = null;\n                  if (callback) {\n                    callback();\n                  }\n                }\n              };\n            } else {  //Others\n              if (callback) {\n                script.onload = callback;\n              }\n            }\n\n            script.src = url;\n            document.getElementsByTagName(\"head\")[0].appendChild(script);\n          }\n        </script>\n\n        <script type=\"text/javascript\">\n          (function() {\n            var enableCookieBar = \'<?php echo $facebook_enable_cookie_bar ?>\';\n            if (enableCookieBar === \'true\') {\n              facebook_loadScript(\"catalog/view/javascript/facebook/cookieconsent.min.js\");\n\n              // loading the css file\n              var css = document.createElement(\"link\");\n              css.setAttribute(\"rel\", \"stylesheet\");\n              css.setAttribute(\"type\", \"text/css\");\n              css.setAttribute(\n                \"href\",\n                \"catalog/view/theme/css/facebook/cookieconsent.min.css\");\n              document.getElementsByTagName(\"head\")[0].appendChild(css);\n\n              window.addEventListener(\"load\", function(){\n                function setConsent() {\n                  fbq(\n                    \'consent\',\n                    this.hasConsented() ? \'grant\' : \'revoke\'\n                  );\n                }\n                window.cookieconsent.initialise({\n                  palette: {\n                    popup: {\n                      background: \'#237afc\'\n                    },\n                    button: {\n                      background: \'#fff\',\n                      text: \'#237afc\'\n                    }\n                  },\n                  cookie: {\n                    name: fbq.consentCookieName\n                  },\n                  type: \'opt-out\',\n                  showLink: false,\n                  content: {\n                    dismiss: \'Agree\',\n                    deny: \'Opt Out\',\n                    header: \'Our Site Uses Cookies\',\n                    message: \'By clicking Agree, you agree to our <a class=\"cc-link\" href=\"https://www.facebook.com/legal/terms/update\" target=\"_blank\">terms of service</a>, <a class=\"cc-link\" href=\"https://www.facebook.com/policies/\" target=\"_blank\">privacy policy</a> and <a class=\"cc-link\" href=\"https://www.facebook.com/policies/cookies/\" target=\"_blank\">cookies policy</a>.\'\n                  },\n                  layout: \'basic-header\',\n                  location: true,\n                  revokable: true,\n                  onInitialise: setConsent,\n                  onStatusChange: setConsent,\n                  onRevokeChoice: setConsent\n                }, function (popup) {\n                  // If this isn\'t open, we know that we can use cookies.\n                  if (!popup.getStatus() && !popup.options.enabled) {\n                    popup.setStatus(cookieconsent.status.dismiss);\n                  }\n                });\n              });\n            }\n          })();\n        </script>\n\n        <script type=\"text/javascript\">\n          (function() {\n            !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\n            n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\n            n.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\n            t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\n            document,\'script\',\'https://connect.facebook.net/en_US/fbevents.js\');\n\n            var enableCookieBar = \'<?php echo $facebook_enable_cookie_bar ?>\';\n            if (enableCookieBar === \'true\') {\n              fbq.consentCookieName = \'fb_cookieconsent_status\';\n\n              (function() {\n                function getCookie(t){var i=(\"; \"+document.cookie).split(\"; \"+t+\"=\");if(2==i.length)return i.pop().split(\";\").shift()}\n                var consentValue = getCookie(fbq.consentCookieName);\n                fbq(\'consent\', consentValue === \'dismiss\' ? \'grant\' : \'revoke\');\n              })();\n            }\n\n            <?php if ($facebook_pixel_id_FAE) { ?>\n// system auto generated facebook_pixel.js, DO NOT MODIFY\npixel_script_filename = \'catalog/view/javascript/facebook/facebook_pixel_2_1_10.js\';\n// system auto generated facebook_pixel.js, DO NOT MODIFY\n              facebook_loadScript(\n                pixel_script_filename,\n                function() {\n                  var params = <?php echo $facebook_pixel_params_FAE ?>;\n                  _facebookAdsExtension.facebookPixel.init(\n                    \'<?php echo $facebook_pixel_id_FAE ?>\',\n                    <?php echo $facebook_pixel_pii_FAE ?>,\n                    params);\n                  <?php if ($facebook_pixel_event_params_FAE) { ?>\n                    _facebookAdsExtension.facebookPixel.firePixel(\n                      JSON.parse(\'<?php echo $facebook_pixel_event_params_FAE ?>\'));\n                  <?php } ?>\n                });\n            <?php } ?>\n          })();\n        </script>\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- Insert Messenger customer chat -->\n  <!-- We need to insert this before a </div> otherwise the chat will not work -->\n  <!-- Selecting the </header> as there could have other divs -->\n  <file path=\"catalog/view/theme/*/template/common/header.tpl\">\n    <operation>\n      <search><![CDATA[</header>]]></search>\n      <add position=\"before\"><![CDATA[\n\n        <?php if ($facebook_messenger_enabled_FAE == \'true\') { ?>\n        <!-- Facebook JSSDK -->\n        <script>\n          window.fbAsyncInit = function() {\n            FB.init({\n              appId            : \'\',\n              autoLogAppEvents : true,\n              xfbml            : true,\n              version          : \'<?php echo $facebook_jssdk_version_FAE ?>\'\n            });\n          };\n\n          (function(d, s, id){\n             var js, fjs = d.getElementsByTagName(s)[0];\n             if (d.getElementById(id)) {return;}\n             js = d.createElement(s); js.id = id;\n             js.src = \"https://connect.facebook.net/<?php echo $facebook_customization_locale_FAE ?>/sdk/xfbml.customerchat.js\";\n             fjs.parentNode.insertBefore(js, fjs);\n           }(document, \'script\', \'facebook-jssdk\'));\n        </script>\n        <div\n          class=\"fb-customerchat\"\n          attribution=\"fbe_opencart\"\n          page_id=\"<?php echo $facebook_page_id_FAE ?>\"\n          <?php echo $facebook_customization_greeting_text_code_FAE ?>\n          <?php echo $facebook_customization_theme_color_code_FAE ?>\n        />\n        <?php } ?>\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- AddToCart at product details page -->\n  <!-- Uses jQuery to add new listener to button-cart.click -->\n  <!-- The code injection is set to match <?php echo $footer; ?> -->\n  <!-- which will reduce the chance of breakage with custom plugins -->\n  <file path=\"catalog/view/theme/*/template/product/product.tpl\">\n    <operation>\n      <search><![CDATA[<?php echo $footer; ?>]]></search>\n      <add position=\"before\"><![CDATA[\n        <input type=\"hidden\" id=\"fbProductID\" value=\"<?php echo $product_id ?>\" />\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- Facebook pixel Purchase code -->\n  <!-- This will prepare the params for Purchase pixel at Thank you page -->\n  <file path=\"catalog/controller/checkout/success.php\">\n    <operation>\n      <search><![CDATA[public function index(]]></search>\n      <add position=\"after\"><![CDATA[\n        $this->load->language(\'checkout/success\');\n        try {\n          // validates the plugin\n          $facebookadsextensionFilename =\n            DIR_APPLICATION . \'../admin/controller/extension/facebookadsextension.php\';\n          if (!is_file($facebookadsextensionFilename)) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_missing_facebookadsextension\'));\n          }\n\n          require_once $facebookadsextensionFilename;\n          $facebookadsextensionController =\n            new ControllerExtensionFacebookAdsExtension($this->registry);\n          $all_error_messages = $facebookadsextensionController->validate();\n          if (sizeof($all_error_messages) > 0) {\n            throw new Exception($this->language->get(\n              \'text_warning_facebook_fae_install_problem\'));\n          }\n\n          $this->facebookcommonutils = new FacebookCommonUtils();\n          $products = $this->cart->getProducts();\n          if (sizeof($products)) {\n            // update the product availability on Facebook\n            $this->facebookcommonutils->updateProductAvailability(\n              $this->registry,\n              $products);\n          }\n        } catch (Exception $e) {\n          error_log($e->getMessage());\n        }\n      ]]></add>\n    </operation>\n  </file>\n  <!-- End Facebook pixel Purchase code -->\n\n  <!-- The actual firing of the pixel code is done in the header file -->\n  <!-- The injection for the header file is based on locating -->\n  <!-- the tag </head> which should give the lowest chance to break -->\n  <!-- with custom plugins -->\n  <file path=\"catalog/view/theme/*/template/common/header.twig\">\n    <operation>\n      <search><![CDATA[</head>]]></search>\n      <add position=\"before\"><![CDATA[\n        <script type=\"text/javascript\">\n          function facebook_loadScript(url, callback) {\n            var script = document.createElement(\"script\");\n            script.type = \"text/javascript\";\n            if(script.readyState) {  // only required for IE <9\n              script.onreadystatechange = function() {\n                if (script.readyState === \"loaded\" || script.readyState === \"complete\") {\n                  script.onreadystatechange = null;\n                  if (callback) {\n                    callback();\n                  }\n                }\n              };\n            } else {  //Others\n              if (callback) {\n                script.onload = callback;\n              }\n            }\n\n            script.src = url;\n            document.getElementsByTagName(\"head\")[0].appendChild(script);\n          }\n        </script>\n\n        <script type=\"text/javascript\">\n          (function() {\n            var enableCookieBar = \'{{ facebook_enable_cookie_bar }}\';\n            if (enableCookieBar === \'true\') {\n              facebook_loadScript(\"catalog/view/javascript/facebook/cookieconsent.min.js\");\n\n              // loading the css file\n              var css = document.createElement(\"link\");\n              css.setAttribute(\"rel\", \"stylesheet\");\n              css.setAttribute(\"type\", \"text/css\");\n              css.setAttribute(\n                \"href\",\n                \"catalog/view/theme/css/facebook/cookieconsent.min.css\");\n              document.getElementsByTagName(\"head\")[0].appendChild(css);\n\n              window.addEventListener(\"load\", function(){\n                function setConsent() {\n                  fbq(\n                    \'consent\',\n                    this.hasConsented() ? \'grant\' : \'revoke\'\n                  );\n                }\n                window.cookieconsent.initialise({\n                  palette: {\n                    popup: {\n                      background: \'#237afc\'\n                    },\n                    button: {\n                      background: \'#fff\',\n                      text: \'#237afc\'\n                    }\n                  },\n                  cookie: {\n                    name: fbq.consentCookieName\n                  },\n                  type: \'opt-out\',\n                  showLink: false,\n                  content: {\n                    dismiss: \'Agree\',\n                    deny: \'Opt Out\',\n                    header: \'Our Site Uses Cookies\',\n                    message: \'By clicking Agree, you agree to our <a class=\"cc-link\" href=\"https://www.facebook.com/legal/terms/update\" target=\"_blank\">terms of service</a>, <a class=\"cc-link\" href=\"https://www.facebook.com/policies/\" target=\"_blank\">privacy policy</a> and <a class=\"cc-link\" href=\"https://www.facebook.com/policies/cookies/\" target=\"_blank\">cookies policy</a>.\'\n                  },\n                  layout: \'basic-header\',\n                  location: true,\n                  revokable: true,\n                  onInitialise: setConsent,\n                  onStatusChange: setConsent,\n                  onRevokeChoice: setConsent\n                }, function (popup) {\n                  // If this isn\'t open, we know that we can use cookies.\n                  if (!popup.getStatus() && !popup.options.enabled) {\n                    popup.setStatus(cookieconsent.status.dismiss);\n                  }\n                });\n              });\n            }\n          })();\n        </script>\n\n        <script type=\"text/javascript\">\n          (function() {\n            !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\n            n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\n            n.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\n            t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\n            document,\'script\',\'https://connect.facebook.net/en_US/fbevents.js\');\n\n            var enableCookieBar = \'{{ facebook_enable_cookie_bar }}\';\n            if (enableCookieBar === \'true\') {\n              fbq.consentCookieName = \'fb_cookieconsent_status\';\n\n              (function() {\n                function getCookie(t){var i=(\"; \"+document.cookie).split(\"; \"+t+\"=\");if(2==i.length)return i.pop().split(\";\").shift()}\n                var consentValue = getCookie(fbq.consentCookieName);\n                fbq(\'consent\', consentValue === \'dismiss\' ? \'grant\' : \'revoke\');\n              })();\n            }\n\n            {% if facebook_pixel_id_FAE %}\n// system auto generated facebook_pixel.js, DO NOT MODIFY\npixel_script_filename = \'catalog/view/javascript/facebook/facebook_pixel_2_1_10.js\';\n// system auto generated facebook_pixel.js, DO NOT MODIFY\n              facebook_loadScript(\n                pixel_script_filename,\n                function() {\n                  var params = {{ facebook_pixel_params_FAE }};\n                  _facebookAdsExtension.facebookPixel.init(\n                    \'{{ facebook_pixel_id_FAE }}\',\n                    {{ facebook_pixel_pii_FAE }},\n                    params);\n                  {% if facebook_pixel_event_params_FAE %}\n                    _facebookAdsExtension.facebookPixel.firePixel(\n                      JSON.parse(\'{{facebook_pixel_event_params_FAE }}\'));\n                  {% endif %}\n                });\n            {% endif %}\n          })();\n        </script>\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- Insert Messenger customer chat -->\n  <!-- We need to insert this before a </div> otherwise the chat will not work -->\n  <!-- Selecting the </header> as there are divs in a header -->\n  <file path=\"catalog/view/theme/*/template/common/header.twig\">\n    <operation>\n      <search><![CDATA[</header>]]></search>\n      <add position=\"before\"><![CDATA[\n\n        {% if facebook_messenger_enabled_FAE == \'true\' %}\n        <!-- Facebook JSSDK -->\n        <script>\n          window.fbAsyncInit = function() {\n            FB.init({\n              appId            : \'\',\n              autoLogAppEvents : true,\n              xfbml            : true,\n              version          : \'{{ facebook_jssdk_version_FAE }}\'\n            });\n          };\n\n          (function(d, s, id){\n             var js, fjs = d.getElementsByTagName(s)[0];\n             if (d.getElementById(id)) {return;}\n             js = d.createElement(s); js.id = id;\n             js.src = \"https://connect.facebook.net/{{ facebook_customization_locale_FAE }}/sdk/xfbml.customerchat.js\";\n             fjs.parentNode.insertBefore(js, fjs);\n           }(document, \'script\', \'facebook-jssdk\'));\n        </script>\n        <div\n          class=\"fb-customerchat\"\n          attribution=\"fbe_opencart\"\n          page_id=\"{{ facebook_page_id_FAE }}\"\n          {{ facebook_customization_greeting_text_code_FAE }}\n          {{ facebook_customization_theme_color_code_FAE }}\n        />\n        {% endif %}\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- AddToCart at product details page -->\n  <!-- Uses jQuery to add new listener to button-cart.click -->\n  <!-- The code injection is set to match <?php echo $footer; ?> -->\n  <!-- which will reduce the chance of breakage with custom plugins -->\n  <file path=\"catalog/view/theme/*/template/product/product.twig\">\n    <operation>\n      <search><![CDATA[{{ footer }}]]></search>\n      <add position=\"before\"><![CDATA[\n        <input type=\"hidden\" id=\"fbProductID\" value=\"{{ product_id }}\" />\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/view/template/common/dashboard.twig\">\n    <operation>\n      <search><![CDATA[<div class=\"container-fluid\">{% if error_install %}]]></search>\n      <add position=\"before\"><![CDATA[\n        {% if error_facebook_sync %}\n        <div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> {{ error_facebook_sync }}\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        {% endif %}\n        {% if plugin_upgrade_message %}\n        <div class=\"alert alert-info\"><i class=\"fa fa-exclamation-circle\"></i> {{ plugin_upgrade_message }}\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        {% endif %}        \n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/product_list.twig\">\n    <operation>\n      <search><![CDATA[<div class=\"container-fluid\">{% if error_warning %}]]></search>\n      <add position=\"before\"><![CDATA[\n        {% if error_facebook_sync %}\n        <div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> {{ error_facebook_sync }}\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        {% endif %}\n        {% if error_facebook_delete %}\n        <div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> {{ error_facebook_delete }}\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        {% endif %}\n        {% if plugin_upgrade_message %}\n        <div class=\"alert alert-info\"><i class=\"fa fa-exclamation-circle\"></i> {{ plugin_upgrade_message }}\n          <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n        </div>\n        {% endif %}        \n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"admin/language/*/common/dashboard.php\">\n    <operation>\n      <search><![CDATA[<?php]]></search>\n      <add position=\"after\"><![CDATA[\n        $_[\'text_warning_facebook_sync\']           = \'Warning: Encountered problem updating product(s) to Facebook. Please retry again. Check the error log file for more details\';\n        $_[\'text_warning_facebook_delete\']           = \'Warning: Encountered problem deleting product(s) to Facebook. Check the error log file for more details.\';\n        $_[\'text_warning_facebook_access_token_problem\'] = \'Warning: There is a problem with your Facebook access token. Please go to Facebook Business Extension to refresh the access token.\';\n        $_[\'text_warning_facebook_fae_install_problem\'] = \'Warning: There is a problem with your Facebook Business Extension installation. Please go to Facebook Business Extension to view more details.\';\n        $_[\'text_warning_facebook_missing_facebookadsextension\'] = \'Warning: There is a problem with your Facebook Business Extension installation. We are unable to locate the admin/controller/extension/facebookadsextension.php file on your webserver. Please ensure that you have given read+write+execute permission to the admin/controller folder and reinstall the plugin again. Click <a href=\"https://github.com/facebookincubator/Facebook-For-OpenCart/blob/master/INSTALL_GUIDE.md\" target=\"_blank\">here</a> for details on the plugin installation.\';\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"system/engine/router.php\">\n    <operation>\n      <!-- helper method to run actions required for Facebook plugin -->\n      <search><![CDATA[public function __construct($registry]]></search>\n      <add position=\"before\"><![CDATA[\n        private function runAction($actionName) {\n          // added in defensive checks to ensure the\n          // controller class is available and accessible\n          try {\n            if (is_file(\n              DIR_APPLICATION . \'/controller/\' . $actionName . \'.php\')) {\n              $facebookAction = new Action($actionName);\n              $facebookAction->execute($this->registry);\n            }\n          } catch (Exception $e) {\n            error_log($e->getMessage());\n          }\n        }\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- start; this is to cater for OpenCart v3.x  -->\n  <file path=\"system/engine/router.php\">  \n    <operation>\n      <search><![CDATA[while ($action instanceof Action) {]]></search>\n      <add position=\"before\"><![CDATA[\n        // redirecting the direct checkout URL to product details page\n        $this->runAction(\'extension/facebookpageshopcheckoutredirect\');\n\n        // building up the information for pixel firing\n        $this->runAction(\'extension/facebookeventparameters\');\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"system/engine/router.php\">\n    <operation>\n      <search><![CDATA[public function dispatch(Action $action, Action $error) {]]></search>\n      <add position=\"after\"><![CDATA[\n        // tracking the last pre_action in the list\n        $lastPreAction = end($this->pre_action);\n      ]]></add>\n    </operation>\n  </file>\n  <!-- end; this is to cater for OpenCart v3.x  -->\n  \n  <!-- start; this is to cater for OpenCart v3.x but using Journal theme which uses Opencart v2.x coding convention -->\n  <file path=\"system/engine/router.php\">  \n    <operation>\n      <search><![CDATA[while ($action) {]]></search>\n      <add position=\"before\"><![CDATA[\n        // redirecting the direct checkout URL to product details page\n        $this->runAction(\'extension/facebookpageshopcheckoutredirect\');\n\n        // building up the information for pixel firing\n        $this->runAction(\'extension/facebookeventparameters\');\n      ]]></add>\n    </operation>\n  </file>\n\n  <file path=\"system/engine/router.php\">\n    <operation>\n      <search><![CDATA[public function dispatch($action, $error) {]]></search>\n      <add position=\"after\"><![CDATA[\n        // tracking the last pre_action in the list\n        $lastPreAction = end($this->pre_action);\n      ]]></add>\n    </operation>\n  </file>\n  <!-- end; this is to cater for OpenCart v3.x but using Journal theme which uses Opencart v2.x coding convention -->\n\n  <!-- start; common for all OpenCart -->\n  <file path=\"system/engine/router.php\">\n    <operation>\n      <search><![CDATA[$result = $this->execute($pre_action);]]></search>\n      <add position=\"after\"><![CDATA[\n        // additional attempt to extract the pixel details after\n        // executing the last preaction on the list of pre-actions\n        // we have to wait for all the preactions to be executed as \n        // only then all the required information will be ready, eg\n        // uri mapping, shopping cart\n        if (isset($lastPreAction) && $pre_action == $lastPreAction) {\n          $this->runAction(\'extension/facebookeventparameters\');\n        }\n      ]]></add>\n    </operation>\n  </file>\n  <!-- end; common for all OpenCart -->\n\n\n  <file path=\"system/engine/front.php\">\n    <operation>\n      <!-- helper method to run actions required for Facebook plugin -->\n      <search><![CDATA[public function __construct($registry]]></search>\n      <add position=\"before\"><![CDATA[\n        private function runAction($actionName) {\n          // added in defensive checks to ensure the\n          // controller class is available and accessible\n          try {\n            if (is_file(\n              DIR_APPLICATION . \'/controller/\' . $actionName . \'.php\')) {\n              $facebookAction = new Action($actionName);\n              $facebookAction->execute($this->registry);\n            }\n          } catch (Exception $e) {\n            error_log($e->getMessage());\n          }\n        }\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- start; this is to cater for OpenCart v2.2.0.0 to v2.3.0.2 -->\n  <file path=\"system/engine/front.php\">\n    <operation>\n      <search><![CDATA[while ($action instanceof Action) {]]></search>\n      <add position=\"before\"><![CDATA[\n        // redirecting the direct checkout URL to product details page\n        $this->runAction(\'extension/facebookpageshopcheckoutredirect\');\n\n        // building up the information for pixel firing\n        $this->runAction(\'extension/facebookeventparameters\');\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- additional attempt to extract the pixel details after executing the last preaction on the list of pre-actions -->\n  <file path=\"system/engine/front.php\">\n    <operation>\n      <search><![CDATA[public function dispatch(Action $action, Action $error) {]]></search>\n      <add position=\"after\"><![CDATA[\n        // tracking the last pre_action in the list\n        $lastPreAction = end($this->pre_action);\n      ]]></add>\n    </operation>\n  </file>\n  <!-- end; this is to cater for OpenCart v2.2.0.0 to v2.3.0.2 -->\n\n  <!-- start; this is to cater for OpenCart v2.0.3.1 to v2.1.0.2  -->\n  <file path=\"system/engine/front.php\">\n    <operation>\n      <search><![CDATA[while ($action) {]]></search>\n      <add position=\"before\"><![CDATA[\n        // redirecting the direct checkout URL to product details page\n        $this->runAction(\'extension/facebookpageshopcheckoutredirect\');\n\n        // building up the information for pixel firing\n        $this->runAction(\'extension/facebookeventparameters\');\n      ]]></add>\n    </operation>\n  </file>\n\n  <!-- additional attempt to extract the pixel details after executing the last preaction on the list of pre-actions -->\n  <file path=\"system/engine/front.php\">\n    <operation>\n      <search><![CDATA[public function dispatch($action, $error) {]]></search>\n      <add position=\"after\"><![CDATA[\n        // tracking the last pre_action in the list\n        $lastPreAction = end($this->pre_action);\n      ]]></add>\n    </operation>\n  </file>\n  <!-- end; this is to cater for OpenCart v2.0.3.1 to v2.1.0.2  -->\n\n  <!-- start; common for all OpenCart v2.x  -->\n  <file path=\"system/engine/front.php\">\n    <operation>\n      <search><![CDATA[$result = $this->execute($pre_action);]]></search>\n      <add position=\"after\"><![CDATA[\n        // additional attempt to extract the pixel details after\n        // executing the last preaction on the list of pre-actions\n        // we have to wait for all the preactions to be executed as \n        // only then all the required information will be ready, eg\n        // uri mapping, shopping cart\n        if (isset($lastPreAction) && $pre_action == $lastPreAction) {\n          $this->runAction(\'extension/facebookeventparameters\');\n        }\n      ]]></add>\n    </operation>\n  </file>\n  <!-- end; common for all OpenCart v2.x  -->\n\n  <file path=\"catalog/language/*/checkout/success.php\">\n    <operation>\n      <search><![CDATA[<?php]]></search>\n      <add position=\"after\"><![CDATA[\n        $_[\'text_warning_facebook_fae_install_problem\'] = \'Warning: There is a problem with your Facebook Business Extension installation. Please go to Facebook Business Extension to view more details.\';\n        $_[\'text_warning_facebook_missing_facebookadsextension\'] = \'Warning: There is a problem with your Facebook Business Extension installation. We are unable to locate the admin/controller/extension/facebookadsextension.php file on your webserver. Please ensure that you have given read+write+execute permission to the admin/controller folder and reinstall the plugin again.\';\n      ]]></add>\n    </operation>\n  </file>\n</modification>\n', 1, '2019-06-24 14:42:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_module`
--

CREATE TABLE `ks_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_module`
--

INSERT INTO `ks_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(33, 'Bán chạy nhất', 'bestseller', '{\"name\":\"B\\u00e1n ch\\u1ea1y nh\\u1ea5t\",\"limit\":\"5\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(34, 'Home Page', 'recently_viewed', '{\"name\":\"Home Page\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(35, 'Home Page', 'latest', '{\"name\":\"Home Page\",\"limit\":\"5\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(36, 'Home Page', 'special', '{\"name\":\"Home Page\",\"limit\":\"5\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_openbay_faq`
--

CREATE TABLE `ks_openbay_faq` (
  `id` int(11) NOT NULL,
  `route` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_option`
--

CREATE TABLE `ks_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_option`
--

INSERT INTO `ks_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_option_description`
--

CREATE TABLE `ks_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_option_description`
--

INSERT INTO `ks_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(1, 3, 'Radio'),
(2, 3, 'Checkbox'),
(4, 3, 'Text'),
(6, 3, 'Textarea'),
(8, 3, 'Date'),
(7, 3, 'File'),
(5, 3, 'Select'),
(9, 3, 'Time'),
(10, 3, 'Date &amp; Time'),
(12, 3, 'Delivery Date'),
(11, 3, 'Size');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_option_value`
--

CREATE TABLE `ks_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_option_value`
--

INSERT INTO `ks_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_option_value_description`
--

CREATE TABLE `ks_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_option_value_description`
--

INSERT INTO `ks_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(43, 3, 1, 'Large'),
(32, 3, 1, 'Small'),
(45, 3, 2, 'Checkbox 4'),
(44, 3, 2, 'Checkbox 3'),
(31, 3, 1, 'Medium'),
(42, 3, 5, 'Yellow'),
(41, 3, 5, 'Green'),
(39, 3, 5, 'Red'),
(40, 3, 5, 'Blue'),
(23, 3, 2, 'Checkbox 1'),
(24, 3, 2, 'Checkbox 2'),
(48, 3, 11, 'Large'),
(47, 3, 11, 'Medium'),
(46, 3, 11, 'Small');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order`
--

CREATE TABLE `ks_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_order`
--

INSERT INTO `ks_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2019-00', 0, 'Your Store', 'http://kingsport.local/', 0, 1, 'duc', 'nguyen thanh', 'thducuit@gmail.com', '0932676897', '', '[]', 'duc', 'nguyen thanh', '', '10 quach van tuan', 'quach', 'tcm', '0999', 'Viet Nam', 230, 'Ho Chi Minh City', 3780, '', '[]', 'Cash On Delivery', 'cod', 'duc', 'nguyen thanh', '', '10 quach van tuan', 'quach', 'tcm', '0999', 'Viet Nam', 230, 'Ho Chi Minh City', 3780, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '606.0000', 1, 0, '0.0000', 0, '', 2, 4, 'VND', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'vi,en;q=0.9,en-US;q=0.8,fr;q=0.7,fr-FR;q=0.6', '2019-06-15 21:08:43', '2019-06-15 21:08:48'),
(2, 0, 'INV-2019-00', 0, 'Your Store', 'http://kingsport.local/', 0, 1, 'duc', 'nguyen thanh', 'thducuit@gmail.com', '0932676897', '', '[]', 'duc', 'nguyen thanh', '', '10 quach van tuan', 'quach', 'tcm', '0999', 'Viet Nam', 230, 'Ho Chi Minh City', 3780, '', '[]', 'Cash On Delivery', 'cod', 'duc', 'nguyen thanh', '', '10 quach van tuan', 'quach', 'tcm', '0999', 'Viet Nam', 230, 'Ho Chi Minh City', 3780, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '106.0000', 0, 0, '0.0000', 0, '', 2, 4, 'VND', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'vi,en;q=0.9,en-US;q=0.8,fr;q=0.7,fr-FR;q=0.6', '2019-06-15 21:29:31', '2019-06-15 21:29:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_history`
--

CREATE TABLE `ks_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_order_history`
--

INSERT INTO `ks_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2019-06-15 21:08:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_option`
--

CREATE TABLE `ks_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_product`
--

CREATE TABLE `ks_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_order_product`
--

INSERT INTO `ks_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000', '0.0000', 0),
(2, 1, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000', '0.0000', 600),
(3, 2, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_recurring`
--

CREATE TABLE `ks_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_recurring_transaction`
--

CREATE TABLE `ks_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_shipment`
--

CREATE TABLE `ks_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_status`
--

CREATE TABLE `ks_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_order_status`
--

INSERT INTO `ks_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired'),
(2, 3, 'Processing'),
(3, 3, 'Shipped'),
(7, 3, 'Canceled'),
(5, 3, 'Complete'),
(8, 3, 'Denied'),
(9, 3, 'Canceled Reversal'),
(10, 3, 'Failed'),
(11, 3, 'Refunded'),
(12, 3, 'Reversed'),
(13, 3, 'Chargeback'),
(1, 3, 'Pending'),
(16, 3, 'Voided'),
(15, 3, 'Processed'),
(14, 3, 'Expired');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_total`
--

CREATE TABLE `ks_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_order_total`
--

INSERT INTO `ks_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '601.0000', 1),
(2, 1, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(3, 1, 'total', 'Total', '606.0000', 9),
(4, 2, 'sub_total', 'Sub-Total', '101.0000', 1),
(5, 2, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(6, 2, 'total', 'Total', '106.0000', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_order_voucher`
--

CREATE TABLE `ks_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product`
--

CREATE TABLE `ks_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `is_featured` int(11) DEFAULT NULL,
  `is_new` int(11) DEFAULT NULL,
  `is_second` int(11) DEFAULT NULL,
  `is_recurring` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product`
--

INSERT INTO `ks_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `is_featured`, `is_new`, `is_second`, `is_recurring`) VALUES
(30, 'XD16', '', '', '', '', '', '', '', 7, 7, 'catalog/xe_dap_dia_hinh_XD16.jpg', 9, 1, '3500000.0000', 0, 0, '2019-06-24', '130.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 32, '2009-02-03 16:59:00', '2019-06-24 22:25:53', NULL, NULL, NULL, NULL),
(42, 'BK-2032', '', '', '', '', '', '', '', 990, 7, 'catalog/300_crop_may_chay_bo_kingsport_bk-2032_1.jpg', 8, 1, '21000000.0000', 0, 0, '2019-06-23', '105.00000000', 1, '1910.00000000', '945.00000000', '1400.00000000', 2, 1, 1, 1, 1, 57, '2009-02-03 21:07:37', '2019-06-24 13:26:36', NULL, NULL, NULL, NULL),
(51, 'G087', '', '', '', '', '', '', '', 10, 7, 'catalog/1_10.jpg', 0, 1, '450000.0000', 0, 0, '2019-06-24', '440.00000000', 2, '125.00000000', '99.00000000', '53.00000000', 2, 1, 1, 1, 1, 1, '2019-06-24 13:49:38', '2019-06-24 22:28:10', NULL, NULL, NULL, NULL),
(52, 'BK-2034', '', '', '', '', '', '', '', 10, 7, 'catalog/maychaybo_bk2034.jpg', 0, 1, '19000000.0000', 0, 0, '2019-06-24', '93.00000000', 1, '1880.00000000', '850.00000000', '1345.00000000', 2, 0, 1, 2, 1, 8, '2019-06-24 22:06:14', '2019-06-24 22:26:18', NULL, NULL, NULL, NULL),
(54, 'bk2029', '', '', '', '', '', '', '', 10, 7, 'catalog/300_crop_2029.jpg', 8, 1, '8900000.0000', 0, 0, '2019-06-24', '48.00000000', 1, '1680.00000000', '1290.00000000', '705.00000000', 2, 0, 1, 1, 1, 21, '2019-06-24 22:22:51', '2019-06-25 15:29:19', NULL, NULL, NULL, NULL),
(50, 'MZ-260A', '', '', '', '', '', '', '', 10, 7, 'catalog/300_crop_Ava_MZ260.jpg', 0, 1, '7260000.0000', 0, 0, '2019-06-24', '25.00000000', 1, '480.00000000', '330.00000000', '360.00000000', 2, 0, 1, 1, 1, 3, '2019-06-24 13:32:45', '2019-06-24 22:09:50', NULL, NULL, NULL, NULL),
(55, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 1, '2019-06-26 13:10:33', '2019-06-26 13:10:33', 0, 0, 0, 0),
(56, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 8, '2019-06-26 13:10:33', '2019-06-26 13:10:33', 0, 0, 0, 0),
(57, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 13, '2019-06-26 13:26:25', '2019-06-26 13:26:25', 0, 0, 0, 0),
(58, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 5, '2019-06-26 13:47:08', '2019-06-26 13:47:08', 0, 0, 0, 0),
(59, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 1, '2019-06-26 15:16:43', '2019-06-26 15:16:43', 0, 0, 0, 0),
(60, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 0, '2019-06-26 15:31:10', '2019-06-26 15:31:10', 0, 0, 0, 0),
(61, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 0, '2019-06-26 15:40:46', '2019-06-26 15:40:46', 0, 0, 0, 0),
(62, 'BK-5000NEW', '', '', '', '', '', '', '', 10, 7, 'catalog/Avatar.jpg', 8, 1, '18060000.0000', 0, 0, '2019-06-26', '81.00000000', 1, '1785.00000000', '770.00000000', '1340.00000000', 2, 1, 1, 3, 1, 0, '2019-06-26 17:10:39', '2019-06-26 17:10:39', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_attribute`
--

CREATE TABLE `ks_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_attribute`
--

INSERT INTO `ks_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(54, 14, 2, '5 Năm-- Ván thảm 1 năm- Bảo trì trọn đời ( tại nhà)\r\nCó đầy đủ linh phụ kiện chính hãng thay thế'),
(54, 9, 2, '12'),
(54, 10, 2, 'Không'),
(54, 11, 2, 'Có'),
(30, 22, 2, 'Có thể điều chỉnh độ cao'),
(42, 13, 2, 'Có'),
(42, 14, 2, '6 Năm- Ván thảm 2 năm-Bảo trì trọn đời ( tại nhà)\r\nCó đầy đủ linh phụ kiện chính hãng thay thế'),
(42, 12, 2, 'Wifi - Jack 3.5 mm'),
(42, 11, 2, 'Có'),
(42, 9, 2, 'chương trình do người dùng tùy chọn'),
(42, 8, 2, 'Khí nén &amp; lò xo'),
(42, 7, 2, 'Có- Độ dốc tối đa 20%'),
(42, 6, 2, '138x56 (Cm) | (DxR)'),
(42, 4, 2, '5.0 Hp'),
(42, 3, 2, 'BK-2032( Đa Năng)'),
(42, 2, 2, '22Km/h'),
(42, 1, 2, '220V, 50-60Hz'),
(30, 20, 2, 'Thép W600*31.8*φ22.2'),
(30, 18, 2, 'Thép 20inch'),
(30, 16, 2, 'Sơn'),
(54, 8, 2, 'đệm cao su'),
(50, 38, 2, '35/37kg'),
(50, 37, 2, '480×330×360mm'),
(50, 36, 2, '2-3 giây'),
(50, 34, 2, '1'),
(50, 32, 2, '385x380x90mm'),
(50, 30, 2, '0.75KW'),
(54, 54, 2, 'Có'),
(51, 49, 2, '-22  đến 55 độ C'),
(51, 50, 2, '10%~95%RH'),
(51, 51, 2, '440 g'),
(30, 21, 2, 'Thép φ28.6*300MM*1.2T'),
(42, 13, 3, 'Có'),
(42, 14, 3, '6 Năm- Ván thảm 2 năm-Bảo trì trọn đời ( tại nhà)\r\nCó đầy đủ linh phụ kiện chính hãng thay thế'),
(42, 12, 3, 'Wifi - Jack 3.5 mm'),
(42, 11, 3, 'Có'),
(42, 9, 3, 'chương trình do người dùng tùy chọn'),
(42, 8, 3, 'Khí nén &amp; lò xo'),
(42, 7, 3, 'Có- Độ dốc tối đa 20%'),
(42, 6, 3, '138x56 (Cm) | (DxR)'),
(42, 4, 3, '5.0 Hp'),
(42, 3, 3, 'BK-2032( Đa Năng)'),
(42, 2, 3, '22Km/h'),
(42, 1, 3, '220V, 50-60Hz'),
(30, 23, 2, 'Thép 115mm'),
(30, 24, 2, '1/2*1/8*84#'),
(30, 25, 2, 'Hợp kim 20&quot;*25MM*14G*36H'),
(30, 26, 2, 'Kích thước 20*1.95inch'),
(30, 27, 2, '130 kg'),
(30, 28, 2, '1 năm ( không bảo hành lốp và săm xe)'),
(30, 19, 2, 'Thép không gỉ'),
(30, 17, 2, 'Tím / Trắng / Đỏ / Đen'),
(30, 15, 2, 'Tĩnh điện'),
(50, 35, 2, '10m3/h'),
(50, 33, 2, '430×10mm'),
(50, 31, 2, '0.66KPA'),
(50, 29, 2, '220V/50HZ'),
(54, 3, 2, 'bk2029 (Đơn Năng)'),
(54, 4, 2, '2.5 Hp'),
(54, 6, 2, '121x46(Cm) | (DxR)'),
(51, 39, 2, 'LCD'),
(51, 40, 2, '99 lưu trữ'),
(51, 41, 2, 'Live Voice'),
(51, 42, 2, '0mmHg - 280 mmHg'),
(51, 44, 2, '6V'),
(51, 45, 2, '&lt;20uA'),
(51, 46, 2, '&lt;60mA'),
(51, 47, 2, 'Đường kính có thể đo'),
(51, 48, 2, 'Not Testing One Min Auto Shut off'),
(52, 1, 2, '220V, 50-60Hz'),
(52, 2, 2, '18 Km/h'),
(52, 4, 2, '4.5 Hp'),
(52, 6, 2, '135x52 (Cm) | (DxR)'),
(52, 9, 2, '12 và 3 chương trình do người dùng tùy chọn'),
(52, 11, 2, 'Có'),
(52, 13, 2, 'Có'),
(52, 14, 2, '6 Năm- Ván thảm 2 năm-Bảo trì trọn đời ( tại nhà)\r\nCó đầy đủ linh phụ kiện chính hãng thay thế'),
(52, 52, 2, 'Không'),
(54, 1, 2, '220V, 50-60Hz');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_description`
--

CREATE TABLE `ks_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `video` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_description`
--

INSERT INTO `ks_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `video`) VALUES
(51, 2, 'Máy đo huyết áp bắp tay Kingsport G087', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Phòng bệnh hơn chữa bệnh!&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Sở hữu 1 chiếc máy đo huyết áp tại nhà không chỉ giúp mọi người chủ động trong việc theo dõi&amp;nbsp;sức khỏe mà còn giúp tiết kiệm thời gian và tiền bạc để không phải thường xuyên tới phòng khám tư hay bệnh viện.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Chúng ta vẫn nên kiểm tra huyết áp thường xuyên bởi căn bệnh tim mạch này diễn biến âm thầm và gây nhiều biến chứng nguy hiểm đến tính mạng.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Với Máy đo huyết áp Kingsport G087 – Thương hiệu số 1 trong nghành chăm sóc sức khỏe tại Việt Nam, sẽ giúp bạn bảo vệ sức khỏe ngay tại nhà.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;may_do_hap&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/may_do_hap.jpg&quot; style=&quot;max-width: 100%; opacity: 0.9; font-size: 18px; width: 800px; height: 606px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;3_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/3_3.jpg&quot; style=&quot;max-width: 100%; opacity: 0.9; text-align: center; width: 750px; height: 490px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;TÍNH NĂNG NỖI BẬT CỦA MÁY ĐO HUYẾT ÁP KINGSPORT G087&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Có Adaptor&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;bộ sạc pin ngoài 5V sử dụng liên tục 24/24&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Dễ dàng thao tác sử dụng&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Bộ nhớ lưu 99 kết quả với cùng ngày giờ đo, từ đó bạn có thể theo dõi và tổng kết để biết được mức huyết áp cao nhất trong ngày thường ở thời gian nào và đưa ra những chế độ hợp lý&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Công nghệ Intellisense: Cho kết quả đo nhanh, chính xác &amp;amp; thoải mái hơn khi đo. Tự động bơm hơi tới áp suất phù hợp.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Cảm&amp;nbsp;biến huyết áp chuẩn Nhật Bản -Hạn chế sai lệch chỉ số&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Báo rối loạn nhịp tim&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Chức năng hiển thị kết quả trung bình của 3 lần đo cuối , từ đó ta sẽ có thông số huyết áp chính xác nhất.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;- Màn hình LCD lớn nên rất thích hợp cho người cao tuổi.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px; break-after: page;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;6_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/6_6.jpg&quot; style=&quot;max-width: 100%; opacity: 0.9; text-align: center; width: 750px; height: 750px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Kết quả đo đạt chính xác cao&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;6_5&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/6_5.jpg&quot; style=&quot;max-width: 100%; opacity: 0.9; text-align: center; width: 750px; height: 1088px;&quot;&gt;&lt;br&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Thiết kế thông minh, phím bấm to&amp;nbsp;dễ dàng sử dụng cho người lớn tuổi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;img alt=&quot;g087&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/g087.jpg&quot; style=&quot;max-width: 100%; width: 750px; height: 422px;&quot;&gt;&lt;img alt=&quot;5_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/5_6.jpg&quot; style=&quot;max-width: 100%; text-align: center; width: 750px; height: 1000px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-weight: 700; font-size: 16px;&quot;&gt;THÔNG TIN KỸ THUẬT MÁY ĐO HUYẾT ÁP BẮP TAY TỰ ĐỘNG KINGSPORT G086&lt;/span&gt;&lt;/p&gt;&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;background-color: rgb(255, 255, 255); margin-bottom: 10px; width: 800px; display: block; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Product Name&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Electronic Blood Pressure Monitor&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Màn hình hiễn thị&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;LCD&amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Bộ nhớ&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;99 lưu trữ&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Chức năng thoại&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Live Voice&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Phạm vi đo&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;0mmHg - 280 mmHg&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Sai số&amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;+-3mmHg&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Điện áp làm việc&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;6V&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Shut off the Current&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;lt;20uA&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Inrush Current&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&amp;lt;60mA&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Đường kính có thể đo&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;22cm - 32 cm&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Tự động tắt nguồn&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Not Testing One Min Auto Shut off&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Nhiệt độ lưu trữ&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;-22&amp;nbsp; đến 55 độ C&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Độ Ẩm&amp;nbsp;&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;10%~95%RH&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Trọng lượng máy&lt;/span&gt;&lt;/td&gt;&lt;td style=&quot;padding: 5px; border: 1px solid rgb(238, 238, 238); line-height: inherit;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;440 g&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;background-color: rgb(255, 255, 255); margin-bottom: 10px; width: 870px; display: block; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;tbody&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Bao gồm : Máy, vòng bít, hướng dẫn cách sử dụng,&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 18px;&quot;&gt;Adaptor&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;LỢI ÍCH CHO KHÁCH HÀNG MUA SẢN PHẨM CHÍNH HÃNG KINGSPORT&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- Kingsport thương hiệu Nỗi tiếng - Uy Tín Lâu Năm trên Toàn Cầu&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- Sản phẩm&amp;nbsp;ứng dụng công nghệ sản xuất tiên tiên nhất&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- Giá bán chính hãng trực tiếp từ NSX&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;-&amp;nbsp;Bảo hành 5 năm - Bảo trì trọn đời&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;- Giao hàng miễn phí &amp;amp; thu tiền tại nhà trên toàn quốc ( 64 Tỉnh thành)&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;text-align: center; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chứng nhận đạt chuẩn chất lượng quốc tế&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;text-align: center; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;5B3EDDD33C42FD751B7D9F906690E4E276FA42255FE3A8C677pimgpsh_fullsize_distr_1&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/5B3EDDD33C42FD751B7D9F906690E4E276FA42255FE3A8C677pimgpsh_fullsize_distr_1.jpg&quot; style=&quot;max-width: 100%; opacity: 0.9; width: 400px; height: 550px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;img alt=&quot;8465D43A868E82B09E06E35BAB1AE0DE9554414542C3A01982pimgpsh_fullsize_distr&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_do_huyet_ap/8465D43A868E82B09E06E35BAB1AE0DE9554414542C3A01982pimgpsh_fullsize_distr.jpg&quot; style=&quot;max-width: 100%; width: 400px; height: 550px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, giá trị cùng với chế độ hậu mãi bán hàng và bảo hành TỐT cho khách hàng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Để tránh mua nhầm hàng nhái, hàng giả kém chất lượng trên thị trường. Quý khách hàng hãy gọi ngay tổng đài tư vấn miễn phí: 1800 6862 hoặc đến&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;hệ thống &amp;nbsp;showroom KingSport&lt;/a&gt;&amp;nbsp;trên toàn quốc&amp;nbsp;để mua được sản phẩm chính hãng.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Khi Bạn đặt hàng, Bạn sẽ được giao hàng miễn phí tại nhà trong vòng 24h. Áp dụng tại 64 tỉnh thành trên toàn quốc.&lt;/span&gt;&lt;/p&gt;', '', 'Máy đo huyết áp bắp tay Kingsport G087', '', '', NULL),
(54, 2, 'MÁY CHẠY BỘ KINGSPORT BK-2029 ĐƠN NĂNG', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 22px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;SỐNG KHỎE HƠN MỖI NGÀY CÙNG MÁY CHẠY BỘ BK-2029 ĐƠN NĂNG&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ BK-2029 là sản phẩm thuộc dòng phổ thông, mang phong cách khỏe khoắn&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;THỂ THAO&lt;/span&gt;&amp;nbsp;đầy cá tính. Cải tiến mới với&amp;nbsp;động cơ&amp;nbsp;tiết kiệm điện năng&amp;nbsp;công suất cực đại&amp;nbsp;2.5&amp;nbsp;mã lực, hệ thống giảm sốc ưu việt, thiết kế tinh tế nhỏ gọn, tối ưu hóa không gian, thiết kế chuyên dụng&amp;nbsp;để luyện tập chạy bộ ngay tại nhà mang đến trải nghiệm tuyệt vời cho gia đình bạn.&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;bk2029&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/bk2029.png&quot; style=&quot;max-width: 100%; width: 869px; height: 869px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 896px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_02&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_02.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 935px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 600px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_04&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_04.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 748px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 811px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_06&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_06.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 1004px;&quot;&gt;&lt;img alt=&quot;may-chay-bo-don-nang-BK-2029_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may-chay-bo-don-nang-BK-2029_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 1107px;&quot;&gt;&lt;/p&gt;&lt;div class=&quot;spw-image&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-align: left;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div class=&quot;spw-image&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-align: left;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;b&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-2029&amp;nbsp;ĐƠN&amp;nbsp;NĂNG&lt;/b&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;spw-image&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-align: left;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Thiết kế hiện đại, tinh tế,&amp;nbsp;chắc chắn &amp;amp; an toàn từ thép không gỉ,&amp;nbsp;lớp sơn tĩnh điện được phủ ở bề mặt đảm bảo máy luôn hoạt động tốt mà không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Màn hình hiển thị kiểm soát được các thông số tốc độ, thời gian, quãng đường, nhịp tim, calo tiêu hao giúp người tập kiểm soát được kết quả luyện tập của mình.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Động cơ mạnh mẽ: Công suất động cơ 2.5 HP&amp;nbsp;mạnh lực, tốc độ chạy tối đa&amp;nbsp;15km/h chịu tải trọng người dùng tối đa lên đến 120kg, giúp tiết kiệm điện năng tối đa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Thảm chạy rộng: 121 x46cm, được làm từ cao su cao cấp chống trượt, độ bền cao, vùng chạy rộng giúp bạn an toàn &amp;amp; thoải mái trong quá trình luyện tập&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Hệ thống giảm sốc với lò xò và nệm cao su cao cấp giúp những bước chạy đầm và êm ái.&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Chức năng nghe nhạc kết nối qua cổng mp3 điện thoại hoặc USB kết hợp với loa Hifi âm thanh trung thực và sống động nhất mang lại những phút giây sảng khoái trong luyện tập.&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;- Chương trình luyện tập đa dạng với 12&amp;nbsp;chương trình luyện tập được thiết kế tương thích người dùng.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;-&amp;nbsp;Dễ dàng di chuyển khắp không gian sử dụng với bánh xe và pít tông trợ lực được hỗ trợ đi kèm theo máy.&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;spw-image&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-align: left;&quot;&gt;&amp;nbsp;&lt;/div&gt;&lt;div class=&quot;spw-image&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-align: left;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Đặc biệt, Kingsport còn hỗ trợ mua&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Máy chạy bộ KingSport BK-2029 đơn năng&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;trả góp 0% bằng thẻ tín dụng tại khu vực thành phố&amp;nbsp;Hồ Chí Minh và Hà Nội&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;spw-image&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(102, 102, 102);&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/uu-dai-tra-gop-0-voi-thoi-han-tra-gop-len-toi-12-thang-cua-kingsport.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; font-size: 16px; line-height: 22px; transition: color 0.5s ease 0s; margin: 0px; padding: 0px; font-family: Arial, Helvetica, sans-serif;&quot;&gt;&lt;img alt=&quot;mua máy chạy bộ trả góp 0%&quot; src=&quot;http://babilon.vn/uploads/noidung/images/000000.jpg&quot; style=&quot;max-width: 100%; margin: 0px; padding: 0px; outline: 0px; border-spacing: 0px; width: 630px; height: 420px;&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;hr style=&quot;margin-top: 20px; margin-bottom: 20px; background: rgb(213, 213, 213); color: rgb(213, 213, 213); width: 870px;&quot;&gt;&lt;h2 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 40px; color: rgb(102, 102, 102); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 14px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;&quot;&gt;&lt;span style=&quot;background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 18px;&quot;&gt;LỢI ÍCH MUA HÀNG CHÍNH HÃNG TẠI KINGSPORT&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/h2&gt;&lt;blockquote style=&quot;padding: 0px; margin-bottom: 0px; font-size: 17.5px; line-height: 24px; color: rgb(102, 102, 102);&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;• Sở&amp;nbsp;hữu&amp;nbsp;được sản phẩm chất lượng có thương hiệu Nổi&amp;nbsp;tiếng-&amp;nbsp;Uy Tín- Tin Cậy - Lâu Năm trên thị trường&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;• Được đổi trả hàng nếu&amp;nbsp;&amp;nbsp;không đúng như quảng cáo&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;• Được giao hàng nhanh miễn phí, lắp đặt &amp;amp; bảo hành ngay tại nhà ( Showroom toàn quốc)&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em&gt;• Mua sản phẩm với giá bán trực tiếp từ NSX, NK &amp;amp; PP trực tiếp KingSport ( Tiết kiệm 35%)&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-size: 14px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;em new=&quot;&quot; times=&quot;&quot;&gt;• Cùng với những chính sách sau bán hàng tốt nhất dành cho khách hàng&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); background-color: rgb(241, 241, 241); text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 18px; font-weight: bold;&quot;&gt;CHẠY BỘ TẠI NHÀ CÙNG MÁY CHẠY BỘ KINGSPORT - GIÚP BẠN TIẾT KIỆM THỜI GIAN QUÝ BÁU MỘT CÁCH TỐT NHẤT&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); background-color: rgb(241, 241, 241); text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;img alt=&quot;yes&quot; height=&quot;20&quot; src=&quot;https://www.kingsport.vn/plugins/editors/ckeditor/plugins/smiley/images/thumbs_up.gif&quot; title=&quot;yes&quot; width=&quot;20&quot; style=&quot;max-width: 100%;&quot;&gt;LỜI KHUYÊN:&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;&lt;/span&gt;Bạn hãy duy trì&amp;nbsp;thói quen&amp;nbsp;30 phút luyện tập&lt;a href=&quot;https://www.kingsport.vn/ly-do-chay-bo-moi-ngay.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&amp;nbsp;CHẠY BỘ tại nhà&amp;nbsp;mỗi ngày&amp;nbsp;&lt;/a&gt;sẽ đem lại nhiều lợi ích cho sức khỏe:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); background-color: rgb(241, 241, 241); text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;- Cơ xương&amp;nbsp;chắc khỏe, ngăn ngừa và PHÒNG CHỐNG&amp;nbsp;nguy cơ mắc bệnh UNG THƯ, bệnh tim và TIỂU ĐƯỜNG.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); background-color: rgb(241, 241, 241); text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;- Hơn thế nữa ,Chạy bộ là giải pháp đốt cháy chất béo GIẢM CÂN&amp;nbsp;hiệu quả, tăng cường sức đề kháng, giúp bạn SỐNG KHỎE, cải thiện chất lượng cuộc sống tốt hơn .&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; color: rgb(102, 102, 102); background-color: rgb(241, 241, 241); text-align: justify;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;-Tại&amp;nbsp;&lt;span style=&quot;color: rgb(178, 34, 34);&quot;&gt;KingSport luôn đặt tâm huyết cho ra đời những dòng máy chạy bộ &quot;Chuẩn Mực&quot; sẽ giúp bạn nhanh chóng đạt được mục tiêu&amp;nbsp;dễ dàng hơn.&lt;/span&gt;&lt;/span&gt;&lt;span font-size:=&quot;&quot; trebuchet=&quot;&quot; style=&quot;color: rgb(51, 51, 51);&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo-kingsport-bk2029-don-nang.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;img alt=&quot;loi-ich-may-chay-bo-kingsport-Bk2029-don-nang&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/10_2016/img-prod7.jpg&quot; style=&quot;max-width: 100%;&quot;&gt;&lt;/a&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 24px; line-height: 34px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-weight: bold;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;img alt=&quot;heart&quot; height=&quot;20&quot; src=&quot;https://www.kingsport.vn/plugins/editors/ckeditor/plugins/smiley/images/heart.gif&quot; title=&quot;heart&quot; width=&quot;20&quot; style=&quot;max-width: 100%;&quot;&gt;MÁY CHẠY BỘ KINGSPORT CẢI THIỆN VÀ ĐIỀU TRỊ CÁC BỆNH VỀ XƯƠNG KHỚP CHĂM SÓC&amp;nbsp;SỨC KHỎE TOÀN DIỆN&amp;nbsp;CHO GIA ĐÌNH&amp;nbsp;BẠN&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo-kingsport-bk2029-don-nang.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;img alt=&quot;Kingsport-thuong-hieu-may-chay-bo-uy-tin-tai-Viet-Nam&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/uy-tin.jpg&quot; style=&quot;max-width: 100%; width: 800px; height: 1188px;&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo-kingsport-bk2029-don-nang.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;div id=&quot;scroll_1&quot; class=&quot;div_scroll&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;desc&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;hr style=&quot;margin-top: 20px; margin-bottom: 20px; background: rgb(213, 213, 213); color: rgb(213, 213, 213); width: 870px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;font-size: 18px; font-weight: bold;&quot;&gt;Kingsport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế với mức giá rẻ nhất thị trường&amp;nbsp;cùng với chế độ hậu mãi sau bán hàng và bảo hành TỐT NHẤT cho khách hàng.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo.html&quot; style=&quot;color: rgb(51, 51, 51); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;span style=&quot;font-size: 18px; font-weight: bold;&quot;&gt;Bạn có thể tham khảo thêm các mẫu máy chạy bộ chính hãng&amp;nbsp;Kingsport &amp;nbsp;mini cho gia đình tại đây.&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-family: customFont, helvetica, arial, sans-serif; font-size: 16px;&quot;&gt;Để mua được sản phẩm chính hãng Kingsport.&amp;nbsp;Quý khách hàng hãy gọi đến&amp;nbsp;tổng đài tư vấn miễn phí: 1800 6862 hoặc đến&amp;nbsp;&lt;a href=&quot;https://www.kingsport.vn/he-thong-chi-nhanh-ban-hang-kingsport.html&quot; style=&quot;color: rgb(51, 51, 51); outline: 0px; font-size: 14px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;hệ thống showroom KingSport&lt;/a&gt;&amp;nbsp;trên toàn quốc .&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s; font-weight: 700;&quot;&gt;&lt;a href=&quot;https://www.kingsport.vn/may-chay-bo-kingsport-bk2029-don-nang.html&quot; style=&quot;color: rgb(0, 0, 0); outline: 0px; line-height: 22px; transition: color 0.5s ease 0s;&quot;&gt;&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;&lt;div id=&quot;scroll_2&quot; class=&quot;div_scroll&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px;&quot;&gt;&lt;div class=&quot;dsd-title&quot; style=&quot;margin: 0px 0px 25px; padding: 0px 0px 10px; border-bottom: 2px solid rgb(223, 32, 37); font-size: 25px; line-height: 35px; text-transform: uppercase; color: rgb(0, 0, 0);&quot;&gt;&lt;h3 style=&quot;line-height: 35px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 25px; padding: 0px;&quot;&gt;HƯỚNG DẪN SỬ DỤNG&lt;/h3&gt;&lt;/div&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div class=&quot;desc&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;iframe allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;480&quot; src=&quot;https://www.youtube.com/embed/Hfu506aVlnA&quot; width=&quot;100%&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-2029 ĐƠN NĂNG', '', '', NULL),
(42, 2, 'MÁY CHẠY BỘ KINGSPORT BK-2032 ĐA NĂNG', '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px; text-align: center;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-2032&amp;nbsp;ĐA NĂNG&lt;/h3&gt;&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px; text-align: center;&quot;&gt;THIẾT KẾ THỜI THƯỢNG VỚI MÀN HÌNH ẢM ỨNG VÀ KẾT NỐI WIFI!!&lt;/h3&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Khói bụi, ô nhiễm, nắng nóng làm bạn lười ra đường để vận động và luyện tập sức khỏe. Tại sao chúng ta không tìm ngay giải pháp luyện tập ngay tại nhà???&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-2032&amp;nbsp;đa năng cỗ máy luyện tập sức khỏe ngay tại nhà cho bạn dáng chuẩn eo thon, tự tin khoe dáng mỗi ngày. Kiểu dáng tinh tế, thiết kế khỏe khoắn, gọn gàng, bạn có thể gấp gọn bảo quản được mọi không gia nhà như phòng khách, phòng ngủ, ban công, phòng làm việc cho bạn tự do luyện tập mọi lúc mọi nơi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước 1800 6862 hoặc Hotline 0936 211 210 để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-2032&amp;nbsp;đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-2032&amp;nbsp;ĐA NĂNG:&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế thời thượng, kiểu dáng hiện đại dễ dàng gấp gọn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;5.0&amp;nbsp;HP&lt;/span&gt;&amp;nbsp;vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;1-22km.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Diện tích vùng chạy siêu rộng&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;138x56cm&lt;/span&gt;&amp;nbsp;cho phép người tập thoải mái mà không lo trượt khỏi vùng chạy. Chế độ nâng dốc tự động đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;20%&lt;/span&gt;&amp;nbsp;giúp bạn dễ dàng thao tác các bài tập trên mọi địa hình phức tạp.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Hệ thống tra dầu tự động giúp tăng độ trơn mượt của băng chạy, giảm thiểu tiếng ồn và tăng cường tuổi thọ của băng thảm giúp quá trình tập diễn ra tốt hơn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Điểm nổi bật của dòng máy BK-2032&amp;nbsp;đa chính là hệ thống GIẢI TRÍ&amp;nbsp;&amp;nbsp;đẳng cấp, nghe nhạc mp3&amp;nbsp; với loa Hifi mang lại âm thanh trung thực và sống động nhất,&amp;nbsp; kết nối wifi cực nhanh, màn hình cảm ứng trơn tru dễ thao tác.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Có chế độ tập luyên chuyên biệt theo dõi sức khỏe đên từng bước chân&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;may_chay_bo_kingsport_bk-2032_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may_chay_bo_kingsport_bk-2032_3.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 869px;&quot;&gt;&lt;img alt=&quot;may_chay_bo_kingsport_bk-2032_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may_chay_bo_kingsport_bk-2032_2.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 869px;&quot;&gt;&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;KHUNG SƯỜN CHẮC CHẮN CÙNG CÔNG NGHỆ TẢN LỰC HIỆN ĐẠI&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;150kg, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa, cùng hệ thống giảm sốc bằng túi hơi cảm biến điện tử giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;TẬP LUYỆN VỚI NHIỀU BÀI TẬP KHÁC NHAU&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;BK-2032&amp;nbsp;là máy chạy bộ đa năng, ngoài công dụng chính là đi bộ chạy bộ máy còn tích hợp chức năng bổ trợ:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thanh gập bụng: thực hiện bài tập cơ bụng săn chắc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Cặp tạ tay giúp bạn có bắp tay thon gọn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Đĩa xoay eo khởi động chống căng cơ khi chạy.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Đai massage: giảm mỡ bụng, eo, mông, đùi… hoặc giúp cơ bắp thư giãn sau khi luyện tập.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-2032&amp;nbsp;đa năng&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-2032 đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giản cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi. Sở hữu những tính năng và công nghệ mới hiện nay, vừa chạy bộ, vừa nghe nhạc giúp tăng cường sức khoẻ, giúp cả nhà phòng tránh những mệt mỏi, căng thẳng để học tập và làm việc tốt hơn.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT cho khách hàng&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;CẢM NHẬN KHÁCH HÀNG&lt;/h3&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Anh Phạm Trung Hậu (31 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Nói về chiếc máy này tôi chỉ có thể nói là tuyệt, mua cũng được gần 1 năm rồi nhưng máy chạy rất êm, điều tôi thích nhất ở đây là nó có thể&amp;nbsp; gấp gọn và dễ dàng duy chuyển đến mọi nơi, tập bất cứ đâu cũng được thật tiện lợi.&lt;/p&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li value=&quot;2&quot; style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Chị Đào Thúy An (27 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thật ra tôi mua chiếc máy này để ông xã tôi có thể luyện tập sức khỏe, nhưng khi tìm hiểu và sử dụng thì đúng thật là chiếc máy đa năng, gia đình tôi ai&amp;nbsp; ai cũng dùng được, thật đáng tiền khi mua chiếc máy này về cho cả gia đình.&lt;/p&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li value=&quot;3&quot; style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Anh Trần Minh Luân ( 39 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Sức khỏe là điều mà tôi chú trọng mỗi ngày, đầu tư cho sức khỏe là quyết định đúng đắn, sau 2 tháng sử dụng chiếc máy chạy bộ này điều đầu tiên tôi cảm nhận được chính là cơ thể tôi săn chắc hơn, khỏe hơn và tinh thần phấn chấn hơn, tôi rất hài lòng về chiếc máy này.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;ul&gt;\r\n&lt;/ul&gt;\r\n', '', 'MÁY CHẠY BỘ KINGSPORT BK-2032 ĐA NĂNG THIẾT KẾ THỜI THƯỢNG VỚI MÀN HÌNH ẢM ỨNG VÀ KẾT NỐI WIFI!!', '', '', NULL);
INSERT INTO `ks_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `video`) VALUES
(50, 2, 'Máy hút chân không công nghiệp MAGIC AIR MZ-260A', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;color: rgb(178, 34, 34);&quot;&gt;&lt;span style=&quot;font-size: 22px;&quot;&gt;MÁY&amp;nbsp;HÚT CHÂN KHÔNG THỰC PHẨM&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Bạn &amp;nbsp;muốn:&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Đóng gói nhanh chóng và tiện lợi&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Đóng gói với túi to ngoại cỡ.&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Đóng gói với số lượng nhiều để kinh doanh&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;may-hut-chan-khong-thuc-pham-magic-1m4G3-lRJ9LX_simg_d0daf0_800x1200_max&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/may-hut-chan-khong-thuc-pham-magic-1m4G3-lRJ9LX_simg_d0daf0_800x1200_max.jpg&quot; style=&quot;max-width: 100%; width: 790px; height: 563px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Bạn sẽ giải quyết được tất cả những vấn đề trên bằng dòng sản phẩm máy hút chân không thực phẩm công nghiệp Magic Air MZ-260A&amp;nbsp;của chúng tôi.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;br&gt;&lt;img alt=&quot;Website_MZ260_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/Website_MZ260_01.gif&quot; style=&quot;max-width: 100%; width: 869px; height: 637px;&quot;&gt;&lt;img alt=&quot;Website_MZ260_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/Website_MZ260_03.gif&quot; style=&quot;max-width: 100%; width: 869px; height: 1077px;&quot;&gt;&lt;img alt=&quot;Website_MZ260_04&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/Website_MZ260_04.gif&quot; style=&quot;max-width: 100%; width: 869px; height: 878px;&quot;&gt;&lt;img alt=&quot;Website_MZ260_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/Website_MZ260_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 585px;&quot;&gt;&lt;img alt=&quot;Website_MZ260_06&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/Website_MZ260_06.gif&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Đặc điểm nổi bật của máy hút chân không thực phẩm Magic Air MZ-260A:&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;&quot;&gt;Máy hút chân không công nghiệp MZ-260A được sử dụng hút không khí ra khỏi sản phẩm để bảo quản sản phẩm được lâu hơn như các sản phẩm : Thịt cá tươi sống, rau củ quả, thực phẩm khô (khô bò, cá khô, tôm khô,…) các loại rau củ quả khô. Công suất mát mạnh có thể hút lượng nhiều sản phẩm cùng lúc và dễ dàng sử dụng với bộ nút điều chỉnh sức hút,thời gian hút tùy thuộc mỗi sản phẩm khác nhau. Thực phẩm được bảo quản bằng cách hút chân không sẽ giữ được lâu hơn, và vẫn giữ độ tươi ngon đối với thực phẩm là đồ tươi,… Với công dụng tuyệt vời của máy hút chân không, hiện nay có rất nhiều cơ sở sản xuất phân phối lựa chọn để đóng gói cho sản phẩm&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;img alt=&quot;may-hut-chan-khong-thuc-pham&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/may-hut-chan-khong-thuc-pham.jpg&quot; style=&quot;max-width: 100%; width: 647px; height: 462px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;span style=&quot;font-family: Arial, Helvetica, sans-serif;&quot;&gt;Máy có thể sử dụng hút liên tục, có thể hút nhiều sản phẩm cùng lúc tùy vào kích cỡ bao bì và lượng sản phẩm.&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Máy hút chân không Magic Air MZ-260A&amp;nbsp;được sử dụng trong quy trình sản xuất đóng gói thực phẩm như: hải sản, nông sản, các loại thực phẩm đã chế biến sẵn, các loại hạt, khô…tại các cơ sở, doanh nghiệp lớn nhỏ.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;may-hut-chan-khong-thuc-pham-4&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/may_hut_chan_khong/may-hut-chan-khong-thuc-pham-4.jpg&quot; style=&quot;max-width: 100%; width: 769px; height: 463px;&quot;&gt;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Ngoài ra còn có thể sử dụng bảo quản các vật dụng cá nhân như: Quần áo, chăn màn, thiết bị điện tử, các dụng cụ y tế,v.v... rất hiệu quả.&lt;/li&gt;&lt;/ul&gt;&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;&amp;nbsp; &amp;nbsp;CÁC CHỨC NĂNG MÁY:&lt;/h3&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;Thứ tự làm việc: Hút chân không - Bơm gas - Hàn miệng - &amp;nbsp;Phun khí – Làm mát mối hàn&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; list-style: none;&quot;&gt;&lt;div class=&quot;dsd-title&quot; style=&quot;margin: 0px 0px 25px; padding: 0px 0px 10px; border-bottom: 2px solid rgb(223, 32, 37); font-size: 25px; line-height: 35px; text-transform: uppercase; color: rgb(0, 0, 0);&quot;&gt;&lt;h3 style=&quot;line-height: 35px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 25px; padding: 0px;&quot;&gt;&lt;br&gt;&lt;/h3&gt;&lt;h3 style=&quot;line-height: 35px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 25px; padding: 0px;&quot;&gt;HƯỚNG DẪN SỬ DỤNG&lt;/h3&gt;&lt;/div&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;div class=&quot;desc&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;iframe allowfullscreen=&quot;allowfullscreen&quot; frameborder=&quot;0&quot; height=&quot;500&quot; src=&quot;https://www.youtube.com/embed/E4PB3GgBFkk&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;div class=&quot;tag&quot; style=&quot;margin: 0px; padding: 10px 0px; line-height: 24px; color: rgb(102, 102, 102); position: relative;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/li&gt;&lt;/ul&gt;', '', 'Máy hút chân không công nghiệp MAGIC AIR MZ-260A', '', '', NULL),
(42, 3, 'MÁY CHẠY BỘ KINGSPORT BK-2032 ĐA NĂNG', '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px; text-align: center;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-2032&amp;nbsp;ĐA NĂNG&lt;/h3&gt;&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px; text-align: center;&quot;&gt;THIẾT KẾ THỜI THƯỢNG VỚI MÀN HÌNH ẢM ỨNG VÀ KẾT NỐI WIFI!!&lt;/h3&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Khói bụi, ô nhiễm, nắng nóng làm bạn lười ra đường để vận động và luyện tập sức khỏe. Tại sao chúng ta không tìm ngay giải pháp luyện tập ngay tại nhà???&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-2032&amp;nbsp;đa năng cỗ máy luyện tập sức khỏe ngay tại nhà cho bạn dáng chuẩn eo thon, tự tin khoe dáng mỗi ngày. Kiểu dáng tinh tế, thiết kế khỏe khoắn, gọn gàng, bạn có thể gấp gọn bảo quản được mọi không gia nhà như phòng khách, phòng ngủ, ban công, phòng làm việc cho bạn tự do luyện tập mọi lúc mọi nơi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước 1800 6862 hoặc Hotline 0936 211 210 để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-2032&amp;nbsp;đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-2032&amp;nbsp;ĐA NĂNG:&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế thời thượng, kiểu dáng hiện đại dễ dàng gấp gọn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;5.0&amp;nbsp;HP&lt;/span&gt;&amp;nbsp;vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ&lt;span style=&quot;font-weight: 700;&quot;&gt;&amp;nbsp;1-22km.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Diện tích vùng chạy siêu rộng&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;138x56cm&lt;/span&gt;&amp;nbsp;cho phép người tập thoải mái mà không lo trượt khỏi vùng chạy. Chế độ nâng dốc tự động đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;20%&lt;/span&gt;&amp;nbsp;giúp bạn dễ dàng thao tác các bài tập trên mọi địa hình phức tạp.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Hệ thống tra dầu tự động giúp tăng độ trơn mượt của băng chạy, giảm thiểu tiếng ồn và tăng cường tuổi thọ của băng thảm giúp quá trình tập diễn ra tốt hơn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Điểm nổi bật của dòng máy BK-2032&amp;nbsp;đa chính là hệ thống GIẢI TRÍ&amp;nbsp;&amp;nbsp;đẳng cấp, nghe nhạc mp3&amp;nbsp; với loa Hifi mang lại âm thanh trung thực và sống động nhất,&amp;nbsp; kết nối wifi cực nhanh, màn hình cảm ứng trơn tru dễ thao tác.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Có chế độ tập luyên chuyên biệt theo dõi sức khỏe đên từng bước chân&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;may_chay_bo_kingsport_bk-2032_3&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may_chay_bo_kingsport_bk-2032_3.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 869px;&quot;&gt;&lt;img alt=&quot;may_chay_bo_kingsport_bk-2032_2&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/may_chay_bo_kingsport_bk-2032_2.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 869px;&quot;&gt;&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;KHUNG SƯỜN CHẮC CHẮN CÙNG CÔNG NGHỆ TẢN LỰC HIỆN ĐẠI&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;150kg, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa, cùng hệ thống giảm sốc bằng túi hơi cảm biến điện tử giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;TẬP LUYỆN VỚI NHIỀU BÀI TẬP KHÁC NHAU&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;BK-2032&amp;nbsp;là máy chạy bộ đa năng, ngoài công dụng chính là đi bộ chạy bộ máy còn tích hợp chức năng bổ trợ:&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thanh gập bụng: thực hiện bài tập cơ bụng săn chắc.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Cặp tạ tay giúp bạn có bắp tay thon gọn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Đĩa xoay eo khởi động chống căng cơ khi chạy.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Đai massage: giảm mỡ bụng, eo, mông, đùi… hoặc giúp cơ bắp thư giãn sau khi luyện tập.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-2032&amp;nbsp;đa năng&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-2032 đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giản cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi. Sở hữu những tính năng và công nghệ mới hiện nay, vừa chạy bộ, vừa nghe nhạc giúp tăng cường sức khoẻ, giúp cả nhà phòng tránh những mệt mỏi, căng thẳng để học tập và làm việc tốt hơn.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT cho khách hàng&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;CẢM NHẬN KHÁCH HÀNG&lt;/h3&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Anh Phạm Trung Hậu (31 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Nói về chiếc máy này tôi chỉ có thể nói là tuyệt, mua cũng được gần 1 năm rồi nhưng máy chạy rất êm, điều tôi thích nhất ở đây là nó có thể&amp;nbsp; gấp gọn và dễ dàng duy chuyển đến mọi nơi, tập bất cứ đâu cũng được thật tiện lợi.&lt;/p&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li value=&quot;2&quot; style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Chị Đào Thúy An (27 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thật ra tôi mua chiếc máy này để ông xã tôi có thể luyện tập sức khỏe, nhưng khi tìm hiểu và sử dụng thì đúng thật là chiếc máy đa năng, gia đình tôi ai&amp;nbsp; ai cũng dùng được, thật đáng tiền khi mua chiếc máy này về cho cả gia đình.&lt;/p&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li value=&quot;3&quot; style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Anh Trần Minh Luân ( 39 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Sức khỏe là điều mà tôi chú trọng mỗi ngày, đầu tư cho sức khỏe là quyết định đúng đắn, sau 2 tháng sử dụng chiếc máy chạy bộ này điều đầu tiên tôi cảm nhận được chính là cơ thể tôi săn chắc hơn, khỏe hơn và tinh thần phấn chấn hơn, tôi rất hài lòng về chiếc máy này.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;ul&gt;\r\n&lt;/ul&gt;\r\n', '', 'MÁY CHẠY BỘ KINGSPORT BK-2032 ĐA NĂNG THIẾT KẾ THỜI THƯỢNG VỚI MÀN HÌNH ẢM ỨNG VÀ KẾT NỐI WIFI!!', '', '', NULL),
(30, 2, 'Xe đạp thể thao Kingsport XD16', '&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;Nếu bạn đang cần một chiếc xe đạp thể thao ngoài trời sử dụng cho nhu cầu đi làm, đi học, hoặc vận động tập thể dục toàn thân mỗi ngày với chất lượng cao và lâu dài thì Xe đạp thể thao Kingsport chính là sự lựa chọn tuyệt vời dành cho bạn.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;Thuộc dòng xe đạp thể thao đa năng từ Tập Đoàn Kingsport, sản phẩm&amp;nbsp;được thiết kế dựa trên những nhu cầu đi lại, tập luyện cơ bản phổ biến cho người dân Việt Nam.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma;&quot;&gt;Với thiết kế đơn giản, nhưng không kém phần tinh tế, thanh lịch, tốc độ vừa phải với tính ổn định và cân bằng cao, xe mang tính ứng dụng cao cho tất cả mọi người từ&amp;nbsp;học sinh, sinh viên, anh chị em công sở, người lớn tuổi&amp;nbsp;có nhu cầu thích đi xe đạp hay&amp;nbsp;đơn giản hơn nữa là thay đổi&amp;nbsp;“vị” trải nghiệm 1&amp;nbsp;cảm giác hoàn toàn mới -&amp;nbsp;vi vu trên phố phường&amp;nbsp;nhưng không nhàm chán.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; font-size: 14px; line-height: 18px; padding: 5px 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; text-align: center;&quot;&gt;&lt;img alt=&quot;xe_dap_dia_hinh_XD16&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/xe_dap/xe_dap_ngoai_troi/xe_dap_dia_hinh_XD16.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 869px;&quot;&gt;&lt;/p&gt;\r\n', '', 'Xe đạp thể thao Kingsport XD16', '', '', NULL),
(52, 2, 'Máy Chạy Bộ Kingsport BK-2034 Đơn Năng', '&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px; text-align: center;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-2034&amp;nbsp;&lt;/h3&gt;&lt;h3 style=&quot;font-family: Arial, Tahoma; font-weight: bold; line-height: 34px; color: rgb(51, 51, 51); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px; text-align: center;&quot;&gt;THIẾT KẾ THỜI THƯỢNG MÊ HOẶC MỌI ÁNH NHÌN!!!&lt;/h3&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Khói bụi, ô nhiễm, nắng nóng làm bạn lười ra đường để vận động và luyện tập sức khỏe. Tại sao chúng ta không tìm ngay giải pháp luyện tập ngay tại nhà???&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-2034&amp;nbsp; cỗ máy luyện tập sức khỏe ngay tại nhà cho bạn dáng chuẩn eo thon, tự tin khoe dáng mỗi ngày. Kiểu dáng tinh tế, thiết kế khỏe khoắn, gọn gàng, bạn có thể gấp gọn bảo quản được mọi không gia nhà như phòng khách, phòng ngủ, ban công, phòng làm việc cho bạn tự do luyện tập mọi lúc mọi nơi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước 1800 6862 hoặc Hotline 0936 211 210 để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-2034 &amp;nbsp;để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-2034 ĐƠN&amp;nbsp;NĂNG:&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế thời thượng, kiểu dáng hiện đại dễ dàng gấp gọn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.5 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Diện tích vùng chạy siêu rộng 135x52cm cho phép người tập thoải mái mà không lo trượt khỏi vùng chạy. Chế độ nâng dốc tự động đến 15% giúp bạn dễ dàng thao tác các bài tập trên mọi địa hình phức tạp.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Hệ thống tra dầu tự động giúp tăng độ trơn mượt của băng chạy, giảm thiểu tiếng ồn và tăng cường tuổi thọ của băng thảm giúp quá trình tập diễn ra tốt hơn&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Điểm nổi bật của dòng máy BK-2034 chính là hệ thống âm thanh đẳng cấp, nghe nhạc mp3&amp;nbsp; với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;maychaybo_bk2034&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/maychaybo_bk2034.jpg&quot; style=&quot;max-width: 100%; width: 639px; height: 640px;&quot;&gt;&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;KHUNG SƯỜN CHẮC CHẮN CÙNG CÔNG NGHỆ TẢN LỰC HIỆN ĐẠI&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;150kg, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa, cùng hệ thống giảm sốc bằng túi hơi cảm biến điện tử giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-2034&amp;nbsp;&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-2034 giúp bạn đốt cháy năng lượng, giảm cân, thư giản cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi. Sở hữu những tính năng và công nghệ mới hiện nay, vừa chạy bộ, vừa nghe nhạc giúp tăng cường sức khoẻ, giúp cả nhà phòng tránh những mệt mỏi, căng thẳng để học tập và làm việc tốt hơn.&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT cho khách hàng&lt;/p&gt;&lt;h3 style=&quot;font-weight: bold; line-height: 34px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; padding: 0px;&quot;&gt;CẢM NHẬN KHÁCH HÀNG&lt;/h3&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Anh Phạm Trung Hậu (31 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Nói về chiếc máy này tôi chỉ có thể nói là tuyệt, mua cũng được gần 1 năm rồi nhưng máy chạy rất êm, điều tôi thích nhất ở đây là nó có thể&amp;nbsp; gấp gọn và dễ dàng duy chuyển đến mọi nơi, tập bất cứ đâu cũng được thật tiện lợi.&lt;/p&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li value=&quot;2&quot; style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Chị Đào Thúy An (27 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thật ra tôi mua chiếc máy này để ông xã tôi có thể luyện tập sức khỏe, nhưng khi tìm hiểu và sử dụng thì đúng thật là chiếc máy đa năng, gia đình tôi ai&amp;nbsp; ai cũng dùng được, thật đáng tiền khi mua chiếc máy này về cho cả gia đình.&lt;/p&gt;&lt;ol style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 10px; padding: 0px 0px 0px 10px; list-style-position: initial; list-style-image: initial;&quot;&gt;&lt;li value=&quot;3&quot; style=&quot;margin: 0px 0px 0px 30px; padding: 0px; line-height: 20px; font-size: 13px;&quot;&gt;Anh Trần Minh Luân ( 39 tuổi)&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Sức khỏe là điều mà tôi chú trọng mỗi ngày, đầu tư cho sức khỏe là quyết định đúng đắn, sau 2 tháng sử dụng chiếc máy chạy bộ này điều đầu tiên tôi cảm nhận được chính là cơ thể tôi săn chắc hơn, khỏe hơn và tinh thần phấn chấn hơn, tôi rất hài lòng về chiếc máy này.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;', '', 'Máy Chạy Bộ Kingsport BK-2034 Đơn Năng', '', '', NULL),
(55, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', ''),
(56, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', '');
INSERT INTO `ks_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `video`) VALUES
(57, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', ''),
(58, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', ''),
(59, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', ''),
(60, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', ''),
(61, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', ''),
(62, 2, 'MÁY CHẠY BỘ KINGSPORT BK-5000NEW ĐA NĂNG', '&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;center&quot; style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Máy chạy bộ Kingsport BK-5000 New được ứng dụng những cải biến công nghệ hiện đại nhất hiện nay từ các chuyên gia Hoa Kỳ. Kiểu dáng hiện đại, dễ gấp gọn phù hợp cho các gia đình và căn hộ chung cư, giúp bạn thoải mại luyện tập mà không sợ bị giới hạn bởi diện tích. Chỉ với 20 phút mỗi ngày cùng máy chạy bộ BK-5000 New sẽ mang lại cho bạn một vóc dáng thon gọn mơ ước&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Quý khách hàng liên hệ ngay tổng đài miễn cước&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;1800 6862&lt;/span&gt;&lt;/span&gt;&amp;nbsp;hoặc Hotline&amp;nbsp;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;color: rgb(255, 0, 0);&quot;&gt;0936 211 210&lt;/span&gt;&lt;/span&gt;&amp;nbsp;để được tư vấn và mua hàng với giá tốt nhất. Mua ngay máy chạy bộ Kingsport BK-5000 new đa để có vóc dáng mơ ước nhé!&lt;/p&gt;&lt;div class=&quot;clear&quot; style=&quot;margin: 0px; padding: 0px; clear: both; overflow: hidden; visibility: hidden; width: 0px; height: 0px; font-size: 0px; line-height: 0;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_01&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_01.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 731px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;ds-detail&quot; style=&quot;margin: 0px 0px 30px; padding: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma; font-size: 14px;&quot;&gt;&lt;div class=&quot;dsd-content&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ĐẶC ĐIỂM NỔI BẬT CỦA MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Khung sườn chắc chắn – động cơ mạnh mẽ - Giảm xóc êm ái&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Thiết kế tinh tế, kiểu dáng hiện đại dễ dàng gấp gọn, khung sườn chắc chắn chịu tải trọng cao lên đến&amp;nbsp;&lt;span style=&quot;font-weight: 700;&quot;&gt;150kg&lt;/span&gt;, sơn tĩnh điện sang trọng đảm bảo máy hoạt động tốt và không bị oxy hóa.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Động cơ 4.0 HP vô cùng mạnh mẽ giúp bạn chinh phục mọi bài tập, tốc độ máy chạy bộ dao động từ 1-18km giúp cho máy vận hành êm ái.&lt;/p&gt;&lt;/div&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_03&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_03.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 762px;&quot;&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Màn hình hiển thị thông minh&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Màn hình LCD hiển thị&amp;nbsp; đầy đủ các thông số: Thời gian, quãng đường, nhịp tim, calo tiêu thụ, chương trình luyện tập…giúp bạn kiểm soát dễ dàng các thông số này trong quá trình luyện tập.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Hệ thống âm thanh nghe nhạc mp3 kết hợp Bluetooth với loa Hifi mang lại âm thanh trung thực và sống động nhất.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; text-align: center;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_05&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_05.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 764px;&quot;&gt;&lt;/div&gt;&lt;div class=&quot;style-prod3&quot; style=&quot;margin: 0px; padding: 10px; background: rgb(241, 241, 241); color: rgb(102, 102, 102);&quot;&gt;&lt;div class=&quot;spw-text&quot; style=&quot;margin: 0px; padding: 30px;&quot;&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Tập luyện đa năng hơn với BK-5000 new&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Ngoài ra, máy chạy bộ Kingsport BK-5000 New đa năng còn tích hợp thêm nhiều động tác như gập bụng, massage eo, tập tạ tay giúp bạn giảm cân nhanh chóng, lấy lại vóc dáng thon gọn và thân hình săn chắc hơn mỗi ngày&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_07&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_07.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 753px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Lợi ích luyện tập với máy chạy bộ BK-5000 New đa năng&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;Luyện tập thường xuyên với máy tập chạy bộ BK-5000 New đa năng giúp bạn đốt cháy năng lượng, giảm cân, thư giãn cơ bắp và tinh thần thoải mái hơn. Giảm căng thẳng mệt mỏi, lấy lại thân hình thon gọn, vóc dáng hoàn hảo như mong đợi.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;loiich&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/loiich.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 596px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;BK-5000-NEW_09&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/BK-5000-NEW_09.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 663px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;Chính sách ưu đãi và hậu mãi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;KingSport luôn đặt tâm huyết mang đến những sản phẩm chất lượng, tinh tế cùng với chế độ hậu mãi bán hàng và bảo hành TỐT NHẤT cho khách hàng&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; line-height: 18px; padding: 5px 0px;&quot;&gt;&lt;img alt=&quot;hau_mai_6&quot; src=&quot;https://www.kingsport.vn/vnt_upload/product/maychaybo/hau_mai_6.jpg&quot; style=&quot;max-width: 100%; width: 869px; height: 622px;&quot;&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '', 'MÁY CHẠY BỘ KINGSPORT BK-5000 NEW ĐA NĂNG  MANG ĐẾN NGUỒN NĂNG LƯỢNG MỚI CHO MỌI NHÀ', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_discount`
--

CREATE TABLE `ks_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_discount`
--

INSERT INTO `ks_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(469, 30, 1, 0, 0, '2600000.0000', '2019-06-24', '2020-12-31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_filter`
--

CREATE TABLE `ks_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_gift`
--

CREATE TABLE `ks_product_gift` (
  `product_gift_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `content` text NOT NULL,
  `description` text NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_gift`
--

INSERT INTO `ks_product_gift` (`product_gift_id`, `product_id`, `customer_group_id`, `priority`, `price`, `content`, `description`, `date_start`, `date_end`) VALUES
(460, 42, 1, 1, '90.0000', '', '', '0000-00-00', '0000-00-00'),
(459, 30, 1, 2, '90.0000', '', '', '0000-00-00', '0000-00-00'),
(458, 30, 1, 1, '80.0000', '', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_image`
--

CREATE TABLE `ks_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_image`
--

INSERT INTO `ks_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2420, 52, 'catalog/maychaybo_bk2034.jpg', 0),
(2427, 59, 'catalog/Avatar.jpg', 1),
(2428, 60, 'catalog/Avatar.jpg', 1),
(2429, 61, 'catalog/Avatar.jpg', 1),
(2430, 62, 'catalog/Avatar.jpg', 1),
(2422, 54, 'catalog/2029.jpg', 0),
(2423, 55, 'catalog/Avatar.jpg', 1),
(2424, 56, 'catalog/Avatar.jpg', 1),
(2425, 57, 'catalog/Avatar.jpg', 1),
(2418, 30, 'catalog/xe_dap_dia_hinh_XD16.jpg', 0),
(2421, 51, 'catalog/1_10.jpg', 0),
(2426, 58, 'catalog/Avatar.jpg', 1),
(2414, 50, 'catalog/Ava_MZ260.jpg', 0),
(2411, 42, 'catalog/may_chay_bo_kingsport_bk-2032_1.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_included`
--

CREATE TABLE `ks_product_included` (
  `product_id` int(11) NOT NULL,
  `included_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_included`
--

INSERT INTO `ks_product_included` (`product_id`, `included_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41),
(51, 62),
(62, 51);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_option`
--

CREATE TABLE `ks_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_option_value`
--

CREATE TABLE `ks_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_recurring`
--

CREATE TABLE `ks_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_recurring`
--

INSERT INTO `ks_product_recurring` (`product_id`, `recurring_id`, `customer_group_id`) VALUES
(42, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_related`
--

CREATE TABLE `ks_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_related`
--

INSERT INTO `ks_product_related` (`product_id`, `related_id`) VALUES
(42, 54),
(42, 55),
(42, 56),
(42, 57),
(42, 58),
(42, 59),
(42, 60),
(42, 61),
(42, 62),
(52, 54),
(52, 55),
(52, 56),
(52, 57),
(52, 58),
(52, 59),
(52, 60),
(52, 61),
(52, 62),
(54, 42),
(54, 52),
(54, 54),
(54, 55),
(54, 56),
(54, 57),
(54, 58),
(54, 59),
(54, 60),
(54, 61),
(54, 62),
(55, 42),
(55, 52),
(55, 54),
(56, 42),
(56, 52),
(56, 54),
(57, 42),
(57, 52),
(57, 54),
(58, 42),
(58, 52),
(58, 54),
(59, 42),
(59, 52),
(59, 54),
(60, 42),
(60, 52),
(60, 54),
(61, 42),
(61, 52),
(61, 54),
(62, 42),
(62, 52),
(62, 54);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_reward`
--

CREATE TABLE `ks_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_reward`
--

INSERT INTO `ks_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(563, 30, 1, 200);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_special`
--

CREATE TABLE `ks_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_special`
--

INSERT INTO `ks_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(468, 55, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(466, 30, 1, 0, '2600000.0000', '2019-06-24', '2019-12-31'),
(467, 54, 1, 0, '7500000.0000', '2019-06-24', '2020-12-31'),
(469, 56, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(470, 57, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(471, 58, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(472, 59, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(473, 60, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(474, 61, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06'),
(475, 62, 1, 0, '14200000.0000', '2019-06-26', '2019-07-06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_to_category`
--

CREATE TABLE `ks_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_to_category`
--

INSERT INTO `ks_product_to_category` (`product_id`, `category_id`) VALUES
(30, 25),
(30, 36),
(42, 20),
(42, 27),
(50, 123),
(51, 124),
(51, 125),
(51, 130),
(52, 20),
(52, 27),
(54, 20),
(54, 26),
(55, 20),
(55, 27),
(56, 20),
(56, 27),
(57, 20),
(57, 27),
(58, 20),
(58, 27),
(59, 20),
(59, 27),
(60, 20),
(60, 27),
(61, 20),
(61, 27),
(62, 20),
(62, 27);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_to_download`
--

CREATE TABLE `ks_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_to_layout`
--

CREATE TABLE `ks_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_to_layout`
--

INSERT INTO `ks_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(42, 0, 0),
(30, 0, 0),
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(62, 0, 0),
(54, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_product_to_store`
--

CREATE TABLE `ks_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_product_to_store`
--

INSERT INTO `ks_product_to_store` (`product_id`, `store_id`) VALUES
(30, 0),
(42, 0),
(50, 0),
(51, 0),
(52, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_recurring`
--

CREATE TABLE `ks_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_recurring`
--

INSERT INTO `ks_recurring` (`recurring_id`, `price`, `frequency`, `duration`, `cycle`, `trial_status`, `trial_price`, `trial_frequency`, `trial_duration`, `trial_cycle`, `status`, `sort_order`) VALUES
(1, '12000.0000', 'week', 2, 1, 0, '0.0000', 'day', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_recurring_description`
--

CREATE TABLE `ks_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_recurring_description`
--

INSERT INTO `ks_recurring_description` (`recurring_id`, `language_id`, `name`) VALUES
(1, 2, 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_return`
--

CREATE TABLE `ks_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_return_action`
--

CREATE TABLE `ks_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_return_action`
--

INSERT INTO `ks_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent'),
(1, 3, 'Refunded'),
(2, 3, 'Credit Issued'),
(3, 3, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_return_history`
--

CREATE TABLE `ks_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_return_reason`
--

CREATE TABLE `ks_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_return_reason`
--

INSERT INTO `ks_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details'),
(1, 3, 'Dead On Arrival'),
(2, 3, 'Received Wrong Item'),
(3, 3, 'Order Error'),
(4, 3, 'Faulty, please supply details'),
(5, 3, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_return_status`
--

CREATE TABLE `ks_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_return_status`
--

INSERT INTO `ks_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products'),
(1, 3, 'Pending'),
(3, 3, 'Complete'),
(2, 3, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_review`
--

CREATE TABLE `ks_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_review`
--

INSERT INTO `ks_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 42, 0, 'Toan Vu Anh', 'Cho tôi một cái máy chạy bộ nhá bảo nhiêu hả', 3, 1, '2019-06-23 00:00:00', '2019-06-23 21:55:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_seo_url`
--

CREATE TABLE `ks_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_session`
--

CREATE TABLE `ks_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_session`
--

INSERT INTO `ks_session` (`session_id`, `data`, `expire`) VALUES
('005a05443a8c13e857bc82ff2a', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 09:24:00'),
('06be8dd23fa3a38f8cc31b2e4e', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:48'),
('0a7b60a7d18b38d14cc0edffca', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-24 02:23:14'),
('0e05695d2ff26023979f5a2805', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:47'),
('16cc8aa9f9f69d3fcb0ba64e7e', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:47'),
('1f9c2f1d6be2366a9e9b08c2b7', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:46'),
('224b202b328389a87015900a80', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-27 00:23:41'),
('37dd43a03e35ea9aa15e12af86', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:46'),
('3fc93aed752fba53e81299f1b8', 'false', '2019-06-23 06:29:48'),
('40803efd904af2f88cddb8f1b5', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:48'),
('450eabaaf0c04fd3563694a191', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 15:20:46'),
('469ac2d6bc5f448e08e372f14c', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-24 05:01:54'),
('4cbb1280c2e1553a2ab5717060', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 11:06:04'),
('4f1cd9348d0307710497e94331', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:45'),
('53652349c5b0cebc3cc7173724', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 06:47:13'),
('5efa2b20add17582355a004a83', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:46'),
('5ffe2e56ebbcc7d2d7567d47db', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 22:27:07'),
('6177efc346b50b1b2c818d1945', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 11:31:06'),
('63e3292c8d4d19247582f00788', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 08:51:35'),
('6418c52d55913533a0633ff20f', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 08:51:12'),
('66084cf847e42201daa32cf7d4', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 13:03:18'),
('69e610b5c98dd841bfccadb2dd', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 10:25:41'),
('6af0fcf447ec5f4e12b903ec19', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:48'),
('6db08aaa542b3d366c85467e9b', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 22:33:10'),
('793a637f56382632189eac2445', 'false', '2019-06-26 04:07:04'),
('7995d2e8729f1eaa3173fea4ed', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"vRfPwQM93cRVeMHlTpTxavmo38sHV1Jo\"}', '2019-06-22 16:21:05'),
('7a378c1c30ef6118d1143b7fe5', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-24 01:58:46'),
('7b5b435d9f097a00b837d348c2', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:49'),
('7c998db744be4f6ebf47e4ba9a', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 22:38:21'),
('7e2dcae86cf5efdf664f3f17d3', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"OqR0uCCrH1CzdLOAZwt526OpzqLY98lR\"}', '2019-06-25 10:24:51'),
('8047dc178dde1abd2bcffc3185', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 04:07:05'),
('8629b903b206c12d454e66e52d', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"CGY1e1YrvRJZvWE6njUidoUzxvLNbOrk\",\"wishlist\":[\"30\"]}', '2019-06-26 06:40:08'),
('869ea703f729f1a5445fab469d', 'false', '2019-06-23 08:51:12'),
('8b360e763d89b19efad6075336', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"wishlist\":[\"42\",\"30\",\"40\"]}', '2019-06-20 14:23:51'),
('8d2e60a05e88c5575e877da0ea', 'false', '2019-06-23 06:29:49'),
('8d8b2a6d878de7603241a37259', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 01:08:35'),
('8e3c8ec29db413d758b0a9968e', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 15:00:45'),
('91fca5905b91a4e80cbd22dd9b', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 15:00:36'),
('943049d03dde89a8bd99d94cca', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:47'),
('95ed699a519c3dd120b7f3e68b', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:46'),
('978b1891debb8c2c620c96a0c8', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:44'),
('9c207d2439edf9df4ab6b0398a', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 08:57:00'),
('9e2177bba5b677e25f0a7a0d22', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 10:35:51'),
('9fcae9e6c6795051f257b94bc8', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"agXHZL5IpglWnIZRfrvOh0EZvc1xHHYU\",\"wishlist\":[\"40\",\"42\",\"30\",\"43\"],\"account\":\"guest\",\"guest\":{\"customer_group_id\":\"1\",\"firstname\":\"duc\",\"lastname\":\"nguyen thanh\",\"email\":\"thducuit@gmail.com\",\"telephone\":\"0932676897\",\"custom_field\":[],\"shipping_address\":\"1\"},\"payment_address\":{\"firstname\":\"duc\",\"lastname\":\"nguyen thanh\",\"company\":\"\",\"address_1\":\"10 quach van tuan\",\"address_2\":\"quach\",\"postcode\":\"0999\",\"city\":\"tcm\",\"country_id\":\"230\",\"zone_id\":\"3780\",\"country\":\"Viet Nam\",\"iso_code_2\":\"VN\",\"iso_code_3\":\"VNM\",\"address_format\":\"\",\"custom_field\":[],\"zone\":\"Ho Chi Minh City\",\"zone_code\":\"HC\"},\"shipping_address\":{\"firstname\":\"duc\",\"lastname\":\"nguyen thanh\",\"company\":\"\",\"address_1\":\"10 quach van tuan\",\"address_2\":\"quach\",\"postcode\":\"0999\",\"city\":\"tcm\",\"country_id\":\"230\",\"zone_id\":\"3780\",\"country\":\"Viet Nam\",\"iso_code_2\":\"VN\",\"iso_code_3\":\"VNM\",\"address_format\":\"\",\"zone\":\"Ho Chi Minh City\",\"zone_code\":\"HC\",\"custom_field\":[]},\"comment\":\"\",\"order_id\":2,\"shipping_methods\":{\"flat\":{\"title\":\"Flat Rate\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"Flat Shipping Rate\",\"cost\":\"5.00\",\"tax_class_id\":\"9\",\"text\":\"5\\u0111\"}},\"sort_order\":\"1\",\"error\":false}},\"shipping_method\":{\"code\":\"flat.flat\",\"title\":\"Flat Shipping Rate\",\"cost\":\"5.00\",\"tax_class_id\":\"9\",\"text\":\"5\\u0111\"},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"Cash On Delivery\",\"terms\":\"\",\"sort_order\":\"5\"}},\"payment_method\":{\"code\":\"cod\",\"title\":\"Cash On Delivery\",\"terms\":\"\",\"sort_order\":\"5\"},\"compare\":[\"30\",\"31\"],\"install\":\"PzEUyVcUAc\"}', '2019-06-19 15:53:28'),
('a110957ae39f455041ebec7f6a', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 02:28:10'),
('a30304c857c1cb9e2282653580', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"P4P8BeUGzAiikLOjUCsS6gE2OODWEqDa\"}', '2019-06-26 10:57:51'),
('a7ebeaf0b72d4066c60f019f44', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:49'),
('a8aa038935e6d664b19b46f2a2', 'false', '2019-06-23 06:29:47'),
('a9f14911af1902d53fdabcfeb5', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-24 05:02:34'),
('ac768a058f09b28354cf9a26e3', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-24 05:32:32'),
('ad71cecc966a245a24aec2bd87', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:46'),
('b03b12290afde41cae66cbe50b', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 14:29:56'),
('b09c0158a1e23bc6cc0b9c5007', '{\"api_id\":\"1\"}', '2019-05-25 10:14:18'),
('b0d0a299873373601502140139', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"CWnkNS2LftYsAwjE8T46oH27Bw9Lu7Dq\",\"install\":\"L0mGOq8kQw\"}', '2019-06-26 10:35:13'),
('b54a138150ec139b34ba93ff75', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:50'),
('b748612d8881aca3e5765d8882', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"BXmAADsNJ4eSUIoGZnalc6dA03ZsKaah\"}', '2019-06-25 10:55:03'),
('bffa404ba5530b264b568e7013', '{\"api_id\":\"1\"}', '2019-05-25 10:14:00'),
('c27c11a5dd825dcb1fa64e281e', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 10:25:00'),
('c36db0b4d56b34eaa96f7f6bdc', 'false', '2019-06-23 06:29:49'),
('c8469508d4da341ffe74597856', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:48'),
('cbbfa826481efe274ee981c19f', '{\"language\":\"vi-vn\",\"currency\":\"VND\",\"user_id\":\"1\",\"user_token\":\"gnGZcun0XPMlvhw8wz1ZgYS6NyZQkqE2\"}', '2019-06-23 10:00:56'),
('d144102137b1f516408bf6b27b', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 08:50:05'),
('d481aa60a32ad8e14fd4f508cf', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 23:37:06'),
('d5e18fcce8553189df5cb08cc6', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 14:19:29'),
('d6de2d5c608b49cd21e2ab3bad', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-24 04:38:44'),
('e0a94d0a6f97ace98c7e4c1b7e', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:44'),
('e36f83be2250dd4cd1d3220f76', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:50'),
('e70aea4ded098ad7c9d2f6e788', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-26 08:39:50'),
('e9baab603450956be466667c66', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 15:15:31'),
('f06f3b741f77b29d9c3ac2642e', 'false', '2019-06-25 15:35:04'),
('f10dade1b124a2f5e1336a51bd', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 15:35:05'),
('f1cf1104180c59c5e4a8d31035', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 22:25:15'),
('f56095b1b7b9b115e21170fad5', '{\"api_id\":\"1\"}', '2019-05-26 06:50:39'),
('f691c412a3fad31b94c6688c74', '{\"user_id\":\"1\",\"user_token\":\"1DFHLNlxn3sJIPxDa1cVk43bCTCEUhGo\",\"language\":\"vi-vn\",\"currency\":\"VND\",\"wishlist\":[\"52\"]}', '2019-06-26 08:53:12'),
('f71ebad2b6287f3c3caae9f47a', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 15:20:33'),
('f781f3d2b2e7892dd1a542e86e', '{\"api_id\":\"1\",\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-05-25 10:14:04'),
('fb218317b98353cbbbdac931a4', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 23:40:27'),
('fc53ee8ca24f14ac2885dc052b', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 09:02:21'),
('ffe2c9c014669f76ec001fd27c', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-23 06:29:47'),
('fffd3570817f684903c1d8a55e', '{\"language\":\"vi-vn\",\"currency\":\"VND\"}', '2019-06-25 14:58:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_setting`
--

CREATE TABLE `ks_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_setting`
--

INSERT INTO `ks_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(971, 0, 'theme_kingsport', 'theme_kingsport_image_location_width', '268', 0),
(1254, 0, 'config', 'config_error_filename', 'error.log', 0),
(1253, 0, 'config', 'config_error_log', '1', 0),
(1252, 0, 'config', 'config_error_display', '1', 0),
(1251, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(4, 0, 'voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'total_voucher_status', '1', 0),
(1249, 0, 'config', 'config_file_max_size', '300000', 0),
(1250, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(556, 0, 'module_filter', 'module_filter_status', '0', 0),
(1257, 0, 'feed_openbaypro', 'feed_openbaypro_language', 'en_GB', 0),
(1244, 0, 'config', 'config_compression', '0', 0),
(1245, 0, 'config', 'config_secure', '0', 0),
(1246, 0, 'config', 'config_password', '1', 0),
(1247, 0, 'config', 'config_shared', '0', 0),
(1248, 0, 'config', 'config_encryption', 'ihgM4nVkI7UAprMxdkPh6J6zPFEroQtjKpU21r8EM0HZYBNpa96g6ghmhqDfFBztTTC93zK555ENdKIobZowPaRZE3MZdD4mmSbj8o0O0jayS46BBwQcHCfwWl7i3A4tRTJpnteYWikZA0kAGtgEijzqZzJlpyqQf2nZ6PVV53DLP2fnKRgsG6pckosRHqEpayVbiDEW5j4b4jBTmyrk5t4yuvEYqnFDRDl1xhbPWJM1npYUveorM6vA2ZnC6XIUzuaOkC9sTDyxO0uFny3d6Jag7tQ1iqt1ehr4v3411RaxaRLjUEXvi9hjthzcnrdXz9ujmb87ZdLF6D4eCY1UNPyRvtZRBRTIz7hiqbFvukOSqys319hyOLtnon6ajXx7VGbgYV4W3WkCcQE1RUJi9yVqyEnpre94gwmH0R6TOZE5sWAOhe4wGGVKHlVP4fTGb0LaWehPUVDx1rKPkzAHgWAQNJaKSrDNsMlFIdciiwJWNhMWWzT4Hui3zoJVjlpWRywyXeb2zaGiimFhekJEIZvm4PxiYRzkr5tywaaVjeM3ZhAQhT4Iv7zOBmgtHgL8z5sVzgXZkis6LLzh8jJ1RyraMeWi3HZM29cnBY6va7u1XXV1TBi8m1yYeEwUSSIEc2ywm8m326JzVxlk3XKZHmGMJdlQxwHmYoPRumsXoQqxSJ1Ib5AxO4t5NecGAGwywPirp8rcHLzImFtf0m9Q5KTvZzP7DKTxGZyGsL2VNXC8LpPcHUVGpQQlUqf7Hm9f3iDvgJo6lKV5r1mnsjreVq3unN6l29h1mnAd76op648FFS3YikZsmkG6aZnj3LazDipsFg5ir0aUYxOKwbZWaCG9SP8Kph41szXA0qoGG31No7F7OcstJjU28TSNNp3jlHtulDaC2zsVnkKKeMWwR2VvpYGVofQD5YPsc1QB22rTWQ0O97UbTSZoLOQbO6c7Gvc5ulBIi8gT2akDWpibFPOGNGSspRn8Wg8QgeSStphbiVjJi6sxuI47Q9d2MMw6', 0),
(1243, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(1242, 0, 'config', 'config_seo_url', '0', 0),
(1241, 0, 'config', 'config_maintenance', '0', 0),
(1240, 0, 'config', 'config_mail_alert_email', '', 0),
(1239, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(1238, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1237, 0, 'config', 'config_mail_smtp_port', '25', 0),
(1236, 0, 'config', 'config_mail_smtp_password', '', 0),
(1235, 0, 'config', 'config_mail_smtp_username', '', 0),
(1234, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(1233, 0, 'config', 'config_mail_parameter', '', 0),
(1231, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(1232, 0, 'config', 'config_mail_engine', 'mail', 0),
(1230, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(1229, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(1228, 0, 'config', 'config_captcha', '', 0),
(1227, 0, 'config', 'config_return_status_id', '2', 0),
(1226, 0, 'config', 'config_return_id', '0', 0),
(1225, 0, 'config', 'config_affiliate_id', '0', 0),
(1223, 0, 'config', 'config_affiliate_auto', '0', 0),
(1224, 0, 'config', 'config_affiliate_commission', '5', 0),
(1222, 0, 'config', 'config_affiliate_approval', '0', 0),
(1221, 0, 'config', 'config_affiliate_group_id', '1', 0),
(1220, 0, 'config', 'config_stock_checkout', '0', 0),
(1219, 0, 'config', 'config_stock_warning', '0', 0),
(1218, 0, 'config', 'config_stock_display', '0', 0),
(1217, 0, 'config', 'config_api_id', '1', 0),
(1216, 0, 'config', 'config_fraud_status_id', '7', 0),
(1215, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(1214, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(555, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(554, 0, 'shipping_flat', 'shipping_flat_status', '0', 0),
(553, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(552, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(551, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '1', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(123, 0, 'module_category', 'module_category_status', '1', 0),
(124, 0, 'module_account', 'module_account_status', '1', 0),
(993, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(992, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(991, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(990, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(989, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(988, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(987, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(986, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(985, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(984, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(983, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(982, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(981, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(980, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(979, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(978, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(977, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(976, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(975, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(974, 0, 'theme_default', 'theme_default_status', '0', 0),
(973, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(149, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(151, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(153, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(155, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(157, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(158, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(165, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(167, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(168, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(171, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(199, 0, 'developer', 'developer_theme', '1', 0),
(200, 0, 'developer', 'developer_sass', '1', 0),
(1213, 0, 'config', 'config_order_status_id', '1', 0),
(1212, 0, 'config', 'config_checkout_id', '0', 0),
(1211, 0, 'config', 'config_checkout_guest', '1', 0),
(1210, 0, 'config', 'config_cart_weight', '1', 0),
(1209, 0, 'config', 'config_invoice_prefix', 'INV-2019-00', 0),
(1208, 0, 'config', 'config_account_id', '0', 0),
(1207, 0, 'config', 'config_login_attempts', '5', 0),
(1206, 0, 'config', 'config_customer_price', '0', 0),
(1205, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(1204, 0, 'config', 'config_customer_group_id', '1', 0),
(1203, 0, 'config', 'config_customer_search', '0', 0),
(1200, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1201, 0, 'config', 'config_customer_online', '0', 0),
(1202, 0, 'config', 'config_customer_activity', '0', 0),
(1199, 0, 'config', 'config_tax_default', 'shipping', 0),
(1198, 0, 'config', 'config_tax', '1', 0),
(1197, 0, 'config', 'config_voucher_max', '1000', 0),
(1196, 0, 'config', 'config_voucher_min', '1', 0),
(1195, 0, 'config', 'config_review_guest', '1', 0),
(1194, 0, 'config', 'config_review_status', '1', 0),
(1193, 0, 'config', 'config_limit_admin', '20', 0),
(1192, 0, 'config', 'config_product_count', '1', 0),
(1191, 0, 'config', 'config_weight_class_id', '1', 0),
(1190, 0, 'config', 'config_length_class_id', '1', 0),
(1189, 0, 'config', 'config_currency_auto', '1', 0),
(1188, 0, 'config', 'config_currency', 'VND', 0),
(1187, 0, 'config', 'config_admin_language', 'vi-vn', 0),
(1186, 0, 'config', 'config_language', 'vi-vn', 0),
(1185, 0, 'config', 'config_zone_id', '3780', 0),
(1184, 0, 'config', 'config_country_id', '230', 0),
(1183, 0, 'config', 'config_comment', '', 0),
(1182, 0, 'config', 'config_open', '', 0),
(1181, 0, 'config', 'config_image', '', 0),
(1180, 0, 'config', 'config_fax', '', 0),
(1179, 0, 'config', 'config_telephone', '123456789', 0),
(1178, 0, 'config', 'config_email', 'thducuit@gmail.com', 0),
(1177, 0, 'config', 'config_geocode', '', 0),
(1176, 0, 'config', 'config_address', 'Address 1', 0),
(1175, 0, 'config', 'config_owner', 'Your Name', 0),
(1174, 0, 'config', 'config_name', 'Your Store', 0),
(1173, 0, 'config', 'config_layout_id', '2', 0),
(1172, 0, 'config', 'config_theme', 'kingsport', 0),
(1171, 0, 'config', 'config_meta_keyword', '', 0),
(1170, 0, 'config', 'config_meta_description', 'My Store', 0),
(1256, 0, 'feed_openbaypro', 'feed_openbaypro_status', '1', 0),
(969, 0, 'theme_kingsport', 'theme_kingsport_image_cart_width', '47', 0),
(970, 0, 'theme_kingsport', 'theme_kingsport_image_cart_height', '47', 0),
(968, 0, 'theme_kingsport', 'theme_kingsport_image_wishlist_height', '47', 0),
(966, 0, 'theme_kingsport', 'theme_kingsport_image_compare_height', '90', 0),
(967, 0, 'theme_kingsport', 'theme_kingsport_image_wishlist_width', '47', 0),
(964, 0, 'theme_kingsport', 'theme_kingsport_image_related_height', '80', 0),
(965, 0, 'theme_kingsport', 'theme_kingsport_image_compare_width', '90', 0),
(963, 0, 'theme_kingsport', 'theme_kingsport_image_related_width', '80', 0),
(962, 0, 'theme_kingsport', 'theme_kingsport_image_additional_height', '74', 0),
(961, 0, 'theme_kingsport', 'theme_kingsport_image_additional_width', '74', 0),
(960, 0, 'theme_kingsport', 'theme_kingsport_image_product_height', '228', 0),
(959, 0, 'theme_kingsport', 'theme_kingsport_image_product_width', '228', 0),
(958, 0, 'theme_kingsport', 'theme_kingsport_image_popup_height', '500', 0),
(957, 0, 'theme_kingsport', 'theme_kingsport_image_popup_width', '500', 0),
(956, 0, 'theme_kingsport', 'theme_kingsport_image_thumb_height', '228', 0),
(955, 0, 'theme_kingsport', 'theme_kingsport_image_thumb_width', '228', 0),
(954, 0, 'theme_kingsport', 'theme_kingsport_image_category_height', '80', 0),
(953, 0, 'theme_kingsport', 'theme_kingsport_image_category_width', '80', 0),
(952, 0, 'theme_kingsport', 'theme_kingsport_product_description_length', '100', 0),
(951, 0, 'theme_kingsport', 'theme_kingsport_product_limit', '15', 0),
(950, 0, 'theme_kingsport', 'theme_kingsport_status', '1', 0),
(949, 0, 'theme_kingsport', 'theme_kingsport_directory', 'kingsport', 0),
(1169, 0, 'config', 'config_meta_title', 'Your Store', 0),
(972, 0, 'theme_kingsport', 'theme_kingsport_image_location_height', '50', 0),
(994, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(995, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(996, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(1255, 0, 'advertise_google', 'advertise_google_checklist_confirmed', '1', 0),
(1258, 0, 'feed_openbaypro', 'feed_openbaypro_version', '3250', 0),
(1259, 0, 'feed_google_sitemap', 'feed_google_sitemap_status', '1', 0),
(1260, 0, 'feed_google_base', 'feed_google_base_status', '1', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_shipping_courier`
--

CREATE TABLE `ks_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_shipping_courier`
--

INSERT INTO `ks_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_statistics`
--

CREATE TABLE `ks_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_statistics`
--

INSERT INTO `ks_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '606.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_stock_status`
--

CREATE TABLE `ks_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_stock_status`
--

INSERT INTO `ks_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days'),
(7, 3, 'In Stock'),
(8, 3, 'Pre-Order'),
(5, 3, 'Out Of Stock'),
(6, 3, '2-3 Days');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_store`
--

CREATE TABLE `ks_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_tax_class`
--

CREATE TABLE `ks_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_tax_class`
--

INSERT INTO `ks_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_tax_rate`
--

CREATE TABLE `ks_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_tax_rate`
--

INSERT INTO `ks_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_tax_rate_to_customer_group`
--

CREATE TABLE `ks_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_tax_rate_to_customer_group`
--

INSERT INTO `ks_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_tax_rule`
--

CREATE TABLE `ks_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_tax_rule`
--

INSERT INTO `ks_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_theme`
--

CREATE TABLE `ks_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_translation`
--

CREATE TABLE `ks_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_upload`
--

CREATE TABLE `ks_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_user`
--

CREATE TABLE `ks_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_user`
--

INSERT INTO `ks_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'aed64dc751360ac3e25dce8b9d31904bbfc7646d', 'WeNsH7h3o', 'Nguyen', 'Duc', 'thducuit@gmail.com', '', '', '123.21.33.65', 1, '2019-05-21 21:16:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_user_group`
--

CREATE TABLE `ks_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_user_group`
--

INSERT INTO `ks_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/news\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/recently_viewed\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/theme\\/kingsport\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"web\\/block\",\"web\\/blog\",\"web\\/branch\",\"web\\/category\",\"web\\/information\",\"web\\/video\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/news\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/recently_viewed\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/theme\\/kingsport\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"web\\/block\",\"web\\/blog\",\"web\\/branch\",\"web\\/category\",\"web\\/information\",\"web\\/video\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_video`
--

CREATE TABLE `ks_video` (
  `video_id` int(11) UNSIGNED NOT NULL,
  `bottom` int(11) DEFAULT NULL,
  `main` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_video`
--

INSERT INTO `ks_video` (`video_id`, `bottom`, `main`, `home`, `status`, `sort_order`, `date_added`, `date_modified`) VALUES
(3, 0, 0, 1, 1, 0, NULL, NULL),
(4, 0, 0, 1, 1, 0, NULL, NULL),
(5, 0, 0, 1, 1, 0, NULL, NULL),
(6, 0, 1, 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_video_description`
--

CREATE TABLE `ks_video_description` (
  `video_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ks_video_description`
--

INSERT INTO `ks_video_description` (`video_id`, `language_id`, `title`, `url`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 2, '  Ghế Massage King-Sport G4', 'https://www.youtube.com/embed/8oiLRkgfsOU', '', '  Ghế Massage King-Sport G4', '', ''),
(4, 2, '  Ghế Massage King-Sport G3', 'https://www.youtube.com/embed/8oiLRkgfsOU', '', '  Ghế Massage King-Sport G3', '', ''),
(5, 2, '  Ghế Massage King-Sport G2', 'https://www.youtube.com/embed/8oiLRkgfsOU', '', '  Ghế Massage King-Sport G4', '', ''),
(6, 2, 'Ghế Massage King-Sport G3', 'https://www.youtube.com/embed/8oiLRkgfsOU', '', 'Ghế Massage King-Sport G3', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_video_to_layout`
--

CREATE TABLE `ks_video_to_layout` (
  `video_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_video_to_layout`
--

INSERT INTO `ks_video_to_layout` (`video_id`, `store_id`, `layout_id`) VALUES
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_video_to_store`
--

CREATE TABLE `ks_video_to_store` (
  `video_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_video_to_store`
--

INSERT INTO `ks_video_to_store` (`video_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_voucher`
--

CREATE TABLE `ks_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_voucher_history`
--

CREATE TABLE `ks_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_voucher_theme`
--

CREATE TABLE `ks_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_voucher_theme`
--

INSERT INTO `ks_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_voucher_theme_description`
--

CREATE TABLE `ks_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_voucher_theme_description`
--

INSERT INTO `ks_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General'),
(6, 3, 'Christmas'),
(7, 3, 'Birthday'),
(8, 3, 'General');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_weight_class`
--

CREATE TABLE `ks_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_weight_class`
--

INSERT INTO `ks_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_weight_class_description`
--

CREATE TABLE `ks_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_weight_class_description`
--

INSERT INTO `ks_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz'),
(1, 3, 'Kilogram', 'kg'),
(2, 3, 'Gram', 'g'),
(5, 3, 'Pound ', 'lb'),
(6, 3, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_zone`
--

CREATE TABLE `ks_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_zone`
--

INSERT INTO `ks_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark\'unik\'', 'GEG', 1),
(184, 11, 'Kotayk\'', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik\'', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots\' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Niederösterreich', 'NOS', 1),
(202, 14, 'Oberösterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-Württemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Thüringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'Kalimantan Utara', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1);
INSERT INTO `ks_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord-Brabant', 'NB', 1),
(2336, 150, 'Noord-Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid-Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul\'yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust\'-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1);
INSERT INTO `ks_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas\'ka Oblast\'', '71', 1),
(3481, 220, 'Chernihivs\'ka Oblast\'', '74', 1),
(3482, 220, 'Chernivets\'ka Oblast\'', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs\'ka Oblast\'', '12', 1),
(3485, 220, 'Donets\'ka Oblast\'', '14', 1),
(3486, 220, 'Ivano-Frankivs\'ka Oblast\'', '26', 1),
(3487, 220, 'Khersons\'ka Oblast\'', '65', 1),
(3488, 220, 'Khmel\'nyts\'ka Oblast\'', '68', 1),
(3489, 220, 'Kirovohrads\'ka Oblast\'', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs\'ka Oblast\'', '32', 1),
(3492, 220, 'Luhans\'ka Oblast\'', '09', 1),
(3493, 220, 'L\'vivs\'ka Oblast\'', '46', 1),
(3494, 220, 'Mykolayivs\'ka Oblast\'', '48', 1),
(3495, 220, 'Odes\'ka Oblast\'', '51', 1),
(3496, 220, 'Poltavs\'ka Oblast\'', '53', 1),
(3497, 220, 'Rivnens\'ka Oblast\'', '56', 1),
(3498, 220, 'Sevastopol\'', '40', 1),
(3499, 220, 'Sums\'ka Oblast\'', '59', 1),
(3500, 220, 'Ternopil\'s\'ka Oblast\'', '61', 1),
(3501, 220, 'Vinnyts\'ka Oblast\'', '05', 1),
(3502, 220, 'Volyns\'ka Oblast\'', '07', 1),
(3503, 220, 'Zakarpats\'ka Oblast\'', '21', 1),
(3504, 220, 'Zaporiz\'ka Oblast\'', '23', 1),
(3505, 220, 'Zhytomyrs\'ka oblast\'', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs\'ka Oblast\'', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Qinghai', 'QH', 1),
(4233, 100, 'Papua Barat', 'PB', 1),
(4234, 100, 'Sulawesi Barat', 'SR', 1),
(4235, 100, 'Kepulauan Riau', 'KR', 1),
(4236, 105, 'Barletta-Andria-Trani', 'BT', 1),
(4237, 105, 'Fermo', 'FM', 1),
(4238, 105, 'Monza Brianza', 'MB', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ks_zone_to_geo_zone`
--

CREATE TABLE `ks_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ks_zone_to_geo_zone`
--

INSERT INTO `ks_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ks_address`
--
ALTER TABLE `ks_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `ks_api`
--
ALTER TABLE `ks_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Chỉ mục cho bảng `ks_api_ip`
--
ALTER TABLE `ks_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Chỉ mục cho bảng `ks_api_session`
--
ALTER TABLE `ks_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Chỉ mục cho bảng `ks_attribute`
--
ALTER TABLE `ks_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `ks_attribute_description`
--
ALTER TABLE `ks_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_attribute_group`
--
ALTER TABLE `ks_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Chỉ mục cho bảng `ks_attribute_group_description`
--
ALTER TABLE `ks_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_banner`
--
ALTER TABLE `ks_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Chỉ mục cho bảng `ks_banner_image`
--
ALTER TABLE `ks_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Chỉ mục cho bảng `ks_block`
--
ALTER TABLE `ks_block`
  ADD PRIMARY KEY (`block_id`);

--
-- Chỉ mục cho bảng `ks_block_description`
--
ALTER TABLE `ks_block_description`
  ADD PRIMARY KEY (`block_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_block_to_layout`
--
ALTER TABLE `ks_block_to_layout`
  ADD PRIMARY KEY (`block_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_block_to_store`
--
ALTER TABLE `ks_block_to_store`
  ADD PRIMARY KEY (`block_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_blog`
--
ALTER TABLE `ks_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Chỉ mục cho bảng `ks_blog_category`
--
ALTER TABLE `ks_blog_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `ks_blog_category_description`
--
ALTER TABLE `ks_blog_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_blog_category_to_layout`
--
ALTER TABLE `ks_blog_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_blog_category_to_store`
--
ALTER TABLE `ks_blog_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_blog_description`
--
ALTER TABLE `ks_blog_description`
  ADD PRIMARY KEY (`blog_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_blog_to_layout`
--
ALTER TABLE `ks_blog_to_layout`
  ADD PRIMARY KEY (`blog_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_blog_to_store`
--
ALTER TABLE `ks_blog_to_store`
  ADD PRIMARY KEY (`blog_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_branch`
--
ALTER TABLE `ks_branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Chỉ mục cho bảng `ks_branch_description`
--
ALTER TABLE `ks_branch_description`
  ADD PRIMARY KEY (`branch_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_branch_image`
--
ALTER TABLE `ks_branch_image`
  ADD PRIMARY KEY (`branch_image_id`),
  ADD KEY `product_id` (`branch_id`);

--
-- Chỉ mục cho bảng `ks_branch_to_layout`
--
ALTER TABLE `ks_branch_to_layout`
  ADD PRIMARY KEY (`branch_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_branch_to_store`
--
ALTER TABLE `ks_branch_to_store`
  ADD PRIMARY KEY (`branch_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_cart`
--
ALTER TABLE `ks_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Chỉ mục cho bảng `ks_category`
--
ALTER TABLE `ks_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `ks_category_description`
--
ALTER TABLE `ks_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `ks_category_filter`
--
ALTER TABLE `ks_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Chỉ mục cho bảng `ks_category_path`
--
ALTER TABLE `ks_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Chỉ mục cho bảng `ks_category_to_layout`
--
ALTER TABLE `ks_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_category_to_store`
--
ALTER TABLE `ks_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_country`
--
ALTER TABLE `ks_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Chỉ mục cho bảng `ks_coupon`
--
ALTER TABLE `ks_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Chỉ mục cho bảng `ks_coupon_category`
--
ALTER TABLE `ks_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Chỉ mục cho bảng `ks_coupon_history`
--
ALTER TABLE `ks_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Chỉ mục cho bảng `ks_coupon_product`
--
ALTER TABLE `ks_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Chỉ mục cho bảng `ks_currency`
--
ALTER TABLE `ks_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Chỉ mục cho bảng `ks_customer`
--
ALTER TABLE `ks_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `ks_customer_activity`
--
ALTER TABLE `ks_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Chỉ mục cho bảng `ks_customer_affiliate`
--
ALTER TABLE `ks_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `ks_customer_approval`
--
ALTER TABLE `ks_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Chỉ mục cho bảng `ks_customer_group`
--
ALTER TABLE `ks_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Chỉ mục cho bảng `ks_customer_group_description`
--
ALTER TABLE `ks_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_customer_history`
--
ALTER TABLE `ks_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Chỉ mục cho bảng `ks_customer_ip`
--
ALTER TABLE `ks_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Chỉ mục cho bảng `ks_customer_login`
--
ALTER TABLE `ks_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Chỉ mục cho bảng `ks_customer_online`
--
ALTER TABLE `ks_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Chỉ mục cho bảng `ks_customer_product_viewed`
--
ALTER TABLE `ks_customer_product_viewed`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ks_customer_reward`
--
ALTER TABLE `ks_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Chỉ mục cho bảng `ks_customer_search`
--
ALTER TABLE `ks_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Chỉ mục cho bảng `ks_customer_transaction`
--
ALTER TABLE `ks_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Chỉ mục cho bảng `ks_customer_wishlist`
--
ALTER TABLE `ks_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Chỉ mục cho bảng `ks_custom_field`
--
ALTER TABLE `ks_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Chỉ mục cho bảng `ks_custom_field_customer_group`
--
ALTER TABLE `ks_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Chỉ mục cho bảng `ks_custom_field_description`
--
ALTER TABLE `ks_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_custom_field_value`
--
ALTER TABLE `ks_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Chỉ mục cho bảng `ks_custom_field_value_description`
--
ALTER TABLE `ks_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_download`
--
ALTER TABLE `ks_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Chỉ mục cho bảng `ks_download_description`
--
ALTER TABLE `ks_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_ebay_image_import`
--
ALTER TABLE `ks_ebay_image_import`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ks_ebay_order_lock`
--
ALTER TABLE `ks_ebay_order_lock`
  ADD PRIMARY KEY (`smp_id`);

--
-- Chỉ mục cho bảng `ks_ebay_setting_option`
--
ALTER TABLE `ks_ebay_setting_option`
  ADD PRIMARY KEY (`ebay_setting_option_id`);

--
-- Chỉ mục cho bảng `ks_ebay_shipping_location_exclude`
--
ALTER TABLE `ks_ebay_shipping_location_exclude`
  ADD PRIMARY KEY (`ebay_shipping_exclude_id`);

--
-- Chỉ mục cho bảng `ks_ebay_stock_reserve`
--
ALTER TABLE `ks_ebay_stock_reserve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ks_ebay_template`
--
ALTER TABLE `ks_ebay_template`
  ADD PRIMARY KEY (`template_id`);

--
-- Chỉ mục cho bảng `ks_event`
--
ALTER TABLE `ks_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Chỉ mục cho bảng `ks_extension`
--
ALTER TABLE `ks_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Chỉ mục cho bảng `ks_extension_install`
--
ALTER TABLE `ks_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Chỉ mục cho bảng `ks_extension_path`
--
ALTER TABLE `ks_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Chỉ mục cho bảng `ks_filter`
--
ALTER TABLE `ks_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Chỉ mục cho bảng `ks_filter_description`
--
ALTER TABLE `ks_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_filter_group`
--
ALTER TABLE `ks_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Chỉ mục cho bảng `ks_filter_group_description`
--
ALTER TABLE `ks_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_geo_zone`
--
ALTER TABLE `ks_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Chỉ mục cho bảng `ks_googleshopping_category`
--
ALTER TABLE `ks_googleshopping_category`
  ADD PRIMARY KEY (`google_product_category`,`store_id`),
  ADD KEY `category_id_store_id` (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_googleshopping_product`
--
ALTER TABLE `ks_googleshopping_product`
  ADD PRIMARY KEY (`product_advertise_google_id`),
  ADD UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_googleshopping_product_status`
--
ALTER TABLE `ks_googleshopping_product_status`
  ADD PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`);

--
-- Chỉ mục cho bảng `ks_googleshopping_product_target`
--
ALTER TABLE `ks_googleshopping_product_target`
  ADD PRIMARY KEY (`product_id`,`advertise_google_target_id`);

--
-- Chỉ mục cho bảng `ks_googleshopping_target`
--
ALTER TABLE `ks_googleshopping_target`
  ADD PRIMARY KEY (`advertise_google_target_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Chỉ mục cho bảng `ks_google_base_category`
--
ALTER TABLE `ks_google_base_category`
  ADD PRIMARY KEY (`google_base_category_id`);

--
-- Chỉ mục cho bảng `ks_google_base_category_to_category`
--
ALTER TABLE `ks_google_base_category_to_category`
  ADD PRIMARY KEY (`google_base_category_id`,`category_id`);

--
-- Chỉ mục cho bảng `ks_info`
--
ALTER TABLE `ks_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Chỉ mục cho bảng `ks_information`
--
ALTER TABLE `ks_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Chỉ mục cho bảng `ks_information_description`
--
ALTER TABLE `ks_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_information_to_layout`
--
ALTER TABLE `ks_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_information_to_store`
--
ALTER TABLE `ks_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_info_description`
--
ALTER TABLE `ks_info_description`
  ADD PRIMARY KEY (`info_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_info_to_layout`
--
ALTER TABLE `ks_info_to_layout`
  ADD PRIMARY KEY (`info_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_info_to_store`
--
ALTER TABLE `ks_info_to_store`
  ADD PRIMARY KEY (`info_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_language`
--
ALTER TABLE `ks_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `ks_layout`
--
ALTER TABLE `ks_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Chỉ mục cho bảng `ks_layout_module`
--
ALTER TABLE `ks_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Chỉ mục cho bảng `ks_layout_route`
--
ALTER TABLE `ks_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Chỉ mục cho bảng `ks_length_class`
--
ALTER TABLE `ks_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Chỉ mục cho bảng `ks_length_class_description`
--
ALTER TABLE `ks_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_location`
--
ALTER TABLE `ks_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `ks_manufacturer`
--
ALTER TABLE `ks_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Chỉ mục cho bảng `ks_manufacturer_to_store`
--
ALTER TABLE `ks_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_marketing`
--
ALTER TABLE `ks_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Chỉ mục cho bảng `ks_modification`
--
ALTER TABLE `ks_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Chỉ mục cho bảng `ks_module`
--
ALTER TABLE `ks_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Chỉ mục cho bảng `ks_openbay_faq`
--
ALTER TABLE `ks_openbay_faq`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ks_option`
--
ALTER TABLE `ks_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Chỉ mục cho bảng `ks_option_description`
--
ALTER TABLE `ks_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_option_value`
--
ALTER TABLE `ks_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Chỉ mục cho bảng `ks_option_value_description`
--
ALTER TABLE `ks_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_order`
--
ALTER TABLE `ks_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `ks_order_history`
--
ALTER TABLE `ks_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Chỉ mục cho bảng `ks_order_option`
--
ALTER TABLE `ks_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Chỉ mục cho bảng `ks_order_product`
--
ALTER TABLE `ks_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `ks_order_recurring`
--
ALTER TABLE `ks_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Chỉ mục cho bảng `ks_order_recurring_transaction`
--
ALTER TABLE `ks_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Chỉ mục cho bảng `ks_order_shipment`
--
ALTER TABLE `ks_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Chỉ mục cho bảng `ks_order_status`
--
ALTER TABLE `ks_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_order_total`
--
ALTER TABLE `ks_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `ks_order_voucher`
--
ALTER TABLE `ks_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Chỉ mục cho bảng `ks_product`
--
ALTER TABLE `ks_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `ks_product_attribute`
--
ALTER TABLE `ks_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_product_description`
--
ALTER TABLE `ks_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `ks_product_discount`
--
ALTER TABLE `ks_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ks_product_filter`
--
ALTER TABLE `ks_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Chỉ mục cho bảng `ks_product_gift`
--
ALTER TABLE `ks_product_gift`
  ADD PRIMARY KEY (`product_gift_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ks_product_image`
--
ALTER TABLE `ks_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ks_product_included`
--
ALTER TABLE `ks_product_included`
  ADD PRIMARY KEY (`product_id`,`included_id`);

--
-- Chỉ mục cho bảng `ks_product_option`
--
ALTER TABLE `ks_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Chỉ mục cho bảng `ks_product_option_value`
--
ALTER TABLE `ks_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Chỉ mục cho bảng `ks_product_recurring`
--
ALTER TABLE `ks_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Chỉ mục cho bảng `ks_product_related`
--
ALTER TABLE `ks_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Chỉ mục cho bảng `ks_product_reward`
--
ALTER TABLE `ks_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Chỉ mục cho bảng `ks_product_special`
--
ALTER TABLE `ks_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ks_product_to_category`
--
ALTER TABLE `ks_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `ks_product_to_download`
--
ALTER TABLE `ks_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Chỉ mục cho bảng `ks_product_to_layout`
--
ALTER TABLE `ks_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_product_to_store`
--
ALTER TABLE `ks_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_recurring`
--
ALTER TABLE `ks_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Chỉ mục cho bảng `ks_recurring_description`
--
ALTER TABLE `ks_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_return`
--
ALTER TABLE `ks_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Chỉ mục cho bảng `ks_return_action`
--
ALTER TABLE `ks_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_return_history`
--
ALTER TABLE `ks_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Chỉ mục cho bảng `ks_return_reason`
--
ALTER TABLE `ks_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_return_status`
--
ALTER TABLE `ks_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_review`
--
ALTER TABLE `ks_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `ks_seo_url`
--
ALTER TABLE `ks_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Chỉ mục cho bảng `ks_session`
--
ALTER TABLE `ks_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Chỉ mục cho bảng `ks_setting`
--
ALTER TABLE `ks_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Chỉ mục cho bảng `ks_shipping_courier`
--
ALTER TABLE `ks_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Chỉ mục cho bảng `ks_statistics`
--
ALTER TABLE `ks_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Chỉ mục cho bảng `ks_stock_status`
--
ALTER TABLE `ks_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_store`
--
ALTER TABLE `ks_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Chỉ mục cho bảng `ks_tax_class`
--
ALTER TABLE `ks_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Chỉ mục cho bảng `ks_tax_rate`
--
ALTER TABLE `ks_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Chỉ mục cho bảng `ks_tax_rate_to_customer_group`
--
ALTER TABLE `ks_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Chỉ mục cho bảng `ks_tax_rule`
--
ALTER TABLE `ks_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Chỉ mục cho bảng `ks_theme`
--
ALTER TABLE `ks_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Chỉ mục cho bảng `ks_translation`
--
ALTER TABLE `ks_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Chỉ mục cho bảng `ks_upload`
--
ALTER TABLE `ks_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Chỉ mục cho bảng `ks_user`
--
ALTER TABLE `ks_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `ks_user_group`
--
ALTER TABLE `ks_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Chỉ mục cho bảng `ks_video`
--
ALTER TABLE `ks_video`
  ADD PRIMARY KEY (`video_id`);

--
-- Chỉ mục cho bảng `ks_video_description`
--
ALTER TABLE `ks_video_description`
  ADD PRIMARY KEY (`video_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_video_to_layout`
--
ALTER TABLE `ks_video_to_layout`
  ADD PRIMARY KEY (`video_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_video_to_store`
--
ALTER TABLE `ks_video_to_store`
  ADD PRIMARY KEY (`video_id`,`store_id`);

--
-- Chỉ mục cho bảng `ks_voucher`
--
ALTER TABLE `ks_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Chỉ mục cho bảng `ks_voucher_history`
--
ALTER TABLE `ks_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Chỉ mục cho bảng `ks_voucher_theme`
--
ALTER TABLE `ks_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Chỉ mục cho bảng `ks_voucher_theme_description`
--
ALTER TABLE `ks_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_weight_class`
--
ALTER TABLE `ks_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Chỉ mục cho bảng `ks_weight_class_description`
--
ALTER TABLE `ks_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Chỉ mục cho bảng `ks_zone`
--
ALTER TABLE `ks_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Chỉ mục cho bảng `ks_zone_to_geo_zone`
--
ALTER TABLE `ks_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ks_address`
--
ALTER TABLE `ks_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_api`
--
ALTER TABLE `ks_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_api_ip`
--
ALTER TABLE `ks_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_api_session`
--
ALTER TABLE `ks_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ks_attribute`
--
ALTER TABLE `ks_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `ks_attribute_group`
--
ALTER TABLE `ks_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `ks_banner`
--
ALTER TABLE `ks_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ks_banner_image`
--
ALTER TABLE `ks_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT cho bảng `ks_block`
--
ALTER TABLE `ks_block`
  MODIFY `block_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `ks_blog`
--
ALTER TABLE `ks_blog`
  MODIFY `blog_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `ks_blog_category`
--
ALTER TABLE `ks_blog_category`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `ks_branch`
--
ALTER TABLE `ks_branch`
  MODIFY `branch_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `ks_branch_image`
--
ALTER TABLE `ks_branch_image`
  MODIFY `branch_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT cho bảng `ks_cart`
--
ALTER TABLE `ks_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `ks_category`
--
ALTER TABLE `ks_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT cho bảng `ks_country`
--
ALTER TABLE `ks_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT cho bảng `ks_coupon`
--
ALTER TABLE `ks_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ks_coupon_history`
--
ALTER TABLE `ks_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_coupon_product`
--
ALTER TABLE `ks_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_currency`
--
ALTER TABLE `ks_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ks_customer`
--
ALTER TABLE `ks_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_activity`
--
ALTER TABLE `ks_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_approval`
--
ALTER TABLE `ks_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_group`
--
ALTER TABLE `ks_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_customer_history`
--
ALTER TABLE `ks_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_ip`
--
ALTER TABLE `ks_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_login`
--
ALTER TABLE `ks_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_customer_product_viewed`
--
ALTER TABLE `ks_customer_product_viewed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_reward`
--
ALTER TABLE `ks_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_search`
--
ALTER TABLE `ks_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_customer_transaction`
--
ALTER TABLE `ks_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_custom_field`
--
ALTER TABLE `ks_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_custom_field_value`
--
ALTER TABLE `ks_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_download`
--
ALTER TABLE `ks_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_ebay_image_import`
--
ALTER TABLE `ks_ebay_image_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_ebay_setting_option`
--
ALTER TABLE `ks_ebay_setting_option`
  MODIFY `ebay_setting_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_ebay_shipping_location_exclude`
--
ALTER TABLE `ks_ebay_shipping_location_exclude`
  MODIFY `ebay_shipping_exclude_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_ebay_stock_reserve`
--
ALTER TABLE `ks_ebay_stock_reserve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_ebay_template`
--
ALTER TABLE `ks_ebay_template`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_event`
--
ALTER TABLE `ks_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `ks_extension`
--
ALTER TABLE `ks_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `ks_extension_install`
--
ALTER TABLE `ks_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ks_extension_path`
--
ALTER TABLE `ks_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `ks_filter`
--
ALTER TABLE `ks_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_filter_group`
--
ALTER TABLE `ks_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_geo_zone`
--
ALTER TABLE `ks_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ks_googleshopping_product`
--
ALTER TABLE `ks_googleshopping_product`
  MODIFY `product_advertise_google_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ks_google_base_category`
--
ALTER TABLE `ks_google_base_category`
  MODIFY `google_base_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_info`
--
ALTER TABLE `ks_info`
  MODIFY `info_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_information`
--
ALTER TABLE `ks_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `ks_language`
--
ALTER TABLE `ks_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ks_layout`
--
ALTER TABLE `ks_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `ks_layout_module`
--
ALTER TABLE `ks_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `ks_layout_route`
--
ALTER TABLE `ks_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `ks_length_class`
--
ALTER TABLE `ks_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ks_location`
--
ALTER TABLE `ks_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_manufacturer`
--
ALTER TABLE `ks_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `ks_marketing`
--
ALTER TABLE `ks_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_modification`
--
ALTER TABLE `ks_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ks_module`
--
ALTER TABLE `ks_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `ks_openbay_faq`
--
ALTER TABLE `ks_openbay_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_option`
--
ALTER TABLE `ks_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `ks_option_value`
--
ALTER TABLE `ks_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `ks_order`
--
ALTER TABLE `ks_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ks_order_history`
--
ALTER TABLE `ks_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_order_option`
--
ALTER TABLE `ks_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_order_product`
--
ALTER TABLE `ks_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ks_order_recurring`
--
ALTER TABLE `ks_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_order_recurring_transaction`
--
ALTER TABLE `ks_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_order_shipment`
--
ALTER TABLE `ks_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_order_status`
--
ALTER TABLE `ks_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `ks_order_total`
--
ALTER TABLE `ks_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ks_order_voucher`
--
ALTER TABLE `ks_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_product`
--
ALTER TABLE `ks_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `ks_product_discount`
--
ALTER TABLE `ks_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT cho bảng `ks_product_gift`
--
ALTER TABLE `ks_product_gift`
  MODIFY `product_gift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;

--
-- AUTO_INCREMENT cho bảng `ks_product_image`
--
ALTER TABLE `ks_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2431;

--
-- AUTO_INCREMENT cho bảng `ks_product_option`
--
ALTER TABLE `ks_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT cho bảng `ks_product_option_value`
--
ALTER TABLE `ks_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `ks_product_reward`
--
ALTER TABLE `ks_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;

--
-- AUTO_INCREMENT cho bảng `ks_product_special`
--
ALTER TABLE `ks_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT cho bảng `ks_recurring`
--
ALTER TABLE `ks_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_return`
--
ALTER TABLE `ks_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_return_action`
--
ALTER TABLE `ks_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ks_return_history`
--
ALTER TABLE `ks_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_return_reason`
--
ALTER TABLE `ks_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `ks_return_status`
--
ALTER TABLE `ks_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ks_review`
--
ALTER TABLE `ks_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_seo_url`
--
ALTER TABLE `ks_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=844;

--
-- AUTO_INCREMENT cho bảng `ks_setting`
--
ALTER TABLE `ks_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1286;

--
-- AUTO_INCREMENT cho bảng `ks_statistics`
--
ALTER TABLE `ks_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `ks_stock_status`
--
ALTER TABLE `ks_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ks_store`
--
ALTER TABLE `ks_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_tax_class`
--
ALTER TABLE `ks_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `ks_tax_rate`
--
ALTER TABLE `ks_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `ks_tax_rule`
--
ALTER TABLE `ks_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT cho bảng `ks_theme`
--
ALTER TABLE `ks_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_translation`
--
ALTER TABLE `ks_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_upload`
--
ALTER TABLE `ks_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_user`
--
ALTER TABLE `ks_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ks_user_group`
--
ALTER TABLE `ks_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `ks_video`
--
ALTER TABLE `ks_video`
  MODIFY `video_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ks_voucher`
--
ALTER TABLE `ks_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_voucher_history`
--
ALTER TABLE `ks_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ks_voucher_theme`
--
ALTER TABLE `ks_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ks_weight_class`
--
ALTER TABLE `ks_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ks_zone`
--
ALTER TABLE `ks_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;

--
-- AUTO_INCREMENT cho bảng `ks_zone_to_geo_zone`
--
ALTER TABLE `ks_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
