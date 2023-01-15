-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2022 at 09:56 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `url`, `created_at`, `updated_at`) VALUES
(11, 'public/banner-image/2022-05-22-09-46-05.jpeg', 'https://learnby.ir/', '2022-04-10 17:14:11', '2022-05-22 12:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(11, 'سیاسی', '2019-07-13 12:33:01', '2019-07-13 16:06:40'),
(13, 'خبری', '2019-07-13 12:33:12', '2020-08-03 01:31:47'),
(18, 'اقتصادی', '2022-03-13 17:28:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_persian_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` enum('unseen','seen','approved') COLLATE utf8_persian_ci NOT NULL DEFAULT 'unseen',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(20, 1, 'hello', 22, 'approved', '2020-08-11 01:49:46', '2022-04-12 19:18:38'),
(22, 1, 'test', 22, 'approved', '2020-10-04 23:56:16', '2022-04-12 19:18:41'),
(26, 4, 'ok', 21, 'seen', '2022-04-10 14:49:53', '2022-04-10 17:21:44'),
(28, 17, 'xdexed', 22, 'seen', '2022-05-14 17:25:01', '2022-05-14 19:55:11'),
(29, 17, 'برو بابا با این خبرت', 22, 'approved', '2022-05-27 17:22:59', '2022-05-27 17:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `url` varchar(300) COLLATE utf8_persian_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `parent_id`, `created_at`, `updated_at`) VALUES
(16, 'طراحی وب', 'https://toplearn.com/', NULL, '2022-04-10 17:28:51', '2022-05-27 11:37:39'),
(17, 'php', 'https://toplearn.com/', 16, '2022-04-10 17:29:11', '2022-04-10 17:29:29'),
(20, 'گرافیک', 'https://toplearn.com/', NULL, '2022-04-12 17:34:21', NULL),
(21, 'الکترونیک', 'https://toplearn.com/2', NULL, '2022-04-12 17:34:30', NULL),
(22, 'اقتصادی', 'https://toplearn.com/', NULL, '2022-04-12 17:34:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `summary` text COLLATE utf8_persian_ci NOT NULL,
  `body` text COLLATE utf8_persian_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `image` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `status` enum('disable','enable') COLLATE utf8_persian_ci NOT NULL DEFAULT 'disable',
  `selected` tinyint(5) NOT NULL DEFAULT 1 COMMENT '1 => select 2 => no select',
  `breaking_news` tinyint(5) NOT NULL DEFAULT 1 COMMENT '1 => no breaking news 2 => breaking news',
  `published_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) VALUES
(15, 'نظام بانکی کشور نیاز به تغییر ندارد', '<p>به گفته ی رییس بانک مرکزی نظام بانکی ایران نیاز به تغییر ندارد</p>\r\n', '<p>به گفته ی رییس بانک مرکزی نظام بانکی ایران نیاز به تغییر ندارد</p>\r\n', 1000, 1, 13, 'public/post-image/2022-05-20-18-13-03.jpeg', 'enable', 1, 2, '2022-04-12 15:21:23', '2019-07-17 12:10:04', '2022-05-20 18:13:03'),
(21, 'واحدهای صندوق ', '<p>به گزارش خبرنگار اقتصادی خبرگزاری تسنیم، نخستین صندوق سرمایه&zwnj;گذاری قابل معامله دولتی تخحت عنوان &quot;دارا یکم&quot; که از سهام سه بانک و دو شرکت بیمه&zwnj;ای دولتی تشکیل شده است، پس از پذیره نویسی از جانب بانک&zwnj;ها و کارگزاری&zwnj;های بورس، از چهارم تیرماه جاری در بورس قابل معامله خواهد بود. به گفته علی صحرایی مدیرعامل شرکت بورس تهران، معاملات این صندوق مانند سایر صندوق&zwnj;های سرمایه&zwnj;گذاری موجود در بازار سهام آغاز می&zwnj;شود و با این اقدام ابزاری جدید به بازار سرمایه در حوزه بانک و بیمه به سبد محصولات مالی اضافه می&zwnj;شود. این گزارش می&zwnj;افزاید: وزیر اقتصاد به تازگی با اشاره به عرضه واحدهای صندوق ETF در اردیبهشت ماه گفت: این عرضه نخستین تجربه ما در واگذاری این صندوق&zwnj;ها بود که از طریق آن بزرگ&zwnj;ترین صندوق ETF کشور شکل گرفت. فرهاد دژپسند همچنین با بیان این که ارزش واحدهای خریداری&zwnj;شده این صندوق تاکنون دو برابر شده است، گفت: حدود سه میلیون و 600 هزار نفر واحدها و یونیت&zwnj;های نخستین صندوق ETF را خریداری کردند. وی با بیان اینکه باقیمانده سهام دولتی عرضه خواهد شد، گفت: در حال برنامه&zwnj;ریزی هستیم تا دو ماه آینده دومین صندوق ای&zwnj;تی&zwnj;اف را نیز در بازار سرمایه عرضه کنیم.</p>\r\n', '<p>به گزارش خبرنگار اقتصادی خبرگزاری تسنیم، نخستین صندوق سرمایه&zwnj;گذاری قابل معامله دولتی تخحت عنوان &quot;دارا یکم&quot; که از سهام سه بانک و دو شرکت بیمه&zwnj;ای دولتی تشکیل شده است، پس از پذیره نویسی از جانب بانک&zwnj;ها و کارگزاری&zwnj;های بورس، از چهارم تیرماه جاری در بورس قابل معامله خواهد بود. به گفته علی صحرایی مدیرعامل شرکت بورس تهران، معاملات این صندوق مانند سایر صندوق&zwnj;های سرمایه&zwnj;گذاری موجود در بازار سهام آغاز می&zwnj;شود و با این اقدام ابزاری جدید به بازار سرمایه در حوزه بانک و بیمه به سبد محصولات مالی اضافه می&zwnj;شود. این گزارش می&zwnj;افزاید: وزیر اقتصاد به تازگی با اشاره به عرضه واحدهای صندوق ETF در اردیبهشت ماه گفت: این عرضه نخستین تجربه ما در واگذاری این صندوق&zwnj;ها بود که از طریق آن بزرگ&zwnj;ترین صندوق ETF کشور شکل گرفت. فرهاد دژپسند همچنین با بیان این که ارزش واحدهای خریداری&zwnj;شده این صندوق تاکنون دو برابر شده است، گفت: حدود سه میلیون و 600 هزار نفر واحدها و یونیت&zwnj;های نخستین صندوق ETF را خریداری کردند. وی با بیان اینکه باقیمانده سهام دولتی عرضه خواهد شد، گفت: در حال برنامه&zwnj;ریزی هستیم تا دو ماه آینده دومین صندوق ای&zwnj;تی&zwnj;اف را نیز در بازار سرمایه عرضه کنیم.</p>\r\n', 1, 1, 11, 'public/post-image/2022-05-20-18-12-55.jpeg', 'enable', 1, 1, '2022-04-12 15:21:29', '2020-06-19 22:37:10', '2022-05-22 12:09:18'),
(22, '222مهلت آزادسازی سهام عدالت کماکان ادامه دارد/ ابهامات کماکان پابرجا!', '<p>در حالی که دیشب (۵ شنبه) آخرین مهلت تعیین روش آزادسازی سهام عدالت توسط مشمولان بود، همچنان امکان مراجعه به سامانه سهام عدالت و انتخاب گزینه روش مستقیم وجود دارد.</p>\r\n', '<p>ه گزارش خبرنگار اقتصادی خبرگزاری تسنیم، امکان انتخاب روش مستقیم سهامداری از سوی مشمولان سهام عدالت در حالی از روز 10 اردیبهشت در حال انجام است که این مهلت در روز 8 خرداد به پایان رسید اما این مهلت تا روز 5شنبه، 29 خرداد تمدید شد. با این حال با وجود پایان یافتن این مهلت، همچنان امکان مراجعه به سامانه سهام عدالت و انتخاب گزینه روش مستقیم وجود دارد. بر این اساس دارندگان سهام عدالت برای انتخاب روش مستقیم آزادسازی سهام عدالت خود باید به سامانه سهام عدالت مراجعه و در این زمینه اقدام کنند. همچنین عدم مراجعه به سایت WWW.SAMANESE.ir به معنی انتخاب روش غیرمستقیم است. این گزارش می&zwnj;افزاید: تاکنون 20 میلیون نفر از دارندگان سهام عدالت روش مستقیم را برای مدیریت سهام خود انتخاب کرده&zwnj;اند و طبق آمار حدود یک میلیون نفر نیز تاکنون سهام عدالت را فروخته&zwnj;اند. گفتنی است در حالی انتخاب روش آزادسازی سهام عدالت ادامه دارد که کماکان ابهامات مربوط به مزایا و معایب هر یک از روش&zwnj;های مستقیم و غیرمستقیم از طریق متولیان امر بویژه سازمان خصوصی&zwnj;سازی مشخص و اطلاع&zwnj;رسانی نشده و سهامداران عدالت در میان این دو روش سردرگم و سرگردان هستند.</p>\r\n', 65, 1, 11, 'public/post-image/2022-05-20-18-09-26.jpeg', 'enable', 1, 1, '2022-04-12 15:21:36', '2020-06-19 22:37:55', '2022-05-22 12:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `permission` enum('user','admin') COLLATE utf8_persian_ci NOT NULL DEFAULT 'user',
  `verify_token` varchar(191) COLLATE utf8_persian_ci DEFAULT NULL,
  `is_active` tinyint(5) NOT NULL DEFAULT 0,
  `forgot_token` varchar(191) COLLATE utf8_persian_ci DEFAULT NULL,
  `forgot_token_expire` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permission`, `verify_token`, `is_active`, `forgot_token`, `forgot_token_expire`, `created_at`, `updated_at`) VALUES
(1, 'kamran', 'kamran@gmail.com', '$2y$10$nlZ5dMJ2sv9HrKU4NJslDe0ick10lGSBZNM2i14zKtDGGAEqAdXVS', 'admin', NULL, 1, NULL, NULL, '2019-06-06 01:28:40', '2019-10-27 21:59:41'),
(4, 'nima', 'nima@yahoo.com', '$2y$10$CrqnkHtp2dKlyHfYRniXG.B8fWtrHtfavUyGVqc6bdiiF5lgwzi96', 'user', NULL, 0, NULL, NULL, '2019-10-27 21:56:13', '2022-04-10 17:28:01'),
(17, 'admin', 'onlinephp.attendance@gmail.com', '$2y$10$miAEHSC1aL.C/8sXgA4rquI1s1CVNGR.VMY71/Efx069AMYYrlPgO', 'admin', '30cc72d68e9b01037ad51274c9d5ca8549d6810744bc00e1e43c6e860bc64e82', 1, 'db1ae5f442d423a832b9d2c523cd1a78f80928bb78fd0b1fc4c7351b774ee8b8', '2022-05-10 17:30:33', '2022-04-30 18:25:32', '2022-05-10 17:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `websetting`
--

CREATE TABLE `websetting` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_persian_ci DEFAULT NULL,
  `description` text COLLATE utf8_persian_ci DEFAULT NULL,
  `keywords` text COLLATE utf8_persian_ci DEFAULT NULL,
  `logo` text COLLATE utf8_persian_ci DEFAULT NULL,
  `icon` text COLLATE utf8_persian_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `websetting`
--

INSERT INTO `websetting` (`id`, `title`, `description`, `keywords`, `logo`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'w22وبسایت خبری2', 'توضیحات سایت خبری', ' وبسایت خبری2swxswx', 'public/setting/logo.png', 'public/setting/icon.png', '2019-06-09 19:54:37', '2022-04-17 15:33:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `websetting`
--
ALTER TABLE `websetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `websetting`
--
ALTER TABLE `websetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
