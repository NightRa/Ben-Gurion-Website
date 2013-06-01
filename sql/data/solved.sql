/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : website

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-06-02 01:55:11
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES ('49', '1', '20', '5842');
INSERT INTO `answers` VALUES ('50', '2', '20', '1284');
INSERT INTO `answers` VALUES ('51', '3', '20', '993');
INSERT INTO `answers` VALUES ('52', '4', '20', '930');
INSERT INTO `answers` VALUES ('53', '1', '21', 'דצמבר 1948');
INSERT INTO `answers` VALUES ('54', '2', '21', 'פברואר 1944');
INSERT INTO `answers` VALUES ('55', '3', '21', 'יוני 1948');
INSERT INTO `answers` VALUES ('56', '4', '21', 'ינואר 2005');
INSERT INTO `answers` VALUES ('57', '1', '22', 'באפגניסטן בשנת 1936');
INSERT INTO `answers` VALUES ('58', '2', '22', 'בארה\'ב בשנת 1947');
INSERT INTO `answers` VALUES ('59', '3', '22', 'בצפון קוראה בשנת 2008');
INSERT INTO `answers` VALUES ('60', '4', '22', 'קנדה 1947');
INSERT INTO `answers` VALUES ('61', '1', '23', '201');
INSERT INTO `answers` VALUES ('62', '2', '23', '50');
INSERT INTO `answers` VALUES ('63', '3', '23', '200');
INSERT INTO `answers` VALUES ('64', '4', '23', '128');
INSERT INTO `answers` VALUES ('65', '1', '24', '\'הגדוד הירושלמי\'');
INSERT INTO `answers` VALUES ('66', '2', '24', 'צה\'ל');
INSERT INTO `answers` VALUES ('67', '3', '24', '\'הליגיון העשירי\'');
INSERT INTO `answers` VALUES ('68', '4', '24', '\'הגדוד הארץ ישראלי\'');
INSERT INTO `answers` VALUES ('69', '1', '25', 'השומר וניל\'י');
INSERT INTO `answers` VALUES ('70', '2', '25', 'בר גיורא');
INSERT INTO `answers` VALUES ('71', '3', '25', 'לח\'י ואצ\'ל');
INSERT INTO `answers` VALUES ('72', '4', '25', 'כל התשובות נכונות');
INSERT INTO `answers` VALUES ('73', '1', '26', 'מפני שזאת היתה משימה סודית.');
INSERT INTO `answers` VALUES ('74', '2', '26', 'כי מפקד הספינה שכח להודיע על יציאתה.');
INSERT INTO `answers` VALUES ('75', '3', '26', 'כי הספינה הובילה נשק ולכן חשוב לשמור עליה בסוד.');
INSERT INTO `answers` VALUES ('76', '4', '26', 'מפני שמנהל מטה אצ\'ל החליט שזה לא נחוץ להודיע על שילוחה לישראל.');
INSERT INTO `answers` VALUES ('77', '1', '27', 'מנחם בגין');
INSERT INTO `answers` VALUES ('78', '2', '27', 'גולדה מאיר');
INSERT INTO `answers` VALUES ('79', '3', '27', 'דוד בן- גוריון');
INSERT INTO `answers` VALUES ('80', '4', '27', 'בנימין זאב הרצל');
INSERT INTO `answers` VALUES ('81', '1', '28', 'במלאת 49 שנים');
INSERT INTO `answers` VALUES ('82', '2', '28', 'במלאת 60 שנים');
INSERT INTO `answers` VALUES ('83', '3', '28', 'במלאת שנה אחת בלבד');
INSERT INTO `answers` VALUES ('84', '4', '28', 'במלאת 100 שנים');
INSERT INTO `answers` VALUES ('85', '1', '29', 'התותח הוצא מהמחסן בשנת 1931 והוא מוצג בחיפה.');
INSERT INTO `answers` VALUES ('86', '2', '29', 'התותח הוצא מהמחסן בשנת 1999 והוא מוצג בתל אביב.');
INSERT INTO `answers` VALUES ('87', '3', '29', 'התותח מעולם לא הוצא מהמחסן.');
INSERT INTO `answers` VALUES ('88', '4', '29', 'התותח הוצא מהמחסן בשנת 2010 והוא מוצג בבסיס צה\'ל.');
INSERT INTO `answers` VALUES ('89', '1', '30', 'על סך 2,000,000 ש\'ח');
INSERT INTO `answers` VALUES ('90', '2', '30', 'בחינם');
INSERT INTO `answers` VALUES ('91', '3', '30', 'על סך 200,000 ש\'ח');
INSERT INTO `answers` VALUES ('92', '4', '30', 'על סך 24,839 ש\'ח');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('20', '1', 'כמה עולים לישראל היו על הספינה אלטלנה?', '4');
INSERT INTO `questions` VALUES ('21', '2', 'מתי הספינה אלטלנה הגיעה לחופי ישראל?', '3');
INSERT INTO `questions` VALUES ('22', '3', 'מתי נרכשה הספינה אלטלנה והיכן?', '2');
INSERT INTO `questions` VALUES ('23', '4', 'כמה אנשי אצ\'ל נעצרו במבצע \'טיהור\'?', '3');
INSERT INTO `questions` VALUES ('24', '5', 'איך נקראו כוחות האצ\'ל אשר הוצבו בירושלים?', '1');
INSERT INTO `questions` VALUES ('25', '6', 'לפי שאיפתו של דוד בן גוריון לצמצם את הפיצול בין זרמי ישראל, אילו אירגוני הגנה צורפו לצה\'ל?', '3');
INSERT INTO `questions` VALUES ('26', '7', 'מדוע הספינה אלטלנה יצאה לדרכה בחשאי?', '4');
INSERT INTO `questions` VALUES ('27', '8', 'מי הורה על הפגזת אלטלנה?', '3');
INSERT INTO `questions` VALUES ('28', '9', 'במלאת כמה שנין להטבעת הספינה אלטלנה נחנכה האנדרטה לזכרה בחוף תל אביב?', '2');
INSERT INTO `questions` VALUES ('29', '10', 'באיזו שנה הוצא מהמחסן התותח שהפגיז את הספינה אלטלנה והיכן הוא מוצג?', '4');
INSERT INTO `questions` VALUES ('30', '11', 'על סך כמה שקלים מתכוון משרד ראש הממשלה להוציא משלחת לחיפוש הספינה אלטלנה?', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of useranswers
-- ----------------------------
INSERT INTO `useranswers` VALUES ('1', '1', '20', '4');
INSERT INTO `useranswers` VALUES ('2', '1', '21', '3');
INSERT INTO `useranswers` VALUES ('3', '1', '22', '3');
INSERT INTO `useranswers` VALUES ('4', '1', '23', '2');
INSERT INTO `useranswers` VALUES ('5', '1', '24', '1');
INSERT INTO `useranswers` VALUES ('6', '1', '25', '3');
INSERT INTO `useranswers` VALUES ('7', '1', '26', '4');
INSERT INTO `useranswers` VALUES ('8', '1', '27', '3');
INSERT INTO `useranswers` VALUES ('9', '1', '28', '2');
INSERT INTO `useranswers` VALUES ('10', '1', '29', '4');
INSERT INTO `useranswers` VALUES ('11', '1', '30', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'NightRa', '56cb8169eb0ea05b709d70f399f3b810', 'ilan3580@gmail.com', 'אילן', 'גודיק', '1997', '1', '12');
INSERT INTO `users` VALUES ('9', '007', 'e807f1fcf82d132f9bb018ca6738a19f', 'JB@gmail.com', 'James', 'Bond', '1950', '0', '1');
INSERT INTO `users` VALUES ('10', 'IGSG', '56cb8169eb0ea05b709d70f399f3b810', 'ProBGMS@gmail.com', 'אילן', 'גודיק', '1997', '0', '1');
INSERT INTO `users` VALUES ('11', 'Scorpion', 'd21f606e23bce33267d314e69b8f2a3a', 'eyalitsky@gmail.com', 'אייל', 'ליצקי', '1998', '1', '1');
