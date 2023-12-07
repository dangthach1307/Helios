-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 01:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_helios`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_banner`
--

CREATE TABLE `db_banner` (
  `id` int(11) NOT NULL COMMENT 'Mã slide',
  `name` varchar(255) NOT NULL COMMENT 'Tên gọi',
  `link` varchar(255) NOT NULL COMMENT 'Đường dẫn',
  `position` varchar(100) NOT NULL COMMENT 'Vị trí',
  `info1` varchar(50) DEFAULT NULL COMMENT 'Dòng thông tin 1',
  `info2` varchar(50) DEFAULT NULL COMMENT 'Dòng thông tin 2',
  `info3` varchar(50) DEFAULT NULL COMMENT 'Dòng thông tin 3',
  `img` varchar(100) NOT NULL COMMENT 'Hình ảnh',
  `orders` int(11) NOT NULL COMMENT 'Sắp xếp',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_banner`
--

INSERT INTO `db_banner` (`id`, `name`, `link`, `position`, `info1`, `info2`, `info3`, `img`, `orders`, `status`) VALUES
(1, 'Bộ sưu tập nhẫn', 'index.php?option=page&act=category&cat=nhan', 'slider', 'Bộ sưu tập', 'nhẫn độc đáo', '', 'nhan.jpg', 1, 1),
(2, 'Mặt dây chuyền', 'index.php?option=page&act=category&cat=mat-day-chuyen', 'slider', 'Mặt dây chuyền', 'Tự thiết kế', '', 'mat-day-chuyen.jpg', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_brand`
--

CREATE TABLE `db_brand` (
  `id` int(11) NOT NULL COMMENT 'Mã danh mục',
  `name` varchar(255) NOT NULL COMMENT 'Tên danh mục',
  `slug` varchar(255) NOT NULL COMMENT 'Mã hoá url',
  `img` varchar(255) DEFAULT NULL COMMENT 'Ảnh đại diện',
  `orders` int(11) UNSIGNED NOT NULL COMMENT 'Thứ tự sắp xếp',
  `status` smallint(3) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_brand`
--

INSERT INTO `db_brand` (`id`, `name`, `slug`, `img`, `orders`, `status`) VALUES
(1, 'PNJ', 'pnj', 'pnj.png', 1, 1),
(2, 'DOJI', 'doji', 'doji.png', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` int(11) NOT NULL COMMENT 'Mã danh mục',
  `name` varchar(255) NOT NULL COMMENT 'Tên danh mục',
  `slug` varchar(255) NOT NULL COMMENT 'Mã hoá url',
  `parent_id` int(11) NOT NULL COMMENT 'Mã danh mục cấp cha',
  `orders` int(11) UNSIGNED NOT NULL COMMENT 'Thứ tự sắp xếp',
  `status` smallint(3) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `name`, `slug`, `parent_id`, `orders`, `status`) VALUES
(1, 'Chủng loại', 'chung-loai', 0, 1, 1),
(2, 'Dòng trang sức', 'dong-trang-suc', 0, 2, 1),
(3, 'Trang sức phong thuỷ', 'trang-suc-phong-thuy', 0, 3, 1),
(4, 'Bộ sưu tập', 'bo-suu-tap', 0, 4, 1),
(5, 'Nhẫn', 'nhan', 1, 1, 1),
(6, 'Dây chuyền', 'day-chuyen', 1, 2, 1),
(7, 'Mặt dây chuyền', 'mat-day-chuyen', 1, 3, 1),
(8, 'Bông tai', 'bong-tai', 1, 4, 1),
(9, 'Lắc', 'lac', 1, 5, 1),
(10, 'Vòng', 'vong', 1, 6, 1),
(11, 'Kim cương', 'kim-cuong', 2, 1, 1),
(12, 'Không đính đá', 'khong-dinh-da', 2, 2, 1),
(13, 'Đá màu', 'da-mau', 2, 3, 1),
(14, 'Trang sức trẻ em', 'trang-suc-tre-em', 0, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_config`
--

CREATE TABLE `db_config` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'Tên website',
  `logo` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT 'Địa chỉ website',
  `address` varchar(255) NOT NULL COMMENT 'Địa chỉ công ty',
  `map` mediumtext NOT NULL COMMENT 'link iframe',
  `phone` varchar(255) NOT NULL COMMENT 'sdt',
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_config`
--

INSERT INTO `db_config` (`id`, `title`, `logo`, `icon`, `url`, `address`, `map`, `phone`, `email`) VALUES
(1, 'Helios E-Commercial Jewelry ', 'logo.png', 'icon.png', 'http://localhost:8080/helios/site/index.php', 'Công viên phần mềm Quang Trung, <br> TPHCM', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.443661489921!2d106.62525347403674!3d10.853821089299666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bee0b0ef9e5%3A0x5b4da59e47aa97a8!2sQuang%20Trung%20Software%20City!5e0!3m2!1sen!2s!4v1701871698216!5m2!1sen!2s', '(+84) 12 3456 789', 'helios@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `db_contact`
--

CREATE TABLE `db_contact` (
  `id` int(11) NOT NULL COMMENT 'Mã liên hệ',
  `fullname` varchar(100) NOT NULL COMMENT 'Họ tên',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `phone` varchar(15) DEFAULT NULL COMMENT 'Điện thoại',
  `title` varchar(255) NOT NULL COMMENT 'Tiêu đề',
  `detail` mediumtext NOT NULL COMMENT 'Nội dung',
  `contact_reply` mediumtext DEFAULT NULL COMMENT 'Trả lời liên hệ',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Trạng thái:\r\n1: Đã trả lời\r\n0: chưa trả lời',
  `isDeleted` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Trạng thái lưu trữ:\r\n0: Đã xoá\r\n1: Chưa xoá\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_email`
--

CREATE TABLE `db_email` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'tiêu đề',
  `type_email` varchar(255) NOT NULL COMMENT 'Loại email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_material`
--

CREATE TABLE `db_material` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_material`
--

INSERT INTO `db_material` (`id`, `name`, `rate`) VALUES
(1, 'Vàng 10K', 0.01),
(2, 'Vàng 14K', 0.02),
(3, 'Vàng 18K', 0.03),
(4, 'Vàng 22K', 0.04),
(5, 'Vàng 24K', 0.05),
(6, 'Bạc', 0.01),
(7, 'Platinum', 0.02);

-- --------------------------------------------------------

--
-- Table structure for table `db_member_rank`
--

CREATE TABLE `db_member_rank` (
  `id` int(11) NOT NULL COMMENT 'Mã cấp bậc thành viên',
  `name` varchar(50) NOT NULL COMMENT 'Tên loại cấp bậc, ví dụ: Bronze, Silver, Gold, Diamond...',
  `img` varchar(225) NOT NULL,
  `promotion` int(11) NOT NULL COMMENT 'Mức giảm giá (%) dựa trên loại rank đạt được',
  `condition_column` int(11) NOT NULL COMMENT 'Điều kiện tổng tiền',
  `info2` varchar(50) DEFAULT NULL COMMENT 'Thông tin 2',
  `status` tinyint(1) NOT NULL COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_member_rank`
--

INSERT INTO `db_member_rank` (`id`, `name`, `img`, `promotion`, `condition_column`, `info2`, `status`) VALUES
(1, 'Member', 'member.png', 0, 0, NULL, 1),
(2, 'Bronze', 'bronze.png', 3, 50000000, NULL, 1),
(3, 'Silver', 'silver.png', 5, 100000000, NULL, 1),
(4, 'Gold', 'gold.png', 7, 150000000, NULL, 1),
(5, 'Diamond', 'diamond.png', 9, 200000000, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_menu`
--

CREATE TABLE `db_menu` (
  `id` int(11) NOT NULL COMMENT 'Mã menu',
  `name` varchar(255) DEFAULT NULL COMMENT 'Tên menu',
  `type` varchar(255) NOT NULL COMMENT 'Loại menu',
  `link` varchar(255) DEFAULT NULL COMMENT 'Đường dẫn',
  `table_id` int(11) DEFAULT NULL COMMENT 'Bảng gốc',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Mã cấp cha',
  `orders` int(11) NOT NULL DEFAULT 0 COMMENT 'Sắp xếp',
  `position` varchar(255) NOT NULL COMMENT 'Vị trí',
  `status` int(11) NOT NULL COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_menu`
--

INSERT INTO `db_menu` (`id`, `name`, `type`, `link`, `table_id`, `parent_id`, `orders`, `position`, `status`) VALUES
(1, 'Trang sức', 'custom', 'index.php?option=page&act=product', NULL, 0, 0, 'megamenu', 1),
(2, 'Chủng loại', 'category', 'index.php?option=page&act=category&cat=chung-loai', 1, 1, 1, 'megamenu', 1),
(3, 'Dòng trang sức', 'category', 'index.php?option=page&act=category&cat=dong-trang-suc', 2, 1, 2, 'megamenu', 1),
(4, 'Trang sức phong thuỷ', 'category', 'index.php?option=page&act=category&cat=trang-suc-phong-thuy', 3, 1, 3, 'megamenu', 1),
(5, 'Bộ sưu tập', 'category', 'index.php?option=page&act=category&cat=bo-suu-tap', 4, 1, 4, 'megamenu', 1),
(6, 'Trang sức trẻ em', 'category', 'index.php?option=page&act=category&cat=trang-suc-tre-em', 14, 1, 4, 'megamenu', 1),
(7, 'Nhẫn', 'category', 'index.php?option=page&act=category&cat=nhan', 5, 2, 1, 'megamenu', 1),
(8, 'Dây chuyền', 'category', 'index.php?option=page&act=category&cat=day-chuyen', 6, 2, 2, 'megamenu', 1),
(9, 'Mặt dây chuyền', 'category', 'index.php?option=page&act=category&cat=mat-day-chuyen', 7, 2, 3, 'megamenu', 1),
(10, 'Đá màu', 'category', 'index.php?option=page&act=category&cat=da-mau', 13, 2, 4, 'megamenu', 1),
(11, 'Bông tai', 'category', 'index.php?option=page&act=category&cat=bong-tai', 8, 2, 5, 'megamenu', 1),
(12, 'Lắc', 'category', 'index.php?option=page&act=category&cat=lac', 9, 2, 6, 'megamenu', 1),
(13, 'Vòng', 'category', 'index.php?option=page&act=category&cat=vong', 10, 2, 7, 'megamenu', 1),
(14, 'Kim cương', 'category', 'index.php?option=page&act=category&cat=kim-cuong', 11, 3, 1, 'megamenu', 1),
(15, 'Không đính đá', 'category', 'index.php?option=page&act=category&cat=khong-dinh-da', 12, 3, 2, 'megamenu', 1),
(16, 'Đá màu', 'category', 'index.php?option=page&act=category&cat=da-mau', 13, 3, 3, 'megamenu', 1),
(17, 'Trang chủ', 'custom', 'index.php', NULL, 0, 0, 'headermenu', 1),
(18, 'Trang chủ', 'custom', 'index.php', NULL, 0, 0, 'footermenu', 1),
(19, 'Sản phẩm', 'custom', 'index.php?option=page&act=product', NULL, 0, 0, 'headermenu', 1),
(20, 'Tin tức', 'custom', 'index.php?option=page&act=post', NULL, 0, 1, 'headermenu', 1),
(21, 'Liên hệ', 'custom', 'index.php?option=page&act=contact', NULL, 0, 0, 'headermenu', 1),
(22, 'Tin tức', 'custom', 'index.php?option=page&act=post', NULL, 0, 1, 'megamenu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_order`
--

CREATE TABLE `db_order` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng',
  `user_id` int(11) NOT NULL COMMENT 'Mã thành viên',
  `delivery_fullname` varchar(255) DEFAULT NULL COMMENT 'Tên người nhận',
  `delivery_address` text DEFAULT NULL COMMENT 'Địa chỉ giao hàng',
  `delivery_phone` varchar(11) DEFAULT NULL COMMENT 'số điện thoại người nhận',
  `delivery_email` varchar(255) DEFAULT NULL COMMENT 'email người nhận',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo hoá đơn',
  `exported_at` datetime DEFAULT current_timestamp() COMMENT 'Ngày xuất hoá đơn',
  `total_price` int(11) NOT NULL COMMENT 'Tổng tiền đơn hàng',
  `payment_method` int(11) NOT NULL COMMENT '1: Thanh toán khi nhận hàng\r\n2: Chuyển khoản\r\n3: Ví điện tử',
  `stage` int(1) NOT NULL DEFAULT 1 COMMENT 'Quy định trạng thái vận chuyển:\r\n1: Chờ duyệt\r\n2: Đang xử lý\r\n3: Huỷ đơn\r\n4: Đang giao\r\n5: Giao thành công\r\n6: Trả hàng/Đổi hàng\r\n7: Hoàn thành',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'Quy định trạng thái đơn hàng:\r\n0: Đang xử lý\r\n1: Đã hoàn thành\r\n2: Đã huỷ đơn',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_orderdetail`
--

CREATE TABLE `db_orderdetail` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'mã chi tiết đon hàng',
  `order_id` int(11) UNSIGNED NOT NULL COMMENT 'mã đơn hàng',
  `product_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `material` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `price` int(11) NOT NULL COMMENT 'Giá từ session giỏ hàng',
  `quantity` int(11) UNSIGNED NOT NULL COMMENT 'Số lượng sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_post`
--

CREATE TABLE `db_post` (
  `id` int(11) NOT NULL COMMENT 'Mã bài viết',
  `topic_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'Mã chủ đề',
  `title` varchar(255) NOT NULL COMMENT 'Tiêu đề bài viết',
  `slug` varchar(255) NOT NULL COMMENT 'Mã hoá url',
  `detail` longtext NOT NULL COMMENT 'Nội dung bài viết',
  `img` varchar(255) DEFAULT NULL COMMENT 'Ảnh dại diện',
  `type` varchar(50) DEFAULT 'post' COMMENT 'Loại bài viết',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_post`
--

INSERT INTO `db_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `img`, `type`, `status`) VALUES
(1, 6, 'CHÍNH SÁCH GIAO NHẬN HÀNG', 'chinh-sach-giao-nhan-hang', '<h1 class=\"post-title\" style=\"font-size: 26px; margin: 10px 0px; font-family: Roboto, sans-serif; font-weight: bold; line-height: 26px; text-align: center; color: rgb(15, 53, 100); text-transform: uppercase;\">CHÍNH SÁCH GIAO NHẬN HÀNG</h1><div class=\"post-detail-content\" style=\"font-family: Roboto, sans-serif; font-size: 14px; text-align: justify; color: rgb(0, 0, 0);\"><div class=\"mp-product-description-general-v2 mp-gold mp-column-1 mp-column\" id=\"mp-product-description-general-v2\" style=\"margin: 0px; padding: 10px 0px 0px; max-width: 1200px; overflow: hidden;\"><div class=\"mp-column-group\" style=\"color: rgb(85, 85, 85); clear: both; float: left; width: 817.016px; margin-bottom: 10px !important;\"><div class=\"mp-block-item mp-type-normal-feature\"><div class=\"mp-block-description-wrapper\" style=\"float: left; width: 817.016px;\"><div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px;\"><strong class=\"title-box\" style=\"font-size: 15px; font-weight: bold !important;\">PNJ giao hàng hoàn toàn MIỄN PHÍ trên toàn quốc cho tất cả các đơn hàng.</strong></div>&nbsp;<div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px;\"><strong class=\"title-box\" style=\"font-size: 15px; font-weight: bold !important;\">Thời gian giao hàng</strong><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none; color: rgb(70, 70, 70);\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px; color: rgb(85, 85, 85);\">Giao hàng nhanh miễn phí trên Toàn Quốc. Thời gian dự kiến sẽ thể hiện cụ thể trong quá trình đặt hàng dựa vào khoảng cách từ nhà khách đến cửa hàng gần nhất có hàng</li></ul><div align=\"center\" class=\"table\" style=\"overflow-x: auto; margin: auto; color: rgb(85, 85, 85);\"><table style=\"border-spacing: 0px; border: 1px solid rgba(0, 51, 104, 0.4);\"><tbody><tr><th style=\"font-weight: 400; border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgb(255, 255, 255); border-image: initial; text-align: center; background: rgb(15, 53, 100); vertical-align: middle; text-wrap: nowrap; padding: 3px; line-height: 1.4 !important;\">Khoảng cách&nbsp;</th><th style=\"font-weight: 400; border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgb(255, 255, 255); border-left: 1px solid rgb(255, 255, 255); border-top-color: rgb(255, 255, 255); border-image: initial; text-align: center; background: rgb(15, 53, 100); vertical-align: middle; text-wrap: nowrap; padding: 3px; line-height: 1.4 !important;\">Thời gian giao hàng</th></tr><tr><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Dưới 20km HCM, HN</td><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Giao trong ngày hoặc ngày kế tiếp</td></tr><tr><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Dưới 20km Tỉnh thành khác</td><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Giao trong 1-3 ngày</td></tr><tr><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Trên 20km</td><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Giao trong 2-7 ngày</td></tr></tbody></table></div><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none; color: rgb(70, 70, 70);\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px; color: rgb(85, 85, 85);\">Giao hàng siêu tốc 3 giờ áp dụng một số sản phẩm tại nội thành các TPHCM, Hà Nội, Đà Nẵng, Hải Phòng, Bắc Ninh, Thủ Dầu Một, Dĩ An, Thuận An, Biên Hòa, Bà Rịa, Vũng Tàu.</li></ul><div align=\"center\" class=\"table\" style=\"overflow-x: auto; margin: auto; color: rgb(85, 85, 85);\"><table style=\"border-spacing: 0px; border: 1px solid rgba(0, 51, 104, 0.4);\"><tbody><tr><th style=\"font-weight: 400; border-right: 1px solid rgb(255, 255, 255); border-bottom: 1px solid rgb(255, 255, 255); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgb(255, 255, 255); border-image: initial; text-align: center; background: rgb(15, 53, 100); vertical-align: middle; text-wrap: nowrap; padding: 3px; line-height: 1.4 !important;\">Thời gian xác nhận đơn hàng</th><th style=\"font-weight: 400; border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgb(255, 255, 255); border-left: 1px solid rgb(255, 255, 255); border-top-color: rgb(255, 255, 255); border-image: initial; text-align: center; background: rgb(15, 53, 100); vertical-align: middle; text-wrap: nowrap; padding: 3px; line-height: 1.4 !important;\">Thời gian giao hàng</th></tr><tr><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">00:00 - 08:59</td><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Trước 12:00 cùng&nbsp;</td></tr><tr><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">09:00 - 16:00</td><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Trong vòng 3 giờ</td></tr><tr><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">16:01 - 23:59</td><td style=\"border-right: 1px solid rgba(0, 51, 104, 0.4); border-bottom: 1px solid rgba(0, 51, 104, 0.4); border-left: 1px solid rgba(0, 51, 104, 0.4); border-top-color: rgba(0, 51, 104, 0.4); border-image: initial; padding: 3px; vertical-align: middle; text-align: center; line-height: 1.4 !important;\">Trước 12:00 ngày kế tiếp</td></tr></tbody></table></div><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none; color: rgb(70, 70, 70);\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px; color: rgb(85, 85, 85);\">Thời gian giao hàng được bắt đầu tính từ tư vấn viên PNJ xác nhận đơn hàng với khách hàng thành công</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px; color: rgb(85, 85, 85);\">Riêng với khu vực đang phong tỏa do Covid-19, thời gian giao hàng bắt đầu từ khi PNJ được phép lưu thông hàng hóa.</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px; color: rgb(85, 85, 85);\">Thời gian giao hàng trên chỉ mang tính chất tham khảo, thực tế có thể dao động sớm hoặc muộn hơn tùy theo tình trạng tồn kho sản phẩm, địa chỉ giao hàng và một số điều kiện khách quan mà PNJ không thể kiểm soát được (Ví dụ: thiên tai, lũ lụt, hỏng hóc phương tiện...).</li></ul></div>&nbsp;<div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px; color: rgb(70, 70, 70);\"><strong class=\"title-box\" style=\"font-size: 15px; color: rgb(85, 85, 85); font-weight: bold !important;\">Chính sách xem và kiểm tra hàng hóa trước khi nhận hàng:</strong><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none; color: rgb(85, 85, 85);\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Nhằm đáp ứng nhu cầu và bảo vệ tối đa quyền lợi khách hàng khi sử dụng dịch vụ của PNJ. PNJ đã triển khai chính sách hỗ trợ việc xem và kiểm tra hàng hóa khi giao hàng.</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\"><strong class=\"title-box\" style=\"font-size: 15px; font-weight: bold !important;\">Khách hàng khi nhận hàng từ nhân viên vận chuyển: vui lòng kiểm tra hộp hàng còn nguyên vẹn 02 tem niêm phong PNJ, khách hàng có thể mở hàng để kiểm tra hàng hóa bên trong hộp hàng. Khuyến khích khách hàng quay lại Video trong suốt quá trình kiểm tra hàng để những vấn đề phát sinh được dễ dàng xử lý</strong></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">PNJ đảm bảo sản phẩm gửi đến khách hàng đã được kiểm tra chất lượng. Trong trường hợp hiếm hoi sản phẩm khách hàng nhận được có khiếm khuyết, hư hỏng hoặc không như mô tả, PNJ cam kết bảo vệ khách hàng bằng chính sách đổi trả và bảo hành tại:&nbsp;<a href=\"https://www.pnj.com.vn/chinh-sach-bao-hanh-va-thu-doi.html\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 15px; color: rgb(40, 116, 240); outline: none; cursor: pointer; transition: all 150ms ease 0s;\">https://www.pnj.com.vn/chinh-sach-bao-hanh-va-thu-doi.html</a></li></ul></div>&nbsp;<div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px;\"><strong class=\"title-box\" style=\"font-size: 15px; font-weight: bold !important;\">Dịch vụ thanh toán khi nhận hàng (COD) trên Toàn Quốc</strong><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Khách hàng có thể thanh toán tiền mặt dễ dàng khi thật sự hài lòng với sản phẩm và chất lượng dịch vụ của PNJ.</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">PNJ sẽ không tính bất kỳ khoản phí nào cho đến khi khách hàng hoàn toàn đồng ý.</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Xem các hình thưc thanh toán khác tại:&nbsp;<a href=\"https://www.pnj.com.vn/huong-dan-thanh-toan.html\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 15px; color: rgb(0, 36, 72); outline: none; cursor: pointer; transition: all 150ms ease 0s;\">https://www.pnj.com.vn/huong-dan-thanh-toan.html</a></li></ul></div>&nbsp;<div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px;\"><strong class=\"title-box\" style=\"font-size: 15px; font-weight: bold !important;\">Dịch vụ Bảo hiểm hàng hóa và giao hàng bảo đảm 100%</strong><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Để bảo vệ quyền lợi của Khách hàng khi mua trang sức giá trị cao, toàn bộ sản phẩm của PNJ thông qua đối tác vận chuyển đều được PNJ mua bảo hiểm hàng hoá</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Luôn cam kết đền bù 100% giá trị hàng hóa trong trường hợp thất lạc.</li></ul></div>&nbsp;<div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px;\"><strong class=\"title-box\" style=\"font-size: 15px; font-weight: bold !important;\">Quy cách đóng gói hàng hóa tại PNJ</strong><ul class=\"content-listct\" style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Toàn bộ sản phẩm PNJ đã được kiểm tra chất lượng trước khi đóng gói niêm phong 2 lớp.</li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Lớp 1: Sản phẩm của quý khách được đặt vào hộp trang sức PNJ và được niêm phong lớp 1 bằng&nbsp;<strong style=\"font-size: 15px; font-weight: bold !important;\">Tem</strong>&nbsp;PNJ.</li></ul><div class=\"mp-images\" style=\"margin: auto; text-align: center; max-width: 70%;\"><img alt=\"\" src=\"https://cdn.pnj.io/images/tin-tuc/2019/11quy-cach-dong-goi-hang-hoa-new.png?1577244895828\" style=\"border: 0px; max-width: 70%; height: auto; font-size: 0px; margin: auto; display: block;\"></div><ul style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none;\"></ul><ul style=\"padding: 0px 0px 0px 20px; margin: 10px 10px 10px 20px; list-style: none;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; position: relative; line-height: 20px;\">Lớp 2: Hộp vận chuyển sẽ được gói kín, niêm phong bằng&nbsp;<strong style=\"font-size: 15px; font-weight: bold !important;\">02 Tem PNJ</strong>&nbsp;ở giữa mỗi nắp hộp và dán băng keo thương hiệu PNJ xung quanh thành hộp.</li></ul><div class=\"mp-images\" style=\"margin: auto; text-align: center; max-width: 70%;\"><img alt=\"\" src=\"https://cdn.pnj.io/images/ho-tro-khach-hang/phuong-thuc-van-chuyen/2021_hinh_hop_dong_goi_10.png\" style=\"border: 0px; max-width: 70%; height: auto; font-size: 0px; margin: auto; display: block;\"></div><div class=\"mp-images\" style=\"margin: auto; text-align: center; max-width: 70%;\"></div><div class=\"mp-images\" style=\"margin: auto; text-align: center; max-width: 70%;\"><img alt=\"\" src=\"https://cdn.pnj.io/images/ho-tro-khach-hang/phuong-thuc-van-chuyen/2021_hinh_hop_dong_goi_11.png\" style=\"border: 0px; max-width: 70%; height: auto; font-size: 0px; margin: auto; display: block;\"></div><div class=\"pnj-block-description\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; font-size: 15px; line-height: 25px; text-align: left; background: transparent;\"><em style=\"font-size: 14px;\">* Khi kiểm tra hàng , quý khách nên&nbsp;<strong style=\"font-size: 15px; font-weight: bold !important;\">Quay lại Video</strong>&nbsp;để những vấn đề phát sinh được dễ dang xử lý.</em></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; font-size: 15px; line-height: 25px; text-align: left; background: transparent;\"><em style=\"font-size: 14px;\">* Tất cả các sản phẩm trang sức Vàng sẽ được dán niêm phong bằng&nbsp;<strong style=\"font-size: 15px; font-weight: bold !important;\">Tem vỡ*</strong></em></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; font-size: 15px; line-height: 25px; text-align: left; background: transparent;\"><em style=\"font-size: 14px;\">*Tem vỡ: là một loại tem đặc biệt dùng để dán lên các sản phẩm nhằm mục đích đảm bảo hàng hóa chưa bị bóc niêm phong. Đặc điểm của nó khá giòn, khi dán tem lên sản phẩm sẽ ko thể bóc ra, nếu cố tình bóc thì tem sẽ vỡ vụn ra.</em></p></div></div>&nbsp;<div class=\"content-box-outer\" style=\"background: rgb(249, 249, 249); border: 1px solid rgb(235, 235, 235); border-radius: 5px; padding: 10px 20px; margin: 0px 0px 20px; display: inline-block; width: 817.016px;\"><div class=\"pnj-block-description\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; font-size: 15px; line-height: 25px; text-align: left; background: transparent;\"><strong style=\"font-weight: bold !important;\">Tư vấn và hỗ trợ miễn phí qua Hotline 1800545457.</strong></p></div><div class=\"pnj-block-description\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; font-size: 15px; line-height: 25px; text-align: left; background: transparent;\"><strong style=\"font-weight: bold !important;\">Phục vụ liên tục từ 8h sáng đến 8h tối hằng ngày.</strong></p></div></div></div></div></div></div></div>', 'chinh-sach-giao-nhan-hang.png', 'post', 1);
INSERT INTO `db_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `img`, `type`, `status`) VALUES
(2, 6, 'HƯỚNG DẪN ĐO SIZE TRANG SỨC', 'huong-dan-do-size-trang-suc', '<div class=\"question expanded\" style=\"font-family: Roboto, sans-serif; font-size: 14px; background: rgb(189, 142, 38); cursor: pointer; position: relative; line-height: 25px; max-width: 100%; padding: 6px 0px; color: rgb(0, 0, 0); text-align: justify;\"><h2 style=\"font-family: Roboto, sans-serif; font-size: 16px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(255, 255, 255); padding: 5px 10px; text-transform: uppercase; line-height: 25px; max-width: 100%;\">HƯỚNG DẪN ĐO SIZE NHẪN</h2></div><div class=\"answer\" style=\"font-family: Roboto, sans-serif; font-size: 14px; display: inline-block; padding: 6px 0px; line-height: 25px; max-width: 100%; color: rgb(0, 0, 0); text-align: justify;\"><div class=\"guide-ring-outer\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"guide-introduce\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><h2 style=\"font-family: Roboto, sans-serif; font-size: 18px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 25px; max-width: 100%;\">HƯỚNG DẪN CÁCH ĐO SIZE, KÍCH CỠ NHẪN</h2><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; font-size: 15px; background: transparent; line-height: 25px; max-width: 100%;\">PNJ sẽ hướng dẫn bạn cách đo kích thước nhẫn tại nhà &amp; cách bí mật đo nhẫn để tạo bất ngờ cho món quà dành tặng người thân, nhất là đối với những thời khắc đặc biệt trong đời.&nbsp;Với những bí quyết trong bài, bạn có thể dễ dàng mua sắm nhẫn vàng, nhẫn bạc, nhẫn cưới, nhẫn kim cương hay nhẫn đôi ngay trên online mà không còn gì phải lo ngại.</p></div><div class=\"main-index\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><h4 style=\"font-family: Roboto, sans-serif; font-size: 15px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 25px; max-width: 100%;\">Mục lục:</h4><ol class=\"style-parent\" style=\"padding: 0px 0px 0px 15px; line-height: 25px; max-width: 100%;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-a\" style=\"line-height: 25px; max-width: 100%;\">BẢNG SIZE NHẪN PNJ</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-b\" style=\"line-height: 25px; max-width: 100%;\">NHỮNG CÁCH ĐƠN GIẢN NHẤT ĐỂ ĐO SIZE NHẪN.</span><ol class=\"style-child\" style=\"padding: 0px 0px 0px 15px; line-height: 25px; max-width: 100%;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-b-1\" style=\"line-height: 25px; max-width: 100%;\">Đo bằng tờ giấy &amp; thước.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-b-2\" style=\"line-height: 25px; max-width: 100%;\">Đo theo 1 chiếc nhẫn có sẵn.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-b-3\" style=\"line-height: 25px; max-width: 100%;\">Tới trực tiếp cửa hàng để được tư vấn.</span></li></ol></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-c\" style=\"line-height: 25px; max-width: 100%;\">NHỮNG LƯU Ý KHI ĐO.</span><ol class=\"style-child\" style=\"padding: 0px 0px 0px 15px; line-height: 25px; max-width: 100%;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-c-1\" style=\"line-height: 25px; max-width: 100%;\">Kích cỡ ngón tay phụ thuộc nhiệt độ.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-c-2\" style=\"line-height: 25px; max-width: 100%;\">Chú ý độ dày của nhẫn.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-c-3\" style=\"line-height: 25px; max-width: 100%;\">Để ý những khớp tay.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-c-4\" style=\"line-height: 25px; max-width: 100%;\">Đo lại nhiều lần để có số liệu chính xác nhất.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-c-5\" style=\"line-height: 25px; max-width: 100%;\">Size nhẫn nam và nữ có khác nhau không?</span></li></ol></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-d\" style=\"line-height: 25px; max-width: 100%;\">NHỮNG MẸO ĐO SIZE NHẪN BÍ MẬT.</span><ol class=\"style-child\" style=\"padding: 0px 0px 0px 15px; line-height: 25px; max-width: 100%;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-d-1\" style=\"line-height: 25px; max-width: 100%;\">Mượn nhẫn của người mình muốn tặng.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-d-2\" style=\"line-height: 25px; max-width: 100%;\">Nhờ người thân.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-d-3\" style=\"line-height: 25px; max-width: 100%;\">Quan sát và ước lượng.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-d-4\" style=\"line-height: 25px; max-width: 100%;\">Giả vờ nhờ người ấy thử nhẫn để giúp bạn mua tặng người khác.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-d-5\" style=\"line-height: 25px; max-width: 100%;\">Bí mật đo một cách tự nhiên.</span></li></ol></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span id=\"ml-e\" style=\"line-height: 25px; max-width: 100%;\">CHÍNH SÁCH CHỈNH LẠI SIZE NHẪN PNJ</span></li></ol></div><div class=\"main-title-parent\" id=\"to-ml-a\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\">A. BẢNG SIZE NHẪN PNJ</div><div class=\"table-size\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><img alt=\"Bảng size nhẫn PNJ\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/a_bang_sizen_nhan.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div><div class=\"main-title-parent\" id=\"to-ml-b\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\">B. NHỮNG CÁCH ĐƠN GIẢN NHẤT ĐỂ ĐO SIZE NHẪN</div><div class=\"main-title-child\" id=\"to-ml-b-1\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><span style=\"line-height: 25px; max-width: 100%;\"><label style=\"font-weight: 300; line-height: 25px; max-width: 100%;\">1</label>&nbsp;<label style=\"font-weight: 300; line-height: 25px; max-width: 100%;\">Đo bằng tờ giấy &amp; thước</label></span></div><div class=\"four-steps\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"step-1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">Bước 1:</span>&nbsp;Chuẩn bị một cây thước, 1 cây kéo, 1 cây bút &amp; một tờ giấy</p><div class=\"step-has-img\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">Bước 2:</span>&nbsp;Cắt một mảnh giấy dài khoảng 10 cm và rộng 1 cm.</p><img alt=\"Bước 2: Cắt một mảnh giấy dài khoảng 10 cm và rộng 1 cm.\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/step-b1.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">Bước 3:</span>&nbsp;Sử dụng đoạn giấy vừa cắt để quấn sát quanh ngón tay muốn đo.</p><img alt=\"Bước 3: Sử dụng đoạn giấy vừa cắt để quấn sát quanh ngón tay muốn đo.\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/step-b2.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">Bước 4:</span>&nbsp;Đánh dấu điểm giao nhau.</p><img alt=\"Bước 4: Đánh dấu điểm giao nhau..\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/step-b3.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">Bước 5:</span>&nbsp;Tháo ra dùng thước đo chiều dài của đoạn giấy từ điểm đầu cho đến phần đánh dấu. Lấy kết quả đo được chia cho 3,14. Sau đó đối chiếu với&nbsp;<span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">BẢNG SIZE NHẪN</span></p><img alt=\"Bước 5: Tháo ra dùng thước đo chiều dài của đoạn giấy từ điểm đầu cho đến phần đánh dấu. Lấy kết quả đo được chia cho 3,14. Sau đó đối chiếu với BẢNG SIZE NHẪN\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/step-b4.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div></div></div><div class=\"main-title-child\" id=\"to-ml-b-2\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><span style=\"line-height: 25px; max-width: 100%;\"><label style=\"font-weight: 300; line-height: 25px; max-width: 100%;\">2</label>&nbsp;<label style=\"font-weight: 300; line-height: 25px; max-width: 100%;\">Đo theo một chiếc nhẫn có sẵn</label></span></div><div class=\"guide-ml-b2\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Bước 1: Chuẩn bị một cây thước cùng chiếc nhẫn muốn đo</p><img alt=\"Bước 1: Chuẩn bị một cây thước cùng chiếc nhẫn muốn đo \" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/do_1.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Bước 2: Chuẩn bị một cây thước cùng chiếc nhẫn muốn đo</p><img alt=\"Bước 1: Chuẩn bị một cây thước cùng chiếc nhẫn muốn đo \" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/do_2.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Bước 3: Đối chiếu số mm của thước với kích trên&nbsp;<span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">BẢNG SIZE NHẪN</span>&nbsp;bên trên.</p><img alt=\"Bước 3: Đối chiếu số mm của thước với kích trên BẢNG SIZE NHẪN bên trên. \" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/do_3.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"><p class=\"example\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\">Ví dụ:&nbsp;</span>Đường kính nhẫn 17mm tương ứng size 12</p></div></div><div class=\"main-title-child\" id=\"to-ml-b-3\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><span style=\"line-height: 25px; max-width: 100%;\"><label style=\"font-weight: 300; line-height: 25px; max-width: 100%;\">3</label>&nbsp;<label style=\"font-weight: 300; line-height: 25px; max-width: 100%;\">Tới cửa hàng để được tư vấn trực tiếp</label></span></div><div class=\"content-ml-b-3\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><img alt=\"Tới cửa hàng để được tư vấn trực tiếp\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/ra_cua_hang.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Để có số đo chính xác nhất, bạn có thể đến&nbsp;<a href=\"https://www.pnj.com.vn/ho-tro-mua-hang/he-thong-cua-hang/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(77, 77, 77); outline: none; cursor: pointer; transition: all 150ms ease 0s; line-height: 25px; max-width: 100%;\">hệ thống cửa hàng PNJ</a>&nbsp;chúng tôi để đo trực tiếp size nhẫn. Nếu mua tặng các loại nhẫn như nhẫn cưới, nhẫn vàng hay nhẫn kiểu cho người khác, bạn cũng có thể áp dụng một số mẹo đo size nhẫn mà PNJ gợi ý ở phần sau của bài viết.</p></div><div class=\"main-title-parent\" id=\"to-ml-c\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\">C. NHỮNG LƯU Ý KHI ĐO</div><div class=\"content-ml-c style-steps\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"item\" id=\"to-ml-c-1\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">1</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">KÍCH CỠ NGÓN TAY PHỤ THUỘC NHIỆT ĐỘ</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Nhiệt độ là nguyên nhân gây ra việc đo kích thước nhẫn không chính xác. Khi thời tiết lạnh ngón tay của bạn có thể nhỏ hơn bình thường, bạn nên cộng thêm cho chu vi là 1 mm còn khi thời tiết nóng thì ngược lại, trừ đi 1 mm. Trường hợp xương khớp ngón tay của bạn to, thì bạn nên đo chu vi ở gần khớp (không phải trên khớp) Sao cho khi đeo nhẫn dễ vào nhưng không bị tuột mất.</p></div><div class=\"item\" id=\"to-ml-c-2\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">2</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">CHÚ Ý ĐỘ DÀY CỦA NHẪN PNJ</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Độ dày của nhẫn cũng ảnh hưởng đến size ni của mỗi người. Đối với các loại nhẫn như&nbsp;<u style=\"line-height: 25px; max-width: 100%;\"><a href=\"https://www.pnj.com.vn/nhan/nhan-vang/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(77, 77, 77); outline: none; cursor: pointer; transition: all 150ms ease 0s; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%; color: rgb(0, 0, 255);\">nhẫn vàng</span></a></u>,&nbsp;<u style=\"line-height: 25px; max-width: 100%;\"><a href=\"https://www.pnj.com.vn/nhan/nhan-bac/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(77, 77, 77); outline: none; cursor: pointer; transition: all 150ms ease 0s; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%; color: rgb(0, 0, 255);\">nhẫn bạc</span></a></u>&nbsp;đặc biệt là&nbsp;<u style=\"line-height: 25px; max-width: 100%;\"><a href=\"https://www.pnj.com.vn/trang-suc-cuoi/nhan/\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(77, 77, 77); outline: none; cursor: pointer; transition: all 150ms ease 0s; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%; color: rgb(0, 0, 255);\">nhẫn cưới</span></a></u>&nbsp;của PNJ, độ dày sẽ khác nhau. Do đó, khi tiến hành đo, bạn cần phải chú ý và cho kích thước thêm hoặc bớt đi một khoản để khi đeo nhẫn có thể thoải mái mà không bị gò bó.</p><p class=\"img\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><img alt=\"CHÚ Ý ĐỘ DÀY CỦA NHẪN PNJ \" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/do_day_nhan.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></p></div><div class=\"item\" id=\"to-ml-c-3\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">3</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">ĐỂ Ý NHỮNG KHỚP TAY</span></p><div class=\"gird-content\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Các khớp tay có thể to hơn so với ở phía gốc của ngón. Do đó bạn cần phải đo kích thước ở khớp ngón và gốc ngón, sau đó lấy kích thước giữa 2 phần để chọn size nhẫn phù hợp. Lúc này tay đeo nhẫn của bạn sẽ có cảm giác thoải mái và không bị khó chịu khi co hoặc gập ngón tay.<br style=\"line-height: 25px; max-width: 100%;\">Trong trường hợp khớp xương ngón tay của bạn to, bạn nên đo chu vi ở gần khớp (không phải trên khớp) sao cho khi bạn đeo nhẫn thì nhẫn dễ vào và không bị tuột mất.</p><p class=\"img\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><img alt=\"ĐỂ Ý NHỮNG KHỚP TAY \" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/khop_tay.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></p></div></div><div class=\"item\" id=\"to-ml-c-4\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">4</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">ĐO LẠI NHIỀU LẦN ĐỂ CÓ SỐ LIỆU CHÍNH XÁC NHẤT</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Khi đo size tay chắc chắn sẽ có những sai sót, vì vậy hãy cẩn thận đo từ 3-4 lần để tìm ra số đo chính xác nhất. Làm theo cách này, kích cỡ bạn đo được sẽ có độ chính xác cao từ 85-95%.</p></div><div class=\"item\" id=\"to-ml-c-5\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">5</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">SIZE&nbsp;<span style=\"font-size: 16px; line-height: 25px; max-width: 100%;\"><u style=\"line-height: 25px; max-width: 100%;\"><a href=\"https://www.pnj.com.vn/nhan/nhan-vang/?features_hash=43-19702\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; color: rgb(77, 77, 77); outline: none; cursor: pointer; transition: all 150ms ease 0s; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%; color: rgb(0, 0, 255);\">NHẪN NAM</span></a></u></span>&nbsp;VÀ NỮ CÓ KHÁC NHAU KHÔNG?</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Với nam và nữ thì kích thước tay sẽ khác nhau nhưng đối với kích thước ngón tay thì tương đối giống nhau. Do đó, bạn có thể thực hiện việc đo size nhẫn tương tự như của nữ. Đối với nhẫn cưới, nhẫn kiểu hoặc nhẫn bạc vẫn có thể áp dụng theo cách này.</p></div></div><div class=\"main-title-parent\" id=\"to-ml-d\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\">D. NHỮNG MẸO ĐO SIZE NHẪN BÍ MẬT</div><div class=\"content-ml-d style-steps\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"item\" id=\"to-ml-d-1\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">1</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">MƯỢN NHẪN CỦA NGƯỜI MÌNH MUỐN TẶNG</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Các chàng trai có thể bí mật đo kích cỡ bằng cách giả vờ mượn những chiếc nhẫn của người ấy (nhẫn thường, nhẫn kiểu hay&nbsp;<u style=\"line-height: 25px; max-width: 100%;\"><a href=\"https://www.pnj.com.vn/trang-suc-bac/?features_hash=55-19666\" style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(77, 77, 77); outline: none; cursor: pointer; transition: all 150ms ease 0s; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%; color: rgb(0, 0, 255);\">nhẫn đôi</span></a></u>&nbsp;đều được), sau đó dùng thước kẻ đo đường kính chu vi phía trong của chiếc nhẫn như hướng dẫn phía trên</p></div><div class=\"item\" id=\"to-ml-d-2\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">2</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">NHỜ NGƯỜI THÂN</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Cách đơn giản nhất để biết được size nhẫn của người yêu mà không để nàng phát hiện hay nghi ngờ là nhờ sự trợ giúp từ người thân, có thể là mẹ, chị em gái hoặc là bạn bè. Họ có thể giúp bạn lấy thông tin này một cách tự nhiên và dễ dàng thông qua việc hỏi và nhờ thử giúp những chiếc nhẫn vàng hay nhẫn bạc.</p></div><div class=\"item\" id=\"to-ml-d-3\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">3</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">QUAN SÁT VÀ ƯỚC LƯỢNG</span></p><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Với những ai không biết đo hoặc lý do nào đó chưa đo được thì có thể áng chừng size tay đeo nhẫn qua chiều cao cân nặng theo bảng bên dưới:</p><p class=\"table-size\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Nam</span>&nbsp;<span style=\"line-height: 25px; max-width: 100%;\"><i class=\"ring-sprite for-man\" style=\"line-height: 25px; max-width: 100%;\"></i></span></span><span class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%;\"><img alt=\"Nam\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/for_man.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></span></p><p class=\"table-size\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Nữ</span>&nbsp;<span style=\"line-height: 25px; max-width: 100%;\"><i class=\"ring-sprite for-women\" style=\"line-height: 25px; max-width: 100%;\"></i></span></span><span class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%;\"><img alt=\"Nữ\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/for_women.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></span></p></div><div class=\"item\" id=\"to-ml-d-4\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">4</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">GIẢ VỜ NHỜ NGƯỜI ẤY THỬ NHẪN ĐỂ GIÚP BẠN MUA TẶNG NGƯỜI KHÁC.</span></p><div class=\"gird-content\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"content\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Đối với cách này, bạn cần phải khéo léo nhờ người ấy giúp bạn thử nhẫn, có thể là nhẫn kiểu đẹp hoặc nhẫn vàng mua tặng cho mẹ hoặc chị gái. Đồng thời, bạn cũng cần phải quan sát và chú ý đến kích cỡ ngón tay của người ấy để bạn có thể dễ dàng mua được nhẫn đôi hoặc nhẫn cưới thích hợp.</p><p class=\"img\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><img alt=\"GIẢ VỜ NHỜ NGƯỜI ẤY THỬ NHẪN ĐỂ GIÚP BẠN MUA TẶNG NGƯỜI KHÁC.\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/thu_nhan.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></p></div></div><div class=\"item\" id=\"to-ml-d-5\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"head\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span class=\"number\" style=\"line-height: 25px; max-width: 100%;\">5</span>&nbsp;<span class=\"text\" style=\"line-height: 25px; max-width: 100%;\">BÍ MẬT ĐO MỘT CÁCH TỰ NHIÊN.</span></p><div class=\"content\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Nếu những cách trên vẫn chưa hiệu quả, bạn có thể thử:</p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; line-height: 25px; max-width: 100%;\"><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\"><i class=\"ring-sprite icon-stick\" style=\"line-height: 25px; max-width: 100%;\"></i><lable style=\"line-height: 25px; max-width: 100%;\">ĐO TAY KHI NGƯỜI ẤY ĐANG NGỦ</lable></span>&nbsp;<span style=\"line-height: 25px; max-width: 100%;\">Ngoài ra, bạn có thể tiến hành cách này, khi cô ấy ngủ, bạn sử dụng dụng cụ dây hoặc sợi chỉ để đo ngón tay. Nếu cô ấy thức giấc, bạn cần phải bình tĩnh và nói rằng bạn đang vuốt ve tay của cô ấy để tránh sự nghi ngờ.</span></li><li style=\"margin: 0px; padding: 2px 0px; list-style: none; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\"><i class=\"ring-sprite icon-stick\" style=\"line-height: 25px; max-width: 100%;\"></i><lable style=\"line-height: 25px; max-width: 100%;\">SO SÁNH NGÓN TAY CỦA MÌNH VỚI NGƯỜI ẤY</lable>&nbsp;</span><span style=\"line-height: 25px; max-width: 100%;\">Đối với cách này, bạn cần phải có sự quan sát kỹ và cẩn thận đến khớp và phía dưới gốc ngón tay có kích cỡ như thế nào so với ngón tay tương tự của mình để tìm ra size nhẫn chính xác nhất.</span></li></ul></div></div></div><div class=\"block-products-rings-outer\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\">&nbsp;E. CHÍNH SÁCH CHỈNH SỬA SIZE NHẪN PNJ</div><div class=\"to-ml-e\" id=\"to-ml-e\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"item-inner\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Theo như chính sách của PNJ, khi nhẫn PNJ có số đo size chật hoặc rộng hơn khoảng 1 size thì đội ngũ kỹ thuật của PNJ sẽ giúp quý khách hàng chỉnh sửa lại theo đúng kích thước của bạn hoàn toàn miễn phí.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Đối với các sản phẩm nhẫn có size chật hoặc rộng hơn từ 2 size trở lên, PNJ sẽ hỗ trợ quý khách hàng đổi sang sản phẩm có size phù hợp.</p></div></div><div class=\"item\" style=\"margin: 0px 0px 5px; line-height: 25px; max-width: 100%; padding: 6px 0px;\"><img alt=\"GIẢ VỜ NHỜ NGƯỜI ẤY THỬ NHẪN ĐỂ GIÚP BẠN MUA TẶNG NGƯỜI KHÁC.\" class=\"img-lazyload\" data-src=\"\" src=\"https://www.pnj.com.vn/images/image-update/2020/guide_size_ring/v1-mucluc-e.jpg\" style=\"border: 0px; max-width: 100%; height: auto; font-size: 0px; line-height: 25px; opacity: 1;\"></div></div></div></div>', 'huong-dan-do-size-trang-suc.png', 'post', 0),
(3, 6, 'HƯỚNG DẪN SỬ DỤNG TRANG SỨC', 'huong-dan-su-dung-trang-suc', '<div class=\"post-detail-content\" style=\"font-family: Roboto, sans-serif; font-size: 14px; text-align: justify; color: rgb(0, 0, 0);\"><div class=\"pages-pnj\" style=\"line-height: 1.42857;\"><div class=\"std\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"question expanded\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><h2 style=\"font-family: Roboto, sans-serif; font-size: 18px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 25px; max-width: 100%; color: rgb(255, 255, 255); padding: 5px 10px; text-align: center;\"><span style=\"font-size: x-large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\"><span style=\"font-weight: 600; font-size: 18px; line-height: 25px; max-width: 100%;\">Bảo quản trang sức</span></span></h2></div><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Để duy trì vẻ đẹp của trang sức và tránh bị trầy xước, nên cất giữ sản phẩm riêng cho từng hộp. Trong quá trình sử dụng, hạn chế tối đa các va chạm cũng như có sự tác động trực tiếp lên sản phẩm.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\">Khách hàng nên định kỳ 3- 6 tháng ghé PNJ để được các nhân viên chăm sóc kiểm tra và làm mới sản phẩm hoàn toàn miễn phí, giúp sản phẩm sáng bóng và đẹp hơn.</p></div><div class=\"question expanded\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><h2 style=\"font-family: Roboto, sans-serif; font-size: 18px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 25px; max-width: 100%; color: rgb(255, 255, 255); padding: 5px 10px; text-align: center;\"><span style=\"font-size: x-large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\"><span style=\"font-weight: 600; font-size: 18px; line-height: 25px; max-width: 100%;\">Bảo quản trang sức Vàng</span></span></h2></div><div class=\"answer\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức có gắn ngọc trai</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Do viên ngọc trai được bọc một lớp xà cừ là chất hữu cơ nên khi sử dụng bạn nên tránh không để tiếp xúc với các loại nước hoa, sữa dưỡng da, nước lau sơn móng tay, các loại keo xịt tóc, chanh, giấm, … và các loại chất tẩy hoặc hóa chất dễ bay hơi khác. Vì nếu tiếp xúc với các chất này viên ngọc trai sẽ bị bào mòn dần. Tốt nhất trong thời gian sử dụng, bạn nên ngâm rửa bằng nước ấm (không nên dùng bàn chải) sau đó lau nhẹ bằng vải mềm cotton thì viên ngọc trai sẽ bóng đẹp tự nhiên.</span></p></div></div><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức gắn đá quý / bán quý</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">TRANG SỨC CÓ GẮN CÁC LOẠI ĐÁ QUÝ / BÁN QUÝ NHƯ: RUBY,&nbsp; SAPPHIRE, SPINELL, TOURMALINE, GARNET, PERIDOT, AMETHYST, CITRINE, TOPAZ…</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Khi sử dụng không nên để trang sức đá quý, đá bán quý va chạm vào các vật cứng khác để tránh bị xước hay có tì vết sẽ khiến viên đá không còn đẹp và giảm đi giá trị.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Nên làm sạch các sản phẩm đá quý, đá bán quý bằng bàn chải mềm và nước xà phòng ấm. Để tăng độ sáng bóng cho các loại đá quý và bán quý, bạn có thể lau bằng dầu không màu hoặc sáp ong.</span></p></div></div><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức có gắn đá Emerald, Opal</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Bạn nên bảo quản sản phẩm như các loại đá quý, đá bán quý trên. Tuy nhiên, do đặc tính đặc biệt của các loại đá này là mềm và cần phải lấy ra khỏi ổ hột trong quá trình làm sạch, vì thế khi có nhu cầu làm mới trang sức, quý khách nên đến các cửa hàng của PNJ để món trang sức của mình được chăm sóc hoàn hảo nhất.</span></p></div></div><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức kim cương</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Kim cương không thể bị mài mòn do các tác động bình thường vì nó có độ cứng rất cao nhưng cần phải giữ sạch để có được độ sáng vĩnh viễn. Bạn có thể ngâm trong nước xà phòng ấm khoảng 30 phút sau đó rửa lại bằng nước sạch rồi dùng vải mềm lau khô.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Vì kim cương có độ cứng rất cao nên nữ trang kim cương nên được bảo quản riêng biệt khỏi các đồ trang sức khác để tránh trầy xước.</span></p></div></div><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức vàng trắng</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Vàng trắng có màu trắng ngà nên khi được gia công thành trang sức thường phải phủ lên bề mặt một chất có tên là Rhodium để tạo nên màu trắng sáng giống như Platinum.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Vàng trắng khi sử dụng dưới tác động của nhiều yếu tố như thời gian, mồ hôi và cả tính chất của vàng trắng nên có thể bị ngả màu, vì vậy để trang sức vàng trắng luôn sáng đẹp cứ khoảng từ 4 đến 6 tháng, bạn nên mang sản phẩm đến hệ thống PNJ để làm mới.</span></p></div></div><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức vàng</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Khi sử dụng nữ trang bằng vàng, bạn cần lưu ý:</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Không nên để vàng tiếp xúc với thủy ngân, thuốc uốn tóc, nhuộm tóc và một số loại mỹ phẩm vì các chất này sẽ làm cho vàng bị ngả màu.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Để vàng luôn sáng đẹp, mỗi tuần nên dùng bàn chải đánh răng loại mềm nhúng vào xà phòng hoặc kem đánh răng chải rửa trong và ngoài món nữ trang để tẩy đi bụi bẩn và mồ hôi bám vào. Khi nữ trang bị ướt thì không nên để nữ trang tự khô mà phải dùng vải thun cotton hoặc giấy mềm lau khô.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Qua thời gian dài sử dụng, các món nữ trang có thể giảm đi độ sáng bóng, màu vàng bị nhạt, mờ. Để trở về trạng thái sáng bóng ban đầu chỉ có cách duy nhất là làm sạch, xi mới, đánh bóng bằng những dụng cụ chuyên ngành nữ trang. Tất cả các cửa hàng PNJ đều có dịch vụ đánh bóng, siêu âm làm sạch miễn phí vĩnh viễn cho các sản phẩm PNJ, riêng với dịch vụ xi mới, sản phẩm nhẫn cưới đươc miễn phí, còn các dòng sản phẩm khác khách hàng sẽ trả 1 mức phí hợp lý tùy theo chủng loại sản phẩm.</span></p><div class=\"question expanded\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><h2 style=\"font-family: Roboto, sans-serif; font-size: 18px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 25px; max-width: 100%; color: rgb(255, 255, 255); padding: 5px 10px; text-align: center;\"><span style=\"font-size: x-large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\"><span style=\"font-weight: 600; font-size: 18px; line-height: 25px; max-width: 100%;\">Bảo quản trang sức Bạc</span></span></h2></div><div class=\"answer\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><div class=\"qitem\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p class=\"name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"font-weight: 600; line-height: 25px; max-width: 100%;\"><span style=\"font-size: large; line-height: 25px; max-width: 100%; color: rgb(153, 51, 0);\">Trang sức bạc PNJSilver</span></span></p><div class=\"desc\" style=\"line-height: 25px; max-width: 100%; padding: 6px 0px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Trang sức bạc đeo lâu ngày có thể bị mờ đi. Bạc bị oxy hóa khi tiếp xúc với không khí, ánh sáng mạnh&nbsp; và các hóa chất như keo xịt tóc, nước hoa, thuốc tẩy, nước biển,…</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Để món trang sức bạc luôn sáng đẹp, bạn nên ngâm và rửa nhẹ nhàng trong nước tẩy rửa nhẹ (nước tẩy rửa chén đĩa, ly tách) pha với nước sạch. Sau đó, rửa lại bằng nước sạch và dùng khăn mềm lau khô thật kỹ. Tuyệt đối không sử dụng nước tẩy rửa có tính chất tẩy mạnh.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px; background: transparent; line-height: 25px; max-width: 100%;\"><span style=\"line-height: 25px; max-width: 100%;\">Để đảm bảo và duy trì vẻ đẹp của trang sức bạc, nên cất giữ và khi đeo tránh va chạm hoặc sử dụng bất kì dụng cụ nào tác động trực tiếp đến món trang sức.</span></p></div></div></div></div></div></div></div></div></div><p><span class=\"author\" style=\"font-family: Roboto, sans-serif; font-size: 15px; font-weight: 600; display: inline-block; margin: 10px 0px 20px; text-align: right; width: 817.016px; color: rgb(51, 51, 51);\">Nguồn PNJ</span><br></p>', 'huong-dan-su-dung-trang-suc.png', 'post', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_post_comment`
--

CREATE TABLE `db_post_comment` (
  `id` int(11) NOT NULL COMMENT 'Mã bình luận',
  `post_id` int(11) NOT NULL COMMENT 'Mã bài viết',
  `user_id` int(11) NOT NULL COMMENT 'Mã người dùng',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `detail` text NOT NULL COMMENT 'Nội dung',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_product`
--

CREATE TABLE `db_product` (
  `id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `category_id` int(11) NOT NULL COMMENT 'mã danh mục',
  `brand_id` int(11) NOT NULL COMMENT 'Mã thương hiệu',
  `name` varchar(255) NOT NULL COMMENT 'Tên sảnp hẩm',
  `slug` varchar(255) NOT NULL COMMENT 'mã hoá url',
  `SKU` varchar(255) DEFAULT NULL COMMENT 'Mã SKU',
  `smdetail` mediumtext DEFAULT NULL COMMENT 'Mô tả',
  `detail` longtext DEFAULT NULL COMMENT 'chi tiết',
  `quantity` int(11) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `price` int(11) DEFAULT NULL COMMENT 'Giá',
  `promotion` int(11) DEFAULT NULL COMMENT 'Phần trăm khuyến mãi',
  `material_id` int(11) NOT NULL,
  `trending` int(11) DEFAULT NULL COMMENT 'Sản phẩm nổi bật',
  `view` int(11) DEFAULT 0 COMMENT 'Lượt xem',
  `sold_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Số lượng bán ra',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_product`
--

INSERT INTO `db_product` (`id`, `category_id`, `brand_id`, `name`, `slug`, `SKU`, `smdetail`, `detail`, `quantity`, `price`, `promotion`, `material_id`, `trending`, `view`, `sold_count`, `status`) VALUES
(1, 5, 1, 'Nhẫn Vàng 18K đính đá Citrine PNJ', 'nhan-vang-18k-dinh-da-citrine-pnj', 'PNJNHA001-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Nổi bật với sắc vàng cam nóng bỏng, đá Citrine luôn mang vẻ đẹp rạng rỡ và tỏa sáng khi đeo trên người. Chiếc&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn</b></span></font>&nbsp;được chế tác từ vàng 18K cùng đá Citrine, mang đến món trang sức sang trọng và quý phái cho quý cô. Bên cạnh đó,&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>trang sức Citrine</b></span></font>&nbsp;cũng khá phù hợp với nhiều lứa tuổi khác nhau, và ngự trị trên làn da nào cũng toát lên được vẻ đẹp riêng biệt.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Ngoài ra, Citrine cũng mang nguồn năng lượng từ mặt trời nên nó mang lại sự tích cực cũng như giúp cơ thể tràn đầy sức sống.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">15.04097<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Citrine</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Kích thước đá (tham khảo):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10 x 10 ly</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 100, 13000000, 0, 3, NULL, 11, 0, 1),
(2, 5, 1, 'Nhẫn Vàng 18K đính đá CZ PNJ', 'nhan-vang-18k-dinh-da-cz-pnj', 'PNJNHA002-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Sở hữu thiết kế trẻ trung cộng hưởng cùng ánh kim quý phái của vàng 18K, chiếc&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn PNJ</b></span></font>&nbsp;tôn lên vẻ đẹp hiện đại và thời thượng của các quý cô, giúp nàng trông thật xinh đẹp rạng rỡ khi trưng diện.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Sở hữu thiết kế đủ mềm mại nhưng lại đầy quyền năng, đủ phá cách như cho một sự khác lạ, vừa mang nét hiện đại, trẻ trung bởi sự rành mạch trong đường nét, lại vừa giữ được sự mềm mại, kiêu sa giữa sự ngẫu hứng cùng vàng và đá, chiếc nhẫn&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>CZ</b></span></font>&nbsp;ấn tượng như người phụ nữ trưởng thành với phong cách và con đường riêng để khẳng định bản ngã của chính mình.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">12.3889<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">62<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 81, 8800000, 2, 3, NULL, 6, 0, 1),
(3, 5, 1, 'Nhẫn bạc đính đá STYLE by PNJ', 'nhan-bac-dinh-da-style-by-pnj', 'PNJNHA003-NHA', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\"><div style=\"color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn</span></font>&nbsp;bạc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">STYLE By PNJ</span></font>&nbsp;sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.</p></div><div style=\"color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Với sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.</p></div></span></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9.01363<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9300</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Mother of Pearl</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Màu đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Trắng</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">STYLE BY PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Cabochon</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 30, 795000, 0, 6, NULL, 5, 0, 1),
(4, 5, 1, 'Nhẫn Bạc PNJ STYLE x CHOU CHOU', 'nhan-bac-pnj-style-x-chou-chou', 'PNJNHA004-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Không sở hữu các chi tiết đính đá rực rỡ nhưng lại khoác lên mình thiết kế độc đáo với những đường nét sáng tạo, chiếc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn</span></font>&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>STYLE By PNJ&nbsp;x Chou Chou</b></span></font>&nbsp;sẽ cùng nàng biến hóa đầy cá tính cùng chất riêng của mình.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Khác với trang sức khác, chất liệu bạc 92.5 là lựa chọn thông minh, bền vững với thời gian, giúp các cô gái trẻ thể hiện cá tính cũng như gu thời trang của mình. Khi kết hợp cùng các mẫu trang sức khác, chắc chắn đây sẽ là điểm nhấn hoàn hảo mang đến vẻ đẹp của sự cá tính và thời thượng cho phong cách của nàng.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">5.95815<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9300</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Bộ sưu tập:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">STYLE x CHOU CHOU</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">STYLE BY PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 30, 575000, 10, 6, NULL, 52, 0, 1),
(5, 5, 1, 'Nhẫn cưới Kim cương Vàng 18K PNJ', 'nhan-cuoi-kim-cuong-vang-18k-pnj', 'PNJNHA005-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn</span></font>&nbsp;được chế tác từ vàng 18K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Kim cương đã đẹp,&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">trang sức kim cương</span></font>&nbsp;lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10.03073<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Kim cương</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Kim cương</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">20<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 23, 21999999, 0, 3, NULL, 2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_product_comment`
--

CREATE TABLE `db_product_comment` (
  `id` int(11) NOT NULL COMMENT 'Mã bình luận',
  `product_id` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `user_id` int(11) NOT NULL COMMENT 'Mã người dùng',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `detail` text NOT NULL COMMENT 'Nội dung',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_product_img`
--

CREATE TABLE `db_product_img` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_product_img`
--

INSERT INTO `db_product_img` (`id`, `product_id`, `image`) VALUES
(1, 1, 'nhan-vang-18k-dinh-da-citrine-pnj-0.png'),
(2, 1, 'nhan-vang-18k-dinh-da-citrine-pnj-1.png'),
(3, 1, 'nhan-vang-18k-dinh-da-citrine-pnj-2.png'),
(4, 1, 'nhan-vang-18k-dinh-da-citrine-pnj-3.jpg'),
(5, 1, 'nhan-vang-18k-dinh-da-citrine-pnj-4.jpg'),
(6, 1, 'nhan-vang-18k-dinh-da-citrine-pnj-5.jpg'),
(7, 2, 'nhan-vang-18k-dinh-da-cz-pnj-0.png'),
(8, 2, 'nhan-vang-18k-dinh-da-cz-pnj-1.png'),
(9, 2, 'nhan-vang-18k-dinh-da-cz-pnj-2.png'),
(10, 2, 'nhan-vang-18k-dinh-da-cz-pnj-3.jpg'),
(11, 2, 'nhan-vang-18k-dinh-da-cz-pnj-4.jpg'),
(12, 3, 'nhan-bac-dinh-da-style-by-pnj-0.png'),
(13, 3, 'nhan-bac-dinh-da-style-by-pnj-1.png'),
(14, 3, 'nhan-bac-dinh-da-style-by-pnj-2.png'),
(15, 3, 'nhan-bac-dinh-da-style-by-pnj-3.jpg'),
(16, 3, 'nhan-bac-dinh-da-style-by-pnj-4.jpg'),
(17, 3, 'nhan-bac-dinh-da-style-by-pnj-5.jpg'),
(18, 4, 'nhan-bac-pnj-style-x-chou-chou-0.png'),
(19, 4, 'nhan-bac-pnj-style-x-chou-chou-1.png'),
(20, 4, 'nhan-bac-pnj-style-x-chou-chou-2.png'),
(21, 4, 'nhan-bac-pnj-style-x-chou-chou-3.jpg'),
(22, 4, 'nhan-bac-pnj-style-x-chou-chou-4.jpg'),
(23, 4, 'nhan-bac-pnj-style-x-chou-chou-5.jpg'),
(24, 5, 'nhan-cuoi-kim-cuong-vang-18k-pnj-0.png'),
(25, 5, 'nhan-cuoi-kim-cuong-vang-18k-pnj-1.png'),
(26, 5, 'nhan-cuoi-kim-cuong-vang-18k-pnj-2.png'),
(27, 5, 'nhan-cuoi-kim-cuong-vang-18k-pnj-3.jpg'),
(28, 5, 'nhan-cuoi-kim-cuong-vang-18k-pnj-4.jpg'),
(29, 5, 'nhan-cuoi-kim-cuong-vang-18k-pnj-5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `db_product_size`
--

CREATE TABLE `db_product_size` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `temp_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_product_size`
--

INSERT INTO `db_product_size` (`id`, `product_id`, `size_id`, `temp_price`) VALUES
(1, 1, 7, 14300000),
(2, 1, 8, 14430000),
(3, 2, 4, 9416000),
(4, 2, 6, 9592000),
(5, 2, 7, 9680000),
(6, 2, 8, 9768000),
(7, 3, 6, 850650),
(8, 3, 7, 858600),
(9, 3, 8, 866550),
(10, 3, 9, 874500),
(11, 4, 5, 609500),
(12, 4, 6, 615250),
(13, 4, 7, 621000),
(14, 4, 8, 626750),
(15, 5, 4, 23539999),
(16, 5, 5, 23759999),
(17, 5, 6, 23979999),
(18, 5, 7, 24199999),
(19, 5, 8, 24419999);

-- --------------------------------------------------------

--
-- Table structure for table `db_size`
--

CREATE TABLE `db_size` (
  `id` int(11) NOT NULL COMMENT 'mã size',
  `name_size` int(11) NOT NULL COMMENT 'tên kích cỡ',
  `rate` decimal(10,2) NOT NULL COMMENT 'tỉ lệ % giá'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_size`
--

INSERT INTO `db_size` (`id`, `name_size`, `rate`) VALUES
(1, 6, 0.01),
(2, 7, 0.02),
(3, 8, 0.03),
(4, 9, 0.04),
(5, 10, 0.05),
(6, 11, 0.06),
(7, 12, 0.07),
(8, 13, 0.08),
(9, 14, 0.09),
(10, 15, 0.10);

-- --------------------------------------------------------

--
-- Table structure for table `db_slider`
--

CREATE TABLE `db_slider` (
  `id` int(11) NOT NULL COMMENT 'Mã slide',
  `name` varchar(255) NOT NULL COMMENT 'Tên gọi',
  `link` varchar(255) NOT NULL COMMENT 'Đường dẫn',
  `position` varchar(100) NOT NULL COMMENT 'Vị trí',
  `info1` varchar(50) DEFAULT NULL COMMENT 'Dòng thông tin 1',
  `info2` varchar(50) DEFAULT NULL COMMENT 'Dòng thông tin 2',
  `info3` varchar(50) DEFAULT NULL COMMENT 'Dòng thông tin 3',
  `img` varchar(100) NOT NULL COMMENT 'Hình ảnh',
  `orders` int(11) NOT NULL COMMENT 'Sắp xếp',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_slider`
--

INSERT INTO `db_slider` (`id`, `name`, `link`, `position`, `info1`, `info2`, `info3`, `img`, `orders`, `status`) VALUES
(1, 'Nhẫn cưới Kim cương Vàng 18K PNJ', 'index.php?option=page&act=product-detail&slug=nhan-cuoi-kim-cuong-vang-18k-pnj', 'home', '', '', 'Nhẫn cưới Kim cương Vàng 18K PNJ', 'z4941028176559_9780d26589ab8d2b3957f4ebfcb1ed38.jpg', 1, 1),
(2, 'Đón ưu đãi vô cực', 'index.php?option=page&act=category&cat=day-chuyen', 'home', 'Ngàn vạn món quà', 'Tiện lợi hợp ý', '', 'z4941028155028_1159d326d3582dd36f120fd57d4dc94c.jpg', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_topic`
--

CREATE TABLE `db_topic` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Mã chủ đề',
  `name` varchar(255) NOT NULL COMMENT 'Tên chủ đề',
  `slug` varchar(255) NOT NULL COMMENT 'Mã hoá url',
  `parent_id` int(11) UNSIGNED NOT NULL COMMENT 'Mã cấp cha',
  `orders` int(11) UNSIGNED NOT NULL COMMENT 'Sắp xếp',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_topic`
--

INSERT INTO `db_topic` (`id`, `name`, `slug`, `parent_id`, `orders`, `status`) VALUES
(1, 'Tin tức', 'tin-tuc', 0, 1, 1),
(2, 'Tin thị trường', 'tin-thi-truong', 1, 1, 1),
(3, 'Tin khuyến mãi', 'tin-khuyen-mai', 1, 2, 1),
(4, 'Dịch vụ', 'dich-vu', 1, 3, 1),
(5, 'Blog', 'blog', 0, 2, 1),
(6, 'Hỗ trợ', 'ho-tro', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `id` int(11) NOT NULL COMMENT 'Mã thành viên',
  `fullname` varchar(255) NOT NULL COMMENT 'Tên thành viên',
  `password` varchar(64) NOT NULL COMMENT 'mật khẩu',
  `email` varchar(255) NOT NULL COMMENT 'email',
  `address` varchar(255) DEFAULT NULL COMMENT 'địa chỉ',
  `gender` int(1) DEFAULT NULL COMMENT 'giới tính',
  `phone` varchar(15) DEFAULT NULL COMMENT 'số điện thoại',
  `img` varchar(100) DEFAULT NULL COMMENT 'ảnh đại diện',
  `role` varchar(255) NOT NULL DEFAULT 'customer' COMMENT 'vai trò',
  `rank_id` int(11) NOT NULL DEFAULT 1 COMMENT 'Cấp thành viên',
  `price_spent` int(11) NOT NULL DEFAULT 0 COMMENT 'Số tiền đã chi',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`id`, `fullname`, `password`, `email`, `address`, `gender`, `phone`, `img`, `role`, `rank_id`, `price_spent`, `status`) VALUES
(2, 'Thạch Thế Đăng', 'Dang@123', 'dangthach1307@gmail.com', NULL, 1, '0902471714', NULL, 'superadmin', 2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_wishlist`
--

CREATE TABLE `db_wishlist` (
  `id` int(11) NOT NULL COMMENT 'Mã',
  `product_id` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `customer_id` int(11) NOT NULL COMMENT 'Mã khách hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_banner`
--
ALTER TABLE `db_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_brand`
--
ALTER TABLE `db_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_config`
--
ALTER TABLE `db_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_contact`
--
ALTER TABLE `db_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_email`
--
ALTER TABLE `db_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_material`
--
ALTER TABLE `db_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_member_rank`
--
ALTER TABLE `db_member_rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_menu`
--
ALTER TABLE `db_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_order`
--
ALTER TABLE `db_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_user` (`user_id`);

--
-- Indexes for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderdetail_order` (`order_id`),
  ADD KEY `fk_orderdetail_product` (`product_id`);

--
-- Indexes for table `db_post`
--
ALTER TABLE `db_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_topic` (`topic_id`);

--
-- Indexes for table `db_post_comment`
--
ALTER TABLE `db_post_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_postcmt_post` (`post_id`),
  ADD KEY `fk_postcmt_user` (`user_id`);

--
-- Indexes for table `db_product`
--
ALTER TABLE `db_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_brand` (`brand_id`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_material` (`material_id`);

--
-- Indexes for table `db_product_comment`
--
ALTER TABLE `db_product_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productcmt_product` (`product_id`),
  ADD KEY `fk_productcmt_user` (`user_id`);

--
-- Indexes for table `db_product_img`
--
ALTER TABLE `db_product_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_imglist_product` (`product_id`);

--
-- Indexes for table `db_product_size`
--
ALTER TABLE `db_product_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`product_id`),
  ADD KEY `fk_size` (`size_id`);

--
-- Indexes for table `db_size`
--
ALTER TABLE `db_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_slider`
--
ALTER TABLE `db_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_topic`
--
ALTER TABLE `db_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_rank` (`rank_id`);

--
-- Indexes for table `db_wishlist`
--
ALTER TABLE `db_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wishlist_product` (`product_id`),
  ADD KEY `fk_wishlist_customer` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_banner`
--
ALTER TABLE `db_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã slide', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_brand`
--
ALTER TABLE `db_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `db_config`
--
ALTER TABLE `db_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_contact`
--
ALTER TABLE `db_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã liên hệ';

--
-- AUTO_INCREMENT for table `db_email`
--
ALTER TABLE `db_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_material`
--
ALTER TABLE `db_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `db_member_rank`
--
ALTER TABLE `db_member_rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã cấp bậc thành viên', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_menu`
--
ALTER TABLE `db_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã menu', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `db_order`
--
ALTER TABLE `db_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn hàng';

--
-- AUTO_INCREMENT for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'mã chi tiết đon hàng';

--
-- AUTO_INCREMENT for table `db_post`
--
ALTER TABLE `db_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bài viết', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_post_comment`
--
ALTER TABLE `db_post_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bình luận';

--
-- AUTO_INCREMENT for table `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_product_comment`
--
ALTER TABLE `db_product_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bình luận';

--
-- AUTO_INCREMENT for table `db_product_img`
--
ALTER TABLE `db_product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `db_product_size`
--
ALTER TABLE `db_product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `db_size`
--
ALTER TABLE `db_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã size', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã slide', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_topic`
--
ALTER TABLE `db_topic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chủ đề', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã thành viên', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_wishlist`
--
ALTER TABLE `db_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_order`
--
ALTER TABLE `db_order`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `db_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_post`
--
ALTER TABLE `db_post`
  ADD CONSTRAINT `fk_post_topic` FOREIGN KEY (`topic_id`) REFERENCES `db_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_post_comment`
--
ALTER TABLE `db_post_comment`
  ADD CONSTRAINT `fk_postcmt_post` FOREIGN KEY (`post_id`) REFERENCES `db_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_postcmt_user` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_product`
--
ALTER TABLE `db_product`
  ADD CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `db_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `db_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_material` FOREIGN KEY (`material_id`) REFERENCES `db_material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_product_comment`
--
ALTER TABLE `db_product_comment`
  ADD CONSTRAINT `fk_productcmt_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_productcmt_user` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_product_img`
--
ALTER TABLE `db_product_img`
  ADD CONSTRAINT `fk_imglist_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_product_size`
--
ALTER TABLE `db_product_size`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_size` FOREIGN KEY (`size_id`) REFERENCES `db_size` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_user`
--
ALTER TABLE `db_user`
  ADD CONSTRAINT `fk_user_rank` FOREIGN KEY (`rank_id`) REFERENCES `db_member_rank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_wishlist`
--
ALTER TABLE `db_wishlist`
  ADD CONSTRAINT `fk_wishlist_customer` FOREIGN KEY (`customer_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
