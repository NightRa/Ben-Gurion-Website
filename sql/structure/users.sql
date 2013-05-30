/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : website

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-05-18 16:03:06
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
USE website;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username`    VARCHAR(24)      NOT NULL,
  `password`    VARCHAR(24)      NOT NULL,
  `email`       VARCHAR(64)      NOT NULL,
  `privateName` VARCHAR(24)      NOT NULL,
  `lastName`    VARCHAR(24)      NOT NULL,
  `birthYear`   INT(10) UNSIGNED NOT NULL,
  `admin`       TINYINT(1)       NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
)
  AUTO_INCREMENT =2
  DEFAULT CHARSET =utf8;
