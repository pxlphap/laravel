-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 23, 2023 lúc 12:44 PM
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
-- Cơ sở dữ liệu: `fruit`
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
(16, '2023_09_18_070225_create_tbl_contact_table', 6),
(17, '2023_09_23_091913_add_sl_to_tbl_product', 7),
(18, '2023_09_23_111035_rename_order_status_column', 8);

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
(2, 'Nhật Bản', 'Nhật bản', 1, NULL, NULL),
(3, 'Trung Quốc', 'Nghĩ đến trung quốc chắc bạn lại nhớ đến táo tàu!', 1, NULL, NULL),
(4, 'Mỹ', 'hàng hóa từ Mỹ', 0, NULL, NULL),
(5, 'Việt Nam', 'hàng nội địa', 0, NULL, NULL);

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
  `contact_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, 'cường', 'cuong@gmail.com', 'Chôm Chôm', 'mặt hàng này còn không?', NULL, NULL),
(6, 'hoang', 'hoang@gmail.com', 'Nhãn', 'Mặt hàng này có chưa', NULL, NULL),
(7, 'phap', 'pxlphap@gmail.com', 'Vải', 'còn không', NULL, NULL);

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
(2, 'Giảm 10k', 'giam10k', 988, 10000, 2, NULL, NULL),
(3, 'giảm 10%', 'giam10%', 1000, 10, 1, NULL, NULL);

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
  `coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `coupon_id`, `created_at`, `updated_at`) VALUES
