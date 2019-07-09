-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-07-08 02:53:53
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huawei`
--
CREATE DATABASE IF NOT EXISTS `huawei` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `huawei`;

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `productUrl` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`cid`, `uid`, `productUrl`, `price`, `count`, `title`, `spec`) VALUES
(8, 12, 'p30.png', '3988.00', 2, 'HUAWEI P30 麒麟980 超感光徕卡三摄 屏内指纹 双景录像 8GB+64GB 全网通版', '8GB+64GB 全网通版'),
(9, 13, 'p30pro.png', '5488.00', 1, 'HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像 8GB+128GB 全网通版', '8GB+128GB 全网通版');

-- --------------------------------------------------------

--
-- 表的结构 `find`
--

DROP TABLE IF EXISTS `find`;
CREATE TABLE IF NOT EXISTS `find` (
  `findId` int(11) NOT NULL AUTO_INCREMENT,
  `findUrl` varchar(50) NOT NULL,
  `findBTitle` varchar(100) NOT NULL,
  `findSTitle` varchar(100) NOT NULL,
  `findDate` date DEFAULT NULL,
  `readCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`findId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `find`
--

INSERT INTO `find` (`findId`, `findUrl`, `findBTitle`, `findSTitle`, `findDate`, `readCount`) VALUES
(1, 'new1.jpg', '高颜值实力派nova5来袭', '参加留言活动，赢惊喜好礼和发布会门票', '2019-06-14', 39),
(2, 'new2.jpg', '荣耀20 Pro荣耀年度最强拍照手机', '给大家分享一下荣耀20 Pro拍照体验', '2019-06-13', 3),
(3, 'new3.jpg', 'HUAWEI HiLink生态惊艳亮相CES Asia2019', '让智慧loT从梦想走向现实', '2019-06-12', 1);

-- --------------------------------------------------------

--
-- 表的结构 `laptop`
--

DROP TABLE IF EXISTS `laptop`;
CREATE TABLE IF NOT EXISTS `laptop` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cReason` varchar(50) NOT NULL,
  `cUrl` varchar(100) NOT NULL,
  `crDetail` varchar(50) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `cPrice` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4007 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `laptop`
--

INSERT INTO `laptop` (`cid`, `cReason`, `cUrl`, `crDetail`, `cName`, `cPrice`) VALUES
(4001, '618特惠', 'laptop1.png', '限量赠配件+6期免息', 'MateBook X Pro 2019', '7999'),
(4002, '618特惠', 'laptop2.png', '限时直降300元+3期免息', 'MagicBook2019 锐龙版', '3899'),
(4003, '618特惠', 'laptop3.png', '限量赠蓝牙鼠标+3期免息', 'MateBook14', '6999'),
(4004, '618特惠', 'laptop4.png', '最高直降600元+6期免息', 'MagicBook', '4399'),
(4005, '618特惠', 'laptop5.png', '享3期免息', 'MateBook E 2019', '3999'),
(4006, '618特惠', 'laptop6.png', '限量赠配件礼包', 'MateBook D', '5188');

-- --------------------------------------------------------

--
-- 表的结构 `limited`
--

DROP TABLE IF EXISTS `limited`;
CREATE TABLE IF NOT EXISTS `limited` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `pcurl` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `goodsDesc` varchar(50) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `limited`
--

INSERT INTO `limited` (`lid`, `pcurl`, `title`, `goodsDesc`) VALUES
(1001, 'matebook.png\r\n', 'MateBook 13', '最高直降600'),
(1002, 'freebud.png', 'FreeBud', '限时优惠'),
(1003, 'weight.png', '智能体脂称', '领劵优惠'),
(1004, 'rongyao10.png', '荣耀10', '定金50抵100');

-- --------------------------------------------------------

--
-- 表的结构 `phone`
--

