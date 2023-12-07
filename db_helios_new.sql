-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 05:11 PM
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
(13, 'Đá màu', 'da-mau', 2, 3, 1);

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
(1, 5, 1, 'Nhẫn Vàng 18K đính đá Citrine PNJ', 'nhan-vang-18k-dinh-da-citrine-pnj', 'PNJNHA001-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Nổi bật với sắc vàng cam nóng bỏng, đá Citrine luôn mang vẻ đẹp rạng rỡ và tỏa sáng khi đeo trên người. Chiếc&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn</b></span></font>&nbsp;được chế tác từ vàng 18K cùng đá Citrine, mang đến món trang sức sang trọng và quý phái cho quý cô. Bên cạnh đó,&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>trang sức Citrine</b></span></font>&nbsp;cũng khá phù hợp với nhiều lứa tuổi khác nhau, và ngự trị trên làn da nào cũng toát lên được vẻ đẹp riêng biệt.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Ngoài ra, Citrine cũng mang nguồn năng lượng từ mặt trời nên nó mang lại sự tích cực cũng như giúp cơ thể tràn đầy sức sống.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">15.04097<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Citrine</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Kích thước đá (tham khảo):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10 x 10 ly</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 100, 13000000, 0, 3, NULL, 0, 0, 1),
(2, 5, 1, 'Nhẫn Vàng 18K đính đá CZ PNJ', 'nhan-vang-18k-dinh-da-cz-pnj', 'PNJNHA002-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Sở hữu thiết kế trẻ trung cộng hưởng cùng ánh kim quý phái của vàng 18K, chiếc&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn PNJ</b></span></font>&nbsp;tôn lên vẻ đẹp hiện đại và thời thượng của các quý cô, giúp nàng trông thật xinh đẹp rạng rỡ khi trưng diện.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Sở hữu thiết kế đủ mềm mại nhưng lại đầy quyền năng, đủ phá cách như cho một sự khác lạ, vừa mang nét hiện đại, trẻ trung bởi sự rành mạch trong đường nét, lại vừa giữ được sự mềm mại, kiêu sa giữa sự ngẫu hứng cùng vàng và đá, chiếc nhẫn&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>CZ</b></span></font>&nbsp;ấn tượng như người phụ nữ trưởng thành với phong cách và con đường riêng để khẳng định bản ngã của chính mình.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">12.3889<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">62<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 81, 8800000, 2, 3, NULL, 0, 0, 1),
(3, 5, 1, 'Nhẫn bạc đính đá STYLE by PNJ', 'nhan-bac-dinh-da-style-by-pnj', 'PNJNHA003-NHA', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\"><div style=\"color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn</span></font>&nbsp;bạc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">STYLE By PNJ</span></font>&nbsp;sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.</p></div><div style=\"color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Với sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.</p></div></span></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9.01363<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9300</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Mother of Pearl</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Màu đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Trắng</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">STYLE BY PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Cabochon</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 30, 795000, 0, 6, NULL, 0, 0, 1),
(4, 5, 1, 'Nhẫn Bạc PNJ STYLE x CHOU CHOU', 'nhan-bac-pnj-style-x-chou-chou', 'PNJNHA004-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Không sở hữu các chi tiết đính đá rực rỡ nhưng lại khoác lên mình thiết kế độc đáo với những đường nét sáng tạo, chiếc&nbsp;<font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn</span></font>&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>STYLE By PNJ&nbsp;x Chou Chou</b></span></font>&nbsp;sẽ cùng nàng biến hóa đầy cá tính cùng chất riêng của mình.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Khác với trang sức khác, chất liệu bạc 92.5 là lựa chọn thông minh, bền vững với thời gian, giúp các cô gái trẻ thể hiện cá tính cũng như gu thời trang của mình. Khi kết hợp cùng các mẫu trang sức khác, chắc chắn đây sẽ là điểm nhấn hoàn hảo mang đến vẻ đẹp của sự cá tính và thời thượng cho phong cách của nàng.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">5.95815<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9300</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Bộ sưu tập:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">STYLE x CHOU CHOU</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">STYLE BY PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 30, 575000, 10, 6, NULL, 1, 0, 1);

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
(23, 4, 'nhan-bac-pnj-style-x-chou-chou-5.jpg');

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
(14, 4, 8, 626750);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã slide';

--
-- AUTO_INCREMENT for table `db_brand`
--
ALTER TABLE `db_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã menu';

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bài viết';

--
-- AUTO_INCREMENT for table `db_post_comment`
--
ALTER TABLE `db_post_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bình luận';

--
-- AUTO_INCREMENT for table `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_product_comment`
--
ALTER TABLE `db_product_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bình luận';

--
-- AUTO_INCREMENT for table `db_product_img`
--
ALTER TABLE `db_product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `db_product_size`
--
ALTER TABLE `db_product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `db_size`
--
ALTER TABLE `db_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã size', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã slide';

--
-- AUTO_INCREMENT for table `db_topic`
--
ALTER TABLE `db_topic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chủ đề';

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