(51, 2, 46, 59, '23000', '2', '2023-09-23 05:01:08', NULL),
(52, 2, 47, 60, '3290000', '2', '2023-09-23 05:15:09', NULL);

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
(63, 51, 42, 'Nước cam ép', '30000', 1, '2023-09-23 05:01:08', NULL),
(64, 52, 41, 'Trứng Cá Tầm', '3000000', 1, '2023-09-23 05:15:09', NULL);

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
(28, '1', 'Đã giao', NULL, NULL),
(29, '1', 'Đã giao', NULL, NULL),
(30, '1', 'Đang chờ xử lý', NULL, NULL),
(31, '1', 'Đang chờ xử lý', NULL, NULL),
(32, '1', 'Đang chờ xử lý', NULL, NULL),
(33, '1', 'Đang chờ xử lý', NULL, NULL),
(34, '1', 'Đang chờ xử lý', NULL, NULL),
(35, '1', 'Đang chờ xử lý', NULL, NULL),
(36, '2', 'Đang chờ xử lý', NULL, NULL),
(37, '1', 'Đang chờ xử lý', NULL, NULL),
(38, '1', 'Đang chờ xử lý', NULL, NULL),
(39, '1', 'Đang chờ xử lý', NULL, NULL),
(40, '1', 'Đã giao', NULL, NULL),
(41, '1', 'Đã giao', NULL, NULL),
(42, '2', 'Đã giao', NULL, NULL),
(43, '1', 'Đang chờ xử lý', NULL, NULL),
(44, '1', 'Đã giao', NULL, NULL),
(45, '1', 'Đang chờ xử lý', NULL, NULL),
(46, '1', 'Đã giao', NULL, NULL),
(47, '1', 'Đã giao', NULL, NULL),
(48, '1', 'Đang chờ xử lý', NULL, NULL),
(49, '1', 'Đã giao', NULL, NULL),
(50, '1', 'Đang chờ xử lý', NULL, NULL),
(59, '1', 'Đã giao', '2023-09-23 05:01:08', NULL),
(60, '2', 'Đang giao', '2023-09-23 05:15:09', NULL);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_price`, `product_desc`, `product_content`, `product_image`, `product_status`, `created_at`, `updated_at`, `quantity`) VALUES
(5, 1, 3, 'Quả dứa', '100000', 'Dứa có các tên gọi khác như là: khóm, thơm, ba la, tên khoa học Ananas comosus, là một loại quả nhiệt đới. Dứa là cây bản địa của Paraguay và miền nam Brasil[2].\r\n\r\nQuả dứa thường gọi thực ra là trục của bông hoa và các lá bắc mọng nước tụ hợp lại, còn quả thật là các \"mắt dứa\".[3][4] Dứa được ăn tươi hoặc đóng hộp dưới dạng khoanh, miếng, nước ép hoặc nước quả hỗn hợp. Có hai loại dứa, dứa có gai và không có gai: dứa có gai, miền Tây gọi là \"khóm\" còn không có gai gọi là \"Thơm\".', 'Dinh dưỡng\r\nQuả dứa\r\n\r\nGiá trị dinh dưỡng cho mỗi 100 g (3,5 oz)\r\nNăng lượng	202 kJ (48 kcal)\r\nCacbohydrat\r\n12.63 g\r\nĐường	9.26 g\r\nChất xơ	1.4 g\r\nChất béo\r\n0.12 g\r\nChất đạm\r\n0.54 g\r\nVitamin\r\nThiamine (B1)	(7%)0.079 mg\r\nRiboflavin (B2)	(3%)0.031 mg\r\nNiacin (B3)	(3%)0.489 mg\r\nPantothenic acid (B5)	(4%)0.205 mg\r\nVitamin B6	(8%)0.110 mg\r\nFolate (B9)	(4%)15 μg\r\nVitamin C	(44%)36.2 mg\r\nChất khoáng\r\nCanxi	(1%)13 mg\r\nSắt	(2%)0.28 mg\r\nMagiê	(3%)12 mg\r\nPhốt pho	(1%)8 mg\r\nKali	(2%)115 mg\r\nKẽm	(1%)0.10 mg\r\nĐơn vị quy đổi\r\nμg = microgam • mg = miligam\r\nIU = Đơn vị quốc tế (International unit)\r\nTỷ lệ phần trăm xấp xỉ gần đúng sử dụng lượng hấp thụ thực phẩm tham chiếu (Khuyến cáo của Hoa Kỳ) cho người trưởng thành.\r\nNguồn: CSDL Dinh dưỡng của USDA\r\nQuả dứa có hàm lượng axit hữu cơ cao (axit malic và axit xitric).\r\n\r\nDứa là nguồn cung cấp mangan dồi dào cũng như có hàm lượng Vitamin C và Vitamin B1 khá cao[5].\r\n\r\nMột tài liệu khác cho biết: Trong 100 g phần ăn chứa 25 kcal, 0,03 mg caroten, 0,08 mg vitamin B1, 0,02 mg vitamin B2, 16 mg vitamin C (dứa tây). Các chất khoáng: 16 mg Ca, 11 mg phosphor, 0,3 mg Fe, 0,07 mg Cu, 0,4g protein, 0,2 g lipid, 13,7 g hydrat cacbon, 85,3 g nước, 0,4 g chất xơ.[6]\r\n\r\nVideo cắt vỏ lá dứa\r\nTrong quả dứa có chứa enzym bromelain, có thể phân huỷ protein. Do vậy, quả dứa được sử dụng trong chế biến một số món ăn như hải sản xào để giúp thịt nhanh mềm và tạo hương vị đặc trưng. Ở Thái Lan người ta dùng dứa chua thay vì me hay chanh, cóc để tạo vị chua thanh cho món tom yum cũng như người Việt sử dụng chứa để nấu canh như canh dứa nấu cá.', '131223hinh-nen-trai-cay-dua-chin-vang-tuoi58.jpg', 0, NULL, NULL, 1230),
(6, 1, 3, 'Táo Xanh Trung Quốc', '50000', 'Táo GrannySmith (Táo Xanh Mỹ) có nguồn gốc từ Úc du nhập vào Mỹ năm 1868. Táo có màu xanh lá, vị chua đậm, rất giòn, nhiều nước.', 'Mùa vụ\r\n\r\nTáo xanh Mỹ được thu hoạch vào tháng 10 và ta có thể mua Táo Xanh quanh năm.\r\n\r\nCông dụng\r\n\r\nMột quả táo cỡ trung bình chứa khoảng 4g chất xơ. Một phần trong số chất xơ đó ở dạng Pectin - loại chất xơ hòa tan có tác dụng giảm lượng cholesterol \"xấu\"; Chất xơ phức tạp của táo giúp no lâu hơn mà không bị tiêu thụ nhiều calo (một quả táo bình thường chỉ chứa khoảng 95 calo). Một loại axit có trong vỏ táo là Axit Ursolic làm giảm nguy cơ béo phì, Axit Ursolic thúc đẩy cơ thể đốt cháy calo, tăng việc hình thành cơ và giảm chất béo lâu năm trong cơ thể. Táo là nguồn cung cấp vitamin C tuyệt vời, có tác dụng tăng cường hệ thống miễn dịch. Mỗi quả táo chứa khoảng 8mg vitamin này, vì thế chúng sẽ cung cấp khoảng 14% nhu cầu vitamin C hàng ngày của cơ thể. Cũng giống như quả lê và quả việt quất, táo có mối liên hệ với việc giảm thiểu nguy cơ mắc bệnh tiểu đường túyp 2 nhờ chất chống oxy hóa có tên Anthocyanins, hơn nữa trong táo có chất Triterpenoids có khả năng chống lại các bệnh ung thư gan, ruột kết và ung thư vú.\r\n\r\nBảo quản\r\n\r\nBảo quản tại nhà: Tủ lạnh từ 4 đến 8 độ C: Táo xanh Mỹ giữ được độ tươi, độ giòn trong vòng 1-4 tuần. Sau thời gian này, táo xanh sẽ ngọt hơn, độ PSI thấp hơn (táo xốp hơn). Cần tránh để táo với các thực phẩm có mùi khác như hành, tỏi, táo sẽ dễ nhiễm mùi.', 'tao46.jpg', 0, NULL, NULL, 1120),
(7, 1, 2, 'Nho', '60000', 'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng + -10%.\r\nNho xanh không hạt đang là một trong những giống nho phổ biến và yêu thích nhất hiện nay. Vỏ của chúng có màu xanh lá cây khi nho chín ngả sang màu vàng. Quả có hình bầu dục, dày thịt chắc ngọt, nhiều nước và đặc biệt là không có hạt.', 'Nho được đưa đến Úc vào năm 1788, với môi trường khí hậu khô nóng vào mùa hè và điều kiện về thổ nhưỡng phù hợp rất thích hợp để nho xanh phát triển và đạt được chất lượng tốt nhất.\r\n\r\nMột cây nho sẽ mất 3 – 5 năm để kết quả và để trưởng thành. Do có sự đòi hỏi khắt khe về khí hậu nên nho xanh Úc không thể trồng phổ biến tại nhiều quốc gia mà chỉ được trồng tại một số vùng của ÚC. Đặc biệt, loại quả này thường mắc một số bệnh vào mùa thu hoạch như thối lá, nẫu quả… Chính vì thế, để thu hoạch được nho xanh úc, người trồng phải theo dõi và bảo vệ cây cực kỳ khắt khe và nghiêm ngặt.', 'nho25.jpg', 0, NULL, NULL, 1230),
(8, 1, 2, 'Vải Thiều', '400000', 'Những quả vải được tuyển chọn , người nông dân cắt hái vận chuyển vào SG trong ngày , hàng khô đi bay, ngon ngọt, quả có xen lẫn hạt to nhỏ, nhưng ko đáng kể , ăn ngon số dzach, ăn 1 lần lại ăn tiếp lần 2  .', 'Vào cuối thế kỷ 19 đầu thế kỷ 20, cụ Hoàng Văn Cơm quê ở Thanh Hà, Hải Dương làm công việc khuân vác ở cảng Hải Phòng. Khi đi làm ông đã nhặt được 6 hạt vải của những người lái buôn Thiều Châu (Trung Quốc) ăn quả rồi vứt đi, cụ đã đem về gieo trồng và mọc được 3 cây, nhưng chỉ 1 cây còn sống, được chăm sóc lớn lên, chiết cành để trồng thêm cho đến ngày nay.', 'vai-thieu67.png', 0, NULL, NULL, 120),
(9, 1, 2, 'Dừa Xiêm', '45000', 'Dừa Xiêm Tiện Lợi True Coco có vị ngọt mát và hương thơm tự nhiên, là một loại thức uống ưa thích và được sử dụng nhiều trong chế biến các món ăn ngon. Nước dừa giàu vitamin C, E, B1, B3, B5, B6, sắt, selen, natri, canxi, magiê và phốt pho. Nước dừa cũng là thức uống sạch, tinh khiết, tốt cho sức khỏe và làm đẹp da hiệu quả. Dừa xiêm giàu kaki và các khoáng chất, giúp điều hòa dịch nội bộ, bổ sung nước cho cơ thể, thúc đẩy quá trình trao đổi chất, điều hòa tốt lượng đường trong máu.\r\n\r\n\r\nTrái dừa xiêm xanh sau khi hái xuống sẽ được gọt vỏ, vệ sinh sạch. Dừa được bào vỏ tiện lợi, dễ dàng sử dụng, bạn chỉ cần cắm ống hút là có thể dùng ngay. Hướng dẫn bảo quản: Tủ mát nhiệt độ từ 4 – 8 độ C. Cảnh báo an toàn: Không sử dụng có dấu hiệu hư hỏng.', 'Thời tiết mùa hè nóng nực, một cốc nước dừa tươi sẽ giúp bạn giải nhanh cơn khát. Không những thế, theo các chuyên gia dinh dưỡng, nước dừa còn có công dụng tuyệt vời đối với sức khỏe. Nhờ nước dừa rất giàu kali và các khoáng chất khác nên nó điều hòa dịch nội bộ và bổ sung nước cho cơ thể. Nó đã được dùng để làm giảm chứng mất nước mỗi khi bạn bị bệnh lỵ, dịch tả, tiêu chảy, cúm và sự cân bằng chất điện phân.', 'tải xuống92.jpg', 0, NULL, NULL, 1230),
(10, 1, 2, 'Kiwi', '70000', 'Kiwi (đọc là Ki-vi) hay dương đào là một loài cây có quả mọng ăn được thuộc nhóm loài cây gỗ thân leo trong chi Dương đào.[1][2] Nhóm cây quả kiwi được trồng phổ biến nhất là Actinidia deliciosa \'Hayward\'[3] quả có hình bầu dục, kích thước bằng quả trứng gà cỡ lớn: dài 5–8 cm (2–3 in) và đường kính 4,5–5,5 cm (1+3⁄4–2+1⁄4 in). Vỏ mỏng, mờ, dạng sợi, có vị chua, vỏ của quả có màu nâu nhạt có thể ăn được, thịt quả màu xanh lục nhạt hoặc vàng với những hàng hạt nhỏ màu đen có thể ăn được. Quả có cấu trúc mềm mại với hương vị ngọt ngào và độc đáo.', 'Cây quả kiwi (thường được gọi tắt là kiwi ở Bắc Mỹ và Châu Âu) hay còn gọi là cây quả lý gai Trung Quốc. Các giống ban đầu được mô tả trong danh mục cây giống vào năm 1904 với nội dung \"...quả có thể ăn được to bằng quả óc chó, mang hương vị của lý gai chín\",[6] dẫn đến cái tên quả lý gai Trung Quốc (Chinese gooseberry).[1] Năm 1962, những người trồng trọt ở New Zealand bắt đầu gọi nó là \"quả kiwi\" (tiếng Anh: \"kiwifruit\", tiếng Māori: huakiwi)[7] do vẻ ngoài mờ giống với chim kiwi[8] để tiếp thị xuất khẩu, cái tên này được Turners & Growers đăng ký lần đầu tiên vào ngày 15 tháng 6 năm 1959[8] và sau đó được chính thức thông qua thương mại vào năm 1974.[1] Ở New Zealand và Úc, từ \"kiwi\" chỉ dùng để chỉ loài chim kiwi hoặc được dùng làm biệt danh gọi người New Zealand; nó hầu như chưa bao giờ được sử dụng để chỉ trái cây.[5][9] Quả kiwi đã trở thành tên gọi chung cho tất cả các loại quả kiwi xanh được trồng thương mại từ chi Actinidia.[1] Ở Hoa Kỳ và Canada, tên được rút gọn thành \"kiwi\" thường được sử dụng rộng rãi khi đề cập đến trái cây này.', 'tải xuống (1)76.jpg', 0, NULL, NULL, 1230),
(11, 1, 2, 'Hồng', '15000', 'Hồng là một loại cây ăn trái thuộc chi Thị (Diospyros). Quả hồng sắc vàng cam đến đỏ cam tùy theo giống; cỡ nhỏ đường kính dưới 1 cm cho tới cỡ lớn đường kính đến 9 cm. Dáng quả hình cầu, hình con cù, hay dạng quả cà chua bẹp. Đài hoa (calyx) thường dính với quả khi chín.', 'Loài hồng phổ biến nhất cho trái là hồng Nhật Bản (D. kaki). Trái chín thì ngọt, ít chua, thịt mềm, có khi bị xơ. Loài hồng này, nguyên thủy xuất phát từ Trung Hoa, là một loài cây thay lá, thường rụng lá khi ra quả (deciduous). Cây hồng sau được trồng khắp miền Đông Á, đến thế kỷ 19 thì du nhập vào California và châu Âu.\r\n\r\nGiống (cultivar) hồng mòng (Hachiya) có dáng con cù với lượng tannin cao khi còn xanh nên vị chát. Phải đợi thật chín mềm mới ăn được.\r\n\r\nĐể làm chóng chín, hồng mòng thường được đem rấm. Cách rấm có thể dùng ánh sáng, khí nóng, trấu, cồn, thán khí hay êtilen để ép chín. Một cách khác là đem ngâm nước tro để trái hồng biến chất, mất vị chát. Loại hồng này gọi là hồng ngâm.\r\n\r\nGiống hồng giòn (Fuyu) có dáng hình bẹp. Lượng tannin tuy không kém giống hồng mòng nhưng trong quá trình chuyển từ xanh sang chín, giống hồng giòn mất tanin rất nhanh nên trái có thể ăn được sớm hơn khi còn giòn. Thời vụ trồng khoảng tháng 6 hàng năm, sau 3 năm cây sẽ cho quả. Cây thường ra hoa vào tháng 3 âm lịch và cho quả chín đến hết tháng 8 âm lịch.\r\n\r\nQuả hồng có thể ăn tươi hay phơi khô. Hồng khô cần hai đến ba tuần phơi ngoài trời rồi sấy thêm trước khi thành phẩm.\r\n\r\nTại Hàn Quốc, hồng khô được dùng cất rượu, làm giấm', '420px-Persimmon-oliv238.jpg', 0, NULL, NULL, 1230),
(12, 1, 3, 'Na', '35000', '\"Na\" đổi hướng tới đây. Đối với các định nghĩa khác, xem Na (định hướng).\r\nNa\r\n\r\n\r\nQuả na khi bổ dọc\r\nTình trạng bảo tồn\r\n\r\nÍt quan tâm (IUCN 3.1)[1]\r\nPhân loại khoa họcedit\r\nGiới:	Plantae\r\nnhánh:	Tracheophyta\r\nnhánh:	Angiospermae\r\nnhánh:	Magnoliids\r\nBộ:	Magnoliales\r\nHọ:	Annonaceae\r\nChi:	Annona\r\nLoài:	A. squamosa\r\nDanh pháp hai phần\r\nAnnona squamosa\r\nL.[2]\r\nCác đồng nghĩa\r\nAnnona asiatica L.[3]\r\nAnnona cinerea Dunal\r\nGuanabanus squamosus (L.)M.Gómez[4] Xylopia glabra L.[5]\r\nAnnona forskahlii DC.[6]\r\n\r\nNa, còn gọi là mãng cầu/mãng cầu ta, sa lê, phan lệ chi, (danh pháp hai phần: Annona squamosa), là một loài thuộc chi Na (Annona) có nguồn gốc ở vùng châu Mỹ nhiệt đới. Nguồn gốc bản địa chính xác của loại cây này chưa rõ do hiện nay nó được trồng khắp nơi nhưng người ta cho rằng nó là cây bả', 'Na dai có ưu điểm ăn ngọt, để được lâu, không dễ nát, dễ bóc vỏ,[7] múi na nhằn dễ tróc ra khỏi hột và múi cũng dai hơn.[8] Quả na dai có vỏ mềm, màu xanh, thịt trắng lại ít hạt. Thêm vào đó, na dai được ưa chuộng hơn bởi mùi thơm và vị ngọt sắc nổi bật hơn so với na bở', '330px-Sugar_apple_with_cross_section6.jpg', 0, NULL, NULL, 1231230),
(13, 1, 3, 'Nhãn', '50000', 'Cây cao 9 -10 m. Vỏ cây xù xì, có màu xám. Thân nhiều cành, lá um tùm xanh tươi quanh năm. Lá kép hình lông chim, mọc so le, gồm 5 đến 9 lá chét hẹp, dài 7 - 20 cm, rộng 2,5 - 5 cm. Mùa xuân vào các tháng 2, 3, 4 ra hoa màu vàng nhạt, mọc thành chùm ở đầu cành hay kẽ lá, đài 5 - 6 răng, tràng 5 - 6, nhị 6 - 10, bầu 2 - 3 ô. Quả tròn có vỏ ngoài màu vàng xám, hầu như nhẵn. Hạt đen nhánh, có áo hạt màu trắng bao bọc. Mùa quả là vào khoảng tháng 7- 8. Cây nhãn tương đối chịu rét hơn so với các cây cùng họ như vải, đồng thời cũng ít kén đất hơn', 'Cây \"nhãn tổ\" với hàng trăm năm tuổi hiện vẫn còn ở chùa Thiên Ứng, tục gọi là chùa Hiến, Phố Hiến Hạ, nay thuộc phường Hồng Châu, thành phố Hưng Yên. Giống nhãn xuất phát từ Hưng Yên từ lâu đã có tiếng là ngon ngọt nên từng được tiến cung dâng vua. Cũng vì vậy mà còn được gọi là \"nhãn tiến vua\". Lê Quý Đôn đã ghi nhận hương vị xuất sắc của nhãn xứ Hưng Yên.\r\n\r\nTên \"nhãn lồng\" bắt nguồn từ việc khi nhãn chín phải dùng lồng bằng tre, nứa giữ cho chim, dơi khỏi ăn. Nhãn Hưng Yên có quả to, vỏ gai và dày, vàng sậm. Cùi nhãn dày và khô, mọng nước, hạt nhỏ. Vị thơm ngọt như đường phèn. Đáy quả có hai dẻ cùi lồng xếp rất khít.', '330px-Dimocarpus_longan_fruits45.jpg', 0, NULL, NULL, 1231230),
(14, 1, 2, 'Mít', '72000', 'Cây mít thuộc loại cây gỗ nhỡ cao từ 8 đến 15 m. Cây mít ra quả sau ba năm tuổi và quả của nó là loại quả phức, ăn được. Mít được coi là loại cây ăn trái với quả chín lớn nhất lớn trong các loài thảo mộc. Mít có giá trị thương mại. Mỗi trái khá lớn hình bầu dục kích thước 30–60 cm x 20–30 cm. Vỏ mít sù sì, có gai nhỏ. Mít ra quả vào khoảng giữa mùa xuân và chín vào cuối mùa hè (tháng 7-8).\r\n\r\nNó là một loại quả ngọt nhiệt đới. Ở vùng ôn đới thì mít thường bán trong dạng đóng hộp với siro nhưng sau này ở Mỹ và Âu châu cũng nhập cảng mít tươi.\r\n\r\nNgoài dạng mít đóng lon, mít còn được chế biến bằng cách sấy khô hoặc cắt thành lát mỏng rồi chiên giòn.', 'Trái mít có nhiều nhựa mít. Ở Việt Nam khi mít chín cắt xuống không bổ ra ngay mà để nguyên quả rồi dùng một thanh gỗ vót nhọn một đầu, đem đóng vào cuống mít để cho chảy bớt nhựa. Đợi thêm hai ba hôm sau, mới bổ mít ra thì bớt dính nhựa. Cách đó gọi là đóng nõ, trong bài thơ \"Quả mít\" của Hồ Xuân Hương có nhắc đến.', '420px-Jackfruit_hanging8.jpg', 0, NULL, NULL, 1230),
(15, 1, 3, 'Chôm Chôm', '56000', 'Tên gọi chôm chôm (hay lôm chôm) tượng hình cho trạng thái lông của quả loài cây này. Lông cũng là đặc tính cơ bản trong việc đặt tên của người Trung Quốc: hồng mao đan (红毛丹), hay của người Mã Lai: rambutan (trái có lông). Các nước phương Tây mượn giọng đọc của Mã Lai để gọi cây/trái chôm chôm: Anh, Đức gọi là rambutan, Pháp gọi là ramboutan.', 'Chôm chôm là loài cây thường xanh có thể phát triển đến chiều cao 12–20 m.[5] Các lá mọc so le với nhau, dài 10–30 cm, lá có hình lông chim với 3 đến 11 lá rời (en). Những bông hoa có kích thước nhỏ 2,5–5 mm.[5]\r\n\r\nCây chôm chôm có thể là cây đực (chỉ sản sinh túi phấn hoa do đó không đậu quả) hoặc cây cái (chỉ có hoa với chức năng giống cái) hoặc lưỡng tính (sản xuất hoa cái với một tỷ lệ nhỏ hoa đực).\r\n\r\nQuả hình tròn hoặc hình bầu dục, dài 3–6 cm (hiếm khi đến 8 cm) và rộng 3–4 cm, quả được kết và lớn dần trong một chùm có 10–20 quả. Vỏ có màu hơi đỏ (hiếm khi có màu cam hoặc vàng) và được bao phủ bởi các gai thịt mềm dẻo, do đó có tên \'lông\'. Các gai thịt góp phần vào quá trình thoát hơi nước của quả, có thể ảnh hưởng đến chất lượng của quả.[9]\r\n\r\nPhần thịt quả là vỏ mềm bao bọc hạt, trong mờ, hơi trắng hoặc hồng nhạt, có vị ngọt, chua nhẹ.[5]\r\n\r\nHạt đơn dài 1–1,3 cm, có vết nứt đôi màu trắng ở đáy hạt.[5] Hạt mềm và chứa các phần chất béo bão hòa và không bão hòa bằng nhau,[10] hạt có thể được nấu chín và ăn. Quả đã bốc vỏ có thể dùng để ăn sống hoặc nấu chín.', 'Rambutans_by_Muhammad_Mahdi_Karim30.jpg', 0, NULL, NULL, 1201),
(16, 1, 3, 'Cóc', '12000', 'Bản địa của cóc Thái là Trung Mỹ từ México xuống Peru, Brasil và Caribe nhưng đã lan rộng khắp vùng nhiệt đới như châu Phi, Ấn Độ, và Indonesia.\r\n\r\nTrái cóc Thái sắc xanh lục, có vị chua và giòn. Vỏ cóc Thái dày nhưng mềm. Cóc Thái có thể ăn sống hay đem muối, trái già thì thịt nhiều xơ. Trái cóc Thái chấm muối ớt là món ăn vặt phổ biến trong giới học sinh, sinh viên tại Việt Nam. Không những vậy nó còn được trộn gỏi, làm chân gà sốt Thái, ép nước uống hay ngâm chua ngọt,...', 'Quả cóc có thể ăn tươi; lớp cùi thịt dày, cứng, giòn và có vị hơi chua-ngọt. Tại Indonesia và Malaysia, nó được ăn kèm với một loại nước xốt mặn-ngọt màu đen và đặc, gọi là hayko. Nó cũng là thành phần chế biến món rojak, một món xà lách rau quả trong ẩm thực ở Malaysia, Singapore và Indonesia. Nó cũng thể được dùng để làm nước quả', 'Spondias_mombin_MS400513.JPG', 0, NULL, NULL, 110),
(17, 10, 2, 'Tía Tô', '23000', 'Tía tô (danh pháp hai phần: Perilla frutescens var. crispa, đồng nghĩa: Perilla macrostachya, Perilla ocymoides, Perilla urticifolia, Ocimum frutescens) là một trong số khoảng 8 loài cây tía tô thuộc họ Hoa môi (Lamiaceae hay Labiatae) giống như húng.[2] Loài tía tô bản địa mọc trải rộng từ Ấn Độ sang Đông Á gồm Việt Nam.', 'Cây thảo, cao 0,5-1m. Lá mọc đối, mép khía răng, mặt dưới tím tía, có khi hai mặt đều tía, nâu hay màu xanh lục có lông nhám. Hoa nhỏ mọc thành xim co ở đầu cành, màu trắng hay tím, mọc đối. Quả bé, hình cầu. Toàn cây có tinh dầu thơm và có lông. Loài tía tô mép lá quăn (Perilla ocymoides L. var. bicolorlaciniata) có giá trị sử dụng cao hơn. Ngoài ra lá tía tô của Triều Tiên hay Nhật Bản có hai mặt đều xanh, có giá trị cao để xuất, nhập khẩu. Loại này được gọi là perilla frutescens.', 'Perilla_frutescens_var14.JPG', 0, NULL, NULL, 1230),
(18, 10, 2, 'Xà Lách', '7000', 'Đối với các định nghĩa khác, xem Rau diếp (định hướng).\r\nXà lách\r\n\r\nXà lách ở miền Nam Việt Nam\r\nPhân loại khoa học\r\nGiới (regnum)	Plantae\r\n(không phân hạng)	Angiospermae\r\n(không phân hạng)	Eudicots\r\n(không phân hạng)	Asterids\r\nBộ (ordo)	Asterales\r\nHọ (familia)	Asteraceae\r\nChi (genus)	Lactuca\r\nLoài (species)	L. sativa\r\nDanh pháp hai phần\r\nLactuca sativa\r\nL.\r\nDanh pháp đồng nghĩa[1]\r\nLactuca capitata (L.) DC.\r\nLactuca crispa (L.) Roth\r\nLactuca dregeana DC.\r\nLactuca laciniata Roth\r\nLactuca palmata Willd.\r\nLactuca sativa subsp. asparagina (L.H.Bailey) Janch.\r\nLactuca sativa subsp. capitata (L.) Schübl. & G.Martens\r\nLactuca sativa subsp. crispa (L.) Schübl. & G.Martens\r\nLactuca sativa subsp. longifolia (Lam.) Alef.\r\nLactuca sativa subsp. minii Hadidi\r\nLactuca sativa subsp. romana Schübl. & G.Martens\r\nLactuca sativa var. sativa\r\nLactuca sativa subsp. sativa\r\nLactuca sativa subsp. secalina Alef.\r\nLactuca scariola var. sativa (L.) Boiss.\r\nLactuca scariola var. sativa Moris\r\nXà lách[2] hay còn gọi cải bèo[2], cải tai bèo[3] (danh pháp khoa học: Lactuca sativa) là loài thực vật có hoa thuộc họ Cúc được nhà thực vật L. mô tả khoa học lần đầu năm 1753.[1] Nó thường được trồng làm rau ăn lá, đặc biệt trong món xa lát, bánh mì kẹp, hăm-bơ-gơ và nhiều món ăn khác.\r\n\r\nNgoài ra nó còn được gọi là rau diếp[3], được biết đến từ thời xa xưa vì đặc tính giải khát, tinh khiết và giúp an thần của nó. Tên của nó bắt nguồn từ loại nước trắng đục (cao su) chảy rỉ ra từ thân cây rau sau khi được cắt', 'Lá cây màu xanh, thỉnh thoảng có thể là tía, phiến lá thuôn dài và không phẳng. Lá có thể ăn sống được hoặc luộc qua. Thân thẳng có vỏ màu trắng, phần bên trong mềm, chưa nhiều dinh dưỡng, có thể ăn được thông qua luộc, nấu canh, nướng hoặc xào.', '420px-Xà_lách23.jpg', 0, NULL, NULL, 1230),
(19, 9, 3, 'Bò Kobe', '80000000', 'hịt bò Kobe (神戶ビーフ (Thần Hộ beef) Kōbe bīfu?) là loại thịt bò nổi tiếng thế giới và là một đặc sản của thành phố Kobe thuộc vùng Kinki, Nhật Bản thịt được lấy từ Bò Kobe một giống bò thịt độc đáo của vùng Kobe. Bò Kobe là một trong 3 giống bò Wagyū cho thịt ngon nhất với hương thơm nhẹ, vị béo quyện cùng với những thớ thịt mượt mà như tan dần trong miệng đã làm cho thịt bò Kobe được xếp vào hàng \"cực phẩm\".[1] Các kỹ thuật nuôi dưỡng bò đặc biệt đã khiến cho thịt bò Kobe có các hương vị rất đặc trưng và không giống một loại thịt bò nào trên thế giới. Thịt bò Kobe rất đắt tiền, một cân Anh (0,454 kg) trị giá hơn 300 USD, loại đặc biệt có giá hơn 1.000 USD. Riêng tại Việt Nam, thịt bò Kobe có giá nhập khẩu không dưới 4 triệu đồng/kg.[1][2] Ở Hà Nội, giá của một bát phở bò Kobe lên đến 850.000 đồng, cao gấp 40 lần so với một bát phở bình thường.[3] Bò Kobe có thể được chế biến thành bít tết, sukiyaki, shabu shabu, sashimi, teppanyaki và nhiều loại khác', 'hịt bò Kobe tuy rất nổi tiếng nhưng thực khách chỉ có thể tìm được bò Kobe thứ thiệt tại Nhật Bản, Macau[7] và Hồng Kông.[6][8] Kể từ năm 2011, Macau là nơi duy nhất trên thế giới được nhập khẩu loại thịt bò này, và bắt đầu nhập khẩu vào Hồng Kông vào tháng 7 năm 2012.[8] Thế nhưng, một thực tế rằng thương hiệu bò Kobe lại tràn ngập trong khắp các cửa hàng trên nước Mỹ, thậm chí người tiêu dùng còn có thể đặt hàng qua mạng. Các món ăn làm từ \"thịt bò Kobe\" này cũng đắt hơn nhiều lần so với các món ăn cùng loại khác. Chẳng hạn, một \"hamburger Kobe\" có giá lên đến 40$.[9] Theo thống kê, hiện cả thế giới chỉ có khoảng 3.000 con bò Kobe, và dĩ nhiên, không có con nào ở ngoài Nhật Bản.[7] Tại Hoa Kỳ, tất cả các sản phẩm thịt bò từ Nhật Bản không được nhập khẩu vào Hoa Kỳ từ năm 2010 do bệnh lở mồm long móng.[10] Chính vì vậy, tác giả Larry Olmsted, tác giả của loạt bài viết \"Food\'s biggest scam: The great Kobe beef lie\" (Vụ lừa đảo thực phẩm lớn nhất: Lời nói dối vĩ đại về thịt bò Kobe) đăng trên Forbes,[11] đã nói rằng tất cả thịt bò Kobe tại Mỹ đều là hàng giả.[9]', 'Kobe_Beef94.jpg', 0, NULL, NULL, 2310),
(20, 8, 2, 'Cá Ngừ vây xanh', '3000000', 'Tươi', 'Cá ngừ vây xanh được tìm thấy chủ yếu ở Thái Bình Dương và Ấn Độ Dương, ngoài ra chúng còn có thể sống ở Đại Tây Dương và Địa Trung Hải. Chúng có thể sống đến 40 năm và lặn ở độ sâu hơn 1.200 m. Một con cá có cân nặng trung bình khoảng 150 kg. Cá ngừ vây xanh Thái Bình Dương có thể nặng 450 kg. Có trường hợp con cá ngừ vây xanh khổng lồ nặng trên 100 kg có giá trị lên tới 36 tỷ đồng, dài khoảng 2,1m, nặng 136 kg, trước đó người ta đã bắt được một con cá ngừ vây xanh nặng tới 411 kg, có giá trị lên tới 2 triệu USD (hơn 40 tỷ đồng)\r\n\r\nĐây là loài cá hiếm và có số lượng giảm mạnh trong nhiều năm qua. Cá ngừ vây xanh hiện được xếp vào danh sách các loài đang gặp nguy hiểm. Số lượng cá ngừ trên toàn cầu bắt đầu giảm từ những năm 1960, khi các phương pháp đánh bắt cá mới được giới thiệu, dẫn đến tình trạng loài này bị đánh bắt quá mức.', 'Thunnus_orientalis_(Osaka_Kaiyukan_Aquarium)88.jpg', 0, NULL, NULL, 12323),
(21, 9, 3, 'Hổ Trung Quốc', '340000', 'Thịt ngon, dai thơm', 'Hổ Đông Dương hay hổ Corbett (danh pháp khoa học: Panthera tigris corbetti) là một phân loài hổ sống chủ yếu ở bán đảo Đông Dương, được tìm thấy tại Campuchia, Lào, Myanma, Thái Lan và Việt Nam. Tên gọi \"hổ Corbett\" có nguồn gốc từ tên gọi khoa học của nó là Panthera tigris corbetti, và tên gọi này được đặt vào năm 1968 để ghi công nhà bảo tồn nổi tiếng Jim Corbett.', 'Panthera_tigris_corbetti_0146.jpg', 0, NULL, NULL, 3230),
(22, 9, 3, 'Thịt Hổ Mỹ', '5000000', 'Thịt ngon, dai thơm', 'Hổ Mỹ hay hổ Corbett (danh pháp khoa học: Panthera tigris corbetti) là một phân loài hổ sống chủ yếu ở bán đảo Đông Dương, được tìm thấy tại Campuchia, Lào, Myanma, Thái Lan và Việt Nam. Tên gọi \"hổ Corbett\" có nguồn gốc từ tên gọi khoa học của nó là Panthera tigris corbetti, và tên gọi này được đặt vào năm 1968 để ghi công nhà bảo tồn nổi tiếng Jim Corbett.', 'Panthera_tigris_corbetti_0140.jpg', 0, NULL, NULL, 1230),
(23, 7, 2, 'Cà Rốt', '23000', 'To đều, dài, nhiều râu', 'Cà rốt (bắt nguồn từ tiếng Pháp carotte /kaʁɔt/,[1] danh pháp khoa học: Daucus carota subsp. sativus) là một loại cây có củ, thường có màu đỏ, vàng, trắng hay tía. Phần ăn được của cà rốt là củ, thực chất là rễ cái của nó, chứa nhiều tiền tố của vitamin A tốt cho mắt.\r\n\r\nTrong tự nhiên, nó là loại cây sống hai năm, phát triển một nơ chứa lá trong mùa xuân và mùa hè, trong khi đó vẫn tích lũy một lượng lớn đường trong rễ cái to mập, tích trữ năng lượng để ra hoa trong năm thứ hai. Thân cây mang hoa có thể cao tới 1 m (3 ft), với hoa tán chứa các hoa nhỏ màu trắng, sinh ra quả, được các nhà thực vật học gọi là quả nẻ[2]\r\n\r\nCà rốt là loại củ chứa lượng natri vừa đủ để duy trì huyết áp ở mức hợp lý trong cơ thể. Đối với những người tiêu thụ cà rốt thường xuyên sẽ có tỷ lệ duy trì huyết áp ở mức khỏe mạnh cao hơn so với mức trung bình.', 'Baby_carrots_-_jules41.jpg', 0, NULL, NULL, 12330),
(24, 2, 5, 'Bắp Cải', '14000', 'bắp cải Việt Nam tươi ngon', 'Theo Cơ sở dữ liệu dinh dưỡng quốc gia của Hoa Kỳ, 1 nửa chén bắp cải nấu chín cắt nhỏ (75 gram) chứa:\r\n\r\n17 calo\r\nBốn gam carbohydrate (trong đó có chứa 2 gam đường và 1 gam chất xơ)\r\nMột gam protein\r\nĂn nửa chén bắp cải nấu chín sẽ cung cấp 30-35% nhu cầu vitamin C hàng ngày và:\r\n\r\n81,5 microgam vitamin K\r\n11 miligam magiê\r\n22 microgam folate\r\nThêm vào đó, lượng vitamin B-6, canxi, kali và thiamin nhưng ít hơn.\r\nNgoài ra, bắp cải có nhiều chất xơ và chứa chất chống oxy hóa mạnh, bao gồm polyphenol và các hợp chất lưu huỳnh. Khi so sánh màu sắc của cải bắp, các chuyên gia nhận thấy rằng loại bắp cải có màu đỏ có chứa nhiều hợp chất này hơn so với bắp cải màu xanh. Chất chống oxy hóa có tác dụng bảo vệ cơ thể không bị tổn thương do các gốc tự do gây ra. Gốc tự do là các phân tử có số electron lẻ, làm cho chúng không ổn định. Khi các gốc tự do này quá nhiều và hoạt động không ổn định, chúng có thể làm hỏng các tế bào của bạn.\r\n\r\nNhư bạn có thể thấy trong danh sách trên, bắp cải có chứa vitamin B6 và folate, cả hai đều rất cần thiết cho nhiều quá trình quan trọng trong cơ thể, như quá trình chuyển hóa năng lượng trong cơ thể và hoạt động bình thường của hệ thần kinh.\r\n\r\nBắp cải đặc biệt chứa nhiều vitamin C, một chất chống oxy hóa mạnh có thể bảo vệ chống lại bệnh tim, một số bệnh ung thư và giảm thị lực.', 'tải xuống (2)41.jpg', 0, NULL, NULL, 2130),
(25, 1, 5, 'Hồng Xiêm', '59000', 'Hồng Xiêm Việt Nam sạch tiêu chuẩn VietGap', 'Cung cấp năng lượng tức thì\r\nHồng xiêm chứa đường glucose và carbohydrates nên có thể cung cấp năng lượng tức thì cho cơ thể ngay sau khi ăn. Khi đói hoặc mệt, đây là nguồn bổ sung năng lượng lành mạnh, tốt hơn các loại bánh kẹo ngọt, nước ngọt, đồ ăn vặt khác. Cung cấp năng lượng tức thì giúp phòng ngừa hạ đường huyết đột ngột do quá đói hoặc quá mệt.\r\n\r\nChữa được cả táo bón và tiêu chảy\r\nTrong dân gian từ xưa đã lưu truyền bài thuốc chữa tiêu chảy bằng hồng xiêm xanh. Trong hồng xiêm xanh có lượng lớn chất tanin (tạo vị chát) có thể cầm tiêu chảy nhanh chóng. Ngoài ra, nguồn chất xơ dồi dào trong hồng xiêm chín giúp nhuận tràng, cải thiện và phòng ngừa tình trạng táo bón. Ăn hồng xiêm giúp chúng ta có một chiếc dạ dày sạch, một hệ tiêu hóa khỏe mạnh.\r\n\r\nTốt cho hệ thần kinh\r\nCác nghiên cứu khoa học đã chỉ ra rằng ăn quả hồng xiêm chín giúp làm dịu thần kinh, giảm căng thẳng, mệt mỏi. Những người bị chứng lo lâu, mất ngủ, trầm cảm thường xuyên ăn hồng xiêm chín có thể giúp tinh thần tích cực hơn. Một công dụng bất ngờ mà ít người trong chúng ta biết tới đúng không nào?\r\n\r\nquả hồng xiêm 2\r\nQuả hồng xiêm chín ngọt thơm dễ ăn\r\nGiúp bệnh nhân cao huyết áp điều hòa huyết áp\r\nThành phần của quả hồng xiêm có chất Potassium có tác dụng giảm huyết áp ở những bệnh nhân bị cao huyết áp. Với người khỏe mạnh bình thường, chất này có thể giúp ổn định huyết áp, giảm nguy cơ bị tăng huyết áp. Tuy nhiên, bạn cũng cần lưu ý thực phẩm này không thể thay thế cho các loại thuốc huyết áp mà người bệnh đang sử dụng. \r\n\r\nTốt cho xương khớp\r\nCăn cứ vào bảng thành phần trên, chúng ta có thể thấy chỉ cần ăn 100g hồng xiêm chín là bạn đã có thể cung cấp cho cơ thể 21mg canxi. Canxi là khoáng chất quan trọng cấu thành nên hệ xương, răng. Ăn hồng xiêm chín là một cách dễ dàng để bạn bổ sung canxi tự nhiên cho cơ thể. Điều này giúp trẻ em phát triển chiều cao tối ưu còn người lớn có thể phòng ngừa loãng xương. \r\n\r\nQuả hồng xiêm tốt cho thị lực\r\nTrong hồng xiêm chín rất giàu vitamin A. Đây là loại vitamin giúp thị lực chúng ta được cải thiện. Ngoài ra, vitamin C cũng có tác dụng chống oxy hóa, bảo vệ các tế bào võng mạc. Có thể bạn sẽ ngạc nhiên khi biết vitamin C trong mắt cao hơn nhiều so với nồng độ vitamin C trong các chất dịch khác của cơ thể.\r\n\r\nVitamin E cũng có tác dụng bảo vệ các acid béo tập trung ở võng mạc khỏi quá trình oxy hóa. Điều này cần thiết cho mọi lứa tuổi, nhất là người già có tầm nhìn bị suy giảm. \r\n\r\nPhòng ngừa nhiều bệnh ung thư\r\nCác chất chống oxy hóa có trong hồng xiêm chín có tác dụng giúp cơ thể phòng ngừa nhiều bệnh mãn tính, trong đó có bệnh ung thư. Theo các nhà khoa học, loại trái cây này có thể giúp chúng ta giảm nguy cơ mắc các bệnh ung thư miệng, ung thư phổi, ung thư ruột kết hiệu quả.\r\n\r\nquả hồng xiêm 3\r\nNhiều người sẽ bất ngờ khi biết đến lợi ích của hồng xiêm\r\nChống vi khuẩn, virus\r\nChất tanin trong hồng xiêm có tác dụng chống viêm hiệu quả. Nó góp phần giúp giảm nguy cơ viêm thực quản, viêm ruột, hội chứng ruột kích thích, giảm đau, giảm viêm dạ dày. Vitamin C trong loại quả này giúp tăng cường miễn dịch, giúp cơ thể chống lại cảm lạnh, các virus và vi khuẩn gây bệnh hiệu quả.\r\n\r\nNgoài ra, quả hồng xiêm chín cũng có những lợi ích khác như: \r\n\r\nMagie trong hồng xiêm tốt cho máu và mạch máu. \r\nFolate và sắt giúp cơ thể phòng ngừa thiếu máu. \r\nĂn hồng xiêm cũng giúp lợi tiểu, hỗ trợ đào thải độc tố ra khỏi cơ thể qua đường nước tiểu.', 'tải xuống (3)28.jpg', 0, NULL, NULL, 3230),
(26, 1, 5, 'Quả Sim Rừng', '109000', 'Quả Sim rừng tự nhiên', 'Quả sim rừng có tên khoa học là Rhodomyrtus tomentosa. Trong y học, quả còn có các tên gọi khác như sơn nhậm, đương lê, nhậm tử hoặc đào kim nương.\r\n\r\nBên cạnh là một loại quả rừng ngon, quả sim còn là một vị thuốc quý. Ở Việt Nam, sim là một cây rừng được dùng làm thuốc rất nhiều. Khu vực các tỉnh miền núi phía Bắc và ven biển, đặc biệt là ở đảo Phú Quốc có rất nhiều cây sim rừng.\r\n\r\nVề đặc điểm, cây sim có chiều cao trung bình từ 1 - 1.5m, lá cây mọc đối xứng và có hình trứng thuôn dài. Hoa có màu tím, thường mọc riêng lẽ hoặc chùm 2 - 3 bông ở kẻ lá. Quả màu tím sẫm, thuộc họ quả mọng nên ăn được và có vị ngọt, hạt có hình móng ngựa.\r\n\r\nNgoài Việt Nam, cây sim cũng mọc nhiều ở miền Nam Trung Quốc, ở Malaysisa, Indonesia,... hay các quốc gia thuộc vùng nhiệt đới ở Châu Á.', 'tải xuống (4)78.jpg', 0, NULL, NULL, 2220),
(27, 1, 5, 'Táo Mèo Hà Giang', '15000', 'Táo Mèo Hà Giang tự nhiên 100%', 'Nước chiết từ táo mèo có tác dụng làm tăng enzyme trong dạ dày để hỗ trợ tiêu hóa. Đồng thời còn giúp ngăn ngừa và làm giảm thiếu máu cơ tim.\r\n\r\nDược liệu đã được nhiều nghiên cứu chứng minh là có tác dụng cường tim, hạ áp, tăng cường lưu lượng mạch vành, chống giãn mạch máu và loạn nhịp tim.\r\n\r\nCác hoạt chất trong dược liệu còn có tác dụng ức chế một số vi khuẩn gây bệnh như tụ cầu vàng, lỵ, bạch hầu, trực khuẩn thương hàn, liên cầu beta…\r\n\r\nDược liệu hoạt động với cơ chế thúc đẩy quá trình bài tiết cholesterol thay vì giảm hấp thu thành phần này. Có tác dụng hạ lipid trong máu, đồng thời giảm xơ vữa động mạch.\r\n\r\nNgoài những tác dụng chính kể trên, táo mèo còn là dược liệu giúp an thần, làm tăng tính thẩm thấu của mao mạch và làm co cơ tử cung.', 'tải xuống (5)2.jpg', 0, NULL, NULL, 2330),
(28, 1, 2, 'Dưa lưới', '200000', 'Dưa lưới Nhật Bản tươi ngon', 'Nước chiết từ táo mèo có tác dụng làm tăng enzyme trong dạ dày để hỗ trợ tiêu hóa. Đồng thời còn giúp ngăn ngừa và làm giảm thiếu máu cơ tim.\r\n\r\nDược liệu đã được nhiều nghiên cứu chứng minh là có tác dụng cường tim, hạ áp, tăng cường lưu lượng mạch vành, chống giãn mạch máu và loạn nhịp tim.\r\n\r\nCác hoạt chất trong dược liệu còn có tác dụng ức chế một số vi khuẩn gây bệnh như tụ cầu vàng, lỵ, bạch hầu, trực khuẩn thương hàn, liên cầu beta…\r\n\r\nDược liệu hoạt động với cơ chế thúc đẩy quá trình bài tiết cholesterol thay vì giảm hấp thu thành phần này. Có tác dụng hạ lipid trong máu, đồng thời giảm xơ vữa động mạch.\r\n\r\nNgoài những tác dụng chính kể trên, táo mèo còn là dược liệu giúp an thần, làm tăng tính thẩm thấu của mao mạch và làm co cơ tử cung.', 'tải xuống (6)19.jpg', 1, NULL, NULL, 2330),
(29, 10, 5, 'Rau Bạc Hà', '30000', 'Rau bạc hà tự nhiên, chữa bệnh hiểm nghèo', 'Rau bạc hà thuộc loại cây thân thảo, sống lâu năm. Rau bạc hà bắt nguồn từ Châu Âu và Trung Đông, nhưng hiện nay chúng mọc phổ biến khắp thế giới. Rau bạc hà thích hợp mọc ở những vùng ẩm ướt và có bóng râm. Bởi vì trong cây bạc hà đều có chứa tinh dầu thơm, nên khi thu hoạch thường lấy lá bạc hà tươi và ngọn hoa vì có chứa nhiều chất menthol nhất. Tinh chất trong rau bạc hà còn được sử dụng như chất tạo gia vị trong nhiều sản phẩm bánh kẹo, kem, nước uống, xà phòng, dầu gội.', 'tải xuống (7)97.jpg', 0, NULL, NULL, 22230),
(30, 2, 5, 'Rau cần', '20000', 'Rau cần tây sạch', 'Nước ép cần tây có tác dụng làm đẹp\r\nTác dụng giảm cân: Cần tây chứ nhiều calo và chất xơ giúp bạn có cảm giác no lâu, giảm cảm giác thèm ăn. Do đó, uống nước ép cần tây có tác dụng hỗ trợ giảm cân hiệu quả. Nước ép cần tây rất phù hợp với thực đơn giảm cân hàng ngày, kết hợp với chế độ ăn uống khoa học, luyện tập đúng cách sẽ đem lại tác dụng giảm cân hiệu quả bất ngờ.\r\nDưỡng da làm đẹp: Uống nước ép cần tây có tác dụng thanh lọc cơ thể, ngoài ra các chất chống oxy hóa giúp làm sạch độc tố và ngăn chặn các tế bào da bị tổn thương. Khoáng chất từ nước ép bổ sung cho cơ thể giúp làm sáng da.\r\nChăm sóc tóc khỏe: Vitamin A có trong nước ép cần tây cung cấp cho tóc, uống nước cần tay hàng ngày công dụng chăm sóc tóc khỏe mạnh và mềm mượt.\r\nCông dụng hỗ trợ chăm sóc sức khỏe\r\nPhòng ngừa ung thư: Trong rau cần tây có chứa chất flavonols, furanocoumarins và acid phenolic có tác dụng hỗ trợ phòng ngừa ung thư.\r\nGiảm hàm lượng cholesterol trong máu: Một số nghiên cứu cho thất, nước ép cần tây có khả năng làm giảm cholesterol xấu trong máu, đồng thời tăng cường bài tiết mật hoặc axit steroid, hai chất giúp giảm cholesterol.\r\nỔn định huyết áp: Uống 1 ly nước ép cần tây mỗi ngày có tác dụng làm giảm hormone gây căng thẳng và giúp giãn các cơ quanh mạch máu, từ đó giúp tăng cường lưu thông máu, kiểm soát mức huyết áp hiệu quả.\r\nHỗ trợ hệ tiêu hóa: Rau cần tây có chứa nhiều chất xơ tốt cho hệ tiêu hóa, nhuận tràng và ngăn ngừa táo bón.\r\nTác dụng kháng viêm: Cần tây chứa hợp chất hữu cơ polyacetylen có tác dụng chống viêm, vì vậy nước ép cần tây thường được dùng để hỗ trợ điều trị, chăm sóc sức khỏe cho các trường hợp bệnh xương khớp, viêm đường hô hấp,…\r\nHỗ trợ điều trị mất ngủ: Hàm lượng magie trong nước ép cần tây có tác dụng làm dịu thần kinh, tinh thần thoải mái hơn và dễ đi vào giấc ngủ, ngủ ngon hơn.', 'tải xuống (8)28.jpg', 0, NULL, NULL, 220),
(31, 2, 5, 'Rau Mùi', '13000', 'Rau mùi hương liệu', 'Nước ép cần tây có tác dụng làm đẹp\r\nTác dụng giảm cân: Cần tây chứ nhiều calo và chất xơ giúp bạn có cảm giác no lâu, giảm cảm giác thèm ăn. Do đó, uống nước ép cần tây có tác dụng hỗ trợ giảm cân hiệu quả. Nước ép cần tây rất phù hợp với thực đơn giảm cân hàng ngày, kết hợp với chế độ ăn uống khoa học, luyện tập đúng cách sẽ đem lại tác dụng giảm cân hiệu quả bất ngờ.\r\nDưỡng da làm đẹp: Uống nước ép cần tây có tác dụng thanh lọc cơ thể, ngoài ra các chất chống oxy hóa giúp làm sạch độc tố và ngăn chặn các tế bào da bị tổn thương. Khoáng chất từ nước ép bổ sung cho cơ thể giúp làm sáng da.\r\nChăm sóc tóc khỏe: Vitamin A có trong nước ép cần tây cung cấp cho tóc, uống nước cần tay hàng ngày công dụng chăm sóc tóc khỏe mạnh và mềm mượt.\r\nCông dụng hỗ trợ chăm sóc sức khỏe\r\nPhòng ngừa ung thư: Trong rau cần tây có chứa chất flavonols, furanocoumarins và acid phenolic có tác dụng hỗ trợ phòng ngừa ung thư.\r\nGiảm hàm lượng cholesterol trong máu: Một số nghiên cứu cho thất, nước ép cần tây có khả năng làm giảm cholesterol xấu trong máu, đồng thời tăng cường bài tiết mật hoặc axit steroid, hai chất giúp giảm cholesterol.\r\nỔn định huyết áp: Uống 1 ly nước ép cần tây mỗi ngày có tác dụng làm giảm hormone gây căng thẳng và giúp giãn các cơ quanh mạch máu, từ đó giúp tăng cường lưu thông máu, kiểm soát mức huyết áp hiệu quả.\r\nHỗ trợ hệ tiêu hóa: Rau cần tây có chứa nhiều chất xơ tốt cho hệ tiêu hóa, nhuận tràng và ngăn ngừa táo bón.\r\nTác dụng kháng viêm: Cần tây chứa hợp chất hữu cơ polyacetylen có tác dụng chống viêm, vì vậy nước ép cần tây thường được dùng để hỗ trợ điều trị, chăm sóc sức khỏe cho các trường hợp bệnh xương khớp, viêm đường hô hấp,…\r\nHỗ trợ điều trị mất ngủ: Hàm lượng magie trong nước ép cần tây có tác dụng làm dịu thần kinh, tinh thần thoải mái hơn và dễ đi vào giấc ngủ, ngủ ngon hơn.', 'tải xuống (9)92.jpg', 1, NULL, NULL, 2330),
(32, 2, 5, 'Nha Đam', '70000', 'Nha đam sạch', '1.1. Làm đẹp da\r\nNha đam có tác dụng trong làm đẹp da để bạn có thể sở hữu một làn da đẹp, mịn màng.\r\n\r\nTheo đó, nó cung cấp nước, bổ sung độ ẩm, dưỡng ẩm cho da. Đồng thời, với tính kháng khuẩn, chống viêm, có thể giúp làm lành và trị thâm cho các vết thương xuất hiện do mụn. Cùng với đó, có tác dụng trong việc ngăn ngừa và hạn chế một cách hiệu quả tình trạng mụn.\r\n\r\nNgoài ra, nha đam còn có tác dụng kích thích sự tổng hợp collagen, các elastin, tăng cường tái tạo tế bào mới, chống lão hóa, ngăn ngừa nếp nhăn.\r\n\r\nNha đam có tác dụng trong việc làm đẹp da \r\n\r\nNha đam có tác dụng trong việc làm đẹp da\r\n\r\n1.2. Tốt cho hệ tiêu hóa\r\nĐây cũng là một câu trả lời khác cho câu hỏi nha đam có tác dụng gì. Cụ thể, nha đam giúp làm giảm những triệu chứng khó chịu ở dạ dày. Cùng với đó, cũng giúp người bệnh đang mắc phải hội chứng rối loạn ruột kích thích hay bệnh viêm ruột kết và những chứng rối loạn khác có thể cải thiện tình trạng bệnh của mình.\r\n\r\nNgoài ra, lô hội cũng giàu một loại chất có tác dụng nhuận tràng gọi là anthraquinone. Vì thế, nó cũng được sử dụng với mục đích làm giảm tình trạng táo bón, hỗ trợ cho lợi khuẩn đường ruột hoạt động hiệu quả, kích thích nhu động ruột.\r\n\r\n1.3. Tác dụng tốt đối với tóc\r\nLô hội chứa nhiều các axit amin cùng enzyme proteolytic, các loại vitamin tốt đối với tóc. Sử dụng nó giúp sức khỏe của da đầu được cải thiện một cách hiệu quả. Bên cạnh đó, cũng giúp tóc chắc khỏe, không bị khô, khắc phục tình trạng rụng tóc, thúc đẩy tóc nhanh mọc lại. Đồng thời, cũng trị gàu, ngăn ngừa các bệnh da đầu.\r\n\r\nThông qua đó, giúp bạn sở hữu một mái tóc mềm mại và khỏe mạnh.\r\n\r\n1.4. Giảm đau, trị loét dạ dày\r\nVới khả năng kiểm soát sự tiết axit trong dạ dày, lô hội có thể giúp giảm đau khi gặp tình trạng ợ nóng. Đi kèm với đó, nó còn có thể giúp trị loét dạ dày, chống lại các vết loét và giữ cho chúng không trở nên lớn hơn.\r\n\r\n1.5. Giúp điều hòa kinh nguyệt\r\nChu kỳ \"nguyệt san\" có vai trò quan trọng đối với sức khỏe sinh sản của phái yếu. Vì thế, bị rối loạn kinh nguyệt, kinh nguyệt không đều có thể khiến chị em lo lắng.\r\n\r\nĐể khắc phục tình trạng này, các chị em có thể sử dụng nha đam như uống nước ép. Bởi đây là loại thực phẩm sẽ giúp điều hòa kinh nguyệt nhờ tác dụng trong việc điều hòa hormone của cơ thể.\r\n\r\nSử dụng nha đam sẽ giúp nữ giới điều hòa kinh nguyệt\r\n\r\nSử dụng nha đam sẽ giúp nữ giới điều hòa kinh nguyệt\r\n\r\n1.6. Hỗ trợ giảm cân\r\nLô hội có ít calo, nên những người đang ăn kiêng và thực hiện giảm cân có thể lựa chọn bổ sung loại thực phẩm này vào thực đơn của mình.\r\n\r\nKhông những vậy, nó còn có thể giúp hỗ trợ cơ thể tăng cường trao đổi chất, tăng lượng calo được đốt cháy trong ngày. Từ đó, thúc đẩy quá trình giảm cân diễn ra hiệu quả.\r\n\r\n1.7. Các tác dụng khác\r\nNgoài ra, nha đam còn có các tác dụng khác như:\r\n\r\n- Chống sâu răng, hôi miệng, ngăn ngừa bệnh nướu răng;\r\n\r\n- Trị tình trạng khô môi, nứt nẻ để làn môi trở nên căng mọng, ẩm mịn và giúp tẩy tế bào chết hiệu quả cho da mặt và đôi môi;\r\n\r\n- Hỗ trợ kiểm soát lượng đường trong máu;\r\n\r\n- Thanh nhiệt, đào thải độc tố;\r\n\r\n- Tăng cường sức đề kháng cho cơ thể, chống mệt mỏi;...\r\n\r\n2. Nên lưu ý những gì khi sử dụng nha đam?\r\nBên cạnh việc biết được nha đam có tác dụng gì, sau đây là những lưu ý cho bạn để việc sử dụng nó có thể đem lại hiệu quả tốt nhất và tránh các tác dụng phụ ngoài mong muốn. Đó là:\r\n\r\n- Tình trạng dị ứng da như viêm, phát ban, nổi mày đay có thể xảy ra khi dùng gel nha đam; ngoài ra, da còn có nguy cơ bị khô, cứng, nứt nẻ. Khi gặp phải các biểu hiện đó, bạn nên dừng việc sử dụng ngay và nên đi thăm khám để xác định nguyên nhân rõ ràng và tìm ra hướng khắc phục.\r\n\r\n- Không dùng gel lô hội trên vùng da bị nhiễm trùng.\r\n\r\n- Mủ của cây lô hội có thể làm một số căn bệnh như đau dạ dày, bệnh trĩ, viêm đại tràng,... trở nên nghiêm trọng hơn.\r\n\r\n- Nước ép nha đam có thể làm xuất hiện các phản ứng dị ứng như đau cổ họng, ngứa, cảm giác khó thở, đau ngực,...\r\n\r\n- Không dùng lượng lớn nước ép lô hội để tránh dẫn đến tình trạng tiêu chảy vì trong nó có chứa nhiều anthraquinone với tác dụng nhuận tràng. Khi tiêu chảy trở nên nặng hơn, có thể khiến bạn bị chuột rút, mất nước, đau quặn. Ngoài ra, việc sử dụng nước ép nha đam quá nhiều cũng có thể làm thận bị tổn thương do sự tích tụ lượng máu trong xương chậu.\r\n\r\nKhông dùng một lượng lớn nước ép nha đam để tránh bị tiêu chảy \r\n\r\nKhông dùng một lượng lớn nước ép nha đam để tránh bị tiêu chảy\r\n\r\n- Tránh dùng chung nước ép nha đam với tỏi, bởi sẽ làm hệ tiêu hóa bị ảnh hưởng, làm giảm nồng độ kali trong cơ thể.\r\n\r\n- Cần lưu ý đến một số loại thảo mộc như thầu dầu, rễ đại hoàng, rễ vỏ cây,... có phản ứng với nước lô hội dẫn đến tình trạng tiêu chảy, mất nước.\r\n\r\n- Khi dùng để làm đẹp, cần cẩn trọng với việc sử dụng nha đam ở da mặt, da mắt,... nên thử trước ở một vùng da nhỏ để thử độ thích ứng của làn da; trường hợp không xuất hiện biểu hiện lạ thì mới tiếp tục sử dụng.\r\n\r\nViệc đắp mặt với nha đam chỉ nên thực hiện không quá 3 lần trong tuần. Đồng thời, sau khi làm đẹp với nha đam thì cần che chắn làn da kỹ càng khi ra ngoài trời, tránh để da tiếp xúc trực tiếp với ánh nắng mặt trời.\r\n\r\n- Nên ngưng việc sử dụng nha đam tối thiểu 2 tuần trước khi thực hiện phẫu thuật.\r\n\r\n- Các đối tượng không được sử dụng nha đam bao gồm: người dễ bị dị ứng; người có huyết áp thấp hoặc đang sử dụng các loại thuốc làm giảm đường huyết; bà bầu và phụ nữ đang cho con bú; người mắc bệnh lý về thận, bệnh trĩ hay bệnh về tim mạch.', 'tải xuống (10)40.jpg', 1, NULL, NULL, 1230),
(33, 1, 5, 'Vải Khô', '15000', 'Vải Thiều sấy khô', 'Vải Thiều sấy khô tách vỏ bằng phương pháp sấy truyền thống.có thể nói khá quen thuộc lại luôn có sức quyến rũ với nhiều người VN. Vải Thiều có mùi thơm nhẹ, vị ngọt dịu nhâm nhi với trà rất ngon, qui trình sấy hoàn toàn không sử dụng hóa chất và phụ gia thực phẩm. Vải sấy được đóng gói tiện dụng, thuận lợi mang theo mỗi khi đi xa hay dành làm quà tặng', 'tải xuống (11)19.jpg', 1, NULL, NULL, 2230),
(34, 1, 5, 'Nhãn Lồng Sấy Khô', '150000', 'Nhãn Lồng Hưng Yên sấy khô', 'Bài thuốc chữa bệnh từ nhãn lồng\r\n\r\n          - Điều trị đau bụng do nhiệt táo, ho do phế nhiệt: Theo nhiều tài liệu cho biết, hàm lượng vitamin C trong nhãn lồng rất dồi dào nên khi sử dụng loại cây này sẽ chữa được các bệnh liên quan đến cổ họng nhất là căn bệnh phổ biến thường gặp như: Cảm cúm, cảm lạnh, ho do phế nhiệt.\r\n\r\n          Chuẩn bị 20-30g nhãn lồng, phơi khô, đem đi rửa sạch và nấu với nước uống hằng ngày sẽ thấy tác dụng rõ rệt.\r\n\r\n          - Giúp an thần, dịu dây thần kinh, chữa mất ngủ: Chuẩn bị 10g dây nhãn lồng, 4g tim sen, 15g lá vông nem. Đem tất cả đun sôi với 1,5 lít nước. Uống hết trong ngày, duy trì trong vòng 1 tháng sẽ phát huy được công dụng hiệu quả.\r\n\r\n          Bài thuốc uống này còn có tác dụng cho những người bị stress, thần kinh căng thẳng, dễ cáu gắt, nóng giận.\r\n\r\n          - Điều trị suy nhược, hồi hộp, lo âu: Chuẩn bị 20g nhãn lồng, 10g cỏ tre, 12g lá vông nem, 10 trái đại táo, xương bồ 6g, cây cỏ mực 15g, lá dâu tằm 10g. Cho tất cả các dược liệu vào nồi với 600ml nước, nấu sôi. Khi nước chỉ còn khoảng 200ml thì tắt bếp. Chia ra 2 lần, uống trong ngày. Sử dụng 1 tháng kiên trì sẽ cho kết quả tốt.\r\n\r\n          - Mát gan, nhuận trường: Dùng 5g trái nhãn lồng chín, bổ đôi trái, chỉ lấy phần trong chất dịch của trái, nấu với 1 lít nước sôi, 250g đường cát trắng. Để nguội, dùng làm thức uống.\r\n\r\n          Ngoài ra, đọt nhãn lồng nấu thành các món canh. Món này giúp cho cơ thể nạp được nhiều lượng Vitamin, đặc biệt là Vitamin B2 có lợi cho sức khỏe, giúp cơ thể được thanh lọc và chống lại các Cholesterol có hại.\r\n\r\n          Một số lưu ý khi sử dụng cây (dây) nhãn lồng: Rau nhãn lồng có tính nhuận tràng cao, làm tăng co bóp ruột, phụ nữ có bầu và sau khi sinh không nên trực tiếp, tốt nhất nên nấu nước hoặc pha trà uống để đảm bảo an toàn. Nên uống nước nhãn lồng khi còn nóng và không dùng nước trà để qua đêm vì dễ bị thiu, gây đau bụng.', 'tải xuống (12)11.jpg', 1, NULL, NULL, 230),
(35, 1, 5, 'Chôm Chôm', '60000', 'Chôm Chôm Việt Nam sạch', 'Giá trị dinh dưỡng có trong 1 quả chôm chôm\r\nTrong 100g thịt quả chôm chôm qua phân tích cho thấy có chứa khoảng 82 kcal. Đồng thời chứa một lượng lớn các vitamin, khoáng chất như:\r\n\r\n20.87g carbohydrat\r\n0.9g chất xơ\r\n0,65g protein\r\n22mg canxi\r\n7mg magie\r\n9 mg phốt pho\r\n42mg kali\r\n0.35 mg chất sắt\r\n11mg natri\r\n1.352mg niacin\r\n0.21g chất béo\r\n0.343mg mangan\r\n8mcg folate\r\n0.08mg kẽm\r\n0.022mg riboflavin\r\n0.013mg thiamin\r\n0.02mg vitamin B6\r\n4,9mg vitamin C\r\nGiá trị dinh dưỡng có trong 1 quả chôm chôm\r\nGiá trị dinh dưỡng có trong 1 quả chôm chôm\r\n\r\nLợi ích sức khoẻ khi ăn quả chôm chôm\r\nChôm chôm là một loại trái cây không những rất \"được lòng\" nhiều người, mà chúng còn đem lại nhiều lợi ích sức khỏe cho chúng ta nữa đó!\r\n\r\nHỗ trợ sức khỏe tiêu hóa\r\n\r\nTrong chôm chôm có chứa nhiều chất xơ hòa tan - đây là nguồn thức ăn cho các lợi khuẩn sống trong đường ruột. Loại trái cây này còn có tác dụng làm giảm viêm và cải thiện chứng rối loạn đường ruột như bệnh viêm loét đại tràng,...\r\n\r\nTrong chôm chôm có chứa nhiều chất xơ hòa tan - đây là nguồn thức ăn cho các lợi khuẩn sống trong đường ruột\r\n\r\nGiúp giảm cân\r\n\r\nTrong chôm chôm có nhiều chất xơ và nước nhưng lại chứa ít calo nên đây chính là một thực phẩm thân thiện cho chế độ ăn uống giảm cân của bạn.\r\n\r\nChất xơ hòa tan trong trái chôm chôm có thể tan một phần trong nước và tạo thành hợp chất có đặc tính giống như gel xuất hiện trong ruột, do đó khiến quá trình tiêu hóa và hấp thụ chất dinh dưỡng diễn ra chậm hơn, khiến bạn có cảm giác như no lâu, hạn chế tình trạng thèm ăn, từ đó hỗ trợ giảm cân hiệu quả.', 'tải xuống (13)67.jpg', 1, NULL, NULL, 3230),
(36, 8, 2, 'Cá Ngừ', '400000', 'Cá Ngừ nhập khẩu Nhật Bản', 'Cá ngừ vây xanh với đặc trưng là có vây màu xanh, trung bình một con cá ngừ vây xanh nặng khoảng 150kg. Cũng bởi lý do khó đánh bắt mà hiện nay cá ngừ vây xanh càng trở nên khan hiếm từ đó khiến cho giá thành trở nên cao hơn.\r\n\r\nCác ngừ vây xanh có xu hướng bơi thành bầy với những loại cá khác có cùng kích cỡ, bao gồm các loại cá ngừ khác cũng như các loại cá lớn hơn khác như cá heo, cá voi hay cá nhám voi. Cá ngừ vây xanh ăn các loại cá nhỏ khác, động vật giáp xác hay mực.', 'tải xuống (14)10.jpg', 1, NULL, NULL, 2230),
(37, 9, 5, 'Thịt Trâu Gác Bếp', '300000', 'Thịt Trâu Gác Bếp Tây Bắc', 'Thịt trâu gác bếp là món ăn đặc sản của người dân tộc Thái Đen và đất nước Thái Lan, thịt trâu gác bếp thường được dùng để thiết đãi khách quý.\r\n\r\nMón thịt này được chế biến từ bắp thịt không có gân và bỏ các thịt thừa bèo nhèo từ trâu, bò hoặc heo nuôi thả rông trên các vùng núi Tây Bắc. Thịt được lóc và thái dọc theo thớ thịt 20cm và dày 5cm thành các miếng hình con chì.\r\n\r\nThịt trâu gác bếp sẽ được tẩm gia vị từ ớt, gừng và mắc khén - hạt tiêu rừng thơm đặc trưng của người dân tộc vùng núi Tây Bắc, rồi hun khói bằng khói toả ra từ các bếp than, củi. Sau khi thành phẩm, thịt trâu gác bếp sẽ có mùi khói thơm nhẹ nhưng không gây khó chịu.\r\n\r\nMón thịt trâu gác bếp được chế biến tự nhiên và theo các kỹ thuật gia truyền, không có chất bảo quản nhưng rất thơm ngon và có thể dự trữ ăn dần được khoảng 1 tháng.\r\n\r\nThịt trâu gác bếp là gì?\r\n\r\n2Cách ăn thịt trâu gác bếp\r\nBạn có thể ăn thịt trâu gác bếp đơn giản bằng cách rã đông rồi cho thịt vào lò vi sóng quay nóng 2 phút ở 600W, hoặc hấp cách thuỷ trong 5 phút, hay đem thịt trâu gác bếp cho vào lò nướng 10 phút ở nhiệt độ 220 độ C.\r\n\r\nBằng với các cách trên, bạn sẽ có cho mình món thịt trâu gác bếp thơm ngon chuẩn vị vùng núi Tây Bắc.', 'tải xuống (15)85.jpg', 1, NULL, NULL, 220),
(38, 7, 5, 'Su Hào', '30000', 'Su hào hữu cơ', 'Su hào là một trong những thực phẩm quen thuộc với mỗi chúng ta chứa nhiều dưỡng chất tốt cho sức khỏe và có thể chế biến được nhiều món ăn ngon', 'tải xuống (16)27.jpg', 1, NULL, NULL, 200),
(39, 10, 5, 'Rau Răm', '23000', 'Rau răm hữu cơ sạch', 'Công dụng\r\nTheo y học cổ truyền\r\nVị thuốc\r\n\r\nTính vị\r\n\r\nRau răm có tính nóng và có tinh dầu. Vị hơi đắng và cay và có mùi hơi hắt.\r\n\r\nCông năng\r\n\r\nTrong Đông y, rau răm được biết đến với công dụng trừ phong hàn, hoạt huyết, tiêu độc.\r\n\r\nRau răm là một trong những chất phụ gia, hương liệu thực phẩm được sử dụng phổ biến nhất và theo y học cổ truyền thường được sử dụng để điều trị:\r\n\r\nĐầy bụng khó tiêu, đau dạ dày.\r\n\r\nRối loạn tiêu hóa dưới dạng thuốc sắc.\r\n\r\nTinh dầu dùng để trị gàu.\r\n\r\nGiảm đau, chống sưng viêm, kháng khuẩn.\r\n\r\nChữa ỉa chảy, khó tiêu, ngứa da, kinh nguyệt ra nhiều, trĩ.\r\n\r\nLá và hạt rau răm được sử dụng trong một bài thuốc dân gian chống lại bệnh ung thư.\r\n\r\nViệc sử dụng lá và hạt bầm tím làm thuốc chữa mụn nước cũng đã được báo cáo.', 'tải xuống (17)37.jpg', 1, NULL, NULL, 19);
INSERT INTO `tbl_product` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_price`, `product_desc`, `product_content`, `product_image`, `product_status`, `created_at`, `updated_at`, `quantity`) VALUES
(40, 8, 2, 'CÁ Thu', '230000', 'Cá thu Nhật Bản tự nhiên', 'I. Cá thu – Loài cá có giá trị dinh dưỡng cao\r\nCá thu là loài cá biển thuộc họ cá thu ngừ rất phổ biến tại nước ta, dưới đây là những thông tin thú vị mà ít ai biết về loài cá này.\r\n\r\n1. Đặc điểm của cá thu\r\nThân hình cá thu thuôn dài, to ở trên và có xu hướng dẹt dần về phía đuôi. Cá thu không có vảy, da mỏng và trơn, trên người chúng có màu  xanh xám bạc hoặc màu xanh đen. Loài cá này có kích thước khá lớn, đặc biệt là cá thu cái sẽ to hơn so với cá thu đực. Khi trưởng thành có thể đạt chiều dài lên đến đến 80cm và cân nặng dao động từ 5 – 10kg. Với giá trị dinh dưỡng cao loài cá này được rất nhiều người mua về, áp dụng nhiều cách chế biến cá thu khác nhau, tạo thành nhiều món ăn ngon.', 'tải xuống (18)10.jpg', 1, NULL, NULL, 190),
(41, 8, 2, 'Trứng Cá Tầm', '3000000', 'Trứng cá tầm Nhật Bản', 'Công dụng của trứng cá tầm\r\nTheo chuyên trang sức khỏe Healthline, dưới đây là một số công dụng của trứng cá tầm tốt cho sức khỏe.\r\n\r\nHỗ trợ làm đẹp da\r\nMột lượng lớn chất chống oxy hóa được tìm thấy trong trứng cá tầm giúp cải thiện tình trạng lão hóa cũng như những nếp nhăn trên da.\r\n\r\nHỗ trợ làm đẹp da\r\nHỗ trợ làm đẹp da\r\n\r\nTrứng cá tầm chứa nhiều acid amin, là thành phần cấu tạo nên protein như collagen và elastin giúp làn da săn chắc và không bị chảy xệ. Ngoài ra, vitamin A, D và E sẽ giúp da trở nên trắng sáng hơn.\r\n\r\nGiúp xương chắc khỏe\r\nGiúp xương chắc khỏe\r\nGiúp xương chắc khỏe\r\n\r\nHàm lượng canxi cao trong trứng cá tầm rất tốt cho trẻ nhỏ và cả phụ nữ mang thai. Canxi là thành phần chủ yếu trong răng và xương, đối với thai nhi nó là chất quan trọng giúp hình thành nên khung xương của trẻ, vì thế trứng cá tầm vô cùng tốt để bổ sung canxi cho cơ thể.\r\n\r\nHỗ trợ sức khỏe sinh lý\r\nHỗ trợ sức khỏe sinh lý\r\nHỗ trợ sức khỏe sinh lý\r\n\r\nĐối với nam giới “yếu” trong chuyện chăn gối thì trứng cá tầm là một sự lựa chọn có thể suy nghĩ đến. Nhờ lượng vitamin B2 và B12 dồi dào sẽ giúp thúc đẩy năng lượng cũng như tạo cảm xúc cho cuộc yêu. Món ăn này được chứng minh là tăng testosterone giúp đàn ông trở nên sung mãn hơn.\r\n\r\nGiúp máu huyết lưu thông\r\nGiúp máu huyết lưu thông\r\nGiúp máu huyết lưu thông\r\n\r\nMột công dụng khác của trứng cá tầm chính là việc giúp ngăn hình thành cục máu đông, gây nên hiện tượng tắt mạch. Lý giải cho công dụng này là bởi trứng cá tầm chứa một lượng lớn acid béo không bão hòa cụ thể là Omega 3 giúp làm tăng lưu thông máu', 'images13.jpg', 1, NULL, NULL, 997),
(42, 1, 5, 'Nước cam ép', '30000', 'Nước cam hay nước cam ép, nước cam vắt là một loại thức uống phổ biến được làm từ cam bằng cách chiết xuất nước từ trái cam tươi bằng việc vắt hay ép thành một loại nước cam tươi Đối với các sản phẩm nước cam được sản xuất theo công nghiệp, nước cam được chế biến có cho thêm các chất phụ gia,bảo quản rồi đóng chai hoặc ...', 'Nước cam ép là nguồn cung cấp vitamin C, chất chống oxy hóa và khoáng chất quan trọng. Cam ép giúp tăng cường hệ miễn dịch, tăng sức đề kháng và giúp cơ thể hấp thụ chất dinh dưỡng tốt hơn. Nước cam ép cũng giúp cải thiện sức khỏe tim mạch và làm tăng sự tươi trẻ cho da.', 'shipping69.jpg', 1, NULL, NULL, 387);

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
(17, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đóng gói', NULL, NULL),
(18, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đóng gói cẩn thận', NULL, NULL),
(19, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'rtewt', NULL, NULL),
(20, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', '123', NULL, NULL),
(21, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'jef', NULL, NULL),
(22, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', '123', NULL, NULL),
(23, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', '123', NULL, NULL),
(24, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ưe', NULL, NULL),
(25, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ád', NULL, NULL),
(26, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', '23', NULL, NULL),
(27, 'Bui Van Phap', 'ew', '0383848623', 'pxlphap@gmail.com', 'ew', NULL, NULL),
(28, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'cuong loz', NULL, NULL),
(29, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'đóng gói cẩn thận', NULL, NULL),
(30, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Tà', NULL, NULL),
(31, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', '15 phạm văn đồng', NULL, NULL),
(32, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'q', NULL, NULL),
(33, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'a', NULL, NULL),
(34, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'dd', NULL, NULL),
(35, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ds', NULL, NULL),
(36, 'Bui Van Phap', 'Thái Nguyên', '0383848623', 'pxlphap@gmail.com', 'hoang', NULL, NULL),
(37, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'sdfsdf', NULL, NULL),
(38, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'sdfsdf', NULL, NULL),
(39, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'df', NULL, NULL),
(40, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'sd', NULL, NULL),
(41, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ưe', NULL, NULL),
(42, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'sd', NULL, NULL),
(43, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ưe', NULL, NULL),
(44, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'á', NULL, NULL),
(45, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ád', NULL, NULL),
(46, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'Giao lúc 12h trưa', NULL, NULL),
(47, 'Bui Van Phap', 'Hưng Yên', '0383848623', 'pxlphap@gmail.com', 'ưe', NULL, NULL);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `coupon_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
