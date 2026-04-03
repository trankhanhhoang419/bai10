-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 03, 2026 lúc 05:03 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `ten` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `ten`) VALUES
(1, 'Dien thoai'),
(2, 'Laptop'),
(3, 'Tablet'),
(4, 'Phu kien'),
(5, 'Camera'),
(6, 'Dong ho'),
(7, 'Tai nghe'),
(8, 'Ban phim'),
(9, 'Chuot'),
(10, 'Man hinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ho_ten` varchar(100) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `ho_ten`, `so_dien_thoai`, `dia_chi`) VALUES
(1, 2, 'Nguyen Van A', '0901', 'Hue'),
(2, 3, 'Tran Thi B', '0902', 'Hue'),
(3, 4, 'Le Van C', '0903', 'DN'),
(4, 5, 'Pham D', '0904', 'HN'),
(5, 6, 'Hoang E', '0905', 'HCM'),
(6, 7, 'Nguyen F', '0906', 'Hue'),
(7, 8, 'Tran G', '0907', 'Hue'),
(8, 9, 'Le H', '0908', 'DN'),
(9, 10, 'Pham I', '0909', 'HN'),
(10, 2, 'Hoang K', '0910', 'HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `ngay_tao` datetime DEFAULT current_timestamp(),
  `trang_thai` enum('cho_xac_nhan','da_xac_nhan','dang_giao','da_giao','huy') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `ngay_tao`, `trang_thai`) VALUES
(1, 1, '2026-04-03 09:48:04', 'da_giao'),
(2, 2, '2026-04-03 09:48:04', 'da_giao'),
(3, 3, '2026-04-03 09:48:04', 'huy'),
(4, 4, '2026-04-03 09:48:04', 'da_giao'),
(5, 5, '2026-04-03 09:48:04', 'cho_xac_nhan'),
(6, 6, '2026-04-03 09:48:04', 'da_xac_nhan'),
(7, 7, '2026-04-03 09:48:04', 'dang_giao'),
(8, 8, '2026-04-03 09:48:04', 'da_giao'),
(10, 10, '2026-04-03 09:48:04', 'da_giao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `so_luong`, `gia`) VALUES
(1, 1, 1, 1, 20000.00),
(2, 1, 2, 1, 15000.00),
(3, 2, 3, 1, 12000.00),
(4, 3, 4, 1, 500.00),
(5, 4, 5, 1, 10000.00),
(6, 5, 6, 1, 8000.00),
(7, 6, 7, 1, 3000.00),
(8, 7, 8, 1, 2000.00),
(9, 8, 9, 1, 1500.00),
(10, 10, 10, 1, 7000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `ten` varchar(100) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `trang_thai` enum('an','hien') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `ten`, `mo_ta`, `gia`, `so_luong`, `hinh_anh`, `trang_thai`) VALUES
(1, 1, 'iPhone', 'Apple', 20000.00, 4, 'img', 'hien'),
(2, 2, 'Dell', 'Laptop', 15000.00, 7, 'img', 'hien'),
(3, 3, 'iPad', 'Tablet', 12000.00, 11, 'img', 'hien'),
(4, 4, 'Cap sac', 'PK', 500.00, 30, 'img', 'hien'),
(5, 5, 'Canon', 'Camera', 10000.00, 8, 'img', 'hien'),
(6, 6, 'Watch', 'Dong ho', 8000.00, 6, 'img', 'hien'),
(7, 7, 'Sony', 'Tai nghe', 3000.00, 20, 'img', 'hien'),
(8, 8, 'Keyboard', 'Ban phim', 2000.00, 25, 'img', 'hien'),
(9, 9, 'Mouse', 'Chuot', 1500.00, 29, 'img', 'hien'),
(10, 10, 'LG', 'Man hinh', 7000.00, 6, 'img', 'hien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '123', 'admin', '2026-04-03 02:46:30'),
(2, 'user1', 'u1@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(3, 'user2', 'u2@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(4, 'user3', 'u3@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(5, 'user4', 'u4@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(6, 'user5', 'u5@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(7, 'user6', 'u6@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(8, 'user7', 'u7@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(9, 'user8', 'u8@gmail.com', '123', 'customer', '2026-04-03 02:46:30'),
(10, 'user9', 'u9@gmail.com', '123', 'customer', '2026-04-03 02:46:30');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
