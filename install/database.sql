-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 10:54 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- โครงสร้างตาราง `{prefix}_01work`
--

CREATE TABLE `{prefix}_01work` (
  `id` int(2) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `{prefix}_01work`
--

INSERT INTO `{prefix}_01work` (`id`, `title`, `description`, `fname`) VALUES
(1, 'การเขียนเว็บไซต์', 'ให้นักเรียนนักศึกษาดูจากตัวอย่างที่อาจารย์สอนให้เป็นแบบอย่างในการทำงานต่อไป', 'อ.คำภี');


--
-- โครงสร้างตาราง `{prefix}_member`
--

CREATE TABLE `{prefix}member` (
  `id_m` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ',
  `lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อ',
  `fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุล',
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมลล์',
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เบอร์โทรศัพท์',
  `address` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ที่อยู่่',
  `uname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้ใช้',
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสผ่าน',
  `typeid` int(3) NOT NULL COMMENT 'รหัสประเภท',
  PRIMARY KEY (`id_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางสมาชิก';

--
-- โครงสร้างตาราง `{prefix}_type`
--

CREATE TABLE `{prefix}type` (
  `typeid` int(3) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภท',
  `typename` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสสินค้า',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางประเภท';

--
-- โครงสร้างตาราง `{prefix}_product`
--

CREATE TABLE `{prefix}product` (
  `proid` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า',
  `proname` varchar(50) COLLATE utf32_unicode_ci NOT NULL COMMENT 'ชื่อสินค้า',
  `detail` text COLLATE utf32_unicode_ci NOT NULL COMMENT 'รายละเอียด',
  `price` float NOT NULL COMMENT 'ราคา',
  `bal` int(10) NOT NULL COMMENT 'จำนวนคงเหลือ',
  `typeid` varchar(3) COLLATE utf32_unicode_ci NOT NULL COMMENT 'รหัสประเภท',
  PRIMARY KEY (`proid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci COMMENT='ตารางสินค้า';

--
-- โครงสร้างตาราง `{prefix}_basket`
--

CREATE TABLE `{prefix}basket` (
  `orderid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'เลขที่สั่งซื้อ',
  `basdate` date NOT NULL COMMENT 'วันที่',
  `id_m` int(3) NOT NULL COMMENT 'ผู้ส่ง',
  `proid` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสสินค้า',
  `amount` int(10) NOT NULL COMMENT 'จำนวน',
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 'สถานะการส่ง',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางตะกร้า';

--
-- โครงสร้างตาราง `{prefix}_payment`
--

CREATE TABLE `{prefix}payment` (
  `payid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ',
  `paydate` date NOT NULL COMMENT 'วันที่',
  `paytime` time NOT NULL COMMENT 'เวลา',
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ช่องทางการชำระ',
  `total` float NOT NULL COMMENT 'ยอดชำระ',
  `id_m` int(3) NOT NULL COMMENT 'ผู้ชำระ',
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางการชำระเงิน';

--
-- โครงสร้างตาราง `{prefix}_question`
--

CREATE TABLE `{prefix}question` (
  `qid` int(10) NOT NULL COMMENT 'ลำดับคำถาม',
  `qdate` date NOT NULL COMMENT 'วันที่',
  `q` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'คำถาม',
  `id_m` int(11) NOT NULL COMMENT 'ผู้ถาม',
  KEY `id_m` (`id_m`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_m`) REFERENCES `member` (`id_m`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางคำถาม';

--
-- โครงสร้างตาราง `{prefix}_answer`
--

CREATE TABLE `{prefix}answer` (
  `aid` int(10) NOT NULL COMMENT 'ลำดับความคิด',
  `adate` date NOT NULL COMMENT 'วันที่',
  `a` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ความคิดเห็น',
  `id_m` int(20) NOT NULL COMMENT 'ผู้ตอบ',
  `qid` int(10) NOT NULL COMMENT 'ลำดับคำถาม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางคำตอบ';

