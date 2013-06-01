-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `ID`         INT(10)          NOT NULL,
  `QuestionID` INT(10) UNSIGNED NOT NULL,
  `Text`       VARCHAR(128)     NOT NULL,
  PRIMARY KEY (`ID`)
)
  DEFAULT CHARSET =utf8;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `ID`     INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Number` INT(10) UNSIGNED NOT NULL,
  `Text`   VARCHAR(128)     NOT NULL,
  `Answer` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`)
)
  DEFAULT CHARSET =utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username`    VARCHAR(24)      NOT NULL,
  `password`    VARCHAR(32)      NOT NULL,
  `email`       VARCHAR(64)      NOT NULL,
  `privateName` VARCHAR(24)      NOT NULL,
  `lastName`    VARCHAR(24)      NOT NULL,
  `birthYear`   INT(10) UNSIGNED NOT NULL,
  `admin`       TINYINT(1)       NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
)
  AUTO_INCREMENT =12
  DEFAULT CHARSET =utf8;
