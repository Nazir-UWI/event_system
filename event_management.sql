-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: database_service:3306
-- Generation Time: Mar 10, 2025 at 01:14 AM
-- Server version: 9.2.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`, `start_date`, `end_date`, `location`, `price`, `created_by`) VALUES
(1, 'Event 1', '2025-04-01', '2025-04-02', 'New York', 50.00, 'testuser23@example.com'),
(2, 'Event 2', '2025-04-03', '2025-04-04', 'Los Angeles', 75.00, 'testuser45@example.com'),
(3, 'Event 3', '2025-04-05', '2025-04-06', 'Chicago', 30.00, 'testuser12@example.com'),
(4, 'Event 4', '2025-04-07', '2025-04-08', 'Houston', 90.00, 'testuser88@example.com'),
(5, 'Event 5', '2025-04-09', '2025-04-10', 'San Francisco', 120.00, 'testuser67@example.com'),
(6, 'Event 6', '2025-04-11', '2025-04-12', 'Miami', 55.00, 'testuser34@example.com'),
(7, 'Event 7', '2025-04-13', '2025-04-14', 'Seattle', 65.00, 'testuser78@example.com'),
(8, 'Event 8', '2025-04-15', '2025-04-16', 'Boston', 45.00, 'testuser5@example.com'),
(9, 'Event 9', '2025-04-17', '2025-04-18', 'Las Vegas', 80.00, 'testuser91@example.com'),
(10, 'Event 10', '2025-04-19', '2025-04-20', 'Denver', 40.00, 'testuser32@example.com'),
(11, 'Event 11', '2025-04-21', '2025-04-22', 'Atlanta', 70.00, 'testuser10@example.com'),
(12, 'Event 12', '2025-04-23', '2025-04-24', 'Dallas', 95.00, 'testuser56@example.com'),
(13, 'Event 13', '2025-04-25', '2025-04-26', 'Orlando', 85.00, 'testuser81@example.com'),
(14, 'Event 14', '2025-04-27', '2025-04-28', 'Phoenix', 60.00, 'testuser14@example.com'),
(15, 'Event 15', '2025-04-29', '2025-04-30', 'San Diego', 110.00, 'testuser99@example.com'),
(16, 'Event 16', '2025-05-01', '2025-05-02', 'Philadelphia', 35.00, 'testuser28@example.com'),
(17, 'Event 17', '2025-05-03', '2025-05-04', 'Minneapolis', 50.00, 'testuser36@example.com'),
(18, 'Event 18', '2025-05-05', '2025-05-06', 'Portland', 55.00, 'testuser74@example.com'),
(19, 'Event 19', '2025-05-07', '2025-05-08', 'Austin', 95.00, 'testuser9@example.com'),
(20, 'Event 20', '2025-05-09', '2025-05-10', 'Charlotte', 120.00, 'testuser63@example.com'),
(21, 'Event 21', '2025-05-11', '2025-05-12', 'Detroit', 70.00, 'testuser47@example.com'),
(22, 'Event 22', '2025-05-13', '2025-05-14', 'Nashville', 85.00, 'testuser50@example.com'),
(23, 'Event 23', '2025-05-15', '2025-05-16', 'Kansas City', 75.00, 'testuser80@example.com'),
(24, 'Event 24', '2025-05-17', '2025-05-18', 'Indianapolis', 65.00, 'testuser55@example.com'),
(25, 'Event 25', '2025-05-19', '2025-05-20', 'San Antonio', 100.00, 'testuser7@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `api_key` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `auth_flag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `api_key`, `auth_flag`) VALUES
(1, 'testuser1@example.com', '$2y$10$6JayRyvzbiqUPYpM6W3Bm.ttQNcAbN6nzjmYHgz4UilHRBJeELdYC', '362-b8b5-6c4', 0),
(2, 'testuser2@example.com', '$2y$10$ngXVA9p5HhoT6tYh/iLgg.g6GWuwMJ8Mleg5wxppw7hSB55OhS.na', '776-712c-4b5', 0),
(3, 'testuser3@example.com', '$2y$10$XYMIKke4eT7FjHC7BDE4HOZW1KDANcRDQmIVtOCxZQk7Avpl98aeC', '517-d0bb-406', 0),
(4, 'testuser4@example.com', '$2y$10$fJoL.ihJbYPyBsnhn9w8g.lSbW6Bhhu8B3.yI1mu.YJ5j6kfJABo2', '96f-995b-13e', 0),
(5, 'testuser5@example.com', '$2y$10$8EJlUMlZTDsND/HUsdfv7e7xDbYG4Hv5JAMbSVSUPWbGch6IIbRFm', 'a20-d511-221', 0),
(6, 'testuser6@example.com', '$2y$10$35sWdHDsnSjtApz5crpZkunPrsAjBkj.lGqSsLyVSbZJEbumLzsvW', 'c6e-b357-c08', 0),
(7, 'testuser7@example.com', '$2y$10$cb6q3RdF6cfEnuDPaBBF5uCtueJAxLCvqWSVl8Qg6YzYAm2.olZA2', '719-3aba-efc', 0),
(8, 'testuser8@example.com', '$2y$10$DRs907oGjzw2HayH/jAsQ.k.nA8dDENPTSNVoUE.Tqr6eSrXiFIGy', '8ce-e287-a2c', 0),
(9, 'testuser9@example.com', '$2y$10$BFQciC2MkdlsL8LyrBB3ZeQwY1b4VR21WWnOQLesCtTkoVsmVYIqe', '280-5b56-815', 0),
(10, 'testuser10@example.com', '$2y$10$izitAtCN.HOgALApELHEvuGp77O4TjPN5vbmJYOs05JnuMU8IjjsG', 'fc6-b0a1-886', 0),
(11, 'testuser11@example.com', '$2y$10$qq2i8oCVSKTM5qc1gwrsBO7ZjJLJWrHTAMi6nftsJBhYHX./Tj.d6', 'de2-f687-641', 0),
(12, 'testuser12@example.com', '$2y$10$nznTm.bITta8io1cLos1OuWzWt4RiPD/kMCp9zSfEQ6HTWIvqVLp.', 'cd8-5fb9-09f', 0),
(13, 'testuser13@example.com', '$2y$10$pvti/aKE82z8NG/LtGLY4.uEj149k9dwv5qApQo.rkm3QmfoDjGjG', 'c34-c28a-8b7', 0),
(14, 'testuser14@example.com', '$2y$10$HyAf0TzgucBo.LPEIP7EluK9ikKoogNcNJpZhwAidEcRP1MbOq81e', '8e9-6933-aec', 0),
(15, 'testuser15@example.com', '$2y$10$rTB5nyrpbUxbD/nLQHDRM.nZCEdHpKK086VPQxsg/0xKLPwdzw4Vm', 'c32-7c09-c88', 0),
(16, 'testuser16@example.com', '$2y$10$KpmDIp9y1FWOCSV4/oGi7uoRDYWRSTmjGNCF.4OR8H.TYJX5rwb5y', '80f-5bf0-872', 0),
(17, 'testuser17@example.com', '$2y$10$trNpUkpvYQQEV/isvY4gkuMZOkMGM94Ke.trHBCseezCRjEZb.hBy', 'a80-1f88-7f8', 0),
(18, 'testuser18@example.com', '$2y$10$3IMMMFfvulequ9WtTlcKw.bvyEmZoUcAMZz9CdctF/DJy/bPzkZra', '639-b5b6-28b', 0),
(19, 'testuser19@example.com', '$2y$10$ujeFNIVxnFwCLxnauabbs.OtgljkcTHOpjJtB8EylzlkSYrR4I76C', '932-30e3-bc1', 0),
(20, 'testuser20@example.com', '$2y$10$BK.6JXC1vtIPpAhJ9OR5TO21r2hI/BTCtd7pERxC/.0g/PJycc6mu', '8b4-bd14-007', 0),
(21, 'testuser21@example.com', '$2y$10$Oba1jAjFXX3SBsqC2QdOnOY4BgOXwVuNvhY1M0M.Zjz1OHjpec0n6', '9b1-225f-127', 0),
(22, 'testuser22@example.com', '$2y$10$pDA9.K5nS.b38V2A/kMis.vD5nQDJKfGBnz/2huLcMKrJmuLrOL6i', '754-69bb-8aa', 0),
(23, 'testuser23@example.com', '$2y$10$j0x43kbD.VTLcfO3OtcffuvgSC0QAVLBYD1ciRXoHDXkEHWcCXx6q', 'ed9-2cc2-811', 0),
(24, 'testuser24@example.com', '$2y$10$DWR2ZEK.g4Ia7eQnH1kcYeqcIVtV6G2FiWYRSAVvFrcUmkznX3pSm', '892-6059-5bd', 0),
(25, 'testuser25@example.com', '$2y$10$Q4LsWFxxtmyr98gEesVtyuAqlBvZJhlUv8kB4PJKFAD0lLEiyZcLu', 'cd3-9a11-967', 0),
(26, 'testuser26@example.com', '$2y$10$rH4GDRcaxhEdU.NrV9Rb3.IkiqR/IaFyTua8FacsVAEi2.tu03oKy', 'd7b-7902-9dd', 0),
(27, 'testuser27@example.com', '$2y$10$B49dwD0aM52.E7UK5q1AvuGeRolKYYFr.9XCVvXOa1UDGDAQAVQua', '8b8-80ce-a4a', 0),
(28, 'testuser28@example.com', '$2y$10$ACMZi/LR542Gr3slAzfPrugbDslWEXlxrFOHfHtMLNh07x/4ItAtK', '4f6-97d8-4a7', 0),
(29, 'testuser29@example.com', '$2y$10$hDumHz6GFi5CAkPgT6.UrezE4qqd9KDIWU6PmaJLbJfdgBTgg57qK', '3d6-220f-ed7', 0),
(30, 'testuser30@example.com', '$2y$10$0nv2of.wM9V8cIYY1JmSruDXyN1cqLP9QHVUesvkXQgrYQ2EBv0kO', 'aa0-b081-5a8', 0),
(31, 'testuser31@example.com', '$2y$10$iK6500sS1aTwFgBKiaD27.Mq/LN8mUpVbbnryhthsB4iQblUyjsD6', '667-faa1-892', 0),
(32, 'testuser32@example.com', '$2y$10$ehwkJg0hA8I0ILk4Pwlsu.ySpcm1YT25Tlc22uEmfj3/9kHfwYWEK', 'a40-14f2-255', 0),
(33, 'testuser33@example.com', '$2y$10$FSGtjtUpzhth5nB7.1jY.eNS3TufnOkhY7N3fOzRa/FLvGZJPkTr6', 'bbb-eae3-9b2', 0),
(34, 'testuser34@example.com', '$2y$10$h1I0HP06G1x0XG8MqpTh1.FFW.0WyMlXyedBndncPAfKu2Gydhd9K', '761-dbae-bea', 0),
(35, 'testuser35@example.com', '$2y$10$pBAysvS02Rcgl2JO7mieBOPOZchZggu6mKfDMsA2bFyfghbG2DoyS', 'b5c-2968-c4d', 0),
(36, 'testuser36@example.com', '$2y$10$7ij4c18Oh8jOnZ9YQU2iYeZtiA5AanZO43kzeib8zt/LMv3Maxq1.', '76f-4f62-9be', 0),
(37, 'testuser37@example.com', '$2y$10$03zZQNxDhcvvl2k1e3fvGeqi8vh7mCD/svzE9W7Jvj7oMVlPgtxCq', 'ab8-dec2-869', 0),
(38, 'testuser38@example.com', '$2y$10$Uvpdr.w9.8WCeCko3NvhaemHfaxOWJ41mQVA.tWrP2npiEC95V3ii', 'fcd-f02e-6a1', 0),
(39, 'testuser39@example.com', '$2y$10$CKVfJFQaAm/6AyFoHEloUegXxyN9FZYI4R/SmyXwRKsfW4RujqKIu', '3af-c4b6-1ea', 0),
(40, 'testuser40@example.com', '$2y$10$rW5.WPm0nFxoUadM0/Ybb.yn/uPZPD8anqAYxTsncFiGjJ6fL.VB6', '5fc-885c-d22', 0),
(41, 'testuser41@example.com', '$2y$10$s43xynlhE2oBJucYJCjewuM1JMvGsajNS619gblVqNgkPfc2fv98u', '506-c3ff-a55', 0),
(42, 'testuser42@example.com', '$2y$10$HYie7qelViUJRrOBF3O8Iuu.bz/.t.n7AtxNDorkUUYxIFoLllCMG', '92d-876a-45b', 0),
(43, 'testuser43@example.com', '$2y$10$A8MiiDxny0bABTR4PbyYGuJ/MwB61SfvXqFuLWL/8Kv7y0cO6tumC', '8b0-6d19-c8d', 0),
(44, 'testuser44@example.com', '$2y$10$nv4k9nQ0o3j13m.sLOQkJ.fQUcVmaxTzU6rFKrIba47IWhovo/.aS', '821-0437-619', 0),
(45, 'testuser45@example.com', '$2y$10$APgbrAW7XrQ8grneR6stj.o96vXwAnlbQX6FbtDMIDjaYR4Mu6/H6', 'd0c-d590-1d1', 0),
(46, 'testuser46@example.com', '$2y$10$J.2rKrTeOTdT4tQF.pluB.yGTHRSbaEj5CIZIYZYZvBrQCiO9COn2', 'ceb-5b1f-342', 0),
(47, 'testuser47@example.com', '$2y$10$iXmyr5ZIAaEUU5/1tQy/rOPmw2uT3coQB.BsrATQGoVzPxA./NeaK', '490-5e2c-ba6', 0),
(48, 'testuser48@example.com', '$2y$10$M3IqzO.RQ/H4YrFaLc4ziONCIxHyXFYVf7ereXx8GwmYBGoyR.rWu', '6b3-01cd-854', 0),
(49, 'testuser49@example.com', '$2y$10$nCpX7u/F0ZkbrPz55KCcb.JpveVeIj58WY6APlQFVFnb8m/1wmPwK', 'e5e-a0c0-f56', 0),
(50, 'testuser50@example.com', '$2y$10$fsiYgGaHJkAJxe/40QhlQu9zXGLWqiDDamsEcoll4r5L7x2iYMHQi', 'c54-2ac4-ede', 0),
(51, 'testuser51@example.com', '$2y$10$/kNodH76NN6k0Cn.4NVs7eLyw5FCo178xddYXK1AVk5jvzSQrkT1C', 'a57-c66a-810', 0),
(52, 'testuser52@example.com', '$2y$10$sTwBwUsWdOpQ//8.FDUhLu5MwtEBEqmj4rzIh9Im0bMLHZqrvLK3i', '19f-453f-6d2', 0),
(53, 'testuser53@example.com', '$2y$10$XVUfDBCIZw9f.ax/xaoLI.r.OAFGuDi/Y1XOa4io/huhI2mJVk21q', '584-7d7a-5b6', 0),
(54, 'testuser54@example.com', '$2y$10$U9OCHsX4s2W.LQamMzeLQ..kR7GftyHHFmd2D3uFScrwI5eGW8QNS', '11f-179e-006', 0),
(55, 'testuser55@example.com', '$2y$10$z3aLCYfG9mIHVhhgZhZZPuuHE8Li1kHUkElzm2.7AKixmz.9xTbV2', 'dae-6c81-732', 0),
(56, 'testuser56@example.com', '$2y$10$oURqZpT.emTJVd8W5l388eFCDJzaiQh1tBnbPK5UGFSc2EdGDQ3VO', '3fa-d6a2-273', 0),
(57, 'testuser57@example.com', '$2y$10$sQJJ4V5DL6P4QAGHjdkNquNfSt34JM68bKvgZHKqAqfu0wQZP45He', '356-6d03-732', 0),
(58, 'testuser58@example.com', '$2y$10$MbprBKTA2fZ18wKetxtJ2.k81s.gHHbBcr4CBryzidweS1sdi9Eui', 'ca1-9572-e4e', 0),
(59, 'testuser59@example.com', '$2y$10$xtH8E1dg.ipBY2ijVHUVyOrm1e762T50kUTjpieJjjlNhJncx2Sz2', '660-b56e-892', 0),
(60, 'testuser60@example.com', '$2y$10$dsJ.vQQ5ye7/.WMeH7G81u4p7cSMMiW/tD4ZH1AhPN6pwUUi0jqaS', 'aa6-df65-3ce', 0),
(61, 'testuser61@example.com', '$2y$10$ilcbGafKtC.dO7hV2SUpu.GUgT1TeTeGPlly1IoeD6MrlBkvFQ8Oi', '25c-eba9-c98', 0),
(62, 'testuser62@example.com', '$2y$10$r7HPLPHwAddNCE37iztpYeNag9VdH9TWDfYkak9kSygRB363D.WXi', 'd84-61ad-83d', 0),
(63, 'testuser63@example.com', '$2y$10$nyGOQ39jWNu9ecC5tmO9/O/2Ay6p/IwSkQaTnzf7DuIf1vkibnD6y', 'e3c-b799-fb9', 0),
(64, 'testuser64@example.com', '$2y$10$QVkQJzCrCKLPOVDZa9NEC.7cxjBuD9OAqw4aon4XweWu6Mhtg3yHm', '00e-838b-382', 0),
(65, 'testuser65@example.com', '$2y$10$l4HkwFYLPM7wwtRdH3eAY.Xhfup/6LOlrP57rGHB4Iw.b6B958b/u', '531-d5d7-388', 0),
(66, 'testuser66@example.com', '$2y$10$p80FN6etXRJB9or4XjPFTOivNVLc4qllPS7Wv149zAnE154vG4kxy', 'a42-a2ef-c02', 0),
(67, 'testuser67@example.com', '$2y$10$apvfvt1zipvkxx2oWtMd9eDEsNc44TYeZxUS0OLpshQjcAw4pfKlK', '708-4252-55e', 0),
(68, 'testuser68@example.com', '$2y$10$yJmkuMsKM88zXGjlkDYjjOoWQjkU6k7axRf8zc0.vu79E9GrGYEdm', 'fed-6f6f-e6f', 0),
(69, 'testuser69@example.com', '$2y$10$L0bL7Uw.jvuJVnIfALzJRuw6vO/RjvOAOZDVPo2VfZoNvMvPe.Lu2', '282-cd84-adb', 0),
(70, 'testuser70@example.com', '$2y$10$9Y2qc.PXj.idfAxrqFxyG.FOMSg2c/JcRNTGBxRSNKEBqbyn/Qc4G', '406-3292-c75', 0),
(71, 'testuser71@example.com', '$2y$10$bl9fM9PrW03Ge2vM91UMW.baBiPzlTgyw0WGR8LrfLO5GOVE5k612', 'ba2-8631-d0c', 0),
(72, 'testuser72@example.com', '$2y$10$fwyRuH8b7W23DkRGy/1RpegsZcNe4GiIsvxCqGY2Qs1gXbL1H1N1q', '04e-3909-2ee', 0),
(73, 'testuser73@example.com', '$2y$10$.5ukRaDetjOtf6GoozWpRu27bV1rRD0XpV26485QTNeiEj4U4ZdAW', '8e6-4063-4a1', 0),
(74, 'testuser74@example.com', '$2y$10$Kz9R4OwpSFdzNMdOdlJUeuPpXjauC2BNSseEA8Ypl8qs3.fKUC.HC', 'eaa-c120-719', 0),
(75, 'testuser75@example.com', '$2y$10$OF8KijpI8HX9EJ6OtGtANOnvPbAHde55/RHx62A/GLvn3FRitelpO', '1d9-5675-2e1', 0),
(76, 'testuser76@example.com', '$2y$10$xK7znNlN19ZSL2gqFB5YVuMcVZwJHYtmDfrRYOgeIVOO8zK9H3NBu', 'f15-ecf9-e5f', 0),
(77, 'testuser77@example.com', '$2y$10$sgqexn9.ASk.tRTFWURwpOAeIfZ1Jf3FXFhn7PEkzeDgNVA47k9cC', 'a8e-7425-37c', 0),
(78, 'testuser78@example.com', '$2y$10$v/vn7tsqmmypkWFwI1r6ou3M6KcneHy9.Dwb23.0/63er1nPrrdGW', 'd1b-8ade-d50', 0),
(79, 'testuser79@example.com', '$2y$10$KiR1oQeqO7r8UzRaoSWVzeIzX2QWHpN/xwItWB9NWSCJ.vZE1jmvK', '24c-9db2-ad2', 0),
(80, 'testuser80@example.com', '$2y$10$eP8W/mMCYqxqgi.rkv9Fq.dsGf.SHKQtdZo3HlxiyV5MAQlgFCvIu', 'aff-5677-cef', 0),
(81, 'testuser81@example.com', '$2y$10$IQBfCK4MmudHgPk/vOExI.1rF7PCZ.Y7b3umAJ.OZ7LWJuohlq..G', '976-98f7-ba6', 0),
(82, 'testuser82@example.com', '$2y$10$CqE.P9IKT4kRw3HObf5UXuNdB.Wrz6pPp6FqHiAAE5YVzJRmN3HZC', 'f97-9766-1fb', 0),
(83, 'testuser83@example.com', '$2y$10$Vz5m3bTKMPSL30rtvlnOd.GXpAEW70imBCVLDAIPLk9mQKQq7ddcG', '700-94ef-650', 0),
(84, 'testuser84@example.com', '$2y$10$n409arPATVGPxdd19SyMKeOMB8zmEyEzq0OnETvzt4CXWgMdXhu4K', 'b4a-b5df-ec5', 0),
(85, 'testuser85@example.com', '$2y$10$pu0wOIOE5mnAWYNW03RadOQtDmPtPUxeJIJXuTovFrQMfm47huUju', 'cac-3da9-158', 0),
(86, 'testuser86@example.com', '$2y$10$S5AsV9UVZQE8cUdN0tX96.YI6gjfxg3rwuI7sRTN7aPQDYYtQ2y/C', 'b01-d413-6bc', 0),
(87, 'testuser87@example.com', '$2y$10$IJLuau6EXCzZlS1HILxbOuG7Jotbon0cc.tRQw3Rgtk84MwOPT1Fe', '7ca-b6fb-c8b', 0),
(88, 'testuser88@example.com', '$2y$10$nrhzBRDhWjy8skymwKJdLu.5KIcU88J8T4QH5t.qgbFUW11vLjrTm', 'd66-f2af-b94', 0),
(89, 'testuser89@example.com', '$2y$10$zxP/5pSuqMjTOCY2MK218erzFdZI0Zh7nJPeH9.85Fdg9vexo/Y4q', '982-b0cd-0a3', 0),
(90, 'testuser90@example.com', '$2y$10$OxHyBWkeDRicO.xk7d3oJujxz8cx.Rc9y/AeotczaqGtCh0gFw.rO', '7d2-afc7-ee8', 0),
(91, 'testuser91@example.com', '$2y$10$yqIt3j8R8pW2GGnlNNPtsOPIgFvKgC6KHOAyMQTnWYa8Zjut1RAv2', '72b-b54d-d08', 0),
(92, 'testuser92@example.com', '$2y$10$dRCb.Y7s8m7Yn0XpejyRZuYk2M2CSuscFzdy.0i.5G/y0XZtPPjDq', '20f-9b50-180', 0),
(93, 'testuser93@example.com', '$2y$10$dNJTqPdQhKoNyLHwKuY54e4bpnLdgl97m63VCWyuUOX7HEGNvKayi', 'a8b-cac7-6e0', 0),
(94, 'testuser94@example.com', '$2y$10$Y.B9DsWfyPiJy37el50PEOmn3YTP3pTZF/xGZU4rdoglDS3mTC0Cu', '1ba-d7c4-c6b', 0),
(95, 'testuser95@example.com', '$2y$10$Pi1zecCyO7i/MQ.OsH5IJ.qrLWxk4Lrnr82xHR3tprirayEIPuXzm', 'a44-28bb-16f', 0),
(96, 'testuser96@example.com', '$2y$10$95WR38BXEp1kW4uRV6cg5.HsToMTkURp16xvM.oZ0H0kFIbAs4x3y', 'fec-6c59-bbd', 0),
(97, 'testuser97@example.com', '$2y$10$ZfTuFNPthTwAqRqwYtz7u.08E7OvA/d./Ily0M8k9j1lEjKjt3KwC', '573-e43e-091', 0),
(98, 'testuser98@example.com', '$2y$10$72nBueBS8waVWFObT09Kk.AuAg2djZukgWFE10pOu17Aa3rZaLP8q', '684-eb29-7e7', 0),
(99, 'testuser99@example.com', '$2y$10$0samGiwncDJLNfm6KQdVkuxQMOXVT3vQtBUL0U3AcWSXZnE1V6utm', '907-9259-597', 0),
(100, 'testuser100@example.com', '$2y$10$fj9tndTCvLPk6n1AeWFl..loC.wWwMgLJiGyvkQ.Gs.qjlHMinkTy', '8ff-8bc7-8e3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_event_registration`
--

CREATE TABLE `user_event_registration` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_event_registration`
--

INSERT INTO `user_event_registration` (`user_id`, `event_id`) VALUES
(1, 1),
(6, 1),
(26, 1),
(31, 1),
(51, 1),
(56, 1),
(1, 2),
(7, 2),
(27, 2),
(32, 2),
(52, 2),
(61, 2),
(1, 3),
(8, 3),
(28, 3),
(33, 3),
(53, 3),
(66, 3),
(1, 4),
(9, 4),
(29, 4),
(34, 4),
(54, 4),
(71, 4),
(1, 5),
(10, 5),
(30, 5),
(35, 5),
(51, 5),
(55, 5),
(1, 6),
(11, 6),
(31, 6),
(36, 6),
(56, 6),
(57, 6),
(1, 7),
(12, 7),
(32, 7),
(37, 7),
(57, 7),
(62, 7),
(1, 8),
(13, 8),
(33, 8),
(38, 8),
(58, 8),
(67, 8),
(1, 9),
(14, 9),
(34, 9),
(39, 9),
(59, 9),
(72, 9),
(1, 10),
(2, 10),
(15, 10),
(35, 10),
(40, 10),
(52, 10),
(60, 10),
(1, 11),
(16, 11),
(36, 11),
(41, 11),
(58, 11),
(61, 11),
(1, 12),
(17, 12),
(37, 12),
(42, 12),
(62, 12),
(63, 12),
(1, 13),
(18, 13),
(38, 13),
(43, 13),
(63, 13),
(68, 13),
(1, 14),
(19, 14),
(39, 14),
(44, 14),
(64, 14),
(73, 14),
(1, 15),
(3, 15),
(20, 15),
(40, 15),
(45, 15),
(53, 15),
(65, 15),
(1, 16),
(21, 16),
(41, 16),
(46, 16),
(59, 16),
(66, 16),
(1, 17),
(22, 17),
(42, 17),
(47, 17),
(64, 17),
(67, 17),
(1, 18),
(23, 18),
(43, 18),
(48, 18),
(68, 18),
(69, 18),
(1, 19),
(24, 19),
(44, 19),
(49, 19),
(69, 19),
(74, 19),
(1, 20),
(4, 20),
(25, 20),
(45, 20),
(50, 20),
(54, 20),
(70, 20),
(1, 21),
(26, 21),
(46, 21),
(60, 21),
(71, 21),
(1, 22),
(27, 22),
(47, 22),
(65, 22),
(72, 22),
(1, 23),
(28, 23),
(48, 23),
(70, 23),
(73, 23),
(1, 24),
(29, 24),
(49, 24),
(74, 24),
(75, 24),
(1, 25),
(5, 25),
(30, 25),
(50, 25),
(55, 25),
(75, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `api_key` (`api_key`);

--
-- Indexes for table `user_event_registration`
--
ALTER TABLE `user_event_registration`
  ADD PRIMARY KEY (`user_id`,`event_id`),
  ADD KEY `fk_event` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_event_registration`
--
ALTER TABLE `user_event_registration`
  ADD CONSTRAINT `fk_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
