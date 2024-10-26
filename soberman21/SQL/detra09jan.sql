-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2024 at 06:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detracash`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `admin_access` longtext DEFAULT NULL,
  `address` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_login_ip` varchar(30) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `phone`, `password`, `status`, `image`, `admin_access`, `address`, `last_login`, `last_login_ip`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Austin', 'admin', 'admin@gmail.com', '+491521 1543456678', '$2y$10$LPAM1Xkvcw0IzXaUpMixw.XGSVd/GGLvmpBP0gD.n/89btpcOw1xO', 1, '60c74716c6a711623672598.jpg', '[\"admin.dashboard\",\"admin.staff\",\"admin.storeStaff\",\"admin.updateStaff\",\"admin.identify-form\",\"admin.identify-form.store\",\"admin.identify-form.store\",\"admin.service\",\"admin.continent\",\"admin.country\",\"admin.country.service\",\"admin.country.service.charge\",\"admin.purpose\",\"admin.sourceOfFund\",\"admin.store.service\",\"admin.store.continent\",\"admin.country.create\",\"admin.country.service.store\",\"admin.store.purpose\",\"admin.store.sourceOfFund\",\"admin.update.service\",\"admin.update.continent\",\"admin.country.edit\",\"admin.country.multiple-active\",\"admin.country.service.update\",\"admin.update.purpose\",\"admin.update.sourceOfFund\",\"admin.delete.service\",\"admin.delete.continent\",\"admin.delete.purpose\",\"admin.delete.sourceOfFund\",\"admin.coupon\",\"admin.coupon.used\",\"admin.coupon.store\",\"admin.money-transfer\",\"admin.money-transfer.complete\",\"admin.money-transfer.pending\",\"admin.money-transfer.cancelled\",\"admin.money-transfer.search\",\"admin.money-transfer.details\",\"admin.money-transfer.recharge.pending\",\"admin.money-transfer.action\",\"admin.payment.methods\",\"admin.deposit.manual.index\",\"admin.deposit.manual.create\",\"admin.edit.payment.methods\",\"admin.deposit.manual.edit\",\"admin.payment.pending\",\"admin.payment.log\",\"admin.payment.search\",\"admin.payment.action\",\"admin.users\",\"admin.users.search\",\"admin.merchants\",\"admin.merchants.search\",\"admin.email-send\",\"admin.users.loggedIn\",\"admin.user.transaction\",\"admin.user.fundLog\",\"admin.user.transfer\",\"admin.user.loggedIn\",\"admin.merchants.create\",\"admin.user-multiple-active\",\"admin.user-multiple-inactive\",\"admin.user-edit\",\"admin.send-email\",\"admin.transaction\",\"admin.transaction.search\",\"admin.ticket\",\"admin.ticket.view\",\"admin.ticket.reply\",\"admin.ticket.delete\",\"admin.subscriber.index\",\"admin.subscriber.sendEmail\",\"admin.subscriber.remove\",\"admin.basic-controls\",\"admin.color-settings\",\"admin.email-controls\",\"admin.email-template.show\",\"admin.sms.config\",\"admin.sms-template\",\"admin.notify-config\",\"admin.notify-template.show\",\"admin.notify-template.edit\",\"admin.basic-controls.update\",\"admin.color-settings.update\",\"admin.email-controls.update\",\"admin.email-template.edit\",\"admin.sms.config\",\"admin.sms-template.edit\",\"admin.notify-config.update\",\"admin.notify-template.update\",\"admin.language.index\",\"admin.language.create\",\"admin.language.edit\",\"admin.language.keywordEdit\",\"admin.language.delete\",\"admin.logo-seo\",\"admin.breadcrumb\",\"admin.template.show\",\"admin.content.index\",\"admin.content.create\",\"admin.logoUpdate\",\"admin.seoUpdate\",\"admin.breadcrumbUpdate\",\"admin.content.show\",\"admin.content.delete\",\"admin.blog.category\",\"admin.blog.category\",\"admin.blog.category\",\"admin.blog.category\",\"admin.blog.category.delete\",\"admin.blog\",\"admin.blog.search\",\"admin.blog.create\",\"admin.blog.edit\",\"admin.blog.show\",\"admin.blog.delete\"]', 'Bedburger Straße 2', '2024-01-12 04:04:46', '127.0.0.1', 'gLWtf2paQFMQipKs5PPaCVlfm28RGuZaS5yKGNJPYAcx2K2eGOgmcgXqhmgl', '2020-11-03 03:41:33', '2024-01-11 22:04:46'),
(2, 'Ronnie', 'ronnie', 'detra@admin.com', '+4917289766543', '$2y$10$AQUVHt2bfE8RBjsGdRq0x.6./hbigzAFeB4b5qv3V0EioW8qFrv0i', 1, NULL, '[\"admin.dashboard\",\"admin.staff\",\"admin.storeStaff\",\"admin.updateStaff\",\"admin.identify-form\",\"admin.identify-form.store\",\"admin.identify-form.store\",\"admin.service\",\"admin.continent\",\"admin.country\",\"admin.country.service\",\"admin.country.service.charge\",\"admin.purpose\",\"admin.sourceOfFund\",\"admin.country.limit\",\"admin.store.service\",\"admin.store.continent\",\"admin.country.create\",\"admin.country.service.store\",\"admin.store.purpose\",\"admin.store.sourceOfFund\",\"admin.update.service\",\"admin.update.continent\",\"admin.country.edit\",\"admin.country.multiple-active\",\"admin.country.service.update\",\"admin.update.purpose\",\"admin.update.sourceOfFund\",\"admin.country.limit.update\",\"admin.delete.service\",\"admin.delete.continent\",\"admin.delete.purpose\",\"admin.delete.sourceOfFund\",\"admin.coupon\",\"admin.coupon.used\",\"admin.coupon.store\",\"admin.money-transfer\",\"admin.money-transfer.complete\",\"admin.money-transfer.pending\",\"admin.money-transfer.cancelled\",\"admin.money-transfer.search\",\"admin.money-transfer.details\",\"admin.money-transfer.recharge.pending\",\"admin.money-transfer.action\",\"admin.payment.methods\",\"admin.deposit.manual.index\",\"admin.deposit.manual.create\",\"admin.edit.payment.methods\",\"admin.deposit.manual.edit\",\"admin.payment.pending\",\"admin.payment.log\",\"admin.payment.search\",\"admin.payment.action\",\"admin.users\",\"admin.users.search\",\"admin.merchants\",\"admin.merchants.search\",\"admin.email-send\",\"admin.users.loggedIn\",\"admin.user.transaction\",\"admin.user.fundLog\",\"admin.user.transfer\",\"admin.user.loggedIn\",\"admin.merchants.create\",\"admin.user-multiple-active\",\"admin.user-multiple-inactive\",\"admin.user-edit\",\"admin.send-email\",\"admin.transaction\",\"admin.transaction.search\",\"admin.ticket\",\"admin.ticket.view\",\"admin.ticket.reply\",\"admin.ticket.delete\",\"admin.subscriber.index\",\"admin.subscriber.sendEmail\",\"admin.subscriber.remove\",\"admin.basic-controls\",\"admin.color-settings\",\"admin.email-controls\",\"admin.email-template.show\",\"admin.sms.config\",\"admin.sms-template\",\"admin.notify-config\",\"admin.notify-template.show\",\"admin.notify-template.edit\",\"admin.basic-controls.update\",\"admin.color-settings.update\",\"admin.email-controls.update\",\"admin.email-template.edit\",\"admin.sms.config\",\"admin.sms-template.edit\",\"admin.notify-config.update\",\"admin.notify-template.update\",\"admin.language.index\",\"admin.language.create\",\"admin.language.edit\",\"admin.language.keywordEdit\",\"admin.language.delete\",\"admin.logo-seo\",\"admin.breadcrumb\",\"admin.template.show\",\"admin.content.index\",\"admin.content.create\",\"admin.logoUpdate\",\"admin.seoUpdate\",\"admin.breadcrumbUpdate\",\"admin.content.show\",\"admin.content.delete\",\"admin.blog.category\",\"admin.blog.category\",\"admin.blog.category\",\"admin.blog.category\",\"admin.blog.category.delete\",\"admin.blog\",\"admin.blog.search\",\"admin.blog.create\",\"admin.blog.edit\",\"admin.blog.show\",\"admin.blog.delete\"]', NULL, '2023-11-01 11:04:18', '::1', NULL, '2021-11-17 05:23:54', '2023-11-01 05:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_logs`
--

CREATE TABLE `admin_login_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'admin Id',
  `user_ip` varchar(30) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin_login_logs`
--

INSERT INTO `admin_login_logs` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `longitude`, `latitude`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 00:45:48', '2022-08-15 00:45:48'),
(2, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 02:42:48', '2022-08-15 02:42:48'),
(3, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 02:51:35', '2022-08-15 02:51:35'),
(4, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 03:04:47', '2022-08-15 03:04:47'),
(5, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 03:05:27', '2022-08-15 03:05:27'),
(6, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 03:41:09', '2022-08-15 03:41:09'),
(7, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 07:49:56', '2022-08-15 07:49:56'),
(8, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-15 08:08:12', '2022-08-15 08:08:12'),
(9, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-24 23:42:54', '2022-08-24 23:42:54'),
(10, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-25 04:19:46', '2022-08-25 04:19:46'),
(11, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-08-25 09:18:54', '2022-08-25 09:18:54'),
(12, 1, '103.144.49.62', 'Dhaka - - Bangladesh - BD ', 'Chrome', 'Windows 10', '90.4254', '23.7518', 'Bangladesh', 'BD', '2022-08-25 14:28:34', '2022-08-25 14:28:34'),
(13, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-08-25 15:10:09', '2022-08-25 15:10:09'),
(14, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-08-25 17:14:36', '2022-08-25 17:14:36'),
(15, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-08-25 18:27:14', '2022-08-25 18:27:14'),
(16, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-08-25 18:59:23', '2022-08-25 18:59:23'),
(17, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-12 05:06:50', '2022-09-12 05:06:50'),
(18, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-12 06:01:41', '2022-09-12 06:01:41'),
(19, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-17 03:49:16', '2022-09-17 03:49:16'),
(20, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-17 09:59:39', '2022-09-17 09:59:39'),
(21, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 09:40:27', '2022-09-18 09:40:27'),
(22, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 10:32:57', '2022-09-18 10:32:57'),
(23, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 12:01:56', '2022-09-18 12:01:56'),
(24, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 15:13:23', '2022-09-18 15:13:23'),
(25, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-19 18:27:24', '2022-09-19 18:27:24'),
(26, 1, '59.153.28.84', 'Dhaka - - Bangladesh - BD ', 'Chrome', 'Windows 10', '90.4093', '23.7272', 'Bangladesh', 'BD', '2022-09-22 08:29:03', '2022-09-22 08:29:03'),
(27, 1, '46.114.108.253', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-09-22 08:32:34', '2022-09-22 08:32:34'),
(28, 1, '46.114.108.253', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-09-22 09:03:47', '2022-09-22 09:03:47'),
(29, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-22 16:39:53', '2022-09-22 16:39:53'),
(30, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-22 16:50:35', '2022-09-22 16:50:35'),
(31, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 05:55:52', '2022-10-01 05:55:52'),
(32, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 06:13:42', '2022-10-01 06:13:42'),
(33, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 06:58:04', '2022-10-01 06:58:04'),
(34, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 07:38:45', '2022-10-01 07:38:45'),
(35, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 07:52:38', '2022-10-01 07:52:38'),
(36, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 08:49:43', '2022-10-01 08:49:43'),
(37, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 09:23:52', '2022-10-01 09:23:52'),
(38, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 09:50:20', '2022-10-01 09:50:20'),
(39, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 18:05:29', '2022-10-01 18:05:29'),
(40, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 18:23:40', '2022-10-01 18:23:40'),
(41, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 19:16:50', '2022-10-01 19:16:50'),
(42, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 04:24:42', '2022-10-02 04:24:42'),
(43, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 05:42:21', '2022-10-02 05:42:21'),
(44, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 10:01:22', '2022-10-02 10:01:22'),
(45, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 13:31:52', '2022-10-02 13:31:52'),
(46, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-06 10:40:37', '2022-10-06 10:40:37'),
(47, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-06 14:37:04', '2022-10-06 14:37:04'),
(48, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-06 17:45:50', '2022-10-06 17:45:50'),
(49, 1, '5.147.190.234', 'Olsberg - - Germany - DE ', 'Chrome', 'Windows 10', '8.489', '51.3561', 'Germany', 'DE', '2022-10-15 17:23:08', '2022-10-15 17:23:08'),
(50, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 04:39:47', '2022-10-23 04:39:47'),
(51, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 05:02:02', '2022-10-23 05:02:02'),
(52, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 05:23:54', '2022-10-23 05:23:54'),
(53, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 06:01:16', '2022-10-23 06:01:16'),
(54, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 06:40:28', '2022-10-23 06:40:28'),
(55, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 07:29:29', '2022-10-23 07:29:29'),
(56, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 08:04:56', '2022-10-23 08:04:56'),
(57, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 14:33:50', '2022-10-23 14:33:50'),
(58, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 15:51:43', '2022-10-23 15:51:43'),
(59, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 16:39:39', '2022-10-23 16:39:39'),
(60, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 13:31:04', '2022-10-30 13:31:04'),
(61, 2, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 14:05:30', '2022-10-30 14:05:30'),
(62, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 14:14:00', '2022-10-30 14:14:00'),
(63, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 14:55:42', '2022-10-30 14:55:42'),
(64, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 15:54:36', '2022-10-30 15:54:36'),
(65, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 17:41:11', '2022-10-30 17:41:11'),
(66, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 18:29:53', '2022-10-30 18:29:53'),
(67, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 20:05:21', '2022-10-30 20:05:21'),
(68, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 20:40:54', '2022-10-30 20:40:54'),
(69, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 12:09:42', '2022-10-31 12:09:42'),
(70, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 12:12:52', '2022-10-31 12:12:52'),
(71, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 12:23:42', '2022-10-31 12:23:42'),
(72, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 12:36:06', '2022-10-31 12:36:06'),
(73, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 13:59:19', '2022-10-31 13:59:19'),
(74, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 20:29:48', '2022-10-31 20:29:48'),
(75, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 19:16:45', '2022-11-01 19:16:45'),
(76, 2, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 19:34:15', '2022-11-01 19:34:15'),
(77, 2, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 19:35:46', '2022-11-01 19:35:46'),
(78, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 19:57:49', '2022-11-01 19:57:49'),
(79, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 20:38:25', '2022-11-01 20:38:25'),
(80, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-02 06:26:17', '2022-11-02 06:26:17'),
(81, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-02 15:23:14', '2022-11-02 15:23:14'),
(82, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-02 16:53:16', '2022-11-02 16:53:16'),
(83, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-03 05:51:58', '2022-11-03 05:51:58'),
(84, 1, '59.153.28.84', 'Dhaka - - Bangladesh - BD ', 'Chrome', 'Windows 10', '90.4093', '23.7272', 'Bangladesh', 'BD', '2022-11-03 05:56:00', '2022-11-03 05:56:00'),
(85, 1, '46.114.106.237', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-11-03 12:38:43', '2022-11-03 12:38:43'),
(86, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-03 17:13:33', '2022-11-03 17:13:33'),
(87, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-03 17:30:54', '2022-11-03 17:30:54'),
(88, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-03 20:13:26', '2022-11-03 20:13:26'),
(89, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 05:49:10', '2022-11-04 05:49:10'),
(90, 1, '46.114.155.21', 'Stuttgart - - Germany - DE ', 'Handheld Browser', 'Android', '9.1833', '48.7667', 'Germany', 'DE', '2022-11-04 06:45:19', '2022-11-04 06:45:19'),
(91, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:22:46', '2022-11-04 16:22:46'),
(92, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:26:20', '2022-11-04 16:26:20'),
(93, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:41:45', '2022-11-04 16:41:45'),
(94, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 18:45:46', '2022-11-04 18:45:46'),
(95, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-05 07:19:53', '2022-11-05 07:19:53'),
(96, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-05 07:21:41', '2022-11-05 07:21:41'),
(97, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-05 07:24:38', '2022-11-05 07:24:38'),
(98, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-05 17:17:16', '2022-11-05 17:17:16'),
(99, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-05 21:40:35', '2022-11-05 21:40:35'),
(100, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 06:54:01', '2022-11-06 06:54:01'),
(101, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 07:36:43', '2022-11-06 07:36:43'),
(102, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 09:18:34', '2022-11-06 09:18:34'),
(103, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 10:39:07', '2022-11-06 10:39:07'),
(104, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 10:57:38', '2022-11-06 10:57:38'),
(105, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 17:10:50', '2022-11-06 17:10:50'),
(106, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-06 17:27:41', '2022-11-06 17:27:41'),
(107, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-07 20:16:42', '2022-11-07 20:16:42'),
(108, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-07 20:49:59', '2022-11-07 20:49:59'),
(109, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-14 08:15:14', '2022-11-14 08:15:14'),
(110, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-14 14:10:19', '2022-11-14 14:10:19'),
(111, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-24 07:58:48', '2022-11-24 07:58:48'),
(112, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-24 08:21:59', '2022-11-24 08:21:59'),
(113, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-24 15:01:40', '2022-11-24 15:01:40'),
(114, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-04 21:29:17', '2022-12-04 21:29:17'),
(115, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-04 21:31:00', '2022-12-04 21:31:00'),
(116, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-09 18:47:38', '2022-12-09 18:47:38'),
(117, 1, '46.114.158.62', 'Stuttgart - - Germany - DE ', 'Handheld Browser', 'Android', '9.1833', '48.7667', 'Germany', 'DE', '2022-12-09 18:51:32', '2022-12-09 18:51:32'),
(118, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 08:39:21', '2022-12-15 08:39:21'),
(119, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 08:51:28', '2022-12-15 08:51:28'),
(120, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 09:05:33', '2022-12-15 09:05:33'),
(121, 2, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 09:08:10', '2022-12-15 09:08:10'),
(122, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 09:08:51', '2022-12-15 09:08:51'),
(123, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 09:10:18', '2022-12-15 09:10:18'),
(124, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 09:10:48', '2022-12-15 09:10:48'),
(125, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-15 19:46:51', '2022-12-15 19:46:51'),
(126, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 17:33:58', '2022-12-19 17:33:58'),
(127, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 18:01:52', '2022-12-19 18:01:52'),
(128, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 05:26:53', '2022-12-21 05:26:53'),
(129, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-21 05:28:16', '2022-12-21 05:28:16'),
(130, 1, '46.114.107.128', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-21 12:08:09', '2022-12-21 12:08:09'),
(131, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 17:01:36', '2022-12-21 17:01:36'),
(132, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 19:39:46', '2022-12-21 19:39:46'),
(133, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 19:39:57', '2022-12-21 19:39:57'),
(134, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 15:08:38', '2022-12-22 15:08:38'),
(135, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 16:37:42', '2022-12-22 16:37:42'),
(136, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 21:58:03', '2022-12-22 21:58:03'),
(137, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 06:18:34', '2022-12-30 06:18:34'),
(138, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 06:58:31', '2022-12-30 06:58:31'),
(139, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 07:35:27', '2022-12-30 07:35:27'),
(140, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 09:07:25', '2022-12-30 09:07:25'),
(141, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 12:29:23', '2022-12-30 12:29:23'),
(142, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 14:08:01', '2022-12-30 14:08:01'),
(143, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 14:39:34', '2022-12-30 14:39:34'),
(144, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 15:03:05', '2022-12-30 15:03:05'),
(145, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 15:38:11', '2022-12-30 15:38:11'),
(146, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 16:29:51', '2022-12-30 16:29:51'),
(147, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 16:50:58', '2022-12-30 16:50:58'),
(148, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 17:18:09', '2022-12-30 17:18:09'),
(149, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 17:51:47', '2022-12-30 17:51:47'),
(150, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 18:47:38', '2022-12-30 18:47:38'),
(151, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-30 21:58:03', '2022-12-30 21:58:03'),
(152, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-02 21:34:27', '2023-01-02 21:34:27'),
(153, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-08 19:38:42', '2023-01-08 19:38:42'),
(154, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-11 13:33:38', '2023-01-11 13:33:38'),
(155, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-11 13:34:46', '2023-01-11 13:34:46'),
(156, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-11 13:53:16', '2023-01-11 13:53:16'),
(157, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-13 15:33:09', '2023-01-13 15:33:09'),
(158, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-13 16:38:00', '2023-01-13 16:38:00'),
(159, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 05:53:33', '2023-01-16 05:53:33'),
(160, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-16 06:01:42', '2023-01-16 06:01:42'),
(161, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-16 06:06:46', '2023-01-16 06:06:46'),
(162, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 10:51:02', '2023-01-16 10:51:02'),
(163, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-16 10:52:19', '2023-01-16 10:52:19'),
(164, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 11:54:37', '2023-01-16 11:54:37'),
(165, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-16 12:28:22', '2023-01-16 12:28:22'),
(166, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 12:34:22', '2023-01-16 12:34:22'),
(167, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 13:29:06', '2023-01-16 13:29:06'),
(168, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 13:29:52', '2023-01-16 13:29:52'),
(169, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 13:30:48', '2023-01-16 13:30:48'),
(170, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 13:45:40', '2023-01-16 13:45:40'),
(171, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 13:46:54', '2023-01-16 13:46:54'),
(172, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Handheld Browser', 'Android', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 14:01:22', '2023-01-16 14:01:22'),
(173, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Handheld Browser', 'Android', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 15:32:24', '2023-01-16 15:32:24'),
(174, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Handheld Browser', 'Android', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 15:33:37', '2023-01-16 15:33:37'),
(175, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 16:37:11', '2023-01-16 16:37:11'),
(176, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 18:08:37', '2023-01-16 18:08:37'),
(177, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 19:40:23', '2023-01-16 19:40:23'),
(178, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 04:29:39', '2023-01-17 04:29:39'),
(179, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 04:45:00', '2023-01-17 04:45:00'),
(180, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 10:27:27', '2023-01-17 10:27:27'),
(181, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 11:12:03', '2023-01-17 11:12:03'),
(182, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 12:09:28', '2023-01-17 12:09:28'),
(183, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 12:41:06', '2023-01-17 12:41:06'),
(184, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 13:10:07', '2023-01-17 13:10:07'),
(185, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 18:50:35', '2023-01-17 18:50:35'),
(186, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-17 19:15:15', '2023-01-17 19:15:15'),
(187, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-18 04:36:08', '2023-01-18 04:36:08'),
(188, 1, '46.114.152.156', 'Stuttgart - - Germany - DE ', 'Handheld Browser', 'Android', '9.1833', '48.7667', 'Germany', 'DE', '2023-01-18 14:34:17', '2023-01-18 14:34:17'),
(189, 1, '46.114.152.156', 'Stuttgart - - Germany - DE ', 'Handheld Browser', 'Android', '9.1833', '48.7667', 'Germany', 'DE', '2023-01-18 14:50:50', '2023-01-18 14:50:50'),
(190, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-18 16:42:34', '2023-01-18 16:42:34'),
(191, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-18 18:03:06', '2023-01-18 18:03:06'),
(192, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-19 06:08:30', '2023-01-19 06:08:30'),
(193, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-19 18:32:44', '2023-01-19 18:32:44'),
(194, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-20 08:42:56', '2023-01-20 08:42:56'),
(195, 1, '46.114.110.96', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2023-01-20 08:45:50', '2023-01-20 08:45:50'),
(196, 1, '46.114.110.96', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2023-01-20 09:31:15', '2023-01-20 09:31:15'),
(197, 1, '46.114.110.96', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2023-01-20 10:14:11', '2023-01-20 10:14:11'),
(198, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-20 16:39:09', '2023-01-20 16:39:09'),
(199, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-20 20:40:41', '2023-01-20 20:40:41'),
(200, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-20 21:30:40', '2023-01-20 21:30:40'),
(201, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 11:31:51', '2023-01-21 11:31:51'),
(202, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 14:35:45', '2023-01-21 14:35:45'),
(203, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 16:55:07', '2023-01-21 16:55:07'),
(204, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 17:19:36', '2023-01-21 17:19:36'),
(205, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 20:46:53', '2023-01-21 20:46:53'),
(206, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 21:09:09', '2023-01-21 21:09:09'),
(207, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 17:44:06', '2023-01-22 17:44:06'),
(208, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 17:59:31', '2023-01-22 17:59:31'),
(209, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 18:54:22', '2023-01-22 18:54:22'),
(210, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 19:58:40', '2023-01-22 19:58:40'),
(211, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 21:23:33', '2023-01-22 21:23:33'),
(212, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 21:39:20', '2023-01-22 21:39:20'),
(213, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-24 04:53:34', '2023-01-24 04:53:34'),
(214, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-24 15:53:04', '2023-01-24 15:53:04'),
(215, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-26 05:23:51', '2023-01-26 05:23:51'),
(216, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-01-26 05:29:22', '2023-01-26 05:29:22'),
(217, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-27 06:03:00', '2023-01-27 06:03:00'),
(218, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Handheld Browser', 'Android', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 08:06:30', '2023-01-28 08:06:30'),
(219, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 13:31:09', '2023-01-28 13:31:09'),
(220, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 14:40:11', '2023-01-28 14:40:11'),
(221, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 14:59:45', '2023-01-28 14:59:45'),
(222, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 15:20:44', '2023-01-28 15:20:44'),
(223, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 16:47:32', '2023-01-28 16:47:32'),
(224, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 20:14:18', '2023-01-28 20:14:18'),
(225, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 21:02:42', '2023-01-28 21:02:42'),
(226, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-28 21:16:03', '2023-01-28 21:16:03'),
(227, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-30 12:59:25', '2023-01-30 12:59:25'),
(228, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-01-30 13:53:01', '2023-01-30 13:53:01'),
(229, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 15:23:24', '2023-02-04 15:23:24'),
(230, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 17:02:12', '2023-02-04 17:02:12'),
(231, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 17:31:44', '2023-02-04 17:31:44'),
(232, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 17:54:13', '2023-02-04 17:54:13'),
(233, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:07:39', '2023-02-04 19:07:39'),
(234, 2, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:22:19', '2023-02-04 19:22:19'),
(235, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:25:11', '2023-02-04 19:25:11'),
(236, 2, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:26:16', '2023-02-04 19:26:16'),
(237, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:27:08', '2023-02-04 19:27:08'),
(238, 2, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:29:26', '2023-02-04 19:29:26'),
(239, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:32:41', '2023-02-04 19:32:41'),
(240, 2, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:33:31', '2023-02-04 19:33:31'),
(241, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:35:30', '2023-02-04 19:35:30'),
(242, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:38:38', '2023-02-04 19:38:38'),
(243, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-04 19:48:01', '2023-02-04 19:48:01'),
(244, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-05 18:30:42', '2023-02-05 18:30:42'),
(245, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-05 18:47:05', '2023-02-05 18:47:05'),
(246, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-06 09:36:50', '2023-02-06 09:36:50'),
(247, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-06 15:28:03', '2023-02-06 15:28:03'),
(248, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-07 05:37:38', '2023-02-07 05:37:38'),
(249, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-07 05:54:41', '2023-02-07 05:54:41'),
(250, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-07 21:05:09', '2023-02-07 21:05:09'),
(251, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-08 20:40:48', '2023-02-08 20:40:48'),
(252, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 05:50:06', '2023-02-11 05:50:06'),
(253, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 06:28:45', '2023-02-11 06:28:45'),
(254, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-11 09:16:14', '2023-02-11 09:16:14'),
(255, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-11 10:28:07', '2023-02-11 10:28:07'),
(256, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 10:34:00', '2023-02-11 10:34:00'),
(257, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 10:46:58', '2023-02-11 10:46:58'),
(258, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-11 11:45:30', '2023-02-11 11:45:30'),
(259, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-11 12:01:56', '2023-02-11 12:01:56'),
(260, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 13:14:22', '2023-02-11 13:14:22'),
(261, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 13:31:39', '2023-02-11 13:31:39'),
(262, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 15:47:43', '2023-02-11 15:47:43'),
(263, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 16:50:26', '2023-02-11 16:50:26'),
(264, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 19:22:18', '2023-02-11 19:22:18'),
(265, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 20:42:35', '2023-02-11 20:42:35'),
(266, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-11 20:42:54', '2023-02-11 20:42:54'),
(267, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-12 13:18:23', '2023-02-12 13:18:23'),
(268, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-12 14:16:00', '2023-02-12 14:16:00'),
(269, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-12 14:42:29', '2023-02-12 14:42:29'),
(270, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-13 06:14:56', '2023-02-13 06:14:56'),
(271, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-13 08:02:17', '2023-02-13 08:02:17'),
(272, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-13 11:26:01', '2023-02-13 11:26:01'),
(273, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-13 11:32:44', '2023-02-13 11:32:44'),
(274, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-13 12:40:08', '2023-02-13 12:40:08'),
(275, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-13 13:01:17', '2023-02-13 13:01:17'),
(276, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-13 13:53:35', '2023-02-13 13:53:35'),
(277, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-13 14:38:57', '2023-02-13 14:38:57'),
(278, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-14 05:17:06', '2023-02-14 05:17:06'),
(279, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-14 05:19:20', '2023-02-14 05:19:20'),
(280, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-14 05:51:19', '2023-02-14 05:51:19'),
(281, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-14 06:52:26', '2023-02-14 06:52:26'),
(282, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-14 07:59:01', '2023-02-14 07:59:01'),
(283, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-15 18:39:18', '2023-02-15 18:39:18'),
(284, 1, '103.244.174.16', ' - -  -  ', 'Chrome', 'Windows 10', NULL, NULL, NULL, NULL, '2023-02-16 04:45:44', '2023-02-16 04:45:44'),
(285, 1, '176.198.91.115', ' - -  -  ', 'Chrome', 'Windows 10', NULL, NULL, NULL, NULL, '2023-02-16 04:54:19', '2023-02-16 04:54:19'),
(286, 1, '176.198.91.115', ' - -  -  ', 'Chrome', 'Windows 10', NULL, NULL, NULL, NULL, '2023-02-16 05:30:50', '2023-02-16 05:30:50'),
(287, 1, '103.244.174.16', ' - -  -  ', 'Chrome', 'Windows 10', NULL, NULL, NULL, NULL, '2023-02-16 05:34:43', '2023-02-16 05:34:43'),
(288, 1, '176.198.91.115', ' - -  -  ', 'Chrome', 'Windows 10', NULL, NULL, NULL, NULL, '2023-02-16 06:33:13', '2023-02-16 06:33:13'),
(289, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-17 09:19:58', '2023-02-17 09:19:58'),
(290, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-17 19:14:52', '2023-02-17 19:14:52'),
(291, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-18 06:52:40', '2023-02-18 06:52:40'),
(292, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-18 15:05:24', '2023-02-18 15:05:24'),
(293, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 09:46:52', '2023-02-20 09:46:52'),
(294, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 13:59:28', '2023-02-20 13:59:28'),
(295, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 17:10:17', '2023-02-20 17:10:17'),
(296, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 17:24:10', '2023-02-20 17:24:10'),
(297, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 19:11:27', '2023-02-20 19:11:27');
INSERT INTO `admin_login_logs` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `longitude`, `latitude`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(298, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 20:14:50', '2023-02-20 20:14:50'),
(299, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 21:49:07', '2023-02-20 21:49:07'),
(300, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-22 18:16:25', '2023-02-22 18:16:25'),
(301, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-25 05:29:13', '2023-02-25 05:29:13'),
(302, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-26 18:23:20', '2023-02-26 18:23:20'),
(303, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 04:35:46', '2023-02-27 04:35:46'),
(304, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-27 04:45:01', '2023-02-27 04:45:01'),
(305, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 05:04:45', '2023-02-27 05:04:45'),
(306, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-27 05:07:43', '2023-02-27 05:07:43'),
(307, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 05:57:33', '2023-02-27 05:57:33'),
(308, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 06:20:00', '2023-02-27 06:20:00'),
(309, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 20:11:35', '2023-02-27 20:11:35'),
(310, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-04 07:40:24', '2023-03-04 07:40:24'),
(311, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-04 07:54:15', '2023-03-04 07:54:15'),
(312, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-04 08:24:11', '2023-03-04 08:24:11'),
(313, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-04 08:30:55', '2023-03-04 08:30:55'),
(314, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-04 10:57:34', '2023-03-04 10:57:34'),
(315, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-03-06 05:07:17', '2023-03-06 05:07:17'),
(316, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-06 05:17:07', '2023-03-06 05:17:07'),
(317, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-06 05:30:04', '2023-03-06 05:30:04'),
(318, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-06 05:34:39', '2023-03-06 05:34:39'),
(319, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-13 04:49:25', '2023-03-13 04:49:25'),
(320, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-03-13 04:52:43', '2023-03-13 04:52:43'),
(321, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-13 05:05:23', '2023-03-13 05:05:23'),
(322, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-13 17:04:15', '2023-03-13 17:04:15'),
(323, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-14 04:14:53', '2023-03-14 04:14:53'),
(324, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-14 04:34:34', '2023-03-14 04:34:34'),
(325, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-03-14 04:36:29', '2023-03-14 04:36:29'),
(326, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-03-14 05:22:03', '2023-03-14 05:22:03'),
(327, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-14 20:01:38', '2023-03-14 20:01:38'),
(328, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-19 06:21:06', '2023-03-19 06:21:06'),
(329, 1, '46.114.107.23', 'Bonn - - Germany - DE ', 'Handheld Browser', 'Android', '7.0932', '50.7263', 'Germany', 'DE', '2023-03-24 06:41:42', '2023-03-24 06:41:42'),
(330, 1, '46.114.107.23', 'Bonn - - Germany - DE ', 'Handheld Browser', 'Android', '7.0932', '50.7263', 'Germany', 'DE', '2023-03-24 06:46:35', '2023-03-24 06:46:35'),
(331, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-28 12:41:20', '2023-03-28 12:41:20'),
(332, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-03-31 07:18:20', '2023-03-31 07:18:20'),
(333, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-05 02:55:53', '2023-04-05 02:55:53'),
(334, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-04-05 02:57:10', '2023-04-05 02:57:10'),
(335, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-06 17:37:48', '2023-04-06 17:37:48'),
(336, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 04:24:53', '2023-04-10 04:24:53'),
(337, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 05:21:55', '2023-04-10 05:21:55'),
(338, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-04-10 05:22:12', '2023-04-10 05:22:12'),
(339, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 08:13:51', '2023-04-10 08:13:51'),
(340, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 08:22:32', '2023-04-10 08:22:32'),
(341, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 09:20:17', '2023-04-10 09:20:17'),
(342, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-11 04:38:13', '2023-04-11 04:38:13'),
(343, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-11 04:56:03', '2023-04-11 04:56:03'),
(344, 1, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-14 18:12:06', '2023-04-14 18:12:06'),
(345, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-04-23 05:46:49', '2023-04-23 05:46:49'),
(346, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-04-23 16:31:31', '2023-04-23 16:31:31'),
(347, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-04-24 12:04:29', '2023-04-24 12:04:29'),
(348, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-04-29 09:33:39', '2023-04-29 09:33:39'),
(349, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-01 07:55:12', '2023-05-01 07:55:12'),
(350, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-11 16:42:09', '2023-05-11 16:42:09'),
(351, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-12 17:50:19', '2023-05-12 17:50:19'),
(352, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-12 18:55:44', '2023-05-12 18:55:44'),
(353, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 03:58:25', '2023-05-15 03:58:25'),
(354, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 08:32:59', '2023-05-15 08:32:59'),
(355, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 08:49:08', '2023-05-15 08:49:08'),
(356, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 12:34:17', '2023-05-15 12:34:17'),
(357, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 15:59:46', '2023-05-15 15:59:46'),
(358, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 17:27:49', '2023-05-15 17:27:49'),
(359, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 18:00:51', '2023-05-15 18:00:51'),
(360, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-15 18:33:07', '2023-05-15 18:33:07'),
(361, 1, '46.114.104.117', 'Bonn - - Germany - DE ', 'Handheld Browser', 'Android', '7.0932', '50.7263', 'Germany', 'DE', '2023-05-19 07:12:28', '2023-05-19 07:12:28'),
(362, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Handheld Browser', 'Android', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-19 15:19:08', '2023-05-19 15:19:08'),
(363, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-24 18:33:39', '2023-05-24 18:33:39'),
(364, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Handheld Browser', 'Android', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-25 01:35:24', '2023-05-25 01:35:24'),
(365, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Handheld Browser', 'Android', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-25 02:18:40', '2023-05-25 02:18:40'),
(366, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-25 09:51:50', '2023-05-25 09:51:50'),
(367, 1, '46.114.108.223', 'Bonn - - Germany - DE ', 'Handheld Browser', 'Android', '7.0932', '50.7263', 'Germany', 'DE', '2023-05-25 13:09:24', '2023-05-25 13:09:24'),
(368, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-28 14:56:21', '2023-05-28 14:56:21'),
(369, 1, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-28 15:34:59', '2023-05-28 15:34:59'),
(370, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-16 19:07:19', '2023-06-16 19:07:19'),
(371, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-18 11:03:21', '2023-06-18 11:03:21'),
(372, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-18 15:23:08', '2023-06-18 15:23:08'),
(373, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-18 15:43:49', '2023-06-18 15:43:49'),
(374, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-18 19:01:33', '2023-06-18 19:01:33'),
(375, 1, '46.114.107.31', 'Bonn - - Germany - DE ', 'Handheld Browser', 'Android', '7.0932', '50.7263', 'Germany', 'DE', '2023-06-19 13:52:51', '2023-06-19 13:52:51'),
(376, 1, '46.114.107.31', 'Bonn - - Germany - DE ', 'Handheld Browser', 'Android', '7.0932', '50.7263', 'Germany', 'DE', '2023-06-19 14:26:45', '2023-06-19 14:26:45'),
(377, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-25 10:28:55', '2023-06-25 10:28:55'),
(378, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-26 17:00:40', '2023-06-26 17:00:40'),
(379, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-26 19:46:14', '2023-06-26 19:46:14'),
(380, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-27 05:49:33', '2023-06-27 05:49:33'),
(381, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-27 06:27:24', '2023-06-27 06:27:24'),
(382, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-27 07:48:17', '2023-06-27 07:48:17'),
(383, 1, '5.147.191.97', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-06-27 08:07:36', '2023-06-27 08:07:36'),
(384, 1, '5.147.189.98', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-07-03 07:00:20', '2023-07-03 07:00:20'),
(385, 1, '5.147.189.98', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-07-03 11:13:45', '2023-07-03 11:13:45'),
(386, 1, '5.147.189.98', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-07-04 11:02:34', '2023-07-04 11:02:34'),
(387, 1, '5.147.189.98', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-07-04 16:44:40', '2023-07-04 16:44:40'),
(388, 1, '176.198.89.113', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-07-13 19:24:46', '2023-07-13 19:24:46'),
(389, 1, '196.202.236.195', ' - - Cameroon - CM ', 'Handheld Browser', 'Android', '12.5', '6', 'Cameroon', 'CM', '2023-07-18 04:33:13', '2023-07-18 04:33:13'),
(390, 1, '196.202.236.195', ' - - Cameroon - CM ', 'Handheld Browser', 'Android', '12.5', '6', 'Cameroon', 'CM', '2023-07-18 05:49:30', '2023-07-18 05:49:30'),
(391, 1, '176.198.90.79', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-08-03 05:07:14', '2023-08-03 05:07:14'),
(392, 1, '176.198.90.79', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-08-07 18:23:50', '2023-08-07 18:23:50'),
(393, 1, '176.198.90.79', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-08-18 07:51:26', '2023-08-18 07:51:26'),
(394, 1, '176.198.90.79', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-08-18 07:52:13', '2023-08-18 07:52:13'),
(395, 1, '176.198.90.79', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-08-22 18:46:24', '2023-08-22 18:46:24'),
(396, 1, '176.198.90.79', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-08-22 19:19:26', '2023-08-22 19:19:26'),
(397, 1, '46.114.154.176', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0115', '50.9446', 'Germany', 'DE', '2023-08-23 08:18:22', '2023-08-23 08:18:22'),
(398, 1, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-25 00:09:34', '2023-08-25 00:09:34'),
(399, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-30 12:20:11', '2023-08-30 12:20:11'),
(400, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 03:57:42', '2023-08-31 03:57:42'),
(401, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 05:28:08', '2023-08-31 05:28:08'),
(402, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 12:41:14', '2023-08-31 12:41:14'),
(403, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 12:53:36', '2023-08-31 12:53:36'),
(404, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 23:20:01', '2023-08-31 23:20:01'),
(405, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-01 05:49:37', '2023-09-01 05:49:37'),
(406, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-02 12:09:47', '2023-09-02 12:09:47'),
(407, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-02 12:53:58', '2023-09-02 12:53:58'),
(408, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-03 00:23:09', '2023-09-03 00:23:09'),
(409, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-03 12:37:21', '2023-09-03 12:37:21'),
(410, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-04 00:18:39', '2023-09-04 00:18:39'),
(411, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 01:53:31', '2023-09-05 01:53:31'),
(412, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 04:36:14', '2023-09-05 04:36:14'),
(413, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 05:52:52', '2023-09-05 05:52:52'),
(414, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 06:33:29', '2023-09-05 06:33:29'),
(415, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-09-29 11:37:51', '2023-09-29 11:37:51'),
(416, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-09-30 18:37:03', '2023-09-30 18:37:03'),
(417, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-02 16:19:46', '2023-10-02 16:19:46'),
(418, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 07:14:06', '2023-10-06 07:14:06'),
(419, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 07:40:05', '2023-10-06 07:40:05'),
(420, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 08:02:36', '2023-10-06 08:02:36'),
(421, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 08:18:40', '2023-10-06 08:18:40'),
(422, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 09:23:47', '2023-10-06 09:23:47'),
(423, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 09:49:08', '2023-10-06 09:49:08'),
(424, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-06 10:56:08', '2023-10-06 10:56:08'),
(425, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-09 11:32:00', '2023-10-09 11:32:00'),
(426, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-10 12:12:17', '2023-10-10 12:12:17'),
(427, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-11 15:01:40', '2023-10-11 15:01:40'),
(428, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-11 16:07:26', '2023-10-11 16:07:26'),
(429, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-11 16:31:28', '2023-10-11 16:31:28'),
(430, 2, '::1', '', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-11 17:08:29', '2023-10-11 17:08:29'),
(431, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-12 23:50:51', '2023-10-12 23:50:51'),
(432, 2, '127.0.0.1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-14 01:43:44', '2023-10-14 01:43:44'),
(433, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-22 07:42:50', '2023-10-22 07:42:50'),
(434, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-22 08:16:54', '2023-10-22 08:16:54'),
(435, 2, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-11-01 05:04:18', '2023-11-01 05:04:18'),
(436, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-09 02:04:21', '2024-01-09 02:04:21'),
(437, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-09 11:14:48', '2024-01-09 11:14:48'),
(438, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-10 00:34:10', '2024-01-10 00:34:10'),
(439, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-10 00:34:17', '2024-01-10 00:34:17'),
(440, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-10 05:50:17', '2024-01-10 05:50:17'),
(441, 1, '127.0.0.1', ' -  -  - ', 'Handheld Browser', 'Android', '', '', '', '', '2024-01-10 12:28:21', '2024-01-10 12:28:21'),
(442, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-10 22:17:19', '2024-01-10 22:17:19'),
(443, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-11 05:40:24', '2024-01-11 05:40:24'),
(444, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-11 11:15:59', '2024-01-11 11:15:59'),
(445, 1, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-11 22:04:46', '2024-01-11 22:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) DEFAULT NULL,
  `image` varchar(91) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `parent_id`, `language_id`, `name`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
(5, 3, 0, 1, 'What is remittance and why use DETRACASH?', '646276ea001a71684174570.png', '<p><span style=\"font-size: 1rem;\">The remittance industry refers to the business of transferring money from one location to another, typically from a developed country to a developing country.</span></p><p><span style=\"font-size: 1rem;\">There are several key players in the remittance industry, including traditional banks, money transfer operators (MTOs), and online or digital platforms. A few MTOs, dominated this industry for many years due to their extensive network of physical locations. However, with the rise of digital platforms such as DETRACASH and others have disrupted the industry by offering cheaper and more convenient transfer alternatives to traditional methods.</span></p><p><span style=\"font-size: 1rem;\">One of the biggest challenges facing the remittance industry is the cost of transfers, which can be high due to various fees and exchange rates. To address this issue, many companies have begun offering low-cost or even free transfers, relying on alternative business models such as cross-border payments and currency exchange.</span></p><p><span style=\"font-size: 1rem;\">Remittances play an important role in the global economy, as they provide a significant source of income for millions of people in developing countries. According to the World Bank, global remittances reached an all-time high of $698 billion in 2019, with a significant portion going to countries in Africa, Asia, and Latin America.</span></p><p><span style=\"font-size: 1rem;\">In recent years, the remittance industry has faced new challenges due to the COVID-19 pandemic, which has disrupted global economic activity and led to a drop in remittances. However, the industry has been able to adapt by pivoting to digital channels, which have become more widely accepted as a result of the pandemic.</span></p><p><span style=\"font-size: 1rem;\">Overall, the remittance industry continues to play a crucial role in the global economy, connecting people across borders and providing much-needed financial support to families and communities around the world.</span></p><p><span style=\"font-size: 1rem;\"><font color=\"#0000ff\">Why use an MTO such as DETRACASH to send money to your love ones and friends?</font></span></p><ul><li><b>Convenience</b>: MTOs allow for easy and quick transfers from the comfort of your own home or office.</li><li><b><br></b></li><li><b>Competitive exchange rates</b>: When compared to banks and other traditional financial institutions MTOs provide better/competitive exchange rates.</li><li><b><br></b></li><li><b>Wide coverage</b>: Remittance companies such as DETRACASH have a wide network of partners, allowing for transfers to be made to almost any location around the world.</li><li><b><br></b></li><li><b>Security</b>: Reputable transfer operators have secured systems to protect both sender and recipient’s information and funds.</li><li><b><br></b></li><li><b>Speed</b>: A majority of transfers executed from an MTO site are completed in a matter of minutes, allowing for quick access to funds by the recipient.</li><li><b><br></b></li><li><b>Low fees</b>: Compared to traditional banks, MTOs charge lower fees making them a cost effective preferred option for sending money abroad.</li></ul>', 1, '2023-02-04 17:12:15', '2023-05-15 16:16:10'),
(6, 4, 0, 1, 'How to save money', '6462739084f641684173712.png', '<p>Saving money is an important aspect of personal finance and can help you achieve financial stability and reach your long-term goals. Here are some tips to help you save money:</p><p><b>Create a budget</b>: The first step to saving money is to understand where your money is going. Create a budget that tracks your income and expenses, and look for areas where you can cut back.</p><p><b>Reduce unnecessary expenses</b>: Take a close look at your spending habits and identify areas where you can reduce or eliminate expenses, such as dining out, entertainment, or subscriptions you no longer use.</p><p><b>Save automatically</b>: One of the easiest ways to save money is to set up automatic transfers to a savings account. You can choose to transfer a portion of each paycheck, or set up an automatic transfer for a certain amount each month.</p><p><b>Shop smart</b>: When shopping for essentials, compare prices, use coupons and discount codes, and look for sales. You can also consider buying generic or store-brand products, which are often cheaper than name-brand items.</p><p><b>Avoid impulse purchases</b>: Impulse purchases can add up quickly and derail your savings plan. To avoid impulse buys, take a step back and think before you buy.</p><p><b>Live below your means</b>: One of the simplest ways to save money is to live below your means. Avoid lifestyle inflation and stick to your budget, even as your income increases.</p><p><b>Save windfalls</b>: When you receive a bonus, tax refund, or other windfall, consider putting a portion of it into savings.</p><p><span style=\"font-size: 1rem;\">By following these tips and consistently making an effort to save, you can build a strong financial foundation and achieve your savings goals.</span><br></p>', 1, '2023-02-11 15:50:10', '2023-05-15 16:01:52'),
(7, 3, 0, 1, 'How covid-19 has changed the way we do business', '64628eb4dced31684180660.png', '<p>The COVID-19 pandemic has had a profound impact on the way we do business, affecting nearly every aspect of the global economy. Here are some of the ways in which the pandemic has changed the way we conduct business:</p><p>One of the most significant changes brought about by the pandemic has been the shift to remote work. Many companies have adopted remote work as a means of continuing operations while keeping employees safe.</p><p>The pandemic has accelerated the growth of online commerce, with consumers increasingly relying on e-commerce platforms to purchase goods and services.</p><p>The pandemic has also spurred companies to accelerate their digital transformation efforts, including the adoption of new technologies, such as cloud computing and artificial intelligence, to improve efficiency and resilience.</p><p>The pandemic has highlighted the vulnerabilities of global supply chains and forced companies to re-evaluate their sourcing strategies and build resilience into their operations.</p><p>Companies have had to prioritize the health and safety of their employees and customers, implementing new protocols, such as temperature checks and social distancing, to reduce the spread of the virus.</p><p>The pandemic has forced companies to re-evaluate their business models and explore new revenue streams, such as online offerings and delivery services.</p><p>The pandemic has also led to an increased focus on social responsibility, with companies taking steps to support their communities, such as providing essential supplies and medical equipment.</p><p>Overall, the COVID-19 pandemic has brought about a profound shift in the way we do business, requiring companies to adapt to new challenges and opportunities. While the pandemic has created many difficulties, it has also accelerated innovation and digital transformation, paving the way for a new era of business.</p>', 1, '2023-02-11 16:00:52', '2023-05-15 17:58:06'),
(11, 2, 0, 1, 'Digitalization is transforming business in Africa', '646273597bd681684173657.png', '<p>E-commerce: Digital platforms and mobile apps are making it easier for African businesses to reach customers beyond their local markets, driving growth in e-commerce and online retail.</p><p>Financial Inclusion: Digital finance solutions, such as mobile banking and digital payment systems, are expanding financial access and enabling more businesses to participate in the formal economy.</p><p>Remote Work: The COVID-19 pandemic has accelerated the shift towards remote work, enabling African businesses to tap into a global pool of talent and increase their competitiveness.</p><p>Agricultural Technology: Agricultural technology and digital tools are improving yields and enabling more efficient supply chain management for African agribusinesses.</p><p>Healthcare: Digital health solutions, such as telemedicine and Mobile Health(mHealth), are improving access to quality healthcare for Africa’s growing population.</p><p>Energy: The adoption of renewable energy and smart grid technologies is enabling African businesses to reduce costs, increase energy efficiency, and mitigate the impact of climate change.</p><p>Overall, digitalization is driving innovation and creating new opportunities for businesses in Africa. The continent is well-positioned to take advantage of these trends, given its large and growing youth population, increasing access to mobile technology, and supportive government policies</p>', 1, '2023-02-13 14:01:14', '2023-05-15 16:00:57'),
(13, 7, 11, 2, 'Digitalization is transforming business in Africa', NULL, '<p>abababababE-commerce: Digital platforms and mobile apps are making it easier for African businesses to reach customers beyond their local markets, driving growth in e-commerce and online retail.</p><p>Financial Inclusion: Digital finance solutions, such as mobile banking and digital payment systems, are expanding financial access and enabling more businesses to participate in the formal economy.</p><p>Remote Work: The COVID-19 pandemic has accelerated the shift towards remote work, enabling African businesses to tap into a global pool of talent and increase their competitiveness.</p><p>Agricultural Technology: Agricultural technology and digital tools are improving yields and enabling more efficient supply chain management for African agribusinesses.</p><p>Healthcare: Digital health solutions, such as telemedicine and Mobile Health(mHealth), are improving access to quality healthcare for Africa’s growing population.</p><p>Energy: The adoption of renewable energy and smart grid technologies is enabling African businesses to reduce costs, increase energy efficiency, and mitigate the impact of climate change.</p><p>Overall, digitalization is driving innovation and creating new opportunities for businesses in Africa. The continent is well-positioned to take advantage of these trends, given its large and growing youth population, increasing access to mobile technology, and supportive government policies</p>', 1, '2023-02-13 14:45:31', '2023-02-14 05:59:39'),
(14, 6, 7, 2, 'Comment le covid-19 a changé notre façon de faire des affaires', '63e7d9263c1811676138790.png', '<p>Comment le covid-19 a changé notre façon de faire des affaires</p>', 1, '2023-02-14 06:00:57', '2023-05-15 17:37:38'),
(16, 7, 15, 2, 'Le transfert d\'argent peut être difficile.', '64628c2eda35a1684180014.jpg', '<p>Savoir transférer de l\'argent sera le meilleur moyen de se débarrasser de sa banque<br></p>', 1, '2023-05-15 17:48:18', '2023-05-15 17:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `title`, `status`, `language_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'News updates', 1, 1, 0, '2022-08-25 05:27:58', '2022-08-25 05:59:40'),
(2, 'Business', 1, 1, 0, '2022-08-25 05:59:46', '2022-08-25 05:59:46'),
(3, 'Articles', 1, 1, 0, '2022-08-25 05:59:53', '2022-08-25 05:59:53'),
(4, 'Tips and Guides', 1, 1, 0, '2023-02-11 15:54:27', '2023-02-11 15:54:27'),
(5, 'Conseils et guides', 1, 2, 4, '2023-02-13 11:33:34', '2023-02-13 12:02:25'),
(6, 'Des articles', 1, 2, 3, '2023-02-13 12:03:01', '2023-02-13 12:03:01'),
(7, 'Affaires', 1, 2, 2, '2023-02-13 12:03:32', '2023-02-13 12:03:32'),
(8, 'Les dernières nouvelles', 1, 2, 1, '2023-02-13 12:07:53', '2023-02-13 12:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `chat_notifications`
--

CREATE TABLE `chat_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `chat_notificational_id` bigint(20) DEFAULT NULL,
  `chat_notificational_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_read_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `background_color` varchar(10) DEFAULT NULL COMMENT 'background-color',
  `secondary_background_color` varchar(10) DEFAULT NULL COMMENT 'background-color-alt',
  `base_color` varchar(10) DEFAULT NULL COMMENT 'brand-color',
  `secondary_color` varchar(10) DEFAULT NULL COMMENT 'brand-color-alt',
  `title_color` varchar(10) DEFAULT NULL COMMENT 'title-color',
  `text_color` varchar(10) DEFAULT NULL COMMENT 'text-color',
  `natural_color` varchar(10) DEFAULT NULL COMMENT 'natural-color',
  `error_color` varchar(10) DEFAULT NULL COMMENT 'error',
  `secondary_alternative_color` varchar(10) DEFAULT NULL COMMENT 'brand-color-alt-dark',
  `background_alternative_color` varchar(10) DEFAULT NULL COMMENT 'brand-color-light',
  `border_color` varchar(10) DEFAULT NULL COMMENT 'border-color',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `background_color`, `secondary_background_color`, `base_color`, `secondary_color`, `title_color`, `text_color`, `natural_color`, `error_color`, `secondary_alternative_color`, `background_alternative_color`, `border_color`, `created_at`, `updated_at`) VALUES
(1, '#ffffff', '#f2f5f7', '#5ac8e4', '#385081', '#37517e', '#2e4369', '#ffffff', '#f21a29', '#022c63', '#e6f9f8', '#e7e5e5', '2021-09-03 14:15:38', '2021-10-19 15:22:40');

-- --------------------------------------------------------

--
-- Table structure for table `configures`
--

CREATE TABLE `configures` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(30) DEFAULT NULL,
  `time_zone` varchar(30) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `rate` decimal(18,8) NOT NULL,
  `theme` varchar(40) DEFAULT NULL,
  `fraction_number` int(11) DEFAULT NULL,
  `paginate` int(11) DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sender_email` varchar(60) DEFAULT NULL,
  `sender_email_name` varchar(60) DEFAULT NULL,
  `email_description` longtext DEFAULT NULL,
  `email_configuration` text DEFAULT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `google_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `google_captcha_key` varchar(60) DEFAULT NULL,
  `currency_api_key` varchar(91) DEFAULT NULL,
  `registration` tinyint(1) NOT NULL DEFAULT 0,
  `strong_password` tinyint(1) NOT NULL DEFAULT 0,
  `identity_verification` tinyint(1) NOT NULL DEFAULT 0,
  `address_verification` tinyint(1) NOT NULL DEFAULT 0,
  `merchant_commission` decimal(11,2) DEFAULT 40.00,
  `merchant_profit` decimal(11,2) DEFAULT 0.00,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `session_expire` int(11) NOT NULL DEFAULT 10,
  `client_id` varchar(91) DEFAULT NULL COMMENT 'reloadly client id',
  `client_secret` varchar(191) DEFAULT NULL COMMENT 'reloadly client secret',
  `sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `twakto` varchar(91) DEFAULT NULL,
  `livechat` tinyint(1) NOT NULL DEFAULT 0,
  `PUBLIC_KEY` varchar(191) DEFAULT NULL,
  `SECRET_KEY` varchar(191) DEFAULT NULL,
  `ENCRYPTION_KEY` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `configures`
--

INSERT INTO `configures` (`id`, `site_title`, `time_zone`, `currency`, `currency_symbol`, `rate`, `theme`, `fraction_number`, `paginate`, `email_verification`, `email_notification`, `sms_verification`, `sms_notification`, `sender_email`, `sender_email_name`, `email_description`, `email_configuration`, `push_notification`, `google_captcha`, `google_captcha_key`, `currency_api_key`, `registration`, `strong_password`, `identity_verification`, `address_verification`, `merchant_commission`, `merchant_profit`, `maintenance`, `session_expire`, `client_id`, `client_secret`, `sandbox`, `created_at`, `updated_at`, `twakto`, `livechat`, `PUBLIC_KEY`, `SECRET_KEY`, `ENCRYPTION_KEY`) VALUES
(1, 'DetraCash', 'Europe/Berlin', 'EUR', '€', 0.90741787, NULL, 2, 20, 1, 1, 0, 0, 'detra@detracash.de', 'DetraCash', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"viewport\" content=\"width=device-width\">\r\n<style type=\"text/css\">\r\n    @media only screen and (min-width: 620px) {\r\n        * [lang=x-wrapper] h1 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n        }\r\n\r\n        * [lang=x-wrapper] h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * [lang=x-wrapper] h3 {\r\n        }\r\n\r\n        * [lang=x-layout__inner] p,\r\n        * [lang=x-layout__inner] ol,\r\n        * [lang=x-layout__inner] ul {\r\n        }\r\n\r\n        * div [lang=x-size-8] {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important\r\n        }\r\n\r\n        * div [lang=x-size-9] {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important\r\n        }\r\n\r\n        * div [lang=x-size-10] {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important\r\n        }\r\n\r\n        * div [lang=x-size-11] {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-12] {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important\r\n        }\r\n\r\n        * div [lang=x-size-13] {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-14] {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important\r\n        }\r\n\r\n        * div [lang=x-size-15] {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important\r\n        }\r\n\r\n        * div [lang=x-size-16] {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important\r\n        }\r\n\r\n        * div [lang=x-size-17] {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-18] {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important\r\n        }\r\n\r\n        * div [lang=x-size-20] {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        * div [lang=x-size-22] {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important\r\n        }\r\n\r\n        * div [lang=x-size-24] {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important\r\n        }\r\n\r\n        * div [lang=x-size-26] {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        * div [lang=x-size-28] {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important\r\n        }\r\n\r\n        * div [lang=x-size-30] {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important\r\n        }\r\n\r\n        * div [lang=x-size-32] {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important\r\n        }\r\n\r\n        * div [lang=x-size-34] {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-36] {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important\r\n        }\r\n\r\n        * div [lang=x-size-40] {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important\r\n        }\r\n\r\n        * div [lang=x-size-44] {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important\r\n        }\r\n\r\n        * div [lang=x-size-48] {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important\r\n        }\r\n\r\n        * div [lang=x-size-56] {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important\r\n        }\r\n\r\n        * div [lang=x-size-64] {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important\r\n        }\r\n    }\r\n</style>\r\n<style type=\"text/css\">\r\n    body {\r\n        margin: 0;\r\n        padding: 0;\r\n    }\r\n\r\n    table {\r\n        border-collapse: collapse;\r\n        table-layout: fixed;\r\n    }\r\n\r\n    * {\r\n        line-height: inherit;\r\n    }\r\n\r\n    [x-apple-data-detectors],\r\n    [href^=\"tel\"],\r\n    [href^=\"sms\"] {\r\n        color: inherit !important;\r\n        text-decoration: none !important;\r\n    }\r\n\r\n    .wrapper .footer__share-button a:hover,\r\n    .wrapper .footer__share-button a:focus {\r\n        color: #ffffff !important;\r\n    }\r\n\r\n    .btn a:hover,\r\n    .btn a:focus,\r\n    .footer__share-button a:hover,\r\n    .footer__share-button a:focus,\r\n    .email-footer__links a:hover,\r\n    .email-footer__links a:focus {\r\n        opacity: 0.8;\r\n    }\r\n\r\n    .preheader,\r\n    .header,\r\n    .layout,\r\n    .column {\r\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\r\n    }\r\n\r\n    .layout,\r\n    .header {\r\n        max-width: 400px !important;\r\n        -fallback-width: 95% !important;\r\n        width: calc(100% - 20px) !important;\r\n    }\r\n\r\n    div.preheader {\r\n        max-width: 360px !important;\r\n        -fallback-width: 90% !important;\r\n        width: calc(100% - 60px) !important;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        Float: none !important;\r\n    }\r\n\r\n    .column {\r\n        max-width: 400px !important;\r\n        width: 100% !important;\r\n    }\r\n\r\n    .fixed-width.has-border {\r\n        max-width: 402px !important;\r\n    }\r\n\r\n    .fixed-width.has-border .layout__inner {\r\n        box-sizing: border-box;\r\n    }\r\n\r\n    .snippet,\r\n    .webversion {\r\n        width: 50% !important;\r\n    }\r\n\r\n    .ie .btn {\r\n        width: 100%;\r\n    }\r\n\r\n    .ie .column,\r\n    [owa] .column,\r\n    .ie .gutter,\r\n    [owa] .gutter {\r\n        display: table-cell;\r\n        float: none !important;\r\n        vertical-align: top;\r\n    }\r\n\r\n    .ie div.preheader,\r\n    [owa] div.preheader,\r\n    .ie .email-footer,\r\n    [owa] .email-footer {\r\n        max-width: 560px !important;\r\n        width: 560px !important;\r\n    }\r\n\r\n    .ie .snippet,\r\n    [owa] .snippet,\r\n    .ie .webversion,\r\n    [owa] .webversion {\r\n        width: 280px !important;\r\n    }\r\n\r\n    .ie .header,\r\n    [owa] .header,\r\n    .ie .layout,\r\n    [owa] .layout,\r\n    .ie .one-col .column,\r\n    [owa] .one-col .column {\r\n        max-width: 600px !important;\r\n        width: 600px !important;\r\n    }\r\n\r\n    .ie .fixed-width.has-border,\r\n    [owa] .fixed-width.has-border,\r\n    .ie .has-gutter.has-border,\r\n    [owa] .has-gutter.has-border {\r\n        max-width: 602px !important;\r\n        width: 602px !important;\r\n    }\r\n\r\n    .ie .two-col .column,\r\n    [owa] .two-col .column {\r\n        width: 300px !important;\r\n    }\r\n\r\n    .ie .three-col .column,\r\n    [owa] .three-col .column,\r\n    .ie .narrow,\r\n    [owa] .narrow {\r\n        width: 200px !important;\r\n    }\r\n\r\n    .ie .wide,\r\n    [owa] .wide {\r\n        width: 400px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter .column,\r\n    [owa] .two-col.x_has-gutter .column {\r\n        width: 290px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter .column,\r\n    [owa] .three-col.x_has-gutter .column,\r\n    .ie .has-gutter .narrow,\r\n    [owa] .has-gutter .narrow {\r\n        width: 188px !important;\r\n    }\r\n\r\n    .ie .has-gutter .wide,\r\n    [owa] .has-gutter .wide {\r\n        width: 394px !important;\r\n    }\r\n\r\n    .ie .two-col.has-gutter.has-border .column,\r\n    [owa] .two-col.x_has-gutter.x_has-border .column {\r\n        width: 292px !important;\r\n    }\r\n\r\n    .ie .three-col.has-gutter.has-border .column,\r\n    [owa] .three-col.x_has-gutter.x_has-border .column,\r\n    .ie .has-gutter.has-border .narrow,\r\n    [owa] .has-gutter.x_has-border .narrow {\r\n        width: 190px !important;\r\n    }\r\n\r\n    .ie .has-gutter.has-border .wide,\r\n    [owa] .has-gutter.x_has-border .wide {\r\n        width: 396px !important;\r\n    }\r\n\r\n    .ie .fixed-width .layout__inner {\r\n        border-left: 0 none white !important;\r\n        border-right: 0 none white !important;\r\n    }\r\n\r\n    .ie .layout__edges {\r\n        display: none;\r\n    }\r\n\r\n    .mso .layout__edges {\r\n        font-size: 0;\r\n    }\r\n\r\n    .layout-fixed-width,\r\n    .mso .layout-full-width {\r\n        background-color: #ffffff;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n\r\n        .column,\r\n        .gutter {\r\n            display: table-cell;\r\n            Float: none !important;\r\n            vertical-align: top;\r\n        }\r\n\r\n        div.preheader,\r\n        .email-footer {\r\n            max-width: 560px !important;\r\n            width: 560px !important;\r\n        }\r\n\r\n        .snippet,\r\n        .webversion {\r\n            width: 280px !important;\r\n        }\r\n\r\n        .header,\r\n        .layout,\r\n        .one-col .column {\r\n            max-width: 600px !important;\r\n            width: 600px !important;\r\n        }\r\n\r\n        .fixed-width.has-border,\r\n        .fixed-width.ecxhas-border,\r\n        .has-gutter.has-border,\r\n        .has-gutter.ecxhas-border {\r\n            max-width: 602px !important;\r\n            width: 602px !important;\r\n        }\r\n\r\n        .two-col .column {\r\n            width: 300px !important;\r\n        }\r\n\r\n        .three-col .column,\r\n        .column.narrow {\r\n            width: 200px !important;\r\n        }\r\n\r\n        .column.wide {\r\n            width: 400px !important;\r\n        }\r\n\r\n        .two-col.has-gutter .column,\r\n        .two-col.ecxhas-gutter .column {\r\n            width: 290px !important;\r\n        }\r\n\r\n        .three-col.has-gutter .column,\r\n        .three-col.ecxhas-gutter .column,\r\n        .has-gutter .narrow {\r\n            width: 188px !important;\r\n        }\r\n\r\n        .has-gutter .wide {\r\n            width: 394px !important;\r\n        }\r\n\r\n        .two-col.has-gutter.has-border .column,\r\n        .two-col.ecxhas-gutter.ecxhas-border .column {\r\n            width: 292px !important;\r\n        }\r\n\r\n        .three-col.has-gutter.has-border .column,\r\n        .three-col.ecxhas-gutter.ecxhas-border .column,\r\n        .has-gutter.has-border .narrow,\r\n        .has-gutter.ecxhas-border .narrow {\r\n            width: 190px !important;\r\n        }\r\n\r\n        .has-gutter.has-border .wide,\r\n        .has-gutter.ecxhas-border .wide {\r\n            width: 396px !important;\r\n        }\r\n    }\r\n\r\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\r\n        .fblike {\r\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\r\n        }\r\n\r\n        .tweet {\r\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\r\n        }\r\n\r\n        .linkedinshare {\r\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\r\n        }\r\n\r\n        .forwardtoafriend {\r\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\r\n        }\r\n    }\r\n\r\n    @media (max-width: 321px) {\r\n        .fixed-width.has-border .layout__inner {\r\n            border-width: 1px 0 !important;\r\n        }\r\n\r\n        .layout,\r\n        .column {\r\n            min-width: 320px !important;\r\n            width: 320px !important;\r\n        }\r\n\r\n        .border {\r\n            display: none;\r\n        }\r\n    }\r\n\r\n    .mso div {\r\n        border: 0 none white !important;\r\n    }\r\n\r\n    .mso .w560 .divider {\r\n        margin-left: 260px !important;\r\n        margin-right: 260px !important;\r\n    }\r\n\r\n    .mso .w360 .divider {\r\n        margin-left: 160px !important;\r\n        margin-right: 160px !important;\r\n    }\r\n\r\n    .mso .w260 .divider {\r\n        margin-left: 110px !important;\r\n        margin-right: 110px !important;\r\n    }\r\n\r\n    .mso .w160 .divider {\r\n        margin-left: 60px !important;\r\n        margin-right: 60px !important;\r\n    }\r\n\r\n    .mso .w354 .divider {\r\n        margin-left: 157px !important;\r\n        margin-right: 157px !important;\r\n    }\r\n\r\n    .mso .w250 .divider {\r\n        margin-left: 105px !important;\r\n        margin-right: 105px !important;\r\n    }\r\n\r\n    .mso .w148 .divider {\r\n        margin-left: 54px !important;\r\n        margin-right: 54px !important;\r\n    }\r\n\r\n    .mso .font-avenir,\r\n    .mso .font-cabin,\r\n    .mso .font-open-sans,\r\n    .mso .font-ubuntu {\r\n        font-family: sans-serif !important;\r\n    }\r\n\r\n    .mso .font-bitter,\r\n    .mso .font-merriweather,\r\n    .mso .font-pt-serif {\r\n        font-family: Georgia, serif !important;\r\n    }\r\n\r\n    .mso .font-lato,\r\n    .mso .font-roboto {\r\n        font-family: Tahoma, sans-serif !important;\r\n    }\r\n\r\n    .mso .font-pt-sans {\r\n        font-family: \"Trebuchet MS\", sans-serif !important;\r\n    }\r\n\r\n    .mso .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper .size-8 {\r\n            font-size: 8px !important;\r\n            line-height: 14px !important;\r\n        }\r\n\r\n        .wrapper .size-9 {\r\n            font-size: 9px !important;\r\n            line-height: 16px !important;\r\n        }\r\n\r\n        .wrapper .size-10 {\r\n            font-size: 10px !important;\r\n            line-height: 18px !important;\r\n        }\r\n\r\n        .wrapper .size-11 {\r\n            font-size: 11px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-12 {\r\n            font-size: 12px !important;\r\n            line-height: 19px !important;\r\n        }\r\n\r\n        .wrapper .size-13 {\r\n            font-size: 13px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-14 {\r\n            font-size: 14px !important;\r\n            line-height: 21px !important;\r\n        }\r\n\r\n        .wrapper .size-15 {\r\n            font-size: 15px !important;\r\n            line-height: 23px !important;\r\n        }\r\n\r\n        .wrapper .size-16 {\r\n            font-size: 16px !important;\r\n            line-height: 24px !important;\r\n        }\r\n\r\n        .wrapper .size-17 {\r\n            font-size: 17px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-18 {\r\n            font-size: 18px !important;\r\n            line-height: 26px !important;\r\n        }\r\n\r\n        .wrapper .size-20 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important;\r\n        }\r\n\r\n        .wrapper .size-22 {\r\n            font-size: 22px !important;\r\n            line-height: 31px !important;\r\n        }\r\n\r\n        .wrapper .size-24 {\r\n            font-size: 24px !important;\r\n            line-height: 32px !important;\r\n        }\r\n\r\n        .wrapper .size-26 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important;\r\n        }\r\n\r\n        .wrapper .size-28 {\r\n            font-size: 28px !important;\r\n            line-height: 36px !important;\r\n        }\r\n\r\n        .wrapper .size-30 {\r\n            font-size: 30px !important;\r\n            line-height: 38px !important;\r\n        }\r\n\r\n        .wrapper .size-32 {\r\n            font-size: 32px !important;\r\n            line-height: 40px !important;\r\n        }\r\n\r\n        .wrapper .size-34 {\r\n            font-size: 34px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-36 {\r\n            font-size: 36px !important;\r\n            line-height: 43px !important;\r\n        }\r\n\r\n        .wrapper .size-40 {\r\n            font-size: 40px !important;\r\n            line-height: 47px !important;\r\n        }\r\n\r\n        .wrapper .size-44 {\r\n            font-size: 44px !important;\r\n            line-height: 50px !important;\r\n        }\r\n\r\n        .wrapper .size-48 {\r\n            font-size: 48px !important;\r\n            line-height: 54px !important;\r\n        }\r\n\r\n        .wrapper .size-56 {\r\n            font-size: 56px !important;\r\n            line-height: 60px !important;\r\n        }\r\n\r\n        .wrapper .size-64 {\r\n            font-size: 64px !important;\r\n            line-height: 63px !important;\r\n        }\r\n    }\r\n\r\n    .mso .size-8,\r\n    .ie .size-8 {\r\n        font-size: 8px !important;\r\n        line-height: 14px !important;\r\n    }\r\n\r\n    .mso .size-9,\r\n    .ie .size-9 {\r\n        font-size: 9px !important;\r\n        line-height: 16px !important;\r\n    }\r\n\r\n    .mso .size-10,\r\n    .ie .size-10 {\r\n        font-size: 10px !important;\r\n        line-height: 18px !important;\r\n    }\r\n\r\n    .mso .size-11,\r\n    .ie .size-11 {\r\n        font-size: 11px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-12,\r\n    .ie .size-12 {\r\n        font-size: 12px !important;\r\n        line-height: 19px !important;\r\n    }\r\n\r\n    .mso .size-13,\r\n    .ie .size-13 {\r\n        font-size: 13px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-14,\r\n    .ie .size-14 {\r\n        font-size: 14px !important;\r\n        line-height: 21px !important;\r\n    }\r\n\r\n    .mso .size-15,\r\n    .ie .size-15 {\r\n        font-size: 15px !important;\r\n        line-height: 23px !important;\r\n    }\r\n\r\n    .mso .size-16,\r\n    .ie .size-16 {\r\n        font-size: 16px !important;\r\n        line-height: 24px !important;\r\n    }\r\n\r\n    .mso .size-17,\r\n    .ie .size-17 {\r\n        font-size: 17px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-18,\r\n    .ie .size-18 {\r\n        font-size: 18px !important;\r\n        line-height: 26px !important;\r\n    }\r\n\r\n    .mso .size-20,\r\n    .ie .size-20 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important;\r\n    }\r\n\r\n    .mso .size-22,\r\n    .ie .size-22 {\r\n        font-size: 22px !important;\r\n        line-height: 31px !important;\r\n    }\r\n\r\n    .mso .size-24,\r\n    .ie .size-24 {\r\n        font-size: 24px !important;\r\n        line-height: 32px !important;\r\n    }\r\n\r\n    .mso .size-26,\r\n    .ie .size-26 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important;\r\n    }\r\n\r\n    .mso .size-28,\r\n    .ie .size-28 {\r\n        font-size: 28px !important;\r\n        line-height: 36px !important;\r\n    }\r\n\r\n    .mso .size-30,\r\n    .ie .size-30 {\r\n        font-size: 30px !important;\r\n        line-height: 38px !important;\r\n    }\r\n\r\n    .mso .size-32,\r\n    .ie .size-32 {\r\n        font-size: 32px !important;\r\n        line-height: 40px !important;\r\n    }\r\n\r\n    .mso .size-34,\r\n    .ie .size-34 {\r\n        font-size: 34px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-36,\r\n    .ie .size-36 {\r\n        font-size: 36px !important;\r\n        line-height: 43px !important;\r\n    }\r\n\r\n    .mso .size-40,\r\n    .ie .size-40 {\r\n        font-size: 40px !important;\r\n        line-height: 47px !important;\r\n    }\r\n\r\n    .mso .size-44,\r\n    .ie .size-44 {\r\n        font-size: 44px !important;\r\n        line-height: 50px !important;\r\n    }\r\n\r\n    .mso .size-48,\r\n    .ie .size-48 {\r\n        font-size: 48px !important;\r\n        line-height: 54px !important;\r\n    }\r\n\r\n    .mso .size-56,\r\n    .ie .size-56 {\r\n        font-size: 56px !important;\r\n        line-height: 60px !important;\r\n    }\r\n\r\n    .mso .size-64,\r\n    .ie .size-64 {\r\n        font-size: 64px !important;\r\n        line-height: 63px !important;\r\n    }\r\n\r\n    .footer__share-button p {\r\n        margin: 0;\r\n    }\r\n</style>\r\n\r\n<title></title>\r\n<!--[if !mso]><!-->\r\n<style type=\"text/css\">\r\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\r\n</style>\r\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\r\n<!--<![endif]-->\r\n<style type=\"text/css\">\r\n    body {\r\n        background-color: #f5f7fa\r\n    }\r\n\r\n    .mso h1 {\r\n    }\r\n\r\n    .mso h1 {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso h2 {\r\n    }\r\n\r\n    .mso h3 {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n    }\r\n\r\n    .mso .column,\r\n    .mso .column__background td {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .btn a {\r\n    }\r\n\r\n    .mso .btn a {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n    }\r\n\r\n    .mso .webversion,\r\n    .mso .snippet,\r\n    .mso .layout-email-footer td,\r\n    .mso .footer__share-button p {\r\n        font-family: sans-serif !important\r\n    }\r\n\r\n    .mso .logo {\r\n    }\r\n\r\n    .mso .logo {\r\n        font-family: Tahoma, sans-serif !important\r\n    }\r\n\r\n    .logo a:hover,\r\n    .logo a:focus {\r\n        color: #859bb1 !important\r\n    }\r\n\r\n    .mso .layout-has-border {\r\n        border-top: 1px solid #b1c1d8;\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .layout-has-bottom-border {\r\n        border-bottom: 1px solid #b1c1d8\r\n    }\r\n\r\n    .mso .border,\r\n    .ie .border {\r\n        background-color: #b1c1d8\r\n    }\r\n\r\n    @media only screen and (min-width: 620px) {\r\n        .wrapper h1 {\r\n        }\r\n\r\n        .wrapper h1 {\r\n            font-size: 26px !important;\r\n            line-height: 34px !important\r\n        }\r\n\r\n        .wrapper h2 {\r\n        }\r\n\r\n        .wrapper h2 {\r\n            font-size: 20px !important;\r\n            line-height: 28px !important\r\n        }\r\n\r\n        .wrapper h3 {\r\n        }\r\n\r\n        .column p,\r\n        .column ol,\r\n        .column ul {\r\n        }\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n    }\r\n\r\n    .mso h1,\r\n    .ie h1 {\r\n        font-size: 26px !important;\r\n        line-height: 34px !important\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n    }\r\n\r\n    .mso h2,\r\n    .ie h2 {\r\n        font-size: 20px !important;\r\n        line-height: 28px !important\r\n    }\r\n\r\n    .mso h3,\r\n    .ie h3 {\r\n    }\r\n\r\n    .mso .layout__inner p,\r\n    .ie .layout__inner p,\r\n    .mso .layout__inner ol,\r\n    .ie .layout__inner ol,\r\n    .mso .layout__inner ul,\r\n    .ie .layout__inner ul {\r\n    }\r\n</style>\r\n<meta name=\"robots\" content=\"noindex,nofollow\">\r\n\r\n<meta property=\"og:title\" content=\"Just One More Step\">\r\n\r\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\r\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\r\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            </h1><h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\"></h1><p style=\"margin-top: 0px; margin-bottom: 0px; font-style: normal; font-weight: normal; color: rgb(68, 168, 199); font-size: 36px; line-height: 43px; font-family: bitter, georgia, serif; text-align: center;\"> <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASAAAABaCAYAAAAYTYuTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nOy9d5QlV3Uv/Nv7nKpbN/TtMD09PXkkjQKSEEKAJJSQhAQiCyEUDcZgbGwBNsvh2cuf37feYr3Fs1legPmwjfEjmJxFUgQFlIWQhCQUR6PR5NDT4faNVefs/f1Rt3u6Z7rvrZ4gIXt+a5Wm1V3h1Klz9tlnh98mVcVhHMZhHMaLAX6xG3AYh3EY/31xWAAdxmEcxosG+2I34DAOY39x6nefYbbMRIwpQ4ICct/FR8iL2rDDyAyasgEddf2z/Oybjpr3w533iw0cWGZrmC0zmImZAAIsQA4AFARRiCjgFeIFcKL4+TnD7gV6n8P4b4I337zDDkR8lkLLAu1TReShQgoGUd2DRkBmtOrpyRvPHai82O19KeLUnzzPogaJAxpN4OmrVhx0wT4tgE74+XOcxIKA6Bg2xuUMo5yzccEgzBu2gWEmILTGRNaaPXdQDQHEUBUFoKoQURFNf26pcstJs+m8iwWVGGbk7nOWNA/2ixzGfw+86cYNK0wQ9PXmokI/ql9vxvGaja5ldzUZgVEkHlgcRVhR0LgnKK+bKJY+Mdlwj1VjiRsJdv7ydX0jL/Y7/K7gbT/49RrNl0IJI26JSNOLCAhExABByEAVSBIR5+z6Ry5efugE0Em/eI6l5dAcm/SF3gAWEU7u46YHRQAQELCpXsOOpsEe+UOIGJjXkUYAKdB0Do1CiLODcnNrqXB5ral31xBU7z2jeFgQHUYmvPW6pyJYUygEzUcfHNdlS4oBisxgAgIiGAIUAAHwUCQCiApaDqi2EtBgHscUl/x8Vx1X3nxGz2EhBODkbzyk2pdD0OGcOHGQQgm2ZnIPX7w6PthtmBZAr/jFc8weKNWqPt8TIiAGQdMv2oYCgNKs3xG6Y+oZRARSRSUW9A6t/PS2uvy/vzq757B6fBgd8fafPloQ7x6qFYrHFJmgUBARDBGoPRxnjsNUEwcUClFApixEqthRI/T0LV166zk921+EV/mdwhuvfUylnEPY4ZxKM24WywPxDWct7T0UbZj2ghlV5IzhnGGkB8EwwVJ6GCKEnP4+x3uOMMORM4wcMwwBiSqsAczk9j9dFSTPnXZvs3AoXuww/mvgkusfvyop5DZRIX8MAzBMiAwj5FTrYey7CBIAJsAQIWBCjhk5IhCAprYAkugFf5HfQaTzkjoeRWuivOkoow4I0wKIFcjx7E9piMDtw7Q/4H6jPSDy1qA3NGgkcbhpbGxgQJPPHshtXyo482eVv3yx2/BSwzuue/x9JuBP7mrKAAcWvQFPb7UWDCIEzCgFBCI57P3NDAWTPWSmkj0CSMAh8SGPC6L2fwtBgCVBjMrEzvefd7//vUP93BcLF982+qev/2X1w2F18yePvxflF7s9LxW8+bqnL3au9fdbhJetLliY7pdkAoFg6XD8W1aoKpj4oNt+pjC9EqgXMSD7QvrLQxug17ews7ntq6fft+z+e0/jp1/Axx8yXHL7SF9g+WR4N5BM7PjM7tDYRhAgCnDIPuR/JVzws2f6mvXJz1NveWhpSPun8XQAH/Q7/hdGugM6ZAJ7jwAS3U/ddv+hAKJciEWTYxgv9vzmhLvLPb89g16yMUNvumVrONTX0xdO7P7Mc651BUoRhnoj9MUYATAYWkQADnv+uqA+OvpDHR4YWhocfOEDAAQ9rAFlhBeBBGbnobr/ng8hL96qUCjk0Nq8MTLqhl+0Rhwg3nH71osbbnfrqR2bd4yX6Iol/XkMB4wAhFB96EohQkb1xW7n7zou+v5vvx0v6Tt3aXBAFsd5oVBA5XCkdEYQEVT0kNnMpgVQ6iknWNUXXEElYqyMDAo8uunld7/0DIR/cOuzD8FXfxhxiN7AICBuew7Tv4eGQihgFYcHfgdc8PNtw6MRXzYc8IE5PDqAwQgMH3eIbv9fDiIKNXzI4qamBVA7loJ3Er0oCWJhaDG+exQR4/gX4fEHBJHmibsSIG8Mipax9+IdMiIAYP9itO6lg0Jz7IdhYJCjQ7P1AtJxHlrTd4hu/18SqnrIzCJ7NCCkQV2VA3W37yeUGMvJYUkh/tSL8PgDQsgkRZP237xQBSUvWJNecnjDzza+dSvR6YPhoTcRK/CStTO+0BBVMGH8UN1/hgAC8CJpP1MoRQEqu7eff9p97iUVnGgIYTfho0yAO+wEmw+9ydjXe6OD527vBCJ9SY2vFxMiCjjZfKjuP8MG9MJ7wfaGtYzJ8SZyho55cVuyMNQTAXeSQKpw+RDkD6tAc+EdN+9c80gQlvv40G29gD0R0lFgXn4IH/OSwNtu3pLNE0gEy3TIIsenG/HQxceIqi7YSCo6z7EfjVFlLMl7DORrD53/q5eOMbqj8AGAdg4c+cNGoLnQ09jy3Op8CN3Pvb+iwzicY11lNv/tnQEmY1/HIqg34vsOVTtmTfKFyB8C4L1gIhHEULgZlxpO80z6rOlsF5kDobWY2DGC8qJyH4CXRNYykc7PCDDzPDlsetgbV/x859rHOMIxvH+6jwKIncekF7RmyHcGYDn1sPZYRthmbRAAhVzukOU2vRTwrhs2MAUBWBXdlkQiIOBDF8G/lwDKOAhU4ZzH7ijAacsW3VKrtW5t1Jux8yLMxIV8PgzUveqB0crFxSCHPptdtTbMaMYJlkU4C8C1C3udFwcNRzCdOA2moA7n/3Qz3/LWg0/s9FJFWce+1BsaEBZmASAALeexvZHg+KFFePVA33dEdTSOk6aqwjI4MNbGItgyOvKnj080UTCMliiMujWX3TXB3zlz0X/P70AKUg0rRCh2PFHh1SJOkqfP/+FTfMs7jz3o/bVf2xzxgnpUwFlDxQdjR3/PTh9nr4JEJAGkhoSjkI87dbB3uD7ZWPtsIoP9QTbzIhHAoliU0yvfen/845+emvudHyQu48wphmzFMy78wTp38yVrf+ff61DjiltGCpPOndWXCxcsfCaaMUo9JZw70P94T6n8WCPmv2214tEk9iLihRmwgVowwqF83i4uFs5Q5squrbvOaDWaZW02DtVr/c4jjfRTjolQ6nauMiBSDejQWOdmCSAS5Sw7psR7BD1lDJf7fn/9lu2ba5XJeqPRct95xyumJ9Ul1z31YLOn8MZiEL5/sWt8akIYpSxGRgIKJPBJ7TJD5mrsnzlpGqf+UgdCQ2VjUDIMiADiUfGxVO86j0cXer+Lr11nvXooKXzIsDkDK+i61XQgLF9cLo2PTzpWid/wk42SeBWByu0Xr5nzHV97w25WEO69aCBTH7zjfrAHBg3kZA14lBkxC0Z+8EpsXeh7TuHSe1CARZ+xiBQogeBU1aqg6T2N//BU7HeYfjmk09fXGcsyjboUBGCy5dBTiPDyJf3b2fS8cXT3ZLVabVRbjaZ87U2rpvvqfTc+xyawYMt/waG1YoBQ+O94siHfff2BaaEX/njzcBCGBWNtmUB9AsRQsCptN6CRH7+h96C7rt94q9owxCpDchxIQaRhaLRkyOwk1fFW7J783plRV34tVQVBM2TkKgQEUo0NKb/+mw/BOeD297xS3vzjp8NcLhoW0RObiS94QsEpYic66kR33nvJ2oezvBPN3Ha96cbny5uT+sTaogV1mFG1ZgvL16zCGhst2bR5S/UL566pz3fuu3+5MexvNf/hQa9/virKpgVpkuDp/ACOtoXg2tN7Fmw4OfMuXwhYl5UCHN87uf1/t5qTJ64TQQ5AixlrekLkTXF0gofOTOK4CScjN59X6Jgm8e4frWclQJmO8YYLJrQWIVmbY0zsHLsrKAXzM8t5hydsD9591PDVW0fqI7Va0mw5SOKcwCXiVR+G+BikgLEgtmuEgwEEAZyqE1UHYiE2DsxNEDtSFQM0bzgjmh7ob79fjkd19yUbmzs+bsSg1mrixOOOGTG+uOTbJ2UT5G+9J+5T8YUoZ20IWWublb9rucr5Nd/AtoZBwIATQW/AWBkV4XsHPl1r2U95J5Ufn1nIPOmu+MUIL9Wx+36l+uqhIHtqlojHjobi7acc81hlEm/cvXti57+/tj/zGHnXj5+IXOLxo3edmDkn79wbN0X50K4I2EYhc8EkzTNKgf+7usSDu+ImxloGloFEBEM5i+W5PCZyvdckTXzvR6/rPeA8qjfe6kr5nCmXkh2fSTBx6VMTDqFhkAoaOYvjgwBLCtHoOPV9vBbHt/nEs4K2X3vuwJwLzyU3rmOYINrdrNf6SkGH0AeP58YtjuoLj25NVjZo7KAmQljIRYVc7ozeQv7Mltv1P3ftirHRAEaB/oAxFPVgaxNX1p2/7f63rO5I/DZLAF100/OlzXF98uguAqjeirFk1Qosc2bRps3b6l9709qOH/Oy2zcWTH2iNhpFKGawSot4bK+GOPbIZcXdo5XmT89ZnHm1euP9ydBwbfe3b5vYde6RxRA5JhhiTKuQCjhViCpGE4dqrDh+cPU/Tjj55I2v653X6H3FT5+1yiw9rcruW4zpGzDppGE2WFm0gHRKYSGE6rGuPnueOO/QsDm8otSzOoDsBERaStJfrdxzQyyvXhLOPzQqjSZOPXYt6k0b5HI5qIuHNz/z1CY3kMewTWm6Ks0Whlcd8dg3Tih0dDu/7X5XivI2KobuRN664dY7JxpYHFlYYkSGEBCmGQinOjEtPKBoOcXOagOlVYNYKv1Lv39aMRPT4NW37bIjyUhijd2Hh2o+qCq2Vxu46NQTn27W+XXbto7u/PKZ2bTDheLMa5/iYqlULpaKUdHigtGxHV/dUI/Rl7MIOe0Xg5QgbU/iiMJP9UvssK3lsHL1MHqapUXfe21hwdo2ALz51lZ5W+3xCVAOi3MWIREsA2hbzUiBWBVOFS0RVFoOTCWcsqh45w7P75Q4Hv/J+ctmDbx33bSOwUE00lUACTZMMNb2BS9rTU6uUyWxhXKpbHDWraNjP1tZyKEcMAxj+h6iBK+CycTh+QnB6mVL/88vz170t/M94YBc3S0v0kx81wHwndetqn/knq1nPjxWuev4gu26DVNikKmhWAzPaEzSbci4DXvXXeNv2Lh7641UsHhFOQIRYWpsT8d3ExAgZbUaYsbiHDBR2/zXT7fsX190W7yIRcYjJfzg9UOznmkMwFGOjeZGlofc1zfDj6ldE3kVCTGW5mfrSIlntGyAXDFEJAmrAkSBUx/tXGEdBjtoBpF6wJh7f/Cagnv3I/Xys+vXbVq8uIj8jHc2RMgb7XvXg1XOAfjGKaVZ73TxXRMhG7N2cHLzHY/s0oHBXLqSH1uO2lSnaa/Rnq7D1E9MgAEhYEW+vwhM1PBoo7Lt6ofWfPDrryz8R5cOQSk0fTsbCmOzCR8ioFpvIli+CvD8jh0jE4dM+Jz/kycL5Vx4wRI/8aMnxiroCwwCw1jbE6U855g5rma1EkyABSGIAqzNWcjIKH7dGN39zvtWLP/haaUFbYXfeUc8/MTEM9tOLJfaMUx7KGinn05ACEKgQGQYPdYCSLCxNnbW5lq86+TlSz8A4Ivvuv45/v6b0nJFRArNaNMhVQBiYSAOzEub9a/8mvTil/fl20SFs/shHReMfg7QtxiYqGz9m7c8QB8dbWrPPWfta/SfNcI7aT17w6kidt7FPpvvfmO1/sDyhstEiMOatmVRnq4uhjaTkLz0lzsuadS337g0MghMSsVp5uALRvv/iQDL6XmBMTgy9ACqu21AwyCHy2/ePNs+Bi/EitDABlPXtY8sUAB7XxcywRIQWLA1CssqgVHkAw73Pnefaw2jlDNlAFhd3forWwiR5z0TYwqGEQVwLEltH2mmkyNXSWP7b0eZBvpDTilM2zSmU8m0PE8fTvUj01SbGMtyjLHxrV+44tfVc7v1B0l8foUMMsofOOfRtAW8dnHfR57fUXv6i6/pPWRG/D5X/9corz8aMQZly9PjxM7ol/n6BO3fGyJYZgSGsSoEgnjXlnfcPTGYtQ1X3hMvyzXWb1tVCKefzdTpO+yhoJ36fpYJMXMVAHhm4A8BRBDulnguChdZBDbY6gML9XLWEywXD4RmeuzON7+m2tKTCzE5srPQX4q+e84D+47BOQSQoptDVFQxGFrEXiWWbNQGP7pwbbymSE9WM7iMiICQCZFrXRoGpquB4N13bD+u4Ee/X1FGf2gQLDCZMTSM/pCxq1rHogJdT5ZDT4Krbnx+Wgh5cRBx+xWsOR9EgZAt4H1VxIuIw5dOGRbyrqvQVQVCa+rv/s344EOV1jGL83ZOo6IhhAELjO4b8UGN2uueb3ooG5QDg8hQ96DK+cCEgdCg3koQuvFbL79vfN6Ez3fftJG5PvFBmzUaDoqxhsNrjxoar1bdl7/4yuIh9SCSyqnbYoGxBj2BQY73Pz+SmLEoZ7C11kQvNW7Pel1vc+PPnvfAonB/qIvSyV+wBqUoOPKqe3fOohdgApNqYZK7U0MqEWyUr8La6KiCudVbg1LGVUMBhNagwIpGZfQSA6za+5y9BZCljrI9haiiaIwkopJhBzYNny9+tumke9BeW40db8SlwBCuuGX9vP30lpvXh4talX99tMUYPoBERiHGyrzF47snTjKW/4hCA2P3UNSK+pSecj/vPxdUAUsM55Kqdw7i0lSNWHRrt5gsSpOGR0uN2ocmKEA0zycLGTZgYqMy3fR33fgEA0CBeE1fwJm1kO4gLIosfrVpFAHrey+/a/ec3cUGaCXJBaWMAkhFEZsAse35wOdeZg85p1LB5Fb0WDp4eWlEGAwZj+wcP/4dd46c0+309901dvwD9fjkwYxOmzkf2T5yhlcyE2iGrEm3cRq1KIMAUiBX6uG8yofurgELcRhMIR8G0MkK+gv4yusfqM9aXGfdjVUtc3cBBCI4gSReEC9AAHEu/9NEJBP3GRMwGQsCy9yJw7cH8tYHmsm5q3PmgMl2jDXo1RbqhM+YwAyoIVx9wzoG2rETpMyGCgdrvlKbYF28h4hn8amtMFE85boIoIANepLacdSY/PjwPMyBlDa8YAjMM1gAtR2RnWM+xh5kbkAFYVWPgWd8JrQ0Z8QxG8IznpHL2JGtxGH1cB/Gxho3HMy2zoemcGk/5llHGGb0W0Vff/jNd96+q6OGq5Pj74G1CPZXG539XGGiWYottW1JWV6RjMFAfxj5xP3T4qLZrwWYAAzkDO7avPsciBua+bfZGhBzxjmsaHltxl5kIQKomiTbUytYt2sIForxxCHKhTzfNuziG54Kd9ca3x/Ih5lzWzpBFejJhXh+9y54ay5Sy1BDFgAoncWosQ4f/CQ1TTPmJdVSRCXoZo/rCRgP7BxdtcObeb1IloDNjSS994yd4xQvWhLyskPBTdoTBLh/6wiMpaErf7lv0qMllEYtYDMmf03EMQb7F//bl0/OzxvucTCx0xxcTRdIBfOiPOHGZ0eXBXb+5M73/nIntyarfzMYHpxlznA6bmcqO4bBnMV2KYqwJ8LqsHHy1phQOIBkYTEGR9ZHwRYXv/7+Kr/jt6kDbC8BlOWlBbE3YDYPOBHc93snZ5ZALS9uqRckGXbUeWtw/1gN1jCHdu5qHUXIJaO5AEVz8LKoFYQjQuAZpa8QE8MQ3nPD42wts7XM5hCQZRGIUx0rvbNmsKsJE/JNh7BDmosgNbQrdFaQwNS830hpbNTBhjBjKRro6cl9Mgz31bGSVvOCIptMzMwkDlu5D82qzOvKPZh45+0b7WbiQ9QvFitkHAh13m1YACk/VLAo7G9m7qx7AUb9KaoCnuH1YiYE1rjuqVeEwUILT9675du9RXtAPGFMilI+xBJDHwstc08B9q/WVWZP7GwGyFR9c6LiFkit60A4wtL2VobLVAHLjNAyB2ZuARQ2/DcHInPQCdSMDSHbtiE2dBLnQkRRGEah5cAe7A1LinSs0bRtTHQOi/EcIMpGXSqqkJm28/ZgNDOeuU+b0D2rvBPy1oADuswG+/aZEoYNslH/Np3ghCU9mKg2XpAKuiYIYDp4hw64XwLGonLhg5ffvnXOseRatff1Wj5w2vx2uzyoontVOAYB6pPjgm5VuAyjMNbEhlCHCge8HWREzNhar64lKHIMGxoUZhuEjJGsvZmIOicL8wg5EdRZH3GC4a4WPlIEiUypi/v01GXX/3btesNYkbFjZr5WtyuIgV4DLOstfqpSbZwXsmcFMYJ0D5w1ZzdTu9LgH1ECTy16Po2A745u52g68ERF/MxG74mba8eD0KxLFEDDe7R8Glg3dWVoDfozJhYbw9g91kBpjhxA9q0zAxN2f0VV1DxwXE/xsX87NjrkuXMXXfcUlxYNsJ1rJ6Bpzfm6F8TtfplCITDoyaiFh8aAvJ5qzdwbeavNC/OcJbO5C9o2HvWyQkQwk46cicA8t31u9j0IJArhlKjwQIe9ZcLuWozloRQMgJApnJ0NLzKQNS3Hi4pfYCWNG85fLZfe8PiTXvGGricTwTYcvGAQ0I17/znP9MfcZtDr1AoCEHtBtT1iDBEKASPocl1vzuLJSvOMVVHAASUMBRImGdfsXCrdoFAEbEBGAWVIO+BScJBc/UTwsYcTmdaALrnhAUZ78KvuFfulgvFYYJnwst5S0wbmMRFhUXWRNeXJerX5WNWfPBSaroORCWg1Y/T25vH7dzzHXzn7iOl3suSPy1JpV1WRABiv+X/aj7dfOIwFQAW716ImItgde/QGFsf3lcZh+OnEiVOohIajRmNi+Km6WbEog+XaEAHeLTPzRJewysmBOQi0yO0YHSeIvIhoW6e6+hdPcFDIMyObvVeJus6VzE1iAtdacOLXGsa6kHh2kJ94P5hFAKkColrdn0YlZJ9NPTxdHsQEdgKnOiDAPgLIGPnL/i72GCKgFnv0RDmszqUf3HtX3VJNSontFARHiIzBw6MVrF09vIaRbCRVmxC5UQHmWbwWDA+FZQsTwEHjUNrt0YOw/wdSA6RveYjZMwCJCcSMd9z6dATsiRCvxg4SBFjTE44HBFdpuf+RNOPvqaiAIDbKcRQU1hwZVB7d5hXdXOhMhJY6WKbIGJ7lOjfCq7JEQIsCBINKtXkduhBHHBQYCxUdmko5UVVMJh4mDLG6FFaKlrfvbPq/avr45+o9CJAwshzCvnUR3Lfrwih0kUFMhMnEwcwz0WJHy8xBMkADgELjb56+XC6/9ZnU/8PEbBiGsjqcDiKIEEkMG5hTDGF9yGa2ADLMmZL6vDI8aP+qmLLZ7FyWx0yLFtlbI3jPnc8NPFFjLO+jjqJZRVBJFC9fsWhDpdl6VStuCUA85JvPryMqDXQw6QgTBltNmJy9kjz/A6kBcQBDB5iePwNTFhxjAhaiaQ3oYBq1iKlNt5t2FBGB2YA4GFR1EBG0AFgRJKUSJhrNo6TVdJK0mj9+80l7B64/ds09OG372OR9awud99BEhKZ3MIbK1nAdM7ptrMGDQT5L6xWKAq47Z9EhK4w3C2QhnpYZJiQiUFWoFxT6+lCtt1aP1uvuuvOP2icO6fI713+vTP5vtyTyiUKuswQyRKg4h37MvQOqxASTUdaKKtxeNihCuvWaUrCI24ae9vdnZiZiGDb2hedgJlgjKBhztGEgMDM0oNNvfp5X5rKFXaYLhO6XWVyN3Z5PYniYLmYgRsAJYvXHO9UHZ/4lVH2zjwxsBwMgEWFnpY7TTzh+a22i+srPnzI4nal95S3rVqLeGEsKecyvNRPygSIy/N5Y6RMAixI5305knbIBmKw2KAX2NrCl90qfJQqZ8krMYfI6IDAb+HY7iZjJBOJAAwLCeByj6UKsHuxfTBOT8oML1nZMmqyAHziq5dAsGHQiClakq30YBGJmCPrL79zE4wGhN0O7RTxag5kk1UGBcIA4kYGQFNtqDQwV+jG8cnDp+PhE/LOzls2b6f/ts46Uq+/a9OnekclPxLlwHtGSQhVpfM88hsQRSxjI0FYG0PSCidijNeP3ITFyhlAM0pSRZpIsu+rerdP+pal/42bjxK5G6EMAS4x8yKcYAhuiPSODmWFN2zWXRTDup/BU0dS4leFcSSdmc29TUz6OP9FvOjfBJwkmexchmWyd/S+nDMwaPN88f+34GpP7yM6ksyYWGMLYZH2NFxXnvbSqFd5Ya2FbPca2RoJtjQQO3QO6mICWc9PXTB1b6wm2NRyqkxXnnJOpOxnD+73Jm+md8druazZgYlx2y6OsMHBe0ZiYHH5yMsGi3sH/WFIwJ3z/tUtHftZF+ADAV187LIuKsrnVxU9nAFQTgYgMz/Su0gJqz9Wd4thi4ckMpx4U3HTekMSVyqpnJjzWHvWyD+bL5RO+fmJx+8/OWta1X75+5srmcEnguvSLZWBHy8HP40FmdJ9aRIqxRoKlg2UcuajvlSvy0QnDQfCy4TA8eiAKjyqHfI2ZjLGu6SCAkAps25PM7WRlY21WHr19sL8ewBnX1okAZtoz0IkILo6P5Pky3mYiJTTar52q6MIcjKLqlGbvenaLrIg6eQpUMZEkeMPaxZX6aHMf+xEAtKz93ljc+uyK3PydaJkxVm1gcZhyr6h4ee2Svo9NiowHQWDLPX2lZNvWT20EozCvTUQx0XA4be0yOBP9fb1Rj1tOYwd2zUYcw7n4669dJVfd9cy0QdgY67AfFTTEC0adwLUlthcB6glyUWpXIiUoID8871i54oZHrnlN0Xwwrkz8HHBz9tF8IMGg6eLFFAB5SwisrcwMemPmjG5ETakdvL5gAggAyiV79Rk9PR+oVeo/bTWrI0B/pusuvfU5Zk/otnR4BfoCg/kCLQTdp1/TefQUyhBn39lq1R+59rwjZ82PN9+87mvFUs/2l7UaBUqSr/o4QUiE37/9abaGQMRiDWX2eE+BkPLA70r89CcsBhblBVAuBwyEJCcxUmE4QwABUBSYugggVQgzALNlf0IDFlr42XvhmQP2ktufKdUTRZCf/+ECQS0OgTj8Y0ZzzqWmFbudKxJBDMxLJMYgNJIEYsOQvRcjwk0v/27JQcRLM25wAfhUt6AdJwvJ8UQAACAASURBVApnc+snm61/TlyMOHGSCETUiyCRK+9ex5TqhgIAVuSohSSFEoBGnKCai3DiUN+3XBwjEXKVphsXH3+4UUusgROSPc5Y5/F9L8m3NGm5m952Smaz1u/dvZ0l4YgzROq1t6fNmZ42IpTndHPPAa+MxMu6rG07GPCS/+wk/LduOb0/zip8AMBYY2t1Ameguw+ZMB8bfNGnRPGd5LtzgsVDJfhGfFPS2pdf4roL11befPOGa4213NOMj6w5gRrgP889Rv7wjnVpueXEr1wAESUIilrs4Ip5nL20/xaXJE5UXXVydO1vG3TMcMCZqpowAQyZ3mVOCyDDDJMl07stgCybkf2p4J3dhquAEsTr6EwdJbTBil3qMNBFSNbDIoyXm9R5C+zLAvKDtxwjf/SjR/G8Yp9SytNtJUJTBGRM2cU6Ks6JeteEJqycSNJxtz/7Pi3npVFr1OGaNnGxxCLuu2fPIvme/pmgQwsRQInzkDCPkwZLW8da/gPOOySi8JK4QYPBnc0mFCI/uvDl08+oifvWjW8/ZcGVEheVCic9vnts3uTXmVAovPezMoRJNcz0bqpwRGgl/omFtvFAcO2FS/5zoddceut6LufCN+wiRk+G870qvnbG3CR7/awYU6DT9kKhCEODyarE8235rrtwjQCQd97w7D8aAyTttcerCokyOT+0EAGUOA8NI5ww2LdhtGne5eJYhBSO8ueuovqPRoVQyhAL5RUQmO2qEILuEUBMGbN/97go9yv3nAgsGVVwpxYG2DzztSLwKXXDGML8Wyf1CjsQodlqNKWTx81iqxcsm+/FmRR1URgblD2ZUfGQr553ggCQK25+iCVI41SycDsRiMUDPhH5+llHd5z4ROwyy2kRjDjBK1YOjoxO1F7Wak02ST2LiPzo3JfJ22585AM/eeM+3ixc/7aFCZ8P3rOd+/rKR0bjY/9rIme6TrQ00ILgnHczvxRnNXyqwjPBHcKqnAcDl/78WS4Vi8fnJ0Y/53Od2AVTKDo7LnKBVkRR7rS2MzEq1RaEFD+56OiOA+WHFx01xVaaCiBRGIEocWZKWkBRiQXHrRoaHxuPX+Vb41VWYZBAYW6iFn+sEvpPFTPEpzgBEsXjU/8/QwMiNml8T9ebTLGk7U9WlBG/rEWcIdmPQKRInJu1BUOr+fqC6Sz6GiI4tTcCxyrcKfGV/EbXQQAZYtS8wBhbBvHsYAAFIMKbRNCNsogAWEYJCjjvukqWhRDDqXPYXFyEI8frR7ealer3X3e0YIb0+skbTzqgBM733f489/X1RcODi1bZ+uQfXztRf/sR5aCr9VFEUDQhVHRkZs5R5hC7qWKO0ENWlfNAcemtz0e5qNBnJyr/cC/MqtW2c1gIkNrlBoL5NecgME8noq/eh1luBvLWYP3oGFb39AwBCys4QGARAatSnDWi33tBk/OoTPijWvVahVwCFnGWFWTAyOf+ZbmrfKouFlGXid029djU1zUj6ZegqDXqx+a6rVACxNagFITrFqLC7Xkbd2SYMZSYVJE4z6TKV976CANAX92/N9dxmRE0E4PjBqLtPT35MJ8Lww/dunFO0RwwdU5xIYV1DkI4LhUKe/nHVdE1OVXS/V/IuccMp3kRnU4HAKJsfngSwTOOcdGinguda1bawueA8Z6bn+A/umtT+Oe/3j24atnSNSsGo8uue/KxJ27aPvLnR/R0Fz5AKkTb6bWz2pR5yAjgrAETb1jwCxxivP2mZ0tX3bV9sLeY+/Bvx3ZsW2fozaujLm7ZNohon3CMmYipeEPspaP+S8wYcC3UCmbLO3+5eUF17tULfOIlaDXP6EA5PvMK7KgmWLN8yT82W41x5zwasch33nCUfOOCtaKJxzdevzoeNvl1TclW+VfRTvlR3VP+2FAaOdt1erRt1KrCtB9JUTn1R5ssTlgRuFwORLSRCGIDi6vv3cKbDWy5o/0HiBkIi/aX/ZaWNZuFceMo/MM7d7hWHLvEJeLVMwWW+xQV3+kViBE6D7Z4ORF9Z+ap33rDK+Xq256xIgLmDl+y3V+GtWAJWXoYRNyNDggA0PIeK/oHENeq93p3cJgqPnjnc4XhJUN9i/vKfbRp612/qoz1sQUG8wVY5jYVejZMaT6ztJ4FLlpEBy3u84Dw1hueCm0QhIUwHFgDvX1TUlvjnGJJPo+wnTqRtV86CSATFb8yOVH/f4bUdOyrfM5i59ZdOHrZsq9cese2K7939tJMQcTifdtmwE4zdK2IQHsKaFbqnxWXIHEq17/5qOkLxYtc/fNN3IP8tQ2p/eW8NJgz0A6lE1V1M71gYoj8VBhQ93Gi+xWwWwaO35llfVdCK2fgRaqAijHMxhhuUaqtzd9CwkCOsf6ZrZflFZcZAGULSQzqrZDqToJYNHAKiHB0ZLnrqCEwc9jOVp/1xVRVMtWeTit1ltMKCt2HqdFkbRaWwobzOHGwpzK6a3f9u6877oAm6u/d8kS4qG+gvLS3/5JWo/L5ykgF6xsJRrzAekbRLqx6qVdFyBYpGdbMfXDWLRjAIoDqUPeTDx3eduO6sFQqRIvC3Pt7i/wJQ0m8qeHLY3FKAl+06eKTWfiooieYfwFuJPF62/LQvO24XWU26DWCzSPjlw6WCh8H8Ei2BrTznIniLOEQiVcs6ynCtZKtEOXrL1ozS9B9601Hy5U3Pc/OBr9OskcWWeytAakKEu96pwi3O0EBkCrvjxE6J3Rkd5bndPXMRxYiHqSaxgxYY207cnheEKFgCY/vmkRjRgIwgFL7mEZPLkBEGdYBhVPoPqWru1fDSCFEMIZ3GiLO4jkk1u45eaqoeoN6I/n4V89YeUDC56pbngoHSuVLhiP+TGVspHDXeAwbWpQsobcdLL/gxUYVhhhMjFkCKCvXFwEsgDV8yOqSd8Obb1pvFxVyVy0p8kcacev4B0YkyoUmKoVmAQ762RBVEPG8DoBvnrtM/uD6iXXPeV070GEVUgD5wGK0UsUxiwvfvfzubS//9hlLuzoWSAGowLBflmUstpxHby7/8DdOL8tbfzG3P0C8wJGvZxFokhLv7ZS9bUAQgVG3qpsAagfXgqCO92MLVgENzef2ngkniqHQtm1xysyMkKicMkx0voFo+nH6w85HiCxKKOBVOKU0mA1V2UcozdkeIpDhzSYDCTgAcAYXmKrAhxF83Lw2wy3nxXtuX1ca6u3/m8jVPveN9buGftXQ0uJiiP6AEVIWhvD5wUzgNPlozy+JMhBh7UGUCxdk4zhYuOSWLWsWl4ofLlL1c9dvGj3lWeVoSTFAX5tJ4UD6hYjc1Xdsn3coSFT+4HjcPU5QQVhaCnD/xt3HBGzem+XZ3N5BKOuyLOEQTaeYTJJvvuXWTfO299tvOkKUkMmrJqpIvDzXtgHtmQ83nL1SdI54mb3hFSimpUpGFuoFu/SXm/khpo45RNPPgWJRYKYMsgwQSPww0fwkWjNBaAc9dTiyQeG9j0VEvnrhsbO3YAJ2opm8VpRG4Wf0cHU3QsdesLwcglQ2ZLjhnLj6jucGlpT7L75x/db/9es6DawtBejJVJagO1QV+UIAw4Zn8Q0RjbssmiMRrFcUIvuaA2zKgvHWX2xZVvTJn9y7Y+en1rWCwrE9acmjg9EvXhQmsDs7+Rm+ct7y25axR6OjgTIFM2NJADw5Uf/CZXdtP67b+cYwTLtsT3commoRN+OboIpONK5hGG7IZLgkgqoGqiI6xUG8EEzl0al65gUWrC/mc2Gk2tEIl0KQKGFRGExLSAKQxPEaAHjBcuhUEFuG9/SbuR6qgGR1maevrZnc0ArE3bSERIHlUTGTCWouXHHbs7bcSD75/c07vnrs4hL6bFqG8EAn2BSmFoq9ixyIiPhMuYCEyDqEmrz/IDUpE95040a7tLbrjod966+P74vQY6Zac3CwZwHt/H2XRf2vf67huy6UCiDKWfT7CnYVC0/83n07O2qMxjC+dN6RYpChNoT3aIV55Jgepy42X1Gx3eeCIPEGibj7pkwaszmhsScjuxumNIyFoDcXLjNEoK7pYNQmiOd2LAgAYrHWNNGtmNrBhBDEGjCZ9TxH8pNOczl3RtvtGKoqvnhud1e5ejc8DwvtjHMUhUKwoJihmcgr/emDTt5/fDEV8gdrgs2EeMXeEvKrpw+7IVVkcdlYAFX1L6gNqLdV++wjYXTkEaGZKn100CGi3G2eTXp350mRYMJlSs1EMYpQ27wJYU/h9666b+e8Vu6pcbwDUu4Wx08gtEIDFXGA4kfnLZ937BIhE8c0ESAirDqXABI3nIVeIg1W1Ox15dpoTlauYubugkuBlip6o9yTDLAqiSrQasXLNGORuCkKnAM5BOky0UpcrHMROClKXju3R9HOcCY8mtVXkuUsgSIIjXDGmKGZeP9dm4/cljQ/U84ZRPsVzNUdIkCUt3NSi/T7bAIoCAy2bq3i4nvHXxCd990/e/bS0Rw+1B+aDjQtBwavCiXqGt397devihOXO29HpQWfJceKGYtDxsbR0c8HgSm86/a5bTbcXtmycP46VQzkDIi0qxRM4mRNtm0dANUwVST21YCibiuqQNOyrMz1+Vjd5kNQq/x+znLXbYOibawCPzgVa/Qfpx4pIlLIQuXBACqxw9gBHqOtBFUvaNSqo//x6qF95wxxJjs8ARDFeGZnbYbYFy8Ka+yGTOVV9kKuVvvcDrEoH8RqInOB2gXxZC9lv88qslRzYmI0GjVYQy+IK76P65+aJIPifpSfyXx+6sVtZnnCtRcdddur8/be7S3JlO4TBRY7RysIc8HHw9zcInRqfmeRr04Ui3IGzN0LVqimc7MzFJLufrYqAaKQvVQ17bow6bQAoqrJ5tQBALzlpmfYxLK2UMxoMwGhGctdIgpo242b4SOoKlognDZYml5lRSGJou4UsRONE0EzEWm2ScCEkNo8DcEaIhtZLoVMhWrix9cYG8FjZM6HEUXZrDqpRrAA50/X6elUoTAPL3SP8IE7t5z8fCu5aHkpWvAkIwCxSBqg2SXrQFRRsAxVyKdPnp14KazbRTHc/XkE5gSlUuF0AAfk7euG9/zi+bc+p2bF0H5kOBJScrCQGaZLv6Trvoxn/WytsPD7fc3Jp2qme/kpJcLKHGNLs/HRoZz95BV3bt76rbNWzDmWuqdcKbwqFluDWuy62lsoU/JiKoCYUE1/1tlGaFXlbrOEppZnlQWVES9GueFH1SJLWVGFwGsAo3QbBPzvr52KvKRmt37zIpj0QM+qFSfk+gZXa660vMm5pXUNVjfUHtVQe2xLzStaYl5TT/CaSsu/ZrSevGZXNX7Fjlpyws6mf9mOhI7YpeHyJCy8jIWP+s8zls1XDnjACWU2BGcVQDKDQnU+JAp4xmMLtohVax8Zz4WZq5LugaLmBJYZ+QxxAk4UBRvs3Fv7AQABtvoM7WZSGAWWFvCp9zzUPKTbsFJz4gsUhpmI0mZDUXWCQptjvJtl14vCe3086+L99fNXPl2K9f8bdz5TyEg+tNiyZTc4F1ycCwNcffuG2XO8HYmfiHTZVqWlWXKGx80Uj+s8eN/Pn8smCzSN8RERaYdC79Xfqsu6GT/T0xSiwkTZqzcUWslHhnMZ4+pF4KIeJLHf7mYUH7NhsJ6rTUgHOldql4AcqzQ5cnHVulg0bjUl8fEXz15zUMP6iVmIsuW/pBdkOy3xUuqcNS7wEkCUfpP94cCVt2+0E9p8/xJbWJDYSg2Ggk2TCd758jUbqhOj6x4dbV7Q28FQQkTwKqF4AfaiLUkQ3J2InIJurGbE6LOEm7aNrXlt/+IygHlpUQ8Ev//LLaXfwA4fkS2daxoCBcTjqTGHNxy/5q/s2Jb/sb5Jg4VO5eOIEDAGOpUb3xvfu/iEj1z500c/tN0aO9BFCxJiLA0FFeXP9jD/G/He0ftTzZiKa58/o8ApwKCdhgnSScJQGiTTdYUVIMkFCIzdqkirv+zVCdQ1DkhEULI5WDY7s5ofLr9zc1hp1f5moEMI+kwkXrFsUQFexMXOT28LRTTsZgOa6lJSFXgV9T7+3Okrm//3IAsfAACzo+xeuYzm8ywFIglMCuddYSETxjp/1kYNu2YsT0EVUPHYXmvgyWaEM9YsefnWZvIqX5k8suOARFoDTjW4zc+RfKu5wrfjjIQjQRhAt25BVKYrsrV64TCt6t/nrM2uyUIh4rG50sSzvojzVvYfnTTr/xLHfrBbv7QEENU7ArMw54GWelZO1htIMrB+hUGA3Tt2wqsWdJ5J2nSCjpXeJd1NJKDH2+k0855KAOJWfHw3Vgi0gyC9iG07ePYSQKpdt4Y0lf2tyiajB2YR6SUbOavar2g64PjeEKIqMmMAq7Eb00d3aJ8qElGEQbgMYHjtLlT3GyLDLqtYIXCG+EIA08l6nc6AUwsGP72Q0my+3nhPOchm4yBVVJoxnlbgNatW/Z8Lh6M//sIrFz/2xRP7Rw2z7braEcF7lcTta272AT8cazbDqgJYlA/QGB3/1488qaWuF+wHSq71/kKW5DsArMDuagubA4tXDA1eeWaJrv7S6cvXfelVQ3UCdd06p0Gwai0D7791faYBcfkvnuZvnbtm+7H54nueqiVdVSfLjLjuIEb/kJjxnjvW7blkujhBl/el9BxDiKhLBCaBYK11mdgA0sHNUzmne5Vm5kx1wdJzCVlKFf/hr3eUTKvyzXKYsYSyKKps0JMrfCPxzn35rD2xBzFoY7dYAyaCE0U+NBeCjRDtP8F7VxBxlhggII1t5oxsXE3fMei0fV+Cem0uJILH5/D+coYWsCqeb8R41aohvH24/+eJa32umTT+8w/uSyeMd1LKsun3IuySfbeoPzxnRbWehnJkancxF+CRTSMolemtmS7IiGvu3sofun8nP5jwYE+WgS+Cdc0Yxy0buO3scvGLIu4HLmn+4H13phO8pZJBe1UAGhooB1losQBYVVx22zPsQ/7eqUXFZLekTyIE5JHP569mY2BmliWZHi+aZccEUeycJlaZB5y6Oo/oGpajCmctmLmKVJGJZwsgcDlTcjfSALOgi871pw/vinrU/e8HmozejPRlooA1Fg2Hf3WgWV65/zxtuErUuTOICOwFRUrem4ui0NqM+779gKpG0mVLSEg/ZGCw2FjLH7h9Q9f2JJIhyFOBxHubNXD07Tc/yxs8EHb5wATFrobDWct6oTb8s0rTv6vZqG/9wmlrml86LSU/F9Wo80RLCeWdl63zVX9YlCgyLZlI6YLhWjCNiW9+7CmXhfFhXlxz547wz+/eYf/6ni1hPrI2nwtK28jMS8s7DRWMJsA5S8pV5+jPJiqtP5M4cS7R2LV1bDeVKDn/TVIvkOgIk2KKj+fDdz3fcR59/YJjhb3Ht845ohkjd832lkc34R1ZYNzrKal7d8/tlQgfvGuT9drZeaJIY5Zi73+r0I7VeomAABjqLnsV3hCYqKmpAKrPfnHqHh+WRi8SAstciHL2Y/c+N+eE+uhjY2GRzR9tGBn9aDlnM1vcnAr68hFaiTz8uZN69mmPnzaezQMCCiR4qhIP95W5lMuF2Yib9wPifZ+nztZEAtIwaNJTc1Fkc7lcVwGUIRMVygRVirNuwZi5L0z16o7nJV7gKYQ3hVdMVqv//rlXLa186cwj9m5Sl3GiKaG8yFPznbHa6/p6xgqwCsJgweLmdSNgyIf/6MHJBXvEPnTvGF/zqwnblwvfW4gCW8gHYRAaDlVOzFLVoe4E5XwBu2u6vNloPua81n0CfPn1R8vXzl+bVh3NwCPhxSI0ZqtlwDLkw3est94LX3PHxpM/dPfmed9rOsjP8H/0sUe3D58zhPXjdXBKJzP9+8+fsVoACpMu3ts0el/hnNsg6vHDeRgXrvnF02yYwdy90qoi5V9XSuMgFXvFARG609V4VUQmxJJFQbkeDkguCMO/enhXXG3FsYDEhEEYhblVy/p6Vlz368c+E5RK6FuAd8E5j97B8rS7cG+k5Xo76xylgHD99km8ZkVxOMyF9b/41U7+p9cMHXwjNLHr6ggkRaSKZr15fn9fvuBaJfzxXVukJdZ9+ewl8u5fbCp/9/UrKzMvmUwI3KkenyhcZJEzdvNk1jLOzp2sSl00K8VYS3DeUSse3l0ff/zfXrVsTkGj6GYrTAe3itq53PAAMB7kPlFL9Au9GeMBmA2WcAvfXb/x4+9eueqmP3m49sC/nlzs2PnX3DPC+Xze2lwY5YrFFUUblH61ffMXzlk++B3j67bpNW5O1t/WPRpcMdIgrC3Yy79+5nCl03mdB/p0KoJFO6WRDbN4gi0Xv4SELv+TX+9Y51p1wDt84ew9aTtfOz9NhP72OWviK254/NObPP35kk5imBm58SZoOG+ZSP74nuf5869d3a68S9M5nfNNpTQ2jkCUphDN+xgC0pLi3bd0ThWDoWkvgiTYe/GeTKgUdGXVTtXMxXm8uq+H1hbKPatK5f5lAwODKxYvWrSmP7BXbdmx8bdfffiZG/t6FyZ80gkAnNjf81PQ3GTOJzmM1LrcUI3FktHtGPf4gA0DDsIwE6/wn967k695cNx++JGq/cP7dw1e82Cl40pLRBly5xgDOcKnnxlFMcSqQrlge/r6o7BUslfdtXtgIPbXX3779lnbiq576TZfsiokKy2cc8mKbmkszis4NGjBX9kpxLuecF936x8gqvP2jynkvxcmfr7qNPtAAdggxEmBw/VPP3vfYG9x7Ud/Uxuc69y/eHCC/+7xVmlocGCot6+4qrdMZ/1my+O//eFTj96HviJ6evLWhJa9qqhPTuyWQpAkgqHBPALgx1fdumHON7/y1k1cSxhZuK6896IK+aczjhRPkH85e3V8z7MbTn601XzKBNGwDUP7hbOPlg/du57/5N7n5rgjdXVkEghkEhBhcO9SW6o61HTo2lYvgHj3pHaplqMqUGqd0q2uMhHBt/9tb8FmxwFZpFUeOqGQy6HVGMP/vX3023vdHrYtVVsaYnU+LTq2oHgTL/A9RUDxd4lLHLBv8alKIfhi7PWvO+17iAiLizn85MHNf3jhESs+acOw+hcP7Az/6dVD+3jEPnjb80zWwuRCDgv5iMNCyRgKH0vGnj+eC/kP3jsSf+H0wTk/gI/jtYHtbmJSDnB8cwJPbC/ds3px78tbKFTKTmXjrmc2NRatRI+Y+pW3b+Jvvi5VczljsqYge3AjMbtuokpUkOceNBqNjVMx83Mhi722nT0dzmev+8kFK8YvuPGJlJ5iAekkoTFYVVbc/8wTTx1f7sf/fL74bhbcDwCGwIEBr1zeG3rnL2hs3PaxByarRyJkFIMChiTGqkIAMYAjlQQKIap368JYBcuiIhD7mMgw5tglT1Uc7QaCwnlJWdkxpT0AS0p51BqTuHeksuXVRy15z4cf2n5dEOWrBMg1v97EsRdpwSJWU6gn8qFi2CmGZ7pVYCKQIZk1X4hcFltvW1sTNp1srum7q1I9y2z308nlqT1q1uyZoO5cPWlek6K+T3GH9AMQEaIsCadzoOE8jlvSi0aCjf98TG7uORjlr69Xa39N6LxvD6yFNmvYsXPnU729/SttGNY/9qsdVeecQEVElMEGQSHHFARhEOUj8sllPWObP7vJteKwOACyAducn3PAAWlWcxYFRAkYCA2e2z4Knqg8CgAq0pxMGH2FADaxEJ8O7LfduqFQY0JXf3OqP3O2rB4A6FQeZOoUBRPDie9INme6qtsKJxYCbOhkaMg38M+7WT86vKAKeSnj5UQsWF+vYeWuTd8NMXvoW0rH51gjQQ0KdoqCJVhiLAkNJpuNpnPOOlHRLJx0pDBgkCFm9nPnWBmTEn11lAtp+AQJtk7tYae6hzhNb8mHQFyf+GoOOeR6et6mRu9tJYkzHpJjg96JsTseCwP0ZuwzSsnw8PlTV8uMX0o2VonUZd4p8J3a2y9nZI3pwnKRVoW1bVa0tP2zBFBCQCfTQ/qo9KU67dX2Q/aAoBhrCs4Y7L2tkmg8311i1QcDJ/C5Lj5MIvRa4MHdFZxrcUc5Kn8rKRS+kLik4n1qmTDGsoqcKEn1I9ScPKnuakMPjDd5u5Po1MURSvnQ1iaT+eOIiDIRgQMpDYIkCR5qtAAAhjjKs0VfLqgICK099+QMCXmQwMDwQmKLtGukXZpm42FswJYN//l9W9ynT9uXgqHmCdSlMmqabU2jHZ9ZKH1SW7WPSlZ/9Az0hhZOBU+P1ZHsNZkMpYRb1hBK4RSlrMILISE8Rs6Jd15EhXnvMO05QKD/v71rDZLrqM7fOd33zp3Z0b60ltZ6y8gP2Uj4KV5+QiDBgF0QIASHVKXAIQ6VpCiKBBeVSvKDFJVKiqR4GWxjoGxsY/wAGxMb7DjGduFH+RVhGyGEEbKsklarfc7M7dt9Tn7cGe2utDtzd7XGpLJf1VTt7vTe7tu37+nT5/EdOBVUrWHMUUqCmStOOmtBCkbmwwhL7h5sHVG7CRgCY0WF8JtDNThk2BaZq2PLw5GqCCBBg9tZq2+tTOPJ6tSbUp4UPPOvqPgO7Jy5r9mAgLnSkHJQ0w5kUKUCafslptyR1PzMFEDzIKRaiJBpBxFBiMqoga+cdDUHzM6rdPu5a8befvdzCNr5KGCMQR8JfrRnaMN5K/XTPcu7NwjRiFdpAABpsKE2ufUXE8Pn755Q9JcsyuUIvXWP4xJGYDDa1bKfR517Re5O7mulLxAwkgkqxuybgIdqHrBHTNZ3yvhXQGKDvGpN0aVItU7HNQahEVKUK/1bKXPbDZnKJx7f5z5/zqC7/KFfs1iLa9+wWmqeOtupACjUtlspd7597Z4P/uA5HFJF1wJ4jSwRulob4fR7o1l/RADBC56zIhDJa9+IdnjBmv0M1Rro7evuB6KRv350KE4z9V89dyrJlogqTqhtRdMWMu9hg7YEkABAj2BkH6FXFVgWx1Aonho6NNgIMpW0S4y+OEJCBU0bsNvglwAAEWBJREFUSlBF4wunznTAqKLSiRQud70bQDFx8znr5taAQLmWVdAWIIdJ+fLPDAE0zIRBzM9us1iouYCT1w9CFS985eRKWyWgJ6aRcdHeqMNb0HrpB6sRnhkdQf3A8AfTad9HTIgNoWIirG2eeQiKoIRqyUyMe3CYK5AFgIKKhrIcxvT3LI8n4x0MxWGnn6I6TtQ+VbwZiWAMZuXbmRU22k3etc3+sczIGg7LSnSdJMsuMs4LpWI//tQh7itX3zRK4QGgOBFdgT0CtRB9biSVT1cTs6B1R0f9MPdgvGGQ8C6V3N4IMDuyj3rN2vIplwzjl2MT2LS8571ROfk6ImXJyF7+2EiSSHaKM/SEiYwUmhbNPbky7XcAIE97fYze1r0QCMsig6qdqXFxQeGjqhBEYMOz588VSDqn6QOcuydAlT20iF+imUlBTRvQkZHQv022welQxQEn2HBczyeddia3DrZ62UgBvtwWCISKNegvRzh+2megZNEdGcSMwzIZAnhWgKPtBGC2VIIWTBTvyOaWTx2gCMIIhBcIgm+ft76lAbmiZP9E4KJFDCWyTzML2k2bEuH4hPH1Z35zahSZszMu9Tds0uuUTjrQCPdVyknysWcOWu7kbUa+lkBkO7X7/iUnXlmbcIWM7scEEWS5OPy5iCA/hhO4q3RbJ+5lJcbGkuChfQe/pByd4Nj2exsNZJk/31VKj0axtdYARewqlBOScct72Vo9TKgeKcAIC+UxByAB6UAZV2892oEiPgzWucixt/ODzm1eJATqUKBBkImgL4p8s6pFnsLR+vpdjx/ojn5rZMsz0XAOPT0DEIdvj0/OffxqIWN94OU0YE2JCxDb5sjjGoo1DMSA4e2kkGvO7ptTwkiQuNBZZPb/htcICjzP05OCM7+uY1LfjPEWa/vDi9b5bfc8h16Rtv5XIYPTK4oHn3nhB2kejYaay3DBqZtGIjY2ALKfgbbhyAHIShYJRzvq1MmvCqyrVC7bXfc3bCwXKtW5IAgREiYECS+SCLIg4hHEq+4/FAIoL1U1J9harJUUP/vVzp+laNosHfD7AxvuCCJAGlZNGkZ/u0EEQdaVgNjUVPMH97U35dHljTh6xPtsXUeGgIKoecG23q5ZvyPDvrP7VBCkBEO0r12r/7jwJLnigV1c8wHGRG1a5kc1UbVTUQEz7FAF0ulfAagK9gWDs9YNfnLMYeiazZWOKsWd56+rvaEkExPFC6EVhmhegywAvwih/cZsS6XnSl4Kx7LM7IgQLAOiu6Y7GYpqNFMoLgBPaGCkUUAKGyYYZpQMIzKEIAITRfeWynlmi+m00ze78CISCqwpKsV3rAgpJsLCil0WgSgQExAk7BcAXkic93LdtlWyOe2sdisIpulRKhlGRAS2gFPcGieG2RRgRmjOvTJBj3jMUsBJUBSkgnFYlMBXXfH80XS24v0G21Gdanq1CwTmf+XCEyT3jrdvJ6pQtnvROoJh2hGMoWsWQu95LCAoDtU8zlx/HBDh+i+dUFwTT0s9l77sijDbzg+K3I3rAnZm06hAZgXzHrtQua0KFxmQyIsqMl0CFdidckgeiFj4DDiudNVEgaOrAkgso2KbFVEpAphvjSwxqWKcaU4+punIRBAKuLnveuvaWqXSf/lE6pG9QkYAhcKyQRZkKCjgAfnmG3OKljUJdtSKHOmJUG7OS2IIy2wEQ/4xNsSs0pt2SMs5PBZm6JHCJrZ758Ns0A5BcwNhFuTmMIsFQVWL2MqbKNYyk2KOCRA1QJSnY0zXgCywYl4Uh8cIApBmHkjKKFeWf+pQQ2enPZ0Dd1yw5v6yy+BegfVqwAgZdmfetxVAzDxRzPJ4NASKKGKIyj6ZJoBMkIGiO2EQzMsCxT1dt0uBgnct5HYxRcoxfJY95INK8AG1gi+aV5GiSurtb1lzzQmxfWy4ERbfxdpERBEEGAuAKE+J0LRS+ZLLis3LYVuhKmJbAhD2eBGBaOIKzguIMJ2n56PPHGRjzdhiCSDnAwarFbjMP/m11/YfTYcSQnehaiqqR2VLzIaP3reTQ3Fm0MOxazM0INLO8RCLiSCCMU/YvHrlnsC46tpNxXfyFgai+KqDi3wMy6MfYqQOez+/eY5gyCZuuWCVLLc5/eh84ZXQGzFEgs/DPFpfZKuKVhdIA3wRDaOFYOwTVQ2Yz5SpCKRcgfd+f91lPguhUvSMmInCdwjjn47RqOudy6EY8Yuv2YoqIhvha6f1NoQIV58zxZVc6u66O/Pz02SDCMrVClTQ8F4hqp0yEXIoAGbodHsrEQRIF2MlkyqGvWB9d/djmYRZQwxC5tZ3rH6jgBxR023Ops20isIbWzMX7bB0+9DzYPJhU5GSyYsBVcFY6hAvWwmUK2d9eX3nWIzZcNfFJ10xVnfIFmvraI6N2cLpHET0R8Cn0acOzcMj14KootsyVIN89cyV0+JJuLBrv+7g5/OC333+Kukp8URjHuP1IljZl+Ru3SAIWVgVFeNsQaaKQtUym7jzglVDSHrO+uWEL0CaPj8EVZgk97mEI+wv1569cmcGQZjHOnKiWNWXQKGsqtxIs02FSvmoAtbMqK5JxiAulXb6BXtUpyEEvGTKGGqkb/3m6UdrPwDgQRMd15gItBLjxjeu7mgW8Sr9jVBMA8qdZgxmCFHTE0cGAJvaYj/02ToHBAcmHVx1FTau7lv7lfXYfyzX3NTfs3nX+LzDceaEKoHLEbx0rhACAN9714n/WqtlKJqU3oKoosfG+PLmnpmLxPnTOicE57vORJr6G08vz2vVTiQD61+oZQVduoKGB7Z0J2NEBC8QTzTRcZ2IIEsiZCIv3nrO3F7E2fC9C1c9ubW3b8tPR11utJzPP7cBB4VJIvzZzjoHY44a0+t6ey7fmWrhCOO6J3Cm1wPEQSFCnd8f9SKuGoOMPeyJ/PPtBxnMnPoQH6sRmgDsGKnhzcf3//MNZw/MuambTLfaTmuMqBBjJQAQm1WTBe2CAOWCh/LAVwYAZSDK/Ba7yG74llqWbyyKevB49mCKEzesf+E1q/ovunojOhZo64Q7zl3zwqaeykf+ZzynqjzWBauiyBKDL55Y/Ei4ieneA25+HpygOhXFO71/5s4nJAaiukMta2+jmg33nHfc8FZrb9rrCtyeEFIwahm+40WQiYrP5JSO4RqUZ+rddlb3gsJ77rzg+O1nLz/uzc8dSmfJOVwYUhVY5l1qLII5OoGY+nuuPwOucbCIdqgCxxFc6m8VVThRcak7sdO8OJBjBZQNWjYothYmsojK5R1eitvnjhq/KPaM1/HGUzc14OUL7drGqlsLMtAWgpjIF44hpKYG1DT/5BoQA4n6rYYAL5BMcl7l1sfl7ha0eFzbfnTq/9IgmMwCDjmHX08Iuu2yPds2vuZffNeyj3zzNXhgsSbgexeu//rJ1cqHt4+mqDfV6PmcSVttnQgO1FOsKCfzMog3upb9sa830JD2fTbDagBVjDkHiY6Om1AymXSaZ83n+baz2vPhzIV6z8AVXKthxE/N1VzjTQHUvTyTKZAqvCMWaTc2APWAjhnmnXDneSse2bpq1Se6EPbvmsidDdP76ISpdgoXBEOpB7HZL8zwxh41b9eduqyRrRi8dHKygclOhIMKpIahzHscEVKQ1GFcS2NrNy8CwIEgzXifq07pESXA+Uz2u4B6UATM4z41t9P9uuawec3K2piTd9505vK2sTsQ4iJrrOiJ1BNXas3Ujo7XBAkbYqI8tMECAFmgFNymEeehhnhFMvPFYCgOZRky6ZTlrvAC9EbGGVJbNjyyrK9rLAvR9hLxiqzce+M3TuN/L3Zb88MPLlp//Qd+svuPfKO2aX+KU5KIUGLOKUIw00VIaLoqtUU7qZiUgLXlBMtXrnjR+vjv59X3W9cO/+GD+NyeibFPV6xFVzO5smXoy2MkFE4VzgkmDXD6iuW1OODLR16r5LMto0FQaqfQBo/RbOFMs/e/uX/kkofCldQY/pu9DR3sj3NKUp423qCKVAImReBC2G4NiTCk7kL3qPMYaTO81HkelQVFR83Ad9/Q/+/vfZSGN3c1PpxOjp075CUpGYPY5M/zKEOq5i+vNDdBL4I0MPq64omNAwOPCMzNN6w3gjnm9pazB+697JH0+2MTo5cc8AY9Uc7vY6YxL4gqGl4QmCBM+xwZOLAYl24YzQRJm/ejlvlk0gXUXSqlaYkLgVkktkMXD/bsqDUa/UP1bCAznKcKcR6PM/1eqUnXIqKoZx4NinDqyr6nM1v5t5u2VO/vNK+T8IOjGSCzJ/bn9+k9hguWnHLOrzqYCZa5du0FY87jeNF+ZiAA/h8H45wR8fp1kI8d6H1gazx2AoEmOC49Qao+iEBVJZUwtjIyZ6pyRQA/RX1CR3QhYtV0q7GPRUw2cPxkWu77bx/xvQ3AfmfTwozNRfGd89a9+x337bpwdRk32ohB3g+OioJ8wBimlp0ASIhBFljGESpV4zLvUYl6/jPr6v6Ha0+Lnp5v37eev/bKD/xk55+WYDnL3GBNgDGVw8dCaxjLrUW1zL4RsXW297JU9O4jr2NK8f4zu0gEvN8S4uk0M6IQEGHC6fA2YzctdJ4A4PvnHve5ix/WvRtQ+yoHb8ed2EkVtALKuiyjaiN/RsX6OnRnXQk3n1yW9z422Th7eQUguzsiTQzBthgSFSRKJKNpGBqI42MaXwu3vb7vWwC+9aGH9YZ14i52pDXJsl6nVJn04XBumypAllBSiGX2SWL2Q1Ezage0u+vuWqX68RtPituwGea44U2rL/2Th/0PyyrbQuYrLpNkAlPu4sQYdNnSxLl9lWSSeSgQISNGlJSGz6owvNLeiBEjL6AhqioCEgVkNIqH11Tj13rMzOG7ZmNJLtshL4YuPgfKf7ka7ooQc5V94JqG3jQA0+81EFBlQrUUoT+Jhm1U7j+UdL1bmNtrPk3091QmqiWDhPOCDUHVEYEtUUz5uDGSRvsG4tKaQg/JcG3b8jKY7B6iPEGbcjM7o6kAONVGT8nHcRQ97Qzgm95bauVvvGc3KhDEEiAh+NpdJ9kZ5/d3Pn0wVlCT22AqmzXP6ODW3zwR811bko75XK80/uAnu5Nq6j6TVMxf0HjqXzI0mDT5pJ0Aa0sJQllHKlR9cDyK/umG1/U8uVh9f/jHv7oZCOe/pGEwppxAubsrRh+Sb4xG5u+IeOiWs2YnOWvhkscPMhFYVaAKuXPbzPLGb3t8rPKjc7prizHeSx5+6W976o0r96vvBQFpUKyulPd70/Xd8ZiuZGsm7jq993D/73quVjXMDCIEn/kQfOOHW3tnjO+iJ0eq/3Vm76JvOO94tn5C1+jwX0Xs3zfWSNd4VRgiBC+wvQm6GrIzjis7DnSVPqPGPHvvad0LOqZe8vNJroyNXEeHam9/mWSw1EwfWF3pcpOlns9qYr8Io2NkLG46MfaXPu8qlNdHF0CRiZdMggRVr0QiZGAAsaDKPa/taltg8dKnhhJRcBTkpK4w/ll43nowzdYEzSvFTlrGutjuLi3rfXaIzEecauPurT0dhWsL739itJ9JEcWGXfDSyLwXVRAz2OTvsoTQUC/JXa9f0fG673/iUCxAleIIqapkIt5DvYIYhsBsmI1FEluO2eCWjTh8TSpaVeH/Ot52364kP2WQgBiG2d19wexE24uN37v/V/bHb9n4iudbHivOe/hlFhGrBGuNdQ++ceXv9Jjf8uS4FQlWVPJEyJyezxMTHjyjd9HG/ranRxIJapnIRjaSOIp8bNmRMQhC8t1NU7FY7/hZg0UC7tmyMPvcrP3/9OVEFQmaGz2xYWY4GCP3nNE7r03oPU812FJgEQeF4rYz+495nt73xCirJYhh3L6lOq/7/n8jgJawhCX87uHVSX9fwhKWsAQsCaAlLGEJryKWBNASlrCEVw1LAmgJS1jCq4YlAbSEJSzhVcP/AkQU2rC3SOOpAAAAAElFTkSuQmCC\" style=\"width: 25%;\" data-filename=\"logo.png\"><br></p></div></div></div><div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\"><div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\"><div class=\"column\" style=\"text-align: left;color: #60666d;background: #edf1eb;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;width:320px;\"><div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;\">\r\n                        </div>\r\n\r\n                        <div style=\"margin-left: 20px;margin-right: 20px;\">\r\n\r\n                            <p style=\"margin-top: 16px;margin-bottom: 0;\"><strong>Hello [[name]],</strong></p>\r\n                            <p style=\"margin-top: 20px;margin-bottom: 20px;\"><strong>[[message]]</strong></p>\r\n                            <p style=\"margin-top: 20px;margin-bottom: 20px;\"><br></p>\r\n                        </div>\r\n\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\r\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\r\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\r\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\r\n                            2023 ©  All Right Reserved\r\n                        </p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n        </div>\r\n\r\n\r\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\r\n            </div>\r\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', '{\"name\":\"smtp\",\"smtp_host\":\"smtp.strato.de\",\"smtp_port\":\"465\",\"smtp_encryption\":\"ssl\",\"smtp_username\":\"detra@detracash.de\",\"smtp_password\":\"111222aaBB?\"}', 1, 0, '6LdEPosdAAAAAGkRBfRDb3Gr0zo8qVWZdJehu5kV', 'ea76dfc1edd7a16b6e6e71fae1c8cc7f', 1, 0, 0, 0, 2.00, 2.00, 0, 10000, 'bHngBIxsCcM3C5rFLptiffQQ1gXaSJ5S', 'pc1U6Qojgv-cS1t8NR0N6pWNHOBhZ9-DWWChIJoYt4Cyjw1IGKvFpJo1kOcFI9y', 0, '2021-06-17 00:57:42', '2023-10-11 17:11:18', '6193ee4d6885f60a50bc1659', 0, 'FLWPUBK_TEST-5003321b93b251536fd2e7e05232004f-X', 'FLWSECK_TEST-d604361e2d4962f4bb2a400c5afefab1-X', 'FLWSECK_TEST817a365e142b');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `created_at`, `updated_at`) VALUES
(43, 'why-chose-us', '2021-08-27 11:20:57', '2021-08-27 11:20:57'),
(44, 'why-chose-us', '2021-08-27 11:21:11', '2021-08-27 11:21:11'),
(45, 'why-chose-us', '2021-08-27 11:21:34', '2021-08-27 11:21:34'),
(46, 'why-chose-us', '2021-08-27 11:21:57', '2021-08-27 11:21:57'),
(47, 'why-chose-us', '2021-08-27 11:23:43', '2021-08-27 11:23:43'),
(48, 'why-chose-us', '2021-08-27 11:23:59', '2021-08-27 11:23:59'),
(49, 'way-to-send', '2021-08-27 11:24:39', '2021-08-27 11:24:39'),
(50, 'way-to-send', '2021-08-27 11:25:09', '2021-08-27 11:25:09'),
(51, 'way-to-send', '2021-08-27 11:25:27', '2021-08-27 11:25:27'),
(52, 'way-to-send', '2021-08-27 11:25:46', '2021-08-27 11:25:46'),
(53, 'testimonial', '2021-08-27 11:27:02', '2021-08-27 11:27:02'),
(54, 'testimonial', '2021-08-27 11:27:15', '2021-08-27 11:27:15'),
(55, 'testimonial', '2021-08-27 11:27:25', '2021-08-27 11:27:25'),
(56, 'faq', '2021-08-27 11:29:27', '2021-08-27 11:29:27'),
(57, 'faq', '2021-08-27 11:29:47', '2021-08-27 11:29:47'),
(58, 'faq', '2021-08-27 11:30:02', '2021-08-27 11:30:02'),
(59, 'faq', '2021-08-27 11:30:16', '2021-08-27 11:30:16'),
(60, 'faq', '2021-08-27 11:30:27', '2021-08-27 11:30:27'),
(61, 'faq', '2021-08-27 11:30:40', '2021-08-27 11:30:40'),
(62, 'services', '2021-08-27 11:59:03', '2021-08-27 11:59:03'),
(63, 'services', '2021-08-27 11:59:17', '2021-08-27 11:59:17'),
(64, 'services', '2021-08-27 11:59:42', '2021-08-27 11:59:42'),
(65, 'help', '2021-08-27 12:04:06', '2021-08-27 12:04:06'),
(66, 'help', '2021-08-27 12:04:23', '2021-08-27 12:04:23'),
(67, 'help', '2021-08-27 12:04:40', '2021-08-27 12:04:40'),
(68, 'help', '2021-08-27 12:04:56', '2021-08-27 12:04:56'),
(69, 'help', '2021-08-27 12:05:12', '2021-08-27 12:05:12'),
(70, 'help', '2021-08-27 12:05:36', '2021-08-27 12:05:36'),
(77, 'social', '2021-08-27 12:12:58', '2021-08-27 12:12:58'),
(78, 'social', '2021-08-27 12:14:56', '2021-08-27 12:14:56'),
(79, 'social', '2021-08-27 12:16:06', '2021-08-27 12:16:06'),
(80, 'social', '2021-08-27 12:16:57', '2021-08-27 12:16:57'),
(81, 'support', '2021-08-27 12:21:37', '2021-08-27 12:21:37'),
(82, 'support', '2021-08-27 12:21:55', '2021-08-27 12:21:55'),
(83, 'support', '2022-03-09 17:18:31', '2022-03-09 17:18:31'),
(84, 'blog', '2022-07-13 11:33:26', '2022-07-13 11:33:26'),
(85, 'blog', '2022-07-13 11:40:50', '2022-07-13 11:40:50'),
(86, 'blog', '2022-07-13 11:42:03', '2022-07-13 11:42:03'),
(87, 'blog', '2022-07-13 11:43:19', '2022-07-13 11:43:19'),
(88, 'blog', '2022-07-13 11:54:41', '2022-07-13 11:54:41'),
(89, 'blog', '2022-07-13 12:25:13', '2022-07-13 12:25:13'),
(90, 'faq', '2022-08-09 14:34:18', '2022-08-09 14:34:18'),
(91, 'support', '2023-01-16 11:58:17', '2023-01-16 11:58:17');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(294, 43, 1, '{\"title\":\"Easy To Use\",\"short_description\":\"Account creation and initiating transfers are like ABC\"}', '2021-08-27 11:20:57', '2021-11-26 16:28:25'),
(295, 44, 1, '{\"title\":\"Low Fees\",\"short_description\":\"Our fees are low and competive\"}', '2021-08-27 11:21:11', '2023-03-19 08:06:16'),
(296, 45, 1, '{\"title\":\"Fast Payments\",\"short_description\":\"A majority of transfers are completed within minutes\\u00a0\"}', '2021-08-27 11:21:34', '2021-11-26 16:42:41'),
(297, 46, 1, '{\"title\":\"No Agents Visits\",\"short_description\":\"Initiate and complete transfers from your smartphone or computer.\"}', '2021-08-27 11:21:57', '2021-11-26 16:37:29'),
(298, 47, 1, '{\"title\":\"Unbeatable Service\",\"short_description\":\"We are available 24*7 and equipped to support in multitude of languages\"}', '2021-08-27 11:23:43', '2023-03-19 08:14:13'),
(299, 48, 1, '{\"title\":\"We Are Secured\",\"short_description\":\"Be assured that your account and money are secured\\u00a0\"}', '2021-08-27 11:23:59', '2023-03-19 08:16:53'),
(300, 49, 1, '{\"title\":\"Create An Account\",\"short_description\":\"Create a free DetraCash account\"}', '2021-08-27 11:24:39', '2023-03-19 08:21:27'),
(301, 50, 1, '{\"title\":\"Initiate A Transfer\",\"short_description\":\"Enter an amount to send to a receiver.\"}', '2021-08-27 11:25:09', '2021-11-26 16:23:32'),
(302, 51, 1, '{\"title\":\"Pay Securely\",\"short_description\":\"Pay using various secure methods we offer\"}', '2021-08-27 11:25:27', '2021-11-26 16:23:47'),
(303, 52, 1, '{\"title\":\"That\\u2019s it!\",\"short_description\":\"You will receive a notification when your transfer is completed,\"}', '2021-08-27 11:25:46', '2023-03-19 08:26:15'),
(304, 53, 1, '{\"name\":\"John Rema\",\"designation\":\"Accountant\",\"description\":\"I would like to extend a warm heart filled with thanks for the smooth way you support customers. You take the stress and worry completely out of the equation, which is almost unheard of these days.<br \\/>I would whole heartedly recommend DetraCash to anyone who would need your service<br \\/>\"}', '2021-08-27 11:27:02', '2021-11-26 17:19:15'),
(305, 54, 1, '{\"name\":\"Jasmin Akote\",\"designation\":\"Sales Agent  - Real Estates\",\"description\":\"I want to thank you DetraCash for the wonderful service. You team is great and I love you all. My family has just inform me via email that they recieved the money in their account today. Thank you so much once again. I will from now onwards always use your services because it was a very smooth transaction. Thank you! thank you! thank you!\"}', '2021-08-27 11:27:15', '2021-11-26 16:58:52'),
(306, 55, 1, '{\"name\":\"Emma Fivefingers\",\"designation\":\"Marketing\",\"description\":\"Just a quick note to let you know that my friend received the money yesterday. Thank-you very much for your professional and fast transfer service. I will definitely use your services in the future and recommend your company to others.<br \\/><br \\/>\"}', '2021-08-27 11:27:25', '2021-11-26 17:18:24'),
(307, 56, 1, '{\"title\":\"How to send money\",\"description\":\"With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence. For more details <a href=\\\"https:\\/\\/detracash.com\\/blog\\/details\\/sending-money-with-detracash\\/3\\\">read this article<\\/a>\"}', '2021-08-27 11:29:27', '2022-12-21 19:41:46'),
(308, 57, 1, '{\"title\":\"What are our fees?\",\"description\":\"With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence\"}', '2021-08-27 11:29:47', '2022-08-09 14:26:45'),
(309, 58, 1, '{\"title\":\"What is the fastest way to send money abroad?\",\"description\":\"With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence\"}', '2021-08-27 11:30:02', '2022-08-09 14:27:02'),
(310, 59, 1, '{\"title\":\"Cancellations and refund\",\"description\":\"With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence\"}', '2021-08-27 11:30:16', '2022-08-09 14:27:19'),
(311, 60, 1, '{\"title\":\"How to protect your account\",\"description\":\"With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence\"}', '2021-08-27 11:30:27', '2022-08-09 14:30:32'),
(312, 61, 1, '{\"title\":\"Is DetraCash Safe?\",\"description\":\"With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence.\"}', '2021-08-27 11:30:40', '2022-08-09 14:27:45'),
(313, 62, 1, '{\"title\":\"Bank Transfers\",\"description\":\"We offer customers the option to transfer money using our platform directly to a bank account\\u00a0\"}', '2021-08-27 11:59:03', '2022-08-10 04:31:06'),
(314, 63, 1, '{\"title\":\"Mobile Money Tranfers\",\"description\":\"With our platform you can make transfers directly to any mobile money wallet in selected countries.\"}', '2021-08-27 11:59:17', '2023-03-19 08:39:37'),
(315, 64, 1, '{\"title\":\"Air Time Top-up\",\"description\":\"We offer you the possibility to top-up air time on the phones of family members, love ones and friends across the globe. The benefit of using this service is that is free of charge.\"}', '2021-08-27 11:59:42', '2023-03-19 08:44:34'),
(316, 65, 1, '{\"title\":\"Sending money\",\"short_description\":\"<span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>\",\"description\":\"<h4>Transfer problems? Let\\u2019s solve it together!<\\/h4><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your money transfer is not proceeding further, chances are it\\u2019s something that you may be able to rectify with a few checks. Here\\u2019s a list of how you can solve common problems that may come up during your transfer journey.<\\/p><ol><li><span>Completing your transfer<\\/span><ul><li><span>My payment won\\u2019t go through<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer processing<\\/span><ul><li><span>My money is taking longer to process than I expected<\\/span><\\/li><li><span>My transaction has been placed on hold \\/ I\\u2019ve been asked to provide additional information<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer paid<\\/span><ul><li><span>My recipient hasn\\u2019t received their money<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer cancelled<\\/span><ul><li><span>I want to cancel my transfer<\\/span><\\/li><li><span>I\\u2019m still waiting for my refund<\\/span><\\/li><\\/ul><\\/li><li><span>Getting help<\\/span><ul><li><span>My WebChat keeps getting disconnected<\\/span><\\/li><\\/ul><\\/li><\\/ol><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your problem isn\\u2019t listed here, please refer to our comprehe<\\/p>\"}', '2021-08-27 12:04:06', '2022-08-09 14:14:55'),
(317, 66, 1, '{\"title\":\"Managing your account\",\"short_description\":\"<span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>\",\"description\":\"<h4>Transfer problems? Let\\u2019s solve it together!<\\/h4><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your money transfer is not proceeding further, chances are it\\u2019s something that you may be able to rectify with a few checks. Here\\u2019s a list of how you can solve common problems that may come up during your transfer journey.<\\/p><ol><li><span>Completing your transfer<\\/span><ul><li><span>My payment won\\u2019t go through<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer processing<\\/span><ul><li><span>My money is taking longer to process than I expected<\\/span><\\/li><li><span>My transaction has been placed on hold \\/ I\\u2019ve been asked to provide additional information<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer paid<\\/span><ul><li><span>My recipient hasn\\u2019t received their money<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer cancelled<\\/span><ul><li><span>I want to cancel my transfer<\\/span><\\/li><li><span>I\\u2019m still waiting for my refund<\\/span><\\/li><\\/ul><\\/li><li><span>Getting help<\\/span><ul><li><span>My WebChat keeps getting disconnected<\\/span><\\/li><\\/ul><\\/li><\\/ol><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your problem isn\\u2019t listed here, please refer to our comprehe<\\/p>\"}', '2021-08-27 12:04:23', '2022-08-09 14:15:10'),
(318, 67, 1, '{\"title\":\"Cancellations and refund\",\"short_description\":\"<span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>\",\"description\":\"<h4>Transfer problems? Let\\u2019s solve it together!<\\/h4><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your money transfer is not proceeding further, chances are it\\u2019s something that you may be able to rectify with a few checks. Here\\u2019s a list of how you can solve common problems that may come up during your transfer journey.<\\/p><ol><li><span>Completing your transfer<\\/span><ul><li><span>My payment won\\u2019t go through<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer processing<\\/span><ul><li><span>My money is taking longer to process than I expected<\\/span><\\/li><li><span>My transaction has been placed on hold \\/ I\\u2019ve been asked to provide additional information<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer paid<\\/span><ul><li><span>My recipient hasn\\u2019t received their money<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer cancelled<\\/span><ul><li><span>I want to cancel my transfer<\\/span><\\/li><li><span>I\\u2019m still waiting for my refund<\\/span><\\/li><\\/ul><\\/li><li><span>Getting help<\\/span><ul><li><span>My WebChat keeps getting disconnected<\\/span><\\/li><\\/ul><\\/li><\\/ol><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your problem isn\\u2019t listed here, please refer to our comprehe<\\/p>\"}', '2021-08-27 12:04:40', '2022-08-09 14:22:34'),
(319, 68, 1, '{\"title\":\"Cradit card\",\"short_description\":\"<span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>\",\"description\":\"<h4>Transfer problems? Let\\u2019s solve it together!<\\/h4><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your money transfer is not proceeding further, chances are it\\u2019s something that you may be able to rectify with a few checks. Here\\u2019s a list of how you can solve common problems that may come up during your transfer journey.<\\/p><ol><li><span>Completing your transfer<\\/span><ul><li><span>My payment won\\u2019t go through<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer processing<\\/span><ul><li><span>My money is taking longer to process than I expected<\\/span><\\/li><li><span>My transaction has been placed on hold \\/ I\\u2019ve been asked to provide additional information<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer paid<\\/span><ul><li><span>My recipient hasn\\u2019t received their money<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer cancelled<\\/span><ul><li><span>I want to cancel my transfer<\\/span><\\/li><li><span>I\\u2019m still waiting for my refund<\\/span><\\/li><\\/ul><\\/li><li><span>Getting help<\\/span><ul><li><span>My WebChat keeps getting disconnected<\\/span><\\/li><\\/ul><\\/li><\\/ol><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your problem isn\\u2019t listed here, please refer to our comprehe<\\/p>\"}', '2021-08-27 12:04:56', '2022-08-09 14:15:43'),
(320, 69, 1, '{\"title\":\"Receiving money\",\"short_description\":\"<span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>\",\"description\":\"<h4>Transfer problems? Let\\u2019s solve it together!<\\/h4><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your money transfer is not proceeding further, chances are it\\u2019s something that you may be able to rectify with a few checks. Here\\u2019s a list of how you can solve common problems that may come up during your transfer journey.<\\/p><ol><li><span>Completing your transfer<\\/span><ul><li><span>My payment won\\u2019t go through<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer processing<\\/span><ul><li><span>My money is taking longer to process than I expected<\\/span><\\/li><li><span>My transaction has been placed on hold \\/ I\\u2019ve been asked to provide additional information<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer paid<\\/span><ul><li><span>My recipient hasn\\u2019t received their money<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer cancelled<\\/span><ul><li><span>I want to cancel my transfer<\\/span><\\/li><li><span>I\\u2019m still waiting for my refund<\\/span><\\/li><\\/ul><\\/li><li><span>Getting help<\\/span><ul><li><span>My WebChat keeps getting disconnected<\\/span><\\/li><\\/ul><\\/li><\\/ol><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your problem isn\\u2019t listed here, please refer to our comprehe<\\/p>\"}', '2021-08-27 12:05:12', '2022-08-09 14:15:58'),
(321, 70, 1, '{\"title\":\"Where\'s my money?\",\"short_description\":\"<span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>\",\"description\":\"<h4>Transfer problems? Let\\u2019s solve it together!<\\/h4><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your money transfer is not proceeding further, chances are it\\u2019s something that you may be able to rectify with a few checks. Here\\u2019s a list of how you can solve common problems that may come up during your transfer journey.<\\/p><ol><li><span>Completing your transfer<\\/span><ul><li><span>My payment won\\u2019t go through<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer processing<\\/span><ul><li><span>My money is taking longer to process than I expected<\\/span><\\/li><li><span>My transaction has been placed on hold \\/ I\\u2019ve been asked to provide additional information<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer paid<\\/span><ul><li><span>My recipient hasn\\u2019t received their money<\\/span><\\/li><\\/ul><\\/li><li><span>Transfer cancelled<\\/span><ul><li><span>I want to cancel my transfer<\\/span><\\/li><li><span>I\\u2019m still waiting for my refund<\\/span><\\/li><\\/ul><\\/li><li><span>Getting help<\\/span><ul><li><span>My WebChat keeps getting disconnected<\\/span><\\/li><\\/ul><\\/li><\\/ol><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">If your problem isn\\u2019t listed here, please refer to our comprehe<\\/p>\"}', '2021-08-27 12:05:36', '2022-08-09 14:16:11'),
(328, 77, 1, '{\"name\":\"Facebook\"}', '2021-08-27 12:12:58', '2021-08-27 12:12:58'),
(329, 78, 1, '{\"name\":\"twitter\"}', '2021-08-27 12:14:56', '2021-08-27 12:14:56'),
(330, 79, 1, '{\"name\":\"Pinterest\"}', '2021-08-27 12:16:06', '2021-08-27 12:16:06'),
(331, 80, 1, '{\"name\":\"instagram\"}', '2021-08-27 12:16:57', '2021-08-27 12:16:57'),
(332, 81, 1, '{\"title\":\"Privacy Policy\",\"description\":\"<p style=\\\"text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Under construction. Added<\\/p><br \\/><p style=\\\"text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><br \\/><br \\/>\"}', '2021-08-27 12:21:37', '2023-02-11 20:47:15'),
(333, 82, 1, '{\"title\":\"Terms and Conditions\",\"description\":\"<p style=\\\"text-align:justify;color:rgb(0,0,0);font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Under construction<\\/p>\"}', '2021-08-27 12:21:55', '2022-10-23 07:45:17'),
(334, 83, 1, '{\"title\":\"Affiliate\",\"description\":\"<p>Become an affiliate<\\/p>\"}', '2022-03-09 17:18:31', '2022-03-09 17:18:31'),
(335, 84, 1, '{\"title\":\"We will be growing\",\"description\":\"<p>DetraCash is forecasting Gross Profit for the first year of operations at 37,450, increasing to 247,389 in the second year and increasing to 897,328 in the third year.<\\/p><p>The average Gross Margin is 97.43%.<\\/p><p>The company is forecasting Operating Expenses, including payroll, of 181,059 in the first year, 182,558 in the second year and 191,357 in the third year.<\\/p><p>Net Profit After Taxes is projected at 143,609 based on an expected income tax of 0 in the first year, 63,534 in the second year based on an expected income tax of 1,297 and 691,851 in the third year based on an expected income tax of 14,119.<\\/p><p>The owners plan to take a draw or dividend of 0 in the first year, 0 in the second year and 0 in the third year. The company is\\u00a0forecasting Retained Earnings of 143,609 in the first year, 63,534 in the second year and 691,851 in the third year.<\\/p>\"}', '2022-07-13 11:33:26', '2022-07-13 11:33:26'),
(336, 85, 1, '{\"title\":\"Our numbers will push a smile on your face\",\"description\":\"<p>DetraCash is forecasting Current Assets for the first year of operations at 71,393, increasing to 44,246 in the second year and\\u00a0increasing to 804,647 in the third year.<\\/p><p>Additionally, the company is forecasting Fixed Assets for the first year operations at 300,000, remaining the same at 300,000\\u00a0in the second and third year.<\\/p><p>Current Liabilities for the first year of operations is forecasted at 828, increasing to 2,025 in the second year and increasing to\\u00a09,664 in the third year.<\\/p><p>Long Term Liabilities for the first year of operations is projected at 0, remaining the same at 0 in the second and third year.<\\/p><p>Capital for the first year of operations is forecasted at 245,482, increasing to 349,016 in the second year and increasing to\\u00a01,090,868 in the third year.<\\/p><p>The company\'s Total Liabilities and Capital for the first year of operations is 246,310, increasing to 351,041 in the second year\\u00a0and increasing to 1,100,532 in the third year.<\\/p>\"}', '2022-07-13 11:40:50', '2022-07-13 11:40:50'),
(337, 86, 1, '{\"title\":\"Potential Investors will be happy\",\"description\":\"<p>The company has a starting cash balance of 30,000. The owners plan to contribute 120,000 in capital funding and take out 0\\u00a0in draws.<\\/p><p>Accounts Payables are set to 10 days, while Accounts Receivables are set to 1 days. The company is forecasting that 0% of\\u00a0their total sales will be on credit.<\\/p><p>Additionally, the company is forecasting 115,500 in Total Expenses and 300,000 in Fixed Assets for the first three years of\\u00a0operations.<\\/p><p>All forecasts in this business plan utilize Accrual Basis accounting.<\\/p>\"}', '2022-07-13 11:42:03', '2022-07-13 11:42:03'),
(338, 87, 1, '{\"title\":\"Sending Money with DetraCash\",\"description\":\"<p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">Sending Money to families and friends is a nightmare on some platforms. With DetraCash, wiring money to people even in remote areas has been made easy.<\\/p><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence. As mobile money is gaining grounds on the continent, we have integrated it into our core service and technologies.<\\/p><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">Gone are those days when you had to pay high transaction fees for interbank transfers. With our platform such transfer have been made easy fast and affordable.<\\/p><p style=\\\"font-size:15px;font-family:\'Open-r\';\\\">Don\'t wait for the next bell to ring, create an account with us and start sending money to your friends and lover ones immediately.<\\/p>\"}', '2022-07-13 11:43:19', '2022-07-13 11:43:19'),
(339, 88, 1, '{\"title\":\"A New beginning in the Remittance Business\",\"description\":\"<p>Remittance has for a long time been left in the hands of a few players. Western Union, MoneyGram dominated the market for a long period. recently other players joint the race and the market looks a lithe different. <\\/p><p>The entry of DetraCash\\u00a0<span>into the Remittance landscape is going<\\/span><span>\\u00a0to change the dynamics. We see our customer as those who are going to benefit from the changes. Always visit this page to see all the new stuff we have in package for you. Service fees will always be like a fresh tomorrow morning, not yesterday. Services will be the future, not current. Unbeatable exchange rates will make your day.<\\/span><\\/p><p><span>Join us and get the ride you have been waiting for.<\\/span><\\/p>\"}', '2022-07-13 11:54:41', '2022-07-13 11:56:43'),
(340, 89, 1, '{\"title\":\"How to Send Money on our platform\",\"description\":\"<p>A step by step guide to send money with DetraCash\\u00a0<\\/p><p><br \\/><\\/p><p>In case you encounter issues, please reach out to us on our contact page.<\\/p>\"}', '2022-07-13 12:25:13', '2022-07-13 13:12:09'),
(341, 90, 1, '{\"title\":\"Managing your account\",\"description\":\"<p>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<br \\/><\\/p>\"}', '2022-08-09 14:34:18', '2022-08-09 14:34:18'),
(342, 91, 1, '{\"title\":\"Mobile Money\",\"description\":\"<p>under construction<\\/p>\"}', '2023-01-16 11:58:17', '2023-01-16 11:58:17'),
(344, 81, 2, '{\"title\":\"politique de confidentialit\\u00e9\",\"description\":\"<p>En cours de construction.<br \\/><\\/p>\"}', '2023-02-11 20:48:59', '2023-02-11 20:48:59'),
(345, 82, 2, '{\"title\":\"Termes et conditions\",\"description\":\"<p>En cours de construction.<br \\/><\\/p>\"}', '2023-02-11 20:50:56', '2023-02-11 20:50:56'),
(346, 83, 2, '{\"title\":\"Affilier\",\"description\":\"<p>En cours de construction.<br \\/><\\/p>\"}', '2023-02-11 20:52:11', '2023-02-11 20:52:11'),
(347, 91, 2, '{\"title\":\"Paiement mobile\",\"description\":\"<p>En cours de construction.<br \\/><\\/p>\"}', '2023-02-11 20:53:19', '2023-02-11 20:53:19'),
(348, 56, 2, '{\"title\":\"Comment envoyer de l\'argent\",\"description\":\"<p>Avec DetraCash, transf\\u00e9rer de l\'argent \\u00e0 des personnes, m\\u00eame dans des r\\u00e9gions \\u00e9loign\\u00e9es, est devenu facile. En utilisant notre plateforme, les r\\u00eaves et la r\\u00e9alit\\u00e9 deviennent apparents. Pour le march\\u00e9 africain, nous avons int\\u00e9gr\\u00e9 des technologies qui fonctionneront pour chaque pays o\\u00f9 nous sommes pr\\u00e9sents. Pour plus de d\\u00e9tails lire cet article<br \\/><\\/p>\"}', '2023-02-14 08:01:44', '2023-02-14 08:01:44'),
(349, 43, 2, '{\"title\":\"Facile \\u00e0 utiliser\",\"short_description\":\"<p>La cr\\u00e9ation de compte et l\'initiation de virements sont comme ABC<br \\/><\\/p>\"}', '2023-03-19 08:04:25', '2023-03-19 08:04:25'),
(350, 44, 2, '{\"title\":\"Frais modiques\",\"short_description\":\"<p>Nos honoraires sont bas et comp\\u00e9titifs<br \\/><\\/p>\"}', '2023-03-19 08:07:16', '2023-03-19 08:07:16'),
(351, 45, 2, '{\"title\":\"Paiements rapides\",\"short_description\":\"<p>La plupart des transferts sont effectu\\u00e9s en quelques minutes<br \\/><\\/p>\"}', '2023-03-19 08:09:18', '2023-03-19 08:09:18'),
(352, 46, 2, '{\"title\":\"Pas de visites d\'agents\",\"short_description\":\"<p>Initiez et effectuez des transferts depuis votre smartphone ou votre ordinateur.<br \\/><\\/p>\"}', '2023-03-19 08:11:48', '2023-03-19 08:11:48'),
(353, 47, 2, '{\"title\":\"Service imbattable\",\"short_description\":\"<p>Nous sommes disponibles 24h\\/24 et 7j\\/7 et \\u00e9quip\\u00e9s pour prendre en charge dans une multitude de langues<br \\/><\\/p>\"}', '2023-03-19 08:14:46', '2023-03-19 08:14:46'),
(354, 48, 2, '{\"title\":\"Nous sommes s\\u00e9curis\\u00e9s\",\"short_description\":\"<p>Soyez assur\\u00e9 que votre compte et votre argent sont s\\u00e9curis\\u00e9s<br \\/><\\/p>\"}', '2023-03-19 08:17:34', '2023-03-19 08:17:34'),
(355, 49, 2, '{\"title\":\"Cr\\u00e9er un compte\",\"short_description\":\"<p>Cr\\u00e9ez un compte DetraCash gratuit<br \\/><\\/p>\"}', '2023-03-19 08:22:36', '2023-03-19 08:22:36'),
(356, 50, 2, '{\"title\":\"Initier un transfert\",\"short_description\":\"<p>Saisissez un montant \\u00e0 envoyer \\u00e0 un b\\u00e9n\\u00e9ficiaire.<br \\/><\\/p>\"}', '2023-03-19 08:24:15', '2023-03-19 08:24:15'),
(357, 51, 2, '{\"title\":\"Payez en toute s\\u00e9curit\\u00e9\",\"short_description\":\"<p>Payez en utilisant diverses m\\u00e9thodes s\\u00e9curis\\u00e9es que nous offrons<br \\/><\\/p>\"}', '2023-03-19 08:25:46', '2023-03-19 08:25:46'),
(358, 52, 2, '{\"title\":\"C\'est tout!\",\"short_description\":\"<p>Vous recevrez une notification lorsque votre transfert sera termin\\u00e9,<br \\/><\\/p>\"}', '2023-03-19 08:27:33', '2023-03-19 08:27:33'),
(359, 53, 2, '{\"name\":\"John Rema\",\"designation\":\"Accountant\",\"description\":\"<p>Je voudrais adresser un c\\u0153ur chaleureux rempli de remerciements pour la mani\\u00e8re fluide dont vous soutenez les clients. Vous \\u00e9liminez compl\\u00e8tement le stress et les soucis de l\'\\u00e9quation, ce qui est presque inconnu de nos jours.<\\/p><p><span>Je recommanderais sans r\\u00e9serve DetraCash \\u00e0 tous ceux qui auraient besoin de vos services<\\/span><\\/p>\"}', '2023-03-19 08:30:12', '2023-03-19 08:30:12'),
(360, 54, 2, '{\"name\":\"Jasmin Akote\",\"designation\":\"Sales Agent  - Real Estates\",\"description\":\"<p>Je tiens \\u00e0 vous remercier DetraCash pour le merveilleux service. Votre \\u00e9quipe est formidable et je vous aime tous. Ma famille vient de m\'informer par e-mail qu\'elle a re\\u00e7u l\'argent sur son compte aujourd\'hui. Merci beaucoup encore une fois. J\'utiliserai dor\\u00e9navant toujours vos services car la transaction s\'est tr\\u00e8s bien d\\u00e9roul\\u00e9e. Merci! merci! merci!<br \\/><\\/p>\"}', '2023-03-19 08:32:48', '2023-03-19 08:32:48'),
(361, 62, 2, '{\"title\":\"Virements Bancaires\",\"description\":\"<p>Nous offrons aux clients la possibilit\\u00e9 de transf\\u00e9rer de l\'argent en utilisant notre plateforme directement sur un compte bancaire<br \\/><\\/p>\"}', '2023-03-19 08:35:30', '2023-03-19 08:35:30'),
(362, 63, 2, '{\"title\":\"Portefeuille mobile\",\"description\":\"<p>Gr\\u00e2ce \\u00e0 notre plateforme, vous pouvez effectuer des transferts directement vers n\'importe quel portefeuille d\'argent mobile dans certains pays.<br \\/><\\/p>\"}', '2023-03-19 08:40:49', '2023-03-19 08:40:49'),
(363, 64, 2, '{\"title\":\"Recharge Mobile\",\"description\":\"<p>Nous vous offrons la possibilit\\u00e9 de recharger du temps d\'antenne sur les t\\u00e9l\\u00e9phones des membres de votre famille, de vos proches et de vos amis \\u00e0 travers le monde. L\'avantage d\'utiliser ce service est qu\'il est gratuit.<br \\/><\\/p>\"}', '2023-03-19 08:45:42', '2023-03-19 08:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `content_media`
--

CREATE TABLE `content_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `content_media`
--

INSERT INTO `content_media` (`id`, `content_id`, `description`, `created_at`, `updated_at`) VALUES
(30, 43, '{\"image\":\"63d21df08276e1674714608.png\"}', '2021-08-27 11:20:57', '2023-01-26 05:30:08'),
(31, 44, '{\"image\":\"63d21e0912f101674714633.png\"}', '2021-08-27 11:21:11', '2023-01-26 05:30:33'),
(32, 45, '{\"image\":\"63d21e209ea9e1674714656.png\"}', '2021-08-27 11:21:34', '2023-01-26 05:30:56'),
(33, 46, '{\"image\":\"63d21e3829c5d1674714680.png\"}', '2021-08-27 11:21:57', '2023-01-26 05:31:20'),
(34, 47, '{\"image\":\"63d21e53d36371674714707.png\"}', '2021-08-27 11:23:43', '2023-01-26 05:31:47'),
(35, 48, '{\"image\":\"63d21e6a84dd61674714730.png\"}', '2021-08-27 11:23:59', '2023-01-26 05:32:10'),
(36, 49, '{\"image\":\"63d21e8e36c691674714766.png\"}', '2021-08-27 11:24:39', '2023-01-26 05:32:46'),
(37, 50, '{\"image\":\"63d21ea5f1d191674714789.png\"}', '2021-08-27 11:25:09', '2023-01-26 05:33:09'),
(38, 51, '{\"image\":\"63d21eb8a415e1674714808.png\"}', '2021-08-27 11:25:27', '2023-01-26 05:33:28'),
(39, 52, '{\"image\":\"63d21ecf0a0171674714831.png\"}', '2021-08-27 11:25:46', '2023-01-26 05:33:51'),
(40, 53, '{\"image\":\"61292066b7e9b1630085222.jpg\"}', '2021-08-27 11:27:02', '2021-08-27 11:27:02'),
(41, 54, '{\"image\":\"648f42c9261a81687110345.jpg\"}', '2021-08-27 11:27:15', '2023-06-18 15:45:45'),
(42, 55, '{\"image\":\"648f42e2807e71687110370.jpg\"}', '2021-08-27 11:27:25', '2023-06-18 15:46:10'),
(43, 62, '{\"image\":\"612927e709a031630087143.png\"}', '2021-08-27 11:59:03', '2021-08-27 11:59:03'),
(44, 63, '{\"image\":\"612927f5d2c671630087157.png\"}', '2021-08-27 11:59:17', '2021-08-27 11:59:17'),
(45, 64, '{\"image\":\"6129280ec6a951630087182.png\"}', '2021-08-27 11:59:42', '2021-08-27 11:59:42'),
(46, 65, '{\"image\":\"612929165731e1630087446.png\"}', '2021-08-27 12:04:06', '2021-08-27 12:04:06'),
(47, 66, '{\"image\":\"61292927d10381630087463.png\"}', '2021-08-27 12:04:23', '2021-08-27 12:04:23'),
(48, 67, '{\"image\":\"61292938089c21630087480.png\"}', '2021-08-27 12:04:40', '2021-08-27 12:04:40'),
(49, 68, '{\"image\":\"61292948c053d1630087496.png\"}', '2021-08-27 12:04:56', '2021-08-27 12:04:56'),
(50, 69, '{\"image\":\"612929585c1b51630087512.png\"}', '2021-08-27 12:05:12', '2021-08-27 12:05:12'),
(51, 70, '{\"image\":\"61292970637481630087536.png\"}', '2021-08-27 12:05:36', '2021-08-27 12:05:36'),
(58, 77, '{\"link\":\"https:\\/\\/www.facebook.com\\/\",\"icon\":\"fab fa-facebook-f\"}', '2021-08-27 12:12:58', '2021-08-27 12:12:58'),
(59, 78, '{\"link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"icon\":\"fab fa-twitter\"}', '2021-08-27 12:14:56', '2021-08-27 12:14:56'),
(60, 79, '{\"link\":\"https:\\/\\/www.pinterest.com\\/\",\"icon\":\"fab fa-pinterest-p\"}', '2021-08-27 12:16:06', '2021-08-27 12:16:06'),
(61, 80, '{\"link\":\"https:\\/\\/www.instagram.com\\/\",\"icon\":\"fab fa-instagram\"}', '2021-08-27 12:16:57', '2021-08-27 12:16:57'),
(62, 84, '{\"image\":\"62cec9a6128181657719206.jpg\"}', '2022-07-13 11:33:26', '2022-07-13 11:33:26'),
(63, 85, '{\"image\":\"62cecb62ad2081657719650.jpg\"}', '2022-07-13 11:40:50', '2022-07-13 11:40:50'),
(64, 86, '{\"image\":\"62cecbab2ea271657719723.jpg\"}', '2022-07-13 11:42:03', '2022-07-13 11:42:03'),
(65, 87, '{\"image\":\"62cecbf74a51e1657719799.jpg\"}', '2022-07-13 11:43:19', '2022-07-13 11:43:19'),
(66, 88, '{\"image\":\"62cecf1be33021657720603.jpg\"}', '2022-07-13 11:56:43', '2022-07-13 11:56:43'),
(67, 89, '{\"image\":\"62ced5c97c2c01657722313.jpg\"}', '2022-07-13 12:25:13', '2022-07-13 12:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Asia and Pacific', 1, '2021-08-15 21:05:14', '2021-08-15 21:05:51'),
(2, 'Latin America and Caribbean', 1, '2021-08-15 21:05:40', '2021-08-15 21:05:40'),
(3, 'Africas', 1, '2021-08-15 21:06:23', '2023-08-30 13:06:49'),
(4, 'Europe', 1, '2021-08-15 21:06:36', '2021-08-15 21:06:36'),
(5, 'North America', 0, '2021-08-15 21:06:48', '2023-08-30 12:37:58');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `iso_code` varchar(20) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `minimum_amount` decimal(11,2) NOT NULL DEFAULT 0.00,
  `maximum_amount` decimal(11,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) DEFAULT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `facilities` text DEFAULT NULL,
  `serviceinfo` text DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `per_transfer` decimal(18,2) NOT NULL DEFAULT 0.00,
  `daily_limit` decimal(18,2) NOT NULL DEFAULT 0.00,
  `monthly_limit` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `send_from` tinyint(1) NOT NULL DEFAULT 1,
  `send_to` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`limit`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso_code`, `slug`, `code`, `minimum_amount`, `maximum_amount`, `image`, `continent_id`, `facilities`, `serviceinfo`, `rate`, `per_transfer`, `daily_limit`, `monthly_limit`, `status`, `send_from`, `send_to`, `details`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'NIGERIA', 'NG', 'nigeria', 'NGN', 100.00, 10000.00, '614c1db66b0331632378294.gif', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 415.89375000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2021-09-12 22:10:36', '2023-10-22 10:37:20', '[{\"id\": 1, \"name\": \"Airtime\", \"daily_limit\": \"1000000\", \"yearly_limit\": \"1000000\", \"monthly_limit\": \"3000000\", \"minimum_amount\": \"1000\"}, {\"id\": 7, \"name\": \"Argent mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 3, \"name\": \"Bank Transfer\", \"daily_limit\": \"1000000\", \"yearly_limit\": \"0\", \"monthly_limit\": \"10000000\", \"minimum_amount\": \"10\"}, {\"id\": 4, \"name\": \"Cash Pick-Up\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 2, \"name\": \"Mobile Money\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 5, \"name\": \"other\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 8, \"name\": \"Ramassage en espèces\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 9, \"name\": \"Recharge mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 6, \"name\": \"Virement Bancaire\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}]'),
(2, 'CAMEROON', 'CM', 'cameroon', 'XAF', 10.00, 10000.00, '6171d0c8eddcd1634848968.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 595.29813000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2021-09-13 02:37:00', '2023-10-22 08:16:57', '[{\"id\": 1, \"name\": \"Airtime\", \"daily_limit\": \"100\", \"yearly_limit\": \"50000\", \"monthly_limit\": \"5000\", \"minimum_amount\": \"50\"}, {\"id\": 7, \"name\": \"Argent mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 3, \"name\": \"Bank Transfer\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 4, \"name\": \"Cash Pick-Up\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 2, \"name\": \"Mobile Money\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 5, \"name\": \"other\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 8, \"name\": \"Ramassage en espèces\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 9, \"name\": \"Recharge mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 6, \"name\": \"Virement Bancaire\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}]'),
(3, 'GERMANY', 'DE', 'germany', 'EUR', 10.00, 1500.00, '6171d0ad3f3f41634848941.png', 4, '[{\"id\":1,\"name\":\"Airtime\"}]', NULL, 0.90741787, 90.00, 500.00, 10900.00, 1, 1, 1, '<p>You can only send a maximum of 2000€ </p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><img src=\"https://detracash.com/assets/uploads/blog/6307937c796651661440892.jpg\" alt=\"6307937c796651661440892.jpg\"></p><p><br></p>', '2021-10-21 16:54:22', '2023-10-22 10:37:02', '[{\"id\": 1, \"name\": \"Airtime\", \"daily_limit\": \"400\", \"yearly_limit\": \"40000\", \"monthly_limit\": \"1000\", \"minimum_amount\": \"10\"}, {\"id\": 7, \"name\": \"Argent mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 3, \"name\": \"Bank Transfer\", \"daily_limit\": \"400\", \"yearly_limit\": \"0\", \"monthly_limit\": \"700\", \"minimum_amount\": \"10\"}, {\"id\": 4, \"name\": \"Cash Pick-Up\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 2, \"name\": \"Mobile Money\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 5, \"name\": \"other\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 8, \"name\": \"Ramassage en espèces\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 9, \"name\": \"Recharge mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 6, \"name\": \"Virement Bancaire\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}]'),
(4, 'FRANCE', 'FR', 'france', 'EUR', 10.00, 1500.00, '614c1d94d5bb31632378260.gif', 4, '[{\"id\":1,\"name\":\"Airtime\"}]', NULL, 0.90741787, 0.00, 0.00, 0.00, 1, 1, 0, '', '2021-09-13 03:00:25', '2023-03-14 04:38:10', NULL),
(5, 'UK', 'GB', 'uk', 'GBP', 10.00, 100.00, '614c1dcf62c391632378319.gif', 4, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 0.75990562, 190.00, 800.00, 8000.00, 1, 1, 0, '', '2021-09-13 03:02:35', '2023-09-03 01:16:43', NULL),
(6, 'CANADA', 'CA', 'canada', 'CAD', 10.00, 1000.00, '614c1d6c7bc961632378220.gif', 5, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 1.25931430, 0.00, 0.00, 0.00, 1, 1, 1, '', '2021-09-13 03:05:01', '2023-10-08 15:15:41', '[{\"id\": 1, \"name\": \"Airtime\", \"daily_limit\": \"100\", \"yearly_limit\": \"10000\", \"monthly_limit\": \"1000\", \"minimum_amount\": \"50\"}, {\"id\": 4, \"name\": \"Cash Pick-Up\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}]'),
(7, 'Bangladesh', 'BD', 'bangladesh', 'BDT', 20.00, 100.00, '616bb80d53a231634449421.jpg', 1, '[{\"id\":1,\"name\":\"Airtem\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"},{\"id\":5,\"name\":\"other\"},{\"id\":7,\"name\":\"Argent mobile\"}]', '[{\"id\":2,\"name\":\"Bank Name\",\"service_id\":3},{\"id\":3,\"name\":\"Bank Number\",\"service_id\":3},{\"id\":7,\"name\":\"Nubmer\",\"service_id\":1},{\"id\":8,\"name\":\"Number\",\"service_id\":2}]', 85.00000000, 0.00, 0.00, 0.00, 1, 1, 1, '', '2021-10-16 23:43:41', '2024-01-11 23:24:36', NULL),
(8, 'USA', 'US', 'usa', 'USD', 10.00, 100.00, '614c1ebc800871632378556.gif', 5, '[{\"id\":1,\"name\":\"Airtime\"}]', NULL, 1.00000000, 0.00, 0.00, 0.00, 1, 1, 1, '', '2021-09-13 02:40:01', '2023-03-14 04:42:21', NULL),
(9, 'GHANA', 'GH', 'ghana', 'GHS', 100.00, 10000.00, '61b906b9456c41639515833.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"}]', NULL, 7.29285650, 0.00, 0.00, 0.00, 1, 0, 1, '', '2021-12-14 20:03:53', '2023-05-28 15:01:12', NULL),
(10, 'ITALY', 'IT', 'italy', 'EUR', 5.00, 1000.00, '61cdf7d266cf21640888274.png', 4, '[{\"id\":1,\"name\":\"Airtime\"}]', NULL, 0.90741787, 0.00, 0.00, 0.00, 1, 1, 1, '', '2021-12-30 17:17:54', '2023-05-28 15:02:02', NULL),
(11, 'COTE D\'IVOIRE', 'CI', 'cote-divoire', 'XOF', 7000.00, 60000.00, '622e21b4a36291647190452.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":3,\"name\":\"Bank Transfer\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 595.20309000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2022-03-13 15:52:21', '2023-05-28 15:00:28', NULL),
(12, 'KENYA', 'KE', 'kenya', 'KES', 1142.00, 114198.00, '622e2504979141647191300.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 114.45888000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2022-03-13 16:08:20', '2023-05-28 15:04:34', NULL),
(13, 'NIGERIA (USD)', 'NG', 'nigeria-usd', 'USD', 10.00, 4000.00, '62eff192c28601659892114.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"},{\"id\":4,\"name\":\"Cash Pick-Up\"}]', NULL, 1.00000000, 0.00, 0.00, 0.00, 1, 0, 1, '<h2><span><b>Sending Dollars to Nigeria made Easy</b></span></h2><p><span><br /></span></p><p><span>To ensure that we meet regulations which have been enacted by the Nigerian government with regards to money transfer, we have updated and upgraded our capabilities to meet those requirements for customers/ users to transfer money to bank accounts in Nigeria which support dollars intake</span>. </p><p><br /></p><p><img src=\"https://detracash.com/assets/uploads/blog/6307937c796651661440892.jpg\" alt=\"6307937c796651661440892.jpg\" /><span>﻿</span></p><p>For sending Dollars to Nigeria</p>', '2022-08-07 15:05:18', '2023-05-28 15:05:47', NULL),
(14, 'ZAMBIA', 'ZM', 'zambia', 'ZMK', 70000.00, 100000.00, '63cad2cdea1251674236621.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"}]', NULL, 16.00000000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2022-11-04 18:54:39', '2023-05-28 15:08:46', NULL),
(15, 'RWANDA', 'RW', 'rwanda', 'RWF', 11000.00, 3149797.00, '63cad26b8e4061674236523.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"}]', NULL, 1.00000000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2022-11-04 19:23:23', '2023-05-28 15:06:44', NULL),
(16, 'UGANDA', 'UG', 'uganda', 'UGX', 50000.00, 1000000.00, '63d555509ae5f1674925392.png', 3, '[{\"id\":1,\"name\":\"Airtime\"},{\"id\":2,\"name\":\"Mobile Money\"},{\"id\":3,\"name\":\"Bank Transfer\"}]', NULL, 3.00000000, 0.00, 0.00, 0.00, 1, 0, 1, '', '2023-01-28 16:00:54', '2023-05-28 15:07:49', NULL),
(17, 'bgfgbhb', 'DZ', 'bgfgbhb', 'gtvwde', 10.00, 1000.00, NULL, 4, '[{\"id\":2,\"name\":\"Mobile Money\"}]', NULL, 12.00000000, 123.00, 1111.00, 11111.00, 1, 0, 0, '<p>fvgdvgvbg</p>', '2023-09-02 13:01:26', '2023-10-11 16:32:01', '[{\"id\": 1, \"name\": \"Airtime\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"10\"}, {\"id\": 7, \"name\": \"Argent mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"100\"}, {\"id\": 3, \"name\": \"Bank Transfer\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 4, \"name\": \"Cash Pick-Up\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 2, \"name\": \"Mobile Money\", \"daily_limit\": \"400\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"100\"}, {\"id\": 5, \"name\": \"other\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 8, \"name\": \"Ramassage en espèces\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 9, \"name\": \"Recharge mobile\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}, {\"id\": 6, \"name\": \"Virement Bancaire\", \"daily_limit\": \"0\", \"yearly_limit\": \"0\", \"monthly_limit\": \"0\", \"minimum_amount\": \"0\"}]'),
(18, 'cda', 'AL', 'cda', 'gtv', 23.00, 23323.00, NULL, 2, '[{\"id\":3,\"name\":\"Bank Transfer\"}]', NULL, 123.00000000, 323.00, 234.00, 2323.00, 1, 1, 1, '<p>drfrsf</p>', '2023-09-02 13:35:42', '2023-09-02 13:36:45', NULL),
(19, 'cvfvfv', 'AL', 'cvfvfv', '779843', 342243.00, 234343434.00, NULL, 1, '[{\"id\":3,\"name\":\"Bank Transfer\"}]', NULL, 1234.00000000, 0.00, 0.00, 0.00, 1, 1, 1, '<p>fvdfvdfvdfvfdvf</p>', '2023-09-05 01:56:45', '2023-09-05 02:08:00', NULL),
(20, 'Ridoy', 'RW', 'ridoy', 'EUR', 123.00, 1000.00, NULL, 1, '[{\"id\":7,\"name\":\"Argent mobile\"}]', NULL, 123.00000000, 0.00, 0.00, 0.00, 1, 1, 1, '<p>ridoy</p>', '2023-09-05 04:54:59', '2023-09-05 04:54:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_langs`
--

CREATE TABLE `country_langs` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `country_langs`
--

INSERT INTO `country_langs` (`id`, `country_id`, `name`, `status`, `created_at`, `updated_at`, `language_id`) VALUES
(1, 2, 'CAMEROON', 0, '2023-03-14 04:37:04', '2023-03-14 04:37:04', 1),
(2, 2, 'CAMEROUN', 0, '2023-03-14 04:37:04', '2023-03-14 04:37:04', 2),
(3, 6, 'CANADA', 0, '2023-03-14 04:37:19', '2023-03-14 04:37:19', 1),
(4, 6, 'CANADA', 0, '2023-03-14 04:37:19', '2023-03-14 04:37:19', 2),
(5, 11, 'COTE D\'IVOIRE', 0, '2023-03-14 04:37:49', '2023-05-28 14:59:07', 1),
(6, 11, 'COTE D\'IVOIRE', 0, '2023-03-14 04:37:49', '2023-05-28 15:00:28', 2),
(7, 4, 'FRANCE', 0, '2023-03-14 04:38:10', '2023-03-14 04:38:10', 1),
(8, 4, 'FRANCE', 0, '2023-03-14 04:38:10', '2023-03-14 04:38:10', 2),
(9, 3, 'GERMANY', 0, '2023-03-14 04:38:37', '2023-05-28 14:59:59', 1),
(10, 3, 'ALLEMAGNE', 0, '2023-03-14 04:38:37', '2023-05-28 14:59:59', 2),
(11, 9, 'GHANA', 0, '2023-03-14 04:39:05', '2023-05-28 15:01:12', 1),
(12, 9, 'GHANA', 0, '2023-03-14 04:39:05', '2023-05-28 15:01:12', 2),
(13, 10, 'ITALY', 0, '2023-03-14 04:39:33', '2023-05-28 15:02:02', 1),
(14, 10, 'ITALIE', 0, '2023-03-14 04:39:33', '2023-05-28 15:02:02', 2),
(15, 12, 'KENYA', 0, '2023-03-14 04:39:55', '2023-05-28 15:04:34', 1),
(16, 12, 'KENYA', 0, '2023-03-14 04:39:55', '2023-05-28 15:04:34', 2),
(17, 1, 'NIGERIA', 0, '2023-03-14 04:40:19', '2023-03-14 04:40:19', 1),
(18, 1, 'NIGERIA', 0, '2023-03-14 04:40:19', '2023-03-14 04:40:19', 2),
(19, 13, 'NIGERIA (USD)', 0, '2023-03-14 04:40:46', '2023-05-28 15:05:47', 1),
(20, 13, 'NIGERIA (USD)', 0, '2023-03-14 04:40:46', '2023-05-28 15:05:47', 2),
(21, 15, 'RWANDA', 0, '2023-03-14 04:41:11', '2023-05-28 15:06:44', 1),
(22, 15, 'RWANDA', 0, '2023-03-14 04:41:11', '2023-05-28 15:06:44', 2),
(23, 16, 'UGANDA', 0, '2023-03-14 04:41:35', '2023-05-28 15:07:49', 1),
(24, 16, 'OUGANDA', 0, '2023-03-14 04:41:35', '2023-05-28 15:07:49', 2),
(25, 5, 'UK', 0, '2023-03-14 04:41:58', '2023-03-14 04:41:58', 1),
(26, 5, 'ROYAUME-UNI', 0, '2023-03-14 04:41:58', '2023-03-14 04:41:58', 2),
(27, 8, 'USA', 0, '2023-03-14 04:42:21', '2023-03-14 04:42:21', 1),
(28, 8, 'Etats-Unis', 0, '2023-03-14 04:42:21', '2023-03-14 04:42:21', 2),
(29, 14, 'ZAMBIA', 0, '2023-03-14 04:42:41', '2023-05-28 15:08:46', 1),
(30, 14, 'ZAMBIE', 0, '2023-03-14 04:42:41', '2023-05-28 15:08:46', 2),
(31, 17, 'bgfgbhb', 0, '2023-09-02 13:06:43', '2023-09-02 13:06:43', 1),
(32, 17, 'bgfgbhb', 0, '2023-09-02 13:06:43', '2023-09-02 13:06:43', 2),
(33, 18, 'cda', 0, '2023-09-02 13:36:45', '2023-09-02 13:36:45', 1),
(34, 18, 'cda', 0, '2023-09-02 13:36:45', '2023-09-02 13:36:45', 2),
(35, 19, 'cvfvfv', 0, '2023-09-05 02:08:00', '2023-09-05 02:08:00', 1),
(36, 19, 'cvfvfv', 0, '2023-09-05 02:08:00', '2023-09-05 02:08:00', 2),
(37, 7, 'Bangladesh', 0, '2024-01-09 02:33:36', '2024-01-09 02:33:36', 1),
(38, 7, 'Bangladesh', 0, '2024-01-09 02:33:36', '2024-01-09 02:33:36', 2),
(39, 7, 'Bangladesh', 0, '2024-01-09 02:33:36', '2024-01-09 02:33:36', 3);

-- --------------------------------------------------------

--
-- Table structure for table `country_services`
--

CREATE TABLE `country_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bank_code` varchar(15) DEFAULT NULL,
  `operatorId` int(11) DEFAULT NULL,
  `localMinAmount` int(11) DEFAULT NULL,
  `localMaxAmount` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `services_form` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `country_services`
--

INSERT INTO `country_services` (`id`, `name`, `bank_code`, `operatorId`, `localMinAmount`, `localMaxAmount`, `country_id`, `service_id`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(1, 'First Bank of Nigeria', '011', NULL, 0, 0, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, NULL, '2021-12-13 23:29:58'),
(2, 'Camtel', '', 677, 150, 500000, 2, 1, '[]', 1, '2021-10-16 23:40:21', '2022-11-01 20:14:27'),
(3, 'MTN ', NULL, 53, 100, 500000, 2, 1, '[]', 1, '2021-10-16 23:40:21', '2021-10-17 00:20:20'),
(4, 'Nexttel ', NULL, 679, 150, 500000, 2, 1, '[]', 1, '2021-10-16 23:40:21', '2021-10-17 00:20:20'),
(5, 'Orange ', NULL, 54, 150, 25000, 2, 1, '[]', 1, '2021-10-16 23:40:21', '2021-10-17 00:20:20'),
(6, 'Yoomee ', NULL, 680, 150, 500000, 2, 1, '[]', 1, '2021-10-16 23:40:21', '2021-10-17 00:20:20'),
(7, '9Mobile (Etisalat) ', NULL, 340, 50, 50000, 1, 1, '[]', 1, '2021-10-16 23:41:09', '2021-10-17 00:20:24'),
(8, 'Airtel ', NULL, 342, 50, 199999, 1, 1, '[]', 1, '2021-10-16 23:41:09', '2021-10-17 00:20:24'),
(9, 'Glo ', NULL, 344, 10, 50000, 1, 1, '[]', 1, '2021-10-16 23:41:09', '2021-10-17 00:20:24'),
(10, 'Glo  VOT PIN Service', NULL, 932, 5, 50000, 1, 1, '[]', 1, '2021-10-16 23:41:09', '2021-10-17 00:20:24'),
(11, 'MTN ', NULL, 341, 5, 50000, 1, 1, '[]', 1, '2021-10-16 23:41:09', '2021-10-17 00:20:24'),
(12, 'Airtel ', NULL, 26, 10, 1000, 7, 1, '[]', 1, '2021-10-16 23:44:09', '2022-11-04 19:02:40'),
(14, 'GrameenPhone ', NULL, 23, 10, 1000, 7, 1, '[]', 1, '2021-10-16 23:44:09', '2022-11-04 19:02:40'),
(15, 'Robi ', NULL, 25, 10, 1000, 7, 1, '[]', 1, '2021-10-16 23:44:09', '2022-11-04 19:02:40'),
(16, 'Teletalk ', NULL, 27, NULL, NULL, 7, 1, '[]', 1, '2021-10-16 23:44:09', '2022-11-01 20:44:48'),
(17, 'Banglalink ', NULL, 28, 10, 1000, 7, 1, '[]', 1, '2021-10-17 00:14:22', '2022-11-04 19:02:40'),
(18, 'Delight Mobile PIN England', NULL, 750, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(19, 'Econet PIN England', NULL, 536, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(20, 'EE PIN England', NULL, 535, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(21, 'Giff Gaff PIN England', NULL, 543, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(22, 'Lebara PIN England', NULL, 544, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(23, 'Lyca PIN England', NULL, 542, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(24, 'Now Mobile PIN England', NULL, 534, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(25, 'O2 PIN England', NULL, 533, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(26, 'Orange PIN England', NULL, 1005, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:39'),
(27, 'Overseas-Topup PIN England', NULL, 756, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(28, 'Talk Home APP PIN England', NULL, 1006, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(29, 'Talk Home Mobile PIN England', NULL, 1004, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(30, 'Talk Mobile PIN England', NULL, 539, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(31, 'Tesco Mobile PIN England', NULL, 540, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(32, 'Three PIN England', NULL, 532, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(33, 'UK Baby Calling Card', NULL, 745, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(34, 'UK Bangladesh Calling Card', NULL, 746, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(35, 'UK Cherry Calling Card', NULL, 747, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(36, 'UK Chili Talk Calling Card', NULL, 748, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(37, 'UK Cobra Calling Card', NULL, 749, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(38, 'UK Eurocity Calling Card', NULL, 751, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(39, 'UK Halal Africa Calling Card', NULL, 752, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(40, 'UK King Talk Calling Card', NULL, 753, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(41, 'UK Maxi Talk Calling Card', NULL, 754, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(42, 'UK Minute Master Calling Card', NULL, 755, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(43, 'UK Pure Calling Card', NULL, 757, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(44, 'UK Runner Calling Card', NULL, 758, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(45, 'UK Safari Talk Calling Card', NULL, 759, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(46, 'UK Speak Calling Card', NULL, 760, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(47, 'UK Spicy Tel Calling Card', NULL, 761, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(48, 'UK Talk Direct Calling Card', NULL, 762, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(49, 'UK Talk Home Calling Card', NULL, 763, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(50, 'UK White Mobile Calling Card', NULL, 766, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(51, 'UK Zabardasth Calling Card', NULL, 767, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(52, 'UK Zero Zero Calling Card', NULL, 768, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(53, 'Vectone Mobile PIN England', NULL, 764, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(54, 'Virgin Mobile PIN England', NULL, 531, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(55, 'Vizz Mobile PIN England', NULL, 541, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(56, 'Vodafone PIN England', NULL, 538, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(57, 'White Mobile PIN England', NULL, 765, NULL, NULL, 5, 1, '[]', 1, '2021-10-17 20:11:25', '2022-03-13 15:40:40'),
(58, 'Access Wireless PIN USA', NULL, 581, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(59, 'Airlink Mobile PIN USA', NULL, 549, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(60, 'Airvoice Feel Safe PIN USA', NULL, 567, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(61, 'Airvoice GSM PIN USA', NULL, 557, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(62, 'Airvoice TT PIN USA', NULL, 565, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(63, 'AT&T PIN USA', NULL, 967, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(64, 'AT&T RTR USA', NULL, 554, 10, 500, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:12:25'),
(65, 'Boost Mobile RTR USA', NULL, 550, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(66, 'Cricket Paygo RTR USA', NULL, 558, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(67, 'EasyGo RTR PayGo US', NULL, 949, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(68, 'EasyGo RTR Unlimited US', NULL, 950, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:25', '2021-10-17 20:22:19'),
(69, 'Good2go PIN USA', NULL, 564, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(70, 'GoSmart RTR USA', NULL, 580, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(71, 'GoSmart Unlimited TT ILD PIN USA', NULL, 579, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(72, 'GoSmart Unlimited TTD PIN USA', NULL, 556, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(73, 'H2O Bolt LTE RTR USA', NULL, 709, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(74, 'H2O PayGo PIN USA (Minute plans)', NULL, 560, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(75, 'H2O PayGo RTR USA', NULL, 588, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(76, 'H2o RTR Multi-Line US', NULL, 953, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(77, 'H2o RTR US', NULL, 952, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(78, 'H2O Unlimited RTR USA', NULL, 574, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(79, 'Liberty Mobile PIN USA (monthly plans)', NULL, 711, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(80, 'Life Wireless PIN USA', NULL, 547, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(81, 'Lyca Mobile RTR Pay-Go US', NULL, 955, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(82, 'Lyca Mobile RTR Unlimited US', NULL, 956, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(83, 'Lyca Mobile USA', NULL, 575, 11, 101, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:12:26'),
(84, 'MetroPCS RTR USA', NULL, 577, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(85, 'Movida PIN USA', NULL, 571, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(86, 'Net10 PIN', NULL, 552, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(87, 'Net10 RTR USA', NULL, 592, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(88, 'Page Plus Monthly RTR', NULL, 959, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(89, 'Page Plus PayGo RTR', NULL, 970, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(90, 'PagePlus PIN USA', NULL, 566, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(91, 'ReachOut PIN USA', NULL, 590, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(92, 'Safelink Wireless CA USA', NULL, 546, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(93, 'Safelink Wireless PIN USA', NULL, 551, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(94, 'Simple Mobile Family RTR', NULL, 964, 10, 200, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:12:26'),
(95, 'SimpleMobile PIN USA', NULL, 568, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(96, 'SimpleMobile RTR USA', NULL, 572, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(97, 'T-Mobile USA RTR', NULL, 548, 10, 200, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:12:26'),
(98, 'Total Wireless PIN', NULL, 969, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(99, 'Total Wireless RTR', NULL, 960, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(100, 'Tracfone PIN USA', NULL, 545, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(101, 'Tracfone RTR USA', NULL, 573, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(102, 'TracFone Unlimited PIN', NULL, 961, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(103, 'TracFone Unlimited RTR', NULL, 962, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(104, 'Ultra Mobile USA', NULL, 562, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(105, 'Ultra Mobile USA Flex Plan', NULL, 968, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(106, 'Verizon PIN', NULL, 614, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(107, 'Verizon USA', NULL, 563, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(108, 'Viber USA', NULL, 591, 10, 2000, 3, 1, '[]', 1, '2021-10-17 20:12:26', '2021-10-17 20:22:19'),
(109, 'BILDMobil PIN', '', 848, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2023-01-28 16:58:27'),
(110, 'Blau PIN ', NULL, 849, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(111, 'Congstar PIN ', NULL, 850, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(112, 'Deutsche Telekom PIN ', NULL, 664, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(113, 'E-Plus PIN ', NULL, 852, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(114, 'FONIC PIN ', NULL, 853, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(115, 'Klarmobil PIN ', NULL, 854, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(116, 'Lebara Ghana PIN ', NULL, 858, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(117, 'Lebara PIN ', NULL, 855, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(118, 'Lifecell PIN ', NULL, 149, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(119, 'Lycamobile AllNet Plus PIN ', NULL, 866, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(120, 'Lycamobile PIN ', NULL, 864, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(121, 'O2 PIN ', NULL, 868, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(122, 'Ortel PIN ', NULL, 665, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(123, 'Otelo PIN ', NULL, 867, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(124, 'SimGuthaben PIN ', NULL, 870, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(125, 'Simyo PIN ', NULL, 871, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(126, 'Tchibo Mobile PIN ', NULL, 872, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(127, 'Telekom PIN ', NULL, 873, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(128, 'Turkcell PIN ', NULL, 874, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(129, 'Vodafone PIN ', NULL, 875, NULL, NULL, 8, 1, '[]', 1, '2021-10-21 16:55:08', '2021-10-21 16:55:08'),
(130, 'Access Bank', '044', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 22:58:35', '2021-12-13 23:29:58'),
(131, 'Access Diamond Bank', '063', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"20\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 22:59:21', '2021-12-13 22:59:21'),
(132, 'Page MFBank', '560', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(133, 'Stanbic Mobile Money', '304', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(134, 'FortisMobile', '308', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(135, 'TagPay', '328', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(136, 'FBNMobile', '309', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(137, 'Sterling Mobile', '326', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(138, 'Omoluabi Mortgage Bank', '990', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(139, 'ReadyCash (Parkway)', '311', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(140, 'Zenith Bank', '057', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(141, 'Standard Chartered Bank', '068', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(142, 'eTranzact', '306', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(143, 'Fidelity Bank', '070', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(144, 'CitiBank', '023', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(145, 'Unity Bank', '215', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(146, 'Access Money', '323', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(147, 'Eartholeum', '302', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(148, 'Hedonmark', '324', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(149, 'MoneyBox', '325', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(150, 'JAIZ Bank', '301', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(151, 'Ecobank Plc', '050', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(152, 'EcoMobile', '307', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(153, 'Fidelity Mobile', '318', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(154, 'TeasyMobile', '319', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(155, 'NIP Virtual Bank', '999', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(156, 'VTNetworks', '320', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(157, 'Stanbic IBTC Bank', '221', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(158, 'Fortis Microfinance Bank', '501', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(159, 'PayAttitude Online', '329', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(160, 'ZenithMobile', '322', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(161, 'ChamsMobile', '303', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(162, 'SafeTrust Mortgage Bank', '403', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(163, 'Covenant Microfinance Bank', '551', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(164, 'Imperial Homes Mortgage Bank', '415', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(165, 'NPF MicroFinance Bank', '552', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(166, 'Parralex', '526', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(167, 'Wema Bank', '035', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(168, 'Enterprise Bank', '084', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(169, 'Diamond Bank', '063', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(170, 'Paycom', '305', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(171, 'SunTrust Bank', '100', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(172, 'Cellulant', '317', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(173, 'ASO Savings and & Loans', '401', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(174, 'Heritage', '030', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(175, 'Jubilee Life Mortgage Bank', '402', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(176, 'GTBank Plc', '058', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(177, 'Union Bank', '032', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(178, 'Sterling Bank', '232', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(179, 'Skye Bank', '076', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(180, 'Keystone Bank', '082', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(181, 'Pagatech', '327', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(182, 'Coronation Merchant Bank', '559', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(183, 'FSDH', '601', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(184, 'Mkudi', '313', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(185, 'First City Monument Bank', '214', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(186, 'FET', '314', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(187, 'Trustbond', '523', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(188, 'GTMobile', '315', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(189, 'United Bank for Africa', '033', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(190, 'TCF MFB', '90115', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(191, 'HighStreet MFB bank', '090175', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-13 23:29:58', '2021-12-13 23:29:58'),
(192, 'Mobile Money', 'FMM', NULL, NULL, NULL, 2, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(193, 'AFRILAND FIRST BANK', 'CM10005', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(194, 'BANQUE ATLANTIQUE DU CAMEROUN', 'CM10034', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(195, 'BANQUE DES PME', 'CM10036', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(196, 'BANQUE INTERNATIONALE DU CAMEROUN POUR L\'EPARGNE ET LE CREDIT', 'CM10001', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(197, 'BGFI BANK CAMEROUN', 'CM10035', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(198, 'CITIBANK', 'CM10007', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(199, 'COMMERCIAL BANK CAMEROUN', 'CM10008', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(200, 'CREDIT FONCIER DU CAMEROUN', 'CM10019', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(201, 'ECOBANK CAMEROUN', 'CM029000', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(202, 'NATIONAL FINANCIAL CREDIT BANK', 'CM10025', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49');
INSERT INTO `country_services` (`id`, `name`, `bank_code`, `operatorId`, `localMinAmount`, `localMaxAmount`, `country_id`, `service_id`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(203, 'STANDARD CHARTERED BANK', 'CM10004', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(204, 'UNION BANK CAMEROUN', 'CM10023', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(205, 'UNITED BANK OF AFRICA', 'CM10033', NULL, NULL, NULL, 2, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(206, 'EUMOBILE', 'EUMOBILE', NULL, NULL, NULL, 2, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 08:52:49', '2021-12-14 08:52:49'),
(207, 'Airtel-Tigo ', NULL, 153, 1, 500, 9, 1, '[]', 1, '2021-12-14 20:05:17', '2021-12-14 20:05:17'),
(208, 'Glo ', NULL, 152, 1, 100, 9, 1, '[]', 1, '2021-12-14 20:05:17', '2021-12-14 20:05:17'),
(209, 'MTN ', NULL, 150, 1, 500, 9, 1, '[]', 1, '2021-12-14 20:05:17', '2021-12-14 20:05:17'),
(210, 'Surfline ', NULL, 769, 1, 100, 9, 1, '[]', 1, '2021-12-14 20:05:17', '2021-12-14 20:05:17'),
(211, 'Vodafone ', NULL, 155, 1, 100, 9, 1, '[]', 1, '2021-12-14 20:05:17', '2021-12-14 20:05:17'),
(212, 'MTN Mobile Money', 'MTN', NULL, NULL, NULL, 9, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(213, 'TIGO Mobile Money', 'TIGO', NULL, NULL, NULL, 9, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(214, 'Vodafone Mobile Money', 'VODAFONE', NULL, NULL, NULL, 9, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(215, 'Airtel Mobile Money', 'AIRTEL', NULL, NULL, NULL, 9, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(216, 'The Hongkong and Shanghai Banking Corporation Limited', '10550214', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(217, 'Giro Elszamolasforgalmi Zrt.', '11088200', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(218, 'First National Bank Ghana Limited', '11276282', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(219, 'OMNIBANK GHANA LIMITED', '11299458', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(220, 'GHL Bank Ltd', '11319374', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(221, 'Consolidated Bank Ghana Limited', '11350352', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(222, 'GH PREPAID', '1812142W72', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(223, ' VISA', '190815670S', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(224, 'Standard Chartered Bk Ghana Int', '2006168ICS', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(225, 'UNITED BANK FOR AFRICA (GHANA) LTD', '2006228LG0', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(226, 'Partner Banka d.d.', '20112200', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(227, 'Agricultural Development Bank Limited', '20313200', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(228, 'Bank of Ghana', '20313400', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(229, 'Barclays Bank of Ghana Limited', '20313500', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(230, 'GCB Bank Limited', '20313600', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(231, 'Universal Merchant Bank', '20313800', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(232, 'National Investment Bank Ltd', '20313900', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(233, 'Societe Generale Ghana Limited', '20314100', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(234, 'Standard Chartered Bank Ghana Limited', '20314200', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(235, 'Societe Generale Haitienne de Banque S.A. (Sogebank)', '20321900', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(236, 'BNG Bank N V', '20497300', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(237, 'Cal Bank Limited', '22031960', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(238, 'DBS Group Holdings Ltd', '25449292', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(239, 'Financial Brokerage Group (Fbg)', '25528546', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(240, 'Arb Apex Bank Limited', '25544088', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(241, 'Stock Exchange Of Hong Kong Ltd, The', '25549518', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(242, 'Guaranty Trust Bank (Ghana) Ltd', '25562284', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(243, 'Fidelity Bank Ghana Ltd.', '25570554', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(244, 'Banque Sahelo-Saharienne Pour LInvestissment et le Commerce (Ghana) Lt', '25785380', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(245, 'Guaranty Trust Bank (UK) Limited', '25817360', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:23', '2021-12-14 20:05:23'),
(246, 'Bank of Baroda (Ghana) Limited', '25892776', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(247, 'Gatehouse Bank Plc', '25897096', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(248, 'Access Bank (Ghana) PLC', '26153374', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(249, 'Noble Group Ltd', '26153460', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(250, 'Ghazanfar Bank', '26156818', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(251, 'Social Security And National Insurance Trust', '26545578', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(252, 'Energy Bank Ghana Limited', '26675842', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(253, 'Ghana Revenue Authority', '26699422', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(254, 'Pacific Eagle Asset Management Ltd', '26708398', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(255, 'Independent Petroleum Group', '26852136', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(256, 'Controller And Accountant-GeneralS Department', '26935088', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(257, 'Partners Group AG', '26935170', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(258, 'Compass Global Holdings Pty Ltd', '26955918', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(259, 'Global Exchange Centre Limited', '27096388', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(260, 'Volta River Authority', '27108818', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(261, 'Norma Group Holding', '27127004', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(262, 'Tronox Global Holdings Pty Limited', '27208826', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(263, 'Cqlt Saargummi Technologies SAR.l', '27209142', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(264, 'Pigeon Corporation', '27257744', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(265, 'Ping An Of China Asset Management (Hong Kong) Company Ltd', '27349456', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(266, 'Gebr. Heinemann Se And Co.KG', '27352014', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(267, 'Cgnpc Huasheng Investment Limited', '27404306', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(268, 'Premium Bank Ghana Limited', '27451510', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(269, 'G.H. Financials Ltd', '27452668', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(270, 'Asahi Group Holdings, Ltd.', '27457008', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(271, 'Heritage Bank Limited', '27462484', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(272, 'Grabtaxi Holdings PTE LTD', '27464082', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(273, 'Al Ghurair International Exchange', '27466360', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(274, 'Dogan Sirketler Grubu Holding AS', '27547278', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(275, 'GN Bank Limited', '50480908', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(276, 'Banque Populaire de Rabat-Kenitra', '60002121', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(277, 'Prudential Bank Ltd', '60003190', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(278, 'First Atlantic Bank Ltd', '60003191', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(279, 'FBN Bank (Ghana) Limited', '60003193', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(280, 'Privredna banka Zagreb d.d.', '96683220', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(281, 'Ghana International Bank plc', '96788653', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(282, 'Republic Bank (Ghana) Ltd', '96793657', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(283, 'Guaranty Trust Bank Kenya Limited', '96855152', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(284, 'Stanbic Bank Ghana Limited', '97151844', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(285, 'Bank of Africa - Ghana', '97155860', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(286, 'ZENITH BANK (GHANA) LIMITED', '98357706', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(287, 'FINANCIJSKA AGENCIJA', '99730556', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(288, 'Ecobank Ghana (GH130100)', 'GH130100', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-12-14 20:05:24', '2021-12-14 20:05:24'),
(289, 'TIM ', NULL, 249, NULL, NULL, 10, 1, '[]', 1, '2021-12-30 17:18:31', '2021-12-30 17:18:31'),
(290, 'Vodafone ', NULL, 248, NULL, NULL, 10, 1, '[]', 1, '2021-12-30 17:18:31', '2021-12-30 17:18:31'),
(291, 'Wind ', NULL, 250, NULL, NULL, 10, 1, '[]', 1, '2021-12-30 17:18:31', '2021-12-30 17:18:31'),
(292, 'Auchan Telecom PIN ', NULL, 913, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(293, 'Bouygues PIN ', NULL, 652, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(294, 'Bouygues PIN  International', NULL, 656, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(295, 'eKERTEL Afrique PIN ', NULL, 922, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(296, 'eKERTEL Asie PIN ', NULL, 917, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(297, 'eKERTEL Europe PIN ', NULL, 923, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(298, 'eKERTEL  Monde PIN ', NULL, 924, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(299, 'eKERTEL Maghreb PIN ', NULL, 925, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(300, 'Intercall Afrique PIN ', NULL, 914, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(301, 'Intercall Kingphone PIN ', NULL, 930, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(302, 'Intercall Maghreb PIN ', NULL, 915, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(303, 'Intercall Streetphone PIN ', NULL, 929, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(304, 'La Poste PIN ', NULL, 661, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(305, 'Lebara PIN ', NULL, 662, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(306, 'Lyca PIN ', NULL, 651, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(307, 'Mobiho PIN ', NULL, 916, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(308, 'Orange PIN ', NULL, 133, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(309, 'SFR PIN ', NULL, 136, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(310, 'Syma Mobile PIN ', NULL, 658, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(311, 'Symacom Pass International PIN ', NULL, 919, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(312, 'Symacom Pass Ivory Coast PIN ', NULL, 918, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(313, 'Symacom Pass MALI PIN ', NULL, 920, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(314, 'Symacom Pass SENEGAL PIN ', NULL, 921, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(315, 'Vectone Mobile PIN ', NULL, 663, NULL, NULL, 4, 1, '[]', 1, '2021-12-30 17:20:30', '2021-12-30 17:20:30'),
(316, 'First bank of Nigeria', '', NULL, NULL, NULL, 1, 4, '[]', 1, '2022-03-12 14:20:04', '2022-03-12 14:20:04'),
(317, 'Access Bank', '', NULL, NULL, NULL, 1, 4, '[]', 1, '2022-03-12 14:26:12', '2022-03-12 14:26:12'),
(318, 'Ecobank', '', NULL, NULL, NULL, 2, 4, '[]', 1, '2022-03-12 14:27:45', '2022-03-12 14:27:45'),
(319, 'National Financial Credit', '', NULL, NULL, NULL, 2, 4, '[]', 1, '2022-03-12 14:28:24', '2022-03-12 14:28:24'),
(320, 'Bell Mobility ', NULL, 56, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(321, 'Bell MTS ', NULL, 57, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(322, 'ChatR ', NULL, 63, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(323, 'Fido ', NULL, 58, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(324, 'Freedom Mobile ', NULL, 61, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(325, 'Koodo ', NULL, 59, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(326, 'Lucky Mobile ', NULL, 675, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(327, 'Public Mobile ', NULL, 64, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(328, 'Rogers Wireless ', NULL, 62, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(329, 'SaskTel ', NULL, 676, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(330, 'Telus ', NULL, 55, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(331, 'Virgin Mobile ', NULL, 65, NULL, NULL, 6, 1, '[]', 1, '2022-03-13 15:32:59', '2022-03-13 15:32:59'),
(332, 'Moov Ivory Coast', NULL, 254, 150, 100000, 11, 1, '[]', 1, '2022-03-13 15:54:25', '2022-03-13 15:54:25'),
(333, 'MTN Ivory Coast', NULL, 253, 50, 100000, 11, 1, '[]', 1, '2022-03-13 15:54:25', '2022-03-13 15:54:25'),
(334, 'Orange Ivory Coast', NULL, 252, NULL, NULL, 11, 1, '[]', 1, '2022-03-13 15:54:25', '2022-03-13 15:54:25'),
(335, 'AccSouth Sudan Bank', 'CI106', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(336, 'BACI - Banque Atlantique Côte dIvoire', 'CI034', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(337, 'Bank Of Africa', 'CI032', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(338, 'BANQUE DE L UNION', 'CI180', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(339, 'BANQUE DU TRESOR COTE DIVOIRE', 'CI650', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(340, 'Banque Internat pour le Com et lInd de', 'CI148100', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(341, 'BANQUE MALIENNE DE SOLIDARITE', 'CI188', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(342, 'BFA - Banque Financement Agriculture', 'CI114', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32');
INSERT INTO `country_services` (`id`, `name`, `bank_code`, `operatorId`, `localMinAmount`, `localMaxAmount`, `country_id`, `service_id`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(343, 'BGFI BANK', 'CI162', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(344, 'BHCI - Banque Habitat de Côte dIvoire', 'CI068', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(345, 'BIAO', 'CI042', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(346, 'BICICI', 'CI006', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(347, 'BNI - Banque Nationale dInvestissement', 'CI092', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(348, 'Bridge Bank Group - Côte dIvoire', 'CI131', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(349, 'BSIC Bank', 'CI154', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(350, 'Citibank', 'CI118', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(351, 'CNCE - Caisse Nat des Caisses Epargne', 'CI155', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(352, 'COFIPA Investment Bank', 'CI071', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(353, 'CORIS BANK', 'CI166', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(354, 'Diamond Bank Côte dIvoire', 'CI158', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(355, 'Ecobank', 'CI059', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(356, 'GT Bank Cote d Ivoire', 'CI163', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(357, 'ORABANK', 'CI121', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(358, 'SGBCI-Societe Generale de Banques', 'CI008', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(359, 'SIB - Société Ivoirienne de Banque', 'CI007', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(360, 'Standard Chartered Bank', 'CI097', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(361, 'United Bank of Africa', 'CI150', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(362, 'Versus Bank', 'CI112', NULL, NULL, NULL, 11, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(363, 'Mobile Money', 'FMM', NULL, NULL, NULL, 11, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 15:54:32', '2022-03-13 15:54:32'),
(364, 'Bank Of Africa', '', NULL, NULL, NULL, 11, 4, '[]', 1, '2022-03-13 15:56:04', '2022-03-13 15:56:04'),
(365, 'Airtel ', NULL, 265, 10, 10000, 12, 1, '[]', 1, '2022-03-13 16:09:22', '2022-03-13 16:09:22'),
(366, 'Orange ', NULL, 636, NULL, NULL, 12, 1, '[]', 1, '2022-03-13 16:09:22', '2022-03-13 16:09:22'),
(367, 'Safaricom ', NULL, 266, 5, 10000, 12, 1, '[]', 1, '2022-03-13 16:09:22', '2022-03-13 16:09:22'),
(368, 'Telkom ', NULL, 264, 10, 10000, 12, 1, '[]', 1, '2022-03-13 16:09:22', '2022-03-13 16:09:22'),
(369, 'Kenya Commercial Bank Limited', '01', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(370, 'Co-operative Bank of Kenya Limited', '11', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(371, 'CFC Stanbic Bank Kenya Limited', '31', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(372, 'NIC Bank Limited', '41', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(373, 'Jamii Bora Bank', '51', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(374, 'Housing Finance Bank', '61', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(375, 'Oriental Commercial Bank Limited', '14', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(376, 'Victoria Commercial Bank Limited', '54', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(377, 'Commercial Bank of Africa Limited', '07', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(378, 'Equatorial Commercial Bank Limited', '49', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(379, 'Investments n Mortgages Bank Limited', '57', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(380, 'Imperial Bank Limited', '39', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(381, 'National Bank of Kenya Limited', '12', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(382, 'Gulf African Bank Ltd', '72', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(383, 'Credit Bank Limited', '25', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(384, 'African Banking Corp. Bank Ltd', '35', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(385, 'First Community Bank', '74', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(386, 'Guardian Bank Limited', '55', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(387, 'Prime Bank Limited', '10', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(388, 'Dubai Bank Kenya Limited', '20', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(389, 'Chase Bank Limited', '30', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(390, 'Paramount Universal Bank Limited', '50', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(391, 'Family Bank Ltd', '70', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(392, 'Consolidated Bank of Kenya Limited', '23', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(393, 'Middle East Bank Kenya Limited', '18', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(394, 'Diamond Trust Bank Limited', '63', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(395, 'Citibank N.A.', '16', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(396, 'Trans-National Bank Limited', '26', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(397, 'Equity Bank Limited', '68', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(398, 'K-Rep Bank Limited', '66', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(399, 'UBA Kenya Bank Ltd', '76', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(400, 'Bank of  Africa Kenya Limited', '19', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(401, 'ABSA Bank Kenya PLC', '10276', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(402, 'MPESA', 'MPS', NULL, NULL, NULL, 12, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(403, 'Standard Chartered Bank Limited', '02', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(404, 'Airtel Kenya', 'MPX', NULL, NULL, NULL, 12, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-03-13 16:09:29', '2022-03-13 16:09:29'),
(405, 'EcoBank', '', NULL, NULL, NULL, 5, 4, '[]', 1, '2022-03-13 17:35:07', '2022-03-13 17:35:07'),
(406, 'Cash Pick-up', '', NULL, NULL, NULL, 6, 4, '[]', 1, '2022-09-17 04:17:32', '2022-09-17 04:17:32'),
(407, 'Page MFBank', '560', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(408, 'Stanbic Mobile Money', '304', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(409, 'FortisMobile', '308', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(410, 'TagPay', '328', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(411, 'FBNMobile', '309', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(412, 'First Bank of Nigeria', '011', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(413, 'Sterling Mobile', '326', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(414, 'Omoluabi Mortgage Bank', '990', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(415, 'ReadyCash (Parkway)', '311', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(416, 'Zenith Bank', '057', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(417, 'Standard Chartered Bank', '068', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(418, 'eTranzact', '306', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(419, 'Fidelity Bank', '070', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(420, 'CitiBank', '023', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(421, 'Unity Bank', '215', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(422, 'Access Money', '323', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(423, 'Eartholeum', '302', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(424, 'Hedonmark', '324', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(425, 'MoneyBox', '325', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(426, 'JAIZ Bank', '301', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(427, 'Ecobank Plc', '050', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(428, 'EcoMobile', '307', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(429, 'Fidelity Mobile', '318', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(430, 'TeasyMobile', '319', NULL, NULL, NULL, 13, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(431, 'NIP Virtual Bank', '999', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(432, 'VTNetworks', '320', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(433, 'Stanbic IBTC Bank', '221', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(434, 'Fortis Microfinance Bank', '501', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(435, 'PayAttitude Online', '329', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(436, 'ZenithMobile', '322', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(437, 'ChamsMobile', '303', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(438, 'SafeTrust Mortgage Bank', '403', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(439, 'Covenant Microfinance Bank', '551', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(440, 'Imperial Homes Mortgage Bank', '415', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(441, 'NPF MicroFinance Bank', '552', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(442, 'Parralex', '526', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(443, 'Wema Bank', '035', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(444, 'Enterprise Bank', '084', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(445, 'Diamond Bank', '063', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(446, 'Paycom', '305', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(447, 'SunTrust Bank', '100', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(448, 'Cellulant', '317', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(449, 'ASO Savings and & Loans', '401', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(450, 'Heritage', '030', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51');
INSERT INTO `country_services` (`id`, `name`, `bank_code`, `operatorId`, `localMinAmount`, `localMaxAmount`, `country_id`, `service_id`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(451, 'Jubilee Life Mortgage Bank', '402', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(452, 'GTBank Plc', '058', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(453, 'Union Bank', '032', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(454, 'Sterling Bank', '232', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(455, 'Polaris Bank', '076', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(456, 'Keystone Bank', '082', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(457, 'Pagatech', '327', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(458, 'Coronation Merchant Bank', '559', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(459, 'FSDH', '601', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(460, 'Mkudi', '313', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(461, 'First City Monument Bank', '214', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(462, 'FET', '314', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:51', '2022-11-03 05:59:51'),
(463, 'Trustbond', '523', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(464, 'GTMobile', '315', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(465, 'United Bank for Africa', '033', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(466, 'Access Bank', '044', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(467, 'TCF MFB', '90115', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(468, 'Test bank', '090175', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(469, 'Globus Bank', '103', NULL, NULL, NULL, 13, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 05:59:52', '2022-11-03 05:59:52'),
(470, 'Rocket TEST', '', NULL, NULL, NULL, 1, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"12\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-03 06:04:30', '2022-11-03 06:04:30'),
(471, 'AB Bank Zambia Limited', 'ZM210000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(472, 'AccSouth Sudan Bank', 'ZM350000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(473, 'Banc ABC', 'ZM200000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(474, 'Bank of China', 'ZM190000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(475, 'Bank Of Zambia Lusaka', 'ZM000000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(476, 'Barclays Bank', 'ZM020000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(477, 'Cavmont Bank', 'ZM130000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(478, 'Citibank', 'ZM030000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(479, 'Ecobank', 'ZM360000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(480, 'FinanceBank', 'ZM110000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(481, 'First Alliance Bank', 'ZM340000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(482, 'First Capital Bank', 'ZM280000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(483, 'First National Bank', 'ZM260000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(484, 'Indo Zambia Bank', 'ZM090000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(485, 'Intermarket Banking Corporation', 'ZM150000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(486, 'Investrust', 'ZM170000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(487, 'Stanbic Bank', 'ZM040000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(488, 'Standard Chartered Bank', 'ZM060000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(489, 'United Bank of Africa', 'ZM180000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(490, 'Zambia National Commercial Bank', 'ZM010000', NULL, NULL, NULL, 14, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2022-11-04 18:55:46'),
(491, 'MPS', '', NULL, NULL, NULL, 14, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 18:55:46', '2023-01-28 20:21:53'),
(492, 'Airtel ', NULL, 609, 1, 1000, 14, 1, '[]', 1, '2022-11-04 18:56:18', '2022-11-04 18:56:18'),
(493, 'MTN ', NULL, 610, 1, 1000, 14, 1, '[]', 1, '2022-11-04 18:56:18', '2022-11-04 18:56:18'),
(494, 'Zamtel ', NULL, 611, 1, 1000, 14, 1, '[]', 1, '2022-11-04 18:56:18', '2022-11-04 18:56:18'),
(496, 'Airtel-Tigo ', NULL, 772, 100, 40000, 15, 1, '[]', 1, '2022-11-04 19:23:57', '2022-11-04 19:23:57'),
(497, 'MTN ', NULL, 417, 100, 500000, 15, 1, '[]', 1, '2022-11-04 19:23:57', '2022-11-04 19:23:57'),
(498, 'MPS', '', NULL, NULL, NULL, 15, 2, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2023-01-28 20:18:29'),
(499, 'ZIGAMA CSS', '11128722', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(500, 'Unguka Bank Ltd', '11128726', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(501, 'Bank of Africa Rwanda PLC', '11128730', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(502, 'Urwego Opportunity Bank of Rwanda SA', '11128734', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(503, 'AB Bank Rwanda Limited', '11222892', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(504, 'UMWALIMU SACCO', '2006018AN0', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(505, 'I and M Bank (Rwanda) Limited', '20543100', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(506, 'Guaranty Trust Bank Rwanda Limited', '20543200', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(507, 'Bank of Kigali Limited', '20543300', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(508, 'Banque Nationale du Rwanda', '20543400', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(509, 'Banque Rwandaise de Developpement SA (BRD)', '20543500', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(510, 'Banque Populaire du Rwanda', '20543600', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(511, 'KCB Bank Rwanda Limited', '26145468', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(512, 'Equity Bank Limited - Rwanda', '26693730', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(513, 'Crane Bank Rwanda Ltd', '27201842', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(514, 'Access Bank (Rwanda) Limited', '97449864', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(515, 'Compagnie Generale de Banque', '97449866', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(516, 'Ecobank Rwanda', 'RW100000', NULL, NULL, NULL, 15, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-04 19:24:02', '2022-11-04 19:24:02'),
(517, '9Mobile (Etisalat) Nigeria', NULL, 340, 50, 50000, 13, 1, '[]', 1, '2022-11-05 17:56:57', '2022-11-05 17:56:57'),
(518, 'Airtel Nigeria', NULL, 342, 50, 199999, 13, 1, '[]', 1, '2022-11-05 17:56:57', '2022-11-05 17:56:57'),
(519, 'Glo Nigeria', NULL, 344, 50, 200000, 13, 1, '[]', 1, '2022-11-05 17:56:57', '2022-11-05 17:56:57'),
(520, 'MTN Nigeria', NULL, 341, 50, 200000, 13, 1, '[]', 1, '2022-11-05 17:56:57', '2022-11-05 17:56:57'),
(521, 'Polaris Bank', '076', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-05 17:59:10', '2022-11-05 17:59:10'),
(522, 'Test bank', '090175', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-05 17:59:10', '2022-11-05 17:59:10'),
(523, 'Globus Bank', '103', NULL, NULL, NULL, 1, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2022-11-05 17:59:10', '2022-11-05 17:59:10'),
(524, 'BILDMobil PIN ', NULL, 848, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(525, 'Blau PIN ', NULL, 849, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(526, 'Congstar PIN ', NULL, 850, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(527, 'Deutsche Telekom PIN ', NULL, 664, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(528, 'E-Plus PIN ', NULL, 852, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(529, 'FONIC PIN ', NULL, 853, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(530, 'Klarmobil PIN ', NULL, 854, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(531, 'Lebara Ghana PIN ', NULL, 858, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(532, 'Lebara PIN ', NULL, 855, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(533, 'Lifecell PIN ', NULL, 149, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(534, 'Lycamobile AllNet Plus PIN ', NULL, 866, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(535, 'Lycamobile PIN ', NULL, 864, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(536, 'O2 PIN ', NULL, 868, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(537, 'Ortel PIN ', NULL, 665, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(538, 'Otelo PIN ', NULL, 867, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(539, 'SimGuthaben PIN ', NULL, 870, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(540, 'Simyo PIN ', NULL, 871, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(541, 'Tchibo Mobile PIN ', NULL, 872, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(542, 'Telekom PIN ', NULL, 873, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(543, 'Turkcell PIN ', NULL, 874, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(544, 'Vodafone PIN ', NULL, 875, NULL, NULL, 3, 1, '[]', 1, '2023-01-28 13:51:10', '2023-01-28 13:51:10'),
(545, 'Tim Pin', '', 1097, NULL, NULL, 10, 1, '[]', 0, '2023-01-28 13:53:53', '2023-01-28 13:58:33'),
(546, 'Wind Pin', '', 1098, NULL, NULL, 10, 1, '[]', 0, '2023-01-28 13:53:53', '2023-01-28 13:58:46'),
(547, 'Airlink Mobile PIN USA', NULL, 549, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(548, 'Airvoice Feel Safe PIN USA', NULL, 567, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(549, 'Airvoice GSM PIN USA', NULL, 557, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(550, 'AT&T PIN USA', NULL, 967, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(551, 'AT&T RTR USA', NULL, 554, 15, 100, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(552, 'Boost Mobile RTR USA', NULL, 550, 5, 300, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(553, 'Cricket Paygo RTR USA', NULL, 558, 10, 300, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(554, 'EasyGo RTR PayGo US', NULL, 949, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(555, 'EasyGo RTR Unlimited US', NULL, 950, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(556, 'GoSmart RTR USA', NULL, 580, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(557, 'H2O Bolt LTE RTR USA', NULL, 709, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(558, 'H2O PayGo PIN USA (Minute plans)', NULL, 560, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(559, 'H2O PayGo RTR USA', NULL, 588, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(560, 'H2o RTR Multi-Line US', NULL, 953, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(561, 'H2o RTR US', NULL, 952, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(562, 'H2O Unlimited RTR USA', NULL, 574, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(563, 'Lyca Mobile RTR Pay-Go US', NULL, 955, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(564, 'Lyca Mobile RTR Unlimited US', NULL, 956, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(565, 'Lyca Mobile USA', NULL, 575, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(566, 'MetroPCS RTR USA', NULL, 577, 10, 350, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(567, 'Net10 RTR USA', NULL, 592, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(568, 'Page Plus Monthly RTR', NULL, 959, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(569, 'Page Plus PayGo RTR', NULL, 970, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(570, 'PagePlus PIN USA', NULL, 566, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(571, 'Safelink Wireless CA USA', NULL, 546, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(572, 'Safelink Wireless PIN USA', NULL, 551, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(573, 'Simple Mobile Family RTR', NULL, 964, 10, 200, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(574, 'SimpleMobile PIN USA', NULL, 568, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(575, 'SimpleMobile RTR USA', NULL, 572, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(576, 'T-Mobile USA RTR', NULL, 548, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(577, 'Total Wireless PIN', NULL, 969, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(578, 'Total Wireless RTR', NULL, 960, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(579, 'Tracfone PIN USA', NULL, 545, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(580, 'Tracfone RTR USA', NULL, 573, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(581, 'TracFone Unlimited PIN', NULL, 961, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(582, 'TracFone Unlimited RTR', NULL, 962, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(583, 'Ultra Mobile USA', NULL, 562, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(584, 'Ultra Mobile USA Flex Plan', NULL, 968, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(585, 'Verizon PIN', NULL, 614, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(586, 'Verizon USA', NULL, 563, NULL, NULL, 8, 1, '[]', 1, '2023-01-28 15:25:33', '2023-01-28 15:25:33'),
(587, 'Airtel ', NULL, 516, 50, 1000000, 16, 1, '[]', 1, '2023-01-28 16:03:22', '2023-01-28 16:03:22'),
(588, 'MTN ', NULL, 515, 500, 200000, 16, 1, '[]', 1, '2023-01-28 16:03:22', '2023-01-28 16:03:22'),
(589, 'Smile  USD', NULL, 518, NULL, NULL, 16, 1, '[]', 1, '2023-01-28 16:03:22', '2023-01-28 16:03:22'),
(590, ' Telecom', NULL, 641, 500, 377857, 16, 1, '[]', 1, '2023-01-28 16:03:22', '2023-01-28 16:03:22'),
(591, 'Mobile Money', 'MPS', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(592, 'Finance Trust Bank Limited', '11125380', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(593, 'MTN', '1908276CF9', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(594, 'ECOCBIBI', '1910236K50', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(595, 'Bank of Uganda', '20654100', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(596, 'Barclays Bank of Uganda Limited', '20654200', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(597, 'East African Development Bank', '20654300', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(598, 'Tropical Bank Limited', '20654400', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(599, 'Stanbic Bank Uganda Limited', '20654600', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(600, 'Standard Chartered Bank Uganda Limited', '20654700', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(601, 'Bank of Baroda (Uganda) Limited', '20831200', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(602, 'Diamond Trust Bank Uganda Limited', '20831300', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(603, 'Centenary Rural Development Bank Limited', '21069000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(604, 'Bank of Africa Uganda Ltd', '21098200', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(605, 'DFCU Bank Ltd.', '22017570', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(606, 'Post Bank (Uganda) Ltd.', '22017590', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(607, 'The Uganda Institute of Bankers', '25020400', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(608, 'International Credit Bank Ltd.', '25548564', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(609, 'Trans Africa Bank Ltd', '25550354', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(610, 'Engiplan Consultants', '25676062', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(611, 'ABC Capital Bank (Uganda) Limited', '25811842', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(612, 'Housing Finance Bank Limited', '25811922', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10');
INSERT INTO `country_services` (`id`, `name`, `bank_code`, `operatorId`, `localMinAmount`, `localMaxAmount`, `country_id`, `service_id`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(613, 'KCB Bank Uganda Limited', '25811954', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(614, 'United Bank for Africa Uganda Limited', '25817334', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(615, 'Guaranty Trust Bank Uganda Limited', '25892816', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(616, 'Mbea Brokerage Services (U) Limited', '26146310', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(617, 'Equity Bank Uganda Limited', '26153412', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(618, 'Co-Operative Bank Ltd.,the', '26617438', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(619, 'Trust Bank (Uganda) Limited', '26618480', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(620, 'Exim Bank (Uganda) Limited', '26620154', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(621, 'Equity Stock Brokers (U) Ltd', '26852118', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(622, 'Bank of India (Uganda) Limited', '26935178', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(623, 'NC Bank Uganda Limited', '26951724', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(624, 'Sabmiller Uganda', '27121264', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(625, 'Crested Stocks And Securities Limited', '27131044', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(626, 'British American Tobacco Uganda Ltd', '27199362', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(627, 'Alt Xchange Limited.', '27235418', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(628, 'Top Finance Bank Limited', '27349488', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(629, 'Crane Bank Ltd', '27541792', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(630, 'Orient Bank Limited', '60001114', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(631, 'Commercial Bank of Africa Uganda Limited', '91807664', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(632, 'Cairo International Bank Limited', '97339112', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(633, 'Citibank Uganda Limited', '97339114', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(634, 'Mercantile Credit Bank Ltd', '97339122', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(635, 'UGANDA SECURITIES EXCHANGE', '98357640', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(636, 'ECOBANK (U) LTD', 'UG029000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(637, 'BARCLAYS BANK OF UGANDA  LIMITED', 'UG01000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(638, 'BANK OF BARODA', 'UG02000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(639, 'ABC CAPITAL BANK LIMITED', 'UG031000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(640, 'Bank of India', 'UG034000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(641, 'STANBIC BANK LIMITED', 'UG04000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(642, 'DFCU Bank', 'UG05000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(643, 'FINCA UGANDA LIMITED 1', 'UG053000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(644, 'TROPICAL BANK OF AFRICA', 'UG06000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(645, 'STANDARD CHARTERED BANK', 'UG08000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(646, 'ORIENT BANK', 'UG11000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(647, 'BANK OF AFRICA', 'UG13000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(648, 'NATIONAL BANK OF COMMERCE', 'UG15000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(649, 'CENTENARY RURAL DEVELOPMENT', 'UG16000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(650, 'CRANE BANK', 'UG17000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(651, 'CAIRO INTERNATIONAL BANK', 'UG18000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(652, 'DIAMOND TRUST BANK', 'UG19000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(653, 'CITIBANK N.A.', 'UG22000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(654, 'HOUSING FINANCE BANK', 'UG23000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(655, 'GLOBAL TRUST BANK', 'UG24000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(656, 'KCB BANK UGANDA LTD', 'UG25000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(657, 'UNITED BANK FOR AFRICA UG LTD', 'UG26000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(658, 'GUARANTEE TRUST BANK', 'UG27000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(659, 'EQUITY BANK', 'UG30000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(660, 'ABC CAPITAL BANK LTD', 'UG31000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(661, 'EXIM BANK', 'UG32000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(662, 'NC BANK UGANDA LIMITED', 'UG35000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(663, 'COMMERCIAL BANK OF AFRICA UGANDA LIMITED', 'UG36000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(664, 'FINANCE TRUST BANK', 'UG37000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(665, 'BANK OF UGANDA', 'UG47000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(666, 'FINCA UGANDA LIMITED', 'UG53000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(667, 'POST BANK UGANDA LIMITED', 'UG56000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(668, 'PRIDE MICROFINANCE LIMITED', 'UG57000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(669, 'OPPORTUNITY BANK UGNADA LIMITED', 'UG61000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(670, 'Top Finance Bank Limited', 'UG62000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(671, 'BANK OF UGANDA 1', 'UG99000', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(672, 'COMMERZBANK - EUR', 'UGCOBEUR', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(673, 'COMMERZBANK - GBP', 'UGCOBGBP', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(674, 'COMMERZBANK - USD', 'UGCOBUSD', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(675, 'NEDBANK', 'UGNEDZAR', NULL, NULL, NULL, 16, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:24:10', '2023-01-28 20:24:10'),
(676, 'MPESA', 'MPS', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:46:16', '2023-01-28 20:46:16'),
(677, 'Airtel Kenya', 'MPX', NULL, NULL, NULL, 12, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-01-28 20:46:16', '2023-01-28 20:46:16'),
(678, 'MTN Mobile Money', 'MTN', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-02-05 18:33:07', '2023-02-05 18:33:07'),
(679, 'Vodafone Mobile Money', 'VODAFONE', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-02-05 18:33:07', '2023-02-05 18:33:07'),
(680, 'Airtel-Tigo Mobile Money', 'AIRTELTIGO', NULL, NULL, NULL, 9, 3, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_level\":\"Account Number\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"field_level\":\"Beneficiary Name\",\"type\":\"text\",\"field_length\":\"50\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2023-02-05 18:33:07', '2023-02-05 18:33:07'),
(681, 'City Bank', '', NULL, NULL, NULL, 7, 3, '[]', 1, '2024-01-09 02:34:39', '2024-01-11 01:17:28'),
(682, 'Brac Bank', '', NULL, NULL, NULL, 7, 3, '[]', 1, '2024-01-11 01:16:59', '2024-01-11 01:17:10'),
(683, 'Bkash', '', NULL, NULL, NULL, 7, 2, '[]', 1, '2024-01-11 11:29:48', '2024-01-11 11:29:48'),
(684, 'Nogod', '', NULL, NULL, NULL, 7, 2, '[]', 1, '2024-01-11 11:31:24', '2024-01-11 11:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `country_service_charges`
--

CREATE TABLE `country_service_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=> Fixed Charge, 2=> (*) Percent Charge',
  `charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `country_service_charges`
--

INSERT INTO `country_service_charges` (`id`, `country_id`, `service_id`, `amount`, `type`, `charge`, `created_at`, `updated_at`) VALUES
(11, 3, 1, 1.00, 1, 1.00, '2022-03-13 15:45:25', '2022-03-13 15:45:25'),
(12, 5, 1, 1.00, 1, 1.00, '2022-03-13 17:33:15', '2022-03-13 17:33:15'),
(13, 5, 4, 2.00, 1, 1.00, '2022-03-13 17:35:29', '2022-03-13 17:35:29'),
(14, 4, 1, 100.00, 1, 3.00, '2022-03-13 17:40:58', '2022-03-13 17:40:58'),
(15, 8, 1, 50.00, 1, 1.00, '2022-03-13 17:45:34', '2022-03-13 17:45:34'),
(16, 8, 1, 1000.00, 1, 3.00, '2022-03-13 17:45:34', '2022-03-13 17:45:34'),
(17, 11, 1, 2000.00, 1, 500.00, '2022-03-13 17:49:21', '2022-03-13 17:49:21'),
(21, 2, 3, 131000.00, 2, 2.00, '2022-03-13 18:23:36', '2022-03-13 18:23:36'),
(22, 2, 3, 328000.00, 2, 3.00, '2022-03-13 18:23:36', '2022-03-13 18:23:36'),
(23, 2, 3, 2000.00, 2, 4.00, '2022-03-13 18:23:36', '2022-03-13 18:23:36'),
(24, 2, 4, 131000.00, 2, 2.00, '2022-03-13 18:26:03', '2022-03-13 18:26:03'),
(25, 2, 4, 328000.00, 2, 3.00, '2022-03-13 18:26:03', '2022-03-13 18:26:03'),
(26, 2, 4, 1312000.00, 2, 4.00, '2022-03-13 18:26:03', '2022-03-13 18:26:03'),
(27, 1, 4, 10000.00, 1, 600.00, '2022-03-15 13:48:38', '2022-03-15 13:48:38'),
(36, 6, 1, 10000.00, 1, 0.00, '2022-09-17 04:07:20', '2022-09-17 04:07:20'),
(37, 6, 4, 100.00, 2, 1.00, '2022-09-17 04:18:44', '2022-09-17 04:18:44'),
(38, 6, 4, 400.00, 2, 2.00, '2022-09-17 04:18:44', '2022-09-17 04:18:44'),
(39, 6, 4, 2000.00, 2, 3.00, '2022-09-17 04:18:44', '2022-09-17 04:18:44'),
(40, 6, 4, 10000.00, 2, 4.00, '2022-09-17 04:18:44', '2022-09-17 04:18:44'),
(47, 1, 3, 100.00, 1, 1.54, '2022-09-22 00:16:35', '2022-09-22 00:16:35'),
(48, 2, 1, 100.00, 2, 1.80, '2022-10-01 06:59:17', '2022-10-01 06:59:17'),
(49, 2, 1, 300.00, 1, 1.70, '2022-10-01 06:59:17', '2022-10-01 06:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL COMMENT 'Coupon Code',
  `reduce_fee` decimal(11,2) DEFAULT NULL COMMENT 'Reduce Fee (%)',
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `user_id`, `code`, `reduce_fee`, `used_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 717043, 5.00, NULL, '2021-09-28 06:56:07', '2021-09-28 06:56:07'),
(2, NULL, 932172, 5.00, NULL, '2021-09-28 06:56:07', '2021-09-28 06:56:07'),
(3, NULL, 290834, 2.00, NULL, '2021-10-19 07:46:37', '2021-10-19 07:46:37'),
(4, NULL, 787208, 2.00, NULL, '2021-10-19 07:46:37', '2021-10-19 07:46:37'),
(5, 1, 532170, 5.00, '2022-08-25 18:11:06', '2022-08-25 18:09:53', '2022-08-25 18:11:06'),
(6, NULL, 125093, 5.00, NULL, '2022-08-25 18:09:53', '2022-08-25 18:09:53');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `template_key` varchar(120) DEFAULT NULL,
  `email_from` varchar(191) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `mail_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_status` tinyint(1) NOT NULL DEFAULT 0,
  `lang_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `language_id`, `template_key`, `email_from`, `name`, `subject`, `template`, `sms_body`, `short_keys`, `mail_status`, `sms_status`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'PROFILE_UPDATE', 'detra@detracash.de', 'Profile has been updated', 'Profile Has Been Updated', 'Your first name [[firstname]]\n\nlast name [[lastname]]\n\nemail [[email]]\n\nphone number [[phone]]', 'Your first name [[firstname]]\r\n\r\nlast name [[lastname]]\r\n\r\nemail [[email]]\r\n\r\nphone number [[phone]]\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, 'us', '2021-01-23 05:20:56', '2022-11-04 05:55:50'),
(2, 1, 'ADMIN_SUPPORT_REPLY', 'detra@detracash.de', 'Support Ticket Reply ', 'Support Ticket Reply', '<p>Ticket ID [[ticket_id]]\r\n</p><p><span><br /></span></p><p><span>Subject [[ticket_subject]]\r\n</span></p><p><span>-----Replied------</span></p><p><span>\r\n[[reply]]</span><br /></p>', 'Ticket ID [[ticket_id]]\r\n\r\n\r\n\r\nSubject [[ticket_subject]]\r\n\r\n-----Replied------\r\n\r\n[[reply]]', '{\"ticket_id\":\"Support Ticket ID\",\"ticket_subject\":\"Subject Of Support Ticket\",\"reply\":\"Reply from Staff\\/Admin\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(3, 1, 'PASSWORD_CHANGED', 'detra@detracash.de', 'PASSWORD CHANGED ', 'Your Password Has Been Changed', 'Your password has changed.  The new password is [[password]]', 'Your password changed\r\n\r\nNew password [[password]]\r\n\r\n\r\nNews [[test]]', '{\"password\":\"password\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-12-30 16:33:34'),
(9, 1, 'PAYMENT_COMPLETE', 'detra@detracash.de', 'Payment Completed', 'Your Payment Has Been Completed', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n\r\nYour Main Balance [[remaining_balance]] [[currency]]\r\n\r\n', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n\r\n\r\n', '{\"gateway_name\":\"gateway name\",\"amount\":\"amount\",\"charge\":\"charge\", \"currency\":\"currency\",\"transaction\":\"transaction\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(11, 1, 'PASSWORD_RESET', 'detra@detracash.de', 'Reset Password Notification', 'Reset Password Notification', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account. [[message]]', '{\"message\":\"message\"}', 1, 1, 'us', '2021-01-27 00:32:07', '2022-11-04 05:55:50'),
(12, 1, 'VERIFICATION_CODE', 'detra@detracash.de', 'Verification Code', 'Verify Your Email ', 'Your Email verification Code  [[code]]', 'Your SMS verification Code  [[code]]', '{\"code\":\"code\"}', 1, 1, 'us', '2021-01-27 00:32:07', '2022-11-04 05:55:50'),
(21, 1, 'TWO_STEP_ENABLED', 'detra@detracash.de', 'TWO STEP ENABLED', 'TWO STEP ENABLED', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\",\"code\":\"code\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(22, 1, 'TWO_STEP_DISABLED', 'detra@detracash.de', 'TWO STEP DISABLED', 'TWO STEP DISABLED', 'Google two factor verification is disabled', 'Google two factor verification is disabled', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(38, 1, 'PAYMENT_APPROVED', 'detra@detracash.de', 'Payment Approved', 'Your Payment Has Been Approved', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n\r\nYour Main Balance [[remaining_balance]] [[currency]]\r\n\r\n', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n', '{\"gateway_name\":\"gateway name\",\"amount\":\"amount\",\"charge\":\"charge\", \"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin Feedback\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(39, 1, 'DEPOSIT_REJECTED', 'detra@detracash.de', 'Payment rejected', 'Deposit request has been rejected', '[[amount]] [[currency]] deposit has been rejected\r\n\r\nPayment Method [[method]]\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n', '[[amount]] [[currency]] deposit has been rejected\r\n\r\nPayment Method [[method]]\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n', '{\"method\":\"Payout method\",\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(40, 1, 'MONEY_TRANSFER_COMPLETE', 'detra@detracash.de', 'Money Transfer Completed', 'Your Transfer Has Been Completed', '[[amount]] [[currency]] requested money has been transfer \r\n\r\nInvoice  #[[invoice]]\r\n\r\n\r\nAdmin Reply : [[admin_reply]]\r\n\r\n\r\n\r\n', '[[amount]] [[currency]] requested money has been transfer \r\n\r\nInvoice  #[[invoice]]\r\n\r\n\r\nAdmin Reply : [[admin_reply]]\r\n\r\n\r\n\r\n', '{\"amount\":\"amount\",\"\"currency\":\"currency\",\"invoice\":\"invoice\",\"admin_reply\":\"admin reply\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(41, 1, 'MONEY_TRANSFER_REJECTED', 'detra@detracash.de', 'Money Transfer Request Rejected', 'Your Transfer Has Been Rejected', '[[amount]] [[currency]] request money transfer  has been Rejected\r\n\r\nInvoice  #[[invoice]]\r\n\r\n\r\nAdmin Reply : [[admin_reply]]\r\n\r\n\r\n\r\n', '[[amount]] [[currency]] requested money transfer  has been Rejected\r\n\r\nInvoice  #[[invoice]]\r\n\r\n\r\nAdmin Reply : [[admin_reply]]\r\n\r\n\r\n\r\n', '{\"amount\":\"amount\",\"\"currency\":\"currency\",\"invoice\":\"invoice\",\"admin_reply\":\"admin reply\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(42, 1, 'KYC_APPROVED', 'detra@detracash.de', 'KYC APPROVED', 'Your KYC Has Been Approved', 'Your [[kyc_type]] request has been approved\r\n\r\n\r\n\r\n', 'Your [[kyc_type]] verification  has been approved\r\n', '{\"kyc_type\":\"KYC Type\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(43, 1, 'KYC_REJECTED', 'detra@detracash.de', 'KYC REJECTED', 'Your KYC Has Been Rejected', 'Your [[kyc_type]] request has been rejected\r\n\r\n\r\n\r\n', 'Your [[kyc_type]] verification has been rejected\r\n', '{\"kyc_type\":\"KYC Type\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(44, 1, 'MERCHANT_TRANSFER_PROCESSING', 'detra@detracash.de', 'MERCHANT TRANSFER PROCESSING', 'Your Transfer is being Processed', '[[amount]] [[currency]] Payment is being processed.    Invoice ID : [[invoice]]', '[[amount]] [[currency]] Payment is being processed \r\n\r\n\r\nInvoice ID : [[invoice]]\r\n\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\",\"invoice\":\"invoice\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-12-30 16:35:10'),
(45, 1, 'PAYOUT_COMPLETE', 'detra@detracash.de', 'Payout Completed', 'Your Payout Has Been Completed', '[[amount]] [[currency]] requested money has been transfer \r\n\r\nInvoice  #[[invoice]]\r\n\r\n\r\n\r\n\r\n', '[[amount]] [[currency]] requested money has been transfer \r\n\r\nInvoice  #[[invoice]]\r\n\r\n\r\n\r\n', '{\"amount\":\"amount\",\"\"currency\":\"currency\",\"invoice\":\"invoice\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(46, 1, 'ADD_BALANCE', 'detra@detracash.de', 'Balance Add by Admin', 'Your Account has been credited', '[[amount]] [[currency]] credited in your account.\n\nYour Current Balance [[main_balance]][[currency]]\n\nTransaction: #[[transaction]]', '[[amount]] [[currency]] credited in your account. \r\n', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 1, 'us', '2021-01-23 05:24:42', '2022-11-04 05:55:50'),
(47, 1, 'VERIFICATION_CODE_2FA', 'detra@detracash.de', '2FA Verification Code', '2FA Verify Your Email ', 'Your 2FA verification Code  [[code]]', 'Your 2FA verification Code  [[code]]', '{\"code\":\"code\"}', 1, 1, 'us', '2021-01-27 00:32:07', '2022-11-04 05:55:50'),
(48, 2, 'DEPOSIT_REJECTED', 'detra@detracash.de', 'Payment rejected', 'Deposit request has been rejected', '[[amount]] [[currency]] deposit has been rejected\r\n\r\nPayment Method [[method]]\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n', '[[amount]] [[currency]] deposit has been rejected\r\n\r\nPayment Method [[method]]\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n', '{\"method\":\"Payout method\",\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'FR', '2023-05-24 18:50:57', '2023-05-24 18:50:57'),
(49, 2, 'PASSWORD_CHANGED', 'detra@detracash.de', 'PASSWORD CHANGED ', 'Your Password Has Been Changed', 'Your password has changed.  The new password is [[password]]', 'Your password changed\r\n\r\nNew password [[password]]\r\n\r\n\r\nNews [[test]]', '{\"password\":\"password\"}', 1, 1, 'FR', '2023-06-26 17:23:59', '2023-06-26 17:23:59'),
(50, 2, 'ADD_BALANCE', NULL, 'Balance Add by Admin', 'Your Account has been credited', '[[amount]] [[currency]] credited in your account.\n\nYour Current Balance [[main_balance]][[currency]]\n\nTransaction: #[[transaction]]', '[[amount]] [[currency]] credited in your account. \r\n', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\",\"main_balance\":\"Users Balance After this operation\"}', 1, 1, 'FR', '2023-06-26 17:26:41', '2023-06-26 17:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flutter_transactions`
--

CREATE TABLE `flutter_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `send_money_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL COMMENT 'Verify Transaction ID',
  `reference` varchar(91) DEFAULT NULL COMMENT 'Our System Salted \r\nInovoice',
  `details` text DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flutter_transactions`
--

INSERT INTO `flutter_transactions` (`id`, `send_money_id`, `status`, `message`, `data_id`, `reference`, `details`, `verified_at`, `created_at`, `updated_at`) VALUES
(1, 38, 'success', 'Transfer Queued Successfully', 213052, NULL, '{\"id\":213052,\"account_number\":\"0690000040\",\"bank_code\":\"044\",\"full_name\":\"Alexis Sanchez\",\"created_at\":\"2021-12-14T05:37:51.000Z\",\"currency\":\"NGN\",\"debit_currency\":\"NGN\",\"amount\":16236,\"fee\":26.875,\"status\":\"NEW\",\"reference\":\"16394580219194-3029\",\"meta\":null,\"narration\":\"Alexis Sanchez\",\"complete_message\":\"\",\"requires_approval\":0,\"is_approved\":1,\"bank_name\":\"ACCESS BANK NIGERIA\"}', NULL, '2021-12-13 23:37:54', '2021-12-13 23:37:54');

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `send_money_id` int(11) DEFAULT NULL,
  `gateway_currency` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `final_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `transaction` varchar(25) DEFAULT NULL,
  `try` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> Complete, 2=> Pending, 3 => Cancel',
  `detail` text DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `user_id`, `gateway_id`, `send_money_id`, `gateway_currency`, `amount`, `charge`, `rate`, `final_amount`, `btc_amount`, `btc_wallet`, `transaction`, `try`, `status`, `detail`, `feedback`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', 'B7VE9TJ9H165', 0, 0, NULL, NULL, '2021-10-04 09:01:35', '2021-10-04 09:01:35'),
(2, 2, 2, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', '9CBEUAUDVQOW', 0, 1, NULL, NULL, '2021-10-04 09:02:21', '2021-10-04 09:09:43'),
(3, 2, 14, NULL, 'USD', 200.00000000, 0.50000000, 1.00000000, 200.50000000, 0.00000000, '', 'OY6XFOJR9BJY', 0, 0, NULL, NULL, '2021-10-04 09:10:36', '2021-10-04 09:10:36'),
(4, 2, 1000, NULL, 'NGN', 200.00000000, 6.00000000, 411.50000000, 84769.00000000, 0.00000000, '', '5528CF8M67ME', 0, 3, '{\"transaction__number\":{\"field_name\":\"234324234234\",\"type\":\"text\"},\"bank_address\":{\"field_name\":null,\"type\":\"textarea\"},\"nid\":{\"field_name\":\"54694654464\",\"type\":\"text\"},\"bill_payment\":{\"field_name\":\"615b318180b1a1633366401.jpg\",\"type\":\"file\"}}', 'g', '2021-10-04 10:53:21', '2024-01-09 02:35:24'),
(5, 1, 1000, 3, 'NGN', 79.03170357, 3.58063407, 411.50000000, 33994.97693855, 0.00000000, '', 'R23YMHG2979U', 0, 0, NULL, NULL, '2021-10-04 09:13:34', '2021-10-04 09:13:34'),
(6, 2, 21, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'Z7MNTO5Y54DR', 0, 0, NULL, NULL, '2021-10-04 10:53:44', '2021-10-04 10:53:44'),
(7, 2, 21, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'BRPOKGCFGQGR', 0, 0, NULL, NULL, '2021-10-04 10:57:34', '2021-10-04 10:57:34'),
(8, 2, 23, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'NXYVMH7YAZPA', 0, 0, NULL, NULL, '2021-10-04 10:57:50', '2021-10-04 10:57:50'),
(9, 2, 24, NULL, 'PKR', 1000.00000000, 0.50000000, 0.85000000, 850.42500000, 0.00000000, '', 'UHRFKDC59M44', 0, 0, NULL, NULL, '2021-10-04 10:58:00', '2021-10-04 10:58:00'),
(10, 2, 22, NULL, 'BTC', 1000.00000000, 10.50000000, 0.00000000, 0.00000000, 0.00000000, '', 'KD2O8XMB7ODC', 0, 0, NULL, NULL, '2021-10-04 10:58:12', '2021-10-04 10:58:12'),
(11, 2, 18, NULL, 'USD', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'X595R8TE7VN1', 0, 0, NULL, NULL, '2021-10-04 10:59:06', '2021-10-04 10:59:06'),
(12, 2, 18, NULL, 'USD', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'PUV4995GJRKD', 0, 0, NULL, NULL, '2021-10-04 10:59:43', '2021-10-04 10:59:43'),
(13, 2, 18, NULL, 'USD', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'J5NDAEPXAH2A', 0, 0, NULL, NULL, '2021-10-04 11:00:05', '2021-10-04 11:00:05'),
(14, 2, 9, NULL, 'USD', 1000.00000000, 50.50000000, 1.00000000, 1050.50000000, 0.00000000, '', 'NECPM5WA4OVA', 0, 0, NULL, NULL, '2021-10-04 11:01:06', '2021-10-04 11:01:06'),
(15, 2, 11, NULL, 'INR', 1000.00000000, 0.50000000, 73.51000000, 73546.75500000, 0.00000000, '', 'Q3RNHKHMWYNB', 0, 0, NULL, NULL, '2021-10-04 11:16:44', '2021-10-04 11:16:44'),
(16, 2, 17, NULL, 'BRL', 1000.00000000, 0.50000000, 0.06300000, 63.03150000, 0.00000000, '', '4746HD2FR4VD', 0, 0, NULL, NULL, '2021-10-04 11:16:55', '2021-10-04 11:16:55'),
(17, 2, 23, NULL, 'BTC', 200.00000000, 0.50000000, 1.00000000, 200.50000000, 0.00000000, '', 'PKCWP4GUSZZF', 0, 0, NULL, NULL, '2021-10-04 11:22:53', '2021-10-04 11:22:53'),
(18, 2, 21, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'OOFHSOM9OBZ1', 0, 0, NULL, NULL, '2021-10-04 11:23:15', '2021-10-04 11:23:15'),
(19, 2, 23, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'XC9PMFU9HOQH', 0, 0, NULL, NULL, '2021-10-04 11:43:55', '2021-10-04 11:43:55'),
(20, 2, 23, NULL, 'BTC', 200.00000000, 0.50000000, 1.00000000, 200.50000000, 0.00000000, '', '3BKUD5WN26E9', 0, 0, NULL, NULL, '2021-10-04 11:44:32', '2021-10-04 11:44:32'),
(21, 2, 22, NULL, 'BTC', 200.00000000, 2.50000000, 0.00000000, 0.00000000, 0.00000000, '', 'UYKO8MJ77SCE', 0, 0, NULL, NULL, '2021-10-04 11:45:29', '2021-10-04 11:45:29'),
(22, 2, 18, NULL, 'USD', 200.00000000, 0.50000000, 1.00000000, 200.50000000, 0.00000000, '', 'NB5182Q2HSXX', 0, 0, NULL, NULL, '2021-10-04 11:46:26', '2021-10-04 11:46:26'),
(23, 2, 11, NULL, 'INR', 200.00000000, 0.50000000, 73.51000000, 14738.75500000, 0.00000000, '', '3ZVSFEXORAYQ', 0, 0, NULL, NULL, '2021-10-04 11:47:36', '2021-10-04 11:47:36'),
(24, 2, 17, NULL, 'BRL', 200.00000000, 0.50000000, 0.06300000, 12.63150000, 0.00000000, '', 'XHF1QVJC4RZ8', 0, 0, NULL, NULL, '2021-10-04 11:49:19', '2021-10-04 11:49:19'),
(25, 2, 17, NULL, 'BRL', 1000.00000000, 0.50000000, 0.06300000, 63.03150000, 0.00000000, '', '6E3Q3WTBYV75', 0, 0, NULL, NULL, '2021-10-04 11:49:38', '2021-10-04 11:49:38'),
(26, 2, 12, NULL, 'USD', 200.00000000, 0.50000000, 1.00000000, 200.50000000, 0.00000000, '', 'R3NMD5PX4SMU', 0, 0, NULL, NULL, '2021-10-04 11:51:12', '2021-10-04 11:51:12'),
(27, 2, 21, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'FPBWC4H49Q1N', 0, 0, NULL, NULL, '2021-10-04 11:53:48', '2021-10-04 11:53:48'),
(28, 2, 19, NULL, 'USD', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', 'MSAF91PRV57E', 0, 0, NULL, NULL, '2021-10-04 11:58:23', '2021-10-04 11:58:23'),
(29, 2, 23, NULL, 'BTC', 1000.00000000, 0.50000000, 1.00000000, 1000.50000000, 0.00000000, '', '1OA1BQO49EQV', 0, 0, NULL, NULL, '2021-10-04 11:59:24', '2021-10-04 11:59:24'),
(30, 2, 24, NULL, 'PKR', 1000.00000000, 0.50000000, 0.85000000, 850.42500000, 0.00000000, '', '6Q7E8PMGFBA7', 0, 0, NULL, NULL, '2021-10-04 12:00:42', '2021-10-04 12:00:42'),
(31, 2, 22, NULL, 'BTC', 1000.00000000, 10.50000000, 0.00000000, 0.00000000, 0.00000000, '', 'TERD1V32B3OZ', 0, 0, NULL, NULL, '2021-10-04 12:00:57', '2021-10-04 12:00:57'),
(32, 2, 9, NULL, 'USD', 120.00000000, 6.50000000, 1.00000000, 126.50000000, 0.00000000, '', 'WABM3KNA1JXV', 0, 0, NULL, NULL, '2021-10-05 02:13:06', '2021-10-05 02:13:06'),
(33, 2, 11, NULL, 'INR', 120.00000000, 0.50000000, 73.51000000, 8857.95500000, 0.00000000, '', 'FFOR51WCYS2R', 0, 0, NULL, NULL, '2021-10-05 02:13:28', '2021-10-05 02:13:28'),
(34, 2, 17, NULL, 'BRL', 120.00000000, 0.50000000, 0.06300000, 7.59150000, 0.00000000, '', '35RYYHEET641', 0, 0, NULL, NULL, '2021-10-05 02:13:37', '2021-10-05 02:13:37'),
(35, 2, 20, NULL, 'NGN', 120.00000000, 0.50000000, 408.52000000, 49226.66000000, 0.00000000, '', 'S76HQ8H2QCWE', 0, 0, NULL, NULL, '2021-10-05 02:14:11', '2021-10-05 02:14:11'),
(36, 2, 6, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', 'WKZQASKBERCF', 0, 0, NULL, NULL, '2021-10-05 02:18:32', '2021-10-05 02:18:32'),
(37, 2, 10, NULL, 'INR', 120.00000000, 0.50000000, 73.30000000, 8832.65000000, 0.00000000, '', 'T4RB6V8ZAJPJ', 0, 0, NULL, NULL, '2021-10-05 02:18:49', '2021-10-05 02:18:49'),
(38, 2, 15, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', '1A989MZ1ODQV', 0, 0, NULL, NULL, '2021-10-05 02:19:29', '2021-10-05 02:19:29'),
(39, 2, 8, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', 'BAVK36WBQEYO', 0, 0, NULL, NULL, '2021-10-05 02:21:08', '2021-10-05 02:21:08'),
(40, 2, 2, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', 'WE3TXDXYABB8', 0, 0, NULL, NULL, '2021-10-05 02:22:40', '2021-10-05 02:22:40'),
(41, 2, 13, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', '2WRCFF9F2ERV', 0, 0, NULL, NULL, '2021-10-05 02:23:53', '2021-10-05 02:23:53'),
(42, 2, 14, 7, 'USD', 94.83804428, 0.50000000, 1.00000000, 95.33804428, 0.00000000, '', 'OQ9675SKHKC5', 0, 0, NULL, NULL, '2021-10-15 02:11:02', '2021-10-15 02:11:02'),
(43, 2, 2, 7, 'USD', 94.83804428, 0.50000000, 1.00000000, 95.33804428, 0.00000000, '', 'CCOOU9U53BU3', 0, 1, NULL, NULL, '2021-10-15 02:11:28', '2021-10-15 02:13:56'),
(44, 2, 2, 8, 'USD', 94.83804428, 0.50000000, 1.00000000, 95.33804428, 0.00000000, '', '639VQ4JZQT8J', 0, 1, NULL, NULL, '2021-10-15 02:22:30', '2021-10-15 02:22:55'),
(45, 1, 2, 12, 'USD', 0.29241730, 0.50000000, 1.00000000, 0.79241730, 0.00000000, '', 'HESSWOHQNPU2', 0, 0, NULL, NULL, '2021-10-17 00:35:02', '2021-10-17 00:35:02'),
(46, 2, 2, NULL, 'USD', 120.00000000, 0.50000000, 1.00000000, 120.50000000, 0.00000000, '', 'ANXG3YGNEZTJ', 0, 0, NULL, NULL, '2021-10-17 01:14:16', '2021-10-17 01:14:16'),
(47, 2, 1000, NULL, 'NGN', 120.00000000, 4.40000000, 411.50000000, 51190.60000000, 0.00000000, '', 'JDPRJKUCOYUU', 0, 0, NULL, NULL, '2021-10-17 01:16:50', '2021-10-17 01:16:50'),
(48, 1, 2, 12, 'USD', 0.55322192, 0.50000000, 1.00000000, 1.05322192, 0.00000000, '', '9B8BDT95B5H2', 0, 1, NULL, NULL, '2021-10-17 01:23:25', '2021-10-17 01:24:05'),
(49, 1, 2, 15, 'USD', 1.17647059, 0.50000000, 1.00000000, 1.67647059, 0.00000000, '', 'F2U7RVARASRC', 0, 1, NULL, NULL, '2021-10-17 06:47:38', '2021-10-17 06:48:01'),
(50, 1, 9, 17, 'USD', 59.06709431, 3.45335472, 1.00000000, 62.52044903, 0.00000000, '', '1ZHFMKC3EN2N', 0, 1, NULL, NULL, '2021-10-19 03:56:11', '2021-10-19 03:57:14'),
(51, 1, 9, 20, 'USD', 70.88051317, 4.04402566, 1.00000000, 74.92453883, 0.00000000, '', 'HNHMTXQ1YDRC', 0, 1, NULL, NULL, '2021-10-20 10:57:23', '2021-10-20 10:57:47'),
(52, 3, 9, 23, 'USD', 118.13418862, 6.40670943, 1.00000000, 124.54089806, 0.00000000, '', 'JR92B3N4T1JU', 0, 1, NULL, NULL, '2021-10-20 17:03:43', '2021-10-20 17:04:00'),
(53, 1, 9, 33, 'USD', 200.00000000, 10.50000000, 1.00000000, 210.50000000, 0.00000000, '', 'FSX3YJXA6KOG', 0, 1, NULL, NULL, '2021-11-21 11:44:00', '2021-11-21 11:44:30'),
(54, 1, 9, 37, 'USD', 75.81032482, 4.29051624, 1.00000000, 80.10084106, 0.00000000, '', '2H4KFQ4Q5T3A', 0, 1, NULL, NULL, '2021-12-08 04:39:31', '2021-12-08 04:40:10'),
(55, 1, 2, 38, 'USD', 34.14879496, 0.50000000, 1.00000000, 34.64879496, 0.00000000, '', '6MYQ9M1ZT9U3', 0, 1, NULL, NULL, '2021-12-13 23:36:45', '2021-12-13 23:37:10'),
(56, 1, 9, 41, 'USD', 68.29758993, 3.91487950, 1.00000000, 72.21246942, 0.00000000, '', 'D8O5E1OSM4PQ', 0, 1, NULL, NULL, '2021-12-14 08:31:20', '2021-12-14 08:32:37'),
(57, 3, 2, 69, 'USD', 0.91645400, 0.50000000, 1.09116220, 1.54558106, 0.00000000, '', '5XWA42GU4PQO', 0, 0, NULL, NULL, '2022-03-12 16:43:41', '2022-03-12 16:43:41'),
(58, 3, 1000, 70, 'USD', 91.64540000, 3.83290800, 1.09116220, 104.18232061, 0.00000000, '', '3C7WMSONFRTD', 0, 3, '{\"TransactionNumber\":{\"field_name\":\"8976544\",\"type\":\"text\"},\"BankDetails\":{\"field_name\":\"bank three\\r\\nfogo road 19\\r\\n\\r\\nAccount number: 34748909878\",\"type\":\"textarea\"},\"Nid\":{\"field_name\":\"9876543\",\"type\":\"text\"},\"TransferSlip\":{\"field_name\":\"622d8b7a0bd451647151994.jpg\",\"type\":\"file\"}}', 'Transfer rejected', '2022-03-13 05:13:14', '2022-10-23 06:43:11'),
(59, 3, 1000, 71, 'USD', 9.16454000, 2.18329080, 1.09116220, 12.38232402, 0.00000000, '', 'EQTWNEOB1ZFT', 0, 0, NULL, NULL, '2022-03-13 06:04:10', '2022-03-13 06:04:10'),
(60, 3, 9, 71, 'USD', 9.16454000, 0.95822700, 1.09116220, 11.04558071, 0.00000000, '', 'HVJZO42VZFCW', 0, 0, NULL, NULL, '2022-03-13 06:04:17', '2022-03-13 06:04:17'),
(61, 3, 2, 71, 'USD', 9.16454000, 0.50000000, 1.09116220, 10.54558073, 0.00000000, '', '3VCYHKOCPCF7', 0, 0, NULL, NULL, '2022-03-13 06:05:03', '2022-03-13 06:05:03'),
(62, 3, 3, 71, 'USD', 9.16454000, 0.50000000, 1.09116220, 10.54558073, 0.00000000, '', 'SZOH956OCH2N', 0, 0, NULL, NULL, '2022-03-13 06:06:00', '2022-03-13 06:06:00'),
(63, 3, 10, 71, 'INR', 9.16454000, 0.50000000, 73.30000000, 708.41078200, 0.00000000, '', 'B545QS678NOY', 0, 0, NULL, NULL, '2022-03-13 06:06:21', '2022-03-13 06:06:21'),
(64, 3, 16, 71, 'INR', 9.16454000, 0.50000000, 73.30000000, 708.41078200, 0.00000000, '', 'F9FUTDJ6QE6O', 0, 0, NULL, NULL, '2022-03-13 06:06:52', '2022-03-13 06:06:52'),
(65, 3, 16, 71, 'INR', 9.16454000, 0.50000000, 73.30000000, 708.41078200, 0.00000000, '', '3356B3U18UWG', 0, 0, NULL, NULL, '2022-03-13 06:07:20', '2022-03-13 06:07:20'),
(66, 3, 5, 71, 'INR', 9.16454000, 0.50000000, 73.30000000, 708.41078200, 0.00000000, '', 'ZTWTYCW863NR', 0, 0, NULL, NULL, '2022-03-13 06:07:41', '2022-03-13 06:07:41'),
(67, 3, 1, 71, 'SGD', 9.16454000, 0.59164540, 1.09116220, 10.64558072, 0.00000000, '', '8NNE3TCNQ2B3', 0, 0, NULL, NULL, '2022-03-13 06:07:55', '2022-03-13 06:07:55'),
(68, 3, 14, 71, 'USD', 9.16454000, 0.50000000, 1.09116220, 10.54558073, 0.00000000, '', '17FMY8EJ6R1P', 0, 0, NULL, NULL, '2022-03-13 06:08:50', '2022-03-13 06:08:50'),
(69, 3, 3, 71, 'USD', 9.16454000, 0.50000000, 1.09116220, 10.54558073, 0.00000000, '', 'O31QYHA5G119', 0, 0, NULL, NULL, '2022-03-13 06:12:08', '2022-03-13 06:12:08'),
(70, 3, 3, 71, 'USD', 9.16454000, 0.50000000, 1.09116220, 10.54558073, 0.00000000, '', 'XUUH16EKBDZA', 0, 0, NULL, NULL, '2022-03-13 06:19:30', '2022-03-13 06:19:30'),
(71, 3, 1, 71, 'SGD', 9.16454000, 0.59164540, 1.09116220, 10.64558072, 0.00000000, '', '9NJYF5GZR2TR', 0, 0, NULL, NULL, '2022-03-13 06:29:20', '2022-03-13 06:29:20'),
(72, 3, 1, 72, 'USD', 91.64540000, 1.41645400, 1.09116220, 101.54557735, 0.00000000, '', 'R5A4NDYA1SWE', 0, 0, NULL, NULL, '2022-03-13 07:22:05', '2022-03-13 07:22:05'),
(73, 3, 2, 73, 'USD', 91.64540000, 0.50000000, 1.09116220, 100.54557738, 0.00000000, '', 'OZYQP52XDN37', 0, 0, NULL, NULL, '2022-03-13 07:50:44', '2022-03-13 07:50:44'),
(74, 3, 2, 74, 'EUR', 91.64540000, 0.50000000, 1.00000000, 92.14540000, 0.00000000, '', 'NXCR74GQ2BGS', 0, 1, NULL, NULL, '2022-03-13 07:59:59', '2022-03-13 08:04:33'),
(75, 3, 9, 78, 'USD', 9.16454000, 0.95822700, 1.09116220, 11.04558071, 0.00000000, '', 'CJWNKTBWR6J9', 0, 1, NULL, NULL, '2022-03-13 12:02:27', '2022-03-13 12:08:09'),
(76, 3, 14, 91, 'EUR', 140.19606092, 0.00000000, 1.00000000, 140.19606092, 0.00000000, '', 'AOCKY5842P13', 0, 0, NULL, NULL, '2022-03-23 23:55:35', '2022-03-23 23:55:35'),
(77, 3, 1, 95, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', '9WJ8KU51X8R4', 0, 0, NULL, NULL, '2022-04-07 17:14:24', '2022-04-07 17:14:24'),
(78, 3, 1, 95, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', 'G6PPB56CDF43', 0, 0, NULL, NULL, '2022-04-07 17:15:36', '2022-04-07 17:15:36'),
(79, 3, 1, 95, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', '6TPGHVRJW44X', 0, 0, NULL, NULL, '2022-04-17 04:51:50', '2022-04-17 04:51:50'),
(80, 1, 2, 117, 'EUR', 201.70000000, 0.00000000, 1.00000000, 201.70000000, 0.00000000, '', 'UYMW7VUQ1OYF', 0, 0, NULL, NULL, '2022-10-01 09:48:39', '2022-10-01 09:48:39'),
(81, 1, 1, 117, 'EUR', 201.70000000, 0.00000000, 1.00000000, 201.70000000, 0.00000000, '', '78HB5XPPTJ7D', 0, 0, NULL, NULL, '2022-10-01 09:49:09', '2022-10-01 09:49:09'),
(82, 3, 2, 128, 'EUR', 7.33535220, 0.00000000, 1.00000000, 7.33535220, 0.00000000, '', 'HYO4Y1BEV69A', 0, 1, NULL, NULL, '2022-11-02 06:23:26', '2022-11-02 06:24:44'),
(83, 1, 2, NULL, 'EUR', 1000.00000000, 0.00000000, 1.00000000, 1000.00000000, 0.00000000, '', 'SC21H2PC81YJ', 0, 1, NULL, NULL, '2022-11-14 08:34:18', '2022-11-14 08:35:28'),
(84, 5, 2, 145, 'EUR', 73.49763497, 0.00000000, 1.00000000, 73.49763497, 0.00000000, '', 'UTWJZ8VOW79R', 0, 1, NULL, NULL, '2022-12-19 15:40:54', '2022-12-19 15:42:21'),
(85, 6, 2, 147, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', '6RU22T7DW3FF', 0, 1, NULL, NULL, '2022-12-19 17:30:59', '2022-12-19 17:31:42'),
(86, 2, 2, 148, 'EUR', 73.49763497, 0.00000000, 1.00000000, 73.49763497, 0.00000000, '', '2PJHGCPDQZSV', 0, 1, NULL, NULL, '2022-12-19 18:13:23', '2022-12-19 18:14:11'),
(87, 1, 2, NULL, 'EUR', 1000.00000000, 0.00000000, 1.00000000, 1000.00000000, 0.00000000, '', '3ZOO5VU9AHV5', 0, 1, NULL, NULL, '2022-12-20 11:06:05', '2022-12-20 11:07:17'),
(88, 6, 2, 164, 'EUR', 7.34976350, 0.00000000, 1.00000000, 7.34976350, 0.00000000, '', 'RSC53XG8R4Q4', 0, 1, NULL, NULL, '2022-12-21 18:34:13', '2022-12-21 18:35:11'),
(89, 6, 2, 177, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', 'JZBQBMSWWXBD', 0, 1, NULL, NULL, '2022-12-30 08:48:45', '2022-12-30 08:50:03'),
(90, 1, 2, NULL, 'EUR', 100.00000000, 0.00000000, 1.00000000, 100.00000000, 0.00000000, '', 'ESRFVV45DYEJ', 0, 0, NULL, NULL, '2023-01-16 16:24:33', '2023-01-16 16:24:33'),
(91, 6, 2, 195, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', 'SKCEMNH6VXRX', 0, 1, NULL, NULL, '2023-01-22 17:57:32', '2023-01-22 17:59:27'),
(92, 6, 2, 198, 'EUR', 200.00000000, 0.00000000, 1.00000000, 200.00000000, 0.00000000, '', 'G2ZHQZSMX6BD', 0, 1, NULL, NULL, '2023-01-22 18:15:39', '2023-01-22 18:17:13'),
(93, 6, 2, 224, 'EUR', 121.80015558, 0.00000000, 1.00000000, 121.80015558, 0.00000000, '', 'S9M2A11514B5', 0, 1, NULL, NULL, '2023-02-27 05:55:21', '2023-02-27 05:56:11'),
(94, 6, 2, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'JOEUO2NO4332', 0, 0, NULL, NULL, '2023-04-10 11:05:40', '2023-04-10 11:05:40'),
(95, 6, 2, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'G566BA7PU686', 0, 0, NULL, NULL, '2023-04-10 11:08:17', '2023-04-10 11:08:17'),
(96, 6, 2, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'E869OG7G1P7F', 0, 0, NULL, NULL, '2023-04-10 11:15:29', '2023-04-10 11:15:29'),
(97, 6, 1, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'UMCW1BDC169Y', 0, 0, NULL, NULL, '2023-04-10 11:38:23', '2023-04-10 11:38:23'),
(98, 6, 9, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', '8XEAS99EJU5U', 0, 0, NULL, NULL, '2023-04-10 11:43:39', '2023-04-10 11:43:39'),
(99, 6, 14, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'PBUVHCCPSJT6', 0, 0, NULL, NULL, '2023-04-10 11:44:20', '2023-04-10 11:44:20'),
(100, 6, 14, 228, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'UN7SQNBXTRFS', 0, 0, NULL, NULL, '2023-04-10 11:53:00', '2023-04-10 11:53:00'),
(101, 1, 14, NULL, 'EUR', 1200.00000000, 0.00000000, 1.00000000, 1200.00000000, 0.00000000, '', 'PN2V5DFX5X72', 0, 0, NULL, NULL, '2023-06-26 19:52:56', '2023-06-26 19:52:56'),
(102, 6, 2, 236, 'EUR', 102.00000000, 0.00000000, 1.00000000, 102.00000000, 0.00000000, '', 'H7Q575K9YRHS', 0, 1, NULL, NULL, '2023-07-04 11:08:40', '2023-07-04 11:10:32'),
(103, 6, 14, 237, 'EUR', 12.15613317, 0.00000000, 1.00000000, 12.15613317, 0.00000000, '', 'NAYT163D8XUA', 0, 0, NULL, NULL, '2023-08-31 23:42:07', '2023-08-31 23:42:07'),
(104, 12, 9, 251, 'EUR', 400.00000000, 0.00000000, 1.00000000, 400.00000000, 0.00000000, '', '14AOMMYFXUMC', 0, 0, NULL, NULL, '2023-10-22 10:38:41', '2023-10-22 10:38:41'),
(105, 3, 2, 264, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'XZX47YWZOFUN', 0, 1, NULL, NULL, '2023-10-23 02:18:54', '2023-10-23 02:19:22'),
(106, 12, 2, 265, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'HYJ5T81H99AP', 0, 1, NULL, NULL, '2023-10-23 02:21:26', '2023-10-23 02:21:50'),
(107, 12, 2, 266, 'EUR', 400.00000000, 0.00000000, 1.00000000, 400.00000000, 0.00000000, '', 'GH2DNKBEZAOV', 0, 1, NULL, NULL, '2023-10-23 02:23:37', '2023-10-23 02:24:00'),
(108, 13, 1, 272, 'EUR', 10.00000000, 0.00000000, 1.00000000, 10.00000000, 0.00000000, '', 'UVXFQUFTZMNS', 0, 0, NULL, NULL, '2024-01-11 01:09:48', '2024-01-11 01:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_by` int(11) DEFAULT 1,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `min_amount` decimal(18,8) NOT NULL,
  `max_amount` decimal(18,8) NOT NULL,
  `percentage_charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `convention_rate` decimal(18,8) NOT NULL DEFAULT 1.00000000,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `status`, `parameters`, `currencies`, `extra_parameters`, `currency`, `symbol`, `min_amount`, `max_amount`, `percentage_charge`, `fixed_charge`, `convention_rate`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 14, '5f637b5622d23.jpg', 1, '{\"cleint_id\":\"AUrvcotEVWZkksiGir6Ih4PyalQcguQgGN-7We5O1wBny3tg1w6srbQzi6GQEO8lP3yJVha2C6lyivK9\", \"secret\":\"EPx-YEgvjKDRFFu3FAsMue_iUMbMH6jHu408rHdn4iGrUCM8M12t7mX8hghUBAWwvWErBOa4Uppfp0Eh\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, 'EUR', '€', 1.00000000, 10000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-21 18:19:48'),
(2, 'stripe', 'Stripe ', 24, '5f645d432b9c0.jpg', 1, '{\"secret_key\":\"sk_test_aat3tzBCCXXBkS4sxY3M8A1B\",\"publishable_key\":\"pk_test_AU3G7doZ1sbdpJLj0NaozPBu\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, 'EUR', '€', 1.00000000, 10000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-21 18:20:32'),
(3, 'skrill', 'Skrill', 22, '5f637c7fcb9ef.jpg', 0, '{\"pay_to_email\":\"someuser@detracash.com\",\"secret_key\":\"secrete Key\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.09116220, NULL, '2020-09-10 09:05:02', '2022-03-13 06:20:47'),
(4, 'perfectmoney', 'Perfect Money', 19, '5f64d522d8bea.jpg', 0, '{\"passphrase\":\"3rI7464tfJxhwxNnVCDHWBkyS\",\"payee_account\":\"U32174421\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:26:18'),
(5, 'paytm', 'PayTM', 16, '5f637cbfb4d4c.jpg', 0, '{\"MID\":\"uAOkSk48844590235401\",\"merchant_key\":\"pcB_oEk_R@kbm1c1\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"transaction_url\":\"https:\\/\\/securegw.paytm.in\\/order\\/process\",\"transaction_status_url\":\"https:\\/\\/securegw.paytm.in\\/order\\/status\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, 'INR', 'INR', 1.00000000, 10000.00000000, 0.00, 0.50000000, 73.30000000, NULL, '2020-09-10 09:05:02', '2022-03-13 06:10:28'),
(6, 'payeer', 'Payeer', 13, '5f64d52d09e13.jpg', 0, '{\"merchant_id\":\"1142293755\",\"secret_key\":\"1122334455\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:42'),
(7, 'paystack', 'PayStack', 15, '5f637d069177e.jpg', 0, '{\"public_key\":\"pk_test_f922aa1a87101e3fd029e13024006862fdc0b8c7\",\"secret_key\":\"sk_test_b8d571f97c1b41d409ba339eb20b005377751dff\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', 'USD', 'NGN', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:52'),
(8, 'voguepay', 'VoguePay', 23, '5f637d53da3e7.jpg', 0, '{\"merchant_id\":\"9753-0112994\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:26:43'),
(9, 'flutterwave', 'Flutterwave', 8, '5f637d6a0b22d.jpg', 1, '{\"public_key\":\"FLWPUBK_TEST-5003321b93b251536fd2e7e05232004f-X\",\"secret_key\":\"FLWSECK_TEST-d604361e2d4962f4bb2a400c5afefab1-X\",\"encryption_key\":\"FLWSECK_TEST817a365e142b\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, 'EUR', '€', 1.00000000, 10000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-21 18:18:35'),
(10, 'razorpay', 'RazorPay', 20, '5f637d80b68e0.jpg', 0, '{\"key_id\":\"rzp_test_kiOtejPbRZU90E\",\"key_secret\":\"osRDebzEqbsE1kbyQJ4y0re7\"}', '{\"0\": {\"INR\": \"INR\"}}', NULL, 'INR', 'INR', 1.00000000, 10000.00000000, 0.00, 0.50000000, 73.30000000, NULL, '2020-09-10 09:05:02', '2022-03-13 06:11:13'),
(11, 'instamojo', 'instamojo', 9, '5f637da3c44d2.jpg', 0, '{\"api_key\":\"test_2241633c3bc44a3de84a3b33969\",\"auth_token\":\"test_279f083f7bebefd35217feef22d\",\"salt\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, 'INR', 'INR', 1.00000000, 10000.00000000, 0.00, 0.50000000, 73.51000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:06'),
(12, 'mollie', 'Mollie', 11, '5f637db537958.jpg', 0, '{\"api_key\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:23'),
(13, 'twocheckout', '2checkout', 25, '5f637e7eae68b.jpg', 0, '{\"merchant_code\":\"250507228545\",\"secret_key\":\"=+0CNzfvTItqp*ygwiQE\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:26:50'),
(14, 'authorizenet', 'Authorize.Net', 1, '5f637de6d9fef.jpg', 1, '{\"login_id\":\"35s2ZJWTh2\",\"current_transaction_key\":\"3P425sHVwE8t2CzX\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, 'EUR', '€', 10.00000000, 10000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-21 18:19:09'),
(15, 'securionpay', 'SecurionPay', 21, '5f637e002d11b.jpg', 0, '{\"public_key\":\"pk_test_VZEUdaL8fYjBVbDOSkPFcgE0\",\"secret_key\":\"sk_test_yd5JJnYpsEoKtlaXDBkAFpse\"}', '{\"0\":{\"AFN\":\"AFN\", \"DZD\":\"DZD\", \"ARS\":\"ARS\", \"AUD\":\"AUD\", \"BHD\":\"BHD\", \"BDT\":\"BDT\", \"BYR\":\"BYR\", \"BAM\":\"BAM\", \"BWP\":\"BWP\", \"BRL\":\"BRL\", \"BND\":\"BND\", \"BGN\":\"BGN\", \"CAD\":\"CAD\", \"CLP\":\"CLP\", \"CNY\":\"CNY\", \"COP\":\"COP\", \"KMF\":\"KMF\", \"HRK\":\"HRK\", \"CZK\":\"CZK\", \"DKK\":\"DKK\", \"DJF\":\"DJF\", \"DOP\":\"DOP\", \"EGP\":\"EGP\", \"ETB\":\"ETB\", \"ERN\":\"ERN\", \"EUR\":\"EUR\", \"GEL\":\"GEL\", \"HKD\":\"HKD\", \"HUF\":\"HUF\", \"ISK\":\"ISK\", \"INR\":\"INR\", \"IDR\":\"IDR\", \"IRR\":\"IRR\", \"IQD\":\"IQD\", \"ILS\":\"ILS\", \"JMD\":\"JMD\", \"JPY\":\"JPY\", \"JOD\":\"JOD\", \"KZT\":\"KZT\", \"KES\":\"KES\", \"KWD\":\"KWD\", \"KGS\":\"KGS\", \"LVL\":\"LVL\", \"LBP\":\"LBP\", \"LTL\":\"LTL\", \"MOP\":\"MOP\", \"MKD\":\"MKD\", \"MGA\":\"MGA\", \"MWK\":\"MWK\", \"MYR\":\"MYR\", \"MUR\":\"MUR\", \"MXN\":\"MXN\", \"MDL\":\"MDL\", \"MAD\":\"MAD\", \"MZN\":\"MZN\", \"NAD\":\"NAD\", \"NPR\":\"NPR\", \"ANG\":\"ANG\", \"NZD\":\"NZD\", \"NOK\":\"NOK\", \"OMR\":\"OMR\", \"PKR\":\"PKR\", \"PEN\":\"PEN\", \"PHP\":\"PHP\", \"PLN\":\"PLN\", \"QAR\":\"QAR\", \"RON\":\"RON\", \"RUB\":\"RUB\", \"SAR\":\"SAR\", \"RSD\":\"RSD\", \"SGD\":\"SGD\", \"ZAR\":\"ZAR\", \"KRW\":\"KRW\", \"IKR\":\"IKR\", \"LKR\":\"LKR\", \"SEK\":\"SEK\", \"CHF\":\"CHF\", \"SYP\":\"SYP\", \"TWD\":\"TWD\", \"TZS\":\"TZS\", \"THB\":\"THB\", \"TND\":\"TND\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"AED\":\"AED\", \"GBP\":\"GBP\", \"USD\":\"USD\", \"VEB\":\"VEB\", \"VEF\":\"VEF\", \"VND\":\"VND\", \"XOF\":\"XOF\", \"YER\":\"YER\", \"ZMK\":\"ZMK\"}}', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:26:30'),
(16, 'payumoney', 'PayUmoney', 18, '5f6390dbaa6ff.jpg', 0, '{\"merchant_key\":\"gtKFFx\",\"salt\":\"eCwWELxi\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, 'INR', 'INR', 1.00000000, 10000.00000000, 0.00, 0.50000000, 73.30000000, NULL, '2020-09-10 09:05:02', '2022-03-13 06:10:38'),
(17, 'mercadopago', 'Mercado Pago', 10, '5f645d1bc1f24.jpg', 0, '{\"access_token\":\"TEST-705032440135962-041006-ad2e021853f22338fe1a4db9f64d1491-421886156\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, 'BRL', 'BRL', 5.00000000, 371500000.12000000, 0.00, 0.50000000, 0.06300000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:14'),
(18, 'coingate', 'Coingate', 7, '5f659e5355859.jpg', 0, '{\"api_key\":\"Ba1VgPx6d437xLXGKCBkmwVCEw5kHzRJ6thbGo-N\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:01'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 3, '5f6703145a5ca.jpg', 0, '{\"api_key\":\"c71152b8-ab4e-4712-a421-c5c7ea5165a2\",\"secret\":\"a709d081-e693-46e0-8a34-61fd785b20b3\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', NULL, 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:24:29'),
(20, 'monnify', 'Monnify', 12, '5fbca5d05057f.jpg', 0, '{\"api_key\":\"MK_TEST_LB5KJDYD65\",\"secret_key\":\"WM9B4GSW826XRCNABM3NF92K9957CVMU\", \"contract_code\":\"5566252118\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, 'NGN', 'NGN', 1.00000000, 10000.00000000, 0.00, 0.50000000, 408.52000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:25:35'),
(21, 'blockio', 'Block.io', 2, '5fe038332ad52.jpg', 0, '{\"api_key\":\"1d97-a9af-6521-a330\",\"api_pin\":\"654abc654opp\"}', '{\"1\":{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\"}}', '{\"cron\":\"ipn\"}', 'BTC', 'BTC', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:24:18'),
(22, 'coinpayments', 'CoinPayments', 6, '5ffd7d962985e1610448278.jpg', 0, '{\"merchant_id\":\"93a1e014c4ad60a7980b4a7239673cb4\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', NULL, 'BTC', 'BTC', 1.00000000, 99999.00000000, 1.00, 0.50000000, 0.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:24:51'),
(23, 'blockchain', 'Blockchain', 4, '5fe439f477bb7.jpg', 0, '{\"api_key\":\"8df2e5a0-3798-4b74-871d-973615b57e7b\",\"xpub_code\":\"xpub6CXLqfWXj1xgXe79nEQb3pv2E7TGD13pZgHceZKrQAxqXdrC2FaKuQhm5CYVGyNcHLhSdWau4eQvq3EDCyayvbKJvXa11MX9i2cHPugpt3G\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, 'BTC', 'BTC', 1.00000000, 10000.00000000, 0.00, 0.50000000, 1.00000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:24:34'),
(24, 'cashmaal', 'Cashmaal', 5, 'cashmaal.jpg', 0, '{\"web_id\": \"3748\",\"ipn_key\": \"546254628759524554647987\"}\r\n', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', 'PKR', 'PKR', 1.00000000, 10000.00000000, 0.00, 0.50000000, 0.85000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:24:45'),
(25, 'paythrow', 'PayThrow', 17, '60d57a34ba6581624603188.jpg', 0, '{\"client_id\":\"mAoObRUVPWGr4iM6KNz0AagUJaRHlv\", \"client_secret\":\"x0uyby7BCT95Kdl9q5PaqG9DLscPVZxb9ciqCnfoU7QRfhTUeWgXjHJMbRRAkpJwCGztIdN1FVzFYlEoD6Nb43Oe9miSRizPs1Kl\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', 'USD', 'USD', 1.00000000, 10000.00000000, 0.00, 0.50000000, 157.96000000, NULL, '2020-09-10 09:05:02', '2022-03-07 17:26:08'),
(1000, 'mobile-money', 'Bank Transfer', 1, '622d9390d71041647154064.jpg', 0, '{\"TransferSlip\":{\"field_name\":\"TransferSlip\",\"field_level\":\"Transfer Slip\",\"type\":\"file\",\"validation\":\"required\"},\"TransactionNumber\":{\"field_name\":\"TransactionNumber\",\"field_level\":\"Transaction  Number\",\"type\":\"text\",\"validation\":\"required\"},\"BankDetails\":{\"field_name\":\"BankDetails\",\"field_level\":\"Bank Details\",\"type\":\"textarea\",\"validation\":\"required\"},\"Nid\":{\"field_name\":\"Nid\",\"field_level\":\"Nid\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, NULL, 'EUR', 'EUR', 1.00000000, 10000.00000000, 0.00, 0.00000000, 1.00000000, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><br></div>', '2021-06-26 22:54:52', '2022-03-21 18:22:05'),
(1001, 'cash-pick-up', 'Cash Pick-Up', 1, '622d945d29ece1647154269.jpg', 0, '[]', NULL, NULL, 'EUR', 'EUR', 1.00000000, 2000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '2022-03-12 14:02:36', '2022-03-21 18:22:42'),
(1002, 'bank-rummer', 'bank rummer', 1, NULL, 0, '[]', NULL, NULL, 'Euro', 'Euro', 100.00000000, 2000.00000000, 2.50, 2.50000000, 0.23456000, NULL, '2022-10-30 14:12:18', '2022-10-30 14:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `identify_forms`
--

CREATE TABLE `identify_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `services_form` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `identify_forms`
--

INSERT INTO `identify_forms` (`id`, `name`, `slug`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Driving License', 'driving-license', '{\"FrontPage\":{\"field_name\":\"FrontPage\",\"field_level\":\"Front Page\",\"type\":\"file\",\"field_length\":\"2500\",\"length_type\":\"max\",\"validation\":\"required\"},\"RearPage\":{\"field_name\":\"RearPage\",\"field_level\":\"Rear Page\",\"type\":\"file\",\"field_length\":\"2500\",\"length_type\":\"max\",\"validation\":\"required\"},\"PassportNumber\":{\"field_name\":\"PassportNumber\",\"field_level\":\"Passport Number\",\"type\":\"text\",\"field_length\":\"20\",\"length_type\":\"max\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_level\":\"Address\",\"type\":\"textarea\",\"field_length\":\"300\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-09-30 22:07:40', '2021-10-01 08:01:12'),
(2, 'Passport', 'passport', '{\"PassportNumber\":{\"field_name\":\"PassportNumber\",\"field_level\":\"Passport Number\",\"type\":\"text\",\"field_length\":\"25\",\"length_type\":\"max\",\"validation\":\"required\"},\"PassportImage\":{\"field_name\":\"PassportImage\",\"field_level\":\"Passport Image\",\"type\":\"file\",\"field_length\":\"1040\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-09-30 22:16:23', '2021-10-01 07:59:50'),
(4, 'National ID', 'national-id', '{\"FrontPage\":{\"field_name\":\"FrontPage\",\"field_level\":\"Front Page\",\"type\":\"file\",\"field_length\":\"500\",\"length_type\":\"max\",\"validation\":\"required\"},\"RearPage\":{\"field_name\":\"RearPage\",\"field_level\":\"Rear Page\",\"type\":\"file\",\"field_length\":\"500\",\"length_type\":\"max\",\"validation\":\"required\"},\"NidNumber\":{\"field_name\":\"NidNumber\",\"field_level\":\"Nid Number\",\"type\":\"text\",\"field_length\":\"10\",\"length_type\":\"digits\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_level\":\"Address\",\"type\":\"textarea\",\"field_length\":\"300\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-10-01 07:58:40', '2021-10-01 07:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `kyc_type` varchar(20) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> Approved, 2 => Reject',
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `user_id`, `admin_id`, `kyc_type`, `details`, `status`, `feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'passport', '{\"PassportNumber\":{\"field_name\":\"564646546464\",\"type\":\"text\"},\"PassportImage\":{\"field_name\":\"615748191c92e1633110041.png\",\"type\":\"file\"}}', 1, NULL, '2021-10-01 11:40:41', '2021-10-01 21:46:59'),
(2, 1, NULL, 'address-verification', '{\"addressProof\":{\"field_name\":\"61575332c5d011633112882.jpg\",\"type\":\"file\"}}', 1, NULL, '2021-10-01 12:28:02', '2021-10-01 21:48:29'),
(3, 1, 1, 'address-verification', '{\"addressProof\":{\"field_name\":\"615753dfa738c1633113055.png\",\"type\":\"file\"}}', 1, NULL, '2021-10-01 12:30:55', '2021-10-01 21:46:01'),
(4, 3, 1, 'driving-license', '{\"PassportNumber\":{\"field_name\":\"45678999\",\"type\":\"text\"},\"Address\":{\"field_name\":\"bergs street 35\",\"type\":\"textarea\"},\"FrontPage\":{\"field_name\":\"62286e09b8e261646816777.jpg\",\"type\":\"file\"},\"RearPage\":{\"field_name\":\"62286e09c472c1646816777.jpg\",\"type\":\"file\"}}', 1, NULL, '2022-03-09 08:06:17', '2022-03-09 08:51:16'),
(5, 3, 1, 'address-verification', '{\"addressProof\":{\"field_name\":\"62287908bfb4b1646819592.jpg\",\"type\":\"file\"}}', 1, NULL, '2022-03-09 08:53:12', '2022-03-09 08:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `is_active`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'US', NULL, 1, 0, '2021-06-01 07:41:56', '2021-06-01 07:41:56'),
(2, 'Français', 'FR', NULL, 1, 0, '2023-02-04 17:55:22', '2023-02-12 13:36:31'),
(3, 'Afgan', 'AF', NULL, 1, 0, '2023-10-12 22:45:27', '2023-10-12 22:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_09_29_074810_create_jobs_table', 1),
(32, '2020_11_12_075639_create_transactions_table', 6),
(36, '2020_10_14_113046_create_admins_table', 9),
(42, '2020_11_24_064711_create_email_templates_table', 11),
(48, '2014_10_12_000000_create_users_table', 13),
(51, '2020_09_16_103709_create_controls_table', 15),
(59, '2021_01_03_061604_create_tickets_table', 17),
(60, '2021_01_03_061834_create_ticket_messages_table', 18),
(61, '2021_01_03_065607_create_ticket_attachments_table', 18),
(62, '2021_01_07_095019_create_funds_table', 19),
(66, '2021_01_21_050226_create_languages_table', 21),
(69, '2020_12_17_075238_create_sms_controls_table', 23),
(70, '2021_01_26_051716_create_site_notifications_table', 24),
(72, '2021_01_26_075451_create_notify_templates_table', 25),
(73, '2021_01_28_074544_create_contents_table', 26),
(74, '2021_01_28_074705_create_content_details_table', 26),
(75, '2021_01_28_074829_create_content_media_table', 26),
(76, '2021_01_28_074847_create_templates_table', 26),
(77, '2021_01_28_074905_create_template_media_table', 26),
(83, '2021_02_03_100945_create_subscribers_table', 27),
(86, '2021_01_21_101641_add_language_to_email_templates_table', 28),
(90, '2021_03_13_132414_create_payout_methods_table', 31),
(91, '2021_03_13_133534_create_payout_logs_table', 32),
(93, '2021_03_18_091710_create_referral_bonuses_table', 33),
(95, '2021_06_08_061111_create_contacts_table', 34),
(96, '2021_06_09_085309_create_escrows_table', 35),
(97, '2021_06_10_183014_create_chat_notifications_table', 36),
(98, '2021_06_17_064637_create_configures_table', 37),
(100, '2021_08_15_101704_create_sending_purposes_table', 39),
(101, '2021_08_15_101810_create_source_funds_table', 40),
(102, '2021_08_15_101925_create_continents_table', 41),
(104, '2021_08_15_102109_create_countries_table', 42),
(105, '2021_08_15_103012_create_services_table', 43),
(106, '2021_08_15_105202_create_country_services_table', 44),
(108, '2021_08_15_110306_create_country_service_charges_table', 45),
(109, '2021_08_15_101234_create_coupons_table', 46),
(110, '2021_08_23_141708_create_send_money_table', 47),
(111, '2021_09_03_193954_create_colors_table', 48),
(112, '2021_09_23_132653_create_user_logins_table', 49),
(113, '2021_09_26_145719_create_admin_login_logs_table', 50),
(114, '2021_10_01_034148_create_identify_forms_table', 51),
(115, '2021_10_01_172405_create_k_y_c_s_table', 52),
(116, '2021_10_17_104632_create_top_up_logs_table', 53),
(117, '2022_08_25_111102_create_blog_categories_table', 54),
(118, '2022_08_25_111255_create_blogs_table', 54),
(119, '2024_01_10_120240_create_serviceinfos_table', 55);

-- --------------------------------------------------------

--
-- Table structure for table `notify_templates`
--

CREATE TABLE `notify_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `template_key` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> Admin, 0=> User',
  `lang_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notify_templates`
--

INSERT INTO `notify_templates` (`id`, `language_id`, `name`, `template_key`, `body`, `short_keys`, `status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'SUPPORT TICKET CREATE', 'SUPPORT_TICKET_CREATE', '[[username]] create a ticket\r\nTicket : [[ticket_id]]\r\n\r\n', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(2, 1, 'SUPPORT TICKET REPLIED', 'SUPPORT_TICKET_REPLIED', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]\r\n\r\n', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(3, 1, 'ADMIN REPLIED SUPPORT TICKET ', 'ADMIN_REPLIED_TICKET', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"ticket_id\":\"Support Ticket ID\"}', 1, 0, 'en', '2021-01-26 04:14:36', '2021-01-26 05:37:30'),
(4, 1, 'ADMIN PAYMENT NOTIFICATION', 'ADMIN_PAYMENT_COMPLETE', '[[username]] deposited [[amount]] [[currency]] via [[gateway]]\r\n', '{\"gateway\":\"gateway\",\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(35, 1, 'PAYMENT APPROVED', 'PAYMENT_APPROVED', '[[amount]] [[currency]]  deposit requested has been approved\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(36, 1, 'PAYEMNT REJECTED', 'DEPOSIT_REJECTED', '[[amount]] [[currency]]  payment request has been rejected\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(37, 1, 'PAYEMNT REQUEST  TO ADMIN', 'DEPOSIT_REQUEST', '[[username]] payment requested  sent  [[amount]] [[currency]] <br> by [[gateway]]\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\",\"gateway\":\"gateway name\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(38, 1, 'SEND MONEY REQUEST TO ADMIN', 'SEND_MONEY_REQUEST', '[[username]] requested  to transfer  [[amount]] [[currency]]\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(39, 1, 'PAYMENT COMPLTE', 'PAYMENT_COMPLETE', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\r\n', '{\"gateway_name\":\"gateway name\",\"amount\":\"amount\",\"charge\":\"charge\", \"currency\":\"currency\",\"transaction\":\"transaction\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(40, 1, 'MONEY TRANSFER COMPLETE', 'MONEY_TRANSFER_COMPLETE', '[[amount]] [[currency]]  money transfer has been completed\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(41, 1, 'MONEY TRANSFER REJECTED', 'MONEY_TRANSFER_REJECTED', '[[amount]] [[currency]]  money transfer has been rejected\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(42, 1, 'KYC APPROVED', 'KYC_APPROVED', 'Your [[kyc_type]] request has been approved\r\n', '{\"kyc_type\":\"KYC type\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(43, 1, 'KYC REJECTED', 'KYC_REJECTED', 'Your [[kyc_type]] request has been rejected\r\n', '{\"kyc_type\":\"KYC type\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(44, 1, 'MERCHANT TRANSFER PROCESSING', 'MERCHANT_TRANSFER_PROCESSING', 'Your  [[amount]] [[currency]] transfer is processing\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(45, 1, 'PAYOUT COMPLETE', 'PAYOUT_COMPLETE', '[[amount]] [[currency]]  payout has been completed\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(46, 1, 'ADD BALANCE', 'ADD_BALANCE', '[[amount]] [[currency]] credited in your account. \r\n', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 0, NULL, '2021-01-26 04:14:36', '2021-01-26 04:14:36'),
(47, 2, 'KYC REJECTED', 'KYC_REJECTED', 'Your [[kyc_type]] request has been rejected\r\n', '{\"kyc_type\":\"KYC type\"}', 1, 0, 'FR', '2023-04-10 11:56:37', '2023-04-10 11:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE `recipients` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `bank_acc_no` varchar(45) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`id`, `user_id`, `recipient_name`, `first_name`, `last_name`, `email`, `phone`, `country_code`, `address`, `city`, `postal_code`, `state`, `country`, `bank_acc_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Ahsan ali', 'Ahsan', 'ali', 'ahsankk126@gmail.com', '+923133255662', NULL, 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', NULL, 0, '2022-12-19 12:39:08', '2022-12-19 12:39:08'),
(2, 2, 'Ali Khan', 'Ali', 'Khan', 'alikhan@gmail.com', '+923133255662', NULL, 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', NULL, 0, '2022-12-21 15:35:57', '2022-12-21 15:35:57'),
(3, 2, 'Khan Ali', 'Khan', 'Ali', 'khanali@gmail.com', '201555103', NULL, 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', NULL, 0, '2022-12-21 15:38:16', '2022-12-21 15:38:16'),
(4, 3, 'George Asana', 'George', 'Asana', 'asana@yahoo.com', '+3234782097', NULL, 'caral 35', 'Brussels', '65423', 'BE', 'Belgium', NULL, 0, '2022-12-21 17:04:41', '2022-12-21 17:04:41'),
(5, 2, 'Imran Khan', 'Imran', 'Khan', 'imrankhan@gmail.com', '20165223301', NULL, 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', NULL, 0, '2022-12-22 04:42:51', '2022-12-22 04:42:51'),
(6, 2, 'AhsanAbid ali', NULL, NULL, 'alikhanimran@gmail.com', '2016589241', NULL, 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', NULL, 0, '2022-12-22 04:44:15', '2022-12-22 04:44:15'),
(7, 6, 'gary juona', 'gary', 'juona', 'nana@nna.com', '6789097654', '+237', 'caral 35', 'Neuss', '41411', NULL, 'Germany', NULL, 0, '2022-12-22 05:30:07', '2023-01-16 14:17:44'),
(8, 6, 'Test Yaya', 'Test', 'Yaya', 'austin@detracash.com', '87345780', '+237', 'Longla Street 1', 'Bamenda', NULL, 'North West', 'Camerron', NULL, 0, '2022-12-30 08:48:35', '2022-12-30 08:48:35'),
(9, 2, 'Ahsan 2 ali2', 'Ahsan 2', 'ali2', 'ahsankk126@gmail.com', '3133255662', '+92', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', NULL, 0, '2023-01-18 04:39:04', '2023-01-18 04:39:04'),
(10, 6, 'Loma sana', 'Loma', 'Sana', 'nana@nana.com', '67178654', '+237', 'Longla', 'Bamenda', NULL, 'NW', 'Cameroon', NULL, 0, '2023-07-04 11:08:24', '2023-07-04 11:08:24'),
(11, 6, 'Ayazul Ridoy', 'Ayazul', 'Ridoy', 'ayazulridoy@gmail.com', '1726-990207', '+880', 'Sylhet', 'Sylhet', '12345', 'Sylhet', 'Bangladesh', '1234567890', 0, '2023-08-31 14:42:50', '2023-08-31 14:52:45'),
(12, 6, 'Ayazul Ridoy', 'Ayazul', 'Ridoy', 'ayazulridoy@gmail.com', '1726990207', '+880', 'Sylhet', 'Sylhet', '12345', 'Sylhet', 'Bangladesh', NULL, 0, '2023-08-31 23:41:49', '2023-08-31 23:41:49'),
(13, 9, 'Ayazul Ridoy', 'Ayazul', 'Ridoy', 'ayazulridoy@gmail.com', '7747445', '+237', 'Sylhet', 'Sylhet', '12345', 'Sylhet', 'CAMEROON', '1234567890', 0, '2023-09-01 06:01:02', '2023-09-01 06:01:02'),
(14, 11, 'fdsvfv fvfdvfd', 'fdsvfv', 'fvfdvfd', 'ayazulridoy@gmail.com', '23455434', NULL, 'dascdacd', 'dscsdcdscs', '12345', 'csdcdscfdsc', 'GB', NULL, 0, '2023-09-05 03:39:29', '2023-09-05 03:39:29'),
(15, 11, 'RIDOY RIDOY', 'RIDOY', 'RIDOY', 'ayazulridoy@gmail.com', '12345', NULL, 'RIDOY', 'RIDOY', 'RIDOY', 'RIDOY', 'UK', NULL, 0, '2023-09-05 03:46:40', '2023-09-05 03:46:40'),
(16, 11, 'RIDOY RIDOY', 'RIDOY', 'RIDOY', 'ayazulridoy@gmail.com', '678', 'GBP', 'RIDOY', 'RIDOY', 'RIDOY', 'RIDOY', 'UK', NULL, 0, '2023-09-05 03:49:45', '2023-09-05 03:49:45'),
(17, 12, 'Hussain', 'MD', 'Hussain', 'dfasdfsdf@gmail.com', '1231231231', 'EUR', '123', 'demo', '2333', '123123', 'GERMANY', NULL, 0, '2023-10-22 10:38:23', '2023-10-22 10:38:23'),
(18, 3, 'EMad ahsad', 'EMad', 'ahsad', 'emad@gmail.com', '1321321321312', 'EUR', '123', '1231', '2333', '123123', 'GERMANY', NULL, 0, '2023-10-23 02:18:47', '2023-10-23 02:18:47'),
(19, 12, 'Ope OPe', 'Ope', 'OPe', 'ope@gmail.com', '12312321321', 'EUR', 'dasd', 'asdas', '21321', '12312', 'GERMANY', NULL, 0, '2023-10-23 02:21:22', '2023-10-23 02:21:22'),
(20, 12, 'New man Man', 'New man', 'Man', '34142@gmail.com', '432432423', 'EUR', '123123', '123123', '31232', '3123', 'GERMANY', NULL, 0, '2023-10-23 02:23:33', '2023-10-23 02:23:33'),
(21, 13, 'Jual Ahmed', 'Jual', 'Ahmed', 'md.jual.ah@gmail.com', '1784622362', 'EUR', 'kanaighat,sylhet', 'sylhet', '3100', '3100', 'GERMANY', NULL, 0, '2024-01-11 01:09:10', '2024-01-11 01:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `sending_purposes`
--

CREATE TABLE `sending_purposes` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sending_purposes`
--

INSERT INTO `sending_purposes` (`id`, `language_id`, `parent_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Friend Support', '2021-08-15 20:18:48', '2023-04-10 09:45:56'),
(2, 1, 0, 'Family Support', '2021-08-15 20:18:55', '2021-08-15 20:18:55'),
(3, 1, 0, 'Charity', '2021-08-15 20:19:00', '2021-08-15 20:19:00'),
(6, 1, 0, 'Medical expenses', '2021-08-15 20:19:14', '2021-08-15 20:19:14'),
(9, 1, 0, 'School fees', '2021-08-15 20:19:29', '2021-08-15 20:19:29'),
(11, 2, 10, 'Autres', '2023-04-10 05:22:49', '2023-04-10 05:22:49'),
(12, 2, 9, 'Frais Scolaires', '2023-04-10 09:42:09', '2023-04-10 09:42:09'),
(13, 2, 6, 'Frais Médicaux', '2023-04-10 09:42:41', '2023-04-10 09:42:41'),
(14, 2, 3, 'Charité', '2023-04-10 09:43:12', '2023-04-10 09:43:12'),
(15, 2, 2, 'Soutien Familial', '2023-04-10 09:43:49', '2023-04-10 09:43:49'),
(16, 2, 1, 'Soutien ami', '2023-04-10 09:45:13', '2023-04-10 09:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `send_money`
--

CREATE TABLE `send_money` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `send_currency_id` bigint(20) DEFAULT NULL COMMENT 'Country ID',
  `receive_currency_id` bigint(20) DEFAULT NULL COMMENT 'Country ID',
  `service_id` bigint(20) DEFAULT NULL COMMENT 'Service Id',
  `country_service_id` bigint(20) DEFAULT NULL COMMENT 'Provider Id',
  `send_curr_rate` decimal(18,8) DEFAULT 0.00000010,
  `send_curr` varchar(10) DEFAULT NULL COMMENT 'Country Code',
  `receive_curr` varchar(10) DEFAULT NULL COMMENT 'Country Code',
  `send_amount` decimal(18,8) DEFAULT NULL,
  `fees` decimal(18,8) DEFAULT NULL,
  `payable_amount` decimal(18,8) DEFAULT NULL,
  `recipient_get_amount` decimal(18,8) DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `admin_reply` text DEFAULT NULL,
  `serviceinfo` text DEFAULT NULL,
  `invoice` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=> Information require, 1=>  Completed,2=>Draft,  3 => admin Cancelled',
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> Completed, 2=> Cancelled, 3 => awaiting',
  `paid_at` datetime DEFAULT NULL,
  `promo_code` int(11) DEFAULT NULL,
  `discount` decimal(11,2) DEFAULT NULL,
  `fund_source` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `user_information` text DEFAULT NULL,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `recipient_name` varchar(91) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `recipient_country_code` varchar(20) DEFAULT NULL,
  `recipient_contact_no` varchar(191) DEFAULT NULL,
  `recipient_address` text DEFAULT NULL,
  `recipient_city` varchar(255) DEFAULT NULL,
  `recipient_pcode` varchar(255) DEFAULT NULL,
  `recipient_state` varchar(255) DEFAULT NULL,
  `recipient_country` varchar(255) DEFAULT NULL,
  `is_future_trx` tinyint(1) NOT NULL DEFAULT 0,
  `sender_name` varchar(91) DEFAULT NULL,
  `sender_country_code` varchar(20) DEFAULT NULL,
  `sender_phone` varchar(50) DEFAULT NULL,
  `sender_email` varchar(50) DEFAULT NULL,
  `sender_address` varchar(191) DEFAULT NULL,
  `sender_city` varchar(40) DEFAULT NULL,
  `sender_post_code` varchar(20) DEFAULT NULL,
  `sender_state` varchar(40) DEFAULT NULL,
  `sender_country` varchar(20) DEFAULT NULL,
  `sender_identity_verification` text DEFAULT NULL,
  `sender_identity_type` varchar(30) DEFAULT NULL,
  `sender_address_verification` text DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  `merchant_commission` decimal(18,8) DEFAULT 0.00000000 COMMENT 'After Sending',
  `merchant_profit` decimal(18,8) DEFAULT 0.00000000 COMMENT 'After Payout',
  `admin_commission` decimal(18,8) DEFAULT 0.00000000,
  `payment_type` varchar(20) DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flutter_status` text DEFAULT NULL,
  `flutter_response` varchar(91) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `send_money`
--

INSERT INTO `send_money` (`id`, `user_id`, `send_currency_id`, `receive_currency_id`, `service_id`, `country_service_id`, `send_curr_rate`, `send_curr`, `receive_curr`, `send_amount`, `fees`, `payable_amount`, `recipient_get_amount`, `rate`, `admin_id`, `admin_reply`, `serviceinfo`, `invoice`, `status`, `payment_status`, `paid_at`, `promo_code`, `discount`, `fund_source`, `purpose`, `user_information`, `recipient_id`, `recipient_name`, `first_name`, `last_name`, `recipient_email`, `recipient_country_code`, `recipient_contact_no`, `recipient_address`, `recipient_city`, `recipient_pcode`, `recipient_state`, `recipient_country`, `is_future_trx`, `sender_name`, `sender_country_code`, `sender_phone`, `sender_email`, `sender_address`, `sender_city`, `sender_post_code`, `sender_state`, `sender_country`, `sender_identity_verification`, `sender_identity_type`, `sender_address_verification`, `merchant_id`, `merchant_commission`, `merchant_profit`, `admin_commission`, `payment_type`, `received_at`, `deleted_at`, `created_at`, `updated_at`, `flutter_status`, `flutter_response`) VALUES
(1, 4, 2, 1, 3, 2, 1.00000010, 'GBP', 'NGN', 100.00000000, 0.00000000, 100.00000000, 56369.86000000, 563.69863014, 1, 'sdasdasd', NULL, 264641654165464, 1, 1, '2021-09-28 14:58:32', NULL, NULL, 'Dividends', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"1234567890\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'teasdasd@gmail.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.00000000, 0.00000000, 0.00000000, NULL, '2022-11-14 09:25:45', NULL, NULL, '2022-11-14 08:25:45', NULL, NULL),
(2, 4, 2, 1, 3, 2, 1.00000010, 'GBP', 'NGN', 100.00000000, 0.00000000, 100.00000000, 56369.86000000, 563.69863015, 1, 'sdasdasd', NULL, 264641654165465, 1, 1, '2021-09-28 14:58:32', NULL, NULL, 'Dividends', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"1234567890\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'teasdasd@gmail.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0.00000000, 0.00000000, 0.00000000, NULL, '2021-10-08 11:52:53', NULL, NULL, '2021-10-08 05:52:53', NULL, NULL),
(3, 4, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16333603882953, 2, 0, NULL, NULL, NULL, 'hi', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"0123456789\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'teasdasd@gmail.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-04 09:13:08', '2021-10-04 09:13:31', NULL, NULL),
(4, 4, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 120.00000000, 0.00000000, 120.00000000, 38966.12000000, 324.71764896, 1, 'Your payment is completed', NULL, 16334317394738, 1, 1, '2021-10-08 04:55:27', NULL, NULL, 'hi', 'Family Support', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"7434567896\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'Jemmy@gmail.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, 'Alex', NULL, '156456464654', 'alex@sender.com', 'asdasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, '2022-07-24 09:05:56', NULL, '2021-10-05 05:02:19', '2022-07-24 07:05:56', NULL, NULL),
(5, 2, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 120.00000000, 20.00000000, 120.00000000, 38966.12000000, 324.71764896, NULL, NULL, NULL, 16336256681872, 1, 1, '2021-10-08 04:48:49', NULL, NULL, 'hi', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"1234567896\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'Jemmy@gmail.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, 'Alex', NULL, '156456464654', 'alex@sender.com', 'asdasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6.32253629, 3.16126814, 6.32253628, NULL, '2021-10-08 11:51:29', NULL, '2021-10-07 10:54:28', '2021-10-08 05:51:29', NULL, NULL),
(6, 4, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 120.00000000, 0.00000000, 120.00000000, 38966.12000000, 324.71764896, NULL, NULL, NULL, 16342692211848, 2, 1, '2021-10-15 05:25:45', NULL, NULL, 'hi', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"1234567890\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'Jemmy@gmail.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, 'Alex  TOme', NULL, '541654646', 'alex@sender.com', 'asdasdasd', 'asdas', 'as65465465', '544', 'Bangladesh', '{\"identityProof\":{\"field_name\":\"616910d8dd7141634275544.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/15\",\"type\":\"file\"}}', 'Driving License', '{\"addressProof\":{\"field_name\":\"616910d903e001634275545.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/15\",\"type\":\"file\"}}', NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-14 21:40:21', '2021-10-14 23:25:45', NULL, NULL),
(7, 2, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 120.00000000, 0.00000000, 120.00000000, 38966.12000000, 324.71764896, NULL, NULL, NULL, 16342788895484, 2, 1, '2021-10-15 08:13:56', NULL, NULL, 'hi', 'Family Support', '{\"BankAccountName\":{\"field_name\":\"Alex\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"1234567890\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'alex@sender.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, 'Alex TOme', NULL, '0541654646', 'alex@sender.com', 'asdasdasd', 'asdas', 'as65465465', '544', 'Bangladesh', '{\"identityProof\":{\"field_name\":\"61692907a69161634281735.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/15\",\"type\":\"file\"}}', 'Passport', '{\"addressProof\":{\"field_name\":\"61692907b4c881634281735.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/15\",\"type\":\"file\"}}', NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-15 00:21:29', '2021-10-15 02:13:56', NULL, NULL),
(8, 2, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 120.00000000, 0.00000000, 120.00000000, 38966.12000000, 324.71764896, NULL, NULL, NULL, 16342859619361, 2, 1, '2021-10-15 08:22:55', NULL, NULL, 'hi', 'Family Support', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"8916302115\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'alex@sender.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, 'Alex TOme', NULL, '0541654646', 'alex@sender.com', 'asdasdasd', 'asdas', 'as65465465', '544', 'Bangladesh', '{\"identityProof\":{\"field_name\":\"61693a33df5e31634286131.png\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/15\",\"type\":\"file\"}}', 'Driving License', '{\"addressProof\":{\"field_name\":\"61693a343df821634286132.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/15\",\"type\":\"file\"}}', NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-15 02:19:21', '2021-10-15 02:22:55', NULL, NULL),
(9, 4, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16342877692360, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-15 02:49:29', '2021-10-15 02:49:29', NULL, NULL),
(10, 1, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 10.00000000, 0.00000000, 10.00000000, 3247.18000000, 324.71764896, NULL, NULL, NULL, 16342878339761, 2, 0, NULL, NULL, NULL, 'hi', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Ziohoihsad\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"4567896321\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'alex@sender.com', NULL, '01544144111', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-15 02:50:33', '2021-10-15 02:53:07', NULL, NULL),
(11, 4, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 120.00000000, 0.00000000, 120.00000000, 38966.12000000, 324.71764896, NULL, NULL, NULL, 16343784544130, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-16 04:00:54', '2021-10-16 04:00:54', NULL, NULL),
(12, 1, 6, 7, 1, 15, 1.26531500, 'CAD', 'BDT', 0.37000000, 0.00000000, 0.70000000, 25.00000000, 67.17694803, NULL, NULL, NULL, 16344513815712, 2, 1, '2021-10-17 07:24:05', NULL, NULL, 'hi', 'Friends', NULL, 0, NULL, NULL, NULL, 'ronniearea@gmail.com', NULL, '01825683631', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-17 00:16:21', '2021-10-17 04:44:53', NULL, NULL),
(13, 2, 7, 2, 1, 2, 85.00000000, 'BDT', 'XAF', 200.00000000, 0.00000000, 4000.00000000, 784.25000000, 6.53540860, NULL, NULL, NULL, 16344549439652, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-17 01:15:43', '2021-10-17 01:15:43', NULL, NULL),
(14, 4, 7, 1, 1, 8, 85.00000000, 'BDT', 'NGN', 120.00000000, 0.00000000, 120.00000000, 580.05000000, 4.83376602, NULL, NULL, NULL, 16344736981817, 2, 0, NULL, NULL, NULL, 'Business', 'Family Support', NULL, 0, 'Jybayer Islam', NULL, NULL, 'aa@gmail.com', NULL, '+9342345', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-17 06:28:18', '2022-09-22 01:00:49', NULL, NULL),
(15, 1, 7, 7, 1, 15, 85.00000000, 'BDT', 'BDT', 100.00000000, 0.00000000, 100.00000000, 100.00000000, 1.00000000, NULL, NULL, NULL, 16344747869032, 2, 1, '2021-10-17 12:48:01', NULL, NULL, 'hi', 'Friends', NULL, 0, NULL, NULL, NULL, 'ronniearea@gmail.com', NULL, '01825683631', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-17 06:46:26', '2021-10-17 06:48:01', NULL, NULL),
(16, 2, 7, 7, 1, 14, 85.00000000, 'BDT', 'BDT', 120.00000000, 0.00000000, 120.00000000, 120.00000000, 1.00000000, NULL, NULL, NULL, 16344804764282, 2, 1, '2021-10-17 14:31:39', NULL, NULL, 'hi', 'Friends', NULL, 0, NULL, NULL, NULL, 'alex@sender.com', NULL, '01825683631', NULL, NULL, NULL, NULL, NULL, 0, 'Alex TOme', NULL, '0541654646', 'alex@sender.com', 'asdasdasd', 'asdas', 'as65465465', '544', 'Bangladesh', '{\"identityProof\":{\"field_name\":\"616c33cae78411634481098.png\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/17\",\"type\":\"file\"}}', 'Driving License', '{\"addressProof\":{\"field_name\":\"616c33cb466741634481099.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2021\\/10\\/17\",\"type\":\"file\"}}', NULL, 0.00000000, 0.00000000, 0.00000000, 'fund', NULL, NULL, '2021-10-17 08:21:16', '2021-10-17 08:31:39', NULL, NULL),
(17, 1, 4, 7, 1, 17, 0.84649500, 'EUR', 'BDT', 50.00000000, 0.00000000, 50.00000000, 5020.70000000, 100.41406033, NULL, NULL, NULL, 16346229009836, 2, 1, '2021-10-19 05:57:14', NULL, NULL, 'hi', 'Friends', NULL, 0, 'James Watt', NULL, NULL, 'ddd@ddd.com', NULL, '+15678954323', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-19 03:55:00', '2021-10-19 03:57:14', NULL, NULL),
(18, 2, 7, 2, 1, 2, 85.00000000, 'BDT', 'XAF', 5000.00000000, 0.00000000, 5000.00000000, 32677.04000000, 6.53540860, NULL, NULL, NULL, 16346263432273, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-19 04:52:23', '2021-10-19 04:52:23', NULL, NULL),
(19, 1, 4, 1, 3, 1, 0.84649500, 'EUR', 'NGN', 100.00000000, 0.00000000, 100.00000000, 48537.81000000, 485.37807311, NULL, NULL, NULL, 16346624796895, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-19 14:54:39', '2021-10-19 14:54:39', NULL, NULL),
(20, 1, 4, 1, 3, 1, 0.84649500, 'EUR', 'NGN', 60.00000000, 0.00000000, 60.00000000, 29122.68000000, 485.37807311, NULL, NULL, NULL, 16347345868636, 2, 1, '2021-10-20 12:57:47', NULL, NULL, 'Salary', 'Family Support', '{\"BankAccountName\":{\"field_name\":\"Keke keke\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"24567889\",\"type\":\"text\"}}', 0, 'James Watt', NULL, NULL, 'ddd@ddd.com', NULL, '+15678954323', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-20 10:56:26', '2021-10-20 10:57:47', NULL, NULL),
(21, 1, 5, 2, 1, 3, 0.72245500, 'GBP', 'XAF', 50.00000000, 0.00000000, 50.00000000, 38445.97000000, 768.91949118, NULL, NULL, NULL, 16347348807450, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'James Watt', NULL, NULL, 'ddd@ddd.com', NULL, '+15678954323', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-20 11:01:20', '2021-10-20 11:01:43', NULL, NULL),
(22, 1, 5, 1, 1, 9, 0.72245500, 'GBP', 'NGN', 20.00000000, 0.00000000, 20.00000000, 11374.28000000, 568.71377733, NULL, NULL, NULL, 16347350088348, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-20 11:03:28', '2021-10-20 11:03:28', NULL, NULL),
(23, 3, 4, 1, 3, 1, 0.84649500, 'EUR', 'NGN', 100.00000000, 0.00000000, 100.00000000, 48537.81000000, 485.37807311, NULL, NULL, NULL, 16347565839410, 2, 1, '2021-10-20 19:04:00', NULL, NULL, 'Salary', 'Friends', '{\"BankAccountName\":{\"field_name\":\"Keke keke\",\"type\":\"text\"},\"AccountNumber\":{\"field_name\":\"24567889\",\"type\":\"text\"}}', 0, 'James Watt', NULL, NULL, 'ddd@ddd.com', NULL, '+15678954323', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@detracash.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-10-20 17:03:03', '2021-10-20 17:04:00', NULL, NULL),
(24, 1, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16348439156079, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-10-21 17:18:35', '2021-10-21 17:18:35', NULL, NULL),
(25, 1, 8, 2, 1, 3, 1.00000000, 'EUR', 'XAF', 1.00000000, 0.00000000, 1.00000000, 656.00000000, 656.00000000, NULL, NULL, NULL, 16357575213728, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Susan', NULL, NULL, 'ddd@ddd.com', NULL, '+237677212324', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-11-01 08:05:21', '2021-11-01 08:10:59', NULL, NULL),
(26, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16364050188901, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-08 19:56:58', '2021-11-08 19:56:58', NULL, NULL),
(27, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16364656763809, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-09 12:47:56', '2021-11-09 12:47:56', NULL, NULL),
(28, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16370754422230, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-16 14:10:42', '2021-11-16 14:10:42', NULL, NULL),
(29, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16370822715048, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-16 16:04:31', '2021-11-16 16:04:31', NULL, NULL),
(30, 1, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 200.00000000, 0.00000000, 200.00000000, 89598.78000000, 447.99389085, NULL, NULL, NULL, 16371828587281, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-17 20:00:58', '2021-11-17 20:00:58', NULL, NULL),
(31, 1, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16374337167939, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-20 17:41:56', '2021-11-20 17:41:56', NULL, NULL),
(32, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 333.00000000, 0.00000000, 333.00000000, 149181.97000000, 447.99389085, NULL, NULL, NULL, 16374788731931, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-21 06:14:33', '2021-11-21 06:14:33', NULL, NULL),
(33, 1, 8, 2, 1, 3, 0.86417965, 'EUR', 'XAF', 200.00000000, 0.00000000, 200.00000000, 131188.78000000, 655.94392323, NULL, NULL, NULL, 16374985422452, 2, 1, '2021-11-21 12:44:30', NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Cisse', NULL, NULL, 'ddd@ddd.com', NULL, '+237677212324', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-11-21 11:42:22', '2021-11-21 11:44:30', NULL, NULL),
(34, 1, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 78.00000000, 0.00000000, 78.00000000, 34943.52000000, 447.99389085, NULL, NULL, NULL, 16378628307257, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-25 16:53:50', '2021-11-25 16:53:50', NULL, NULL),
(35, 1, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 600000.00000000, 0.00000000, 600000.00000000, 268796334.51000000, 447.99389085, NULL, NULL, NULL, 16381318107847, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-28 19:36:50', '2021-11-28 19:36:50', NULL, NULL),
(36, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 6000.00000000, 0.00000000, 6000.00000000, 2687963.35000000, 447.99389085, NULL, NULL, NULL, 16381319665892, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-11-28 19:39:26', '2021-11-28 19:39:26', NULL, NULL),
(37, 1, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 111.00000000, 0.00000000, 111.00000000, 49727.32000000, 447.99389085, NULL, NULL, NULL, 16389419144658, 2, 1, '2021-12-08 05:40:10', NULL, NULL, 'Salary', 'Friends', NULL, 0, 'James Watt', NULL, NULL, 'ateh@tiwazon.com', NULL, '+355333444', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-12-08 04:38:34', '2021-12-08 04:40:10', NULL, NULL),
(38, 1, 6, 1, 3, 130, 1.26531500, 'CAD', 'NGN', 50.00000000, 0.00000000, 50.00000000, 16235.88000000, 324.71764896, NULL, NULL, NULL, 16394580219194, 2, 1, '2021-12-14 05:37:10', NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000040\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Alexis Sanchez\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'ronniearea@gmail.com', NULL, '+9715646463464', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-12-13 23:00:21', '2021-12-13 23:37:54', 'success', 'Transfer Queued Successfully'),
(39, 1, 6, 1, 3, 1, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16394669853865, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 06:29:45', '2021-12-14 06:29:45', NULL, NULL),
(40, 1, 6, 1, 3, 136, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16394738213963, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 08:23:41', '2021-12-14 08:23:41', NULL, NULL),
(41, 1, 6, 1, 3, 130, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16394741781543, 2, 1, '2021-12-14 09:32:37', NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000034\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Ade Bond\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'nana@nna.com', NULL, '+23434567', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-12-14 08:29:38', '2021-12-14 08:32:37', NULL, NULL),
(42, 1, 6, 2, 3, 192, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16394758786330, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 08:57:58', '2021-12-14 08:57:58', NULL, NULL),
(43, 1, 6, 9, 3, 212, 1.26531500, 'CAD', 'GHS', 100.00000000, 0.00000000, 100.00000000, 483.08000000, 4.83077329, NULL, NULL, NULL, 16395160537163, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 20:07:33', '2021-12-14 20:07:33', NULL, NULL),
(44, 1, 8, 9, 3, 214, 0.86417965, 'EUR', 'GHS', 200.00000000, 0.00000000, 200.00000000, 1414.62000000, 7.07312409, NULL, NULL, NULL, 16395162299428, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 20:10:29', '2021-12-14 20:10:29', NULL, NULL),
(45, 1, 6, 2, 3, 192, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16395168919095, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 20:21:31', '2021-12-14 20:21:31', NULL, NULL),
(46, 1, 6, 2, 3, 192, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16395183176759, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 20:45:17', '2021-12-14 20:45:17', NULL, NULL),
(47, 1, 6, 2, 3, 196, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16395191708166, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-14 20:59:30', '2021-12-14 20:59:30', NULL, NULL),
(49, 1, 6, 2, 1, 2, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16408824434838, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'James Watt', NULL, NULL, 'ddd@ddd.com', NULL, '+237677212324', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2021-12-30 15:40:43', '2021-12-30 15:43:25', NULL, NULL),
(51, 1, 6, 2, 3, 193, 1.26531500, 'CAD', 'XAF', 10.00000000, 0.00000000, 10.00000000, 4479.94000000, 447.99389085, NULL, NULL, NULL, 16408845308773, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2021-12-30 16:15:30', '2021-12-30 16:15:30', NULL, NULL),
(52, 1, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16463010376623, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-03 08:50:37', '2022-03-03 08:50:37', NULL, NULL),
(53, 1, 6, 2, 3, 192, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16463010881074, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-03 08:51:28', '2022-03-03 08:51:28', NULL, NULL),
(54, 1, 8, 2, 1, 3, 0.86417965, 'EUR', 'XAF', 20.00000000, 0.00000000, 20.00000000, 13118.88000000, 655.94392323, NULL, NULL, NULL, 16463387983439, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2333353535353', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-03 19:19:58', '2022-03-03 19:20:51', NULL, NULL),
(56, 1, 6, 1, 1, 9, 1.26531500, 'CAD', 'NGN', 200.00000000, 0.00000000, 200.00000000, 64943.53000000, 324.71764896, NULL, NULL, NULL, 16463394226749, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+23467789987', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-03 19:30:22', '2022-03-03 19:31:11', NULL, NULL),
(57, 1, 8, 9, 1, 208, 0.86417965, 'EUR', 'GHS', 350.00000000, 0.00000000, 350.00000000, 2475.59000000, 7.07312409, NULL, NULL, NULL, 16463396595164, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2333353535353', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-03 19:34:19', '2022-03-03 19:34:45', NULL, NULL),
(58, 1, 3, 2, 1, 2, 1.00000000, 'USD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 56685.34000000, 566.85339000, NULL, NULL, NULL, 16463398071698, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'nana mian', NULL, NULL, 'nana@nna.com', NULL, '+2376667778', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-03 19:36:47', '2022-03-03 19:37:18', NULL, NULL),
(59, 1, 8, 1, 3, 1, 0.86417965, 'EUR', 'NGN', 100.00000000, 0.00000000, 100.00000000, 47544.53000000, 475.44525262, NULL, NULL, NULL, 16463399567819, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-03 19:39:16', '2022-03-03 19:39:16', NULL, NULL),
(60, 3, 6, 2, 1, 3, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16468163976492, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'James Watt', NULL, NULL, 'ddd@ddd.com', NULL, '+353567890', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-09 07:59:57', '2022-03-09 08:01:30', NULL, NULL),
(61, 1, 8, 2, 4, 318, 0.86417965, 'EUR', 'XAF', 10.00000000, 0.00000000, 10.00000000, 6559.44000000, 655.94392323, NULL, NULL, NULL, 16470994054440, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 14:36:45', '2022-03-12 14:37:52', NULL, NULL),
(62, 1, 6, 2, 4, 318, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16470999375480, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'nana mian', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 14:45:37', '2022-03-12 14:45:58', NULL, NULL),
(63, 1, 6, 1, 4, 316, 1.26531500, 'CAD', 'NGN', 100.00000000, 0.00000000, 100.00000000, 32471.76000000, 324.71764896, NULL, NULL, NULL, 16471001712854, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+227897654', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 14:49:31', '2022-03-12 14:49:57', NULL, NULL),
(64, 1, 6, 2, 4, 318, 1.26531500, 'CAD', 'XAF', 10.00000000, 0.00000000, 10.00000000, 4479.94000000, 447.99389085, NULL, NULL, NULL, 16471011304598, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+237', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 15:05:30', '2022-03-12 15:05:50', NULL, NULL),
(65, 1, 6, 2, 4, 318, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16471013484337, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'nana mian', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 15:09:08', '2022-03-12 15:09:42', NULL, NULL),
(66, 1, 6, 2, 4, 318, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 44799.39000000, 447.99389085, NULL, NULL, NULL, 16471028859750, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 15:34:45', '2022-03-12 15:35:04', NULL, NULL),
(69, 3, 6, 2, 4, 318, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 47510.26000000, 475.10260291, NULL, NULL, NULL, 16471069235160, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-12 16:42:03', '2022-03-12 16:42:17', NULL, NULL),
(70, 3, 6, 2, 4, 318, 1.26531500, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 47510.26000000, 475.10260291, 1, 'Transfer rejected', NULL, 16471516055666, 3, 2, '2022-10-23 08:43:11', NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 05:06:45', '2022-10-23 06:43:11', NULL, NULL),
(71, 3, 8, 1, 4, 316, 0.91645400, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4483.26000000, 448.32595198, NULL, NULL, NULL, 16471550136492, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+227897654', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 06:03:33', '2022-03-13 06:03:49', NULL, NULL),
(72, 3, 6, 2, 4, 319, 1.27609000, 'CAD', 'XAF', 100.00000000, 0.00000000, 100.00000000, 47109.09000000, 471.09094970, NULL, NULL, NULL, 16471596853089, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 07:21:25', '2022-03-13 07:21:59', NULL, NULL),
(73, 3, 8, 2, 4, 318, 0.91645400, 'EUR', 'XAF', 100.00000000, 0.00000000, 100.00000000, 65595.70000000, 655.95703658, NULL, NULL, NULL, 16471611891420, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'ABC', NULL, NULL, 'nwabohasene2014@gmail.com', NULL, '+237', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 07:46:29', '2022-03-13 07:48:22', NULL, NULL),
(74, 3, 8, 2, 4, 318, 0.91645400, 'EUR', 'XAF', 100.00000000, 0.00000000, 100.00000000, 65595.70000000, 655.95703658, NULL, NULL, NULL, 16471618496570, 2, 1, '2022-03-13 09:04:33', NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Stanwa Ase', NULL, NULL, 'nwabohasene2014@gmail.com', NULL, '+237677212324', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 07:57:29', '2022-03-13 08:04:33', NULL, NULL),
(75, 3, 8, 2, 4, 318, 0.91645400, 'EUR', 'XAF', 100.00000000, 0.00000000, 100.00000000, 65595.70000000, 655.95703658, NULL, NULL, NULL, 16471638335173, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'ABC', NULL, NULL, 'nwabohasene2014@gmail.com', NULL, '+237', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 08:30:33', '2022-03-13 08:31:18', NULL, NULL),
(76, 3, 4, 2, 3, 193, 0.91645400, 'EUR', 'XAF', 100.00000000, 0.00000000, 100.00000000, 65595.70000000, 655.95703658, NULL, NULL, NULL, 16471648374906, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-13 08:47:17', '2022-03-13 08:47:17', NULL, NULL),
(77, 3, 6, 2, 3, 193, 1.27609000, 'CAD', 'XAF', 10.00000000, 0.00000000, 10.00000000, 4710.91000000, 471.09094970, NULL, NULL, NULL, 16471648425016, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"sss\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'nana@nna.com', NULL, '+880', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 08:47:22', '2022-03-13 09:04:55', NULL, NULL),
(78, 3, 8, 1, 3, 130, 0.91645400, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4483.26000000, 448.32595198, 1, 'Your transaction is now completed', NULL, 16471764266626, 1, 1, '2022-03-13 13:08:09', NULL, NULL, 'Salary', 'Family Support', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'nana@nna.com', NULL, '+234', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', '2022-03-23 17:35:51', NULL, '2022-03-13 12:00:26', '2022-03-23 16:35:51', NULL, NULL),
(79, 3, 6, 2, 1, 3, 1.27609000, 'CAD', 'XAF', 97.09000000, 2.91000000, 100.00000000, 45738.22000000, 471.09094970, NULL, NULL, NULL, 16472036281538, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-13 19:33:48', '2022-03-13 19:34:13', NULL, NULL),
(80, 3, 6, 2, 4, 318, 1.27609000, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47109.09000000, 471.09094970, NULL, NULL, NULL, 16473503192042, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-15 12:18:39', '2022-03-15 12:22:21', NULL, NULL),
(81, 3, 6, 2, 1, 2, 1.27609000, 'CAD', 'XAF', 100.00000000, 3.00000000, 103.00000000, 47109.09000000, 471.09094970, NULL, NULL, NULL, 16473522199006, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-15 12:50:19', '2022-03-15 12:50:19', NULL, NULL),
(82, 3, 6, 2, 1, 2, 1.27609000, 'CAD', 'XAF', 100.00000000, 3.00000000, 103.00000000, 47109.09000000, 471.09094970, NULL, NULL, NULL, 16473524586526, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-15 12:54:18', '2022-03-15 12:56:01', NULL, NULL),
(83, 3, 6, 2, 1, 2, 1.27609000, 'CAD', 'XAF', 100.00000000, 3.00000000, 103.00000000, 47109.09000000, 471.09094970, NULL, NULL, NULL, 16473550204263, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-15 13:37:00', '2022-03-15 13:37:26', NULL, NULL),
(84, 3, 6, 2, 1, 3, 1.27609000, 'CAD', 'XAF', 10.00000000, 0.30000000, 10.30000000, 4710.91000000, 471.09094970, NULL, NULL, NULL, 16478530648564, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-21 07:57:44', '2022-03-21 07:57:44', NULL, NULL),
(85, 3, 6, 2, 4, 318, 1.27609000, 'CAD', 'XAF', 50.00000000, 1.00000000, 51.00000000, 23554.55000000, 471.09094970, NULL, NULL, NULL, 16478563846645, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-21 08:53:04', '2022-03-21 08:53:04', NULL, NULL),
(86, 3, 6, 2, 4, 319, 1.27609000, 'CAD', 'XAF', 50.00000000, 1.00000000, 51.00000000, 23554.55000000, 471.09094970, NULL, NULL, NULL, 16478564619621, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-21 08:54:21', '2022-03-21 08:54:21', NULL, NULL),
(87, 3, 8, 2, 4, 319, 0.91645400, 'EUR', 'XAF', 50.00000000, 1.00000000, 51.00000000, 32797.85000000, 655.95703658, NULL, NULL, NULL, 16478565815891, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-21 08:56:21', '2022-03-21 08:56:56', NULL, NULL),
(88, 3, 6, 2, 1, 2, 1.27609000, 'CAD', 'XAF', 10.00000000, 0.30000000, 10.30000000, 4710.91000000, 471.09094970, NULL, NULL, NULL, 16478611782687, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-21 10:12:58', '2022-03-21 10:12:58', NULL, NULL),
(89, 3, 8, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16478907628082, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-21 18:26:02', '2022-03-21 18:26:51', NULL, NULL),
(90, 3, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 0.32000000, 0.01000000, 0.33000000, 150.00000000, 472.71608843, NULL, NULL, NULL, 16480793371538, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-03-23 22:48:57', '2022-03-23 22:48:57', NULL, NULL),
(91, 3, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 150.00000000, 4.50000000, 154.50000000, 70907.41000000, 472.71608843, NULL, NULL, NULL, 16480832791440, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Tester', NULL, NULL, 'tester@gmail.com', NULL, '+8801999999999', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-03-23 23:54:39', '2022-03-23 23:55:16', NULL, NULL),
(92, 3, 6, 2, 3, 194, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16489873779552, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-04-03 10:02:57', '2022-04-03 10:02:57', NULL, NULL),
(93, 3, 6, 2, 3, 194, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16489876805837, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-04-03 10:08:00', '2022-04-03 10:08:00', NULL, NULL),
(94, 3, 8, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16492228063222, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-04-06 03:26:46', '2022-04-06 03:27:47', NULL, NULL);
INSERT INTO `send_money` (`id`, `user_id`, `send_currency_id`, `receive_currency_id`, `service_id`, `country_service_id`, `send_curr_rate`, `send_curr`, `receive_curr`, `send_amount`, `fees`, `payable_amount`, `recipient_get_amount`, `rate`, `admin_id`, `admin_reply`, `serviceinfo`, `invoice`, `status`, `payment_status`, `paid_at`, `promo_code`, `discount`, `fund_source`, `purpose`, `user_information`, `recipient_id`, `recipient_name`, `first_name`, `last_name`, `recipient_email`, `recipient_country_code`, `recipient_contact_no`, `recipient_address`, `recipient_city`, `recipient_pcode`, `recipient_state`, `recipient_country`, `is_future_trx`, `sender_name`, `sender_country_code`, `sender_phone`, `sender_email`, `sender_address`, `sender_city`, `sender_post_code`, `sender_state`, `sender_country`, `sender_identity_verification`, `sender_identity_type`, `sender_address_verification`, `merchant_id`, `merchant_commission`, `merchant_profit`, `admin_commission`, `payment_type`, `received_at`, `deleted_at`, `created_at`, `updated_at`, `flutter_status`, `flutter_response`) VALUES
(95, 3, 8, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16493444668682, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Austin Nana', NULL, NULL, 'nana@nana.com', NULL, '+376675432000', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-04-07 13:14:26', '2022-04-07 13:15:54', NULL, NULL),
(100, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.30000000, 10.30000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16614476204997, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-08-25 15:13:40', '2022-08-25 15:13:40', NULL, NULL),
(101, 1, 6, 2, 3, 193, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16614477856803, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-08-25 15:16:25', '2022-08-25 15:16:25', NULL, NULL),
(102, 1, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16614582336708, 2, 0, NULL, 532170, 0.51, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-08-25 18:10:33', '2022-08-25 18:11:06', NULL, NULL),
(103, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 100.00000000, 3.00000000, 103.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16614584221423, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Joe five five', NULL, NULL, 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-08-25 18:13:42', '2022-08-25 18:14:17', NULL, NULL),
(104, 1, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 90.00000000, 1.80000000, 91.80000000, 42544.45000000, 472.71608843, NULL, NULL, NULL, 16633956008664, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-17 04:20:00', '2022-09-17 04:20:00', NULL, NULL),
(105, 1, 6, 2, 3, 202, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16635021963286, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-18 09:56:36', '2022-09-18 09:56:36', NULL, NULL),
(106, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 100.00000000, 3.00000000, 103.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16635024204701, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-18 10:00:20', '2022-09-18 10:00:20', NULL, NULL),
(107, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 100.00000000, 3.00000000, 103.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16635024804280, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-18 10:01:20', '2022-09-18 10:01:20', NULL, NULL),
(108, 1, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16638433997047, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-22 08:43:19', '2022-09-22 08:43:19', NULL, NULL),
(109, 1, 6, 2, 3, 193, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16638435822797, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-22 08:46:22', '2022-09-22 08:46:22', NULL, NULL),
(110, 1, 6, 2, 3, 195, 1.25931430, 'CAD', 'XAF', 106.00000000, 2.12000000, 108.12000000, 50107.91000000, 472.71608843, NULL, NULL, NULL, 16638443806456, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-22 08:59:40', '2022-09-22 08:59:40', NULL, NULL),
(111, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 106.00000000, 3.18000000, 109.18000000, 50107.91000000, 472.71608843, NULL, NULL, NULL, 16638444554795, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'demouser@gmail.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-22 09:00:55', '2022-09-22 09:00:55', NULL, NULL),
(112, 1, 6, 10, 1, 290, 1.25931430, 'CAD', 'EUR', 100.00000000, 0.00000000, 100.00000000, 72.06000000, 0.72056505, NULL, NULL, NULL, 16638732754757, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-09-22 17:01:15', '2022-09-22 17:01:15', NULL, NULL),
(113, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16646205285664, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-01 08:35:28', '2022-10-01 08:35:28', NULL, NULL),
(114, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 100.00000000, 1.80000000, 101.80000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16646221584735, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-01 09:02:38', '2022-10-01 09:02:38', NULL, NULL),
(115, 1, 6, 2, 1, 3, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16646224686707, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-01 09:07:48', '2022-10-01 09:07:48', NULL, NULL),
(116, 1, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16646225065025, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-01 09:08:26', '2022-10-01 09:08:26', NULL, NULL),
(117, 1, 8, 2, 1, 2, 0.90741787, 'EUR', 'XAF', 200.00000000, 1.70000000, 201.70000000, 131207.05000000, 656.03527292, NULL, NULL, NULL, 16646241429935, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"TownCity\":{\"field_name\":\"Neuss\",\"type\":\"text\"},\"State\":{\"field_name\":\"\",\"type\":\"text\"},\"PostCode\":{\"field_name\":\"41411\",\"type\":\"text\"},\"Country\":{\"field_name\":\"Germany\",\"type\":\"text\"}}', 0, NULL, NULL, NULL, 'nana@nna.com', NULL, '+49675432', NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '016261713435', 'nana@nna.com', 'caral 35', 'Korschenbroich', '41352', '', 'Germany', '{\"identityProof\":{\"field_name\":\"6338290077c581664624896.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2022\\/10\\/01\",\"type\":\"file\"}}', 'Passport', '{\"addressProof\":{\"field_name\":\"63382900816b61664624896.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2022\\/10\\/01\",\"type\":\"file\"}}', NULL, 0.03746896, 0.00000000, 1.83597883, 'online', NULL, NULL, '2022-10-01 09:35:42', '2022-10-01 09:48:16', NULL, NULL),
(120, 1, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 1000.00000000, 20.00000000, 1020.00000000, 472716.09000000, 472.71608843, NULL, NULL, NULL, 16671558372260, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Austin Nana', 'Austin', 'Nana', 'nana@nna.com', NULL, '+2374567898', NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-10-30 17:50:37', '2022-10-30 17:52:48', NULL, NULL),
(121, 1, 8, 2, 1, 2, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.18000000, 10.18000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16671647646305, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-30 20:19:24', '2022-10-30 20:19:24', NULL, NULL),
(122, 1, 6, 2, 3, 192, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16671651888315, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-30 20:26:28', '2022-10-30 20:26:28', NULL, NULL),
(123, 1, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16671652978997, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'demo User', NULL, '018256830000', 'augustine@unavisions.com', '24/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-10-30 20:28:17', '2022-10-30 20:28:17', NULL, NULL),
(124, 3, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16673366094480, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-01 20:03:29', '2022-11-01 20:03:29', NULL, NULL),
(125, 3, 8, 9, 1, 207, 0.90741787, 'EUR', 'GHS', 10.00000000, 0.00000000, 10.00000000, 80.37000000, 8.03693286, NULL, NULL, NULL, 16673368234791, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-01 20:07:03', '2022-11-01 20:07:03', NULL, NULL),
(126, 3, 6, 2, 3, 192, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16673383519569, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-01 20:32:31', '2022-11-01 20:32:31', NULL, NULL),
(127, 3, 6, 9, 3, 212, 1.25931430, 'CAD', 'GHS', 10.00000000, 0.00000000, 10.00000000, 57.91000000, 5.79113292, NULL, NULL, NULL, 16673384351535, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-01 20:33:55', '2022-11-01 20:33:55', NULL, NULL),
(128, 3, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16673737654082, 2, 1, '2022-11-02 07:24:44', NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Austin Nana', 'Austin', 'Nana', 'nana@nna.com', NULL, '+376234567', NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-11-02 06:22:45', '2022-11-02 06:24:44', NULL, NULL),
(129, 3, 6, 9, 3, 213, 1.25931430, 'CAD', 'GHS', 10.00000000, 0.00000000, 10.00000000, 57.91000000, 5.79113292, NULL, NULL, NULL, 16673744345570, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-02 06:33:54', '2022-11-02 06:33:54', NULL, NULL),
(130, 5, 6, 1, 2, 470, 1.25931430, 'CAD', 'NGN', 10.00000000, 0.00000000, 10.00000000, 3302.54000000, 330.25413116, NULL, NULL, NULL, 16674590952734, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-03 06:04:55', '2022-11-03 06:04:55', NULL, NULL),
(131, 3, 6, 2, 3, 206, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16674827763024, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-03 12:39:36', '2022-11-03 12:39:36', NULL, NULL),
(132, 3, 6, 1, 2, 470, 1.25931430, 'CAD', 'NGN', 10.00000000, 0.00000000, 10.00000000, 3302.54000000, 330.25413116, NULL, NULL, NULL, 16674828212518, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-03 12:40:21', '2022-11-03 12:40:21', NULL, NULL),
(133, 3, 6, 1, 2, 470, 1.25931430, 'CAD', 'NGN', 10.00000000, 0.00000000, 10.00000000, 3302.54000000, 330.25413116, NULL, NULL, NULL, 16674828608814, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-03 12:41:00', '2022-11-03 12:41:00', NULL, NULL),
(134, 5, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16674996653672, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-03 17:21:05', '2022-11-03 17:21:05', NULL, NULL),
(135, 5, 8, 2, 3, 192, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16676724115455, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-05 17:20:11', '2022-11-05 17:20:11', NULL, NULL),
(136, 5, 8, 9, 3, 212, 0.90741787, 'EUR', 'GHS', 10.00000000, 0.00000000, 10.00000000, 80.37000000, 8.03693286, NULL, NULL, NULL, 16676728406690, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-05 17:27:20', '2022-11-05 17:27:20', NULL, NULL),
(137, 5, 8, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16676734542611, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-05 17:37:34', '2022-11-05 17:37:34', NULL, NULL),
(138, 5, 8, 13, 3, 466, 0.90741787, 'EUR', 'USD', 10.00000000, 0.00000000, 10.00000000, 11.02000000, 1.10202811, NULL, NULL, NULL, 16676737452535, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-05 17:42:25', '2022-11-05 17:42:25', NULL, NULL),
(139, 5, 8, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16676752732843, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-05 18:07:53', '2022-11-05 18:07:53', NULL, NULL),
(140, 5, 8, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 100.00000000, 1.54000000, 101.54000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16676753842873, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-11-05 18:09:44', '2022-11-05 18:09:44', NULL, NULL),
(142, 1, 3, 2, 3, 194, 1.00000000, 'USD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 59529.81000000, 595.29813000, NULL, NULL, NULL, 16711156048338, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-15 13:46:44', '2022-12-15 13:46:44', NULL, NULL),
(143, 1, 3, 2, 4, 318, 1.00000000, 'USD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 59529.81000000, 595.29813000, NULL, NULL, NULL, 16711159539353, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-15 13:52:33', '2022-12-15 13:52:33', NULL, NULL),
(144, 2, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.18000000, 10.18000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16714432768528, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-19 08:47:56', '2022-12-19 08:47:56', NULL, NULL),
(145, 5, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16714678119450, 2, 1, '2022-12-19 16:42:21', NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Austin Nana', 'Austin', 'Nana', 'nana@nna.com', NULL, '+237', NULL, NULL, NULL, NULL, NULL, 0, 'Estelle Nwaboh', NULL, '01626171', 'estelle.nwaboh@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-19 15:36:51', '2022-12-19 15:42:21', NULL, NULL),
(146, 6, 8, 2, 3, 192, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16714742255415, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-19 17:23:45', '2022-12-19 17:23:45', NULL, NULL),
(147, 6, 8, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16714745331857, 2, 1, '2022-12-19 18:31:42', NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Austin Nana', 'Austin', 'Nana', 'nana@nna.com', NULL, '77292456', NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-19 17:28:53', '2022-12-19 17:31:42', NULL, NULL),
(148, 2, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16714770347571, 1, 1, '2022-12-19 19:14:11', NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Joe Rampa', 'Joe', 'Rampa', 'joe445@hotmail.com', NULL, '6789654', NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.00000000, 0.03176332, 1.55640256, 'online', '2022-12-19 19:20:03', NULL, '2022-12-19 18:10:34', '2022-12-19 18:20:03', NULL, NULL),
(149, 1, 8, 2, 3, 198, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16714777879743, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-19 18:23:07', '2022-12-19 18:23:07', NULL, NULL),
(150, 1, 8, 13, 3, 412, 0.90741787, 'EUR', 'USD', 100.00000000, 0.00000000, 100.00000000, 110.20000000, 1.10202811, NULL, NULL, NULL, 16714779098480, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-19 18:25:09', '2022-12-19 18:25:09', NULL, NULL),
(151, 6, 8, 2, 3, 193, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16714784895283, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-19 18:34:49', '2022-12-19 18:34:49', NULL, NULL),
(152, 1, 8, 8, 1, 110, 0.90741787, 'EUR', 'EUR', 10.00000000, 1.00000000, 11.00000000, 10.00000000, 1.00000000, NULL, NULL, NULL, 16715373163872, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-20 10:55:16', '2022-12-20 10:55:16', NULL, NULL),
(153, 2, 6, 2, 1, 2, 1.25931430, 'CAD', 'XAF', 20.00000000, 0.36000000, 20.36000000, 9454.32000000, 472.71608843, NULL, NULL, NULL, 16715409029684, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-20 11:55:02', '2022-12-20 11:55:02', NULL, NULL),
(154, 2, 6, 14, 3, 477, 1.25931430, 'CAD', 'ZMK', 10.00000000, 0.00000000, 10.00000000, 127.05000000, 12.70532702, NULL, NULL, NULL, 16716050795970, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 05:44:39', '2022-12-21 05:44:39', NULL, NULL),
(155, 2, 6, 12, 3, 369, 1.25931430, 'CAD', 'KES', 10.00000000, 0.00000000, 10.00000000, 908.90000000, 90.88984378, NULL, NULL, NULL, 16716054631291, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 05:51:03', '2022-12-21 05:51:03', NULL, NULL),
(156, 2, 6, 12, 1, 365, 1.25931430, 'CAD', 'KES', 20.00000000, 0.00000000, 20.00000000, 1817.80000000, 90.88984378, NULL, NULL, NULL, 16716405264963, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Ali Khan', 'Ali', 'Khan', 'alikhan@gmail.com', NULL, '+923133255662', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-21 15:35:26', '2022-12-21 15:35:57', NULL, NULL),
(157, 2, 6, 12, 1, 365, 1.25931430, 'CAD', 'KES', 30.00000000, 0.00000000, 30.00000000, 2726.70000000, 90.88984378, NULL, NULL, NULL, 16716405869712, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ahsan ali', 'Ahsan', 'ali', 'ahsankk126@gmail.com', NULL, '+923133255662', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 15:36:26', '2022-12-21 15:36:26', NULL, NULL),
(158, 2, 6, 12, 2, 402, 1.25931430, 'CAD', 'KES', 20.00000000, 0.00000000, 20.00000000, 1817.80000000, 90.88984378, NULL, NULL, NULL, 16716406375964, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ahsan ali', 'Ahsan', 'ali', 'ahsankk126@gmail.com', NULL, '+923133255662', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 15:37:17', '2022-12-21 15:37:17', NULL, NULL),
(159, 2, 6, 12, 1, 365, 1.25931430, 'CAD', 'KES', 40.00000000, 0.00000000, 40.00000000, 3635.59000000, 90.88984378, NULL, NULL, NULL, 16716406705654, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Khan Ali', 'Khan', 'Ali', 'khanali@gmail.com', NULL, '201555103', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-21 15:37:50', '2022-12-21 15:38:16', NULL, NULL),
(160, 3, 6, 6, 1, 323, 1.25931430, 'CAD', 'CAD', 100.00000000, 0.00000000, 100.00000000, 100.00000000, 1.00000000, NULL, NULL, NULL, 16716459269788, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'George Asana', 'George', 'Asana', 'asana@yahoo.com', NULL, '+3234782097', 'caral 35', 'Brussels', '65423', 'BE', 'Belgium', 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 17:05:26', '2022-12-21 17:05:26', NULL, NULL),
(161, 3, 4, 2, 3, 193, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16716463808517, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 17:13:00', '2022-12-21 17:13:00', NULL, NULL),
(162, 3, 4, 2, 2, 192, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.00000000, 10.00000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16716464491504, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 17:14:09', '2022-12-21 17:14:09', NULL, NULL),
(163, 6, 8, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 100.00000000, 1.54000000, 101.54000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16716485163110, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-21 17:48:36', '2022-12-21 17:48:36', NULL, NULL),
(164, 6, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16716506816746, 2, 1, '2022-12-21 19:35:11', NULL, NULL, 'Business', 'Family Support', NULL, 0, 'Asana Lomata', 'Asana', 'Lomata', 'asana@detra.com', NULL, '+23778645329', 'mile 6', 'mankon', '', 'Mezam', 'Cameroon', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-21 18:24:41', '2022-12-21 18:35:11', NULL, NULL),
(165, 1, 6, 6, 1, 320, 1.25931430, 'CAD', 'CAD', 20.00000000, 0.00000000, 20.00000000, 20.00000000, 1.00000000, NULL, NULL, NULL, 16716870453047, 2, 1, '2022-12-22 05:32:26', NULL, NULL, 'Salary', 'Family Support', NULL, 0, NULL, NULL, NULL, 'alikhan@gmail.com', NULL, '20152433622', NULL, NULL, NULL, NULL, NULL, 0, 'Ahsan ali', NULL, '03133255662', 'ahsankk126@gmail.com', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', '{\"identityProof\":{\"field_name\":\"63a3ebea3b3771671687146.png\",\"file_location\":\"assets\\/uploads\\/send_money\\/2022\\/12\\/22\",\"type\":\"file\"}}', 'Driving License', '{\"addressProof\":{\"field_name\":\"63a3ebea7bdeb1671687146.png\",\"file_location\":\"assets\\/uploads\\/send_money\\/2022\\/12\\/22\",\"type\":\"file\"}}', NULL, 0.00000000, 0.00000000, 0.00000000, 'fund', NULL, NULL, '2022-12-22 04:30:45', '2022-12-22 04:32:26', NULL, NULL),
(166, 2, 6, 12, 1, 365, 1.25931430, 'CAD', 'KES', 10.00000000, 0.00000000, 10.00000000, 908.90000000, 90.88984378, NULL, NULL, NULL, 16716872291102, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-22 04:33:49', '2022-12-22 04:33:49', NULL, NULL),
(167, 2, 6, 12, 3, 369, 1.25931430, 'CAD', 'KES', 20.00000000, 0.00000000, 20.00000000, 1817.80000000, 90.88984378, NULL, NULL, NULL, 16716872594681, 2, 0, NULL, NULL, NULL, 'Salary', 'Family Support', '{\"AccountNumber\":{\"field_name\":\"12334234243\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"AhsanAbid ali\",\"type\":\"text\"}}', 0, 'AhsanAbid ali', NULL, NULL, 'ahsankk126@gmail.com', NULL, '2015233620', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 04:34:19', '2022-12-22 04:39:47', NULL, NULL),
(168, 2, 6, 12, 1, 365, 1.25931430, 'CAD', 'KES', 20.00000000, 0.00000000, 20.00000000, 1817.80000000, 90.88984378, NULL, NULL, NULL, 16716877437988, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', NULL, 0, 'Imran Khan', 'Imran', 'Khan', 'imrankhan@gmail.com', NULL, '20165223301', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 04:42:23', '2022-12-22 04:42:51', NULL, NULL),
(169, 2, 6, 12, 3, 369, 1.25931430, 'CAD', 'KES', 10.00000000, 0.00000000, 10.00000000, 908.90000000, 90.88984378, NULL, NULL, NULL, 16716878299973, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"12334234243\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"AhsanAbid ali\",\"type\":\"text\"}}', 0, 'AhsanAbid ali', NULL, NULL, 'alikhanimran@gmail.com', NULL, '2016589241', 'Flat # 303/4 sulehra appartment gulistan-e-johar', 'Karachi', '75500', 'Sindh', 'Pakistan', 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 04:43:49', '2022-12-22 04:44:15', NULL, NULL),
(170, 6, 6, 2, 3, 193, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16716884709978, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'nana@nna.com', NULL, '678908766', 'caral 35', 'Neuss', '', '', 'Germany', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 04:54:30', '2022-12-22 04:55:34', NULL, NULL),
(171, 6, 6, 2, 3, 195, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16716888769553, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'nana@nna.com', NULL, '12345676', 'caral 35', 'Neuss', '41411', '', 'Germany', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 05:01:16', '2022-12-22 05:02:06', NULL, NULL),
(172, 6, 6, 2, 3, 193, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16716889818236, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'nana@nna.com', NULL, '456789', 'caral 35', '', '41411', 'NRW', 'Germany', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 05:03:01', '2022-12-22 05:04:06', NULL, NULL),
(173, 6, 6, 2, 3, 193, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16716905788128, 2, 0, NULL, NULL, NULL, 'Salary', 'Friends', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'nana@nna.com', '', '6789097654', 'caral 35', 'Neuss', '41411', '', 'Germany', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2022-12-22 05:29:38', '2022-12-22 05:30:07', NULL, NULL),
(174, 6, 6, 2, 3, 194, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.20000000, 10.20000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16716910134958, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'gary juona', 'gary', 'juona', 'nana@nna.com', '+355', '6789097654', 'caral 35', 'Neuss', '41411', NULL, 'Germany', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-22 05:36:53', '2022-12-22 05:36:53', NULL, NULL),
(175, 3, 4, 2, 3, 194, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16723850555123, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'George Asana', 'George', 'Asana', 'asana@yahoo.com', NULL, '+3234782097', 'caral 35', 'Brussels', '65423', 'BE', 'Belgium', 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-30 06:24:15', '2022-12-30 06:24:15', NULL, NULL),
(176, 3, 4, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16723851347323, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'George Asana', 'George', 'Asana', 'asana@yahoo.com', NULL, '+3234782097', 'caral 35', 'Brussels', '65423', 'BE', 'Belgium', 0, 'test yaya', NULL, '+49234567890', 'austin@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-30 06:25:34', '2022-12-30 06:25:34', NULL, NULL),
(177, 6, 4, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16723935396574, 1, 1, '2022-12-30 09:50:03', NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Test Yaya', 'Test', 'Yaya', 'austin@detracash.com', '+237', '87345780', 'Longla Street 1', 'Bamenda', '', 'North West', 'Camerron', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.00000000, 0.04408112, 2.15997510, 'online', '2022-12-30 10:18:26', NULL, '2022-12-30 08:45:39', '2022-12-30 09:18:26', NULL, NULL),
(178, 6, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16724411994895, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2022-12-30 21:59:59', '2022-12-30 21:59:59', NULL, NULL),
(179, 2, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16738522178738, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-16 05:56:57', '2023-01-16 05:56:57', NULL, NULL),
(180, 6, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16738819865398, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-16 14:13:06', '2023-01-16 14:13:06', NULL, NULL),
(181, 6, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16738823044539, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'gary juona', 'gary', 'juona', 'nana@nna.com', '+237', '6789097654', 'caral 35', 'Neuss', '41411', NULL, 'Germany', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-16 14:18:24', '2023-01-16 14:18:24', NULL, NULL),
(182, 6, 3, 2, 1, 2, 0.90741787, 'EUR', 'XAF', 100.00000000, 1.80000000, 101.80000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16738824674754, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 8, 'Test Yaya', 'Test', 'Yaya', 'austin@detracash.com', '+237', '87345780', 'Longla Street 1', 'Bamenda', NULL, 'North West', 'Camerron', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-16 14:21:07', '2023-01-16 14:21:07', NULL, NULL),
(183, 6, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16738830441256, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-16 14:30:44', '2023-01-16 14:30:44', NULL, NULL),
(184, 1, 6, 2, 4, 318, 1.25931430, 'CAD', 'XAF', 100.00000000, 2.00000000, 102.00000000, 47271.61000000, 472.71608843, NULL, NULL, NULL, 16738892451669, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-16 16:14:05', '2023-01-16 16:14:05', NULL, NULL),
(185, 1, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16738901094812, 2, 1, '2023-01-16 17:31:12', NULL, NULL, 'Salary', 'Family Support', NULL, 0, NULL, NULL, NULL, 'nana@nna.com', '', '1234565', 'caral 35', 'Neuss', '41411', '', 'Germany', 0, 'Austin Nana', '', '16261713', 'nana@nna.com', 'Schelsener strasse', 'Korschenbroich', '41352', '', 'Germany', '{\"identityProof\":{\"field_name\":\"63c589dff27e61673890271.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2023\\/01\\/16\",\"type\":\"file\"}}', 'Driving License', '{\"addressProof\":{\"field_name\":\"63c589e00447e1673890272.jpg\",\"file_location\":\"assets\\/uploads\\/send_money\\/2023\\/01\\/16\",\"type\":\"file\"}}', NULL, 0.00440811, 0.00000000, 0.21599751, 'fund', NULL, NULL, '2023-01-16 16:28:29', '2023-01-16 16:31:12', NULL, NULL),
(186, 2, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16740203021911, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 04:38:22', '2023-01-18 04:38:22', NULL, NULL),
(187, 1, 3, 2, 2, 192, 0.90741787, 'EUR', 'XAF', 20.00000000, 0.00000000, 20.00000000, 13120.71000000, 656.03527292, NULL, NULL, NULL, 16740208524304, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 04:47:32', '2023-01-18 04:47:32', NULL, NULL),
(188, 2, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16740212094528, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 04:53:29', '2023-01-18 04:53:29', NULL, NULL),
(189, 6, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16740640323061, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 16:47:12', '2023-01-18 16:47:12', NULL, NULL),
(190, 6, 5, 11, 4, 364, 0.75990562, 'GBP', 'XOF', 100.00000000, 0.00000000, 100.00000000, 78325.92000000, 783.25922896, NULL, NULL, NULL, 16740648114830, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 17:00:11', '2023-01-18 17:00:11', NULL, NULL),
(191, 1, 5, 2, 4, 318, 0.75990562, 'GBP', 'XAF', 100.00000000, 2.00000000, 102.00000000, 78338.43000000, 783.38429712, NULL, NULL, NULL, 16740672856111, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 17:41:25', '2023-01-18 17:41:25', NULL, NULL),
(192, 1, 5, 2, 2, 206, 0.75990562, 'GBP', 'XAF', 100.00000000, 0.00000000, 100.00000000, 78338.43000000, 783.38429712, NULL, NULL, NULL, 16740673548258, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-18 17:42:34', '2023-01-18 17:42:34', NULL, NULL),
(193, 6, 3, 12, 2, 402, 0.90741787, 'EUR', 'KES', 10.00000000, 0.00000000, 10.00000000, 1261.37000000, 126.13690317, NULL, NULL, NULL, 16742529824962, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-20 21:16:22', '2023-01-20 21:16:22', NULL, NULL);
INSERT INTO `send_money` (`id`, `user_id`, `send_currency_id`, `receive_currency_id`, `service_id`, `country_service_id`, `send_curr_rate`, `send_curr`, `receive_curr`, `send_amount`, `fees`, `payable_amount`, `recipient_get_amount`, `rate`, `admin_id`, `admin_reply`, `serviceinfo`, `invoice`, `status`, `payment_status`, `paid_at`, `promo_code`, `discount`, `fund_source`, `purpose`, `user_information`, `recipient_id`, `recipient_name`, `first_name`, `last_name`, `recipient_email`, `recipient_country_code`, `recipient_contact_no`, `recipient_address`, `recipient_city`, `recipient_pcode`, `recipient_state`, `recipient_country`, `is_future_trx`, `sender_name`, `sender_country_code`, `sender_phone`, `sender_email`, `sender_address`, `sender_city`, `sender_post_code`, `sender_state`, `sender_country`, `sender_identity_verification`, `sender_identity_type`, `sender_address_verification`, `merchant_id`, `merchant_commission`, `merchant_profit`, `admin_commission`, `payment_type`, `received_at`, `deleted_at`, `created_at`, `updated_at`, `flutter_status`, `flutter_response`) VALUES
(194, 6, 6, 6, 1, 323, 1.25931430, 'CAD', 'CAD', 10.00000000, 0.00000000, 10.00000000, 10.00000000, 1.00000000, NULL, NULL, NULL, 16743079167169, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-21 12:31:56', '2023-01-21 12:31:56', NULL, NULL),
(195, 6, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16744137105803, 2, 1, '2023-01-22 18:59:27', NULL, NULL, 'Salary', 'Family Support', NULL, 0, 'Test Yaya', 'Test', 'Yaya', 'austin@detracash.com', '+237', '87345780', 'Longla Street 1', 'Bamenda', 'null', 'North West', 'Camerron', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-01-22 17:55:10', '2023-01-22 17:59:27', NULL, NULL),
(196, 3, 3, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16744144244857, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test yaya', NULL, '+49234567890', 'austin@detracash.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 18:07:04', '2023-01-22 18:07:04', NULL, NULL),
(197, 6, 3, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 200.00000000, 0.00000000, 200.00000000, 91665.32000000, 458.32660316, NULL, NULL, NULL, 16744144293324, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 18:07:09', '2023-01-22 18:07:09', NULL, NULL),
(198, 6, 3, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 200.00000000, 0.00000000, 200.00000000, 91665.32000000, 458.32660316, NULL, NULL, NULL, 16744145384685, 1, 1, '2023-01-22 19:17:13', NULL, NULL, 'Business', 'Anything else', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'austin@detracash.com', '+237', '87345780', 'Longla Street 1', 'Bamenda', 'null', 'North West', 'Camerron', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.00000000, 0.00000000, 0.00000000, 'online', '2023-01-22 19:19:43', NULL, '2023-01-22 18:08:58', '2023-01-22 18:19:43', NULL, NULL),
(199, 6, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 100.00000000, 1.54000000, 101.54000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16744175663136, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 18:59:26', '2023-01-22 18:59:26', NULL, NULL),
(200, 6, 3, 14, 3, 474, 0.90741787, 'EUR', 'ZMK', 10.00000000, 0.00000000, 10.00000000, 176.32000000, 17.63244976, NULL, NULL, NULL, 16744179585467, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:05:58', '2023-01-22 19:05:58', NULL, NULL),
(201, 6, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16744180887831, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:08:08', '2023-01-22 19:08:08', NULL, NULL),
(202, 6, 3, 9, 3, 218, 0.90741787, 'EUR', 'GHS', 10.00000000, 0.00000000, 10.00000000, 80.37000000, 8.03693286, NULL, NULL, NULL, 16744181475974, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:09:07', '2023-01-22 19:09:07', NULL, NULL),
(203, 6, 3, 2, 3, 202, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16744182024532, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:10:02', '2023-01-22 19:10:02', NULL, NULL),
(204, 6, 3, 2, 2, 192, 0.90741787, 'EUR', 'XAF', 100.00000000, 0.00000000, 100.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16744185894434, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:16:29', '2023-01-22 19:16:29', NULL, NULL),
(205, 6, 3, 2, 1, 2, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.18000000, 10.18000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16744186619435, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:17:41', '2023-01-22 19:17:41', NULL, NULL),
(206, 6, 3, 1, 1, 8, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16744187434868, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 19:19:03', '2023-01-22 19:19:03', NULL, NULL),
(207, 6, 3, 2, 2, 192, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.00000000, 10.00000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16744212346090, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 20:00:34', '2023-01-22 20:00:34', NULL, NULL),
(208, 6, 3, 2, 2, 192, 0.90741787, 'EUR', 'XAF', 100.00000000, 0.00000000, 100.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16744213162163, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-22 20:01:56', '2023-01-22 20:01:56', NULL, NULL),
(209, 2, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16747339944191, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-01-26 10:53:14', '2023-01-26 10:53:14', NULL, NULL),
(210, 2, 3, 6, 1, 322, 0.90741787, 'EUR', 'CAD', 20.00000000, 0.00000000, 20.00000000, 27.76000000, 1.38779976, NULL, NULL, NULL, 16766293111623, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-17 09:21:51', '2023-02-17 09:21:51', NULL, NULL),
(211, 2, 3, 6, 4, 406, 0.90741787, 'EUR', 'CAD', 20.00000000, 0.20000000, 20.20000000, 27.76000000, 1.38779976, NULL, NULL, NULL, 16766367073152, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-17 11:25:07', '2023-02-17 11:25:07', NULL, NULL),
(212, 6, 3, 2, 3, 193, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16766499711088, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-17 15:06:11', '2023-02-17 15:06:11', NULL, NULL),
(213, 6, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16766501129345, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-17 15:08:32', '2023-02-17 15:08:32', NULL, NULL),
(214, 6, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16766506876082, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-17 15:18:07', '2023-02-17 15:18:07', NULL, NULL),
(215, 6, 3, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16769241362763, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-20 19:15:36', '2023-02-20 19:15:36', NULL, NULL),
(216, 6, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16769280542847, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-20 20:20:54', '2023-02-20 20:20:54', NULL, NULL),
(217, 2, 3, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16774768402294, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 04:47:20', '2023-02-27 04:47:20', NULL, NULL),
(218, 2, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16774768781826, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 04:47:58', '2023-02-27 04:47:58', NULL, NULL),
(219, 2, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16774769728779, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 04:49:32', '2023-02-27 04:49:32', NULL, NULL),
(220, 2, 3, 9, 2, 212, 0.90741787, 'EUR', 'GHS', 10.00000000, 0.00000000, 10.00000000, 80.37000000, 8.03693286, NULL, NULL, NULL, 16774772296733, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 04:53:49', '2023-02-27 04:53:49', NULL, NULL),
(221, 2, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 10.00000000, 1.54000000, 11.54000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16774784273631, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Test User', NULL, '015425683631', 'ahsankk126@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 05:13:47', '2023-02-27 05:13:47', NULL, NULL),
(222, 6, 3, 2, 3, 197, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16774787427465, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 05:19:02', '2023-02-27 05:19:02', NULL, NULL),
(223, 6, 3, 9, 2, 212, 0.90741787, 'EUR', 'GHS', 10.00000000, 0.00000000, 10.00000000, 80.37000000, 8.03693286, NULL, NULL, NULL, 16774791565688, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-02-27 05:25:56', '2023-02-27 05:25:56', NULL, NULL),
(224, 6, 5, 2, 3, 201, 0.75990562, 'GBP', 'XAF', 100.00000000, 2.00000000, 102.00000000, 78338.43000000, 783.38429712, 1, 'Your payment has been completed', NULL, 16774807653461, 1, 1, '2023-02-27 06:56:11', NULL, NULL, 'Salary', 'Family Support', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'austin@detracash.com', '+237', '87345780', 'Longla Street 1', 'Bamenda', 'null', 'North West', 'Camerron', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', '2023-02-27 07:24:06', NULL, '2023-02-27 05:52:45', '2023-02-27 06:24:06', NULL, NULL),
(225, 6, 6, 2, 2, 192, 1.25931430, 'CAD', 'XAF', 10.00000000, 0.00000000, 10.00000000, 4727.16000000, 472.71608843, NULL, NULL, NULL, 16787746479536, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-03-14 05:17:27', '2023-03-14 05:17:27', NULL, NULL),
(226, 6, 3, 2, 1, 2, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.18000000, 10.18000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16792141015338, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-03-19 07:21:41', '2023-03-19 07:21:41', NULL, NULL),
(227, 6, 3, 2, 4, 318, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.20000000, 10.20000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16811119461626, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-04-10 05:32:26', '2023-04-10 05:32:26', NULL, NULL),
(228, 6, 3, 2, 2, 192, 0.90741787, 'EUR', 'XAF', 10.00000000, 0.00000000, 10.00000000, 6560.35000000, 656.03527292, NULL, NULL, NULL, 16811308489255, 2, 0, NULL, NULL, NULL, 'Affaire', 'Frais Scolaires', '{\"AccountNumber\":{\"field_name\":\"0690000033\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Bale Gary\",\"type\":\"text\"}}', 0, 'Bale Gary', NULL, NULL, 'austin@detracash.com', '87345780', '87345780', 'Longla Street 1', 'Bamenda', 'null', 'North West', 'Camerron', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-04-10 10:47:28', '2023-04-10 10:53:28', NULL, NULL),
(229, 6, 4, 10, 1, 289, 0.90741787, 'EUR', 'EUR', 10.00000000, 0.00000000, 10.00000000, 10.00000000, 1.00000000, NULL, NULL, NULL, 16811944083251, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-04-11 04:26:48', '2023-04-11 04:26:48', NULL, NULL),
(230, 7, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 100.00000000, 1.54000000, 101.54000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16849616379477, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abi Abi', NULL, '12356478', 'abi@detracash.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-05-24 18:53:57', '2023-05-24 18:53:57', NULL, NULL),
(231, 7, 3, 1, 1, 9, 0.90741787, 'EUR', 'NGN', 100.00000000, 0.00000000, 100.00000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16849616981280, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abi Abi', NULL, '12356478', 'abi@detracash.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-05-24 18:54:58', '2023-05-24 18:54:58', NULL, NULL),
(232, 7, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 100.00000000, 0.00000000, 100.00000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16849617403021, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abi Abi', NULL, '12356478', 'abi@detracash.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-05-24 18:55:40', '2023-05-24 18:55:40', NULL, NULL),
(233, 7, 6, 1, 1, 11, 1.25931430, 'CAD', 'NGN', 10.00000000, 0.00000000, 10.00000000, 3302.54000000, 330.25413116, NULL, NULL, NULL, 16849852503838, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abi Abi', NULL, '12356478', 'abi@detracash.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-05-25 01:27:30', '2023-05-25 01:27:30', NULL, NULL),
(234, 7, 8, 1, 3, 176, 1.00000000, 'USD', 'NGN', 100.00000000, 1.54000000, 101.54000000, 41589.38000000, 415.89375000, NULL, NULL, NULL, 16849855674431, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abi Abi', NULL, '12356478', 'abi@detracash.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-05-25 01:32:47', '2023-05-25 01:32:47', NULL, NULL),
(236, 6, 3, 2, 3, 198, 0.90741787, 'EUR', 'XAF', 100.00000000, 2.00000000, 102.00000000, 65603.53000000, 656.03527292, NULL, NULL, NULL, 16884759722480, 2, 1, '2023-07-04 13:10:32', NULL, NULL, 'Salary', 'Family Support', '{\"AccountNumber\":{\"field_name\":\"67799999\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Loma sana\",\"type\":\"text\"}}', 0, 'Loma sana', NULL, NULL, 'nana@nana.com', '+237', '67178654', 'Longla', 'Bamenda', '', 'NW', 'Cameroon', 0, 'Austin Nana', NULL, '0162617130', 'estelle@enahair.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-07-04 11:06:12', '2023-07-04 11:10:32', NULL, NULL),
(237, 6, 5, 2, 1, 2, 0.75990562, 'GBP', 'XAF', 10.00000000, 0.18000000, 10.18000000, 7833.84000000, 783.38429712, NULL, NULL, NULL, 16935463967048, 2, 0, NULL, NULL, NULL, 'Salary', 'School fees', NULL, 0, 'Ayazul Ridoy', 'Ayazul', 'Ridoy', 'ayazulridoy@gmail.com', '+880', '1726990207', 'Sylhet', 'Sylhet', '12345', 'Sylhet', 'Bangladesh', 0, 'Austin Nana', NULL, '0162617130', 'ayazulridoy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-08-31 23:33:16', '2023-08-31 23:41:49', NULL, NULL),
(238, 6, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16935705219907, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Austin Nana', NULL, '0162617130', 'ayazulridoy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-09-01 06:15:21', '2023-09-01 06:15:21', NULL, NULL),
(239, 11, 3, 1, 1, 9, 0.90741787, 'EUR', 'NGN', 100.00000000, 0.00000000, 100.00000000, 45832.66000000, 458.32660316, NULL, NULL, NULL, 16939047228167, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ridoy test', NULL, '1234 56', 'ridoyayazul@gmail.com', 'sylhet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-09-05 03:05:22', '2023-09-05 03:05:22', NULL, NULL),
(240, 11, 5, 1, 1, 8, 0.75990562, 'GBP', 'NGN', 10.00000000, 0.00000000, 10.00000000, 5472.97000000, 547.29658402, NULL, NULL, NULL, 16939050422769, 2, 0, NULL, NULL, NULL, 'Salary', 'Friend Support', NULL, 0, 'fdsvfv fvfdvfd', 'fdsvfv', 'fvfdvfd', 'ayazulridoy@gmail.com', '', '23455434', 'dascdacd', 'dscsdcdscs', '12345', 'csdcdscfdsc', 'UK', 0, 'ridoy test', NULL, '1234 56', 'ridoyayazul@gmail.com', 'sylhet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-09-05 03:10:42', '2023-09-05 03:39:29', NULL, NULL),
(241, 11, 5, 1, 2, 470, 0.75990562, 'GBP', 'NGN', 10.00000000, 0.00000000, 10.00000000, 5472.97000000, 547.29658402, NULL, NULL, NULL, 16939070874362, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ridoy test', NULL, '1234 56', 'ridoyayazul@gmail.com', 'sylhet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-09-05 03:44:47', '2023-09-05 03:44:47', NULL, NULL),
(242, 11, 5, 1, 1, 9, 0.75990562, 'GBP', 'NGN', 10.00000000, 0.00000000, 10.00000000, 5472.97000000, 547.29658402, NULL, NULL, NULL, 16939071377915, 2, 0, NULL, NULL, NULL, 'Salary', 'Charity', NULL, 0, 'RIDOY RIDOY', 'RIDOY', 'RIDOY', 'ayazulridoy@gmail.com', NULL, '12345', 'RIDOY', 'RIDOY', 'RIDOY', 'RIDOY', 'UK', 0, 'ridoy test', NULL, '1234 56', 'ridoyayazul@gmail.com', 'sylhet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-09-05 03:45:37', '2023-09-05 03:46:40', NULL, NULL),
(243, 11, 5, 1, 1, 9, 0.75990562, 'GBP', 'NGN', 10.00000000, 0.00000000, 10.00000000, 5472.97000000, 547.29658402, NULL, NULL, NULL, 16939073035083, 2, 0, NULL, NULL, NULL, 'Salary', 'Charity', NULL, 0, 'RIDOY RIDOY', 'RIDOY', 'RIDOY', 'ayazulridoy@gmail.com', 'GBP', '678', 'RIDOY', 'RIDOY', 'RIDOY', 'RIDOY', 'UK', 0, 'ridoy test', NULL, '1234 56', 'ridoyayazul@gmail.com', 'sylhet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-09-05 03:48:23', '2023-09-05 03:49:45', NULL, NULL),
(244, 10, 3, 1, 1, 9, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16939169915083, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Ayazul Ridoy', NULL, '134434343', 'ayazulridoy@gmail.com', 'Sylhet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-09-05 06:29:51', '2023-09-05 06:29:51', NULL, NULL),
(245, 12, 6, 1, 1, 7, 1.25931430, 'CAD', 'NGN', 10.00000000, 0.00000000, 10.00000000, 3302.54000000, 330.25413116, NULL, NULL, NULL, 16968951829898, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-09 17:46:22', '2023-10-09 17:46:22', NULL, NULL),
(246, 12, 6, 1, 1, 7, 1.25931430, 'CAD', 'NGN', 100000.00000000, 0.00000000, 100000.00000000, 33025413.12000000, 330.25413116, NULL, NULL, NULL, 16973359337356, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-14 20:12:13', '2023-10-14 20:12:13', NULL, NULL),
(247, 12, 6, 1, 1, 8, 1.25931430, 'CAD', 'NGN', 1000000.00000000, 0.00000000, 1000000.00000000, 330254131.16000000, 330.25413116, NULL, NULL, NULL, 16973360698491, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-14 20:14:29', '2023-10-14 20:14:29', NULL, NULL),
(248, 12, 6, 1, 1, 8, 1.25931430, 'CAD', 'NGN', 1000000.00000000, 0.00000000, 1000000.00000000, 330254131.16000000, 330.25413116, NULL, NULL, NULL, 16973363469444, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-14 20:19:06', '2023-10-14 20:19:06', NULL, NULL),
(249, 12, 6, 1, 1, 8, 1.25931430, 'CAD', 'NGN', 1000000.00000000, 0.00000000, 1000000.00000000, 330254131.16000000, 330.25413116, NULL, NULL, NULL, 16973366158035, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-14 20:23:35', '2023-10-14 20:23:35', NULL, NULL),
(250, 12, 6, 1, 1, 8, 1.25931430, 'CAD', 'NGN', 1000000.00000000, 0.00000000, 1000000.00000000, 330254131.16000000, 330.25413116, NULL, NULL, NULL, 16973367906319, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-14 20:26:30', '2023-10-14 20:26:30', NULL, NULL),
(251, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979926689164, 1, 1, NULL, NULL, NULL, 'Salary', 'Friend Support', '{\"AccountNumber\":{\"field_name\":\"4111031234444\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"Hussain\",\"type\":\"text\"}}', 0, 'Hussain', NULL, NULL, 'dfasdfsdf@gmail.com', 'EUR', '1231231231', '123', 'demo', '2333', '123123', 'GERMANY', 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-10-22 10:37:48', '2023-10-22 10:38:23', NULL, NULL),
(252, 12, 3, 1, 3, 130, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979929435176, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:42:23', '2023-10-22 10:42:23', NULL, NULL),
(253, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979931085344, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:45:08', '2023-10-22 10:45:08', NULL, NULL),
(254, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979933088484, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:48:28', '2023-10-22 10:48:28', NULL, NULL),
(255, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979933668087, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:49:26', '2023-10-22 10:49:26', NULL, NULL),
(256, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979934732990, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:51:13', '2023-10-22 10:51:13', NULL, NULL),
(257, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979934745910, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:51:14', '2023-10-22 10:51:14', NULL, NULL),
(258, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979935114792, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:51:51', '2023-10-22 10:51:51', NULL, NULL),
(259, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979935879022, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:53:07', '2023-10-22 10:53:07', NULL, NULL),
(260, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979936641480, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:54:24', '2023-10-22 10:54:24', NULL, NULL),
(261, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979936839934, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:54:43', '2023-10-22 10:54:43', NULL, NULL),
(262, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979937379345, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:55:37', '2023-10-22 10:55:37', NULL, NULL),
(263, 12, 3, 1, 3, 1, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16979937705892, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-22 10:56:10', '2023-10-22 10:56:10', NULL, NULL),
(264, 3, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16980490902201, 2, 1, '2023-10-23 08:19:22', NULL, NULL, 'Salary', 'Friend Support', NULL, 0, 'EMad ahsad', 'EMad', 'ahsad', 'emad@gmail.com', 'EUR', '1321321321312', '123', '1231', '2333', '123123', 'GERMANY', 0, 'test yaya', NULL, '+49234567890', 'austin@detracash.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-10-23 02:18:10', '2023-10-23 02:19:22', NULL, NULL),
(265, 12, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16980492498787, 2, 1, '2023-10-23 08:21:50', NULL, NULL, 'Salary', 'Friend Support', NULL, 0, 'Ope OPe', 'Ope', 'OPe', 'ope@gmail.com', 'EUR', '12312321321', 'dasd', 'asdas', '21321', '12312', 'GERMANY', 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-10-23 02:20:49', '2023-10-23 02:21:50', NULL, NULL),
(266, 12, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 400.00000000, 0.00000000, 400.00000000, 183330.64000000, 458.32660316, NULL, NULL, NULL, 16980493821712, 2, 1, '2023-10-23 08:24:00', NULL, NULL, 'Salary', 'Friend Support', NULL, 0, 'New man Man', 'New man', 'Man', '34142@gmail.com', 'EUR', '432432423', '123123', '123123', '31232', '3123', 'GERMANY', 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2023-10-23 02:23:02', '2023-10-23 02:24:00', NULL, NULL),
(267, 12, 4, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 16980501936286, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-23 02:36:33', '2023-10-23 02:36:33', NULL, NULL),
(268, 12, 5, 1, 1, 7, 0.75990562, 'GBP', 'NGN', 10.00000000, 0.00000000, 10.00000000, 5472.97000000, 547.29658402, NULL, NULL, NULL, 16980552594031, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Abdulla Muhammed Masum', NULL, '432423432423', 'abdullamuhammed76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2023-10-23 04:00:59', '2023-10-23 04:00:59', NULL, NULL),
(269, 13, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 17047737966357, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-08 22:16:36', '2024-01-08 22:16:36', NULL, NULL),
(270, 13, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 17047855752641, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-09 01:32:55', '2024-01-09 01:32:55', NULL, NULL),
(271, 13, 3, 7, 3, 681, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049177808733, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-10 14:16:20', '2024-01-10 14:16:20', NULL, NULL),
(272, 13, 3, 7, 3, 681, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, '[{\"Bank Name\":\"City Bank\"},{\"Bank Number\":\"01784622362\"}]', 17049467034502, 2, 1, NULL, NULL, NULL, 'Salary', 'Friend Support', NULL, 0, 'Jual Ahmed', 'Jual', 'Ahmed', 'md.jual.ah@gmail.com', 'EUR', '1784622362', 'kanaighat,sylhet', 'sylhet', '3100', '3100', 'GERMANY', 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 'online', NULL, NULL, '2024-01-10 22:18:23', '2024-01-11 01:09:10', NULL, NULL),
(273, 13, 3, 7, 3, 681, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049585476283, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 01:35:47', '2024-01-11 01:35:47', NULL, NULL),
(274, 13, 3, 7, 3, 681, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049586064927, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 01:36:46', '2024-01-11 01:36:46', NULL, NULL),
(275, 13, 3, 7, 1, 12, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049587576421, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 01:39:17', '2024-01-11 01:39:17', NULL, NULL),
(276, 13, 3, 7, 3, 681, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049934831030, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:18:03', '2024-01-11 11:18:03', NULL, NULL),
(277, 13, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 17049936393806, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:20:39', '2024-01-11 11:20:39', NULL, NULL),
(278, 13, 3, 7, 1, 12, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049936709943, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:21:10', '2024-01-11 11:21:10', NULL, NULL),
(279, 13, 3, 7, 2, 683, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049942043488, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:30:04', '2024-01-11 11:30:04', NULL, NULL),
(280, 13, 3, 7, 2, 684, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049943028176, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:31:42', '2024-01-11 11:31:42', NULL, NULL),
(281, 13, 3, 7, 2, 684, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049943255616, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:32:05', '2024-01-11 11:32:05', NULL, NULL),
(282, 13, 3, 7, 2, 683, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049943443413, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:32:24', '2024-01-11 11:32:24', NULL, NULL),
(283, 13, 3, 7, 2, 684, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049943538138, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:32:33', '2024-01-11 11:32:33', NULL, NULL),
(284, 13, 3, 1, 2, 470, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 17049947657108, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:39:25', '2024-01-11 11:39:25', NULL, NULL),
(285, 13, 3, 7, 2, 683, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17049948022812, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 11:40:02', '2024-01-11 11:40:02', NULL, NULL),
(286, 13, 3, 1, 1, 7, 0.90741787, 'EUR', 'NGN', 10.00000000, 0.00000000, 10.00000000, 4583.27000000, 458.32660316, NULL, NULL, NULL, 17050323161287, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 22:05:16', '2024-01-11 22:05:16', NULL, NULL),
(287, 13, 3, 7, 2, 683, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17050334327551, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 22:23:52', '2024-01-11 22:23:52', NULL, NULL),
(288, 13, 3, 7, 2, 684, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17050334883887, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 22:24:48', '2024-01-11 22:24:48', NULL, NULL),
(289, 13, 3, 7, 2, 683, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17050335312402, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 22:25:31', '2024-01-11 22:25:31', NULL, NULL);
INSERT INTO `send_money` (`id`, `user_id`, `send_currency_id`, `receive_currency_id`, `service_id`, `country_service_id`, `send_curr_rate`, `send_curr`, `receive_curr`, `send_amount`, `fees`, `payable_amount`, `recipient_get_amount`, `rate`, `admin_id`, `admin_reply`, `serviceinfo`, `invoice`, `status`, `payment_status`, `paid_at`, `promo_code`, `discount`, `fund_source`, `purpose`, `user_information`, `recipient_id`, `recipient_name`, `first_name`, `last_name`, `recipient_email`, `recipient_country_code`, `recipient_contact_no`, `recipient_address`, `recipient_city`, `recipient_pcode`, `recipient_state`, `recipient_country`, `is_future_trx`, `sender_name`, `sender_country_code`, `sender_phone`, `sender_email`, `sender_address`, `sender_city`, `sender_post_code`, `sender_state`, `sender_country`, `sender_identity_verification`, `sender_identity_type`, `sender_address_verification`, `merchant_id`, `merchant_commission`, `merchant_profit`, `admin_commission`, `payment_type`, `received_at`, `deleted_at`, `created_at`, `updated_at`, `flutter_status`, `flutter_response`) VALUES
(290, 13, 3, 7, 2, 683, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17050360479769, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 23:07:27', '2024-01-11 23:07:27', NULL, NULL),
(291, 13, 3, 7, 3, 681, 0.90741787, 'EUR', 'BDT', 10.00000000, 0.00000000, 10.00000000, 936.72000000, 93.67238933, NULL, NULL, NULL, 17050370587877, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Jual Ahmed', NULL, '1784622362', 'md.jual.ah@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00000000, 0.00000000, 0.00000000, NULL, NULL, NULL, '2024-01-11 23:24:18', '2024-01-11 23:24:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `serviceinfos`
--

CREATE TABLE `serviceinfos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `serviceinfos`
--

INSERT INTO `serviceinfos` (`id`, `service_id`, `language_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, 1, 'Bank Name', 1, '2024-01-10 13:05:20', '2024-01-10 13:05:20'),
(3, 3, 1, 'Bank Number', 1, '2024-01-10 13:05:33', '2024-01-10 13:05:33'),
(4, 1, 1, 'Mobile Number', 1, '2024-01-10 13:05:43', '2024-01-10 13:05:43'),
(5, 3, 1, 'IBAN', 1, '2024-01-11 01:37:01', '2024-01-11 01:37:01'),
(6, 1, 1, 'Test', 1, '2024-01-11 01:38:41', '2024-01-11 01:38:41'),
(7, 1, 1, 'Nubmer', 1, '2024-01-11 11:21:46', '2024-01-11 11:21:46'),
(8, 2, 1, 'Number', 1, '2024-01-11 11:30:30', '2024-01-11 11:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `parent_id`, `language_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Airtem', 1, '2021-08-15 21:19:09', '2024-01-10 12:47:56'),
(2, 0, 1, 'Mobile Money', 1, '2021-08-15 21:20:28', '2022-11-04 19:14:47'),
(3, 0, 1, 'Bank Transfer', 1, '2021-08-15 21:21:07', '2022-11-03 05:57:38'),
(4, 0, 1, 'Cash Pick-Up', 1, '2022-03-12 14:06:59', '2023-08-30 13:18:13'),
(5, 0, 1, 'other', 1, '2022-11-04 18:46:55', '2023-08-30 13:18:22'),
(6, 3, 2, 'Virement Bancaire', 1, '2023-04-10 09:26:43', '2023-04-10 09:26:43'),
(7, 2, 2, 'Argent mobile', 1, '2023-04-10 09:32:11', '2023-04-10 09:32:11'),
(8, 4, 2, 'Ramassage en espèces', 1, '2023-04-10 09:33:44', '2023-04-10 09:33:44'),
(9, 1, 2, 'Recharge mobile', 1, '2023-04-10 09:35:31', '2023-04-10 09:35:31');

-- --------------------------------------------------------

--
-- Table structure for table `site_notifications`
--

CREATE TABLE `site_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_notificational_id` bigint(20) NOT NULL,
  `site_notificational_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `site_notifications`
--

INSERT INTO `site_notifications` (`id`, `site_notificational_id`, `site_notificational_type`, `description`, `created_at`, `updated_at`) VALUES
(6, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/tickets\\/view\\/1\",\"icon\":\"fas fa-ticket-alt text-white\",\"text\":\"testuser create a ticket\\r\\nTicket : 829590\\r\\n\\r\\n\"}', '2021-10-04 07:17:10', '2021-10-04 07:17:10'),
(7, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/tickets\\/view\\/1\",\"icon\":\"fas fa-ticket-alt text-white\",\"text\":\"testuser create a ticket\\r\\nTicket : 829590\\r\\n\\r\\n\"}', '2021-10-04 07:17:10', '2021-10-04 07:17:10'),
(12, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/tickets\\/view\\/1\",\"icon\":\"fas fa-ticket-alt text-white\",\"text\":\"testuser replied  ticket\\r\\nTicket : 829590\\r\\n\\r\\n\"}', '2021-10-04 08:03:24', '2021-10-04 08:03:24'),
(13, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/tickets\\/view\\/1\",\"icon\":\"fas fa-ticket-alt text-white\",\"text\":\"testuser replied  ticket\\r\\nTicket : 829590\\r\\n\\r\\n\"}', '2021-10-04 08:03:24', '2021-10-04 08:03:24'),
(16, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/tickets\\/view\\/1\",\"icon\":\"fas fa-ticket-alt text-white\",\"text\":\"testuser replied  ticket\\r\\nTicket : 829590\\r\\n\\r\\n\"}', '2021-10-04 08:03:36', '2021-10-04 08:03:36'),
(17, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/tickets\\/view\\/1\",\"icon\":\"fas fa-ticket-alt text-white\",\"text\":\"testuser replied  ticket\\r\\nTicket : 829590\\r\\n\\r\\n\"}', '2021-10-04 08:03:36', '2021-10-04 08:03:36'),
(20, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"testuser deposited 120 USD via Stripe \\r\\n\"}', '2021-10-04 09:09:44', '2021-10-04 09:09:44'),
(21, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"testuser deposited 120 USD via Stripe \\r\\n\"}', '2021-10-04 09:09:44', '2021-10-04 09:09:44'),
(25, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser payment requested  sent  200.00 USD <br> by Mobile Money\\r\\n\"}', '2021-10-04 10:53:22', '2021-10-04 10:53:22'),
(26, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser payment requested  sent  200.00 USD <br> by Mobile Money\\r\\n\"}', '2021-10-04 10:53:22', '2021-10-04 10:53:22'),
(29, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/5\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-07 22:48:50', '2021-10-07 22:48:50'),
(30, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/5\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-07 22:48:50', '2021-10-07 22:48:50'),
(34, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/4\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-07 22:55:27', '2021-10-07 22:55:27'),
(35, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/4\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-07 22:55:27', '2021-10-07 22:55:27'),
(41, 2, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"las la-money-bill-alt \"}', '2021-10-14 21:29:13', '2021-10-14 21:29:13'),
(44, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/6\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-14 23:25:45', '2021-10-14 23:25:45'),
(45, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/6\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-14 23:25:45', '2021-10-14 23:25:45'),
(46, 2, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"Your  120.00 CAD transfer is processing\\r\\n\"}', '2021-10-14 23:25:45', '2021-10-14 23:25:45'),
(49, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/7\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-15 02:13:56', '2021-10-15 02:13:56'),
(50, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/7\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-15 02:13:56', '2021-10-15 02:13:56'),
(53, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"testuser deposited 94.83804428 USD via Stripe \\r\\n\"}', '2021-10-15 02:13:57', '2021-10-15 02:13:57'),
(54, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"testuser deposited 94.83804428 USD via Stripe \\r\\n\"}', '2021-10-15 02:13:57', '2021-10-15 02:13:57'),
(55, 2, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"94.84 USD Payment Has Been successful via Stripe \\r\\n\"}', '2021-10-15 02:13:57', '2021-10-15 02:13:57'),
(58, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/8\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-15 02:22:55', '2021-10-15 02:22:55'),
(59, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/8\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 CAD\\r\\n\"}', '2021-10-15 02:22:55', '2021-10-15 02:22:55'),
(62, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"testuser deposited 94.83804428 USD via Stripe \\r\\n\"}', '2021-10-15 02:22:55', '2021-10-15 02:22:55'),
(63, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/2\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"testuser deposited 94.83804428 USD via Stripe \\r\\n\"}', '2021-10-15 02:22:55', '2021-10-15 02:22:55'),
(64, 2, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"94.84 USD Payment Has Been successful via Stripe \\r\\n\"}', '2021-10-15 02:22:55', '2021-10-15 02:22:55'),
(67, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/12\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"demouser requested  to transfer  0.70 CAD\\r\\n\"}', '2021-10-17 01:24:05', '2021-10-17 01:24:05'),
(68, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/12\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"demouser requested  to transfer  0.70 CAD\\r\\n\"}', '2021-10-17 01:24:06', '2021-10-17 01:24:06'),
(71, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/1\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"demouser deposited 0.55322192 USD via Stripe \\r\\n\"}', '2021-10-17 01:24:06', '2021-10-17 01:24:06'),
(72, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/1\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"demouser deposited 0.55322192 USD via Stripe \\r\\n\"}', '2021-10-17 01:24:06', '2021-10-17 01:24:06'),
(76, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/15\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"demouser requested  to transfer  100.00 BDT\\r\\n\"}', '2021-10-17 06:48:03', '2021-10-17 06:48:03'),
(77, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/15\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"demouser requested  to transfer  100.00 BDT\\r\\n\"}', '2021-10-17 06:48:03', '2021-10-17 06:48:03'),
(80, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/1\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"demouser deposited 1.17647059 USD via Stripe \\r\\n\"}', '2021-10-17 06:48:03', '2021-10-17 06:48:03'),
(81, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/user\\/payment\\/1\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"demouser deposited 1.17647059 USD via Stripe \\r\\n\"}', '2021-10-17 06:48:03', '2021-10-17 06:48:03'),
(85, 3, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/16\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 BDT\\r\\n\"}', '2021-10-17 08:31:44', '2021-10-17 08:31:44'),
(86, 4, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost\\/remito-austin\\/Files\\/admin\\/money-transfer\\/16\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"testuser requested  to transfer  120.00 BDT\\r\\n\"}', '2021-10-17 08:31:44', '2021-10-17 08:31:44'),
(87, 2, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"Your  120.00 BDT transfer is processing\\r\\n\"}', '2021-10-17 08:31:44', '2021-10-17 08:31:44'),
(130, 3, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"10.00 EUR  money transfer has been completed\\r\\n\"}', '2022-03-23 16:35:51', '2022-03-23 16:35:51'),
(133, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"120.00 CAD  money transfer has been completed\\r\\n\"}', '2022-07-24 07:05:56', '2022-07-24 07:05:56'),
(134, 3, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"91.6454 EUR  payment request has been rejected\\r\\n\\r\\n\"}', '2022-10-23 06:43:12', '2022-10-23 06:43:12'),
(140, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"100.00 GBP  payout has been completed\\r\\n\"}', '2022-11-14 08:25:46', '2022-11-14 08:25:46'),
(143, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"1,000.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2022-11-14 08:35:29', '2022-11-14 08:35:29'),
(148, 5, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"73.50 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2022-12-19 15:42:22', '2022-12-19 15:42:22'),
(153, 6, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"102.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2022-12-19 17:31:42', '2022-12-19 17:31:42'),
(158, 2, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"73.50 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2022-12-19 18:14:11', '2022-12-19 18:14:11'),
(159, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"102.00 CAD  payout has been completed\\r\\n\"}', '2022-12-19 18:20:03', '2022-12-19 18:20:03'),
(162, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"1,000.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2022-12-20 11:07:18', '2022-12-20 11:07:18'),
(170, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"Your  20.00 CAD transfer is processing\\r\\n\"}', '2022-12-22 04:32:27', '2022-12-22 04:32:27'),
(176, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"102.00 EUR  payout has been completed\\r\\n\"}', '2022-12-30 09:18:26', '2022-12-30 09:18:26'),
(179, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"Your  10.20 EUR transfer is processing\\r\\n\"}', '2023-01-16 16:31:12', '2023-01-16 16:31:12'),
(184, 6, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"102.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2023-01-22 17:59:28', '2023-01-22 17:59:28'),
(190, 1, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"200.00 EUR  payout has been completed\\r\\n\"}', '2023-01-22 18:19:43', '2023-01-22 18:19:43'),
(195, 6, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"121.80 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2023-02-27 05:56:12', '2023-02-27 05:56:12'),
(196, 6, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt text-white\",\"text\":\"102.00 GBP  money transfer has been completed\\r\\n\"}', '2023-02-27 06:24:07', '2023-02-27 06:24:07'),
(201, 6, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"102.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2023-07-04 11:10:33', '2023-07-04 11:10:33'),
(203, 2, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost:8000\\/admin\\/money-transfer\\/264\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"tester requested  to transfer  10.00 EUR\\r\\n\"}', '2023-10-23 02:19:25', '2023-10-23 02:19:25'),
(205, 2, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost:8000\\/admin\\/user\\/payment\\/3\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"tester deposited 10 EUR via Stripe \\r\\n\"}', '2023-10-23 02:19:25', '2023-10-23 02:19:25'),
(206, 3, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"10.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2023-10-23 02:19:31', '2023-10-23 02:19:31'),
(208, 2, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost:8000\\/admin\\/money-transfer\\/265\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"ammasum requested  to transfer  10.00 EUR\\r\\n\"}', '2023-10-23 02:21:53', '2023-10-23 02:21:53'),
(210, 2, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost:8000\\/admin\\/user\\/payment\\/12\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"ammasum deposited 10 EUR via Stripe \\r\\n\"}', '2023-10-23 02:21:53', '2023-10-23 02:21:53'),
(211, 12, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"10.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2023-10-23 02:21:59', '2023-10-23 02:21:59'),
(213, 2, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost:8000\\/admin\\/money-transfer\\/266\\/details\",\"icon\":\"fa fa-money-bill-alt text-white\",\"text\":\"ammasum requested  to transfer  400.00 EUR\\r\\n\"}', '2023-10-23 02:24:03', '2023-10-23 02:24:03'),
(215, 2, 'App\\Models\\Admin', '{\"link\":\"http:\\/\\/localhost:8000\\/admin\\/user\\/payment\\/12\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"ammasum deposited 400 EUR via Stripe \\r\\n\"}', '2023-10-23 02:24:03', '2023-10-23 02:24:03'),
(216, 12, 'App\\Models\\User', '{\"link\":\"#\",\"icon\":\"fas fa-money-bill-alt\",\"text\":\"400.00 EUR Payment Has Been successful via Stripe \\r\\n\"}', '2023-10-23 02:24:09', '2023-10-23 02:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `sms_controls`
--

CREATE TABLE `sms_controls` (
  `id` int(10) UNSIGNED NOT NULL,
  `actionMethod` varchar(255) DEFAULT NULL,
  `actionUrl` varchar(255) DEFAULT NULL,
  `headerData` text DEFAULT NULL,
  `paramData` text DEFAULT NULL,
  `formData` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sms_controls`
--

INSERT INTO `sms_controls` (`id`, `actionMethod`, `actionUrl`, `headerData`, `paramData`, `formData`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', '2020-12-13 01:45:29', '2021-01-24 04:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `source_funds`
--

CREATE TABLE `source_funds` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `source_funds`
--

INSERT INTO `source_funds` (`id`, `parent_id`, `language_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Salary', '2021-09-28 06:53:43', '2021-10-19 07:45:21'),
(3, 2, 2, 'Affaire', '2023-04-10 05:23:14', '2023-04-10 09:47:25'),
(4, 1, 2, 'Salaire', '2023-04-10 09:48:08', '2023-04-10 09:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(60) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'austin@detracash.com', '2021-10-20 18:33:08', '2021-10-20 18:33:08'),
(2, 'dddd@ddd.com', '2022-07-11 13:00:23', '2022-07-11 13:00:23'),
(3, 'ambrose.etenjeh@gmail.com', '2023-06-19 14:16:26', '2023-06-19 14:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `language_id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'about-us', '{\"title\":\"We make Remittance Simple and Convenient\",\"short_description\":\"<p><span><span>We are a cutting-edge remittance company, specializing in providing convenient and cost-effective money transfer services to people around the world. With a strong commitment to our customers, we offer a user-friendly platform, competitive exchange rates, and lightning-fast transfer speeds. Whether you\'re sending money home to your loved ones or friends, our team is dedicated to ensuring your transaction is smooth and hassle-free. <\\/span><\\/span><\\/p><p><span><span>We understand the importance of trust in money transfers, which is why we prioritize security, transparency, and top-notch customer support. With us, you can rest assured that your remittances are in good hand<\\/span><\\/span><br \\/><\\/p>\"}', '2021-06-13 05:09:51', '2023-02-11 19:57:20'),
(2, 1, 'faq', '{\"title\":\"Check Answers To Your Questions\"}', '2021-06-13 05:13:09', '2022-07-29 16:24:03'),
(3, 1, 'testimonial', '{\"title\":\"What Our Customers Are Saying About Our Services\"}', '2021-06-13 07:17:12', '2021-11-08 20:28:55'),
(5, 1, 'contact-us', '{\"title\":\"Get In Touch\",\"short_details\":\"We will be happy to assist you with questions and queries you might have by completing the form below\",\"address\":\"Bedburger Street,  Amzo\",\"email\":\"info@detracash.com\",\"phone\":\"+4915211549870\",\"footer_left_text\":\"We are a cutting-edge remittance company, specializing in providing convenient and cost-effective money transfer services to people around the world. Join us and make your first transfer in minutes.\"}', '2021-06-13 07:24:01', '2023-02-11 19:57:44'),
(6, 1, 'we-accept', '{\"title\":\"Supported Payment Gateways\"}', '2021-06-13 07:24:57', '2021-11-08 20:43:06'),
(8, 1, 'news-letter', '{\"title\":\"Get The Latest...\",\"sub_title\":\"Subscribe to our newsletter\"}', '2021-06-13 07:27:41', '2021-11-08 20:45:53'),
(9, 1, 'how-it-work', '{\"short_title\":\"Simple Step\",\"title\":\"How It Works\",\"description\":\"Just a few simple steps and it\'s free\"}', '2021-06-13 09:12:58', '2021-06-13 23:14:15'),
(10, 1, 'why-chose-us', '{\"title\":\"Why Choose Us?\"}', '2021-06-13 22:33:59', '2021-08-27 11:00:11'),
(11, 1, 'calculation', '{\"title\":\"Simple, Convenient and Secure for International Money Transfers\",\"short_description\":\"Be part of millions who value our services.... With DetraCash your transactions are in good hands\",\"button_name\":\"GET STARTED\"}', '2021-08-27 11:00:00', '2022-07-11 15:16:27'),
(12, 1, 'app', '{\"title\":\"Send on the go and track\",\"short_description\":\"<p><span>Send money to your love ones when you are on vacation, in a plane, in a restaurant, while\\u00a0taking a walk.... Neither you nor your recipient need to have a current account for a cash transfer. We offer a multitude of money transfer methods. Create or logon to your account and watch the magic happens. Transactions on our platform take a few seconds to a couple of minutes to complete and ready for pick-up.<\\/span><br \\/><\\/p>\"}', '2021-08-27 11:01:58', '2022-07-11 15:19:44'),
(13, 1, 'way-to-send', '{\"title\":\"How To Send Money With DetraCash\"}', '2021-08-27 11:02:06', '2021-11-08 20:22:21'),
(14, 1, 'send-money-video', '{\"title\":\"Sending money with DetraCash works like 123\",\"short_details\":\"Simple, Safe, Reliable, convenient....\"}', '2021-08-27 11:04:07', '2023-02-16 06:13:09'),
(15, 1, 'family-support', '{\"title\":\"Be there for your family.\",\"short_description\":\"A helping hand is precious - DetraCash offers various ways to support your families and friends financially\"}', '2021-08-27 11:05:33', '2021-11-08 20:41:02'),
(16, 1, 'blog', '{\"title\":\"News and Articles\"}', '2021-08-27 11:05:47', '2023-02-04 17:32:38'),
(17, 1, 'services', '{\"title\":\"Our Services\"}', '2021-08-27 11:11:48', '2021-11-08 20:48:20'),
(18, 1, 'mission-and-vision', '{\"title\":\"We make it possible for families and friends to assist their immediate love ones\",\"description\":\"<p style=\\\"font-size:16px;font-family:\'Open-r\';\\\"><span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span>a<\\/p><ul><li><h5><b><span>Our Mission<\\/span><\\/b><\\/h5><p style=\\\"font-size:16px;font-family:\'Open-r\';\\\"><span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span><br \\/><\\/p><\\/li><li><h5><b><span>Our Vision<\\/span><\\/b><\\/h5><p style=\\\"font-size:16px;font-family:\'Open-r\';\\\"><span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span><br \\/><\\/p><\\/li><li><h5><b><span>Our Goal<\\/span><\\/b><\\/h5><p style=\\\"font-size:16px;font-family:\'Open-r\';\\\"><span>With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/span><br \\/><\\/p><\\/li><\\/ul>\"}', '2021-08-27 11:18:50', '2023-02-16 06:25:08'),
(19, 1, 'support', '{\"title\":\"We Offer Support In Multiple Languages\",\"short_details\":\"Customer support in 8 languages \\u2013 Hausa, Igbo, Swahili, Zulu, Arabic, Yoruba, English, German, French, Spanish, Portuguese, Italian\",\"button_name\":\"Read More\"}', '2021-08-28 00:50:09', '2022-07-11 15:25:08'),
(20, 1, 'form-right-content', '{\"details\":\"Your transfer is important to us, You can track the status of your transfer in your account. Immediately it is completed, you will be notified\\u00a0\",\"button_name\":\"Need help? Read this article\"}', '2021-08-28 03:21:12', '2023-03-19 07:59:31'),
(21, 2, 'about-us', '{\"title\":\"Nous rendons les transferts de fonds simples et pratiques\",\"short_description\":\"<p>Nous sommes une soci\\u00e9t\\u00e9 de transfert de fonds de pointe, sp\\u00e9cialis\\u00e9e dans la fourniture de solutions de transfert d\'argent pratiques et rentables aux personnes du monde entier. Avec un engagement fort envers nos clients, nous offrons une plateforme conviviale, des taux de change comp\\u00e9titifs et des vitesses de transfert ultra-rapides. Que vous envoyiez de l\'argent \\u00e0 vos proches ou \\u00e0 vos amis, notre \\u00e9quipe s\'engage \\u00e0 faire en sorte que votre transaction soit fluide et sans tracas. <\\/p><p>Nous comprenons l\'importance de la confiance dans les transferts d\'argent, c\'est pourquoi nous donnons la priorit\\u00e9 \\u00e0 la s\\u00e9curit\\u00e9, \\u00e0 la transparence et \\u00e0 un support client de premier ordre. Avec nous, vous pouvez \\u00eatre assur\\u00e9 que vos remises sont entre de bonnes mains<br \\/><\\/p>\"}', '2023-02-04 18:22:33', '2023-02-16 06:22:16'),
(22, 2, 'blog', '{\"title\":\"Actualit\\u00e9s et Articles\"}', '2023-02-11 10:49:11', '2023-02-11 10:49:11'),
(23, 2, 'contact-us', '{\"title\":\"Entrer en contact\",\"short_details\":\"Nous serons heureux de vous aider avec des questions et des requ\\u00eates que vous pourriez avoir en remplissant le formulaire ci-dessous\",\"address\":\"Bedburger Street,  Amzo\",\"email\":\"info@detracash.com\",\"phone\":\"+4915211549870\",\"footer_left_text\":\"Nous sommes une soci\\u00e9t\\u00e9 de transfert de fonds de pointe, sp\\u00e9cialis\\u00e9e dans la fourniture de services de transfert d\'argent pratiques et rentables aux personnes du monde entier. Rejoignez-nous et effectuez votre premier transfert en quelques minutes\"}', '2023-02-11 20:00:13', '2023-02-11 20:05:01'),
(24, 2, 'faq', '{\"title\":\"Consulter les r\\u00e9ponses \\u00e0 vos questions\"}', '2023-02-14 08:04:37', '2023-02-14 08:04:37'),
(25, 2, 'calculation', '{\"title\":\"Simple, pratique et s\\u00e9curis\\u00e9 pour les transferts d\'argent internationaux\",\"short_description\":\"Faites partie des millions qui appr\\u00e9cient nos services.... Avec DetraCash, vos transactions sont entre de bonnes mains\",\"button_name\":\"COMMENCER\"}', '2023-02-16 06:04:42', '2023-02-16 06:04:42'),
(26, 2, 'why-chose-us', '{\"title\":\"Pourquoi nous choisir?\"}', '2023-02-16 06:08:23', '2023-02-16 06:08:23'),
(27, 2, 'way-to-send', '{\"title\":\"Comment envoyer de l\'argent avec DetraCash\"}', '2023-02-16 06:09:57', '2023-02-16 06:09:57'),
(28, 2, 'send-money-video', '{\"title\":\"Envoyer de l\'argent avec DetraCash fonctionne comme 123\",\"short_details\":\"Simple, s\\u00fbr, fiable, pratique....\"}', '2023-02-16 06:14:10', '2023-02-16 06:14:10'),
(29, 2, 'family-support', '{\"title\":\"Soyez l\\u00e0 pour votre famille.\",\"short_description\":\"Un coup de main est pr\\u00e9cieux - DetraCash propose diff\\u00e9rentes fa\\u00e7ons de soutenir financi\\u00e8rement vos familles et vos amis\"}', '2023-02-16 06:18:26', '2023-02-16 06:18:26'),
(30, 2, 'services', '{\"title\":\"Nos services\"}', '2023-02-16 06:24:02', '2023-02-16 06:24:02'),
(31, 2, 'mission-and-vision', '{\"title\":\"Nous permettons aux familles et aux amis d\'aider leurs proches\",\"description\":\"<p style=\\\"font-family:\'Open-r\';\\\">With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presencea<\\/p><ul><li><h5>Our Mission<\\/h5><p style=\\\"font-family:\'Open-r\';\\\">With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<br \\/><\\/p><\\/li><li><h5>Our Vision<\\/h5><p style=\\\"font-family:\'Open-r\';\\\">With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<br \\/><\\/p><\\/li><li><h5>Our Goal<\\/h5><p style=\\\"font-family:\'Open-r\';\\\">With DetraCash, wiring money to people even in remote areas has been made easy. Using our platform, dreams and reality become apparent. For the African market we have built in technologies which will work for each country where we have presence<\\/p><\\/li><\\/ul>\"}', '2023-02-16 06:27:24', '2023-02-16 06:27:24'),
(32, 2, 'form-right-content', '{\"details\":\"<p>Votre transfert est important pour nous, vous pouvez suivre l\'\\u00e9tat de votre transfert dans votre compte. D\\u00e8s qu\'il est termin\\u00e9, vous serez averti.\\u00a0<br \\/><\\/p>\",\"button_name\":\"Besoin d\'aide? Lire cet article\"}', '2023-02-16 06:30:05', '2023-03-19 08:00:11'),
(33, 2, 'app', '{\"title\":\"Envoyez en d\\u00e9placement et suivez\",\"short_description\":\"<p>Envoyez de l\'argent \\u00e0 vos proches lorsque vous \\u00eates en vacances, dans un avion, au restaurant, en vous promenant... Ni vous ni votre b\\u00e9n\\u00e9ficiaire n\'avez besoin d\'avoir un compte courant pour un transfert d\'argent. Nous offrons une multitude de m\\u00e9thodes de transfert d\'argent. Cr\\u00e9ez ou connectez-vous \\u00e0 votre compte et regardez la magie se produire. Les transactions sur notre plate-forme prennent de quelques secondes \\u00e0 quelques minutes et sont pr\\u00eates \\u00e0 \\u00eatre r\\u00e9cup\\u00e9r\\u00e9es<br \\/><\\/p>\"}', '2023-03-19 07:39:11', '2023-03-19 07:39:11'),
(34, 2, 'testimonial', '{\"title\":\"Ce que nos clients disent de nos services\"}', '2023-03-19 07:41:03', '2023-03-19 07:41:03'),
(35, 2, 'support', '{\"title\":\"Nous Offrons Support En Plusieurs Langues\",\"short_details\":\"<p>Support client en 8 langues - haoussa, igbo, swahili, zoulou, arabe, yoruba, anglais, allemand, fran\\u00e7ais, espagnol, portugais, italien<br \\/><\\/p>\",\"button_name\":\"Lire la suite\"}', '2023-03-19 07:45:03', '2023-03-19 07:45:03'),
(36, 2, 'we-accept', '{\"title\":\"Passerelles de Paiement Support\\u00e9es\"}', '2023-03-19 07:49:56', '2023-03-19 07:49:56'),
(37, 2, 'news-letter', '{\"title\":\"Recevoir les nouvelles...\",\"sub_title\":\"Abonnez-vous \\u00e0 notre newsletter\"}', '2023-03-19 07:54:47', '2023-03-19 07:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `template_media`
--

CREATE TABLE `template_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `template_media`
--

INSERT INTO `template_media` (`id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'about-us', '{\"image\":\"61291cb8c826f1630084280.jpg\",\"youtube_link\":\"https:\\/\\/www.youtube.com\\/embed\\/exc_ucoeDf4\"}', '2021-06-13 05:09:51', '2022-08-09 14:02:24'),
(2, 'contact-us', '{\"image\":\"60c6f81b8980a1623652379.png\"}', '2021-06-14 00:32:59', '2021-06-14 00:32:59'),
(3, 'calculation', '{\"image\":\"64620ff354a6e1684148211.jpg\",\"button_link\":\"https:\\/\\/detracash.com\\/login\"}', '2021-08-27 11:00:00', '2023-05-15 08:56:51'),
(4, 'app', '{\"image\":\"646243415cef51684161345.jpg\",\"button_link\":\"https:\\/\\/play.google.com\\/store\\/apps\",\"app_link\":\"https:\\/\\/play.google.com\\/store\\/apps\",\"playstore_link\":\"https:\\/\\/play.google.com\\/store\\/apps\"}', '2021-08-27 11:01:58', '2023-05-15 12:35:45'),
(5, 'send-money-video', '{\"image\":\"61291b07b36d11630083847.jpg\",\"youtube_link\":\"https:\\/\\/www.youtube.com\\/embed\\/L6O7YL3r-9I\"}', '2021-08-27 11:04:07', '2022-03-03 17:46:43'),
(6, 'family-support', '{\"image\":\"61291b5db25fb1630083933.jpg\"}', '2021-08-27 11:05:33', '2021-08-27 11:05:33'),
(7, 'mission-and-vision', '{\"image\":\"61291e7a98c141630084730.jpg\"}', '2021-08-27 11:18:50', '2021-08-27 11:18:50'),
(8, 'support', '{\"image\":\"6462111f235af1684148511.jpg\",\"button_link\":\"https:\\/\\/detracash.com\\/faq\"}', '2021-08-28 00:50:09', '2023-05-15 09:01:51'),
(9, 'form-right-content', '{\"button_link\":\"https:\\/\\/detracash.com\\/blog-details\\/our-numbers-will-push-a-smile-on-your-face\\/85\"}', '2021-08-28 03:21:12', '2022-08-09 13:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(91) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed	',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 2, 'testuser', 'testuser@gmail.com', '829590', 'test subject', 3, '2021-10-04 08:04:10', '2021-10-04 07:17:09', '2021-10-04 08:04:10'),
(2, 3, 'test01', 'austin@detracash.com', '329928', 'Money', 1, '2021-10-20 20:51:46', '2021-10-20 19:46:31', '2021-10-20 20:51:46'),
(3, 3, 'tester', 'austin@gmail.com', '980997', 'account test', 0, '2022-03-23 20:25:16', '2022-03-23 20:25:16', '2022-03-23 20:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ticket_attachments`
--

INSERT INTO `ticket_attachments` (`id`, `ticket_message_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '615afed55ec5a1633353429.jpg', '2021-10-04 07:17:09', '2021-10-04 07:17:09'),
(2, 5, '615b09b81f6651633356216.jpg', '2021-10-04 08:03:36', '2021-10-04 08:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ticket_messages`
--

INSERT INTO `ticket_messages` (`id`, `ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'sadsadsad', '2021-10-04 07:17:09', '2021-10-04 07:17:09'),
(2, 1, 1, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using', '2021-10-04 07:55:22', '2021-10-04 07:55:22'),
(3, 1, 1, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using', '2021-10-04 07:55:28', '2021-10-04 07:55:28'),
(4, 1, NULL, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using', '2021-10-04 08:03:24', '2021-10-04 08:03:24'),
(5, 1, NULL, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using', '2021-10-04 08:03:36', '2021-10-04 08:03:36'),
(6, 2, NULL, 'I need my money back', '2021-10-20 19:46:31', '2021-10-20 19:46:31'),
(7, 2, 1, 'you will get it ... test', '2021-10-20 20:51:46', '2021-10-20 20:51:46'),
(8, 3, NULL, 'transaction number not working .... testing', '2022-03-23 20:25:16', '2022-03-23 20:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `top_up_logs`
--

CREATE TABLE `top_up_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_money_id` bigint(20) DEFAULT NULL,
  `customIdentifier` bigint(20) DEFAULT NULL,
  `topup_response` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `top_up_logs`
--

INSERT INTO `top_up_logs` (`id`, `send_money_id`, `customIdentifier`, `topup_response`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 163445138157121792, '{\"timeStamp\":\"2021-10-17 10:52:56\",\"message\":\"Your request could not be processed at the moment, please try again later or contact support\",\"path\":\"\\/topups-async\",\"errorCode\":\"REQUEST_PROCESSING_FAILED\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 04:52:55', '2021-10-17 04:52:55'),
(2, 12, 16344513815712, '{\"timeStamp\":\"2021-10-17 10:53:55\",\"message\":\"Your request could not be processed at the moment, please try again later or contact support\",\"path\":\"\\/topups-async\",\"errorCode\":\"REQUEST_PROCESSING_FAILED\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 04:53:54', '2021-10-17 04:53:54'),
(3, 12, 16344513815712, '{\"timeStamp\":\"2021-10-17 10:54:01\",\"message\":\"Your request could not be processed at the moment, please try again later or contact support\",\"path\":\"\\/topups-async\",\"errorCode\":\"REQUEST_PROCESSING_FAILED\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 04:54:00', '2021-10-17 04:54:00'),
(4, 15, 163447478690327003, '{\"timeStamp\":\"2021-10-17 12:48:03\",\"message\":\"Invalid amount provided, the current minimum  amount for this operator is 123.30 NGN\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_AMOUNT\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 06:48:03', '2021-10-17 06:48:03'),
(5, 15, 163447478690328396, '{\"timeStamp\":\"2021-10-17 13:06:50\",\"message\":\"Invalid amount provided, the current minimum  amount for this operator is 123.30 NGN\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_AMOUNT\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 07:06:50', '2021-10-17 07:06:50'),
(6, 16, 163448047642826558, '{\"timeStamp\":\"2021-10-17 14:31:42\",\"message\":\"Invalid amount provided, the current minimum  amount for this operator is 123.30 NGN\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_AMOUNT\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 08:31:42', '2021-10-17 08:31:42'),
(7, 16, 163448047642824315, '{\"timeStamp\":\"2021-10-17 14:37:05\",\"message\":\"Invalid amount provided, the current minimum  amount for this operator is 123.30 NGN\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_AMOUNT\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-17 08:37:04', '2021-10-17 08:37:04'),
(8, 17, 163462290098368152, '{\"timeStamp\":\"2021-10-19 05:57:14\",\"message\":\"Invalid token, are you in production & using a sandbox token or vice-versa?\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_TOKEN\",\"infoLink\":null,\"details\":[]}', 0, '2021-10-19 03:57:15', '2021-10-19 03:57:15'),
(9, 33, 163749854224522065, '{\"timeStamp\":\"2021-11-21 12:44:31\",\"message\":\"Invalid token, are you in production & using a sandbox token or vice-versa?\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_TOKEN\",\"infoLink\":null,\"details\":[]}', 0, '2021-11-21 11:44:31', '2021-11-21 11:44:31'),
(10, 37, 163894191446588485, '{\"timeStamp\":\"2021-12-08 05:40:10\",\"message\":\"Invalid token, are you in production & using a sandbox token or vice-versa?\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_TOKEN\",\"infoLink\":null,\"details\":[]}', 0, '2021-12-08 04:40:13', '2021-12-08 04:40:13'),
(11, 37, 163894191446583827, '{\"timeStamp\":\"2022-03-13 13:13:11\",\"message\":\"Invalid token, are you in production & using a sandbox token or vice-versa?\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_TOKEN\",\"infoLink\":null,\"details\":[]}', 0, '2022-03-13 12:13:11', '2022-03-13 12:13:11'),
(12, 128, 166737376540827279, '{\"timeStamp\":\"2022-11-02 07:24:44\",\"message\":\"Recipient phone number is not valid\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_RECIPIENT_PHONE\",\"infoLink\":null,\"details\":[]}', 0, '2022-11-02 06:24:44', '2022-11-02 06:24:44'),
(13, 165, 167168704530472402, '{\"timeStamp\":\"2022-12-22 05:32:27\",\"message\":\"Recipient phone number is not valid\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_RECIPIENT_PHONE\",\"infoLink\":null,\"details\":[]}', 0, '2022-12-22 04:32:27', '2022-12-22 04:32:27'),
(14, 165, 167168704530474252, '{\"timeStamp\":\"2023-01-17 13:17:04\",\"message\":\"Recipient phone number is not valid\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_RECIPIENT_PHONE\",\"infoLink\":null,\"details\":[]}', 0, '2023-01-17 12:17:04', '2023-01-17 12:17:04'),
(15, 264, 169804909022013104, '{\"timeStamp\":\"2023-10-23 08:19:20\",\"message\":\"Recipient phone number is not valid\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_RECIPIENT_PHONE\",\"infoLink\":null,\"details\":[]}', 0, '2023-10-23 02:19:23', '2023-10-23 02:19:23'),
(16, 265, 169804924987879777, '{\"timeStamp\":\"2023-10-23 08:21:48\",\"message\":\"Recipient phone number is not valid\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_RECIPIENT_PHONE\",\"infoLink\":null,\"details\":[]}', 0, '2023-10-23 02:21:51', '2023-10-23 02:21:51'),
(17, 266, 169804938217127932, '{\"timeStamp\":\"2023-10-23 08:23:58\",\"message\":\"Recipient phone number is not valid\",\"path\":\"\\/topups-async\",\"errorCode\":\"INVALID_RECIPIENT_PHONE\",\"infoLink\":null,\"details\":[]}', 0, '2023-10-23 02:24:01', '2023-10-23 02:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `final_balance` varchar(30) DEFAULT NULL,
  `trx_type` varchar(10) DEFAULT NULL,
  `remarks` varchar(255) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `final_balance`, `trx_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(1, 2, 120.00, 0.50, '120', '+', 'Payment  Via Stripe ', '9CBEUAUDVQOW', '2021-10-04 09:09:43', '2021-10-04 09:09:43'),
(2, 2, 94.84, 15.81, '25.161955718536', '-', 'Send money Invoice: 16336256681872', '9CBEUAUASQOW', '2021-10-07 22:48:49', '2021-10-07 22:48:49'),
(3, 2, 6.32, 0.00, '25.161955718536', '+', 'You got commission from #16336256681872', '5CB4UAUDVQOW', '2021-10-07 22:48:49', '2021-10-07 22:48:49'),
(6, 2, 94.84, 1.00, '0.32195571853649', '-', 'Send money Invoice: 16334317394738', '41AEUAUASQOW', '2021-10-07 22:55:27', '2021-10-07 22:55:27'),
(12, 2, 94.84, 0.00, '94.838044281464', '+', 'Your account has been credited for payout #16336256681872', 'NSM76SRC69XO', '2021-10-08 05:51:29', '2021-10-08 05:51:29'),
(13, 2, 3.16, 0.00, '97.999312424179', '+', 'Your account has been credited profit for payout #16336256681872', 'NSM76SRC69XO', '2021-10-08 05:51:29', '2021-10-08 05:51:29'),
(14, 2, 100.00, 0.00, '197.99999', '+', 'Your account has been credited for payout #264641654165465', 'MN81FOSGG8PQ', '2021-10-08 05:52:53', '2021-10-08 05:52:53'),
(15, 2, 0.00, 0.00, '197.99999', '+', 'Your account has been credited profit for payout #264641654165465', 'MN81FOSGG8PQ', '2021-10-08 05:52:53', '2021-10-08 05:52:53'),
(16, 2, 100.00, 0.00, NULL, '+', 'Add Balance', 'OUURB2DMT378', '2021-10-14 21:29:13', '2021-10-14 21:29:13'),
(17, 2, 94.84, 1.00, '203.16195571854', '-', 'Send money Invoice: 16342692211848', 'VVT3WXAM9EU5', '2021-10-14 23:25:45', '2021-10-14 23:25:45'),
(18, 2, 0.00, 0.00, '203.16195571854', '+', 'You got commission from #16342692211848', 'VVT3WXAM9EU5', '2021-10-14 23:25:45', '2021-10-14 23:25:45'),
(19, 2, 94.84, 0.50, '203.16', '+', 'Payment  Via Stripe ', 'CCOOU9U53BU3', '2021-10-15 02:13:56', '2021-10-15 02:13:56'),
(20, 2, 94.84, 0.50, '203.16', '+', 'Payment  Via Stripe ', '639VQ4JZQT8J', '2021-10-15 02:22:55', '2021-10-15 02:22:55'),
(21, 1, 0.55, 0.50, '0', '+', 'Payment  Via Stripe ', '9B8BDT95B5H2', '2021-10-17 01:24:06', '2021-10-17 01:24:06'),
(22, 1, 1.18, 0.50, '0', '+', 'Payment  Via Stripe ', 'F2U7RVARASRC', '2021-10-17 06:48:03', '2021-10-17 06:48:03'),
(23, 2, 1.41, 1.00, '201.74823529412', '-', 'Send money Invoice: 16344804764282', 'BSQMVC23AAU5', '2021-10-17 08:31:39', '2021-10-17 08:31:39'),
(24, 2, 0.00, 0.00, '201.74823529412', '+', 'You got commission from #16344804764282', 'BSQMVC23AAU5', '2021-10-17 08:31:39', '2021-10-17 08:31:39'),
(25, 1, 59.07, 3.45, '0', '+', 'Payment  Via Flutterwave', '1ZHFMKC3EN2N', '2021-10-19 03:57:16', '2021-10-19 03:57:16'),
(26, 1, 70.88, 4.04, '0', '+', 'Payment  Via Flutterwave', 'HNHMTXQ1YDRC', '2021-10-20 10:57:48', '2021-10-20 10:57:48'),
(27, 3, 118.13, 6.41, '0', '+', 'Payment  Via Flutterwave', 'JR92B3N4T1JU', '2021-10-20 17:04:00', '2021-10-20 17:04:00'),
(28, 1, 200.00, 10.50, '0', '+', 'Payment  Via Flutterwave', 'FSX3YJXA6KOG', '2021-11-21 11:44:32', '2021-11-21 11:44:32'),
(29, 1, 75.81, 4.29, '0', '+', 'Payment  Via Flutterwave', '2H4KFQ4Q5T3A', '2021-12-08 04:40:14', '2021-12-08 04:40:14'),
(30, 1, 34.15, 0.50, '0', '+', 'Payment  Via Stripe ', '6MYQ9M1ZT9U3', '2021-12-13 23:37:11', '2021-12-13 23:37:11'),
(31, 1, 68.30, 3.91, '0', '+', 'Payment  Via Flutterwave', 'D8O5E1OSM4PQ', '2021-12-14 08:32:38', '2021-12-14 08:32:38'),
(32, 3, 91.65, 0.50, '0', '+', 'Payment  Via Stripe ', 'NXCR74GQ2BGS', '2022-03-13 08:04:33', '2022-03-13 08:04:33'),
(33, 3, 9.16, 0.96, '0', '+', 'Payment  Via Flutterwave', 'CJWNKTBWR6J9', '2022-03-13 12:08:09', '2022-03-13 12:08:09'),
(34, 3, 7.34, 0.00, '0', '+', 'Payment  Via Stripe ', 'HYO4Y1BEV69A', '2022-11-02 06:24:44', '2022-11-02 06:24:44'),
(35, 1, 90.74, 0.00, '90.741777925822', '+', 'Your account has been credited for payout #264641654165464', 'OSEVC4RR9A7U', '2022-11-14 08:25:45', '2022-11-14 08:25:45'),
(36, 1, 0.00, 0.00, '90.741777925822', '+', 'Your account has been credited profit for payout #264641654165464', 'OSEVC4RR9A7U', '2022-11-14 08:25:45', '2022-11-14 08:25:45'),
(37, 1, 1000.00, 0.00, '1090.74', '+', 'Payment  Via Stripe ', 'SC21H2PC81YJ', '2022-11-14 08:35:28', '2022-11-14 08:35:28'),
(38, 5, 73.50, 0.00, '0', '+', 'Payment  Via Stripe ', 'UTWJZ8VOW79R', '2022-12-19 15:42:22', '2022-12-19 15:42:22'),
(39, 6, 102.00, 0.00, '0', '+', 'Payment  Via Stripe ', '6RU22T7DW3FF', '2022-12-19 17:31:42', '2022-12-19 17:31:42'),
(40, 2, 73.50, 0.00, '201.75', '+', 'Payment  Via Stripe ', '2PJHGCPDQZSV', '2022-12-19 18:14:11', '2022-12-19 18:14:11'),
(41, 1, 73.50, 0.00, '1164.2376349748', '+', 'Your account has been credited for payout #16714770347571', 'M799NHZK4JA3', '2022-12-19 18:20:03', '2022-12-19 18:20:03'),
(42, 1, 0.03, 0.00, '1164.2693982924', '+', 'Your account has been credited profit for payout #16714770347571', 'M799NHZK4JA3', '2022-12-19 18:20:03', '2022-12-19 18:20:03'),
(43, 1, 1000.00, 0.00, '2164.27', '+', 'Payment  Via Stripe ', '3ZOO5VU9AHV5', '2022-12-20 11:07:17', '2022-12-20 11:07:17'),
(44, 6, 7.35, 0.00, '0', '+', 'Payment  Via Stripe ', 'RSC53XG8R4Q4', '2022-12-21 18:35:12', '2022-12-21 18:35:12'),
(45, 1, 14.41, 1.00, '2149.8586990245', '-', 'Send money Invoice: 16716870453047', '3ZJBDOUMDV43', '2022-12-22 04:32:26', '2022-12-22 04:32:26'),
(46, 1, 0.00, 0.00, '2149.8586990245', '+', 'You got commission from #16716870453047', '3ZJBDOUMDV43', '2022-12-22 04:32:26', '2022-12-22 04:32:26'),
(47, 6, 102.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'JZBQBMSWWXBD', '2022-12-30 08:50:04', '2022-12-30 08:50:04'),
(48, 1, 102.00, 0.00, '2251.86', '+', 'Your account has been credited for payout #16723935396574', 'FYNNGGASNRCH', '2022-12-30 09:18:26', '2022-12-30 09:18:26'),
(49, 1, 0.04, 0.00, '2251.9040811244', '+', 'Your account has been credited profit for payout #16723935396574', 'FYNNGGASNRCH', '2022-12-30 09:18:26', '2022-12-30 09:18:26'),
(50, 1, 10.20, 1.00, '2241.7', '-', 'Send money Invoice: 16738901094812', '6K7SVQXJTCZW', '2023-01-16 16:31:12', '2023-01-16 16:31:12'),
(51, 1, 0.00, 0.00, '2241.7', '+', 'You got commission from #16738901094812', '6K7SVQXJTCZW', '2023-01-16 16:31:12', '2023-01-16 16:31:12'),
(52, 6, 102.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'SKCEMNH6VXRX', '2023-01-22 17:59:27', '2023-01-22 17:59:27'),
(53, 6, 200.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'G2ZHQZSMX6BD', '2023-01-22 18:17:14', '2023-01-22 18:17:14'),
(54, 1, 200.00, 0.00, '2441.7', '+', 'Your account has been credited for payout #16744145384685', '5TARCUAUJ2EC', '2023-01-22 18:19:43', '2023-01-22 18:19:43'),
(55, 1, 0.00, 0.00, '2441.7', '+', 'Your account has been credited profit for payout #16744145384685', '5TARCUAUJ2EC', '2023-01-22 18:19:43', '2023-01-22 18:19:43'),
(56, 6, 121.80, 0.00, '0', '+', 'Payment  Via Stripe ', 'S9M2A11514B5', '2023-02-27 05:56:11', '2023-02-27 05:56:11'),
(57, 6, 102.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'H7Q575K9YRHS', '2023-07-04 11:10:33', '2023-07-04 11:10:33'),
(58, 3, 10.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'XZX47YWZOFUN', '2023-10-23 02:19:25', '2023-10-23 02:19:25'),
(59, 12, 10.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'HYJ5T81H99AP', '2023-10-23 02:21:53', '2023-10-23 02:21:53'),
(60, 12, 400.00, 0.00, '0', '+', 'Payment  Via Stripe ', 'GH2DNKBEZAOV', '2023-10-23 02:24:03', '2023-10-23 02:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `referral_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `balance` double(11,2) NOT NULL DEFAULT 0.00,
  `merchant` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `post_code` varchar(91) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `identity_verify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected',
  `address_verify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected',
  `two_fa` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: two-FA off, 1: two-FA on	',
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: two-FA unverified, 1: two-FA verified	',
  `two_fa_code` varchar(50) DEFAULT NULL,
  `email_verification` tinyint(1) DEFAULT 1,
  `sms_verification` tinyint(1) DEFAULT 1,
  `verify_code` varchar(20) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `referral_id`, `language_id`, `email`, `country_code`, `phone`, `balance`, `merchant`, `image`, `address`, `city`, `post_code`, `state`, `country`, `provider`, `provider_id`, `status`, `identity_verify`, `address_verify`, `two_fa`, `two_fa_verify`, `two_fa_code`, `email_verification`, `sms_verification`, `verify_code`, `sent_at`, `last_login`, `last_login_ip`, `dob`, `password`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'User', 'demouser', NULL, 1, 'augustine@unavisions.com', NULL, '018256830000', 2441.70, 1, '6157ea971f5781633151639.png', '24/A', 'Diana', '216', 'Loss Angels', 'Belgium', NULL, NULL, 1, 2, 2, 0, 1, '172230', 1, 1, '349832', '2022-10-23 07:01:38', '2023-01-22 18:19:14', '176.198.91.115', '2005-01-04', '$2y$10$th3jSt9MMwb3TgEyMVDrQ.BkbaoEJd/h1lPVvbOgEk3Ie8deectuG', NULL, NULL, '2021-09-23 07:34:51', '2023-01-22 18:19:43'),
(2, 'Test', 'User', 'testuser', NULL, 1, 'ahsankk126@gmail.com', NULL, '015425683631', 201.75, 0, '615afa84c83961633352324.jpg', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, 1, 1, NULL, 1, 1, NULL, NULL, '2023-02-27 05:13:11', '103.244.174.16', NULL, '$2y$10$th3jSt9MMwb3TgEyMVDrQ.BkbaoEJd/h1lPVvbOgEk3Ie8deectuG', NULL, 'e0VosFyC6YChGHrvMcSKH5SpozAtMRdd0BOPSxt2FczVRl5QdrBWjbZ6L8pj', '2021-10-03 00:39:07', '2023-02-27 05:13:37'),
(3, 'test', 'yaya', 'tester', NULL, 1, 'austin@detracash.com', NULL, '+49234567890', 0.00, 0, '624d25bb660651649223099.jpg', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, 0, 1, NULL, 1, 1, NULL, NULL, '2023-10-23 02:15:33', '::1', NULL, '$2y$10$3kiFNM.EebFE3EsULqorDOBxmWyxkdgtCn5/L2G0WoqOgg.TevN.u', NULL, NULL, '2021-10-20 16:34:25', '2023-10-23 02:15:33'),
(4, 'MD. ARIFUL', 'ISLAM', 'anikdey', NULL, 1, 'bugfinder.me@gmail.com', NULL, '01825683631', 0.00, 0, NULL, 'North Shibpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, '211799', NULL, '2022-09-22 04:05:19', '::1', NULL, '$2y$10$th3jSt9MMwb3TgEyMVDrQ.BkbaoEJd/h1lPVvbOgEk3Ie8deectuG', NULL, NULL, '2022-09-21 23:15:48', '2022-11-03 07:29:17'),
(5, 'Estelle', 'Nwaboh', 'estelle', NULL, 1, 'estelle.nwaboh@gmail.com', NULL, '01626171', 0.00, 0, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, '265355', '2022-10-31 13:26:05', '2022-12-19 18:00:00', '176.198.88.161', NULL, '$2y$10$th3jSt9MMwb3TgEyMVDrQ.BkbaoEJd/h1lPVvbOgEk3Ie8deectuG', NULL, NULL, '2022-10-23 04:47:20', '2022-12-19 18:00:00'),
(6, 'Austin', 'Nana', 'toloh', NULL, NULL, 'ayazulridoy12@gmail.com', NULL, '0162617130', 0.00, 0, '63af6f9b31db11672441755.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 1, 1, NULL, NULL, '2023-09-01 06:14:19', '127.0.0.1', NULL, '$2y$10$AQUVHt2bfE8RBjsGdRq0x.6./hbigzAFeB4b5qv3V0EioW8qFrv0i', NULL, NULL, '2022-11-04 05:53:12', '2023-09-01 06:14:40'),
(7, 'Abi', 'Abi', 'abio1', NULL, NULL, 'abi@detracash.com', '+1', '12356478', 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, NULL, 1, 1, NULL, NULL, '2023-05-25 01:17:59', '68.126.207.150', NULL, '$2y$10$th3jSt9MMwb3TgEyMVDrQ.BkbaoEJd/h1lPVvbOgEk3Ie8deectuG', NULL, NULL, '2023-05-24 18:41:14', '2023-05-25 01:22:15'),
(10, 'Ayazul', 'Ridoy', 'ridoy1997', NULL, 1, 'ayazulridoy@gmail.com', '+49', '123424', 0.00, 0, NULL, 'sylhet', 'sylhet', '2341', 'sylhet', 'FRANCE', NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2023-09-05 07:37:09', '127.0.0.1', '2023-09-06', '$2y$10$/Gxz8M4psf8etXyVJjstROTBqidprlWz.LtFaUe81p31s2sVnzVn2', NULL, NULL, '2023-09-03 12:35:46', '2023-09-05 07:57:50'),
(11, 'ridoy', 'test', 'ridoyTest', NULL, 1, 'ridoyayazul@gmail.com', '+49', '1234 56', 0.00, 0, NULL, 'sylhet', 'sylhet', '123', 'sylhet', 'FRANCE', NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2023-09-05 02:36:35', '127.0.0.1', NULL, '$2y$10$Iz/Qmf3cl9rEKr2xd4k0FO0.9NvnbaiUpeFMo9dDPtimfJfmvldb6', NULL, NULL, '2023-09-05 02:36:35', '2023-09-05 03:02:05'),
(12, 'Abdulla Muhammed', 'Masum', 'ammasum', NULL, NULL, 'abdullamuhammed76@gmail.com', '+49', '432423432423', 0.00, 0, NULL, NULL, NULL, NULL, NULL, 'CANADA', NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2023-10-23 02:20:14', '::1', NULL, '$2y$10$3kiFNM.EebFE3EsULqorDOBxmWyxkdgtCn5/L2G0WoqOgg.TevN.u', NULL, NULL, '2023-10-09 17:45:43', '2023-10-23 02:20:14'),
(13, 'Jual', 'Ahmed', 'jualahmed', NULL, NULL, 'md.jual.ah@gmail.com', '1784622362', '1784622362', 0.00, 0, NULL, NULL, NULL, NULL, NULL, 'GERMANY', NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2024-01-11 22:05:11', '127.0.0.1', NULL, '$2y$10$LPAM1Xkvcw0IzXaUpMixw.XGSVd/GGLvmpBP0gD.n/89btpcOw1xO', NULL, NULL, '2024-01-08 22:15:07', '2024-01-11 22:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_ip` varchar(30) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `longitude`, `latitude`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-14 21:40:01', '2021-10-14 21:40:01'),
(3, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-15 02:56:57', '2021-10-15 02:56:57'),
(4, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-16 04:00:39', '2021-10-16 04:00:39'),
(6, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-17 01:14:05', '2021-10-17 01:14:05'),
(7, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-17 01:16:40', '2021-10-17 01:16:40'),
(9, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-17 07:29:16', '2021-10-17 07:29:16'),
(11, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-18 03:36:42', '2021-10-18 03:36:42'),
(13, 2, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2021-10-18 04:53:18', '2021-10-18 04:53:18'),
(16, 2, '175.33.69.25', 'Brighton East - - Australia - AU ', 'Chrome', 'Windows 10', '145.0179', '-37.9159', 'Australia', 'AU', '2021-10-19 04:51:55', '2021-10-19 04:51:55'),
(84, 2, '178.203.116.93', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-03-13 08:10:34', '2022-03-13 08:10:34'),
(116, 2, '95.223.88.214', 'Sankt Augustin - - Germany - DE ', 'Chrome', 'Windows 10', '7.197', '50.7754', 'Germany', 'DE', '2022-06-25 10:20:15', '2022-06-25 10:20:15'),
(118, 2, '95.223.88.214', 'Sankt Augustin - - Germany - DE ', 'Chrome', 'Windows 10', '7.197', '50.7754', 'Germany', 'DE', '2022-07-24 06:48:50', '2022-07-24 06:48:50'),
(124, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-08-25 15:11:27', '2022-08-25 15:11:27'),
(125, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-17 04:14:45', '2022-09-17 04:14:45'),
(126, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 09:41:17', '2022-09-18 09:41:17'),
(127, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 10:01:04', '2022-09-18 10:01:04'),
(128, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 10:39:44', '2022-09-18 10:39:44'),
(129, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 10:59:29', '2022-09-18 10:59:29'),
(130, 1, '176.198.89.18', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-18 11:30:37', '2022-09-18 11:30:37'),
(131, 4, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-09-21 23:15:48', '2022-09-21 23:15:48'),
(132, 4, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-09-22 02:44:34', '2022-09-22 02:44:34'),
(133, 4, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-09-22 02:46:35', '2022-09-22 02:46:35'),
(134, 4, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-09-22 03:03:24', '2022-09-22 03:03:24'),
(135, 4, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-09-22 04:01:03', '2022-09-22 04:01:03'),
(136, 4, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2022-09-22 04:05:20', '2022-09-22 04:05:20'),
(137, 1, '46.114.108.253', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-09-22 08:35:47', '2022-09-22 08:35:47'),
(138, 1, '195.227.59.15', 'Neuss - - Germany - DE ', 'Chrome', 'Windows 10', '6.6781', '51.187', 'Germany', 'DE', '2022-09-22 08:37:56', '2022-09-22 08:37:56'),
(139, 1, '195.227.59.15', 'Neuss - - Germany - DE ', 'Chrome', 'Windows 10', '6.6781', '51.187', 'Germany', 'DE', '2022-09-22 08:58:26', '2022-09-22 08:58:26'),
(140, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-22 16:49:49', '2022-09-22 16:49:49'),
(141, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-09-22 17:55:09', '2022-09-22 17:55:09'),
(142, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 05:58:19', '2022-10-01 05:58:19'),
(143, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 06:22:14', '2022-10-01 06:22:14'),
(144, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 06:30:39', '2022-10-01 06:30:39'),
(145, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 06:33:24', '2022-10-01 06:33:24'),
(146, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 07:36:11', '2022-10-01 07:36:11'),
(147, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 07:56:25', '2022-10-01 07:56:25'),
(148, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 08:00:48', '2022-10-01 08:00:48'),
(149, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 08:08:00', '2022-10-01 08:08:00'),
(150, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 08:11:44', '2022-10-01 08:11:44'),
(151, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 08:28:05', '2022-10-01 08:28:05'),
(152, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 08:29:05', '2022-10-01 08:29:05'),
(153, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 09:02:23', '2022-10-01 09:02:23'),
(154, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-01 09:30:04', '2022-10-01 09:30:04'),
(155, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 04:29:39', '2022-10-02 04:29:39'),
(156, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 04:38:57', '2022-10-02 04:38:57'),
(157, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 05:00:30', '2022-10-02 05:00:30'),
(158, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 05:39:03', '2022-10-02 05:39:03'),
(159, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 09:59:28', '2022-10-02 09:59:28'),
(160, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 10:05:24', '2022-10-02 10:05:24'),
(161, 2, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-02 10:06:57', '2022-10-02 10:06:57'),
(162, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-06 10:41:56', '2022-10-06 10:41:56'),
(163, 1, '176.198.91.64', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-10-06 14:47:17', '2022-10-06 14:47:17'),
(164, 5, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 04:47:21', '2022-10-23 04:47:21'),
(165, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 05:01:37', '2022-10-23 05:01:37'),
(166, 5, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 05:05:03', '2022-10-23 05:05:03'),
(167, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 05:09:30', '2022-10-23 05:09:30'),
(168, 5, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-23 16:07:53', '2022-10-23 16:07:53'),
(169, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 13:53:50', '2022-10-30 13:53:50'),
(170, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 14:52:42', '2022-10-30 14:52:42'),
(171, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 17:49:43', '2022-10-30 17:49:43'),
(172, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-30 20:19:08', '2022-10-30 20:19:08'),
(173, 5, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 12:22:51', '2022-10-31 12:22:51'),
(174, 2, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-10-31 12:40:53', '2022-10-31 12:40:53'),
(175, 3, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 20:01:17', '2022-11-01 20:01:17'),
(176, 3, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-01 20:32:16', '2022-11-01 20:32:16'),
(177, 3, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-02 06:22:33', '2022-11-02 06:22:33'),
(178, 3, '46.114.106.237', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-11-03 12:39:21', '2022-11-03 12:39:21'),
(179, 5, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-03 17:17:19', '2022-11-03 17:17:19'),
(180, 3, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-03 17:26:43', '2022-11-03 17:26:43'),
(181, 6, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 05:53:12', '2022-11-04 05:53:12'),
(182, 6, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:25:35', '2022-11-04 16:25:35'),
(183, 6, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:27:34', '2022-11-04 16:27:34'),
(184, 6, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:30:27', '2022-11-04 16:30:27'),
(185, 6, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 16:34:36', '2022-11-04 16:34:36'),
(186, 6, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-04 18:23:25', '2022-11-04 18:23:25'),
(187, 5, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-05 17:19:12', '2022-11-05 17:19:12'),
(188, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-14 13:06:48', '2022-11-14 13:06:48'),
(189, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-14 14:13:52', '2022-11-14 14:13:52'),
(190, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-24 08:29:01', '2022-11-24 08:29:01'),
(191, 1, '176.198.90.122', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4172', '51.1604', 'Germany', 'DE', '2022-11-24 08:53:01', '2022-11-24 08:53:01'),
(192, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-15 10:01:25', '2022-12-15 10:01:25'),
(193, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-15 10:05:04', '2022-12-15 10:05:04'),
(194, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-15 10:07:37', '2022-12-15 10:07:37'),
(195, 1, '46.114.107.22', 'Cologne - - Germany - DE ', 'Handheld Browser', 'Android', '7.0121', '50.9549', 'Germany', 'DE', '2022-12-15 13:45:02', '2022-12-15 13:45:02'),
(196, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-15 19:33:55', '2022-12-15 19:33:55'),
(197, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-16 04:36:20', '2022-12-16 04:36:20'),
(198, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-19 08:44:17', '2022-12-19 08:44:17'),
(199, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-19 12:38:15', '2022-12-19 12:38:15'),
(200, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 15:32:28', '2022-12-19 15:32:28'),
(201, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 15:34:11', '2022-12-19 15:34:11'),
(202, 5, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 15:35:59', '2022-12-19 15:35:59'),
(203, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 17:20:47', '2022-12-19 17:20:47'),
(204, 5, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 18:00:00', '2022-12-19 18:00:00'),
(205, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 18:18:16', '2022-12-19 18:18:16'),
(206, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 18:33:00', '2022-12-19 18:33:00'),
(207, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-19 18:50:10', '2022-12-19 18:50:10'),
(208, 1, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-20 10:54:48', '2022-12-20 10:54:48'),
(209, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Handheld Browser', 'Android', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-20 11:11:40', '2022-12-20 11:11:40'),
(210, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-20 11:54:19', '2022-12-20 11:54:19'),
(211, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-20 13:01:52', '2022-12-20 13:01:52'),
(212, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-21 05:25:55', '2022-12-21 05:25:55'),
(213, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 05:51:48', '2022-12-21 05:51:48'),
(214, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-21 15:34:04', '2022-12-21 15:34:04'),
(215, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 17:46:03', '2022-12-21 17:46:03'),
(216, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-21 18:19:48', '2022-12-21 18:19:48'),
(217, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 04:29:42', '2022-12-22 04:29:42'),
(218, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-22 04:30:25', '2022-12-22 04:30:25'),
(219, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2022-12-22 04:33:08', '2022-12-22 04:33:08'),
(220, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 04:51:55', '2022-12-22 04:51:55'),
(221, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 05:00:14', '2022-12-22 05:00:14'),
(222, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 05:27:10', '2022-12-22 05:27:10'),
(223, 6, '176.198.88.161', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2022-12-22 15:35:48', '2022-12-22 15:35:48'),
(224, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-16 05:55:29', '2023-01-16 05:55:29'),
(225, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-16 06:08:19', '2023-01-16 06:08:19'),
(226, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 14:07:17', '2023-01-16 14:07:17'),
(227, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 15:35:45', '2023-01-16 15:35:45'),
(228, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-16 16:04:29', '2023-01-16 16:04:29'),
(229, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-18 04:37:26', '2023-01-18 04:37:26'),
(230, 6, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-18 04:45:05', '2023-01-18 04:45:05'),
(231, 1, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-18 04:46:50', '2023-01-18 04:46:50'),
(232, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 7', '67.0657', '24.9207', 'Pakistan', 'PK', '2023-01-18 04:52:46', '2023-01-18 04:52:46'),
(233, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-18 16:45:11', '2023-01-18 16:45:11'),
(234, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-18 17:40:24', '2023-01-18 17:40:24'),
(235, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-18 17:44:36', '2023-01-18 17:44:36'),
(236, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-20 21:13:51', '2023-01-20 21:13:51'),
(237, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 12:29:08', '2023-01-21 12:29:08'),
(238, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 13:37:20', '2023-01-21 13:37:20'),
(239, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 13:53:38', '2023-01-21 13:53:38'),
(240, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-21 13:55:06', '2023-01-21 13:55:06'),
(241, 6, '90.129.226.226', 'Lindome - - Sweden - SE ', 'Chrome', 'Windows 10', '12.1', '57.5667', 'Sweden', 'SE', '2023-01-22 17:52:30', '2023-01-22 17:52:30'),
(242, 1, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 18:19:14', '2023-01-22 18:19:14'),
(243, 6, '90.129.226.226', 'Lindome - - Sweden - SE ', 'Chrome', 'Windows 10', '12.1', '57.5667', 'Sweden', 'SE', '2023-01-22 18:53:18', '2023-01-22 18:53:18'),
(244, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4346', '51.1804', 'Germany', 'DE', '2023-01-22 19:59:36', '2023-01-22 19:59:36'),
(245, 6, '2.247.242.134', ' - - Germany - DE ', 'Handheld Browser', 'Android', '8.6837', '50.1169', 'Germany', 'DE', '2023-01-26 09:33:59', '2023-01-26 09:33:59'),
(246, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-01-26 10:52:28', '2023-01-26 10:52:28'),
(247, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-17 09:21:20', '2023-02-17 09:21:20'),
(248, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-17 11:24:23', '2023-02-17 11:24:23'),
(249, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-17 15:05:13', '2023-02-17 15:05:13'),
(250, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 19:12:53', '2023-02-20 19:12:53'),
(251, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-20 20:20:13', '2023-02-20 20:20:13'),
(252, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-27 04:46:47', '2023-02-27 04:46:47'),
(253, 2, '103.244.174.16', 'Karachi - - Pakistan - PK ', 'Chrome', 'Windows 10', '66.9983', '24.8591', 'Pakistan', 'PK', '2023-02-27 05:13:11', '2023-02-27 05:13:11'),
(254, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 05:17:13', '2023-02-27 05:17:13'),
(255, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 05:52:02', '2023-02-27 05:52:02'),
(256, 6, '176.198.91.115', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-02-27 06:27:53', '2023-02-27 06:27:53'),
(257, 6, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-14 05:15:41', '2023-03-14 05:15:41'),
(258, 6, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-03-19 06:26:24', '2023-03-19 06:26:24'),
(259, 6, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-05 02:59:13', '2023-04-05 02:59:13'),
(260, 6, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 05:31:19', '2023-04-10 05:31:19'),
(261, 6, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-10 10:30:56', '2023-04-10 10:30:56'),
(262, 6, '176.198.90.83', 'Mönchengladbach - - Germany - DE ', 'Chrome', 'Windows 10', '6.4271', '51.1997', 'Germany', 'DE', '2023-04-11 04:26:14', '2023-04-11 04:26:14'),
(263, 7, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-24 18:41:14', '2023-05-24 18:41:14'),
(264, 7, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-24 18:44:54', '2023-05-24 18:44:54'),
(265, 7, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-24 18:46:53', '2023-05-24 18:46:53'),
(266, 7, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-24 18:47:54', '2023-05-24 18:47:54'),
(267, 7, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-24 18:52:05', '2023-05-24 18:52:05'),
(268, 7, '68.126.207.150', 'Cumming - - United States - US ', 'Chrome', 'Windows 10', '-84.1031', '34.2037', 'United States', 'US', '2023-05-25 01:17:59', '2023-05-25 01:17:59'),
(269, 6, '5.147.189.30', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-05-25 03:24:20', '2023-05-25 03:24:20'),
(270, 6, '5.147.189.98', 'Viersen - - Germany - DE ', 'Chrome', 'Windows 10', '6.3643', '51.2498', 'Germany', 'DE', '2023-07-04 11:04:01', '2023-07-04 11:04:01'),
(271, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-24 23:38:45', '2023-08-24 23:38:45'),
(272, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-24 23:45:19', '2023-08-24 23:45:19'),
(273, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-25 02:50:44', '2023-08-25 02:50:44'),
(274, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-30 11:54:53', '2023-08-30 11:54:53'),
(275, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 12:39:50', '2023-08-31 12:39:50'),
(276, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 13:38:10', '2023-08-31 13:38:10'),
(277, 8, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 14:04:46', '2023-08-31 14:04:46'),
(278, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 14:06:57', '2023-08-31 14:06:57'),
(279, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-08-31 23:31:16', '2023-08-31 23:31:16'),
(280, 9, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-01 05:46:37', '2023-09-01 05:46:37'),
(281, 6, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-09-01 06:14:19', '2023-09-01 06:14:19'),
(282, 10, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-03 12:35:47', '2023-09-03 12:35:47'),
(283, 10, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 02:25:12', '2023-09-05 02:25:12'),
(284, 11, '127.0.0.1', ' -  -  - ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 02:36:36', '2023-09-05 02:36:36'),
(285, 10, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 06:29:47', '2023-09-05 06:29:47'),
(286, 10, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 07:25:14', '2023-09-05 07:25:14'),
(287, 10, '127.0.0.1', ' - -  -  ', 'Chrome', 'Linux', '', '', '', '', '2023-09-05 07:37:09', '2023-09-05 07:37:09'),
(288, 12, '::1', ' -  -  - ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-09 17:45:43', '2023-10-09 17:45:43'),
(289, 12, '::1', ' - -  -  ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-14 20:08:02', '2023-10-14 20:08:02'),
(290, 12, '::1', ' - -  -  ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-22 10:37:41', '2023-10-22 10:37:41'),
(291, 3, '::1', ' - -  -  ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-23 02:15:33', '2023-10-23 02:15:33'),
(292, 12, '::1', ' - -  -  ', 'Chrome', 'Mac OS X', '', '', '', '', '2023-10-23 02:20:14', '2023-10-23 02:20:14'),
(293, 13, '127.0.0.1', ' -  -  - ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-08 22:15:07', '2024-01-08 22:15:07'),
(294, 13, '127.0.0.1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-09 01:32:39', '2024-01-09 01:32:39'),
(295, 13, '127.0.0.1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-10 14:16:08', '2024-01-10 14:16:08'),
(296, 13, '127.0.0.1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-10 22:17:37', '2024-01-10 22:17:37'),
(297, 13, '127.0.0.1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-11 11:16:15', '2024-01-11 11:16:15'),
(298, 13, '127.0.0.1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2024-01-11 22:05:11', '2024-01-11 22:05:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_notifications`
--
ALTER TABLE `chat_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configures`
--
ALTER TABLE `configures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_media`
--
ALTER TABLE `content_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_langs`
--
ALTER TABLE `country_langs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `country_services`
--
ALTER TABLE `country_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_service_charges`
--
ALTER TABLE `country_service_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flutter_transactions`
--
ALTER TABLE `flutter_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identify_forms`
--
ALTER TABLE `identify_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notify_templates`
--
ALTER TABLE `notify_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sending_purposes`
--
ALTER TABLE `sending_purposes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_money`
--
ALTER TABLE `send_money`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceinfos`
--
ALTER TABLE `serviceinfos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_notifications`
--
ALTER TABLE `site_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_controls`
--
ALTER TABLE `sms_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source_funds`
--
ALTER TABLE `source_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_media`
--
ALTER TABLE `template_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_up_logs`
--
ALTER TABLE `top_up_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chat_notifications`
--
ALTER TABLE `chat_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `configures`
--
ALTER TABLE `configures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=364;

--
-- AUTO_INCREMENT for table `content_media`
--
ALTER TABLE `content_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `country_langs`
--
ALTER TABLE `country_langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `country_services`
--
ALTER TABLE `country_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=685;

--
-- AUTO_INCREMENT for table `country_service_charges`
--
ALTER TABLE `country_service_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flutter_transactions`
--
ALTER TABLE `flutter_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `identify_forms`
--
ALTER TABLE `identify_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `notify_templates`
--
ALTER TABLE `notify_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sending_purposes`
--
ALTER TABLE `sending_purposes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `send_money`
--
ALTER TABLE `send_money`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `serviceinfos`
--
ALTER TABLE `serviceinfos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `site_notifications`
--
ALTER TABLE `site_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `sms_controls`
--
ALTER TABLE `sms_controls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `source_funds`
--
ALTER TABLE `source_funds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `template_media`
--
ALTER TABLE `template_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `top_up_logs`
--
ALTER TABLE `top_up_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