DROP TABLE IF EXISTS `phone`;
CREATE TABLE IF NOT EXISTS `phone` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pReason` varchar(50) NOT NULL,
  `pUrl` varchar(100) NOT NULL,
  `prDetail` varchar(50) NOT NULL,
  `pName` varchar(50) NOT NULL,
  `pPrice` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3007 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `phone`
--

INSERT INTO `phone` (`pid`, `pReason`, `pUrl`, `prDetail`, `pName`, `pPrice`) VALUES
(3001, '爆款', 'phone1.jpg', '领劵减200+6期免息', 'HUAWEI Mate20', '3499'),
(3002, '热卖', 'phone2.jpg', '标配版到手价849', '荣耀畅玩8c', '899'),
(3003, '特惠', 'phone3.jpg', '最高直降300', 'HUAWEI nova 4e', '1999'),
(3004, '满减', 'phone4.png', '标配版到手价749', '荣耀畅玩8A', '799'),
(3005, '爆款', 'phone5.png', '颜值高', 'HUAWEI Mate20X', '4499'),
(3006, '新品', 'phone6.png', '新品热卖', 'HUAWEI P30', '3988');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `familyId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `subtitle` varchar(128) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `promise` varchar(64) DEFAULT NULL,
  `promotion1` varchar(128) DEFAULT NULL,
  `promotion2` varchar(128) DEFAULT NULL,
  `promotion3` varchar(128) DEFAULT NULL,
  `productUrl` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`pid`, `familyId`, `productId`, `title`, `subtitle`, `price`, `spec`, `promise`, `promotion1`, `promotion2`, `promotion3`, `productUrl`) VALUES
(1, 1001, 10011, 'HUAWEI P30 麒麟980 超感光徕卡三摄 屏内指纹 双景录像 8GB+64GB 全网通版', '①享6期分期免息 ②购碎屏险享8折优惠 ③购机赢法国豪华游 ④晒单赠好礼', '3988.00', '8GB+64GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p30.png'),
(2, 1001, 10012, 'HUAWEI P30 麒麟980 超感光徕卡三摄 屏内指纹 双景录像 8GB+128GB 全网通版', '①享6期分期免息 ②购碎屏险享8折优惠 ③购机赢法国豪华游 ④晒单赠好礼', '4288.00', '8GB+128GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p30.png'),
(3, 1001, 10013, 'HUAWEI P30 麒麟980 超感光徕卡三摄 屏内指纹 双景录像 8GB+256GB 全网通版', '①享6期分期免息 ②购碎屏险享8折优惠 ③购机赢法国豪华游 ④晒单赠好礼', '4788.00', '8GB+256GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p30.png'),
(4, 1002, 10021, 'HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像 8GB+128GB 全网通版', '麒麟980芯片|6.47英寸OLED曲面屏|4000万超感光徕卡四摄|4200毫安电池强劲续航', '5488.00', '8GB+128GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p30pro.png'),
(5, 1002, 10022, 'HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像 8GB+256GB 全网通版', '麒麟980芯片|6.47英寸OLED曲面屏|4000万超感光徕卡四摄|4200毫安电池强劲续航', '5988.00', '8GB+256GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p30pro.png'),
(6, 1002, 10023, 'HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像 8GB+512GB 全网通版', '麒麟980芯片|6.47英寸OLED曲面屏|4000万超感光徕卡四摄|4200毫安电池强劲续航', '6788.00', '8GB+512GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p30pro.png'),
(7, 1003, 10031, 'HUAWEI P20 Pro 4000万徕卡三摄 AI摄影大师 6GB+64GB 全网通版', NULL, '4488.00', '6GB+64GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p20pro.png'),
(8, 1003, 10032, 'HUAWEI P20 Pro 4000万徕卡三摄 AI摄影大师 6GB+128GB 全网通版', NULL, '4988.00', '6GB+128GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p20pro.png'),
(9, 1004, 10041, 'HUAWEI P20 6GB+64GB 全网通版', '①限时下单立减400②享6期分期免息③购机赢法国豪华游', '3388.00', '6GB+64GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p20.png'),
(10, 1004, 10042, 'HUAWEI P20 6GB+128GB 全网通版', '①限时下单立减400②享6期分期免息③购机赢法国豪华游', '3888.00', '6GB+128GB 全网通版', '1年保修', '10/20整点下单赠送华为手环', '掌上生活、花呗、工行分期支付可享免息', '购买即赠商城积分，积分可抵现', 'p20.png');

-- --------------------------------------------------------

--
-- 表的结构 `productfamily`
--

DROP TABLE IF EXISTS `productfamily`;
CREATE TABLE IF NOT EXISTS `productfamily` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `picURL` varchar(32) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `productfamily`
--

INSERT INTO `productfamily` (`fid`, `name`, `picURL`, `price`) VALUES
(1001, 'HUAWEI P30', 'p30.png', '3988.00'),
(1002, 'HUAWEI P30 Pro', 'p30pro.png', '5488.00'),
(1003, 'HUAWEI P20', 'p20.png', '3388.00'),
(1004, 'HUAWEI P20 Pro', 'p20pro.png', '4488.00');

