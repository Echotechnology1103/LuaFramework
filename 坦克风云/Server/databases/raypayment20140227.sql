-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost:3306
-- 生成日期: 2014 年 02 月 27 日 23:56
-- 服务器版本: 5.5.20-log
-- PHP 版本: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `raypayment`
--

-- --------------------------------------------------------

--
-- 表的结构 `rayrewardlog`
--

CREATE TABLE IF NOT EXISTS `rayrewardlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porderid` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `pid` varchar(200) NOT NULL,
  `itemid` varchar(100) NOT NULL,
  `num` int(10) NOT NULL,
  `zoneid` int(11) unsigned DEFAULT '0',
  `status` int(1) NOT NULL,
  `ulvl` int(5) DEFAULT '-1',
  `viplvl` int(3) DEFAULT '-1',
  `os` varchar(15) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `datestr` varchar(20) DEFAULT NULL,
  `activityCode` varchar(100) DEFAULT NULL,
  `ext_int1` int(11) unsigned DEFAULT '0',
  `ext_int2` int(11) unsigned DEFAULT '0',
  `ext_vchar1` varchar(100) DEFAULT NULL,
  `ext_vchar2` varchar(200) DEFAULT NULL,
  `ext_vchar3` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `porderid` (`porderid`),
  KEY `userid` (`userid`),
  KEY `zoneid` (`zoneid`),
  KEY `updatetime` (`updatetime`),
  KEY `createtime` (`createtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `raytradelog`
--

CREATE TABLE IF NOT EXISTS `raytradelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porderid` varchar(200) NOT NULL,
  `apporderid` varchar(200) DEFAULT NULL,
  `userid` int(11) DEFAULT '0',
  `pid` varchar(200) DEFAULT NULL,
  `cost` float unsigned DEFAULT '0',
  `num` int(10) unsigned DEFAULT '0',
  `name` varchar(200) DEFAULT NULL,
  `trade_type` char(20) DEFAULT '',
  `curType` char(20) NOT NULL DEFAULT '',
  `status` varchar(10) DEFAULT NULL,
  `createtime` int(11) DEFAULT '0',
  `updateTime` int(11) DEFAULT NULL,
  `datestr` varchar(20) DEFAULT NULL,
  `extra_num` int(10) unsigned DEFAULT '0',
  `ulvl` int(5) DEFAULT '-1',
  `viplvl` int(3) DEFAULT '-1',
  `os` varchar(15) DEFAULT NULL,
  `iffirstbuy` int(1) DEFAULT '0',
  `zoneid` int(11) unsigned DEFAULT '0',
  `orderStateMonth` varchar(100) DEFAULT NULL,
  `ext_int1` int(11) unsigned DEFAULT '0',
  `ext_int2` int(11) unsigned DEFAULT '0',
  `ext_vchar1` varchar(100) DEFAULT NULL,
  `ext_vchar2` varchar(200) DEFAULT NULL,
  `ext_vchar3` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `create_time` (`createtime`),
  KEY `zoneid` (`zoneid`),
  KEY `iffirstbuy` (`iffirstbuy`),
  KEY `updateTime` (`updateTime`),
  KEY `apporderid` (`apporderid`),
  KEY `porderid` (`porderid`),
  KEY `orderStateMonth` (`orderStateMonth`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
