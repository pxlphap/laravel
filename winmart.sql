-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 20, 2023 lúc 02:11 PM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `winmart`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_12_183814_create_tbl_category_product', 2),
(6, '2023_08_15_125942_crate_tbl_brand_product', 3),
(7, '2023_08_15_135842_crate_tbl_product', 4),
(8, '2021_06_28_062502_create_tbl_customer', 5),
(9, '2021_06_28_070948_create_tbl_shipping', 5),
(10, '2021_06_29_151710_create_tbl_payment', 5),
(11, '2021_06_29_151726_create_tbl_order', 5),
(12, '2021_06_29_151753_create_tbl_order_detail', 5),
(13, '2021_07_13_031510_create_tbl_coupon', 5),
(14, '2021_07_14_130539_create_tbl_feeship', 5),
(16, '2023_09_18_070225_create_tbl_contact_table', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int UNSIGNED NOT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(2, 'Nhật Bản', 'Nhật bản kimochi', 1, NULL, NULL),
(3, 'Trung Quốc', 'Nghĩ đến trung quốc chắc bạn lại nhớ đến táo tàu!', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int UNSIGNED NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Quả', 'Quả là 1 loại quả', 1, NULL, NULL),
(2, 'Rau', 'Rau là thực vật có chất xơ', 1, NULL, NULL),
(7, 'Củ', 'Củ là các kiểu khác nhau của các cấu trúc thực vật bị biến đổi và phình to ra để lưu trữ các chất dinh dưỡng. Nó được thực vật sử dụng để vượt qua mùa đông và tái phát triển vào năm sau cũng như để sinh sản sinh dưỡng.', 1, NULL, NULL),
(8, 'Hải sản', 'Củ là các kiểu khác nhau của các cấu trúc thực vật bị biến đổi và phình to ra để lưu trữ các chất dinh dưỡng. Nó được thực vật sử dụng để vượt qua mùa đông và tái phát triển vào năm sau cũng như để sinh sản sinh dưỡng.', 1, NULL, NULL),
(9, 'Thịt', 'Thịt thực phẩm hay gọi thường là thịt là mô cơ của một số loài động vật như bò, lợn, gà được dùng làm thực phẩm cho con người. Con người đã săn bắt và giết động vật để lấy thịt từ thời tiền sử. Sự ra đời của nền văn minh cho phép các loài động vật như gà, cừu, thỏ, lợn và gia súc được thuần hóa.', 1, NULL, NULL),
(10, 'Rau thơm', 'Trong ẩm thực, rau thơm hay rau gia vị là khái niệm khái quát dùng để chỉ các loại rau ăn được, được trồng hoặc hái từ tự nhiên mà có mùi thơm đặc trưng tùy theo loại do các tinh dầu trong rau bay hơi tạo thành. Thơm còn là tên gọi tắt của người Hà Nội dành cho loại húng thơm mà nổi tiếng nhất là húng thơm làng Láng.', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contact_id` int UNSIGNED NOT NULL,
  `contact_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `contact_name`, `contact_email`, `contact_title`, `contact_content`, `created_at`, `updated_at`) VALUES
(1, 'phap', 'pxlphap@gmail.com', 'Vải', 'Còn không?', NULL, NULL),
(2, 'phap', 'pxlphap@gmail.com', 'Vải', 'Còn không?', NULL, NULL),
(3, 'phap', 'pxlphap@gmail.com', 'Vải', 'hello', NULL, NULL),
(4, 'phap', 'pxlphap@gmail.com', 'Vải', 'ưê', NULL, NULL),
(5, 'cường', 'cuong@gmail.com', 'Chôm Chôm', 'mặt hàng này còn không?', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `coupon_id` int UNSIGNED NOT NULL,
  `coupon_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_time` int NOT NULL,
  `coupon_number` int NOT NULL,
  `coupon_condition` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_coupon`
--

INSERT INTO `tbl_coupon` (`coupon_id`, `coupon_name`, `coupon_code`, `coupon_time`, `coupon_number`, `coupon_condition`, `created_at`, `updated_at`) VALUES
(1, 'Giảm 10k', 'giam10k', 100, 10000, 2, NULL, NULL),
(2, 'Giảm 10%', 'giam10%', 100, 10, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int UNSIGNED NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_password`, `created_at`, `updated_at`) VALUES
(1, 'Dinh Xuan Hoang', 'dxhoang@gmail.com', '123', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL),
(2, 'Bui Van Phap', 'pxlphap@gmail.com', '0383848623', '17d55b5b5a221238017e41bdb4ef995d', NULL, NULL),
(3, 'Vũ Văn Cường', 'pxlcuong@gmail.com', '0383848623', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(4, 'Nguyễn Xuân Trường', 'pxltruong@gmail.com', '0383848623', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(5, 'Hoàng', 'hoang@gmail.com', '123456', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_feeship`
--

CREATE TABLE `tbl_feeship` (
  `fee_id` int UNSIGNED NOT NULL,
  `fee_matp` int NOT NULL,
  `fee_maqh` int NOT NULL,
  `fee_xaid` int NOT NULL,
  `fee_feeship` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `shipping_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `order_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '348940.90', 'Đang chờ xử lý', NULL, NULL),
(2, 2, 2, 2, '64271.90', 'Đang chờ xử lý', NULL, NULL),
(4, 2, 3, 4, '13203.30', 'Đang chờ xử lý', NULL, NULL),
(12, 2, 4, 12, '13203.30', 'Đang chờ xử lý', NULL, NULL),
(20, 2, 7, 21, '135300.00', 'Đang chờ xử lý', NULL, NULL),
(21, 2, 8, 22, '51068.60', 'Đang chờ xử lý', NULL, NULL),
(22, 2, 9, 23, '135300.00', 'Đang chờ xử lý', NULL, NULL),
(26, 2, 10, 27, '141743.80', 'Đang chờ xử lý', NULL, NULL),
(27, 2, 11, 28, '310206.60', 'Đang chờ xử lý', NULL, NULL),
(28, 4, 12, 29, '13203.30', 'Đang chờ xử lý', NULL, NULL),
(29, 2, 14, 30, '26406.60', 'Đang chờ xử lý', NULL, NULL),
(30, 2, 15, 31, '761291.30', 'Đang chờ xử lý', NULL, NULL),
(31, 2, 16, 32, '13203.30', 'Đang chờ xử lý', NULL, NULL),
(32, 2, 17, 33, '266457.40', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quanlity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quanlity`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Thịt gà', '23213', 1, NULL, NULL),
(2, 1, 5, 'Thịt gà', '12003', 2, NULL, NULL),
(3, 1, 3, 'Dưa chuột', '12000', 2, NULL, NULL),
(4, 1, 2, 'Bò Cube', '123000', 2, NULL, NULL),
(5, 2, 4, 'Thịt gà', '23213', 2, NULL, NULL),
(6, 2, 5, 'Thịt gà', '12003', 1, NULL, NULL),
(7, 4, 5, 'Thịt gà', '12003', 1, NULL, NULL),
(8, 12, 5, 'Thịt gà', '12003', 1, NULL, NULL),
(11, 20, 2, 'Bò Cube', '123000', 1, NULL, NULL),
(12, 21, 4, 'Thịt gà', '23213', 2, NULL, NULL),
(13, 22, 2, 'Bò Cube', '123000', 1, NULL, NULL),
(14, 26, 4, 'Thịt gà', '23213', 4, NULL, NULL),
(15, 26, 5, 'Thịt gà', '12003', 2, NULL, NULL),
(16, 26, 3, 'Dưa chuột', '12000', 1, NULL, NULL),
(17, 27, 3, 'Dưa chuột', '12000', 1, NULL, NULL),
(18, 27, 5, 'Thịt gà', '12003', 2, NULL, NULL),
(19, 27, 2, 'Bò Cube', '123000', 2, NULL, NULL),
(20, 28, 5, 'Thịt gà', '12003', 1, NULL, NULL),
(21, 29, 5, 'Thịt gà', '12003', 2, NULL, NULL),
(22, 30, 5, 'Thịt gà', '12003', 6, NULL, NULL),
(23, 30, 4, 'Thịt gà', '23213', 5, NULL, NULL),
(24, 30, 2, 'Bò Cube', '123000', 4, NULL, NULL),
(25, 30, 3, 'Dưa chuột', '12000', 1, NULL, NULL),
(26, 31, 5, 'Thịt gà', '12003', 1, NULL, NULL),
(27, 32, 5, 'Thịt gà', '12003', 7, NULL, NULL),
(28, 32, 4, 'Thịt gà', '23213', 1, NULL, NULL),
(29, 32, 3, 'Dưa chuột', '12000', 1, NULL, NULL),
(30, 32, 2, 'Bò Cube', '123000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int UNSIGNED NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, '2', 'Đang chờ xử lý', NULL, NULL),
(2, '1', 'Đang chờ xử lý', NULL, NULL),
(3, '2', 'Đang chờ xử lý', NULL, NULL),
(4, '1', 'Đang chờ xử lý', NULL, NULL),
(5, '1', 'Đang chờ xử lý', NULL, NULL),
(6, '1', 'Đang chờ xử lý', NULL, NULL),
(7, '1', 'Đang chờ xử lý', NULL, NULL),
(8, '1', 'Đang chờ xử lý', NULL, NULL),
(9, '2', 'Đang chờ xử lý', NULL, NULL),
(10, '2', 'Đang chờ xử lý', NULL, NULL),
(11, '2', 'Đang chờ xử lý', NULL, NULL),
(12, '1', 'Đang chờ xử lý', NULL, NULL),
(13, '1', 'Đang chờ xử lý', NULL, NULL),
(14, '1', 'Đang chờ xử lý', NULL, NULL),
(15, '1', 'Đang chờ xử lý', NULL, NULL),
(16, '1', 'Đang chờ xử lý', NULL, NULL),
(17, '1', 'Đang chờ xử lý', NULL, NULL),
(18, '1', 'Đang chờ xử lý', NULL, NULL),
(19, '1', 'Đang chờ xử lý', NULL, NULL),
(20, '1', 'Đang chờ xử lý', NULL, NULL),
(21, '2', 'Đang chờ xử lý', NULL, NULL),
(22, '1', 'Đang chờ xử lý', NULL, NULL),
(23, '1', 'Đang chờ xử lý', NULL, NULL),
(24, '1', 'Đang chờ xử lý', NULL, NULL),
(25, '1', 'Đang chờ xử lý', NULL, NULL),
(26, '1', 'Đang chờ xử lý', NULL, NULL),
(27, '1', 'Đang chờ xử lý', NULL, NULL),
(28, '1', 'Đang chờ xử lý', NULL, NULL),
(29, '1', 'Đang chờ xử lý', NULL, NULL),
(30, '1', 'Đang chờ xử lý', NULL, NULL),
(31, '1', 'Đang chờ xử lý', NULL, NULL),
(32, '1', 'Đang chờ xử lý', NULL, NULL),
(33, '1', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int UNSIGNED NOT NULL,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_price`, `product_desc`, `product_content`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(2, 10, 3, 'Bò Cube', '123000', 'er', 'cd', 'pet-auto-drink49.jpg', 1, NULL, NULL),
(3, 1, 2, 'Dưa chuột', '12000', 'đẹp', 'chất lượng', '356204471_1023100982029368_5340699213101830997_n42.jpg', 1, NULL, NULL),
(4, 9, 3, 'Thịt gà', '23213', 'đẹp chất lượng', 'cd', 'pet-auto-drink436.jpg', 1, NULL, NULL),
(5, 10, 3, 'Thịt gà', '12003', 'đẹp chất lượng', 'cd', 'pet-auto-drink373.jpg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int UNSIGNED NOT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_note`, `created_at`, `updated_at`) VALUES
(1, 'Phap', 'hung yen', '0383848623', 'pxlphap@gmail.com', 'dong goi can than', NULL, NULL),
(2, 'Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(3, 'Bùi Văn Pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đẹp', NULL, NULL),
(4, 'Bùi Văn Pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(5, 'pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(6, 'pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(7, 'Bùi Văn Pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đóng gói cẩn thận', NULL, NULL),
(8, 'Bùi Văn Pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ádf', NULL, NULL),
(9, 'Bùi Văn Pháp', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(10, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(11, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đóng gói đầy đủ', NULL, NULL),
(12, 'Nguyễn Xuân Trường', 'Thái Nguyên', '0383848623', 'pxltruong@gmail.com', 'Đóng gói cẩn thận, giao hàng trước 10h tối', NULL, NULL),
(13, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(14, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(15, 'Bui Van Phap', 'Thái Nguyên', '0383848623', 'pxlphap@gmail.com', 'Đóng gói cẩn thận', NULL, NULL),
(16, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đóng gói cẩn thận', NULL, NULL),
(17, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'abc', NULL, NULL),
(18, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', '1234', NULL, NULL),
(19, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'sad', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pháp', 'pxlphap@gmail.com', '2023-08-12 18:09:29', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL),
(3, 'Trường', 'pxltruong@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL),
(7, 'Tuệ', 'tue@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Chỉ mục cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_feeship`
--
ALTER TABLE `tbl_feeship`
  ADD PRIMARY KEY (`fee_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `coupon_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_feeship`
--
ALTER TABLE `tbl_feeship`
  MODIFY `fee_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
