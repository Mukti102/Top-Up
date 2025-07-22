-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 22, 2025 at 10:20 AM
-- Server version: 10.6.22-MariaDB-cll-lve
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dtqcghkc_topup`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_payment_method`
--

CREATE TABLE `brand_payment_method` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_payment_method`
--

INSERT INTO `brand_payment_method` (`id`, `brand_id`, `payment_method_id`, `created_at`, `updated_at`) VALUES
(11, 580, 10, NULL, NULL),
(12, 580, 8, NULL, NULL),
(13, 580, 14, NULL, NULL),
(14, 580, 9, NULL, NULL),
(15, 580, 11, NULL, NULL),
(16, 580, 1, NULL, NULL),
(17, 580, 13, NULL, NULL),
(18, 580, 12, NULL, NULL),
(19, 580, 15, NULL, NULL),
(20, 580, 6, NULL, NULL),
(21, 580, 4, NULL, NULL),
(22, 580, 7, NULL, NULL),
(23, 580, 5, NULL, NULL),
(24, 580, 2, NULL, NULL),
(25, 580, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brand_products`
--

CREATE TABLE `brand_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `rules_brands_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_payment_costum` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `isRecommended` tinyint(1) NOT NULL DEFAULT 0,
  `isPopular` tinyint(1) NOT NULL DEFAULT 0,
  `background_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_products`
--

INSERT INTO `brand_products` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `provider`, `rules_brands_id`, `status`, `is_payment_costum`, `image`, `seo_description`, `category_id`, `seo_title`, `isRecommended`, `isPopular`, `background_image`) VALUES
(563, 'Ragnarok M: Eternal Love', 'ragnarok-m-eternal-love', NULL, '2025-03-24 10:29:13', '2025-04-07 01:49:46', NULL, 8, 1, 0, 'brandProduct/01JR6Z0Z6HT4BGSEYT7K5J3J0F.jpeg', NULL, 1, NULL, 0, 0, NULL),
(564, 'AXIS', 'axis', NULL, '2025-03-24 10:29:13', '2025-04-07 01:29:44', NULL, 8, 1, 0, 'brandProduct/01JR6XW92NJME6CX35KWQENFNN.jpeg', NULL, 2, NULL, 0, 0, NULL),
(567, 'by.U', 'byu', NULL, '2025-03-24 10:29:13', '2025-04-07 01:47:21', NULL, 8, 1, 0, 'brandProduct/01JR6YWHEHZBYR8BY309S797CN.jpeg', NULL, 2, NULL, 0, 0, NULL),
(568, 'DANA', 'dana', NULL, '2025-03-24 10:29:13', '2025-04-06 18:03:19', NULL, 8, 1, 0, 'brandProduct/01JR64AVYRXX2CQ8PQG9V4W0R2.jpeg', NULL, 5, NULL, 0, 0, NULL),
(569, 'FREE FIRE', 'free-fire', NULL, '2025-03-24 10:29:13', '2025-04-07 02:59:11', NULL, 8, 1, 0, 'brandProduct/01JR6Z6DD0NAD04TS94CQ8WYEX.jpeg', NULL, 1, NULL, 0, 1, 'brandProduct/01JR7302JMEKKJ88SS85AZZQ9Y.jpg'),
(570, 'TELKOMSEL', 'telkomsel', NULL, '2025-03-24 10:29:13', '2025-04-06 17:52:28', NULL, 8, 1, 0, 'brandProduct/01JR63Q0410E4PCDVECM03T77X.jpeg', NULL, 3, NULL, 0, 0, NULL),
(571, 'XL', 'xl', NULL, '2025-03-24 10:29:13', '2025-04-07 01:39:13', NULL, 8, 1, 0, 'brandProduct/01JR6YDMMB7B3W2Z13QKJ0Y0PH.jpeg', NULL, 3, NULL, 0, 0, NULL),
(572, 'GO PAY', 'go-pay', NULL, '2025-03-24 10:29:13', '2025-04-06 18:04:12', NULL, 8, 1, 0, 'brandProduct/01JR64CFADYSF0QJRTTBZC1K17.jpeg', NULL, 5, NULL, 0, 0, NULL),
(573, 'GARENA', 'garena', NULL, '2025-03-24 10:29:13', '2025-04-07 02:08:09', NULL, 8, 1, 0, 'brandProduct/01JR6Z7DMFG31GKKPKJWB793ZG.jpeg', NULL, 1, NULL, 1, 1, NULL),
(574, 'TRI', 'tri', NULL, '2025-03-24 10:29:13', '2025-04-07 01:40:02', NULL, 8, 1, 0, 'brandProduct/01JR6YF4Y4XJCAPNADJ4RR9D7H.jpeg', NULL, 3, NULL, 0, 0, NULL),
(576, 'INDOSAT', 'indosat', NULL, '2025-03-24 10:29:13', '2025-04-07 01:32:22', NULL, 8, 1, 0, 'brandProduct/01JR6Y13B05P9MZABRAJPEEA2T.jpeg', NULL, 2, NULL, 0, 0, NULL),
(580, 'MOBILE LEGENDS', 'mobile-legends', '<h3><strong>Tata Cara Top-Up Mobile Legends di Website Kami</strong></h3><p>Ingin mendapatkan lebih banyak diamond di Mobile Legends? Berikut adalah langkah-langkah mudah untuk melakukan top-up Mobile Legends melalui website kami:</p><p><strong>1. Masuk atau Daftar di Website Kami</strong></p><ul><li>Jika Anda belum memiliki akun, silakan <strong>daftar</strong> terlebih dahulu dengan mengisi data diri yang diperlukan.</li><li>Jika sudah memiliki akun, cukup <strong>masuk</strong> menggunakan username dan password Anda.</li></ul><p><strong>2. Pilih Menu \"Top-Up Mobile Legends\"</strong></p><ul><li>Setelah berhasil login, buka menu utama dan pilih <strong>\"Top-Up Mobile Legends\"</strong> pada halaman utama atau di menu kategori yang tersedia.</li></ul><p><strong>3. Tentukan Jumlah Diamond yang Ingin Dibeli</strong></p><ul><li>Di halaman top-up, pilih jumlah <strong>diamond</strong> yang ingin Anda beli. Kami menawarkan berbagai pilihan paket diamond dengan harga yang bervariasi untuk memenuhi kebutuhan Anda.</li></ul><p><strong>4. Pilih Metode Pembayaran</strong></p><ul><li>Setelah memilih jumlah diamond, lanjutkan dengan memilih metode pembayaran yang paling nyaman bagi Anda. Kami mendukung berbagai metode pembayaran, seperti:<ul><li><strong>Transfer Bank</strong></li><li><strong>Pulsa</strong></li><li><strong>E-Wallet (OVO, GoPay, DANA, dll)</strong></li><li><strong>Kartu Kredit/Debit</strong></li></ul></li></ul><p><strong>5. Masukkan ID Pengguna Mobile Legends Anda</strong></p><ul><li>Di bagian ini, Anda akan diminta untuk memasukkan <strong>ID Mobile Legends</strong> Anda. Pastikan ID yang dimasukkan benar agar diamond dapat masuk ke akun Mobile Legends Anda dengan tepat.</li></ul><p><strong>6. Konfirmasi dan Selesaikan Pembayaran</strong></p><ul><li>Setelah mengisi ID dan memilih metode pembayaran, konfirmasi pesanan Anda. Jika semuanya sudah sesuai, lanjutkan untuk melakukan pembayaran sesuai dengan metode yang Anda pilih.</li></ul><p><strong>7. Tunggu Proses Top-Up</strong></p><ul><li>Setelah pembayaran berhasil, kami akan segera memproses top-up Anda. Proses ini biasanya hanya memakan waktu beberapa menit.</li><li>Anda akan menerima <strong>notifikasi atau email konfirmasi</strong> setelah diamond berhasil dikirimkan ke akun Mobile Legends Anda.</li></ul><p><strong>8. Nikmati Diamond di Mobile Legends</strong></p><ul><li>Setelah proses selesai, buka game Mobile Legends Anda, dan diamond yang Anda beli akan langsung tersedia di akun Anda. Gunakan diamond untuk membeli hero, skin, dan berbagai item menarik lainnya!</li></ul><p><br></p>', '2025-03-24 10:29:13', '2025-04-07 02:01:05', NULL, 9, 1, 1, 'brandProduct/01JR6ZNPGWHXM5XS109QTDP75Q.jpg', NULL, 1, NULL, 1, 0, NULL),
(581, 'OVO', 'ovo', NULL, '2025-03-24 10:29:13', '2025-04-07 01:40:55', NULL, 8, 1, 0, 'brandProduct/01JR6YGRNM1DSND353XZETKJ3S.jpeg', NULL, 5, NULL, 0, 0, NULL),
(583, 'PUBG MOBILE', 'pubg-mobile', NULL, '2025-03-24 10:29:13', '2025-04-06 17:54:35', NULL, 8, 1, 0, 'brandProduct/01JR63TW0Q9D3RN2DQ34D18T9J.jpeg', NULL, 1, NULL, 0, 1, NULL),
(585, 'PLN', 'pln', NULL, '2025-03-24 10:29:13', '2025-04-07 01:45:11', NULL, 8, 1, 0, 'brandProduct/01JR6YRJ5BMRW2N5BR4ZVJ5CAJ.jpeg', NULL, 11, NULL, 0, 0, NULL),
(587, 'SHOPEE PAY', 'shopee-pay', NULL, '2025-03-24 10:29:13', '2025-04-07 01:42:44', NULL, 8, 1, 0, 'brandProduct/01JR6YM3C9E3W6R1F3C8H8N5DQ.jpeg', NULL, 5, NULL, 0, 0, NULL),
(588, 'SMARTFREN', 'smartfren', NULL, '2025-03-24 10:29:13', '2025-04-07 01:37:41', NULL, 8, 1, 0, 'brandProduct/01JR6YAV25ZT6AP2C8P7HDP4NE.jpeg', NULL, 2, NULL, 0, 0, NULL),
(593, 'Tower of Fantasy', 'tower-of-fantasy', NULL, '2025-03-24 10:29:13', '2025-04-07 02:07:33', NULL, 8, 1, 0, 'brandProduct/01JR648WBEMFC4V2VYTY2SEM25.jpeg', NULL, 1, NULL, 1, 1, NULL),
(597, 'Genshin Impact', 'genshin-impact', NULL, '2025-04-06 17:37:29', '2025-04-07 09:33:27', NULL, 8, 1, 0, 'brandProduct/01JR7SHZWE5E2P2GAQ3RCTPSSZ.jpeg', NULL, 1, NULL, 1, 1, NULL),
(599, 'Naruto Shippuden', 'naruto-shippuden', NULL, '2025-04-06 17:37:29', '2025-04-07 02:08:34', NULL, 8, 1, 0, 'brandProduct/01JR63YJDDRJG6Z1KK1V28T1NW.jpeg', NULL, 1, NULL, 1, 1, NULL),
(600, 'SPOTIFY', 'spotify', NULL, '2025-04-06 17:37:29', '2025-04-06 17:57:48', NULL, 8, 1, 0, 'brandProduct/01JR640RQ15VN95B4G1TGR2731.jpeg', NULL, 12, NULL, 0, 0, NULL),
(601, 'Viu', 'viu', NULL, '2025-04-06 17:37:29', '2025-04-07 01:45:48', NULL, 8, 1, 0, 'brandProduct/01JR6YSPE3BJDG48ZJ59K0BH6R.jpeg', NULL, 12, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('topupapp_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1750700798),
('topupapp_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1750700798;', 1750700798),
('topupapp_cache_livewire-rate-limiter:0663c60a2c0029c6fe298cf12e3bdda1c41aba03', 'i:2;', 1747501734),
('topupapp_cache_livewire-rate-limiter:0663c60a2c0029c6fe298cf12e3bdda1c41aba03:timer', 'i:1747501734;', 1747501734),
('topupapp_cache_livewire-rate-limiter:1452b9d30a4bafcda3be701024c49a9e6fe8d8ba', 'i:1;', 1746860091),
('topupapp_cache_livewire-rate-limiter:1452b9d30a4bafcda3be701024c49a9e6fe8d8ba:timer', 'i:1746860091;', 1746860091),
('topupapp_cache_livewire-rate-limiter:2678cf0d314fc05b83a3f2a33cc048389b24bfa6', 'i:1;', 1746452375),
('topupapp_cache_livewire-rate-limiter:2678cf0d314fc05b83a3f2a33cc048389b24bfa6:timer', 'i:1746452375;', 1746452375),
('topupapp_cache_livewire-rate-limiter:39f0128d8acd28cd94e66c0546bf9aff63422224', 'i:2;', 1747913682),
('topupapp_cache_livewire-rate-limiter:39f0128d8acd28cd94e66c0546bf9aff63422224:timer', 'i:1747913682;', 1747913682),
('topupapp_cache_livewire-rate-limiter:3f51cf6d56f06159f4135e915fb41b9d17e35d36', 'i:1;', 1747890993),
('topupapp_cache_livewire-rate-limiter:3f51cf6d56f06159f4135e915fb41b9d17e35d36:timer', 'i:1747890993;', 1747890993),
('topupapp_cache_livewire-rate-limiter:433ad2dbb9d43a5626552c80bf664a9dd9c4fa22', 'i:1;', 1747580312),
('topupapp_cache_livewire-rate-limiter:433ad2dbb9d43a5626552c80bf664a9dd9c4fa22:timer', 'i:1747580312;', 1747580312),
('topupapp_cache_livewire-rate-limiter:4ece1f1eb74cd7d3554b35fd7c3aaf520d821b24', 'i:1;', 1747895919),
('topupapp_cache_livewire-rate-limiter:4ece1f1eb74cd7d3554b35fd7c3aaf520d821b24:timer', 'i:1747895919;', 1747895919),
('topupapp_cache_livewire-rate-limiter:5a693b3afa5f86bc1763277f9692506f884cb82e', 'i:1;', 1746549295),
('topupapp_cache_livewire-rate-limiter:5a693b3afa5f86bc1763277f9692506f884cb82e:timer', 'i:1746549295;', 1746549295),
('topupapp_cache_livewire-rate-limiter:5ae220d9f32f44e812f04706842a7fa089e69994', 'i:1;', 1751719260),
('topupapp_cache_livewire-rate-limiter:5ae220d9f32f44e812f04706842a7fa089e69994:timer', 'i:1751719260;', 1751719260),
('topupapp_cache_livewire-rate-limiter:5d0cac4803c0a1fc985bd8a54fe4bd7e0ca1faa2', 'i:1;', 1751963177),
('topupapp_cache_livewire-rate-limiter:5d0cac4803c0a1fc985bd8a54fe4bd7e0ca1faa2:timer', 'i:1751963177;', 1751963177),
('topupapp_cache_livewire-rate-limiter:623295ffa1ba4226d5ac538cb32b099808a2a27d', 'i:1;', 1747895936),
('topupapp_cache_livewire-rate-limiter:623295ffa1ba4226d5ac538cb32b099808a2a27d:timer', 'i:1747895936;', 1747895936),
('topupapp_cache_livewire-rate-limiter:751f5a085d3cba5f0a5bae86bcd44b60198282b4', 'i:1;', 1750077568),
('topupapp_cache_livewire-rate-limiter:751f5a085d3cba5f0a5bae86bcd44b60198282b4:timer', 'i:1750077568;', 1750077568),
('topupapp_cache_livewire-rate-limiter:96e6f8c9c2df57ee8fb955e8d50de8d6d34f28ca', 'i:1;', 1747416826),
('topupapp_cache_livewire-rate-limiter:96e6f8c9c2df57ee8fb955e8d50de8d6d34f28ca:timer', 'i:1747416826;', 1747416826),
('topupapp_cache_livewire-rate-limiter:992cba003bef8e88a31a3e2adbb499f8a9eb7b08', 'i:1;', 1746849736),
('topupapp_cache_livewire-rate-limiter:992cba003bef8e88a31a3e2adbb499f8a9eb7b08:timer', 'i:1746849736;', 1746849736),
('topupapp_cache_livewire-rate-limiter:ae021b7454e1b7765fa999858770f32981176f20', 'i:1;', 1750700709),
('topupapp_cache_livewire-rate-limiter:ae021b7454e1b7765fa999858770f32981176f20:timer', 'i:1750700709;', 1750700709),
('topupapp_cache_livewire-rate-limiter:b102ff09b2d371fa16df2a860eadf30c8b1e83de', 'i:1;', 1749865684),
('topupapp_cache_livewire-rate-limiter:b102ff09b2d371fa16df2a860eadf30c8b1e83de:timer', 'i:1749865684;', 1749865684),
('topupapp_cache_livewire-rate-limiter:b1ac9f26aa98c617c11a85e46931b3823c407aba', 'i:1;', 1746462154),
('topupapp_cache_livewire-rate-limiter:b1ac9f26aa98c617c11a85e46931b3823c407aba:timer', 'i:1746462154;', 1746462154),
('topupapp_cache_livewire-rate-limiter:b44e9d56879eb75085656255143e4277199adfc9', 'i:1;', 1746727222),
('topupapp_cache_livewire-rate-limiter:b44e9d56879eb75085656255143e4277199adfc9:timer', 'i:1746727222;', 1746727222),
('topupapp_cache_livewire-rate-limiter:c948a00015cb89aaa2f649dae126b38a53ca9c10', 'i:1;', 1747816683),
('topupapp_cache_livewire-rate-limiter:c948a00015cb89aaa2f649dae126b38a53ca9c10:timer', 'i:1747816683;', 1747816683),
('topupapp_cache_livewire-rate-limiter:d9849493393fa769e3eb54d6f4377d2d0b84fc26', 'i:1;', 1746456105),
('topupapp_cache_livewire-rate-limiter:d9849493393fa769e3eb54d6f4377d2d0b84fc26:timer', 'i:1746456105;', 1746456105),
('topupapp_cache_livewire-rate-limiter:e3181e9e6e414baae7fab151c26f2839b95d3244', 'i:1;', 1749867061),
('topupapp_cache_livewire-rate-limiter:e3181e9e6e414baae7fab151c26f2839b95d3244:timer', 'i:1749867061;', 1749867061),
('topupapp_cache_otp_081111111111', 'i:939402;', 1749839596),
('topupapp_cache_otp_081336920647', 'i:31445;', 1747406245),
('topupapp_cache_otp_081919191919', 'i:259171;', 1748845729),
('topupapp_cache_otp_081953202265', 'i:511287;', 1749839627),
('topupapp_cache_otp_082239472910', 'i:422413;', 1752485353),
('topupapp_cache_otp_082353135961', 'i:202055;', 1747406221),
('topupapp_cache_otp_08388810788', 'i:33217;', 1749194673),
('topupapp_cache_otp_085156563008', 'i:638883;', 1747839943),
('topupapp_cache_otp_085855185068', 'i:216174;', 1752484009),
('topupapp_cache_otp_089506222871', 'i:534069;', 1749091605),
('topupapp_cache_otp_6281953202265', 'i:684640;', 1749839686),
('topupapp_cache_otp_62821', 'i:333337;', 1746583429),
('topupapp_cache_otp_6282323780821', 'i:673910;', 1749096023),
('topupapp_cache_otp_6289506222871', 'i:639928;', 1749091779),
('topupapp_cache_otp_token_OIXRtjScBJDwbQWpc9Y4sJRPSxjY7oNZ', 's:12:\"081336920647\";', 1747406545);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `provider`) VALUES
(1, 'Games', 'games', NULL, '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(2, 'Pulsa', 'pulsa', NULL, '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(3, 'Data', 'data', NULL, '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(5, 'E-Money', 'e-money', NULL, '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(11, 'PLN', 'pln', NULL, '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(12, 'Voucher', 'voucher', NULL, '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'cde087ca-68bb-4d48-8575-f605e5854a3c', 'database', 'default', '{\"uuid\":\"cde087ca-68bb-4d48-8575-f605e5854a3c\",\"displayName\":\"App\\\\Jobs\\\\SendWa\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWa\",\"command\":\"O:15:\\\"App\\\\Jobs\\\\SendWa\\\":2:{s:8:\\\"\\u0000*\\u0000phone\\\";s:12:\\\"081336920647\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:325:\\\"📌 Pembayaran Berhasil!\\n\\nHalo Admin, ada customer yang baru saja menyelesaikan pembayaran 🎉\\n\\n🔹 Nama: *[NAME_CUSTOMER]*\\n🔹 Order ID: *TRX-1744046443-1403543*\\n🔹 Total Bayar: *204.250*\\n🔹 Metode: *[PAYMENT_METHODE]*\\n🔹 Waktu: *2025-04-08 00:28:54*\\n\\nCek dashboard untuk verifikasi lebih lanjut ya. Semangat! 🚀\\\";}\"}}', 'GuzzleHttp\\Exception\\ConnectException: cURL error 28: SSL connection timeout (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://api.fonnte.com/send in D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:275\nStack trace:\n#0 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(205): GuzzleHttp\\Handler\\CurlFactory::createRejection(Object(GuzzleHttp\\Handler\\EasyHandle), Array)\n#1 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(157): GuzzleHttp\\Handler\\CurlFactory::finishError(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#2 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish(Object(GuzzleHttp\\Handler\\CurlHandler), Object(GuzzleHttp\\Handler\\EasyHandle), Object(GuzzleHttp\\Handler\\CurlFactory))\n#3 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#4 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#5 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1341): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#6 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1307): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#7 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1293): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#8 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#9 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(38): GuzzleHttp\\PrepareBodyMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#10 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#11 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#12 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}(Object(GuzzleHttp\\Psr7\\Request), Array)\n#13 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke(Object(GuzzleHttp\\Psr7\\Request), Array)\n#14 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer(Object(GuzzleHttp\\Psr7\\Request), Array)\n#15 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync(\'POST\', Object(GuzzleHttp\\Psr7\\Uri), Array)\n#16 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(1139): GuzzleHttp\\Client->request(\'POST\', \'https://api.fon...\', Array)\n#17 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(907): Illuminate\\Http\\Client\\PendingRequest->sendRequest(\'POST\', \'https://api.fon...\', Array)\n#18 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(338): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#19 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(905): retry(0, Object(Closure), 100, Object(Closure))\n#20 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(804): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://api.fon...\', Array)\n#21 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\app\\Jobs\\SendWa.php(33): Illuminate\\Http\\Client\\PendingRequest->post(\'https://api.fon...\', Array)\n#22 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendWa->handle()\n#23 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#24 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#25 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#26 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#27 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#28 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendWa))\n#29 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendWa))\n#30 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendWa), false)\n#32 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendWa))\n#33 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendWa))\n#34 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#35 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendWa))\n#36 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#37 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#38 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#39 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#41 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#42 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#43 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#44 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#45 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#46 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#47 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#48 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#50 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#55 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#56 {main}\n\nNext Illuminate\\Http\\Client\\ConnectionException: cURL error 28: SSL connection timeout (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://api.fonnte.com/send in D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php:941\nStack trace:\n#0 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(338): Illuminate\\Http\\Client\\PendingRequest->Illuminate\\Http\\Client\\{closure}(1)\n#1 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(905): retry(0, Object(Closure), 100, Object(Closure))\n#2 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Http\\Client\\PendingRequest.php(804): Illuminate\\Http\\Client\\PendingRequest->send(\'POST\', \'https://api.fon...\', Array)\n#3 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\app\\Jobs\\SendWa.php(33): Illuminate\\Http\\Client\\PendingRequest->post(\'https://api.fon...\', Array)\n#4 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendWa->handle()\n#5 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#7 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#8 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#9 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#10 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendWa))\n#11 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendWa))\n#12 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendWa), false)\n#14 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendWa))\n#15 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendWa))\n#16 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendWa))\n#18 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#19 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#20 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#21 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#24 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#25 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#26 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#27 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#28 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#29 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#30 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 D:\\vscode\\laravel\\parctice\\ppob\\ppob\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#38 {main}', '2025-04-07 17:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `field_inputs`
--

CREATE TABLE `field_inputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seperator` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `type_status` enum('text','select') NOT NULL DEFAULT 'text',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `rules_brands_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `field_inputs`
--

