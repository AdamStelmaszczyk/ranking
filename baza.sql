-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 22, 2014 at 02:36 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a3575285_ranking`
--

-- --------------------------------------------------------

--
-- Table structure for table `gracze`
--

CREATE TABLE `gracze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(64) NOT NULL,
  `nazwisko` varchar(64) NOT NULL,
  `punkty` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nazwisko` (`nazwisko`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `gracze`
--

INSERT INTO `gracze` VALUES(1, 'Adam', 'Stelmaszczyk', 990);
INSERT INTO `gracze` VALUES(2, 'MichaÅ‚', 'Karpiuk', 1076);
INSERT INTO `gracze` VALUES(3, 'PaweÅ‚', 'Baranik', 932);
INSERT INTO `gracze` VALUES(4, 'RadosÅ‚aw', 'Pietkiewicz', 1055);
INSERT INTO `gracze` VALUES(5, 'Mateusz', 'Matuszewski', 1222);
INSERT INTO `gracze` VALUES(6, 'Adam', 'Grodecki', 997);
INSERT INTO `gracze` VALUES(21, 'Krzysztof', 'Sukienniczak', 962);
INSERT INTO `gracze` VALUES(8, 'Konrad', 'GÃ³recki', 860);
INSERT INTO `gracze` VALUES(9, 'JÄ™drzej', 'Modzelewski', 920);
INSERT INTO `gracze` VALUES(10, 'Tomasz', 'Adamiec', 1098);
INSERT INTO `gracze` VALUES(11, 'Jakub', 'Wnuk', 933);
INSERT INTO `gracze` VALUES(12, 'Roman', 'Niewczas', 1116);
INSERT INTO `gracze` VALUES(13, 'Krzysztof', 'Fudali', 981);
INSERT INTO `gracze` VALUES(14, 'Robert', 'Piasecki', 1006);
INSERT INTO `gracze` VALUES(15, 'Jacek', 'MaÅ‚olepszy', 890);
INSERT INTO `gracze` VALUES(16, 'Sylwester', 'StÄ™pieÅ„', 936);
INSERT INTO `gracze` VALUES(17, 'Karol', 'Redosz', 1132);
INSERT INTO `gracze` VALUES(18, 'Hubert', 'Balsam', 1063);
INSERT INTO `gracze` VALUES(19, 'PaweÅ‚', 'Garal', 1021);
INSERT INTO `gracze` VALUES(20, 'Karol', 'Tarasiuk', 864);
INSERT INTO `gracze` VALUES(22, 'Wojciech', 'Åobacz', 1085);
INSERT INTO `gracze` VALUES(23, 'Jacek', 'Brzeski', 1085);
INSERT INTO `gracze` VALUES(24, 'Cezary', 'Szczegielniak', 975);
INSERT INTO `gracze` VALUES(25, 'Maciej', 'Karas', 980);
INSERT INTO `gracze` VALUES(26, 'PaweÅ‚', 'Zalewski', 1029);
INSERT INTO `gracze` VALUES(27, 'Adam', 'KrÃ³lewski', 1199);
INSERT INTO `gracze` VALUES(28, 'Åukasz', 'GugaÅ‚a', 782);
INSERT INTO `gracze` VALUES(29, 'Wojciech', 'KobyliÅ„ski', 1103);
INSERT INTO `gracze` VALUES(30, 'Szymon', 'Mamczur', 858);
INSERT INTO `gracze` VALUES(31, 'Bartosz', 'StrzaÅ‚ka', 885);
INSERT INTO `gracze` VALUES(32, 'BartÅ‚omiej', 'ZalewskiB', 930);
INSERT INTO `gracze` VALUES(33, 'Joanna', 'Usidus', 1000);
INSERT INTO `gracze` VALUES(34, 'Dorota', 'WÃ³jtowicz', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `mecze`
--

CREATE TABLE `mecze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a` varchar(64) NOT NULL,
  `b` varchar(64) DEFAULT NULL,
  `c` varchar(64) NOT NULL,
  `d` varchar(64) DEFAULT NULL,
  `cd` int(11) NOT NULL,
  `delta` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=260 ;

--
-- Dumping data for table `mecze`
--

INSERT INTO `mecze` VALUES(1, 'Karpiuk', 'Stelmaszczyk', 'Adamiec', 'GÃ³recki', 5, 25, '2014-06-20 04:39:37');
INSERT INTO `mecze` VALUES(2, 'Adamiec', 'Stelmaszczyk', 'GÃ³recki', 'Karpiuk', 8, 17, '2014-06-20 04:43:42');
INSERT INTO `mecze` VALUES(3, 'Stelmaszczyk', NULL, 'Adamiec', NULL, 2, 29, '2014-06-20 08:53:11');
INSERT INTO `mecze` VALUES(4, 'Fudali', 'Niewczas', 'Karpiuk', 'Stelmaszczyk', 5, 27, '2014-06-20 11:01:31');
INSERT INTO `mecze` VALUES(5, 'Modzelewski', NULL, 'Wnuk', NULL, 5, 25, '2014-06-22 22:32:49');
INSERT INTO `mecze` VALUES(6, 'Wnuk', NULL, 'Modzelewski', NULL, 9, 11, '2014-06-22 22:33:11');
INSERT INTO `mecze` VALUES(7, 'Modzelewski', NULL, 'Wnuk', NULL, 9, 2, '2014-06-22 22:33:19');
INSERT INTO `mecze` VALUES(8, 'Wnuk', NULL, 'Modzelewski', NULL, 6, 24, '2014-06-23 00:58:55');
INSERT INTO `mecze` VALUES(9, 'Modzelewski', NULL, 'Wnuk', NULL, 3, 37, '2014-06-23 00:59:04');
INSERT INTO `mecze` VALUES(10, 'Wnuk', NULL, 'Modzelewski', NULL, 3, 42, '2014-06-23 00:59:21');
INSERT INTO `mecze` VALUES(23, 'Balsam', 'Matuszewski', 'Modzelewski', 'Wnuk', 0, 39, '2014-06-23 03:17:47');
INSERT INTO `mecze` VALUES(22, 'Balsam', 'Matuszewski', 'Modzelewski', 'Wnuk', 4, 24, '2014-06-23 03:17:40');
INSERT INTO `mecze` VALUES(21, 'Adamiec', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 6, 19, '2014-06-23 02:44:03');
INSERT INTO `mecze` VALUES(20, 'Adamiec', NULL, 'Karpiuk', NULL, 1, 48, '2014-06-23 02:11:58');
INSERT INTO `mecze` VALUES(19, 'Karpiuk', NULL, 'Adamiec', NULL, 9, 2, '2014-06-23 02:11:47');
INSERT INTO `mecze` VALUES(24, 'Wnuk', NULL, 'Modzelewski', NULL, 5, 22, '2014-06-23 03:18:13');
INSERT INTO `mecze` VALUES(25, 'Wnuk', NULL, 'Modzelewski', NULL, 1, 37, '2014-06-23 03:18:20');
INSERT INTO `mecze` VALUES(26, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 6, 0, '2014-06-23 05:23:02');
INSERT INTO `mecze` VALUES(27, 'Adamiec', 'MaÅ‚olepszy', 'GÃ³recki', 'Wnuk', 9, 0, '2014-06-24 00:25:20');
INSERT INTO `mecze` VALUES(28, 'Redosz', 'StÄ™pieÅ„', 'Adamiec', 'MaÅ‚olepszy', 9, 11, '2014-06-24 00:25:42');
INSERT INTO `mecze` VALUES(29, 'Adamiec', 'MaÅ‚olepszy', 'Garal', 'Redosz', 8, 7, '2014-06-24 23:18:53');
INSERT INTO `mecze` VALUES(30, 'Adamiec', 'MaÅ‚olepszy', 'Garal', 'Redosz', 7, 11, '2014-06-24 23:19:42');
INSERT INTO `mecze` VALUES(31, 'Adamiec', 'Karpiuk', 'GÃ³recki', 'Stelmaszczyk', 5, 29, '2014-06-25 01:20:30');
INSERT INTO `mecze` VALUES(32, 'Adamiec', 'Karpiuk', 'GÃ³recki', 'Stelmaszczyk', 6, 17, '2014-06-25 01:30:10');
INSERT INTO `mecze` VALUES(33, 'Adamiec', 'Modzelewski', 'Stelmaszczyk', 'Tarasiuk', 8, 21, '2014-06-25 02:13:32');
INSERT INTO `mecze` VALUES(34, 'Adamiec', NULL, 'Karpiuk', NULL, 9, 0, '2014-06-25 04:10:06');
INSERT INTO `mecze` VALUES(35, 'Adamiec', NULL, 'Matuszewski', NULL, 3, 29, '2014-06-25 04:36:11');
INSERT INTO `mecze` VALUES(36, 'Adamiec', NULL, 'Matuszewski', NULL, 3, 22, '2014-06-25 04:36:18');
INSERT INTO `mecze` VALUES(37, 'Stelmaszczyk', NULL, 'Adamiec', NULL, 9, 15, '2014-06-25 05:19:10');
INSERT INTO `mecze` VALUES(38, 'Stelmaszczyk', NULL, 'Baranik', NULL, 6, 9, '2014-06-26 00:32:13');
INSERT INTO `mecze` VALUES(39, 'Stelmaszczyk', NULL, 'Baranik', NULL, 5, 12, '2014-06-26 00:32:54');
INSERT INTO `mecze` VALUES(40, 'Adamiec', 'Matuszewski', 'Fudali', 'Stelmaszczyk', 2, 38, '2014-06-26 03:15:35');
INSERT INTO `mecze` VALUES(41, 'Adamiec', 'Matuszewski', 'Fudali', 'Stelmaszczyk', 7, 4, '2014-06-26 03:15:47');
INSERT INTO `mecze` VALUES(42, 'Adamiec', 'Matuszewski', 'Fudali', 'Stelmaszczyk', 2, 28, '2014-06-26 03:15:55');
INSERT INTO `mecze` VALUES(43, 'Matuszewski', 'MaÅ‚olepszy', 'GÃ³recki', 'Stelmaszczyk', 9, 0, '2014-06-26 04:32:16');
INSERT INTO `mecze` VALUES(44, 'GÃ³recki', 'Stelmaszczyk', 'Matuszewski', 'MaÅ‚olepszy', 5, 35, '2014-06-26 04:32:30');
INSERT INTO `mecze` VALUES(45, 'Matuszewski', 'MaÅ‚olepszy', 'GÃ³recki', 'Stelmaszczyk', 3, 33, '2014-06-26 04:33:22');
INSERT INTO `mecze` VALUES(46, 'Matuszewski', 'MaÅ‚olepszy', 'Adamiec', 'GÃ³recki', 5, 25, '2014-06-26 23:00:27');
INSERT INTO `mecze` VALUES(47, 'Adamiec', 'MaÅ‚olepszy', 'GÃ³recki', 'Matuszewski', 8, 0, '2014-06-26 23:00:54');
INSERT INTO `mecze` VALUES(48, 'Adamiec', 'Matuszewski', 'GÃ³recki', 'MaÅ‚olepszy', 0, 29, '2014-06-27 01:28:02');
INSERT INTO `mecze` VALUES(59, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 3, 29, '2014-06-27 03:39:46');
INSERT INTO `mecze` VALUES(60, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 9, 0, '2014-06-27 03:40:31');
INSERT INTO `mecze` VALUES(61, 'GÃ³recki', 'Matuszewski', 'Adamiec', 'MaÅ‚olepszy', 3, 53, '2014-06-27 05:28:25');
INSERT INTO `mecze` VALUES(62, 'Adamiec', NULL, 'Karpiuk', NULL, 1, 22, '2014-06-27 05:54:26');
INSERT INTO `mecze` VALUES(63, 'Adamiec', 'Karpiuk', 'GÃ³recki', 'Matuszewski', 8, 4, '2014-06-27 05:54:50');
INSERT INTO `mecze` VALUES(64, 'MaÅ‚olepszy', 'Modzelewski', 'GÃ³recki', 'Stelmaszczyk', 5, 33, '2014-06-29 21:47:26');
INSERT INTO `mecze` VALUES(65, 'Adamiec', 'GÃ³recki', 'Modzelewski', 'Wnuk', 8, 0, '2014-06-30 01:32:34');
INSERT INTO `mecze` VALUES(66, 'GÃ³recki', 'Matuszewski', 'Adamiec', 'MaÅ‚olepszy', 8, 23, '2014-06-30 03:40:01');
INSERT INTO `mecze` VALUES(67, 'GÃ³recki', 'Matuszewski', 'Adamiec', 'MaÅ‚olepszy', 6, 27, '2014-06-30 03:40:07');
INSERT INTO `mecze` VALUES(68, 'Stelmaszczyk', NULL, 'Wnuk', NULL, 8, 0, '2014-06-30 05:25:15');
INSERT INTO `mecze` VALUES(69, 'Stelmaszczyk', NULL, 'Wnuk', NULL, 5, 15, '2014-06-30 05:25:44');
INSERT INTO `mecze` VALUES(70, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 5, 13, '2014-07-01 00:09:37');
INSERT INTO `mecze` VALUES(71, 'Redosz', 'StÄ™pieÅ„', 'Tarasiuk', 'Wnuk', 0, 47, '2014-07-01 01:51:43');
INSERT INTO `mecze` VALUES(72, 'Adamiec', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 7, 11, '2014-07-01 01:52:06');
INSERT INTO `mecze` VALUES(73, 'Adamiec', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 7, 8, '2014-07-01 01:52:09');
INSERT INTO `mecze` VALUES(74, 'Karpiuk', 'Stelmaszczyk', 'GÃ³recki', 'Matuszewski', 3, 41, '2014-07-01 02:40:46');
INSERT INTO `mecze` VALUES(75, 'Karpiuk', 'Stelmaszczyk', 'GÃ³recki', 'Matuszewski', 4, 26, '2014-07-01 02:41:01');
INSERT INTO `mecze` VALUES(76, 'Stelmaszczyk', NULL, 'Matuszewski', NULL, 7, 15, '2014-07-01 02:41:43');
INSERT INTO `mecze` VALUES(77, 'Stelmaszczyk', NULL, 'Adamiec', NULL, 4, 33, '2014-07-01 04:04:47');
INSERT INTO `mecze` VALUES(78, 'Adamiec', NULL, 'Stelmaszczyk', NULL, 9, 9, '2014-07-01 04:04:58');
INSERT INTO `mecze` VALUES(79, 'GÃ³recki', 'Matuszewski', 'Adamiec', 'MaÅ‚olepszy', 6, 31, '2014-07-01 23:03:31');
INSERT INTO `mecze` VALUES(80, 'GÃ³recki', 'Matuszewski', 'Adamiec', 'MaÅ‚olepszy', 7, 19, '2014-07-01 23:03:40');
INSERT INTO `mecze` VALUES(81, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 3, 16, '2014-07-02 00:47:19');
INSERT INTO `mecze` VALUES(82, 'Redosz', 'StÄ™pieÅ„', 'Adamiec', 'MaÅ‚olepszy', 5, 27, '2014-07-02 03:16:43');
INSERT INTO `mecze` VALUES(83, 'Redosz', 'StÄ™pieÅ„', 'Adamiec', 'MaÅ‚olepszy', 6, 16, '2014-07-02 03:16:53');
INSERT INTO `mecze` VALUES(84, 'Adamiec', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 6, 28, '2014-07-02 03:17:05');
INSERT INTO `mecze` VALUES(85, 'Garal', 'Zalewski', 'Redosz', 'StÄ™pieÅ„', 5, 29, '2014-07-02 04:48:47');
INSERT INTO `mecze` VALUES(86, 'Karpiuk', 'Stelmaszczyk', 'Modzelewski', 'Wnuk', 1, 23, '2014-07-02 05:32:49');
INSERT INTO `mecze` VALUES(87, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 2, 18, '2014-07-02 05:34:12');
INSERT INTO `mecze` VALUES(88, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 3, 10, '2014-07-02 05:34:36');
INSERT INTO `mecze` VALUES(89, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 7, 0, '2014-07-02 05:36:27');
INSERT INTO `mecze` VALUES(90, 'Karpiuk', NULL, 'Stelmaszczyk', NULL, 6, 47, '2014-07-02 05:36:46');
INSERT INTO `mecze` VALUES(91, 'Garal', 'KrÃ³lewski', 'Redosz', 'StÄ™pieÅ„', 8, 9, '2014-07-03 01:29:41');
INSERT INTO `mecze` VALUES(92, 'Karpiuk', NULL, 'Stelmaszczyk', NULL, 5, 43, '2014-07-23 05:34:56');
INSERT INTO `mecze` VALUES(93, 'Brzeski', 'Stelmaszczyk', 'Karpiuk', 'Szczegielniak', 9, 0, '2014-07-23 05:36:16');
INSERT INTO `mecze` VALUES(94, 'Brzeski', 'Stelmaszczyk', 'Karpiuk', 'Szczegielniak', 4, 25, '2014-07-23 05:36:41');
INSERT INTO `mecze` VALUES(95, 'Redosz', 'StÄ™pieÅ„', 'GugaÅ‚a', 'MaÅ‚olepszy', 5, 22, '2014-07-23 23:54:26');
INSERT INTO `mecze` VALUES(96, 'Redosz', 'StÄ™pieÅ„', 'GugaÅ‚a', 'MaÅ‚olepszy', 0, 42, '2014-07-23 23:54:37');
INSERT INTO `mecze` VALUES(97, 'Grodecki', 'Stelmaszczyk', 'Fudali', 'Matuszewski', 6, 18, '2014-07-25 00:22:55');
INSERT INTO `mecze` VALUES(98, 'Piasecki', 'Stelmaszczyk', 'Fudali', NULL, 5, 6, '2014-07-25 00:56:55');
INSERT INTO `mecze` VALUES(99, 'Stelmaszczyk', NULL, 'KobyliÅ„ski', NULL, 5, 3, '2014-07-25 03:17:28');
INSERT INTO `mecze` VALUES(100, 'Stelmaszczyk', NULL, 'Fudali', NULL, 3, 6, '2014-07-25 03:34:10');
INSERT INTO `mecze` VALUES(101, 'Stelmaszczyk', NULL, 'Fudali', NULL, 0, 20, '2014-07-25 03:34:15');
INSERT INTO `mecze` VALUES(102, 'Grodecki', 'Stelmaszczyk', 'KobyliÅ„ski', 'StÄ™pieÅ„', 8, 0, '2014-07-25 04:41:12');
INSERT INTO `mecze` VALUES(103, 'KobyliÅ„ski', 'Matuszewski', 'Grodecki', 'StÄ™pieÅ„', 9, 0, '2014-07-25 05:01:47');
INSERT INTO `mecze` VALUES(104, 'KobyliÅ„ski', 'Matuszewski', 'Grodecki', 'StÄ™pieÅ„', 6, 14, '2014-07-25 05:01:56');
INSERT INTO `mecze` VALUES(105, 'Redosz', 'StÄ™pieÅ„', 'GugaÅ‚a', 'MaÅ‚olepszy', 5, 9, '2014-07-28 04:05:44');
INSERT INTO `mecze` VALUES(106, 'MaÅ‚olepszy', 'StÄ™pieÅ„', 'GugaÅ‚a', 'Redosz', 6, 24, '2014-07-28 04:06:04');
INSERT INTO `mecze` VALUES(107, 'Karpiuk', 'Stelmaszczyk', 'Grodecki', 'Matuszewski', 8, 2, '2014-07-28 05:43:16');
INSERT INTO `mecze` VALUES(108, 'Karpiuk', 'Stelmaszczyk', 'Grodecki', 'Matuszewski', 9, 0, '2014-07-28 05:43:39');
INSERT INTO `mecze` VALUES(109, 'KrÃ³lewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 0, 62, '2014-07-28 21:57:33');
INSERT INTO `mecze` VALUES(110, 'KrÃ³lewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 3, 33, '2014-07-28 21:57:47');
INSERT INTO `mecze` VALUES(111, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 7, 0, '2014-07-29 05:54:06');
INSERT INTO `mecze` VALUES(112, 'Redosz', 'StÄ™pieÅ„', 'GÃ³recki', 'MaÅ‚olepszy', 5, 22, '2014-07-30 00:29:31');
INSERT INTO `mecze` VALUES(113, 'Redosz', 'StÄ™pieÅ„', 'GÃ³recki', 'MaÅ‚olepszy', 3, 27, '2014-07-30 00:29:40');
INSERT INTO `mecze` VALUES(114, 'Matuszewski', 'Stelmaszczyk', 'Fudali', 'Grodecki', 5, 0, '2014-07-30 05:27:06');
INSERT INTO `mecze` VALUES(115, 'Redosz', 'StÄ™pieÅ„', 'Adamiec', 'MaÅ‚olepszy', 4, 30, '2014-07-31 23:20:07');
INSERT INTO `mecze` VALUES(116, 'Adamiec', 'MaÅ‚olepszy', 'KrÃ³lewski', 'StÄ™pieÅ„', 6, 32, '2014-07-31 23:20:30');
INSERT INTO `mecze` VALUES(117, 'Fudali', 'Stelmaszczyk', 'Niewczas', 'Sukienniczak', 9, 0, '2014-08-01 03:24:02');
INSERT INTO `mecze` VALUES(118, 'Niewczas', 'Sukienniczak', 'Fudali', 'Stelmaszczyk', 4, 36, '2014-08-01 03:24:37');
INSERT INTO `mecze` VALUES(119, 'Niewczas', 'Sukienniczak', 'Fudali', 'Stelmaszczyk', 7, 12, '2014-08-01 03:24:45');
INSERT INTO `mecze` VALUES(120, 'Stelmaszczyk', NULL, 'Grodecki', NULL, 7, 0, '2014-08-01 03:56:32');
INSERT INTO `mecze` VALUES(121, 'Garal', 'KrÃ³lewski', 'KobyliÅ„ski', 'Redosz', 4, 26, '2014-08-03 23:00:53');
INSERT INTO `mecze` VALUES(122, 'KobyliÅ„ski', 'Redosz', 'Garal', 'KrÃ³lewski', 4, 40, '2014-08-03 23:01:00');
INSERT INTO `mecze` VALUES(123, 'KobyliÅ„ski', 'Redosz', 'Garal', 'KrÃ³lewski', 5, 26, '2014-08-03 23:01:04');
INSERT INTO `mecze` VALUES(125, 'Matuszewski', 'Sukienniczak', 'Pietkiewicz', 'Stelmaszczyk', 6, 18, '2014-08-04 04:40:35');
INSERT INTO `mecze` VALUES(126, 'Pietkiewicz', 'Stelmaszczyk', 'Matuszewski', 'Sukienniczak', 8, 16, '2014-08-04 04:40:49');
INSERT INTO `mecze` VALUES(127, 'Matuszewski', 'Sukienniczak', 'Pietkiewicz', 'Stelmaszczyk', 4, 28, '2014-08-04 04:41:35');
INSERT INTO `mecze` VALUES(128, 'Stelmaszczyk', NULL, 'Fudali', NULL, 5, 0, '2014-08-04 05:21:36');
INSERT INTO `mecze` VALUES(132, 'KobyliÅ„ski', 'KrÃ³lewski', 'Redosz', 'StÄ™pieÅ„', 6, 20, '2014-08-04 23:40:52');
INSERT INTO `mecze` VALUES(130, 'Fudali', 'Wnuk', 'Stelmaszczyk', NULL, 8, 40, '2014-08-04 05:23:32');
INSERT INTO `mecze` VALUES(131, 'Matuszewski', 'Stelmaszczyk', 'Fudali', 'Wnuk', 3, 8, '2014-08-04 05:24:13');
INSERT INTO `mecze` VALUES(133, 'KobyliÅ„ski', 'KrÃ³lewski', 'Redosz', 'StÄ™pieÅ„', 3, 30, '2014-08-04 23:41:02');
INSERT INTO `mecze` VALUES(134, 'Grodecki', NULL, 'Stelmaszczyk', NULL, 5, 41, '2014-08-05 02:12:04');
INSERT INTO `mecze` VALUES(135, 'Matuszewski', 'Stelmaszczyk', 'Pietkiewicz', 'Tarasiuk', 3, 14, '2014-08-05 02:48:39');
INSERT INTO `mecze` VALUES(136, 'Matuszewski', 'Pietkiewicz', 'Stelmaszczyk', 'Tarasiuk', 4, 21, '2014-08-05 02:49:06');
INSERT INTO `mecze` VALUES(137, 'Pietkiewicz', 'Stelmaszczyk', 'Matuszewski', 'Tarasiuk', 9, 10, '2014-08-05 02:49:34');
INSERT INTO `mecze` VALUES(138, 'KobyliÅ„ski', 'KrÃ³lewski', 'Redosz', 'StÄ™pieÅ„', 2, 29, '2014-08-05 04:07:55');
INSERT INTO `mecze` VALUES(139, 'KobyliÅ„ski', 'KrÃ³lewski', 'Redosz', 'StÄ™pieÅ„', 9, 0, '2014-08-05 04:08:00');
INSERT INTO `mecze` VALUES(140, 'Stelmaszczyk', NULL, 'Pietkiewicz', NULL, 4, 19, '2014-08-05 05:37:37');
INSERT INTO `mecze` VALUES(141, 'Stelmaszczyk', NULL, 'Pietkiewicz', NULL, 7, 0, '2014-08-05 05:37:45');
INSERT INTO `mecze` VALUES(142, 'Matuszewski', 'Pietkiewicz', 'Grodecki', 'Sukienniczak', 2, 34, '2014-08-05 06:03:53');
INSERT INTO `mecze` VALUES(143, 'Grodecki', 'Sukienniczak', 'Matuszewski', 'Pietkiewicz', 6, 34, '2014-08-05 06:04:18');
INSERT INTO `mecze` VALUES(144, 'Matuszewski', 'Pietkiewicz', 'Grodecki', 'Sukienniczak', 4, 24, '2014-08-05 06:04:32');
INSERT INTO `mecze` VALUES(145, 'Fudali', NULL, 'Stelmaszczyk', NULL, 8, 34, '2014-08-05 23:53:52');
INSERT INTO `mecze` VALUES(146, 'Fudali', NULL, 'Stelmaszczyk', NULL, 6, 38, '2014-08-05 23:53:58');
INSERT INTO `mecze` VALUES(147, 'KrÃ³lewski', 'Redosz', 'GugaÅ‚a', 'StÄ™pieÅ„', 5, 12, '2014-08-06 01:08:47');
INSERT INTO `mecze` VALUES(148, 'GugaÅ‚a', 'StÄ™pieÅ„', 'KrÃ³lewski', 'Redosz', 8, 25, '2014-08-06 01:08:57');
INSERT INTO `mecze` VALUES(149, 'KrÃ³lewski', 'Redosz', 'GugaÅ‚a', 'StÄ™pieÅ„', 2, 30, '2014-08-06 01:09:11');
INSERT INTO `mecze` VALUES(150, 'Stelmaszczyk', NULL, 'Fudali', NULL, 3, 25, '2014-08-06 01:55:33');
INSERT INTO `mecze` VALUES(151, 'Mamczur', 'Stelmaszczyk', 'Fudali', 'Åobacz', 8, 2, '2014-08-06 01:55:51');
INSERT INTO `mecze` VALUES(152, 'Matuszewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 7, 1, '2014-08-06 04:52:37');
INSERT INTO `mecze` VALUES(153, 'Redosz', 'StÄ™pieÅ„', 'Matuszewski', 'MaÅ‚olepszy', 7, 30, '2014-08-06 04:54:39');
INSERT INTO `mecze` VALUES(154, 'Matuszewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 5, 17, '2014-08-06 04:55:12');
INSERT INTO `mecze` VALUES(155, 'Stelmaszczyk', NULL, 'Fudali', NULL, 8, 0, '2014-08-06 05:13:31');
INSERT INTO `mecze` VALUES(156, 'KrÃ³lewski', 'Redosz', 'GugaÅ‚a', 'StÄ™pieÅ„', 2, 24, '2014-08-06 22:15:47');
INSERT INTO `mecze` VALUES(157, 'GugaÅ‚a', 'StÄ™pieÅ„', 'KrÃ³lewski', 'Redosz', 6, 41, '2014-08-06 22:16:01');
INSERT INTO `mecze` VALUES(158, 'KrÃ³lewski', 'Redosz', 'GugaÅ‚a', 'StÄ™pieÅ„', 4, 17, '2014-08-06 22:16:10');
INSERT INTO `mecze` VALUES(159, 'KobyliÅ„ski', 'Åobacz', 'Redosz', 'StÄ™pieÅ„', 4, 20, '2014-08-07 01:24:54');
INSERT INTO `mecze` VALUES(160, 'KobyliÅ„ski', 'Åobacz', 'Redosz', 'StÄ™pieÅ„', 6, 6, '2014-08-07 01:24:58');
INSERT INTO `mecze` VALUES(161, 'KrÃ³lewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 6, 12, '2014-08-07 02:52:32');
INSERT INTO `mecze` VALUES(162, 'KrÃ³lewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 4, 19, '2014-08-07 02:52:38');
INSERT INTO `mecze` VALUES(163, 'KrÃ³lewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 3, 20, '2014-08-07 02:52:47');
INSERT INTO `mecze` VALUES(164, 'Brzeski', 'MaÅ‚olepszy', 'GugaÅ‚a', 'Matuszewski', 2, 48, '2014-08-07 06:02:18');
INSERT INTO `mecze` VALUES(165, 'GugaÅ‚a', 'Matuszewski', 'Brzeski', 'MaÅ‚olepszy', 7, 18, '2014-08-07 06:02:53');
INSERT INTO `mecze` VALUES(166, 'GugaÅ‚a', 'Matuszewski', 'Brzeski', 'Mamczur', 7, 14, '2014-08-07 06:10:55');
INSERT INTO `mecze` VALUES(167, 'Redosz', 'StÄ™pieÅ„', 'KobyliÅ„ski', 'Åobacz', 9, 26, '2014-08-07 23:51:31');
INSERT INTO `mecze` VALUES(168, 'KobyliÅ„ski', 'Åobacz', 'Redosz', 'StÄ™pieÅ„', 0, 34, '2014-08-07 23:51:36');
INSERT INTO `mecze` VALUES(169, 'Redosz', 'StÄ™pieÅ„', 'KobyliÅ„ski', 'Åobacz', 7, 37, '2014-08-07 23:51:41');
INSERT INTO `mecze` VALUES(170, 'KrÃ³lewski', 'Redosz', 'GugaÅ‚a', 'StÄ™pieÅ„', 2, 20, '2014-08-08 01:46:07');
INSERT INTO `mecze` VALUES(171, 'Mamczur', 'Redosz', 'GugaÅ‚a', 'MaÅ‚olepszy', 2, 33, '2014-08-08 01:46:41');
INSERT INTO `mecze` VALUES(172, 'KrÃ³lewski', 'MaÅ‚olepszy', 'Redosz', 'StÄ™pieÅ„', 9, 0, '2014-08-08 01:46:59');
INSERT INTO `mecze` VALUES(173, 'StÄ™pieÅ„', 'Åobacz', 'GugaÅ‚a', 'Mamczur', 8, 8, '2014-08-08 02:43:28');
INSERT INTO `mecze` VALUES(174, 'StÄ™pieÅ„', 'Åobacz', 'GugaÅ‚a', 'Mamczur', 8, 6, '2014-08-08 02:43:40');
INSERT INTO `mecze` VALUES(175, 'GugaÅ‚a', 'KobyliÅ„ski', 'Redosz', 'StÄ™pieÅ„', 6, 18, '2014-08-08 04:06:58');
INSERT INTO `mecze` VALUES(176, 'Redosz', 'StÄ™pieÅ„', 'GugaÅ‚a', 'KobyliÅ„ski', 3, 41, '2014-08-08 04:07:08');
INSERT INTO `mecze` VALUES(177, 'Redosz', 'StÄ™pieÅ„', 'GugaÅ‚a', 'KobyliÅ„ski', 9, 1, '2014-08-08 04:07:18');
INSERT INTO `mecze` VALUES(178, 'GugaÅ‚a', 'StÄ™pieÅ„', 'Mamczur', 'Redosz', 9, 24, '2014-08-11 00:52:23');
INSERT INTO `mecze` VALUES(179, 'GugaÅ‚a', 'StÄ™pieÅ„', 'Mamczur', 'Redosz', 6, 34, '2014-08-11 00:52:32');
INSERT INTO `mecze` VALUES(180, 'Stelmaszczyk', NULL, 'Karpiuk', NULL, 5, 24, '2014-08-11 01:15:34');
INSERT INTO `mecze` VALUES(181, 'Redosz', 'StÄ™pieÅ„', 'Garal', 'Karas', 8, 12, '2014-08-11 03:09:52');
INSERT INTO `mecze` VALUES(182, 'Redosz', 'StÄ™pieÅ„', 'Garal', 'Karas', 4, 29, '2014-08-11 03:10:07');
INSERT INTO `mecze` VALUES(183, 'Garal', 'StÄ™pieÅ„', 'GugaÅ‚a', 'Redosz', 4, 24, '2014-08-11 03:42:49');
INSERT INTO `mecze` VALUES(184, 'GugaÅ‚a', 'Redosz', 'Garal', 'StÄ™pieÅ„', 6, 31, '2014-08-11 03:43:03');
INSERT INTO `mecze` VALUES(185, 'Garal', 'StÄ™pieÅ„', 'GugaÅ‚a', 'Redosz', 7, 11, '2014-08-11 03:43:10');
INSERT INTO `mecze` VALUES(186, 'Garal', 'StÄ™pieÅ„', 'GugaÅ‚a', 'Redosz', 9, 0, '2014-08-11 03:43:13');
INSERT INTO `mecze` VALUES(187, 'Niewczas', 'Sukienniczak', 'Matuszewski', 'MaÅ‚olepszy', 5, 29, '2014-08-11 04:34:25');
INSERT INTO `mecze` VALUES(188, 'Matuszewski', 'MaÅ‚olepszy', 'Niewczas', 'Sukienniczak', 6, 23, '2014-08-11 04:34:40');
INSERT INTO `mecze` VALUES(189, 'Matuszewski', 'MaÅ‚olepszy', 'Niewczas', 'Sukienniczak', 7, 13, '2014-08-11 04:34:47');
INSERT INTO `mecze` VALUES(190, 'Mamczur', 'Sukienniczak', 'Garal', 'StÄ™pieÅ„', 9, 3, '2014-08-11 05:20:36');
INSERT INTO `mecze` VALUES(191, 'Garal', 'StÄ™pieÅ„', 'Mamczur', 'Sukienniczak', 6, 23, '2014-08-11 05:20:44');
INSERT INTO `mecze` VALUES(192, 'Mamczur', 'Sukienniczak', 'Garal', 'StÄ™pieÅ„', 9, 8, '2014-08-11 05:20:57');
INSERT INTO `mecze` VALUES(193, 'Brzeski', 'Fudali', 'Matuszewski', 'Pietkiewicz', 5, 40, '2014-08-12 03:32:20');
INSERT INTO `mecze` VALUES(194, 'Matuszewski', 'Pietkiewicz', 'Brzeski', 'Fudali', 5, 19, '2014-08-12 03:33:04');
INSERT INTO `mecze` VALUES(195, 'Matuszewski', 'Pietkiewicz', 'Brzeski', 'Fudali', 9, 0, '2014-08-12 03:33:11');
INSERT INTO `mecze` VALUES(196, 'StrzaÅ‚ka', 'StÄ™pieÅ„', 'Mamczur', 'Redosz', 9, 0, '2014-08-12 03:42:36');
INSERT INTO `mecze` VALUES(197, 'Mamczur', 'Redosz', 'StrzaÅ‚ka', 'StÄ™pieÅ„', 2, 45, '2014-08-12 03:42:47');
INSERT INTO `mecze` VALUES(198, 'Mamczur', 'Redosz', 'StrzaÅ‚ka', 'StÄ™pieÅ„', 2, 35, '2014-08-12 03:43:03');
INSERT INTO `mecze` VALUES(199, 'Pietkiewicz', 'Sukienniczak', 'Karas', 'Matuszewski', 6, 30, '2014-08-12 23:01:48');
INSERT INTO `mecze` VALUES(200, 'Garal', 'StÄ™pieÅ„', 'Tarasiuk', 'Wnuk', 4, 23, '2014-08-12 23:17:04');
INSERT INTO `mecze` VALUES(201, 'Garal', 'StÄ™pieÅ„', 'Tarasiuk', 'Wnuk', 9, 0, '2014-08-12 23:17:09');
INSERT INTO `mecze` VALUES(202, 'Karpiuk', 'Stelmaszczyk', 'Garal', 'StÄ™pieÅ„', 5, 16, '2014-08-13 01:02:26');
INSERT INTO `mecze` VALUES(203, 'Adamiec', 'Karpiuk', 'Garal', 'StÄ™pieÅ„', 4, 18, '2014-08-13 02:34:02');
INSERT INTO `mecze` VALUES(204, 'Adamiec', 'Karpiuk', 'Garal', 'StÄ™pieÅ„', 4, 14, '2014-08-13 02:34:10');
INSERT INTO `mecze` VALUES(205, 'Adamiec', 'Karpiuk', 'Garal', 'StÄ™pieÅ„', 8, 0, '2014-08-13 02:34:18');
INSERT INTO `mecze` VALUES(206, 'StrzaÅ‚ka', 'StÄ™pieÅ„', 'Baranik', 'Mamczur', 4, 38, '2014-08-13 03:13:14');
INSERT INTO `mecze` VALUES(207, 'Baranik', 'Mamczur', 'StrzaÅ‚ka', 'StÄ™pieÅ„', 4, 30, '2014-08-13 03:13:28');
INSERT INTO `mecze` VALUES(208, 'Baranik', 'Mamczur', 'StrzaÅ‚ka', 'StÄ™pieÅ„', 8, 3, '2014-08-13 03:13:42');
INSERT INTO `mecze` VALUES(209, 'Brzeski', 'Matuszewski', 'MaÅ‚olepszy', 'Sukienniczak', 5, 13, '2014-08-13 03:39:55');
INSERT INTO `mecze` VALUES(210, 'Brzeski', 'Matuszewski', 'MaÅ‚olepszy', 'Sukienniczak', 5, 10, '2014-08-13 03:39:59');
INSERT INTO `mecze` VALUES(211, 'Adamiec', 'MaÅ‚olepszy', 'GÃ³recki', 'Modzelewski', 6, 0, '2014-08-13 04:08:55');
INSERT INTO `mecze` VALUES(212, 'Garal', 'Karas', 'GugaÅ‚a', 'StÄ™pieÅ„', 6, 15, '2014-08-13 04:28:35');
INSERT INTO `mecze` VALUES(213, 'Garal', 'Karas', 'GugaÅ‚a', 'StÄ™pieÅ„', 1, 36, '2014-08-13 04:28:49');
INSERT INTO `mecze` VALUES(214, 'Garal', 'Karas', 'GugaÅ‚a', 'StÄ™pieÅ„', 8, 0, '2014-08-13 04:28:52');
INSERT INTO `mecze` VALUES(215, 'Matuszewski', NULL, 'Adamiec', NULL, 9, 0, '2014-08-13 04:55:42');
INSERT INTO `mecze` VALUES(216, 'Matuszewski', NULL, 'Adamiec', NULL, 8, 1, '2014-08-13 04:55:47');
INSERT INTO `mecze` VALUES(217, 'Fudali', NULL, 'Stelmaszczyk', NULL, 8, 27, '2014-08-13 05:29:33');
INSERT INTO `mecze` VALUES(218, 'Mamczur', 'Åobacz', 'Redosz', 'StrzaÅ‚ka', 7, 15, '2014-08-13 23:52:45');
INSERT INTO `mecze` VALUES(219, 'Redosz', 'StrzaÅ‚ka', 'Mamczur', 'Åobacz', 7, 19, '2014-08-13 23:52:56');
INSERT INTO `mecze` VALUES(220, 'Mamczur', 'Åobacz', 'Redosz', 'StrzaÅ‚ka', 3, 36, '2014-08-13 23:53:11');
INSERT INTO `mecze` VALUES(221, 'Redosz', 'StÄ™pieÅ„', 'Mamczur', 'StrzaÅ‚ka', 4, 30, '2014-08-14 02:14:43');
INSERT INTO `mecze` VALUES(222, 'Redosz', 'StÄ™pieÅ„', 'Mamczur', 'StrzaÅ‚ka', 4, 23, '2014-08-14 02:14:52');
INSERT INTO `mecze` VALUES(223, 'Redosz', 'StrzaÅ‚ka', 'Mamczur', 'StÄ™pieÅ„', 8, 9, '2014-08-14 02:15:17');
INSERT INTO `mecze` VALUES(224, 'Redosz', 'StrzaÅ‚ka', 'Mamczur', 'StÄ™pieÅ„', 2, 36, '2014-08-14 02:15:31');
INSERT INTO `mecze` VALUES(225, 'StÄ™pieÅ„', 'Åobacz', 'Mamczur', 'Redosz', 2, 50, '2014-08-14 04:35:15');
INSERT INTO `mecze` VALUES(226, 'StÄ™pieÅ„', 'Åobacz', 'Mamczur', 'Redosz', 2, 38, '2014-08-14 04:35:23');
INSERT INTO `mecze` VALUES(227, 'Karpiuk', NULL, 'Baranik', NULL, 4, 18, '2014-08-14 05:39:38');
INSERT INTO `mecze` VALUES(228, 'Stelmaszczyk', NULL, 'Fudali', NULL, 3, 23, '2014-08-18 00:48:38');
INSERT INTO `mecze` VALUES(229, 'Stelmaszczyk', NULL, 'Fudali', NULL, 6, 3, '2014-08-18 00:48:46');
INSERT INTO `mecze` VALUES(230, 'Stelmaszczyk', NULL, 'Fudali', NULL, 8, 0, '2014-08-18 00:48:53');
INSERT INTO `mecze` VALUES(231, 'StÄ™pieÅ„', 'Åobacz', 'Garal', 'Redosz', 7, 12, '2014-08-18 01:17:19');
INSERT INTO `mecze` VALUES(232, 'Garal', 'Redosz', 'StÄ™pieÅ„', 'Åobacz', 4, 36, '2014-08-18 01:17:25');
INSERT INTO `mecze` VALUES(233, 'StÄ™pieÅ„', 'Åobacz', 'Garal', 'Redosz', 8, 12, '2014-08-18 01:17:30');
INSERT INTO `mecze` VALUES(234, 'Garal', 'Redosz', 'StÄ™pieÅ„', 'Åobacz', 8, 11, '2014-08-18 02:53:33');
INSERT INTO `mecze` VALUES(235, 'Garal', 'Redosz', 'StÄ™pieÅ„', 'Åobacz', 8, 8, '2014-08-18 02:53:35');
INSERT INTO `mecze` VALUES(236, 'Stelmaszczyk', 'Sukienniczak', 'Matuszewski', 'Pietkiewicz', 5, 29, '2014-08-18 04:11:14');
INSERT INTO `mecze` VALUES(237, 'Matuszewski', 'Pietkiewicz', 'Stelmaszczyk', 'Sukienniczak', 6, 23, '2014-08-18 04:11:29');
INSERT INTO `mecze` VALUES(238, 'Matuszewski', 'Pietkiewicz', 'Stelmaszczyk', 'Sukienniczak', 4, 27, '2014-08-18 04:11:36');
INSERT INTO `mecze` VALUES(239, 'Niewczas', 'Sukienniczak', 'Stelmaszczyk', 'StÄ™pieÅ„', 8, 6, '2014-08-18 05:10:46');
INSERT INTO `mecze` VALUES(240, 'Niewczas', 'Sukienniczak', 'Stelmaszczyk', 'StÄ™pieÅ„', 8, 5, '2014-08-18 05:10:54');
INSERT INTO `mecze` VALUES(241, 'Stelmaszczyk', NULL, 'Grodecki', NULL, 6, 12, '2014-08-20 07:19:16');
INSERT INTO `mecze` VALUES(242, 'Stelmaszczyk', NULL, 'Grodecki', NULL, 8, 0, '2014-08-20 07:19:21');
INSERT INTO `mecze` VALUES(243, 'Stelmaszczyk', NULL, 'Fudali', NULL, 4, 15, '2014-08-20 07:19:32');
INSERT INTO `mecze` VALUES(244, 'Pietkiewicz', 'Stelmaszczyk', 'Fudali', 'Matuszewski', 9, 7, '2014-08-20 07:20:15');
INSERT INTO `mecze` VALUES(245, 'Pietkiewicz', 'Stelmaszczyk', 'Fudali', 'Matuszewski', 5, 26, '2014-08-20 07:20:42');
INSERT INTO `mecze` VALUES(246, 'Fudali', NULL, 'Stelmaszczyk', NULL, 9, 29, '2014-08-20 07:20:57');
INSERT INTO `mecze` VALUES(247, 'Modzelewski', 'Åobacz', 'Baranik', 'Garal', 7, 14, '2014-08-22 05:05:53');
INSERT INTO `mecze` VALUES(248, 'Modzelewski', 'Åobacz', 'Baranik', 'Garal', 7, 10, '2014-08-22 05:05:59');
INSERT INTO `mecze` VALUES(249, 'ZalewskiB', NULL, 'Fudali', NULL, 9, 0, '2014-08-22 05:55:37');
INSERT INTO `mecze` VALUES(250, 'ZalewskiB', NULL, 'Fudali', NULL, 8, 2, '2014-08-22 05:55:47');
INSERT INTO `mecze` VALUES(251, 'Fudali', NULL, 'ZalewskiB', NULL, 8, 18, '2014-08-22 05:55:55');
INSERT INTO `mecze` VALUES(252, 'Fudali', NULL, 'ZalewskiB', NULL, 7, 19, '2014-08-22 05:56:01');
INSERT INTO `mecze` VALUES(253, 'Garal', 'Redosz', 'MaÅ‚olepszy', 'Sukienniczak', 7, 7, '2014-08-22 07:46:57');
INSERT INTO `mecze` VALUES(254, 'Garal', 'Redosz', 'MaÅ‚olepszy', 'Sukienniczak', 3, 26, '2014-08-22 07:47:06');
INSERT INTO `mecze` VALUES(255, 'Fudali', 'Niewczas', 'Sukienniczak', 'Åobacz', 7, 21, '2014-08-22 08:44:43');
INSERT INTO `mecze` VALUES(256, 'Fudali', 'Niewczas', 'Sukienniczak', 'Åobacz', 7, 16, '2014-08-22 08:44:47');
INSERT INTO `mecze` VALUES(257, 'Fudali', NULL, 'Stelmaszczyk', NULL, 5, 23, '2014-08-22 10:39:33');
INSERT INTO `mecze` VALUES(258, 'Stelmaszczyk', NULL, 'Fudali', NULL, 2, 47, '2014-08-22 10:39:43');
INSERT INTO `mecze` VALUES(259, 'Stelmaszczyk', NULL, 'Grodecki', NULL, 8, 10, '2014-08-22 13:02:00');

