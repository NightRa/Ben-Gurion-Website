-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `number` int(10) unsigned NOT NULL,
  `QuestionID` int(10) unsigned NOT NULL,
  `Text` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Number` int(10) unsigned NOT NULL,
  `Text` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Answer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
)  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for useranswers
-- ----------------------------
DROP TABLE IF EXISTS `useranswers`;
CREATE TABLE `useranswers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `questionID` int(10) NOT NULL,
  `answer` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
)  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `privateName` varchar(24) NOT NULL,
  `lastName` varchar(24) NOT NULL,
  `birthYear` int(10) unsigned NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `lastQuestion` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
)  DEFAULT CHARSET=utf8;
