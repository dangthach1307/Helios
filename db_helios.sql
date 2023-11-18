-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 14, 2023 lúc 07:55 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_helios`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_banner`
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
-- Cấu trúc bảng cho bảng `db_brand`
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
-- Đang đổ dữ liệu cho bảng `db_brand`
--

INSERT INTO `db_brand` (`id`, `name`, `slug`, `img`, `orders`, `status`) VALUES
(1, 'Valerie', 'valerie', 'valerie.png', 1, 1),
(2, 'PNJ', 'pnj', 'pnj.png', 2, 1),
(3, 'Tierra', 'tiera', 'tiera.png', 3, 1),
(4, 'doji', 'doji', 'doji.png', 4, 1),
(5, 'SJC', 'sjc', 'sjc.png', 5, 1),
(6, 'Thế Giới Kim Cương', 'the-gioi-kim-cuong', 'the-gioi-kim-cuong.png', 6, 1),
(7, 'Precita', 'precita', 'precita.png', 7, 1),
(8, 'Bảo Tín Minh Châu', 'bao-tinh-minh-chau', 'bao-tinh-minh-chau.png', 8, 1),
(9, 'Phú Quý Jewelry', 'phu-quy-jewelry', 'phu-quy-jewelry.jpg', 1, 1),
(10, 'Skymond Luxury', 'skymond-luxury', 'skymond-luxury.png', 10, 0),
(11, 'Huy Thanh Jewelry', 'huy-thanh-jewelry', 'huy-thanh-jewelry.png', 11, 0),
(12, 'Ancarat', 'ancarat', 'ancarat.png', 12, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_category`
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
-- Đang đổ dữ liệu cho bảng `db_category`
--

INSERT INTO `db_category` (`id`, `name`, `slug`, `parent_id`, `orders`, `status`) VALUES
(1, 'Chủng loại', 'chung-loai', 0, 1, 1),
(2, 'Theo mục đích', 'theo-muc-dich', 0, 2, 2),
(5, 'Nhẫn cặp', 'nhan-cap', 1, 1, 1),
(6, 'Nhẫn', 'nhan', 1, 2, 1),
(7, 'Dây chuyền', 'day-chuyen', 1, 2, 1),
(8, 'Mặt dây chuyền', 'mat-day-chuyen', 1, 3, 1),
(9, 'Bông tai', 'bong-tai', 1, 4, 1),
(10, 'Lắc', 'lac', 1, 5, 1),
(11, 'Vòng', 'vong', 1, 6, 1),
(12, 'Charm', 'charm', 1, 7, 1),
(13, 'Dây cổ', 'day-co', 1, 8, 1),
(14, 'Kiềng', 'kieng', 1, 9, 1),
(15, 'Vàng tài lộc', 'vang-tai-loc', 1, 10, 1),
(25, 'Trang sức phong thuỷ', 'trang-suc-phong-thuy', 0, 5, 1),
(26, 'Trang sức trẻ em', 'trang-suc-tre-em', 0, 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_config`
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
-- Đang đổ dữ liệu cho bảng `db_config`
--

INSERT INTO `db_config` (`id`, `title`, `logo`, `icon`, `url`, `address`, `map`, `phone`, `email`) VALUES
(1, 'Helios E-Commerece Jewelry Website', 'logo.png', 'icon.png', 'helios/site/index.php?option=page&act=home', 'Công viên phần mềm Quang Trung', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7836.930008892913!2d106.61396081150974!3d10.852193305047312!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b6c59ba4c97%3A0x535e784068f1558b!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYw!5e0!3m2!1sen!2s!4v1699930374912!5m2!1sen!2s', '+84 123 456 98765', 'helios@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_contact`
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

--
-- Đang đổ dữ liệu cho bảng `db_contact`
--

INSERT INTO `db_contact` (`id`, `fullname`, `email`, `phone`, `title`, `detail`, `contact_reply`, `status`, `isDeleted`) VALUES
(2, 'Thạch Thế Đăng', 'dangthach1307@gmail.com', '0902471714', 'Cập nhật trang web', 'Cập nhật trang web', NULL, 0, 0),
(3, 'Thạch Thế Đăng', 'dangthach1307@mgail.com', '0902471714', 'Cập nhật lại bảng db_contact', 'Cập nhật lại bảng db_contact', 'Trả lời liên hệ', 1, 1),
(4, 'Thạch Thế Đăng', 'dangthach1307@gmail.com', '+84902471714', 'Test gửi liên hệ', 'Test gửi liên hệ', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_hotdeal`
--

CREATE TABLE `db_hotdeal` (
  `id` int(11) NOT NULL COMMENT 'Mã chương trình khuyến mãi',
  `product_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Ngày khởi tạo',
  `end_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Ngày kết thúc',
  `promotion` int(11) NOT NULL COMMENT 'Phần trăm khuyến mãi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_member_card`
--

CREATE TABLE `db_member_card` (
  `id` int(11) NOT NULL COMMENT 'Mã cấp bậc thành viên',
  `rank_type` varchar(50) NOT NULL DEFAULT 'Member' COMMENT 'Tên loại cấp bậc, ví dụ: Bronze, Silver, Gold, Diamond...',
  `promotion` int(11) NOT NULL COMMENT 'Mức giảm giá (%) dựa trên loại rank đạt được',
  `info1` varchar(50) DEFAULT NULL COMMENT 'Thông tin 1',
  `info2` varchar(50) DEFAULT NULL COMMENT 'Thông tin 2',
  `info3` varchar(50) DEFAULT NULL COMMENT 'Thông tin 3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_member_card`
--

INSERT INTO `db_member_card` (`id`, `rank_type`, `promotion`, `info1`, `info2`, `info3`) VALUES
(1, 'Bronze', 10, NULL, NULL, NULL),
(2, 'Silver', 15, NULL, NULL, NULL),
(3, 'Gold', 20, NULL, NULL, NULL),
(4, 'Diamond', 25, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_menu`
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
-- Cấu trúc bảng cho bảng `db_order`
--

CREATE TABLE `db_order` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng',
  `user_id` int(11) NOT NULL COMMENT 'Mã thành viên',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo hoá đơn',
  `exported_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày xuất hoá đơn',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT 'Quy định trạng thái:\r\n1: Đã đặt hàng\r\n2: Đã xuất kho\r\n3: Đang vận chuyển\r\n4: Hoàn thành'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_orderdetail`
--

CREATE TABLE `db_orderdetail` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'mã chi tiết đon hàng',
  `order_id` int(11) UNSIGNED NOT NULL COMMENT 'mã đơn hàng',
  `product_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `price` float(12,0) NOT NULL COMMENT 'Giá sản phẩm (có khuyến mãi hoặc không)',
  `quantity` int(11) UNSIGNED NOT NULL COMMENT 'Số lượng sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_post`
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
-- Đang đổ dữ liệu cho bảng `db_post`
--

INSERT INTO `db_post` (`id`, `topic_id`, `title`, `slug`, `detail`, `img`, `type`, `status`) VALUES
(7, 1, 'Test thêm trang đơn', 'test-them-trang-don', '<p>Test sửa nội dung</p>', NULL, 'singlepage', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_post_comment`
--

CREATE TABLE `db_post_comment` (
  `id` int(11) NOT NULL COMMENT 'Mã bình luận',
  `post_id` int(11) NOT NULL COMMENT 'Mã bài viết',
  `user_id` int(11) NOT NULL COMMENT 'Mã người dùng',
  `detail` text NOT NULL COMMENT 'Nội dung'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_product`
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
  `material` varchar(255) DEFAULT NULL COMMENT 'Chất liệu',
  `size` varchar(255) DEFAULT NULL COMMENT 'kích cỡ',
  `quantity` int(11) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `price` int(11) DEFAULT NULL COMMENT 'Giá',
  `promotion` int(11) DEFAULT NULL COMMENT 'Phần trăm khuyến mãi',
  `trending` int(11) DEFAULT NULL COMMENT 'Sản phẩm nổi bật',
  `view` int(11) DEFAULT 0 COMMENT 'Lượt xem',
  `sold_count` int(11) NOT NULL DEFAULT 0 COMMENT 'Số lượng bán ra',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_product`
--

INSERT INTO `db_product` (`id`, `category_id`, `brand_id`, `name`, `slug`, `SKU`, `smdetail`, `detail`, `material`, `size`, `quantity`, `price`, `promotion`, `trending`, `view`, `sold_count`, `status`) VALUES
(1, 6, 2, 'Nhẫn Vàng 14K đính đá Moon PNJ', 'nhan-vang-14k-dinh-da-moon-pnj', 'PNJNHA001-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Tận dụng sắc hồng nữ tính của đá Moon - viên đá mang sắc thái dịu êm trên chất liệu vàng 14K, PNJ đem đến tuyệt tác&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn</b></span></font>&nbsp;đá Moon hồng thanh lịch như những người phụ nữ kiêu hãnh cùng phong thái tự tin của riêng nàng. Tổng thể thiết kế hòa lên khúc ca vang danh, tôn vinh nhan sắc kiêu sa của phái đẹp.</p></div><div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Chiếc nhẫn này chắc chắn sẽ giúp nàng tỏa sáng với thần thái đầy thanh lịch và sang trọng. Hãy cùng&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>PNJ</b></span></font>&nbsp;lựa chọn trang sức ấn tượng và phong cách để trở thành tâm điểm hút mọi ánh nhìn ngưỡng mộ ở bất kỳ nơi nào bạn xuất hiện.</p></div></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">9.296<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">5850</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Moon</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Màu đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Hồng</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Màu đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Trắng</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">12<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Cabochon</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Kích thước đá (tham khảo):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10 x 10 ly</div></div>', 'Vàng 14K', '13', 20, 9000000, 0, NULL, 5, 0, 1),
(4, 6, 2, 'Nhẫn Vàng 18K đính đá Citrine PNJ', 'nhan-vang-18k-dinh-da-citrine-pnj', 'PNJNHA004-NHA', '<p><div class=\"tab-item-outer\" id=\"item_outer_discussion\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px !important; position: relative; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><div class=\"tab-item-outer active\" id=\"item_outer_features_description\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px !important; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"content_features_description\" class=\"ty-wysiwyg-content content-features_description active\" style=\"font-family: Roboto, sans-serif; font-size: 16px; font-weight: 300; overflow-wrap: break-word; padding: 12px 15px 0px; box-sizing: border-box;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Nổi bật với sắc vàng cam nóng bỏng, đá Citrine luôn mang vẻ đẹp rạng rỡ và tỏa sáng khi đeo trên người. Chiếc<span>&nbsp;</span><font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn</b></span></font>&nbsp;được chế tác từ vàng 18K cùng đá Citrine, mang đến món trang sức sang trọng và quý phái cho quý cô. Bên cạnh đó,<span>&nbsp;</span><font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>trang sức Citrine</b></span></font>&nbsp;cũng khá phù hợp với nhiều lứa tuổi khác nhau, và ngự trị trên làn da nào cũng toát lên được vẻ đẹp riêng biệt.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Ngoài ra, Citrine cũng mang nguồn năng lượng từ mặt trời nên nó mang lại sự tích cực cũng như giúp cơ thể tràn đầy sức sống.</p></div></div></div></div></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">15.04657<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Citrine</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Kích thước đá (tham khảo):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10 x 10 ly</div></div><br><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; box-sizing: border-box; width: 749px; background-color: rgb(255, 255, 255); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span class=\"ty-product-feature__label\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; text-align: left; color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; text-align: left; padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 'Vàng 18K', '12,13', 40, 13467000, 10, NULL, 0, 0, 1),
(5, 6, 2, 'Nhẫn Vàng 18K đính đá CZ PNJ', 'nhan-vang-18k-dinh-da-cz-pnj', 'PNJNHA005-NHA', '<div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Sở hữu thiết kế trẻ trung cộng hưởng cùng ánh kim quý phái của vàng 18K, chiếc&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn PNJ</b></span></font>&nbsp;tôn lên vẻ đẹp hiện đại và thời thượng của các quý cô, giúp nàng trông thật xinh đẹp rạng rỡ khi trưng diện.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(0, 0, 0);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 6px 0px;\">Sở hữu thiết kế đủ mềm mại nhưng lại đầy quyền năng, đủ phá cách như cho một sự khác lạ, vừa mang nét hiện đại, trẻ trung bởi sự rành mạch trong đường nét, lại vừa giữ được sự mềm mại, kiêu sa giữa sự ngẫu hứng cùng vàng và đá, chiếc nhẫn&nbsp;<font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>CZ</b></span></font>&nbsp;ấn tượng như người phụ nữ trưởng thành với phong cách và con đường riêng để khẳng định bản ngã của chính mình.</p></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">12.38621<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">62<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 'Vàng 18K', '9,11,12,13', 20, 10514000, 15, NULL, 3, 0, 1),
(6, 6, 2, 'Nhẫn cưới Kim cương Vàng 18K PNJ', 'nhan-cuoi-kim-cuong-vang-18k-pnj', 'PNJNHA006-NHA', '<p><div class=\"tab-item-outer\" id=\"item_outer_discussion\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px; position: relative; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><div class=\"tab-item-outer active\" id=\"item_outer_features_description\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px !important; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"content_features_description\" class=\"ty-wysiwyg-content content-features_description active\" style=\"font-family: Roboto, sans-serif; font-size: 16px; font-weight: 300; overflow-wrap: break-word; padding: 12px 15px 0px; box-sizing: border-box;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc<span>&nbsp;</span><font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn</span></font><span>&nbsp;</span>được chế tác từ vàng 18K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Kim cương đã đẹp,<span>&nbsp;</span><font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">trang sức kim cương</span></font><span>&nbsp;</span>lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.</p></div></div></div></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10.02102<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Kim cương</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Kim cương</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">20<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><br><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; box-sizing: border-box; width: 749px; background-color: rgb(242, 242, 242); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span class=\"ty-product-feature__label\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; text-align: left; color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; text-align: left; padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 'Vàng 18K', '9,10,11,12,13', 30, 22240000, 0, NULL, 1, 0, 1),
(7, 6, 2, 'Nhẫn Cưới Vàng trắng 14K đính đá Saphire PNJ True Love', 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love', 'PNJNHA007-NHA', '<p><div class=\"tab-item-outer\" id=\"item_outer_discussion\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px; position: relative; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><div class=\"tab-item-outer active\" id=\"item_outer_features_description\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px !important; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"content_features_description\" class=\"ty-wysiwyg-content content-features_description active\" style=\"font-family: Roboto, sans-serif; font-size: 16px; font-weight: 300; overflow-wrap: break-word; padding: 12px 15px 0px; box-sizing: border-box;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Chiếc<span>&nbsp;</span><font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">nhẫn vàng</span></font><span>&nbsp;</span>đính đá Sapphire tựa như quyển nhật ký giúp các cặp đôi lưu giữ khoảng khắc ngọt ngào của câu chuyện tình yêu mộc mạc và giản đơn. Sở hữu độ cứng cao, chịu được sự va đập và mang vẻ đẹp của sự quyến rũ, viên đá Sapphire được đính một cách tinh xảo trên sản phẩm nhờ vào tài nghệ của đội ngũ kim hoàn từ PNJ.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Những món trang sức trong<span>&nbsp;</span><font color=\"#1500dd\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\">BST True Love</span></font><span>&nbsp;</span>và chiếc nhẫn nói riêng được chế tác từ chất liệu vàng luôn mang trong mình vẻ đẹp của sự tinh tế, tô điểm thêm nét duyên dáng cho chủ sở hữu. Hãy cùng PNJ lựa chọn trang sức ấn tượng và phong cách để trở thành tâm điểm hút mọi ánh nhìn ngưỡng mộ ở bất kỳ nơi nào bạn xuất hiện.</p></div></div></div></div></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">6.80687<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Sapphire</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hình dạng đá:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Tròn</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Không gắn đá</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">2<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 'Vàng 14K', '8,9,10,11,12,13', 15, 6247000, 0, NULL, 8, 0, 1),
(8, 6, 2, 'Nhẫn Vàng 18K đính đá Ruby PNJ', 'nhan-vang-18k-dinh-da-ruby-pnj', 'PNJNHA008-NHA', '<p><div class=\"tab-item-outer\" id=\"item_outer_discussion\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px; position: relative; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><div class=\"tab-item-outer active\" id=\"item_outer_features_description\" style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300; border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 4px; padding: 0px 10px; box-sizing: border-box; margin-bottom: 15px !important; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"content_features_description\" class=\"ty-wysiwyg-content content-features_description active\" style=\"font-family: Roboto, sans-serif; font-size: 16px; font-weight: 300; overflow-wrap: break-word; padding: 12px 15px 0px; box-sizing: border-box;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Được chế tác từ vàng 18K cùng vẻ đẹp huyền bí của viên đá Ruby, PNJ mang đến sản phẩm<span>&nbsp;</span><font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>nhẫn</b></span></font><span>&nbsp;</span>sang trọng và quyến rũ dành cho phái nữ. Đá Ruby sở hữu vẻ quyến rũ, khi được cộng hưởng ánh sắc của dãy đá trắng lấp lánh, hài hòa theo từng đường nét thiết kế đã tạo nên một món trang sức đẹp mê hồn.</p></div><div style=\"font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\"><p style=\"margin: 0px; padding: 6px 0px; font-family: Roboto, sans-serif; font-size: 14px; font-weight: 300;\">Đặc biệt hơn, một chiếc nhẫn đính đá Ruby thuận theo phong thủy sẽ mang lại may mắn cũng như nguồn năng lượng tích cực. Và người sở hữu<span>&nbsp;</span><font color=\"#003368\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline-color: initial; outline-width: initial; cursor: pointer; transition-duration: 150ms; transition-property: all;\"><b>trang sức Ruby</b></span></font><span>&nbsp;</span>không chỉ có được những năng lượng tốt này mà cuộc sống sẽ ngày càng khởi sắc.</p></div></div></div></div></div>', '<div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Trọng lượng tham khảo:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">10.64364<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">phân</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Hàm lượng chất liệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">7500</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Ruby</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Loại đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Xoàn mỹ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá chính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">1<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Số viên đá phụ:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">30<span class=\"ty-product-feature__suffix\" style=\"width: 70%; padding-left: 5px;\">viên</span></div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Thương hiệu:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">PNJ</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Cut (Giác cắt/ Hình dạng kim cương):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Facet</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px;\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Kích thước đá (tham khảo):</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">6 x 8ly</div></div><div class=\"ty-product-feature\" style=\"font-family: Roboto, sans-serif; font-size: 14px; color: rgb(76, 76, 76); display: inline-flex; padding: 8px 25px; width: 749px; background-color: rgb(242, 242, 242);\"><span class=\"ty-product-feature__label\" style=\"color: rgb(40, 40, 40);\">Giới tính:</span><div class=\"ty-product-feature__value\" style=\"padding-left: 5px; max-width: 70%; color: rgb(40, 40, 40);\">Nữ</div></div>', 'Vàng 18K', '12,13', 13, 11992000, 0, NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_product_comment`
--

CREATE TABLE `db_product_comment` (
  `id` int(11) NOT NULL COMMENT 'Mã bình luận',
  `product_id` int(11) NOT NULL COMMENT 'Mã sản phẩm',
  `user_id` int(11) NOT NULL COMMENT 'Mã người dùng',
  `detail` text NOT NULL COMMENT 'Nội dung'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_product_img`
--

CREATE TABLE `db_product_img` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_product_img`
--

INSERT INTO `db_product_img` (`id`, `product_id`, `image`) VALUES
(1, 1, 'nhan-vang-14k-dinh-da-moon-pnj-0.png'),
(2, 1, 'nhan-vang-14k-dinh-da-moon-pnj-1.png'),
(3, 1, 'nhan-vang-14k-dinh-da-moon-pnj-2.png'),
(4, 1, 'nhan-vang-14k-dinh-da-moon-pnj-3.jpg'),
(5, 1, 'nhan-vang-14k-dinh-da-moon-pnj-4.jpg'),
(18, 4, 'nhan-vang-18k-dinh-da-citrine-pnj-0.png'),
(19, 4, 'nhan-vang-18k-dinh-da-citrine-pnj-1.png'),
(20, 4, 'nhan-vang-18k-dinh-da-citrine-pnj-2.png'),
(21, 4, 'nhan-vang-18k-dinh-da-citrine-pnj-3.jpg'),
(22, 4, 'nhan-vang-18k-dinh-da-citrine-pnj-4.jpg'),
(23, 4, 'nhan-vang-18k-dinh-da-citrine-pnj-5.jpg'),
(24, 5, 'nhan-vang-18k-dinh-da-cz-pnj-0.png'),
(25, 5, 'nhan-vang-18k-dinh-da-cz-pnj-1.png'),
(26, 5, 'nhan-vang-18k-dinh-da-cz-pnj-2.png'),
(27, 5, 'nhan-vang-18k-dinh-da-cz-pnj-3.jpg'),
(28, 5, 'nhan-vang-18k-dinh-da-cz-pnj-4.jpg'),
(29, 6, 'nhan-cuoi-kim-cuong-vang-18k-pnj-0.png'),
(30, 6, 'nhan-cuoi-kim-cuong-vang-18k-pnj-1.png'),
(31, 6, 'nhan-cuoi-kim-cuong-vang-18k-pnj-2.png'),
(32, 6, 'nhan-cuoi-kim-cuong-vang-18k-pnj-3.jpg'),
(33, 6, 'nhan-cuoi-kim-cuong-vang-18k-pnj-4.jpg'),
(34, 7, 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love-0.png'),
(35, 7, 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love-1.png'),
(36, 7, 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love-2.png'),
(37, 7, 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love-3.jpg'),
(38, 7, 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love-4.jpg'),
(39, 7, 'nhan-cuoi-vang-trang-14k-dinh-da-saphire-pnj-true-love-5.jpg'),
(40, 8, 'nhan-vang-18k-dinh-da-ruby-pnj-0.png'),
(41, 8, 'nhan-vang-18k-dinh-da-ruby-pnj-1.png'),
(42, 8, 'nhan-vang-18k-dinh-da-ruby-pnj-2.png'),
(43, 8, 'nhan-vang-18k-dinh-da-ruby-pnj-3.jpg'),
(44, 8, 'nhan-vang-18k-dinh-da-ruby-pnj-4.jpg'),
(45, 8, 'nhan-vang-18k-dinh-da-ruby-pnj-5.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_slider`
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
-- Cấu trúc bảng cho bảng `db_topic`
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
-- Đang đổ dữ liệu cho bảng `db_topic`
--

INSERT INTO `db_topic` (`id`, `name`, `slug`, `parent_id`, `orders`, `status`) VALUES
(1, 'Không chủ đề', 'khong-chu-de', 0, 1, 1),
(2, 'Tin tức', 'tin-tuc', 0, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_user`
--

CREATE TABLE `db_user` (
  `id` int(11) NOT NULL COMMENT 'Mã thành viên',
  `fullname` varchar(255) NOT NULL COMMENT 'Tên thành viên',
  `username` varchar(225) NOT NULL COMMENT 'Tên tài khoản',
  `password` varchar(64) NOT NULL COMMENT 'mật khẩu',
  `email` varchar(255) NOT NULL COMMENT 'email',
  `address` varchar(255) DEFAULT NULL COMMENT 'địa chỉ',
  `gender` int(1) DEFAULT NULL COMMENT 'giới tính',
  `phone` varchar(15) DEFAULT NULL COMMENT 'số điện thoại',
  `img` varchar(100) DEFAULT NULL COMMENT 'ảnh đại diện',
  `role` varchar(255) NOT NULL DEFAULT 'customer' COMMENT 'vai trò',
  `rank_id` int(11) NOT NULL DEFAULT 1 COMMENT 'Cấp thành viên',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'Trạng thái'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_user`
--

INSERT INTO `db_user` (`id`, `fullname`, `username`, `password`, `email`, `address`, `gender`, `phone`, `img`, `role`, `rank_id`, `status`) VALUES
(1, 'Thạch Thế Đăng', 'dangthach1307', 'dang@123', 'dangthach1307@gmail.com', '97/10', 1, '0902471714', NULL, 'superadmin', 4, 1),
(2, 'Đăng thạch', 'dang138', 'dang@123', 'dangthach123@gmail.com', NULL, 1, '0902471714', NULL, 'admin', 1, 1),
(3, 'Đăng thạch', 'dang137', 'dang@123', 'dang137@gmail.com', '2138', 1, '9024224732', 'dang137.jpg', 'admin', 4, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `db_banner`
--
ALTER TABLE `db_banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_brand`
--
ALTER TABLE `db_brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_config`
--
ALTER TABLE `db_config`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_contact`
--
ALTER TABLE `db_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_hotdeal`
--
ALTER TABLE `db_hotdeal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotdeal_product` (`product_id`);

--
-- Chỉ mục cho bảng `db_member_card`
--
ALTER TABLE `db_member_card`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_menu`
--
ALTER TABLE `db_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_order`
--
ALTER TABLE `db_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_user` (`user_id`);

--
-- Chỉ mục cho bảng `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderdetail_order` (`order_id`),
  ADD KEY `fk_orderdetail_product` (`product_id`);

--
-- Chỉ mục cho bảng `db_post`
--
ALTER TABLE `db_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_topic` (`topic_id`);

--
-- Chỉ mục cho bảng `db_post_comment`
--
ALTER TABLE `db_post_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_postcmt_post` (`post_id`),
  ADD KEY `fk_postcmt_user` (`user_id`);

--
-- Chỉ mục cho bảng `db_product`
--
ALTER TABLE `db_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category` (`category_id`),
  ADD KEY `fk_product_brand` (`brand_id`);

--
-- Chỉ mục cho bảng `db_product_comment`
--
ALTER TABLE `db_product_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productcmt_product` (`product_id`),
  ADD KEY `fk_productcmt_user` (`user_id`);

--
-- Chỉ mục cho bảng `db_product_img`
--
ALTER TABLE `db_product_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_imglist_product` (`product_id`);

--
-- Chỉ mục cho bảng `db_slider`
--
ALTER TABLE `db_slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_topic`
--
ALTER TABLE `db_topic`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_rank` (`rank_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `db_banner`
--
ALTER TABLE `db_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã slide';

--
-- AUTO_INCREMENT cho bảng `db_brand`
--
ALTER TABLE `db_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `db_config`
--
ALTER TABLE `db_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `db_contact`
--
ALTER TABLE `db_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã liên hệ', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `db_hotdeal`
--
ALTER TABLE `db_hotdeal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã chương trình khuyến mãi';

--
-- AUTO_INCREMENT cho bảng `db_member_card`
--
ALTER TABLE `db_member_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã cấp bậc thành viên', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `db_menu`
--
ALTER TABLE `db_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã menu', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `db_order`
--
ALTER TABLE `db_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn hàng';

--
-- AUTO_INCREMENT cho bảng `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'mã chi tiết đon hàng';

--
-- AUTO_INCREMENT cho bảng `db_post`
--
ALTER TABLE `db_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã bài viết', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `db_product_img`
--
ALTER TABLE `db_product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã slide', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `db_topic`
--
ALTER TABLE `db_topic`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chủ đề', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã thành viên', AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `db_hotdeal`
--
ALTER TABLE `db_hotdeal`
  ADD CONSTRAINT `fk_hotdeal_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_order`
--
ALTER TABLE `db_order`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `db_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_post`
--
ALTER TABLE `db_post`
  ADD CONSTRAINT `fk_post_topic` FOREIGN KEY (`topic_id`) REFERENCES `db_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_post_comment`
--
ALTER TABLE `db_post_comment`
  ADD CONSTRAINT `fk_postcmt_post` FOREIGN KEY (`post_id`) REFERENCES `db_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_postcmt_user` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_product`
--
ALTER TABLE `db_product`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `db_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `db_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_product_comment`
--
ALTER TABLE `db_product_comment`
  ADD CONSTRAINT `fk_productcmt_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_productcmt_user` FOREIGN KEY (`user_id`) REFERENCES `db_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_product_img`
--
ALTER TABLE `db_product_img`
  ADD CONSTRAINT `fk_imglist_product` FOREIGN KEY (`product_id`) REFERENCES `db_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `db_user`
--
ALTER TABLE `db_user`
  ADD CONSTRAINT `fk_user_rank` FOREIGN KEY (`rank_id`) REFERENCES `db_member_card` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