-- --------------------------------------------------------

--
-- 表的结构 `productpic`
--

DROP TABLE IF EXISTS `productpic`;
CREATE TABLE IF NOT EXISTS `productpic` (
  `picID` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `picUrl` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`picID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `productpic`
--

INSERT INTO `productpic` (`picID`, `goodsId`, `picUrl`) VALUES
(1, 1001, 'p301.png'),
(2, 1001, 'p302.png'),
(3, 1001, 'p303.png'),
(4, 1002, 'p30p1.png'),
(5, 1002, 'p30p2.png'),
(6, 1002, 'p30p3.png'),
(7, 1003, 'p201.png'),
(8, 1003, 'p202.jpg'),
(9, 1004, 'p20p1.png'),
(10, 1004, 'p20p2.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `productversion`
--

DROP TABLE IF EXISTS `productversion`;
CREATE TABLE IF NOT EXISTS `productversion` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `familyId` int(11) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `productversion`
--

INSERT INTO `productversion` (`vid`, `familyId`, `spec`, `productId`) VALUES
(1, 1001, '8GB+64GB 全网通', 10011),
(2, 1001, '8GB+128GB 全网通', 10012),
(3, 1001, '8GB+256GB 全网通', 10013),
(4, 1002, '8GB+128GB 全网通', 10021),
(5, 1002, '8GB+256GB 全网通', 10022),
(6, 1002, '8GB+512GB 全网通', 10023),
(7, 1003, '6GB+64GB 全网通', 10031),
(8, 1003, '6GB+128GB 全网通', 10032),
(9, 1004, '6GB+64GB 全网通', 10041),
(10, 1004, '6GB+128GB 全网通', 10042);

-- --------------------------------------------------------

--
-- 表的结构 `recommend`
--

DROP TABLE IF EXISTS `recommend`;
CREATE TABLE IF NOT EXISTS `recommend` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(50) NOT NULL,
  `recommendurl` varchar(100) NOT NULL,
  `recommendtitle` varchar(50) NOT NULL,
  `recommendprice` varchar(50) NOT NULL,
  `delprice` varchar(50) NOT NULL,
  `reasondetail` varchar(50) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2003 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `recommend`
--

INSERT INTO `recommend` (`rid`, `reason`, `recommendurl`, `recommendtitle`, `recommendprice`, `delprice`, `reasondetail`) VALUES
(2001, '优惠', 'changxiang9.png', '华为 畅享9 Plus', '1399', '1599', '最高优惠150'),
(2002, '爆款', 'rongyaoplay.png', '荣耀play', '1999', '2399', '128G版1799起');

-- --------------------------------------------------------

--
-- 表的结构 `slide`
--

DROP TABLE IF EXISTS `slide`;
CREATE TABLE IF NOT EXISTS `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slideurl` varchar(100) NOT NULL,
  `slidetext` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `slide`
--

INSERT INTO `slide` (`id`, `slideurl`, `slidetext`) VALUES
(1, 'slide1.jpg', '突破视野，挑战无边界！'),
(2, 'slide2.jpg', '来看下大家是如何评价这款荣耀年度最强拍照手机吧'),
(3, 'slide3.jpg', '一张图带你了解AI三摄的华为麦芒8'),
(4, 'slide4.jpg', '你们期待的EMUI9.1来啦');

-- --------------------------------------------------------

--
-- 表的结构 `u_login`
--

DROP TABLE IF EXISTS `u_login`;
CREATE TABLE IF NOT EXISTS `u_login` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(25) NOT NULL,
  `upass` varchar(32) NOT NULL,
  `uphone` varchar(16) DEFAULT NULL,
  `uemail` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `u_login`
--

INSERT INTO `u_login` (`uid`, `uname`, `upass`, `uphone`, `uemail`) VALUES
(1, 'tom', '202cb962ac59075b964b07152d234b70', NULL, NULL),
(11, 'aa', 'e10adc3949ba59abbe56e057f20f883e', '18520605005', '894229992@qq.com'),
(13, 'bb', 'e10adc3949ba59abbe56e057f20f883e', '18520605001', '894229991@qq.com'),
(14, 'cc', 'e10adc3949ba59abbe56e057f20f883e', '18520605004', '894229990@qq.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