INSERT INTO `field_inputs` (`id`, `seperator`, `placeholder`, `label`, `type_status`, `options`, `created_at`, `updated_at`, `name`, `rules_brands_id`) VALUES
(4, NULL, 'Hanyaa', 'ID USER', 'select', '{\"assssssssssssasasasasasasasasasssasa\": null}', '2025-03-21 03:55:05', '2025-03-21 03:55:05', 'User Id', 7),
(6, NULL, 'Hanya Angka Tanpa Spasi ', 'ID USER', 'text', NULL, '2025-03-21 11:24:03', '2025-03-21 11:24:03', 'User Id ', 8),
(7, NULL, 'asssss', 'ID USER', 'text', NULL, '2025-03-21 12:24:17', '2025-03-21 12:24:17', 'User Id', 9),
(9, NULL, 'Masukkan Server ', 'Server', 'text', NULL, '2025-04-05 13:53:27', '2025-04-05 13:53:27', 'Server', 9),
(10, NULL, 'Masukkan username akun anda', 'Username', 'text', NULL, '2025-04-07 17:05:57', '2025-04-07 17:05:57', 'Username', 10),
(11, NULL, 'Masukkan password akun game anda', 'Kata sandi', 'text', NULL, '2025-04-07 17:05:57', '2025-04-07 17:05:57', 'Kata Sandi', 10),
(12, NULL, 'email@gmail.com', 'Email', 'text', NULL, '2025-05-05 08:19:59', '2025-05-05 08:19:59', 'Email', 11),
(13, NULL, 'Password', 'Password', 'text', NULL, '2025-05-05 08:19:59', '2025-05-05 08:19:59', 'Password', 11),
(14, NULL, 'Nickname', 'Nickname', 'text', NULL, '2025-05-05 08:19:59', '2025-05-05 08:19:59', 'Nickname', 11),
(15, NULL, 'Request Hero Minimal 3', 'Request Hero Minimal 3', 'text', NULL, '2025-05-05 08:19:59', '2025-05-05 08:19:59', 'Request Hero Minimal 3', 11),
(16, NULL, 'Catatan untuk Penjoki', 'Catatan untuk Penjoki', 'text', NULL, '2025-05-05 08:19:59', '2025-05-05 08:19:59', 'Catatan untuk Penjoki', 11);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(132, 'default', '{\"uuid\":\"fa4f0d1c-1fcd-4634-ac7f-3931478a707a\",\"displayName\":\"App\\\\Jobs\\\\SendWa\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWa\",\"command\":\"O:15:\\\"App\\\\Jobs\\\\SendWa\\\":2:{s:8:\\\"\\u0000*\\u0000phone\\\";s:11:\\\"08882105159\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:538:\\\"✅ Pesanan Anda Berhasil Dibuat!\\n\\nHalo *GUEST*,\\n\\nPesanan Anda telah berhasil dibuat dengan detail berikut:\\n\\n📌 Detail Pesanan:\\n🛍️ Produk: *Garena 33 Shell*\\n🧾 Nomor Invoice: *TRX-1751718426-4310582*\\n💰 Total Pembayaran: *Rp. 10.363*\\n🔹 Methode Pembayaran : *[QRIS ]*\\n⏳ Batas Waktu Pembayaran: *2025-07-05 20:27:06*\\n\\n⚠ Segera selesaikan pembayaran sebelum batas waktu berakhir untuk menghindari pembatalan pesanan.\\n\\nTerima kasih telah berbelanja di [COMPANY_NAME]! Jika ada pertanyaan, jangan ragu untuk menghubungi kami.\\\";}\"}}', 0, NULL, 1751718426, 1751718426),
(133, 'default', '{\"uuid\":\"b36a8b3e-6e1b-45d5-9cc7-6d7e44193fe5\",\"displayName\":\"App\\\\Jobs\\\\SendWa\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWa\",\"command\":\"O:15:\\\"App\\\\Jobs\\\\SendWa\\\":2:{s:8:\\\"\\u0000*\\u0000phone\\\";s:12:\\\"081392269113\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:540:\\\"✅ Pesanan Anda Berhasil Dibuat!\\n\\nHalo *GUEST*,\\n\\nPesanan Anda telah berhasil dibuat dengan detail berikut:\\n\\n📌 Detail Pesanan:\\n🛍️ Produk: *SHOPEE PAY 50.000*\\n🧾 Nomor Invoice: *TRX-1752373386-4053546*\\n💰 Total Pembayaran: *Rp. 53.472*\\n🔹 Methode Pembayaran : *[DANA ]*\\n⏳ Batas Waktu Pembayaran: *2025-07-13 10:23:06*\\n\\n⚠ Segera selesaikan pembayaran sebelum batas waktu berakhir untuk menghindari pembatalan pesanan.\\n\\nTerima kasih telah berbelanja di [COMPANY_NAME]! Jika ada pertanyaan, jangan ragu untuk menghubungi kami.\\\";}\"}}', 0, NULL, 1752373387, 1752373387),
(134, 'default', '{\"uuid\":\"b2da52d6-f890-4617-abc5-c2d5da468fe8\",\"displayName\":\"App\\\\Jobs\\\\SendWa\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWa\",\"command\":\"O:15:\\\"App\\\\Jobs\\\\SendWa\\\":2:{s:8:\\\"\\u0000*\\u0000phone\\\";s:12:\\\"085855185068\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:138:\\\"Kode OTP Anda untuk verifikasi akun adalah: *216174*.  \\nJangan bagikan kode ini kepada siapa pun.   \\n\\nTerima kasih telah mendaftar ! 🚀\\n\\\";}\"}}', 0, NULL, 1752483709, 1752483709),
(135, 'default', '{\"uuid\":\"56cf7841-f4c2-4a34-b7d9-2dea2a34e264\",\"displayName\":\"App\\\\Jobs\\\\SendWa\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWa\",\"command\":\"O:15:\\\"App\\\\Jobs\\\\SendWa\\\":2:{s:8:\\\"\\u0000*\\u0000phone\\\";s:12:\\\"082239472910\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:138:\\\"Kode OTP Anda untuk verifikasi akun adalah: *422413*.  \\nJangan bagikan kode ini kepada siapa pun.   \\n\\nTerima kasih telah mendaftar ! 🚀\\n\\\";}\"}}', 0, NULL, 1752485053, 1752485053),
(136, 'default', '{\"uuid\":\"ac3f3461-3358-406e-88bd-2b550d7b1fbc\",\"displayName\":\"App\\\\Jobs\\\\SendWa\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWa\",\"command\":\"O:15:\\\"App\\\\Jobs\\\\SendWa\\\":2:{s:8:\\\"\\u0000*\\u0000phone\\\";s:12:\\\"085809933288\\\";s:10:\\\"\\u0000*\\u0000message\\\";s:535:\\\"✅ Pesanan Anda Berhasil Dibuat!\\n\\nHalo *GUEST*,\\n\\nPesanan Anda telah berhasil dibuat dengan detail berikut:\\n\\n📌 Detail Pesanan:\\n🛍️ Produk: *OVO 100.000*\\n🧾 Nomor Invoice: *TRX-1752776832-1769337*\\n💰 Total Pembayaran: *Rp. 106.585*\\n🔹 Methode Pembayaran : *[QRIS ]*\\n⏳ Batas Waktu Pembayaran: *2025-07-18 02:27:12*\\n\\n⚠ Segera selesaikan pembayaran sebelum batas waktu berakhir untuk menghindari pembatalan pesanan.\\n\\nTerima kasih telah berbelanja di [COMPANY_NAME]! Jika ada pertanyaan, jangan ragu untuk menghubungi kami.\\\";}\"}}', 0, NULL, 1752776832, 1752776832);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kupons`
--

CREATE TABLE `kupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `expiration_date` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kupons`
--

INSERT INTO `kupons` (`id`, `code`, `name`, `discount`, `expiration_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'EJ4-836', 'Lebaran', 5, '2025-05-06', 1, '2025-03-31 17:18:40', '2025-05-05 14:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_19_074206_create_user_logs_table', 1),
(5, '2025_03_19_114031_create_categories_table', 1),
(6, '2025_03_19_120102_create_brand_products_table', 1),
(7, '2025_03_19_121327_create_type_products_table', 1),
(8, '2025_03_19_121845_add_provider_to_category_table', 1),
(9, '2025_03_19_122022_add_provider_to_brand_products_table', 1),
(10, '2025_03_19_122108_add_provider_to_type_products_table', 1),
(11, '2025_03_19_122552_create_products_table', 1),
(12, '2025_03_19_123520_add_provider_to_products_table', 1),
(13, '2025_03_19_124014_add_icon_to_products_table', 1),
(14, '2025_03_19_150107_add_collumn_to_products_table', 1),
(15, '2025_03_19_151833_add_collumn_benefit_to_products_table', 1),
(16, '2025_03_19_162001_change_column_status_products_table', 1),
(17, '2025_03_19_171016_add_collumn_membership_price_to_products_table', 1),
(18, '2025_03_19_181250_update_products_table', 1),
(19, '2025_03_20_154322_create_kupons_table', 1),
(20, '2025_03_20_155540_create_payment_methods_table', 1),
(21, '2025_03_21_070147_create_field_inputs_table', 1),
(22, '2025_03_21_071450_create_rules_brands_table', 1),
(23, '2025_03_21_075006_add_foreig_id_rules_to_brand_products_table', 1),
(24, '2025_03_21_091524_add_name_to_field_inputs_table', 2),
(25, '2025_03_21_095124_change_column_rules_brand_table', 3),
(26, '2025_03_21_101331_add_foreign_id_to_field_inputs_table', 4),
(27, '2025_03_21_184818_add_columns_to_brand_products_table', 5),
(28, '2025_03_21_190154_create_brand_payment_method_table', 5),
(29, '2025_03_21_194355_add_status_to_brand_products_table', 6),
(30, '2025_03_22_143327_add_payment_costum_to_brand_products_table', 7),
(31, '2025_03_22_144142_add_image_to_brand_products_table', 8),
(32, '2025_03_22_144708_add_seo_description_to_brand_products_table', 9),
(33, '2025_03_23_004853_create_transactions_table', 10),
(34, '2025_03_24_161839_add_category_id_to_brand_products_table', 11),
(35, '2025_03_24_170324_add_column_category_id_to_brand_products_table', 12),
(36, '2025_03_24_171657_add_columns_category_id_to_brand_products_table', 13),
(37, '2025_03_27_163358_add_expired_status_to_transactions_table', 14),
(38, '2025_03_29_163044_add_nullble_to_user_logs_table', 15),
(39, '2025_03_30_152222_create_roles_table', 16),
(40, '2025_03_30_152756_add_columns_to_users_table', 16),
(41, '2025_04_01_130727_create_product_groups_table', 17),
(42, '2025_04_01_131550_add_group_id_to_products_table', 18),
(43, '2025_04_01_212437_create_whatsapp_templates_table', 19),
(44, '2025_04_01_213149_add_role_to_whatsapp_templates_table', 20),
(45, '2025_04_01_225936_add_array_column_to_whatsapp_templates_table', 21),
(46, '2025_04_02_004411_add_expired_time_to_payment_methods_table', 22),
(47, '2025_04_02_005929_add_column_kupon_id_to_transactions_table', 23),
(48, '2025_04_02_111515_add_type_to_transactions_table', 24),
(49, '2025_04_02_223059_create_general_models_table', 25),
(50, '2025_04_02_231819_create_general-settings_table', 26),
(51, '2025_04_02_231820_add_logo_favicon_columns_to_general_settings_table', 26),
(52, '2010_12_14_083707_create_settings_table', 27),
(53, '2025_04_02_234310_sites_settings', 27),
(54, '2025_04_03_003211_create_settings_table', 28),
(55, '2025_04_04_145124_add_title_seo_to_brands_table', 29),
(56, '2025_04_04_153315_create_news_table', 30),
(57, '2025_04_05_000144_add_columns_to_brand_products_table', 31),
(58, '2025_04_06_011623_add_custom_fields_to_users_table', 32),
(59, '2025_04_06_011624_add_avatar_url_to_users_table', 32),
(60, '2025_04_06_012520_add_avatar_url_to_users_table', 33),
(61, '2025_04_07_095313_add_column_to_brand_products_table', 33),
(62, '2025_04_08_004908_add_custom_fields_to_users_table', 34),
(63, '2025_04_08_140857_add_level_to_users_table', 34),
(64, '2025_04_08_142415_add_level_default_to_users_table', 35);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `thumbnail`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'KRAFTON Umumkan Kolaborasi PUBG Mobile x BABYMONSTER', '<p>&nbsp;PUBG Mobile kembali membuat gebrakan dengan kolaborasi terbarunya. Kini game battle royale besutan KRAFTON tersebut mengumumkan kerjasamanya dengan girls group KPOP BABYMONSTER. Kolaborasi PUBG Mobile x BABYMONSTER ini sekaligus menyambut perayaan ulang tahun PUBG Mobile yang ke-7.</p><p>Kolaborasi ini menghadirkan berbagai konten eksklusif BABYMONSTER ke dalam game PUBG Mobile. Beberapa item yang dirumorkan tersebut&nbsp; seperti skin karakter, senjata, kendaraan, dan item kosmetik lainnya bertemakan BABYMONSTER. Selain itu, para pemain juga dapat menikmati lagu-lagu hits BABYMONSTER dalam game dan berpartisipasi dalam event-event khusus dengan hadiah-hadiah menarik.&nbsp;</p>', 'News/01JVHYJ1CYVSF0677CH368JFC6.jpg', '[\"promo\", \"game\", \"topup\"]', '2025-04-04 09:26:58', '2025-05-18 15:00:21'),
(122, 'Saepe eaque explicabo reprehenderit nobis sit.', 'Ipsa aut consequuntur dicta veniam autem. Ipsam est rerum blanditiis quod.', 'News/01JRAFCTBFC75A5C7PJ50QQ8R9.jpg', '[\"MLBB\", \"E-Sports\", \"Guides\"]', '2025-04-04 12:31:37', '2025-04-08 10:33:35'),
(124, 'Voluptas aut nemo magni quam non rerum molestiae veritatis.', 'Error voluptatem odio delectus aperiam quisquam velit et. Voluptas soluta architecto est quia. Excepturi cum ullam quo eos est voluptas. Sit ut dolores velit sint nostrum voluptas quis porro.', 'News/01JR8TXK3H4S0XHZYZPA1AB7WR.jpg', '[\"Ragnarok\", \"E-Sports\", \"Promo\"]', '2025-04-04 12:31:37', '2025-04-07 19:16:30'),
(125, 'Sit expedita unde impedit beatae mollitia.', 'Asperiores quia vero sit nam quibusdam quasi error. Dicta unde velit ut laboriosam. Aspernatur beatae saepe ea accusantium autem iste praesentium.', 'News/01JR8TYN44N1X9EAD7QDFCRJFY.jpeg', '[\"PUBG\", \"E-Sports\", \"Promo\"]', '2025-04-04 12:31:37', '2025-04-07 19:17:05'),
(126, 'Et commodi porro architecto laudantium possimus nobis.', 'Iste consequuntur sint blanditiis in quasi. Qui vitae accusantium ipsum incidunt veritatis reprehenderit illum.', 'News/01JR8V158Y6709PMH2XDZJJXE6.jpg', '[\"MLBB\", \"Ragnarok\", \"Promo\"]', '2025-04-04 12:31:37', '2025-04-07 19:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `fee_percentage` decimal(8,2) NOT NULL DEFAULT 0.00,
  `fee_fixed` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minimum_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `maximum_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `img_url` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `timing` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `code`, `name`, `type`, `fee_percentage`, `fee_fixed`, `minimum_amount`, `maximum_amount`, `img_url`, `img`, `status`, `timing`, `created_at`, `updated_at`, `expired_time`) VALUES
(1, 'PERMATAVA', 'Permata Virtual Account', 'Virtual Account', 0.00, 4250.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/szezRhAALB1583408731.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(2, 'BNIVA', 'BNI Virtual Account', 'Virtual Account', 0.00, 4250.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/n22Qsh8jMa1583433577.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(3, 'BRIVA', 'BRI Virtual Account', 'Virtual Account', 0.00, 4250.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/8WQ3APST5s1579461828.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(4, 'MANDIRIVA', 'Mandiri Virtual Account', 'Virtual Account', 0.00, 4250.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/T9Z012UE331583531536.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(5, 'BCAVA', 'BCA Virtual Account', 'Virtual Account', 0.00, 5500.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/ytBKvaleGy1605201833.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(6, 'MUAMALATVA', 'Muamalat Virtual Account', 'Virtual Account', 0.00, 4250.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/GGwwcgdYaG1611929720.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(7, 'BSIVA', 'BSI Virtual Account', 'Virtual Account', 0.00, 4250.00, 10000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/tEclz5Assb1643375216.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(8, 'ALFAMART', 'Alfamart', 'Convenience Store', 0.00, 3500.00, 10000.00, 2500000.00, 'https://assets.tripay.co.id/upload/payment-icon/jiGZMKp2RD1583433506.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(9, 'INDOMARET', 'Indomaret', 'Convenience Store', 0.00, 3500.00, 10000.00, 2500000.00, 'https://assets.tripay.co.id/upload/payment-icon/zNzuO5AuLw1583513974.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(10, 'ALFAMIDI', 'Alfamidi', 'Convenience Store', 0.00, 3500.00, 5000.00, 2500000.00, 'https://assets.tripay.co.id/upload/payment-icon/aQTdaUC2GO1593660384.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(11, 'OVO', 'OVO', 'E-Wallet', 3.00, 0.00, 1000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/fH6Y7wDT171586199243.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(12, 'QRIS', 'QRIS by ShopeePay', 'E-Wallet', 0.70, 750.00, 1000.00, 5000000.00, 'https://assets.tripay.co.id/upload/payment-icon/BpE4BPVyIw1605597490.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(13, 'QRIS2', 'QRIS', 'E-Wallet', 0.70, 750.00, 1000.00, 5000000.00, 'https://assets.tripay.co.id/upload/payment-icon/8ewGzP6SWe1649667701.png', 'payment-methods/01JR73BPCDJDWTBQZRZN327CC4.png', 'active', NULL, '2025-03-22 07:24:21', '2025-04-07 03:05:32', 60),
(14, 'DANA', 'DANA', 'E-Wallet', 3.00, 0.00, 1000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/sj3UHLu8Tu1655719621.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(15, 'SHOPEEPAY', 'ShopeePay', 'E-Wallet', 3.00, 0.00, 1000.00, 10000000.00, 'https://assets.tripay.co.id/upload/payment-icon/d204uajhlS1655719774.png', NULL, 'active', NULL, '2025-03-22 07:24:21', '2025-04-01 18:02:49', 60),
(16, 'Saldo Member', 'Saldo Member', 'Saldo Member', 0.00, 0.00, 10000.00, 1000000.00, NULL, 'paymentmethods/01JR8QZ0SHT51TSMYNZFMHAQ37.png', 'active', NULL, '2025-04-07 14:10:09', '2025-04-07 18:24:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku_code` varchar(255) NOT NULL,
  `type_product_id` bigint(20) UNSIGNED NOT NULL,
  `brand_product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `seller_name` varchar(255) NOT NULL,
  `base_price` decimal(15,2) NOT NULL,
  `premium_price` decimal(15,2) NOT NULL,
  `selling_price` decimal(15,2) NOT NULL,
  `admin_fee` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `reward_points` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `stock` varchar(255) NOT NULL DEFAULT '0',
  `seller_status` tinyint(1) NOT NULL DEFAULT 1,
  `benefit` decimal(15,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `membership_price` decimal(15,2) DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `sku_code`, `type_product_id`, `brand_product_id`, `category_id`, `description`, `seller_name`, `base_price`, `premium_price`, `selling_price`, `admin_fee`, `total_price`, `reward_points`, `price`, `created_at`, `updated_at`, `provider`, `icon`, `stock`, `seller_status`, `benefit`, `status`, `membership_price`, `group_id`) VALUES
(254, '1 Big Cat Coins', '1-big-cat-coins', '1BCC', 1, 563, 1, NULL, 'CV***', 4300.00, 10.00, 4515.00, 0.00, 4515.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 215.00, 1, 4063.50, NULL),
(255, 'Axis 10.000', 'axis-10000', 'ax10', 1, 564, 2, NULL, 'Ma***', 10821.00, 10.00, 11362.05, 0.00, 11362.05, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 541.05, 1, 10225.85, NULL),
(256, 'Axis 5.000', 'axis-5000', 'ax5', 1, 564, 2, NULL, 'To***', 5849.00, 10.00, 6141.45, 0.00, 6141.45, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 292.45, 1, 5527.31, NULL),
(257, 'Axis Data SS 2 GB 3 Hari', 'axis-data-ss-2-gb-3-hari', 'axdss2', 3, 564, 3, NULL, 'BC***', 10205.00, 10.00, 10715.25, 0.00, 10715.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 510.25, 1, 9643.73, NULL),
(258, 'by.U 10.000', 'byu-10000', 'byu10', 1, 567, 2, NULL, 'GE***', 10295.00, 10.00, 10809.75, 0.00, 10809.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 514.75, 1, 9728.78, NULL),
(259, 'DANA 20.000', 'dana-20000', 'dana20', 1, 568, 5, NULL, 'BC***', 20135.00, 10.00, 21141.75, 0.00, 21141.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1006.75, 1, 19027.58, NULL),
(260, 'DANA 50.000', 'dana-50000', 'dana50', 1, 568, 5, NULL, 'AM***', 50125.00, 10.00, 52631.25, 0.00, 52631.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2506.25, 1, 47368.13, NULL),
(261, 'Free Fire 12 Diamond', 'free-fire-12-diamond', 'ff12', 1, 569, 1, NULL, 'SM***', 2400.00, 10.00, 2520.00, 0.00, 2520.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 120.00, 1, 2268.00, NULL),
(262, 'Free Fire 140 Diamond', 'free-fire-140-diamond', 'ff140', 1, 569, 1, NULL, 'YO***', 17710.00, 10.00, 18595.50, 0.00, 18595.50, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 885.50, 1, 16735.95, NULL),
(263, 'Free Fire 355 Diamond', 'free-fire-355-diamond', 'ff355', 1, 569, 1, NULL, 'ko***', 44500.00, 10.00, 46725.00, 0.00, 46725.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2225.00, 1, 42052.50, NULL),
(264, 'Free Fire 50 Diamond', 'free-fire-50-diamond', 'ff50', 1, 569, 1, NULL, 'Ki***', 6315.00, 10.00, 6630.75, 0.00, 6630.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 315.75, 1, 5967.68, NULL),
(265, 'Free Fire 70 Diamond', 'free-fire-70-diamond', 'ff70', 1, 569, 1, NULL, 'Sq***', 8976.00, 10.00, 9424.80, 0.00, 9424.80, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 448.80, 1, 8482.32, NULL),
(266, 'Telkomsel Data Flash 1 GB 30 Hari', 'telkomsel-data-flash-1-gb-30-hari', 'flash1', 5, 570, 3, NULL, 'AU***', 11235.00, 10.00, 11796.75, 0.00, 11796.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 561.75, 1, 10617.08, NULL),
(267, 'Telkomsel Data Flash 2 GB 30 Hari', 'telkomsel-data-flash-2-gb-30-hari', 'flash2', 5, 570, 3, NULL, 'Me***', 20395.00, 10.00, 21414.75, 0.00, 21414.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1019.75, 1, 19273.28, NULL),
(268, 'Telkomsel Data Flash 3 GB 30 Hari', 'telkomsel-data-flash-3-gb-30-hari', 'flash3', 5, 570, 3, NULL, 'Mi***', 21575.00, 10.00, 22653.75, 0.00, 22653.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1078.75, 1, 20388.38, NULL),
(269, 'XL Xtra Combo Flex S', 'xl-xtra-combo-flex-s', 'flexs', 6, 571, 3, NULL, 'Ou***', 19560.00, 10.00, 20538.00, 0.00, 20538.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 978.00, 1, 18484.20, NULL),
(270, 'Genshin Impact 60 Genesis Crystals', 'genshin-impact-60-genesis-crystals', 'GI60', 1, 597, 1, NULL, 'Ku***', 13010.00, 10.00, 13660.50, 0.00, 13660.50, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 650.50, 1, 12294.45, NULL),
(271, 'Go Pay 100.000', 'go-pay-100000', 'go100', 7, 572, 5, NULL, 'CV***', 100675.00, 10.00, 105708.75, 0.00, 105708.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 5033.75, 1, 95137.88, NULL),
(272, 'Go Pay 50.000', 'go-pay-50000', 'go50', 7, 572, 5, NULL, 'Ce***', 50675.00, 10.00, 53208.75, 0.00, 53208.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2533.75, 1, 47887.88, NULL),
(273, 'Garena 33 Shell', 'garena-33-shell', 'GRN33', 1, 573, 1, NULL, 'CV***', 9155.00, 10.00, 9612.75, 0.00, 9612.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 457.75, 1, 8651.48, NULL),
(274, 'Tri Data Happy 1.5 GB 1 Hari', 'tri-data-happy-15-gb-1-hari', 'happy1', 8, 574, 3, NULL, 'Mi***', 3574.00, 10.00, 3752.70, 0.00, 3752.70, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 178.70, 1, 3377.43, NULL),
(275, 'Tri Data Happy 3 GB 3 Hari', 'tri-data-happy-3-gb-3-hari', 'happy3', 8, 574, 3, NULL, 'RA***', 10475.00, 10.00, 10998.75, 0.00, 10998.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 523.75, 1, 9898.88, NULL),
(276, 'Indosat 10.000', 'indosat-10000', 'i10', 1, 576, 2, NULL, 'Ke***', 11624.00, 10.00, 12205.20, 0.00, 12205.20, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 581.20, 1, 10984.68, NULL),
(277, 'Indosat 20.000', 'indosat-20000', 'i20', 1, 576, 2, NULL, 'Ce***', 20795.00, 10.00, 21834.75, 0.00, 21834.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1039.75, 1, 19651.28, NULL),
(278, 'Indosat 25.000', 'indosat-25000', 'i25', 1, 576, 2, NULL, 'SL***', 25840.00, 10.00, 27132.00, 0.00, 27132.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1292.00, 1, 24418.80, NULL),
(279, 'Indosat 30.000', 'indosat-30000', 'i30', 1, 576, 2, NULL, 'SL***', 30680.00, 10.00, 32214.00, 0.00, 32214.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1534.00, 1, 28992.60, NULL),
(280, 'Indosat 5.000', 'indosat-5000', 'i5', 1, 576, 2, NULL, 'pa***', 6655.00, 10.00, 6987.75, 0.00, 6987.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 332.75, 1, 6288.98, NULL),
(281, 'Indosat 50.000', 'indosat-50000', 'i50', 1, 576, 2, NULL, 'Ki***', 48975.00, 10.00, 51423.75, 0.00, 51423.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2448.75, 1, 46281.38, NULL),
(282, 'Indosat Freedom Internet 2.5 GB 5 Hari', 'indosat-freedom-internet-25-gb-5-hari', 'if2', 10, 576, 3, NULL, 'CV***', 12355.00, 10.00, 12972.75, 0.00, 12972.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 617.75, 1, 11675.48, NULL),
(283, 'Indosat Freedom Internet 3 GB 28 Hari', 'indosat-freedom-internet-3-gb-28-hari', 'if3g30d', 10, 576, 3, NULL, 'Ea***', 19638.00, 10.00, 20619.90, 0.00, 20619.90, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 981.90, 1, 18557.91, NULL),
(284, 'Indosat Freedom Internet 3 GB 3 Hari', 'indosat-freedom-internet-3-gb-3-hari', 'if3g3d', 10, 576, 3, NULL, 'Pa***', 11580.00, 10.00, 12159.00, 0.00, 12159.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 579.00, 1, 10943.10, NULL),
(285, 'Indosat Freedom Internet 5.5 GB 28 Hari', 'indosat-freedom-internet-55-gb-28-hari', 'if5g30d', 10, 576, 3, NULL, 'Ki***', 30569.00, 10.00, 32097.45, 0.00, 32097.45, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1528.45, 1, 28887.71, NULL),
(286, 'MOBILELEGEND - 10 Diamond', 'mobilelegend-10-diamond', 'ml10', 1, 580, 1, NULL, 'NE***', 2867.00, 10.00, 3010.35, 0.00, 3010.35, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 143.35, 1, 2709.32, 1),
(287, 'MOBILELEGEND - 12 Diamond', 'mobilelegend-12-diamond', 'ml12', 1, 580, 1, NULL, 'Ra***', 3380.00, 10.00, 3549.00, 0.00, 3549.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 169.00, 1, 3194.10, 1),
(288, 'MOBILELEGEND - 5 Diamond', 'mobilelegend-5-diamond', 'ml5', 1, 580, 1, NULL, 'RA***', 1431.00, 10.00, 1502.55, 0.00, 1502.55, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 71.55, 1, 1352.30, 1),
(289, 'MOBILE LEGENDS Weekly Diamond Pass', 'mobile-legends-weekly-diamond-pass', 'mlweek', 12, 580, 1, NULL, 'BC***', 27645.00, 10.00, 29027.25, 0.00, 29027.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1382.25, 1, 26124.53, 1),
(290, 'Naruto Shippuden 10+1 Gold', 'naruto-shippuden-101-gold', 'NRTS10', 1, 599, 1, NULL, 'BA***', 14267.00, 10.00, 14980.35, 0.00, 14980.35, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 713.35, 1, 13482.32, NULL),
(291, 'OVO 100.000', 'ovo-100000', 'ovo100', 1, 581, 5, NULL, 'BC***', 100795.00, 10.00, 105834.75, 0.00, 105834.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 5039.75, 1, 95251.28, NULL),
(292, 'OVO 50.000', 'ovo-50000', 'ovo50', 1, 581, 5, NULL, 'Mi***', 50800.00, 10.00, 53340.00, 0.00, 53340.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2540.00, 1, 48006.00, NULL),
(293, 'Cek Nama Pengguna OVO', 'cek-nama-pengguna-ovo', 'ovocek', 1, 581, 5, NULL, 'Om***', 5.00, 10.00, 5.25, 0.00, 5.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 0.25, 1, 4.73, NULL),
(294, 'Pubg Royale Pass', 'pubg-royale-pass', 'PBGR1', 1, 583, 1, NULL, 'La***', 139465.00, 10.00, 146438.25, 0.00, 146438.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 6973.25, 1, 131794.43, NULL),
(295, 'Pubg Royale Pass', 'pubg-royale-pass', 'PBGR2', 1, 583, 1, NULL, 'KH***', 142200.00, 10.00, 149310.00, 0.00, 149310.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 7110.00, 1, 134379.00, NULL),
(296, 'PLN 100.000', 'pln-100000', 'pln100', 1, 585, 11, NULL, 'BC***', 100599.00, 10.00, 105628.95, 0.00, 105628.95, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 5029.95, 1, 95066.06, NULL),
(297, 'PLN 1.000.000', 'pln-1000000', 'pln1000', 1, 585, 11, NULL, 'AM***', 1000595.00, 10.00, 1050624.75, 0.00, 1050624.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 50029.75, 1, 945562.28, NULL),
(298, 'PLN 20.000', 'pln-20000', 'pln20', 1, 585, 11, NULL, 'MU***', 20667.00, 10.00, 21700.35, 0.00, 21700.35, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1033.35, 1, 19530.32, NULL),
(299, 'PLN 50.000', 'pln-50000', 'pln50', 1, 585, 11, NULL, 'Ke***', 50634.00, 10.00, 53165.70, 0.00, 53165.70, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2531.70, 1, 47849.13, NULL),
(300, 'Telkomsel 10.000', 'telkomsel-10000', 's10', 1, 570, 2, NULL, 'Mi***', 10255.00, 10.00, 10767.75, 0.00, 10767.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 512.75, 1, 9690.98, NULL),
(301, 'Telkomsel 100.000', 'telkomsel-100000', 's100', 1, 570, 2, NULL, 'BC***', 98850.00, 10.00, 103792.50, 0.00, 103792.50, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 4942.50, 1, 93413.25, NULL),
(302, 'Telkomsel 15.000', 'telkomsel-15000', 's15', 1, 570, 2, NULL, 'Di***', 14810.00, 10.00, 15550.50, 0.00, 15550.50, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 740.50, 1, 13995.45, NULL),
(303, 'Telkomsel 20.000', 'telkomsel-20000', 's20', 1, 570, 2, NULL, 'Pa***', 20110.00, 10.00, 21115.50, 0.00, 21115.50, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1005.50, 1, 19003.95, NULL),
(304, 'Telkomsel 25.000', 'telkomsel-25000', 's25', 1, 570, 2, NULL, 'pa***', 24630.00, 10.00, 25861.50, 0.00, 25861.50, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1231.50, 1, 23275.35, NULL),
(305, 'Telkomsel 30.000', 'telkomsel-30000', 's30', 1, 570, 2, NULL, 'GE***', 29975.00, 10.00, 31473.75, 0.00, 31473.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1498.75, 1, 28326.38, NULL),
(306, 'Telkomsel 5.000', 'telkomsel-5000', 's5', 1, 570, 2, NULL, 'Zo***', 5215.00, 10.00, 5475.75, 0.00, 5475.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 260.75, 1, 4928.18, NULL),
(307, 'Telkomsel 50.000', 'telkomsel-50000', 's50', 1, 570, 2, NULL, 'pa***', 49225.00, 10.00, 51686.25, 0.00, 51686.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2461.25, 1, 46517.63, NULL),
(308, 'SHOPEE PAY 100.000', 'shopee-pay-100000', 'shopee100', 1, 587, 5, NULL, 'Pa***', 100925.00, 10.00, 105971.25, 0.00, 105971.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 5046.25, 1, 95374.13, NULL),
(309, 'SHOPEE PAY 50.000', 'shopee-pay-50000', 'shopee50', 1, 587, 5, NULL, 'Pa***', 50925.00, 10.00, 53471.25, 0.00, 53471.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2546.25, 1, 48124.13, NULL),
(310, 'Smartfren 10.000', 'smartfren-10000', 'sm10', 1, 588, 2, NULL, 'Ma***', 9940.00, 10.00, 10437.00, 0.00, 10437.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 497.00, 1, 9393.30, NULL),
(311, 'Smartfren Data Unlimited Harian 1 GB Berlaku 7 Hari', 'smartfren-data-unlimited-harian-1-gb-berlaku-7-hari', 'smdu1', 14, 588, 3, NULL, 'Mi***', 21145.00, 10.00, 22202.25, 0.00, 22202.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1057.25, 1, 19982.03, NULL),
(312, 'Smartfren Data Unlimited Harian 2 GB Berlaku 28 Hari', 'smartfren-data-unlimited-harian-2-gb-berlaku-28-hari', 'smdu2', 14, 588, 3, NULL, 'SO***', 84675.00, 10.00, 88908.75, 0.00, 88908.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 4233.75, 1, 80017.88, NULL),
(313, 'Spotify Premium Subscription Voucher - 1 Bulan', 'spotify-premium-subscription-voucher-1-bulan', 'SPTY', 1, 600, 12, NULL, 'Me***', 56025.00, 10.00, 58826.25, 0.00, 58826.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 2801.25, 1, 52943.63, NULL),
(314, 'Three 10.000', 'three-10000', 't10', 1, 574, 2, NULL, 'BU***', 11549.00, 10.00, 12126.45, 0.00, 12126.45, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 577.45, 1, 10913.81, NULL),
(315, 'Three 20.000', 'three-20000', 't20', 1, 574, 2, NULL, 'PA***', 20835.00, 10.00, 21876.75, 0.00, 21876.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1041.75, 1, 19689.08, NULL),
(316, 'Three 5.000', 'three-5000', 't5', 1, 574, 2, NULL, 'EL***', 6615.00, 10.00, 6945.75, 0.00, 6945.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 330.75, 1, 6251.18, NULL),
(317, 'Tower of Fantasy 60 Tanium', 'tower-of-fantasy-60-tanium', 'TOF60', 1, 593, 1, NULL, 'Ne***', 11700.00, 10.00, 12285.00, 0.00, 12285.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 585.00, 1, 11056.50, NULL),
(318, 'Voucher Viu 1 Bulan', 'voucher-viu-1-bulan', 'VIU', 1, 601, 12, NULL, 'CV***', 36525.00, 10.00, 38351.25, 0.00, 38351.25, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 1826.25, 1, 34516.13, NULL),
(319, 'Voucher Telkomsel 2.5 GB 5 Hari (Jawa Barat)', 'voucher-telkomsel-25-gb-5-hari-jawa-barat', 'vs2g5d', 16, 570, 12, NULL, 'Mi***', 11955.00, 10.00, 12552.75, 0.00, 12552.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 597.75, 1, 11297.48, NULL),
(320, 'Xl 10.000', 'xl-10000', 'x10', 1, 571, 2, NULL, 'SO***', 10820.00, 10.00, 11361.00, 0.00, 11361.00, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 541.00, 1, 10224.90, NULL),
(321, 'Xl 5.000', 'xl-5000', 'x5', 1, 571, 2, NULL, 'Lu***', 5955.00, 10.00, 6252.75, 0.00, 6252.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 297.75, 1, 5627.48, NULL),
(322, 'Indosat Yellow 1 GB 1 Hari', 'indosat-yellow-1-gb-1-hari', 'yellow1', 17, 576, 3, NULL, 'AM***', 5855.00, 10.00, 6147.75, 0.00, 6147.75, 1, 0, '2025-05-08 18:00:53', '2025-06-16 12:43:24', 'DigiFlazz', NULL, 'unlimited', 1, 292.75, 1, 5532.98, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_groups`
--

CREATE TABLE `product_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_groups`
--

INSERT INTO `product_groups` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Umum', 'product-group/01JR6ZC2MJNXFWW9MFZ06BTRCS.png', '2025-04-01 06:19:53', '2025-04-07 01:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rules_brands`
--

CREATE TABLE `rules_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rules_brands`
--

INSERT INTO `rules_brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(8, 'Default', '2025-03-21 03:56:28', '2025-03-21 11:24:17'),
(9, 'User ID And Server Id', '2025-03-21 12:24:17', '2025-04-05 13:53:27'),
(10, 'Akun', '2025-04-07 17:05:57', '2025-04-07 17:05:57'),
(11, 'Joki', '2025-05-05 08:19:59', '2025-05-05 08:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2fB2Qd4ULC8GUdxd8YRnIavhb9uYDBdC3xeY7LRi', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVB6dFlwa0gyS0RnZjd5MG9qQ0tWVkRFRDNWcnZNU1V6RkgxMnpFRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753132217),
('9LWgcELMfwP3YQNaKgOs9reYnmwVrR4HygZ5nSw9', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTRidVdBeFB3R0c1NWo2OU9Pa3lobXJVNWlwWkNIWmF1bUVmeXdCWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753152043),
('BP6qJCr9UP0KOGeNR28XNSVKJnFvTYPgnQl4FylT', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEwxS251V29WcktPMWpBVWVodVJMMG9MMDRMTEVHczlBQWhKNUREciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753150236),
('COBnOGILDmp1zTADdyCGP3RJm7H4bCmEeUMhtclV', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEdMb1dHTHNsdzRnb2ZYamZYWTJTN3lZSUp0WUt4SU9Mdkp3M04yTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753141227),
('f0KSKO4teC0mZXA60QNrdk8a00zP6xRCp4dPszeB', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGZNZ3R0UnRwVWxHeFF5S1pQV01jTUNXMlNLWmRzSGlNTmp4T0diZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753134024),
('KJ8xg3LZdhrWJ2IJzkdLVRZzX1hYzgWui14Dc0Xw', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVRIaXY1dWY4Y0tZMjBpbGJDcnlOUWpJaktWR3d2MlE2UlZFZUQ5ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753153840),
('PdruS4A4WG9OfmUtdmzfjhYpRJb8at3iVzkXYkA4', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3dVRUNFajV3SEg4akpjQnRNYUpKWkFrdWRtZ2xpU0V0RVFwdHJISSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753143043),
('pKmWG2q0OemGsLFbc5r3qQD4wCaUERkeGyPKELHq', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieG5NWDFMSGRxcTVJS2hmRE54dFlsdjlHYjhLRnRFRlk1d2dxNmY3WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753148438),
('PTp166EUx6FpVmneCpw1476ShcxLE91gH9hS9su3', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2pvb0lVaUhRdHdlM3ZYMUo3MXFUaWtmbUhUNVpqajNuYzNaZ1N4SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753137614),
('R10M4E2SV40zGPHxoyK6n05Qkeea4P39hcLIAsxF', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialVLNHo4ZGpzSUpBY2F6bm53dVkwV0VKeTJFRGcyb1N3WU80Umh4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753135818),
('tpS59jW5N78PxSF3QVTU4bZgCHtZhRaBu707hun9', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTRwMkxjejcwTnprOElSSjE2RnhXaldETkpIc1VzVllpSE1JbDNNWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753144845),
('uLwsPehtlFGLStEgOBwqgnaySWCFDfQVAKMGQ4rK', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFlyTGExREtsMmZNNU5uNTJPYmdMc2NRcU44V3NJNFZVb2s3N1RUMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753146623),
('x8K6Tbqp4Vzh1mywjED85T3lAw1IuxJ0i4aBUlyt', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3E4QTJSeDlyQ3B3c1ZMQUhiWUdsUEwzSnJTUko1TmkzY2l0Ukk0diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753139417),
('YgWMXRtMRTqzzj5XFXjBsGt5vnK06jUg7LZtkIcm', NULL, '103.16.198.9', 'Python/3.11 aiohttp/3.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1JpY2xqV1Y4U0s2RXFxR0lCR1F2ZGljWFRZcnB0MUxwa0FHaktyayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly90b3B1cC5nZW5lcmEubXkuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753130429);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'general.brand_name', '\"TopupinAja\"', '2025-04-02 17:34:40', '2025-04-04 15:08:25'),
(2, 'seo.title', '\"TopupGameAja\"', '2025-04-02 17:34:40', '2025-04-04 06:38:56'),
(3, 'seo.description', '\"Description\"', '2025-04-02 17:34:40', '2025-04-04 06:41:59'),
(4, 'general.brand.phone', '\"111111111\"', '2025-04-02 17:52:53', '2025-04-02 17:52:53'),
(5, 'general.brand.email', '\"11111111\"', '2025-04-02 17:52:53', '2025-04-02 17:52:53'),
(6, 'general.brand.decription', '\"11111111111\"', '2025-04-02 17:52:53', '2025-04-02 17:52:53'),
(7, 'general.brand.address', '\"11111111\"', '2025-04-02 17:52:53', '2025-04-02 17:52:53'),
(8, 'general.brand.logo', '\"brand/01JR8TH7WZ9ZA5EZMCBDQHNXCK.png\"', '2025-04-02 17:52:53', '2025-04-07 19:09:48'),
(9, 'general.brand.favicon', '\"brand\\/favicon\\/01JYEYC9C1RX6Z0BE3JRCKKR23.shtml\"', '2025-04-02 17:52:53', '2025-06-23 17:46:36'),
(10, 'seo.owner', '\"Owner\"', '2025-04-02 17:52:53', '2025-04-04 06:41:59'),
(11, 'seo.keywords', '[\"topup\", \"game\", \"pulas\", \"voucher\", \"disount\", \"murah\"]', '2025-04-02 17:52:53', '2025-04-04 07:40:53'),
(12, 'sosmed.facebook', '\"11111111\"', '2025-04-02 18:12:51', '2025-04-07 02:35:14'),
(13, 'sosmed.twitter', '\"1111\"', '2025-04-02 18:12:51', '2025-04-07 02:35:14'),
(14, 'sosmed.instagram', '\"111\"', '2025-04-02 18:12:51', '2025-04-07 02:35:14'),
(15, 'sosmed.youtube', '\"111\"', '2025-04-02 18:12:51', '2025-04-07 02:35:14'),
(16, 'sosmed.linkedin', '\"1111\"', '2025-04-02 18:12:51', '2025-04-07 02:35:14'),
(17, 'transaction.prefix.code', '\"TRX\"', '2025-04-02 18:12:51', '2025-04-02 18:12:51'),
(18, 'transaction.benefit', '\"5\"', '2025-04-02 18:12:51', '2025-04-02 18:12:51'),
(19, 'transaction.expired.time', '\"60\"', '2025-04-02 18:12:51', '2025-04-02 18:12:51'),
(20, 'transaction.dicount.premium.member', '\"10\"', '2025-04-02 18:17:11', '2025-04-08 07:30:03'),
(21, 'syarat_dan_ketentuan', '\"<h2>Umum</h2><ul><li>Dengan mendaftar dan/atau menggunakan Layanan Tokogame.com, Pengguna secara otomatis menyetujui semua ketentuan Layanan Tokogame.com.</li><li>Aturan Penggunaan ini mengatur penggunaan seluruh Layanan yang terdapat pada Sistem Tokogame.com yang berlaku terhadap seluruh Pengguna dan terhadap setiap Pihak yang menyampaikan permintaan atau informasi kepada Tokogame.com. Dengan mendaftar akun Tokogame.com dan/atau menggunakan Sistem Tokogame.com, maka Pengguna dianggap telah membaca, mengerti, memahami dan menyetujui seluruh isi dalam Aturan Penggunaan.</li><li>Aturan Penggunaan dapat Kami ubah, modifikasi, tambah, hapus atau perubahan setiap saat sesuai dengan pengembangan Tokogame.com dan peraturan perundang-undangan. Pengguna Kami anjurkan untuk mengunjungi Sistem Tokogame.com secara berkala agar dapat mengetahui adanya perubahan tersebut.</li><li>ATURAN PENGGUNAAN INI MERUPAKAN BENTUK KESEPAKATAN YANG MERUPAKAN PERJANJIAN MENGIKAT ANTARA PENGGUNA DENGAN Tokogame.com. PENGGUNA SECARA SADAR DAN SUKARELA MENYETUJUI KETENTUAN INI UNTUK MENGGUNAKAN LAYANAN DI SISTEM Tokogame.com.</li></ul><p><br></p><h2>Definisi</h2><p>Dalam Aturan Penggunaan ini, sepanjang tidak ditentukan lain, istilah-istilah di bawah ini mempunyai arti sebagai berikut:</p><ol><li>Akun adalah data tentang Pengguna, minimum terdiri dari username, password, nomor telepon, dan email yang wajib diisi oleh Pengguna Terdaftar.</li><li>Aturan Penggunaan adalah perjanjian antara Pengguna dan Tokogame.com yang berisi seperangkat peraturan yang mengatur hak, kewajiban, tanggung jawab Pengguna dan Tokogame.com, serta tata cara penggunaan sistem Layanan Tokogame.com.</li><li>Tokogame.com Payment System adalah sistem pembayaran yang difasilitasi oleh Tokogame.com untuk para Pengguna melakukan transaksi jual-beli di Sistem Tokogame.com.</li><li>Data / Informasi Pribadi adalah data terkait dengan Pengguna yang dapat teridentifikasi dan/atau dapat diidentifikasi secara tersendiri atau dikombinasikan dengan informasi lainnya baik secara langsung maupun secara tidak langsung melalui sistem Elektronik dan/atau non elektronik.</li><li>Layanan adalah secara kolektif: (i) Sistem Tokogame.com; (ii) konten, fitur, layanan, dan fungsi apa pun yang tersedia di atau melalui Sistem oleh atau atas nama Tokogame.com, termasuk layanan Partner; dan pemberitahuan email, tombol, widget, promosi dan iklan termasuk kerjasama Tokogame.com dengan pihak ketiga untuk pengembangan aplikasi dan pengembangan kegiatan usaha Tokogame.com.</li><li>Partner adalah pihak-pihak yang bekerjasama dengan Tokogame.com untuk mendukung sistem dan Layanan Tokogame.com antara lain penyedia jasa pembayaran, penyedia voucher, penyedia jaringan dan lain-lain.</li><li>Pengguna adalah pihak (terdaftar/tidak terdaftar) yang mengakses Sistem Tokogame.com, termasuk namun tidak terbatas pada Pembeli, user offline, klien yang mana wajib mematuhi Aturan Penggunaan Tokogame.com beserta ketentuan-ketentuan lain termasuk namun tidak terbatas pada Kebijakan Privasi Tokogame.com.</li><li>Pembeli adalah Pengguna terdaftar atau tidak terdaftar yang melakukan top-up langsung ataupun voucher yang dijual oleh Sistem Tokogame.com serta wajib mematuhi Aturan Penggunaan Tokogame.com beserta ketentuan-ketentuan lain termasuk namun tidak terbatas pada Kebijakan Privasi Tokogame.com.</li><li>Sistem Tokogame.com adalah situs resmi www.Tokogame.com atau sistem atau sarana lainnya yang dapat diakses melalui perangkat komputer dan/atau perangkat seluler Pengguna termasuk Afiliasi, pihak ketiga yang bekerjasama dengan Tokogame.com.</li></ol><p><br><br></p><p><br></p>\"', '2025-04-03 15:34:54', '2025-04-04 14:54:32'),
(22, 'theme', '\"#8c0039\"', '2025-04-03 15:34:54', '2025-07-08 08:26:48'),
(23, 'slider', '[{\"slide\": \"slider/01JR74GTZMQT5QW0CR7249X927.jpg\"}, {\"slide\": \"slider/01JRAF54AVEEKA7RSMCNBWJCN0.jpg\"}]', '2025-04-03 15:34:54', '2025-04-08 10:29:26'),
(24, 'login.svg', '\"auth/01JQYG5A1VCWYEGP6X3KPGKSNW.svg\"', '2025-04-03 18:56:07', '2025-04-03 18:56:07'),
(25, 'register.svg', '\"auth/01JQYG5A26FJ756Z861RJ1N5B4.svg\"', '2025-04-03 18:56:08', '2025-04-03 18:56:08'),
(26, 'forgot.svg', '\"auth/01JQYG5A2CRSN03N85008CRQB2.svg\"', '2025-04-03 18:56:08', '2025-04-03 18:56:08'),
(27, 'OTP.svg', '\"auth/01JQYG5A2JB9VS5YJJ0YHM9HGD.svg\"', '2025-04-03 18:56:08', '2025-04-03 18:56:08'),
(28, 'reset.svg', '\"auth/01JQYG5A2X0QJFG3DF8TVWP6G4.svg\"', '2025-04-03 18:56:08', '2025-04-03 18:56:08'),
(29, 'dark_theme', '\"#df6bff\"', '2025-04-06 09:37:47', '2025-07-08 08:26:48'),
(30, 'background.home', '\"background\\/01JRC59VG3FSAAFKPMTTVFAMKV.jpg\"', '2025-04-06 09:54:00', '2025-04-09 02:15:42'),
(31, 'background.show', '\"background/01JR58ASQ50Y7RQH3V85S6YH4V.avif\"', '2025-04-06 09:54:00', '2025-04-06 09:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('purchase','deposit') NOT NULL DEFAULT 'purchase',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `costumer_number` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `reference_number` varchar(255) NOT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`response`)),
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','success','failed') NOT NULL DEFAULT 'pending',
  `status_payment` enum('pending','success','failed','expired') NOT NULL DEFAULT 'pending',
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kupon_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `user_id`, `product_id`, `costumer_number`, `quantity`, `price`, `reference_number`, `response`, `email`, `phone`, `payment_method_id`, `status`, `status_payment`, `processed_at`, `created_at`, `updated_at`, `kupon_id`) VALUES
(38, 'deposit', 1, NULL, NULL, 1, 100000, 'TRX-1743573724-7654475', '{\"amount\": 100000, \"status\": \"UNPAID\", \"pay_url\": null, \"pay_code\": \"426514198837435\", \"reference\": \"DEV-T38382217864DZONK\", \"total_fee\": 4250, \"return_url\": null, \"order_items\": [{\"sku\": \"KODE\", \"name\": \"Produuct\", \"price\": 100000, \"quantity\": 1, \"subtotal\": 100000, \"image_url\": null, \"product_url\": null}], \"callback_url\": null, \"checkout_url\": \"https://tripay.co.id/checkout/DEV-T38382217864DZONK\", \"expired_time\": 1743577388, \"fee_customer\": 0, \"fee_merchant\": 4250, \"instructions\": [{\"steps\": [\"Masuk ke Internet Banking BSI Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih nomor rekening Anda\", \"Pilih <b>Jenis Pembayaran > Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>426514198837435</b>)\", \"Klik tombol <b>Verifikasi</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Masukkan TAN & PIN Anda\", \"Tekan tombol <b>Submit</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"Internet Banking\"}, {\"steps\": [\"Masuk ke aplikasi BSI Mobile Anda\", \"Pilih menu <b>Bayar</b>\", \"Pilih menu <b>Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>426514198837435</b>)\", \"Klik <b>Selanjutnya</b>\", \"Masukkan PIN Anda\", \"Klik <b>Selanjutnya</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Klik <b>Selanjutnya</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"BSI Mobile\"}, {\"steps\": [\"Datang ke ATM BSI\", \"Masukkan kartu dan PIN kartu Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih <b>Institusi</b>\", \"Masukkan kode institusi 1062 + Nomor Virtual Account Anda. Contoh: <b>1062426514198837435</b>\", \"Tekan tombol <b>Benar</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Tekan tombol <b>BENAR/YA</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"ATM BSI\"}], \"merchant_ref\": \"TRX-1743573724-7654475\", \"payment_name\": \"BSI Virtual Account\", \"customer_name\": \"Test User\", \"customer_email\": \"admin@gmail.com\", \"customer_phone\": \"081336920647\", \"payment_method\": \"BSIVA\", \"amount_received\": 95750, \"payment_selection_type\": \"static\"}', NULL, '081336920647', 7, 'success', 'success', '2025-04-02 06:16:09', '2025-04-02 06:02:07', '2025-04-02 06:16:09', NULL),
(39, 'deposit', 1, NULL, NULL, 1, 1000000, 'TRX-1743575037-8753931', '{\"amount\": 1000000, \"status\": \"UNPAID\", \"pay_url\": null, \"pay_code\": \"262977011476412\", \"reference\": \"DEV-T38382217866E4H7L\", \"total_fee\": 4250, \"return_url\": null, \"order_items\": [{\"sku\": \"KODE\", \"name\": \"Produuct\", \"price\": 1000000, \"quantity\": 1, \"subtotal\": 1000000, \"image_url\": null, \"product_url\": null}], \"callback_url\": null, \"checkout_url\": \"https://tripay.co.id/checkout/DEV-T38382217866E4H7L\", \"expired_time\": 1743578637, \"fee_customer\": 0, \"fee_merchant\": 4250, \"instructions\": [{\"steps\": [\"Login ke internet banking Bank BNI Anda\", \"Pilih menu <b>Transaksi</b> lalu klik menu <b>Virtual Account Billing</b>\", \"Masukkan Nomor VA (<b>262977011476412</b>) lalu pilih <b>Rekening Debit</b>\", \"Detail transaksi akan ditampilkan, pastikan data sudah sesuai\", \"Masukkan respon key BNI appli 2\", \"Transaksi sukses, simpan bukti transaksi Anda\"], \"title\": \"Internet Banking\"}, {\"steps\": [\"Masukkan kartu Anda\", \"Pilih Bahasa\", \"Masukkan PIN ATM Anda\", \"Kemudian, pilih <b>Menu Lainnya</b>\", \"Pilih <b>Transfer</b> dan pilih jenis rekening yang akan digunakan (Contoh: Dari rekening Tabungan)\", \"Pilih <b>Virtual Account Billing</b>. Masukkan Nomor VA (<b>262977011476412</b>)\", \"Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi\", \"Konfirmasi, apabila telah selesai, lanjutkan transaksi\", \"Transaksi Anda telah selesai\"], \"title\": \"ATM BNI\"}, {\"steps\": [\"Akses BNI Mobile Banking dari handphone kemudian masukkan <b>User ID dan Password</b>\", \"Pilih menu <b>Transfer</b>\", \"Pilih menu <b>Virtual Account Billing</b> kemudian pilih rekening debet\", \"Masukkan Nomor <b>Virtual Account</b>\", \"Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi\", \"Konfirmasi transaksi dan masukkan Password Transaksi\", \"Pembayaran Anda Telah Berhasil\"], \"title\": \"Mobile Banking BNI\"}], \"merchant_ref\": \"TRX-1743575037-8753931\", \"payment_name\": \"BNI Virtual Account\", \"customer_name\": \"Test User\", \"customer_email\": \"admin@gmail.com\", \"customer_phone\": \"081336920647\", \"payment_method\": \"BNIVA\", \"amount_received\": 995750, \"payment_selection_type\": \"static\"}', NULL, '081336920647', 2, 'success', 'success', '2025-04-02 06:24:38', '2025-04-02 06:24:01', '2025-04-02 06:24:38', NULL),
(41, 'deposit', 1, NULL, NULL, 1, 1000000, 'TRX-1743585491-7526338', '{\"amount\": 1000000, \"status\": \"UNPAID\", \"pay_url\": null, \"pay_code\": \"691988317197705\", \"reference\": \"DEV-T38382217905DTCKA\", \"total_fee\": 4250, \"return_url\": null, \"order_items\": [{\"sku\": \"KODE\", \"name\": \"Produuct\", \"price\": 1000000, \"quantity\": 1, \"subtotal\": 1000000, \"image_url\": null, \"product_url\": null}], \"callback_url\": null, \"checkout_url\": \"https://tripay.co.id/checkout/DEV-T38382217905DTCKA\", \"expired_time\": 1743589154, \"fee_customer\": 0, \"fee_merchant\": 4250, \"instructions\": [{\"steps\": [\"Masuk ke Internet Banking BSI Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih nomor rekening Anda\", \"Pilih <b>Jenis Pembayaran > Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>691988317197705</b>)\", \"Klik tombol <b>Verifikasi</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Masukkan TAN & PIN Anda\", \"Tekan tombol <b>Submit</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"Internet Banking\"}, {\"steps\": [\"Masuk ke aplikasi BSI Mobile Anda\", \"Pilih menu <b>Bayar</b>\", \"Pilih menu <b>Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>691988317197705</b>)\", \"Klik <b>Selanjutnya</b>\", \"Masukkan PIN Anda\", \"Klik <b>Selanjutnya</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Klik <b>Selanjutnya</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"BSI Mobile\"}, {\"steps\": [\"Datang ke ATM BSI\", \"Masukkan kartu dan PIN kartu Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih <b>Institusi</b>\", \"Masukkan kode institusi 1062 + Nomor Virtual Account Anda. Contoh: <b>1062691988317197705</b>\", \"Tekan tombol <b>Benar</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Tekan tombol <b>BENAR/YA</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"ATM BSI\"}], \"merchant_ref\": \"TRX-1743585491-7526338\", \"payment_name\": \"BSI Virtual Account\", \"customer_name\": \"Test User\", \"customer_email\": \"admin@gmail.com\", \"customer_phone\": \"081336920647\", \"payment_method\": \"BSIVA\", \"amount_received\": 995750, \"payment_selection_type\": \"static\"}', NULL, '081336920647', 7, 'success', 'success', '2025-04-02 09:19:19', '2025-04-02 09:18:12', '2025-04-02 09:19:19', NULL),
(42, 'deposit', 1, NULL, NULL, 1, 1000000, 'TRX-1743588183-6550861', '{\"amount\": 1000000, \"status\": \"UNPAID\", \"pay_url\": null, \"pay_code\": \"586117744851903\", \"reference\": \"DEV-T38382217907WHZXT\", \"total_fee\": 4250, \"return_url\": null, \"order_items\": [{\"sku\": \"KODE\", \"name\": \"Produuct\", \"price\": 1000000, \"quantity\": 1, \"subtotal\": 1000000, \"image_url\": null, \"product_url\": null}], \"callback_url\": null, \"checkout_url\": \"https://tripay.co.id/checkout/DEV-T38382217907WHZXT\", \"expired_time\": 1743591847, \"fee_customer\": 0, \"fee_merchant\": 4250, \"instructions\": [{\"steps\": [\"Masuk ke Internet Banking BSI Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih nomor rekening Anda\", \"Pilih <b>Jenis Pembayaran > Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>586117744851903</b>)\", \"Klik tombol <b>Verifikasi</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Masukkan TAN & PIN Anda\", \"Tekan tombol <b>Submit</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"Internet Banking\"}, {\"steps\": [\"Masuk ke aplikasi BSI Mobile Anda\", \"Pilih menu <b>Bayar</b>\", \"Pilih menu <b>Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>586117744851903</b>)\", \"Klik <b>Selanjutnya</b>\", \"Masukkan PIN Anda\", \"Klik <b>Selanjutnya</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Klik <b>Selanjutnya</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"BSI Mobile\"}, {\"steps\": [\"Datang ke ATM BSI\", \"Masukkan kartu dan PIN kartu Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih <b>Institusi</b>\", \"Masukkan kode institusi 1062 + Nomor Virtual Account Anda. Contoh: <b>1062586117744851903</b>\", \"Tekan tombol <b>Benar</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Tekan tombol <b>BENAR/YA</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"ATM BSI\"}], \"merchant_ref\": \"TRX-1743588183-6550861\", \"payment_name\": \"BSI Virtual Account\", \"customer_name\": \"Test User\", \"customer_email\": \"admin@gmail.com\", \"customer_phone\": \"081336920647\", \"payment_method\": \"BSIVA\", \"amount_received\": 995750, \"payment_selection_type\": \"static\"}', NULL, '081336920647', 7, 'success', 'success', '2025-04-02 10:10:42', '2025-04-02 10:03:06', '2025-04-02 10:10:42', NULL),
(43, 'deposit', 1, NULL, NULL, 1, 1000000, 'TRX-1743589111-8331364', '{\"amount\": 1000000, \"status\": \"UNPAID\", \"pay_url\": null, \"pay_code\": \"588501301632722\", \"reference\": \"DEV-T38382217916UUS8Z\", \"total_fee\": 4250, \"return_url\": null, \"order_items\": [{\"sku\": \"KODE\", \"name\": \"Produuct\", \"price\": 1000000, \"quantity\": 1, \"subtotal\": 1000000, \"image_url\": null, \"product_url\": null}], \"callback_url\": null, \"checkout_url\": \"https://tripay.co.id/checkout/DEV-T38382217916UUS8Z\", \"expired_time\": 1743592774, \"fee_customer\": 0, \"fee_merchant\": 4250, \"instructions\": [{\"steps\": [\"Masuk ke Internet Banking BSI Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih nomor rekening Anda\", \"Pilih <b>Jenis Pembayaran > Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>588501301632722</b>)\", \"Klik tombol <b>Verifikasi</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Masukkan TAN & PIN Anda\", \"Tekan tombol <b>Submit</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"Internet Banking\"}, {\"steps\": [\"Masuk ke aplikasi BSI Mobile Anda\", \"Pilih menu <b>Bayar</b>\", \"Pilih menu <b>Institusi</b>\", \"Pada opsi Nama Institusi, pilih <b>1062 LINKQU</b>\", \"Masukkan kode bayar (<b>588501301632722</b>)\", \"Klik <b>Selanjutnya</b>\", \"Masukkan PIN Anda\", \"Klik <b>Selanjutnya</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Klik <b>Selanjutnya</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"BSI Mobile\"}, {\"steps\": [\"Datang ke ATM BSI\", \"Masukkan kartu dan PIN kartu Anda\", \"Pilih menu <b>Pembayaran</b>\", \"Pilih <b>Institusi</b>\", \"Masukkan kode institusi 1062 + Nomor Virtual Account Anda. Contoh: <b>1062588501301632722</b>\", \"Tekan tombol <b>Benar</b>\", \"Akan ditampikan detail transaksi, pastikan sudah sesuai\", \"Tekan tombol <b>BENAR/YA</b>\", \"Transaksi selesai, simpan bukti pembayaran Anda\"], \"title\": \"ATM BSI\"}], \"merchant_ref\": \"TRX-1743589111-8331364\", \"payment_name\": \"BSI Virtual Account\", \"customer_name\": \"Test User\", \"customer_email\": \"admin@gmail.com\", \"customer_phone\": \"081336920647\", \"payment_method\": \"BSIVA\", \"amount_received\": 995750, \"payment_selection_type\": \"static\"}', NULL, '081336920647', 7, 'failed', 'expired', NULL, '2025-04-02 10:18:33', '2025-04-02 10:21:08', NULL),
(48, 'deposit', 1, NULL, NULL, 1, 100000, 'TRX-1743870056-6562945', '{\"amount\": 100000, \"status\": \"UNPAID\", \"pay_url\": \"https://tripay.co.id/checkout/DEV-T38382218417IDCET\", \"pay_code\": null, \"reference\": \"DEV-T38382218417IDCET\", \"total_fee\": 3000, \"return_url\": null, \"order_items\": [{\"sku\": \"KODE\", \"name\": \"Produuct\", \"price\": 100000, \"quantity\": 1, \"subtotal\": 100000, \"image_url\": null, \"product_url\": null}], \"callback_url\": null, \"checkout_url\": \"https://tripay.co.id/checkout/DEV-T38382218417IDCET\", \"expired_time\": 1743873656, \"fee_customer\": 0, \"fee_merchant\": 3000, \"instructions\": [{\"steps\": [\"Klik tombol Lanjutkan Pembayaran\", \"Anda akan dipindah ke Halaman Pembayaran DANA \", \"Pastikan saldo DANA anda cukup\", \"Masukkan nomor handpone yang terdaftar pada akun DANA\", \"Anda akan diminta untuk memasukkan PIN DANA Anda\", \"Kemudian anda akan diminta untuk memasukkan kode OTP yang dikirim ke nomor DANA\", \"Kemudian akan muncul detail tansaksi pastikan sudah sesuai dengan transaksi yang ingin anda bayar\", \"Klik tombol <b>PAY</b>\", \"Transaksi selesai. Simpan bukti pembayaran Anda\"], \"title\": \"Pembayaran via DANA\"}], \"merchant_ref\": \"TRX-1743870056-6562945\", \"payment_name\": \"DANA\", \"customer_name\": \"Test User update\", \"customer_email\": \"admin@gmail.com\", \"customer_phone\": \"081336920647\", \"payment_method\": \"DANA\", \"amount_received\": 97000, \"payment_selection_type\": \"static\"}', NULL, '081336920647', 14, 'pending', 'pending', NULL, '2025-04-05 16:20:57', '2025-04-05 16:20:57', NULL),
(94, 'purchase', NULL, 290, 'Vggg', 1, 18444, 'TRX-1746816550-5857934', '{\"reference\":\"DEV-T38382230677GUQYT\",\"merchant_ref\":\"TRX-1746816550-5857934\",\"payment_selection_type\":\"static\",\"payment_method\":\"MANDIRIVA\",\"payment_name\":\"Mandiri Virtual Account\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"081336920647\",\"callback_url\":null,\"return_url\":null,\"amount\":18444,\"fee_merchant\":4250,\"fee_customer\":0,\"total_fee\":4250,\"amount_received\":14194,\"pay_code\":\"564391849877409\",\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382230677GUQYT\",\"status\":\"UNPAID\",\"expired_time\":1746820216,\"order_items\":[{\"sku\":\"NRTS10\",\"name\":\"Naruto Shippuden 10+1 Gold\",\"price\":18444,\"quantity\":1,\"subtotal\":18444,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Internet Banking Livin Kuning\",\"steps\":[\"Login ke internet banking Anda\",\"Pilih menu <b>Bayar<\\/b> lalu klik menu <b>E-Commerce<\\/b>\",\"Masukkan Kode <b>Plink Pay (89039)<\\/b>\",\"Masukkan Nomor VA (<b>564391849877409<\\/b>)\",\"Masukkan Nominal (<b>18444<\\/b>)\",\"Detail transaksi akan ditampilkan, pastikan data sudah sesuai\",\"Klik tombol <b>Konfirmasi<\\/b>\",\"Periksa aplikasi Mandiri Online di ponsel Anda untuk menyelesaikan persetujuan transaksi\",\"Transaksi sukses, simpan bukti transaksi Anda\"]},{\"title\":\"ATM Mandiri\",\"steps\":[\"Masukkan kartu ATM & isi PIN ATM Anda\",\"Pilih menu <b>Bayar\\/Beli<\\/b> lalu pilih menu <b>Lainnya<\\/b>\",\"Pilih lagi menu <b>Lainnya<\\/b>\",\"Pilih menu <b>Multi Payment<\\/b>\",\"Masukkan kode <b>Plink Pay (89039)<\\/b> lalu tekan <b>Benar<\\/b>\",\"Masukkan Nomor VA (<b>564391849877409<\\/b>)\",\"Detail transaksi akan ditampilkan, pastikan data sudah sesuai\",\"Tekan <b>1<\\/b> lalu tekan <b>YA<\\/b>\",\"Transaksi sukses, simpan bukti transaksi Anda\"]},{\"title\":\"Mobile Banking\",\"steps\":[\"Masuk ke New Livin by Mandiri\",\"Pilih menu <b>Bayar\\/Beli<\\/b> \",\"Cari (89039) atau cari (Plink Pay) sebagai Penyedia Jasa\",\"Masukkan Nomor Virtual Account, (contoh: 146XXXXXXX)\",\"Masukkan jumlah transfer sesuai dengan tagihan kamu. Jumlah yang berbeda tidak dapat diproses\",\"Layar menampilkan Kode Bayar dan Data Pembayaran , pastikan data sudah sesuai\",\"Jika datanya benar, Klik <b>Lanjutkan<\\/b>\",\"Masukkan PIN New Livin, klik <b>OK<\\/b>\",\"Pembayaran selesai, simpan bukti transaksi Anda\"]}]}', 'emailpelanggan@domain.com', '081336920647', 4, 'pending', 'pending', NULL, '2025-05-09 18:49:17', '2025-05-09 18:49:17', NULL),
(95, 'purchase', NULL, 254, 'Ggggghhh', 1, 4515, 'TRX-1746883452-9435396', '{\"reference\":\"DEV-T383822308584VDKS\",\"merchant_ref\":\"TRX-1746883452-9435396\",\"payment_selection_type\":\"static\",\"payment_method\":\"DANA\",\"payment_name\":\"DANA\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"081336920647\",\"callback_url\":null,\"return_url\":null,\"amount\":4515,\"fee_merchant\":1000,\"fee_customer\":0,\"total_fee\":1000,\"amount_received\":3515,\"pay_code\":null,\"pay_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T383822308584VDKS\",\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T383822308584VDKS\",\"status\":\"UNPAID\",\"expired_time\":1746887052,\"order_items\":[{\"sku\":\"1BCC\",\"name\":\"1 Big Cat Coins\",\"price\":4515,\"quantity\":1,\"subtotal\":4515,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via DANA\",\"steps\":[\"Klik tombol Lanjutkan Pembayaran\",\"Anda akan dipindah ke Halaman Pembayaran DANA \",\"Pastikan saldo DANA anda cukup\",\"Masukkan nomor handpone yang terdaftar pada akun DANA\",\"Anda akan diminta untuk memasukkan PIN DANA Anda\",\"Kemudian anda akan diminta untuk memasukkan kode OTP yang dikirim ke nomor DANA\",\"Kemudian akan muncul detail tansaksi pastikan sudah sesuai dengan transaksi yang ingin anda bayar\",\"Klik tombol <b>PAY<\\/b>\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}]}', 'emailpelanggan@domain.com', '081336920647', 14, 'pending', 'pending', NULL, '2025-05-10 13:24:13', '2025-05-10 13:24:13', NULL),
(96, 'purchase', NULL, 273, '5747464679', 1, 10363, 'TRX-1746940436-1973605', '{\"reference\":\"DEV-T38382231042AT4NZ\",\"merchant_ref\":\"TRX-1746940436-1973605\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS\",\"payment_name\":\"QRIS by ShopeePay\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"08586932478\",\"callback_url\":null,\"return_url\":null,\"amount\":10363,\"fee_merchant\":823,\"fee_customer\":0,\"total_fee\":823,\"amount_received\":9540,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382231042AT4NZ\",\"status\":\"UNPAID\",\"expired_time\":1746943976,\"order_items\":[{\"sku\":\"GRN33\",\"name\":\"Garena 33 Shell\",\"price\":10363,\"quantity\":1,\"subtotal\":10363,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS (ShopeePay)\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T38382231042AT4NZ\"}', 'emailpelanggan@domain.com', '08586932478', 12, 'pending', 'pending', NULL, '2025-05-11 05:13:56', '2025-05-11 05:13:56', NULL),
(97, 'purchase', NULL, 270, '727378383', 1, 14411, 'TRX-1748514514-5113209', '{\"reference\":\"DEV-T383822396084LNEQ\",\"merchant_ref\":\"TRX-1748514514-5113209\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS2\",\"payment_name\":\"QRIS\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":null,\"callback_url\":null,\"return_url\":null,\"amount\":14411,\"fee_merchant\":851,\"fee_customer\":0,\"total_fee\":851,\"amount_received\":13560,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T383822396084LNEQ\",\"status\":\"UNPAID\",\"expired_time\":1748518114,\"order_items\":[{\"sku\":\"GI60\",\"name\":\"Genshin Impact 60 Genesis Crystals\",\"price\":14411,\"quantity\":1,\"subtotal\":14411,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T383822396084LNEQ\"}', 'emailpelanggan@domain.com', '6282828626262', 13, 'pending', 'pending', NULL, '2025-05-29 10:28:34', '2025-05-29 10:28:34', NULL),
(98, 'purchase', NULL, 273, '12345678', 1, 10363, 'TRX-1749092513-2897555', '{\"reference\":\"DEV-T38382241999PA4LQ\",\"merchant_ref\":\"TRX-1749092513-2897555\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS2\",\"payment_name\":\"QRIS\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"085701479245\",\"callback_url\":null,\"return_url\":null,\"amount\":10363,\"fee_merchant\":823,\"fee_customer\":0,\"total_fee\":823,\"amount_received\":9540,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382241999PA4LQ\",\"status\":\"UNPAID\",\"expired_time\":1749096113,\"order_items\":[{\"sku\":\"GRN33\",\"name\":\"Garena 33 Shell\",\"price\":10363,\"quantity\":1,\"subtotal\":10363,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T38382241999PA4LQ\"}', 'emailpelanggan@domain.com', '085701479245', 13, 'pending', 'pending', NULL, '2025-06-05 03:01:53', '2025-06-05 03:01:53', NULL),
(99, 'purchase', NULL, 273, '7282828', 1, 10363, 'TRX-1749127804-8297140', '{\"reference\":\"DEV-T38382242121VGUAG\",\"merchant_ref\":\"TRX-1749127804-8297140\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS2\",\"payment_name\":\"QRIS\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"083879152564\",\"callback_url\":null,\"return_url\":null,\"amount\":10363,\"fee_merchant\":823,\"fee_customer\":0,\"total_fee\":823,\"amount_received\":9540,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382242121VGUAG\",\"status\":\"UNPAID\",\"expired_time\":1749131404,\"order_items\":[{\"sku\":\"GRN33\",\"name\":\"Garena 33 Shell\",\"price\":10363,\"quantity\":1,\"subtotal\":10363,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T38382242121VGUAG\"}', 'emailpelanggan@domain.com', '083879152564', 13, 'pending', 'pending', NULL, '2025-06-05 12:50:06', '2025-06-05 12:50:06', NULL),
(100, 'purchase', NULL, 255, '08123456789', 1, 12112, 'TRX-1749317019-7614511', '{\"reference\":\"DEV-T38382243031GZ4EJ\",\"merchant_ref\":\"TRX-1749317019-7614511\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS2\",\"payment_name\":\"QRIS\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"08123456799\",\"callback_url\":null,\"return_url\":null,\"amount\":12113,\"fee_merchant\":835,\"fee_customer\":0,\"total_fee\":835,\"amount_received\":11278,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382243031GZ4EJ\",\"status\":\"UNPAID\",\"expired_time\":1749320619,\"order_items\":[{\"sku\":\"ax10\",\"name\":\"Axis 10.000\",\"price\":12113,\"quantity\":1,\"subtotal\":12113,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T38382243031GZ4EJ\"}', 'emailpelanggan@domain.com', '08123456799', 13, 'pending', 'pending', NULL, '2025-06-07 17:23:40', '2025-06-07 17:23:40', NULL),
(101, 'purchase', NULL, 273, '435656252 3929', 1, 10363, 'TRX-1751718426-4310582', '{\"reference\":\"DEV-T38382254297NZOGJ\",\"merchant_ref\":\"TRX-1751718426-4310582\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS2\",\"payment_name\":\"QRIS\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"08882105159\",\"callback_url\":null,\"return_url\":null,\"amount\":10363,\"fee_merchant\":823,\"fee_customer\":0,\"total_fee\":823,\"amount_received\":9540,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382254297NZOGJ\",\"status\":\"UNPAID\",\"expired_time\":1751722026,\"order_items\":[{\"sku\":\"GRN33\",\"name\":\"Garena 33 Shell\",\"price\":10363,\"quantity\":1,\"subtotal\":10363,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T38382254297NZOGJ\"}', 'emailpelanggan@domain.com', '08882105159', 13, 'pending', 'pending', NULL, '2025-07-05 12:27:06', '2025-07-05 12:27:06', NULL),
(102, 'purchase', NULL, 309, '081392269113', 1, 53471, 'TRX-1752373386-4053546', '{\"reference\":\"DEV-T38382257788ZHLMQ\",\"merchant_ref\":\"TRX-1752373386-4053546\",\"payment_selection_type\":\"static\",\"payment_method\":\"DANA\",\"payment_name\":\"DANA\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"081392269113\",\"callback_url\":null,\"return_url\":null,\"amount\":53472,\"fee_merchant\":1605,\"fee_customer\":0,\"total_fee\":1605,\"amount_received\":51867,\"pay_code\":null,\"pay_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382257788ZHLMQ\",\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382257788ZHLMQ\",\"status\":\"UNPAID\",\"expired_time\":1752376927,\"order_items\":[{\"sku\":\"shopee50\",\"name\":\"SHOPEE PAY 50.000\",\"price\":53472,\"quantity\":1,\"subtotal\":53472,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via DANA\",\"steps\":[\"Klik tombol Lanjutkan Pembayaran\",\"Anda akan dipindah ke Halaman Pembayaran DANA \",\"Pastikan saldo DANA anda cukup\",\"Masukkan nomor handpone yang terdaftar pada akun DANA\",\"Anda akan diminta untuk memasukkan PIN DANA Anda\",\"Kemudian anda akan diminta untuk memasukkan kode OTP yang dikirim ke nomor DANA\",\"Kemudian akan muncul detail tansaksi pastikan sudah sesuai dengan transaksi yang ingin anda bayar\",\"Klik tombol <b>PAY<\\/b>\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}]}', 'emailpelanggan@domain.com', '081392269113', 14, 'pending', 'pending', NULL, '2025-07-13 02:23:07', '2025-07-13 02:23:07', NULL),
(103, 'purchase', NULL, 291, '085809933288', 1, 106585, 'TRX-1752776832-1769337', '{\"reference\":\"DEV-T38382259685XZ2XH\",\"merchant_ref\":\"TRX-1752776832-1769337\",\"payment_selection_type\":\"static\",\"payment_method\":\"QRIS2\",\"payment_name\":\"QRIS\",\"customer_name\":\"Guest\",\"customer_email\":\"emailpelanggan@domain.com\",\"customer_phone\":\"085809933288\",\"callback_url\":null,\"return_url\":null,\"amount\":106585,\"fee_merchant\":1497,\"fee_customer\":0,\"total_fee\":1497,\"amount_received\":105088,\"pay_code\":null,\"pay_url\":null,\"checkout_url\":\"https:\\/\\/tripay.co.id\\/checkout\\/DEV-T38382259685XZ2XH\",\"status\":\"UNPAID\",\"expired_time\":1752780432,\"order_items\":[{\"sku\":\"ovo100\",\"name\":\"OVO 100.000\",\"price\":106585,\"quantity\":1,\"subtotal\":106585,\"product_url\":null,\"image_url\":null}],\"instructions\":[{\"title\":\"Pembayaran via QRIS\",\"steps\":[\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Pindai\\/Scan QR Code yang tersedia\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]},{\"title\":\"Pembayaran via QRIS (Mobile)\",\"steps\":[\"Download QR Code pada invoice\",\"Masuk ke aplikasi dompet digital Anda yang telah mendukung QRIS\",\"Upload QR Code yang telah di download tadi\",\"Akan muncul detail transaksi. Pastikan data transaksi sudah sesuai\",\"Selesaikan proses pembayaran Anda\",\"Transaksi selesai. Simpan bukti pembayaran Anda\"]}],\"qr_string\":\"SANDBOX MODE\",\"qr_url\":\"https:\\/\\/tripay.co.id\\/qr\\/DEV-T38382259685XZ2XH\"}', 'emailpelanggan@domain.com', '085809933288', 13, 'pending', 'pending', NULL, '2025-07-17 18:27:12', '2025-07-17 18:27:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `slug`, `created_at`, `updated_at`, `provider`) VALUES
(1, 'Umum', 'umum', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(3, 'Aigo SS', 'aigo-ss', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(5, 'Flash', 'flash', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(6, 'Xtra Combo Flex', 'xtra-combo-flex', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(7, 'Customer', 'customer', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(8, 'Happy', 'happy', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(10, 'Freedom Internet', 'freedom-internet', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(12, 'Membership', 'membership', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(14, 'Unlimited', 'unlimited', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(16, 'Jawa Barat', 'jawa-barat', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL),
(17, 'Yellow', 'yellow', '2025-03-21 00:53:23', '2025-03-21 00:53:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `saldo` bigint(20) NOT NULL DEFAULT 0,
  `points` bigint(20) NOT NULL DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `avatar_url` varchar(255) DEFAULT NULL,
  `level` enum('basic','premium') NOT NULL DEFAULT 'basic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `saldo`, `points`, `avatar`, `role_id`, `custom_fields`, `avatar_url`, `level`) VALUES
(1, 'Test User update', 'admin@gmail.com', '2025-03-21 00:52:52', '$2y$12$bwYPU.EzcMZ6/wLJ9gr1EucisLp4KIbLJHhAXt6DQE5mgUcq9BtHC', 'iE9nSf4OkTIwzhsgRLkhFe9lIp9b8WllxZcbBQTiGO3TaRLUf6HtxPDr9NCV', '2025-03-21 00:52:53', '2025-06-14 02:16:49', '081336920647', 38575, 0, 'users/01JXP3KC3PKGTQPFGEPQ3B4AQP.php', 1, NULL, '', 'premium'),
(5, 'Angga Primadilaga', 'anggaprimadilaga@gmail.com', NULL, '$2y$12$WL8JmAxcbInTiHKos7bW1erRvtSYw0pzVA9OcLb7hb60dKeo3hBzK', NULL, '2025-05-05 02:52:02', '2025-05-05 02:52:02', '085156946303', 0, 0, NULL, 2, NULL, NULL, 'basic');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `user_id`, `name`, `keterangan`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(215, NULL, 'AUTH GUEST', 'User Gagal Login dengan email admin@gmail.com', '182.1.105.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-05-06 16:33:48', '2025-05-06 16:33:48'),
(216, 1, 'Test User update', 'Berhasil Login', '182.1.105.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-05-06 16:33:55', '2025-05-06 16:33:55'),
(217, 1, 'Test User update', 'Berhasil Login', '117.102.75.213', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.6261.95 Safari/537.36', '2025-05-08 03:32:43', '2025-05-08 03:32:43'),
(218, 1, 'Test User update', 'Berhasil Login', '117.102.75.213', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-05-08 13:30:58', '2025-05-08 13:30:58'),
(219, 1, 'Test User update', 'Berhasil Synkronisasi Product DigiFlazz', '117.102.75.213', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-05-08 13:33:41', '2025-05-08 13:33:41'),
(220, 1, 'Test User update', 'Berhasil Login', '182.1.122.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-05-08 17:59:22', '2025-05-08 17:59:22'),
(221, 1, 'Test User update', 'Berhasil Sinkronisasi Produk DigiFlazz', '182.1.122.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-05-08 17:59:44', '2025-05-08 17:59:44'),
(222, 1, 'Test User update', 'Berhasil Sinkronisasi Produk DigiFlazz', '182.1.122.102', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-05-08 18:00:53', '2025-05-08 18:00:53'),
(223, 1, 'Test User update', 'Berhasil Login', '117.102.75.213', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.6261.95 Safari/537.36', '2025-05-10 04:01:17', '2025-05-10 04:01:17'),
(224, 1, 'Test User update', 'Berhasil Login', '36.69.171.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-05-10 06:53:51', '2025-05-10 06:53:51'),
(225, 1, 'Test User update', 'Berhasil Login', '114.122.6.198', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-16 17:32:47', '2025-05-16 17:32:47'),
(226, 1, 'Test User update', 'Berhasil Login', '114.125.70.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-17 17:07:54', '2025-05-17 17:07:54'),
(227, 1, 'Test User update', 'Berhasil Login', '114.125.70.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-17 17:08:51', '2025-05-17 17:08:51'),
(228, NULL, 'AUTH GUEST', 'User Gagal Login dengan email admin@gmail.com', '114.79.56.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-05-18 14:56:19', '2025-05-18 14:56:19'),
(229, 1, 'Test User update', 'Berhasil Login', '114.79.56.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-18 14:57:32', '2025-05-18 14:57:32'),
(230, 1, 'Test User update', 'Berhasil Login', '36.69.161.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-21 08:37:03', '2025-05-21 08:37:03'),
(234, 1, 'Test User update', 'Berhasil Login', '114.125.102.74', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-05-22 06:37:40', '2025-05-22 06:37:40'),
(235, 1, 'Test User update', 'Berhasil Login', '114.125.28.7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-05-22 06:37:56', '2025-05-22 06:37:56'),
(236, 1, 'Test User update', 'Berhasil Login', '110.137.79.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-22 07:41:36', '2025-05-22 07:41:36'),
(237, NULL, 'AUTH GUEST', 'User Gagal Login dengan email admin@admin.com', '110.137.79.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-22 11:33:43', '2025-05-22 11:33:43'),
(238, 1, 'Test User update', 'Berhasil Login', '110.137.79.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-22 11:33:49', '2025-05-22 11:33:49'),
(239, 1, 'Test User update', 'Berhasil Login', '114.79.57.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '2025-06-14 01:47:04', '2025-06-14 01:47:04'),
(240, 1, 'Test User update', 'Berhasil Login', '114.79.56.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-14 02:10:02', '2025-06-14 02:10:02'),
(241, 1, 'Test User update', 'Berhasil Login', '36.73.33.235', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-16 12:37:28', '2025-06-16 12:37:28'),
(242, 1, 'Test User update', 'Berhasil Login', '36.73.33.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-16 12:38:29', '2025-06-16 12:38:29'),
(243, 1, 'Test User update', 'Berhasil Sinkronisasi Produk DigiFlazz', '36.73.33.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-16 12:43:24', '2025-06-16 12:43:24'),
(244, 1, 'Test User update', 'Berhasil Login', '125.167.59.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-23 17:44:10', '2025-06-23 17:44:10'),
(245, 1, 'Test User update', 'Berhasil Login', '36.85.222.183', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBAV/514.0.0.40.107;FBBV/756655633;FBDV/iPhone16,1;FBMD/iPhone;FBSN/iOS;FBSV/18.5;FBSS/3;FBCR/;FBID/phone;FBLC/en_US;FBOP/80]', '2025-07-05 12:40:01', '2025-07-05 12:40:01'),
(246, 1, 'Test User update', 'Berhasil Login', '114.125.100.117', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36', '2025-07-08 08:25:17', '2025-07-08 08:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_templates`
--

CREATE TABLE `whatsapp_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parameters`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `whatsapp_templates`
--

INSERT INTO `whatsapp_templates` (`id`, `name`, `message`, `created_at`, `updated_at`, `role_id`, `parameters`) VALUES
(10, 'Template Untuk Admin Ketika User berhasil melakukan pembayaran', '📌 Pembayaran Berhasil!\n\nHalo Admin, ada customer yang baru saja menyelesaikan pembayaran 🎉\n\n🔹 Nama: *[NAME_CUSTOMER]*\n🔹 Order ID: *[NO_INVOICE]*\n🔹 Total Bayar: *[TOTAL]*\n🔹 Metode: *[PAYMENT_METHODE]*\n🔹 Waktu: *[DATE]*\n\nCek dashboard untuk verifikasi lebih lanjut ya. Semangat! 🚀', '2025-04-01 16:26:01', '2025-04-02 03:16:52', 1, '{\"total\": \"[TOTAL]\", \"no_invoice\": \"[NO_INVOICE]\", \"name_customer\": \"[NAME]\", \"methode_pembayaran\": \"[PAYMENT_METHOD]\", \"tanggal_pembayaran\": \"[DATE]\"}'),
(11, 'Template Pesan Verifikasi OTP*', 'Subject: 🚀 Verifikasi OTP Anda\n\n📌 Kode OTP Anda: [OTP]\n\nJangan bagikan kode ini kepada siapa pun demi keamanan akun Anda.\nJika Anda tidak meminta kode ini, abaikan pesan ini.\nTerima kasih,', '2025-04-01 16:26:01', '2025-04-01 16:42:37', 2, '{\"kode_otp\": \"[OTP]\"}'),
(12, 'Template Pesan Verifikasi OTP Perubahan Password', '🔑 Verifikasi OTP untuk Perubahan Password\n📌 Kode OTP Anda: [OTP]\nKode ini digunakan untuk mengonfirmasi perubahan password Anda. Berlaku hingga [EXPIRATION_TIME].\n⚠ Jangan bagikan kode ini kepada siapa pun demi keamanan akun Anda.\nJika Anda tidak meminta perubahan password, segera hubungi tim dukungan kami.\nTerima kasih,', '2025-04-01 16:26:01', '2025-04-01 16:43:42', 2, '{\"kode_otp\": \"[OTP]\"}'),
(13, 'Template Pesan Pesanan Berhasil di Buat', '✅ Pesanan Anda Berhasil Dibuat!\n\nHalo *[NAME]*,\n\nPesanan Anda telah berhasil dibuat dengan detail berikut:\n\n📌 Detail Pesanan:\n🛍️ Produk: *[PRODUCT]*\n🧾 Nomor Invoice: *[NO_INVOICE]*\n💰 Total Pembayaran: *Rp. [TOTAL]*\n🔹 Methode Pembayaran : *[[PAYMENT_METHOD] ]*\n⏳ Batas Waktu Pembayaran: *[TANGGAL_EXPIRED]*\n\n⚠ Segera selesaikan pembayaran sebelum batas waktu berakhir untuk menghindari pembatalan pesanan.\n\nTerima kasih telah berbelanja di [COMPANY_NAME]! Jika ada pertanyaan, jangan ragu untuk menghubungi kami.', '2025-04-01 16:26:01', '2025-04-02 03:24:01', 2, '{\"total\": \"[TOTAL]\", \"product\": \"[PRODUCT]\", \"no_invoice\": \"[NO_INVOICE]\", \"tanggal_expired\": \"[TANGGAL_EXPIRED]\", \"methode_pembayaran\": \"[PAYMENT_METHOD]\"}'),
(14, 'Template Pesan Pesanan Berhasil di Bayar', '✅ Pembayaran Pesanan Anda Berhasil!\n\nHalo \n\nKami senang memberitahukan bahwa pembayaran untuk pesanan Anda dengan Nomor Invoice: [NO_INVOICE]  telah berhasil diterima.\n\nPesanan Anda sekarang sedang diproses dan akan segera dikirimkan.\n\n💡 Detail Pesanan:\n🧾 Nomor Invoice: [NO_INVOICE]\n💳 Status Pembayaran: Berhasil\n\nTerima kasih atas kepercayaan Anda berbelanja di   nama company  Jika ada pertanyaan lebih lanjut, silakan hubungi kami kapan saja.', '2025-04-01 16:26:01', '2025-04-01 16:48:12', 2, '{\"no_invoice\": \"[NO_INVOICE]\"}'),
(15, 'Template Pesan Pesanan Berhasil & Selesai', '✅ Pesanan Anda Telah Selesai!\n\nHalo ,\n\nKami senang memberitahukan bahwa pesanan Anda dengan Nomor Invoice: [NO_INVOICE] telah berhasil diproses dan selesai. Terima kasih telah berbelanja di ...\n\n💡 Detail Pesanan:\n🧾 Nomor Invoice: [NO_INVOICE]\n📦 Status Pesanan: Selesai\n\nPesanan Anda sekarang siap untuk pengiriman. Jika Anda membutuhkan bantuan lebih lanjut, atau ada pertanyaan mengenai pesanan Anda, jangan ragu untuk menghubungi kami.\n\nTerima kasih atas kepercayaan Anda berbelanja dengan kami!', '2025-04-01 16:26:01', '2025-04-01 16:49:01', 2, '{\"no_invoice\": \"[NO_INVOICE]\"}'),
(16, 'OTP Register', 'Kode OTP Anda untuk verifikasi akun adalah: *[OTP]*.  \nJangan bagikan kode ini kepada siapa pun.   \n\nTerima kasih telah mendaftar ! 🚀\n', '2025-04-02 02:48:21', '2025-04-02 02:51:07', 2, '{\"nomor_otp\": \"OTP\"}'),
(17, 'OTP Lupa Password', 'Kode OTP Anda untuk verifikasi akun adalah: *[OTP]*.  \nJangan bagikan kode ini kepada siapa pun.   \n\nTerima kasih  ! 🚀\n', '2025-04-02 02:48:21', '2025-04-02 02:51:42', 2, '{\"nomor_otp\": \"OTP\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_payment_method`
--
ALTER TABLE `brand_payment_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_payment_method_brand_id_foreign` (`brand_id`),
  ADD KEY `brand_payment_method_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `brand_products`
--
ALTER TABLE `brand_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_products_rules_brands_id_foreign` (`rules_brands_id`),
  ADD KEY `brand_products_category_id_foreign` (`category_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `field_inputs`
--
ALTER TABLE `field_inputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupons`
--
ALTER TABLE `kupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kupons_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_code_unique` (`code`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_type_product_id_foreign` (`type_product_id`),
  ADD KEY `products_brand_product_id_foreign` (`brand_product_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_group_id_foreign` (`group_id`);

--
-- Indexes for table `product_groups`
--
ALTER TABLE `product_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rules_brands`
--
ALTER TABLE `rules_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`),
  ADD KEY `transactions_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `transactions_kupon_id_foreign` (`kupon_id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `whatsapp_templates_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_payment_method`
--
ALTER TABLE `brand_payment_method`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `brand_products`
--
ALTER TABLE `brand_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=707;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `field_inputs`
--
ALTER TABLE `field_inputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `kupons`
--
ALTER TABLE `kupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `product_groups`
--
ALTER TABLE `product_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rules_brands`
--
ALTER TABLE `rules_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand_payment_method`
--
ALTER TABLE `brand_payment_method`
  ADD CONSTRAINT `brand_payment_method_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brand_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_payment_method_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brand_products`
--
ALTER TABLE `brand_products`
  ADD CONSTRAINT `brand_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_products_rules_brands_id_foreign` FOREIGN KEY (`rules_brands_id`) REFERENCES `rules_brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_product_id_foreign` FOREIGN KEY (`brand_product_id`) REFERENCES `brand_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `product_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_type_product_id_foreign` FOREIGN KEY (`type_product_id`) REFERENCES `type_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_kupon_id_foreign` FOREIGN KEY (`kupon_id`) REFERENCES `kupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `whatsapp_templates`
--
ALTER TABLE `whatsapp_templates`
  ADD CONSTRAINT `whatsapp_templates_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
