-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2018 at 01:41 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `author`, `content`, `images`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Banh ngon ngay tet', 'Thao', 'Banh ngon lam', 'https://baomoi-photo-1-td.zadn.vn/w700_r1/16/11/13/61/20818277/1_58205.jpg', NULL, NULL, 1),
(2, 'Banh ngon ngay mua', 'Thao', 'Banh ngon binh thuong', 'https://afamilycdn.com/L9AscbailKNM6qlDjYJqDI39UnIrac/Image/2016/03/xac-phat-them-voi-10-mon-banh-dan-da-ngon-lanh-cua-duong-pho-sai-gon_ab77e8b167.jpg', NULL, NULL, 1),
(3, 'Banh ngon ngay nang', 'Thao', 'Banh rat ngon', 'https://c2.staticflickr.com/6/5825/22970996514_a721f12743.jpg', NULL, NULL, 1),
(4, 'Banh ngon ngay ram', 'Thao', 'Banh kha ngon', 'https://daylambanh.r.worldssl.net/images/kienthuckynang/banh-mi-bread.jpg', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bakeries`
--

CREATE TABLE `bakeries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `categoryId` int(10) UNSIGNED NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bakeries`
--

INSERT INTO `bakeries` (`id`, `name`, `description`, `price`, `categoryId`, `images`, `content`, `note`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Bánh nướng đậu xanh', 'Bánh ngon', 40000, 2, 'https://baomoi-photo-1-td.zadn.vn/w700_r1/16/11/13/61/20818277/1_58205.jpg', 'Bánh ngon', 'Bánh ngon', NULL, NULL, 1),
(2, 'Bánh nướng đậu đỏ', 'Bánh ngon', 45000, 2, 'https://baomoi-photo-1-td.zadn.vn/w700_r1/16/11/13/61/20818277/1_58205.jpg', 'Bánh ngon', 'Bánh ngon', NULL, NULL, 1),
(3, 'Bánh nướng đậu đen', 'Bánh ngon', 40000, 2, 'https://baomoi-photo-1-td.zadn.vn/w700_r1/16/11/13/61/20818277/1_58205.jpg', 'Bánh ngon', 'Bánh ngon', NULL, NULL, 1),
(4, 'Bánh chay', 'Bánh ngon', 20000, 3, 'https://baomoi-photo-1-td.zadn.vn/w700_r1/16/11/13/61/20818277/1_58205.jpg', 'Bánh ngon', 'Bánh ngon', NULL, NULL, 1),
(6, 'Bánh ngon', 'hảo hạng', 3000, 1, 'http://lambanh365.com/wp-content/uploads/2015/05/thuong-thuc-banh-kem-tai-3-tiem-banh-ngon-nhat-ha-thanh-5-e1433059850784.jpg', 'asccc', 'aas', '2018-07-28 05:31:11', '2018-07-28 05:31:11', 1),
(7, 'Bánh pía', 'bánh ngon', 40000, 1, 'http://lambanh365.com/wp-content/uploads/2015/06/cach-lam-banh-pia-soc-trang-don-gian-tai-nha-10.jpg', 'abc', 'bánh ngon', '2018-07-31 06:44:52', '2018-07-31 06:44:52', 1),
(8, 'Bánh ngọt', 'ngon', 1000, 2, 'https://res.cloudinary.com/vvhatever/image/upload/c_fit,h_150,w_150/1533118891.png', 'ngon', 'rất ngon', '2018-08-01 03:21:34', '2018-08-01 03:21:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `images`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Bánh ngon ngày tết', 'Bánh trưng, bánh dày', 'http://media.doisongphapluat.com/2017/11/04/banh_gc.jpg', NULL, NULL, 1),
(2, 'Bánh trung thu', 'Bánh nướng bánh dẻo rằm tháng tám', 'http://www.savourydays.com/wp-content/uploads/2016/08/c%C3%A1ch-l%C3%A0m-b%C3%A1nh-trung-thu-banner.jpg', NULL, NULL, 1),
(3, 'Bánh tết hàn thực', 'Bánh trôi bánh chay', 'https://agiadinh.net/wp-content/uploads/2017/03/cach-lam-banh-troi-nuoc-8.jpg', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `name`, `description`, `images`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Bộ sưu tập mùa xuân', 'Những món ăn mùa xuân', 'https://anh.eva.vn/upload/3-2016/images/2016-09-01/1472686104-banh-nuong-khong-duong--17--watermark.jpg', NULL, NULL, 1),
(2, 'Bộ sưu tập mùa hạ', 'Những món ăn mùa hạ', 'http://phapluatnet.vn/Uploads/images/banh-ngot9.jpg', NULL, NULL, 1),
(3, 'Bộ sưu tập mùa thu', 'Những món ăn mùa thu', 'https://image.thanhnien.vn/665/uploaded/triquang/2017_03_24/suachua_kvpj.jpg', NULL, NULL, 1),
(4, 'Bộ sưu tập mùa đông', 'Những món ăn mùa đông', 'http://satbabau.vn/wp-content/uploads/2017/03/an-gi-de-sinh-con-trai-con-gai-4-1.jpg', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_21_113411_create_categories_table', 1),
(4, '2018_07_21_113412_create_bakeries_table', 1),
(5, '2018_07_21_122002_create_collections_table', 1),
(6, '2018_07_21_123610_create_articles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bakeries`
--
ALTER TABLE `bakeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bakeries_categoryid_foreign` (`categoryId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bakeries`
--
ALTER TABLE `bakeries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bakeries`
--
ALTER TABLE `bakeries`
  ADD CONSTRAINT `bakeries_categoryid_foreign` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
