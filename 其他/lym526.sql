/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : lym

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-05-26 22:06:40
*/

drop database  if exists lym;

create database lym;

use lym;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'swt', '123456');

-- ----------------------------
-- Table structure for browsed
-- ----------------------------
DROP TABLE IF EXISTS `browsed`;
CREATE TABLE `browsed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `connect_mid` int(11) DEFAULT NULL,
  `connect_iid` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `connect_mid` (`connect_mid`) USING BTREE,
  KEY `connect_iid` (`connect_iid`) USING BTREE,
  CONSTRAINT `connect_iid` FOREIGN KEY (`connect_iid`) REFERENCES `illness` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `connect_mid` FOREIGN KEY (`connect_mid`) REFERENCES `medicine` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of browsed
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `medicine_id` int(11) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `medcine_id` (`medicine_id`),
  CONSTRAINT `medcine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for illness
-- ----------------------------
DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ill_name` varchar(60) DEFAULT NULL,
  `ill_vulgo` varchar(60) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `introduction` varchar(60) DEFAULT NULL,
  `checkway` varchar(60) DEFAULT NULL,
  `istransmission` int(3) DEFAULT NULL,
  `symptoms` varchar(60) DEFAULT NULL,
  `clinicdepart` varchar(60) DEFAULT NULL,
  `treat` varchar(60) DEFAULT NULL,
  `class_organ` varchar(60) DEFAULT NULL,
  `class_system` varchar(60) DEFAULT NULL,
  `class_check` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', '复发性阿弗他口腔溃疡', '口腔溃疡', '复发性阿弗他口腔溃疡复发性阿弗他口炎复发性口疮口腔黏膜疾病', '../illness/1introduction.txt', './path/illness/1checkway.txt', '0', '../illness/1symptoms.txt', '内科，内分泌科', '../illness/1treat.txt', '头颈部', '消化系统', '定点检诊');
INSERT INTO `illness` VALUES ('2', '甲状腺功能亢进症', '甲亢', '甲亢甲状腺激素', '../illness/2introduction.txt', './path/illness/2checkway.txt', '0', '../illness/2symptoms.txt', '内分泌科', '../illness/2treat.txt', '头颈部', '内分泌系统', '定点检诊');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ill_id` int(11) DEFAULT NULL,
  `medicine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ill1_id` (`ill_id`),
  KEY `medcine1_id` (`medicine_id`),
  CONSTRAINT `ill1_id` FOREIGN KEY (`ill_id`) REFERENCES `illness` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `medcine1_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '1', '1');
INSERT INTO `link` VALUES ('2', '1', '2');
INSERT INTO `link` VALUES ('3', '1', '3');
INSERT INTO `link` VALUES ('4', '1', '4');
INSERT INTO `link` VALUES ('5', '1', '5');
INSERT INTO `link` VALUES ('6', '2', '6');
INSERT INTO `link` VALUES ('7', '2', '7');
INSERT INTO `link` VALUES ('8', '2', '8');
INSERT INTO `link` VALUES ('9', '2', '9');
INSERT INTO `link` VALUES ('10', '2', '10');
INSERT INTO `link` VALUES ('11', '2', '11');
INSERT INTO `link` VALUES ('12', '2', '12');

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(60) DEFAULT NULL,
  `medicine_vulgo` varchar(60) DEFAULT NULL,
  `instruction` varchar(60) DEFAULT NULL,
  `type` varchar(60) DEFAULT NULL,
  `approvalnumber` varchar(60) DEFAULT NULL,
  `medicine_img` varchar(60) DEFAULT NULL,
  `manufacturer` varchar(60) DEFAULT NULL,
  `referenceprice` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('1', '冰硼散', null, '../medicine/1.txt', '处方药', '国药准字Z37020523', '../img/1.jpg', '山东方健制药有限公司', '4');
INSERT INTO `medicine` VALUES ('2', '醋酸地塞米松粘贴片', '意可贴', '../medicine/2.txt', '非处方药', '国药准字H19991372', '../img/2.jpg', '深圳太太制药有限公司', '14.5');
INSERT INTO `medicine` VALUES ('3', '度米芬含片', null, '../medicine/3.txt', '处方药', '国药准字H20067091', '../img/3.jpg', '山西澳迩药业有限公司', '7');
INSERT INTO `medicine` VALUES ('4', '复方庆大霉素膜', '来易贴', '../medicine/4.txt', '非处方药', '国药准字H35021425', '../img/4.jpg', '厦门金日制药有限公司', '4.5');
INSERT INTO `medicine` VALUES ('5', '口腔溃疡含片', null, '../medicine/5.txt', '非处方药', '国药准字Z20050566', '../img/5.jpg', '西安迪赛生物药业有限责任公司', '4.9');
INSERT INTO `medicine` VALUES ('6', '甲亢灵胶囊', null, '../medicine/6.txt', '处方药', '国药准字Z20090865', '../img/6.jpg', '陕西东泰制药有限公司', '24.7');
INSERT INTO `medicine` VALUES ('7', '甲巯咪唑', null, '../medicine/7.txt', '处方药', '进口药品注册证号H20120405', '../img/7.jpg', 'Merck KGaA，Darmstadt', '30');
INSERT INTO `medicine` VALUES ('8', '抑亢丸', '老君炉', '../medicine/8.txt', '处方药', '国药准字Z20055495', '../img/8.jpg', '吉林人民药业集团有限公司', '32');
INSERT INTO `medicine` VALUES ('9', '左甲状腺素钠片', null, '../medicine/9.txt', '处方药', '国药准字H20010008', '../img/9.jpg', '深圳市中联制药有限公司', '14');
INSERT INTO `medicine` VALUES ('10', '丙硫氧嘧啶片', null, '../medicine/10.txt', '处方药', '国药准字H31021082', '../img/10.jpg', '上海朝晖药业有限公司', '16.8');
INSERT INTO `medicine` VALUES ('11', '酒石酸美托洛尔片', '倍他乐克', '../medicine/11.txt', '处方药', '国药准字：H32025391', '../img/11.jpg', '阿斯利康制药有限公司', '8.5');
INSERT INTO `medicine` VALUES ('12', '硫唑嘌呤片', null, '../medicine/12.txt', '处方药', '国药准字H31021422', '../img/12.jpg', '上海信谊药厂', '84.87');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `interested` varchar(200) DEFAULT NULL,
  `user_img` varchar(60) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', '123', '123@qq.com', '', '../img/default.jpg', '1');
INSERT INTO `user` VALUES ('2', 'bbb', '123', '123@qq.com', '', '../img/default.jpg', '1');
