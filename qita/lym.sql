/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : lym

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-06-06 08:26:41
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
  `bro_time` datetime DEFAULT NULL,
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
  `com_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `medcine_id` (`medicine_id`),
  CONSTRAINT `medcine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '医生推荐的还不错', '2016-06-01 09:53:02');
INSERT INTO `comment` VALUES ('2', '1', '1', '时伟涛\r\n感觉药效一般般吧', '2016-06-02 09:58:09');
INSERT INTO `comment` VALUES ('3', '1', '1', '不怎么样......', '2016-06-03 10:00:04');
INSERT INTO `comment` VALUES ('4', '1', '1', '冒个泡', '2016-06-04 16:47:36');
INSERT INTO `comment` VALUES ('5', '1', '1', '占楼', '2016-06-03 21:24:26');
INSERT INTO `comment` VALUES ('6', '1', '2', '啦啦啦', '2016-06-04 21:24:32');
INSERT INTO `comment` VALUES ('7', '1', '2', '医生说不错的', '2016-06-11 21:24:35');
INSERT INTO `comment` VALUES ('8', '1', '2', '听医生的', '2016-06-05 21:24:42');
INSERT INTO `comment` VALUES ('9', '1', '2', '还行', '2016-06-02 21:24:46');
INSERT INTO `comment` VALUES ('10', '1', '2', '可以的......', '2016-06-01 21:24:52');

-- ----------------------------
-- Table structure for illness
-- ----------------------------
DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ill_name` varchar(60) DEFAULT NULL,
  `ill_vulgo` varchar(60) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `illness_img` varchar(60) DEFAULT NULL,
  `introduction` varchar(60) DEFAULT NULL,
  `cause` varchar(60) DEFAULT NULL,
  `checkway` varchar(60) DEFAULT NULL,
  `istransmission` int(3) DEFAULT NULL,
  `symptoms` varchar(60) DEFAULT NULL,
  `clinicdepart` varchar(60) DEFAULT NULL,
  `treat` varchar(60) DEFAULT NULL,
  `class_organ` varchar(60) DEFAULT NULL,
  `class_system` varchar(60) DEFAULT NULL,
  `class_check` varchar(60) DEFAULT NULL,
  `clicknum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', '复发性阿弗他口腔溃疡', '口腔溃疡', '复发性阿弗他口腔溃疡复发性阿弗他口炎复发性口疮口腔黏膜疾病', '../img/ill1.jpg', '../illness/1introduction.txt', '../illness/1cause.txt', '../illness/1checkway.txt', '0', '../illness/1symptoms.txt', '内科，内分泌科', '../illness/1treat.txt', '头颈部', '消化系统', '定点检诊', '148');
INSERT INTO `illness` VALUES ('2', '甲状腺功能亢进症', '甲亢', '甲亢甲状腺激素', '../img/ill2.jpg', '../illness/2introduction.txt', '../illness/2treat.txt', '../illness/2checkway.txt', '0', '../illness/2symptoms.txt', '内分泌科', '../illness/2treat.txt', '头颈部', '内分泌系统', '定点检诊', '15');
INSERT INTO `illness` VALUES ('3', '甲状腺功能减退', '甲减', '甲状腺功能减退甲减甲状腺激素', '../img/ill3.jpg', '../illness/3introduction.txt', '../illness/3treat.txt', '../illness/3checkway.txt', '0', '../illness/3symptoms.txt', '内分泌科', '../illness/3treat.txt', '头颈部', '内分泌系统', '定点检诊', '6');
INSERT INTO `illness` VALUES ('4', '贝赫切特综合征', '白塞氏病', '贝赫切特综合征白塞氏病全身性免疫系统疾病', '../img/ill4.jpg', '../illness/4introduction.txt', '../illness/4treat.txt', '../illness/4checkway.txt', '0', '../illness/4symptoms.txt', '内科', '../illness/4treat.txt', '其他', '结缔组织和风湿', '定点检诊', '3');
INSERT INTO `illness` VALUES ('5', '高血压', null, null, '../img/ill5.jpg', '../illness/5introduction.txt', '../illness/5treat.txt', '../illness/5checkway.txt', '0', '../illness/5symptoms.txt', '内科,心血管内科', '../illness/5treat.txt', '其他', '循环系统', '定点检诊', '2');
INSERT INTO `illness` VALUES ('6', '类风湿性关节炎', null, null, '../img/ill6.jpg', '../illness/6introduction.txt', '../illness/6treat.txt', '../illness/6checkway.txt', '0', '../illness/6symptoms.txt', '免疫科', '../illness/6treat.txt', '骨骼', '结缔组织和风湿', '定点检诊', '18');
INSERT INTO `illness` VALUES ('7', '淋巴结核', null, null, '../img/ill7.jpg', '../illness/7introduction.txt', '../illness/7treat.txt', '../illness/7checkway.txt', '1', '../illness/7symptoms.txt', '外科,传染科', '../illness/7treat.txt', '其他', '循环系统', '传染病检诊', '0');
INSERT INTO `illness` VALUES ('8', '慢性粒细胞白血病', null, null, '../img/ill8.jpg', '../illness/8introduction.txt', '../illness/8treat.txt', '../illness/8checkway.txt', '0', '../illness/8symptoms.txt', '内科,血液内科', '../illness/8treat.txt', '其他', '血液系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('9', '慢性淋巴细胞白血病', null, null, '../img/ill9.jpg', '../illness/9introduction.txt', '../illness/9treat.txt', '../illness/9checkway.txt', '0', '../illness/9symptoms.txt', '血液内科', '../illness/9treat.txt', '其他', '血液系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('10', '帕金森综合征', null, null, '../img/ill10.jpg', '../illness/10introduction.txt', '../illness/10treat.txt', '../illness/10checkway.txt', '0', '../illness/10symptoms.txt', '神经内科', '../illness/10treat.txt', '其他', '其他', '定点检诊', '0');
INSERT INTO `illness` VALUES ('11', '系统性红斑狼疮', null, null, '../img/ill11.jpg', '../illness/11introduction.txt', '../illness/11treat.txt', '../illness/11checkway.txt', '0', '../illness/11symptoms.txt', '风湿免疫科', '../illness/11treat.txt', '皮肤', '结缔组织和风湿', '定点检诊', '3');
INSERT INTO `illness` VALUES ('12', '严重骨质疏松', null, null, '../img/ill12.jpg', '../illness/12introduction.txt', '../illness/12treat.txt', '../illness/12checkway.txt', '0', '../illness/12symptoms.txt', '外科,骨科', '../illness/12treat.txt', '骨骼', '代谢和营养', '住院检诊', '2');
INSERT INTO `illness` VALUES ('13', '银屑病', '牛皮癣', null, '../img/ill13.jpg', '../illness/13introduction.txt', '../illness/13treat.txt', '../illness/13checkway.txt', '0', '../illness/13symptoms.txt', '皮肤科', '../illness/13treat.txt', '皮肤', '其他', '定点检诊', '0');
INSERT INTO `illness` VALUES ('14', '肿瘤', null, null, '../img/ill14.jpg', '../illness/14introduction.txt', '../illness/14treat.txt', '../illness/14checkway.txt', '0', '../illness/14symptoms.txt', '肿瘤科', '../illness/14treat.txt', '其他', '血液系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('15', '病毒性肝炎', null, null, '../img/ill15.jpg', '../illness/15introduction.txt', '../illness/15treat.txt', '../illness/15checkway.txt', '1', '../illness/15symptoms.txt', '传染科，肝炎科', '../illness/15treat.txt', '腹部', '消化系统', '传染病检诊', '0');
INSERT INTO `illness` VALUES ('16', '陈旧性心肌梗塞', null, null, '../img/ill16.jpg', '../illness/16introduction.txt', '../illness/16treat.txt', '../illness/16checkway.txt', '0', '../illness/16symptoms.txt', '心内科', '../illness/16treat.txt', '胸部', '循环系统', '住院检诊', '1');
INSERT INTO `illness` VALUES ('17', '肺源性心脏病', null, null, '../img/ill17.jpg', '../illness/17introduction.txt', '../illness/17treat.txt', '../illness/17checkway.txt', '0', '../illness/17symptoms.txt', '心内科', '../illness/17treat.txt', '胸部', '呼吸系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('18', '风湿性心脏病', null, null, '../img/ill18.jpg', '../illness/18introduction.txt', '../illness/18treat.txt', '../illness/18checkway.txt', '0', '../illness/18symptoms.txt', '心内科', '../illness/18treat.txt', '胸部', '循环系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('19', '肝硬化', null, null, '../img/ill19.jpg', '../illness/19introduction.txt', '../illness/19treat.txt', '../illness/19checkway.txt', '0', '../illness/19symptoms.txt', '消化内科', '../illness/19treat.txt', '腹部', '循环系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('20', '慢性肾病', null, null, '../img/ill20.jpg', '../illness/20introduction.txt', '../illness/20treat.txt', '../illness/20checkway.txt', '0', '../illness/20symptoms.txt', '内科', '../illness/20treat.txt', '腰部', '泌尿系统', '住院检诊', '0');
INSERT INTO `illness` VALUES ('21', '糖尿病', null, null, '../img/ill21.jpg', '../illness/21introduction.txt', '../illness/21treat.txt', '../illness/21checkway.txt', '0', '../illness/21symptoms.txt', '内科,内分泌科', '../illness/21treat.txt', '腰部', '代谢和营养', '定点检诊', '0');
INSERT INTO `illness` VALUES ('22', '阻塞性肺气肿', null, null, '../img/ill22.jpg', '../illness/22introduction.txt', '../illness/22treat.txt', '../illness/22checkway.txt', '0', '../illness/22symptoms.txt', '呼吸内科', '../illness/22treat.txt', '胸部', '呼吸系统', '定点检诊', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

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
INSERT INTO `link` VALUES ('13', '3', '9');
INSERT INTO `link` VALUES ('14', '3', '13');
INSERT INTO `link` VALUES ('15', '3', '14');
INSERT INTO `link` VALUES ('16', '4', '15');
INSERT INTO `link` VALUES ('17', '4', '16');
INSERT INTO `link` VALUES ('18', '4', '17');
INSERT INTO `link` VALUES ('19', '4', '18');
INSERT INTO `link` VALUES ('20', '4', '19');
INSERT INTO `link` VALUES ('21', '4', '20');
INSERT INTO `link` VALUES ('22', '5', '21');
INSERT INTO `link` VALUES ('23', '5', '22');
INSERT INTO `link` VALUES ('24', '5', '23');
INSERT INTO `link` VALUES ('25', '5', '24');
INSERT INTO `link` VALUES ('26', '5', '25');
INSERT INTO `link` VALUES ('27', '5', '26');
INSERT INTO `link` VALUES ('28', '5', '27');
INSERT INTO `link` VALUES ('29', '5', '28');
INSERT INTO `link` VALUES ('30', '6', '29');
INSERT INTO `link` VALUES ('31', '6', '30');
INSERT INTO `link` VALUES ('32', '6', '31');
INSERT INTO `link` VALUES ('33', '6', '32');
INSERT INTO `link` VALUES ('34', '6', '33');
INSERT INTO `link` VALUES ('35', '6', '34');
INSERT INTO `link` VALUES ('36', '6', '35');
INSERT INTO `link` VALUES ('37', '6', '36');
INSERT INTO `link` VALUES ('38', '6', '37');
INSERT INTO `link` VALUES ('39', '6', '38');
INSERT INTO `link` VALUES ('40', '7', '39');
INSERT INTO `link` VALUES ('41', '7', '40');
INSERT INTO `link` VALUES ('42', '7', '41');
INSERT INTO `link` VALUES ('43', '7', '42');
INSERT INTO `link` VALUES ('44', '7', '43');
INSERT INTO `link` VALUES ('45', '7', '44');
INSERT INTO `link` VALUES ('46', '7', '45');
INSERT INTO `link` VALUES ('47', '8', '46');
INSERT INTO `link` VALUES ('48', '8', '47');
INSERT INTO `link` VALUES ('49', '8', '48');
INSERT INTO `link` VALUES ('50', '8', '12');
INSERT INTO `link` VALUES ('51', '8', '49');
INSERT INTO `link` VALUES ('52', '8', '50');
INSERT INTO `link` VALUES ('53', '9', '47');
INSERT INTO `link` VALUES ('54', '9', '51');
INSERT INTO `link` VALUES ('55', '9', '18');
INSERT INTO `link` VALUES ('56', '9', '53');
INSERT INTO `link` VALUES ('57', '9', '54');
INSERT INTO `link` VALUES ('58', '9', '55');
INSERT INTO `link` VALUES ('59', '9', '56');
INSERT INTO `link` VALUES ('60', '10', '57');
INSERT INTO `link` VALUES ('61', '10', '58');
INSERT INTO `link` VALUES ('62', '10', '59');
INSERT INTO `link` VALUES ('63', '10', '60');
INSERT INTO `link` VALUES ('64', '10', '61');
INSERT INTO `link` VALUES ('65', '10', '62');
INSERT INTO `link` VALUES ('66', '10', '63');
INSERT INTO `link` VALUES ('67', '11', '64');
INSERT INTO `link` VALUES ('68', '11', '65');
INSERT INTO `link` VALUES ('69', '11', '66');
INSERT INTO `link` VALUES ('70', '11', '12');
INSERT INTO `link` VALUES ('71', '11', '67');
INSERT INTO `link` VALUES ('72', '11', '68');
INSERT INTO `link` VALUES ('73', '11', '69');
INSERT INTO `link` VALUES ('74', '11', '70');
INSERT INTO `link` VALUES ('75', '12', '14');
INSERT INTO `link` VALUES ('76', '12', '71');
INSERT INTO `link` VALUES ('77', '12', '72');
INSERT INTO `link` VALUES ('78', '12', '73');
INSERT INTO `link` VALUES ('79', '12', '74');
INSERT INTO `link` VALUES ('80', '12', '75');
INSERT INTO `link` VALUES ('81', '13', '76');
INSERT INTO `link` VALUES ('82', '13', '77');
INSERT INTO `link` VALUES ('83', '13', '78');
INSERT INTO `link` VALUES ('84', '13', '79');
INSERT INTO `link` VALUES ('85', '13', '80');
INSERT INTO `link` VALUES ('86', '13', '81');
INSERT INTO `link` VALUES ('87', '13', '82');
INSERT INTO `link` VALUES ('88', '13', '83');
INSERT INTO `link` VALUES ('89', '14', '84');
INSERT INTO `link` VALUES ('90', '14', '85');
INSERT INTO `link` VALUES ('91', '14', '86');
INSERT INTO `link` VALUES ('92', '14', '87');
INSERT INTO `link` VALUES ('93', '14', '12');
INSERT INTO `link` VALUES ('94', '14', '88');
INSERT INTO `link` VALUES ('95', '14', '89');
INSERT INTO `link` VALUES ('96', '15', '90');
INSERT INTO `link` VALUES ('97', '15', '91');
INSERT INTO `link` VALUES ('98', '15', '92');
INSERT INTO `link` VALUES ('99', '15', '93');
INSERT INTO `link` VALUES ('100', '15', '94');
INSERT INTO `link` VALUES ('101', '15', '49');
INSERT INTO `link` VALUES ('102', '15', '96');
INSERT INTO `link` VALUES ('103', '16', '97');
INSERT INTO `link` VALUES ('104', '16', '98');
INSERT INTO `link` VALUES ('105', '16', '99');
INSERT INTO `link` VALUES ('106', '16', '100');
INSERT INTO `link` VALUES ('107', '16', '101');
INSERT INTO `link` VALUES ('108', '16', '102');
INSERT INTO `link` VALUES ('109', '17', '103');
INSERT INTO `link` VALUES ('110', '17', '104');
INSERT INTO `link` VALUES ('111', '17', '105');
INSERT INTO `link` VALUES ('112', '17', '106');
INSERT INTO `link` VALUES ('113', '17', '107');
INSERT INTO `link` VALUES ('114', '17', '108');
INSERT INTO `link` VALUES ('115', '17', '109');
INSERT INTO `link` VALUES ('116', '18', '110');
INSERT INTO `link` VALUES ('117', '18', '98');
INSERT INTO `link` VALUES ('118', '18', '112');
INSERT INTO `link` VALUES ('119', '18', '113');
INSERT INTO `link` VALUES ('120', '18', '114');
INSERT INTO `link` VALUES ('121', '18', '115');
INSERT INTO `link` VALUES ('122', '19', '116');
INSERT INTO `link` VALUES ('123', '19', '117');
INSERT INTO `link` VALUES ('124', '19', '118');
INSERT INTO `link` VALUES ('125', '19', '119');
INSERT INTO `link` VALUES ('126', '19', '120');
INSERT INTO `link` VALUES ('127', '19', '121');
INSERT INTO `link` VALUES ('128', '19', '122');
INSERT INTO `link` VALUES ('129', '19', '123');
INSERT INTO `link` VALUES ('130', '20', '124');
INSERT INTO `link` VALUES ('131', '20', '125');
INSERT INTO `link` VALUES ('132', '20', '126');
INSERT INTO `link` VALUES ('133', '20', '127');
INSERT INTO `link` VALUES ('134', '20', '128');
INSERT INTO `link` VALUES ('135', '20', '129');
INSERT INTO `link` VALUES ('136', '20', '130');
INSERT INTO `link` VALUES ('137', '20', '131');
INSERT INTO `link` VALUES ('138', '21', '132');
INSERT INTO `link` VALUES ('139', '21', '133');
INSERT INTO `link` VALUES ('140', '21', '134');
INSERT INTO `link` VALUES ('141', '21', '135');
INSERT INTO `link` VALUES ('142', '21', '136');
INSERT INTO `link` VALUES ('143', '21', '137');
INSERT INTO `link` VALUES ('144', '21', '138');
INSERT INTO `link` VALUES ('145', '21', '139');
INSERT INTO `link` VALUES ('146', '22', '140');
INSERT INTO `link` VALUES ('147', '22', '141');
INSERT INTO `link` VALUES ('148', '22', '142');
INSERT INTO `link` VALUES ('149', '22', '143');
INSERT INTO `link` VALUES ('150', '22', '144');
INSERT INTO `link` VALUES ('151', '22', '145');
INSERT INTO `link` VALUES ('152', '22', '146');
INSERT INTO `link` VALUES ('153', '22', '147');

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
  `clicknum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('1', '冰硼散', null, '../medicine/1.txt', '处方药', '国药准字Z37020523', '../img/1.jpg', '山东方健制药有限公司', '4.00', '211');
INSERT INTO `medicine` VALUES ('2', '醋酸地塞米松粘贴片', '意可贴', '../medicine/2.txt', '非处方药', '国药准字H19991372', '../img/2.jpg', '深圳太太制药有限公司', '14.5', '76');
INSERT INTO `medicine` VALUES ('3', '度米芬含片', null, '../medicine/3.txt', '处方药', '国药准字H20067091', '../img/3.jpg', '山西澳迩药业有限公司', '7.00', '9');
INSERT INTO `medicine` VALUES ('4', '复方庆大霉素膜', '来易贴', '../medicine/4.txt', '非处方药', '国药准字H35021425', '../img/4.jpg', '厦门金日制药有限公司', '4.5', '1');
INSERT INTO `medicine` VALUES ('5', '口腔溃疡含片', null, '../medicine/5.txt', '非处方药', '国药准字Z20050566', '../img/5.JPG', '西安迪赛生物药业有限责任公司', '4.9', '0');
INSERT INTO `medicine` VALUES ('6', '甲亢灵胶囊', null, '../medicine/6.txt', '处方药', '国药准字Z20090865', '../img/6.jpg', '陕西东泰制药有限公司', '24.7', '3');
INSERT INTO `medicine` VALUES ('7', '甲巯咪唑', null, '../medicine/7.txt', '处方药', '进口药品注册证号H20120405', '../img/7.jpg', 'Merck KGaA，Darmstadt', '30.00', '2');
INSERT INTO `medicine` VALUES ('8', '抑亢丸', '老君炉', '../medicine/8.txt', '处方药', '国药准字Z20055495', '../img/8.jpg', '吉林人民药业集团有限公司', '32.00', '0');
INSERT INTO `medicine` VALUES ('9', '左甲状腺素钠片', null, '../medicine/9.txt', '处方药', '国药准字H20010008', '../img/9.jpg', '深圳市中联制药有限公司', '14.00', '1');
INSERT INTO `medicine` VALUES ('10', '丙硫氧嘧啶片', null, '../medicine/10.txt', '处方药', '国药准字H31021082', '../img/10.jpg', '上海朝晖药业有限公司', '16.8', '0');
INSERT INTO `medicine` VALUES ('11', '酒石酸美托洛尔片', '倍他乐克', '../medicine/11.txt', '处方药', '国药准字：H32025391', '../img/11.jpg', '阿斯利康制药有限公司', '8.5', '0');
INSERT INTO `medicine` VALUES ('12', '硫唑嘌呤片', null, '../medicine/12.txt', '处方药', '国药准字H31021422', '../img/12.jpg', '上海信谊药厂', '84.87', '0');
INSERT INTO `medicine` VALUES ('13', '甲状腺片', null, '../medicine/13.txt', '处方药', '国药准字H37021098', '../img/13.jpg', '山东仁和制药有限公司', '13.80', '1');
INSERT INTO `medicine` VALUES ('14', '阿法骨化醇软胶囊', null, '../medicine/14.txt', '处方药', '国药准字J20030092', '../img/14.jpg', '昆明贝克诺顿制药有限公司', '78.9', '2');
INSERT INTO `medicine` VALUES ('15', '环孢菌素A', '新山地明', '../medicine/15.txt', '处方药', '国药准字H20090498', '../img/15.jpg', 'R.P. Scherer GmbH Co. KG', '245.00', '0');
INSERT INTO `medicine` VALUES ('16', '甲氨蝶呤片', null, '../medicine/16.txt', '处方药', '国药准字H22022674', '../img/16.jpg', '通化茂祥制药有限公司', '180.0', '0');
INSERT INTO `medicine` VALUES ('17', '卡介菌多糖核酸注射液', '斯奇康', '../medicine/17.txt', '处方药', '国药准字s20020019', '../img/17.jpg', '湖南斯奇生物制药有限公司', '47.00', '0');
INSERT INTO `medicine` VALUES ('18', '苯丁酸氮芥片', '留可然', '../medicine/18.txt', '处方药', '国药准字H20090171', '../img/18.jpg', '德国Excella GmbH', '195.00', '0');
INSERT INTO `medicine` VALUES ('19', '秋水仙碱片', null, '../medicine/19.txt', '处方药', '国药准字H53021369', '../img/19.jpg', '滇西双版纳', '5.50', '0');
INSERT INTO `medicine` VALUES ('20', '吲哚美辛栓', '静青', '../medicine/20.txt', '处方药', '国药准字H42021462', '../img/20.jpg', '湖北东信药业有限公司', '3.50', '1');
INSERT INTO `medicine` VALUES ('21', '琥珀酸美托洛尔缓释片', '倍他乐克', '../medicine/21.txt', '处方药', '国药准字J20100098', '../img/21.jpg', '阿斯利康制药有限公司', '18.90', '4');
INSERT INTO `medicine` VALUES ('22', '富马酸比索洛尔片', '博苏', '../medicine/22.txt', '处方药', '国药准字H10970082', '../img/22.jpg', '北京华素制药股份有限公司', '19.50', '0');
INSERT INTO `medicine` VALUES ('23', '盐酸拉贝洛尔片', null, '../medicine/23.txt', '处方药', '国药准字H32026120', '../img/23.jpg', '江苏迪赛诺制药有限公司', '15.00', '0');
INSERT INTO `medicine` VALUES ('24', '苯磺酸氨氯地平片', '络活喜', '../medicine/24.txt', '处方药', '国药准字H10950224', '../img/24.jpg', '辉瑞制药有限公司', '320.00', '0');
INSERT INTO `medicine` VALUES ('25', '高血压速降丸', null, '../medicine/25.txt', '处方药', '国药准字Z11020301', '../img/25.jpg', '北京同仁堂科技发展股份有限公司制药厂', '40.00', '2');
INSERT INTO `medicine` VALUES ('26', '马来酸依那普利片', null, '../medicine/26.txt', '处方药', '国药准字H31021938', '../img/26.jpg', '上海现代制药股份有限公司', '8.50', '0');
INSERT INTO `medicine` VALUES ('27', '硝苯地平控释片', '欣然', '../medicine/27.txt', '处方药', '国药准字H20000079', '../img/27.jpg', '上海现代制药股份有限公司', '16.90', '0');
INSERT INTO `medicine` VALUES ('28', '厄贝沙坦片', '伊达力', '../medicine/28.txt', '处方药', '国药准字H20040996', '../img/28.jpg', '海正辉瑞制药有限公司', '9.00', '0');
INSERT INTO `medicine` VALUES ('29', '复方硫酸软骨素片', null, '../medicine/29.txt', '处方药', '国药准字H32025701', '../img/29.jpg', '江苏克胜药业有限公司', '12.90', '2');
INSERT INTO `medicine` VALUES ('30', '双氯芬酸钠缓释片', '迪根', '../medicine/30.txt', '处方药', '国药准字H10970209', '../img/30.jpg', '深圳致君制药有限公司', '7.00', '0');
INSERT INTO `medicine` VALUES ('31', '胸腺肽肠溶片', null, '../medicine/31.txt', '处方药', '国药准字H19991176', '../img/31.jpg', '西安迪赛生物药业有限责任公司', '76.80', '0');
INSERT INTO `medicine` VALUES ('32', '尪痹片', null, '../medicine/32.txt', '处方药', '国药准字Z20044066', '../img/32.jpg', '纽迪希亚制药(无锡)有限公司', '35.00', '0');
INSERT INTO `medicine` VALUES ('33', '美洛昔康片', null, '../medicine/33.txt', '处方药', '国药准字H20010207', '../img/33.jpg', '扬子江药业集团有限公司', '18.00', '0');
INSERT INTO `medicine` VALUES ('34', '金天格胶囊', null, '../medicine/34.txt', '处方药', '国药准字Z20030080', '../img/34.jpg', '西安金花制药厂', '45.00', '0');
INSERT INTO `medicine` VALUES ('35', '醋氯芬酸分散片', '莱亿芬', '../medicine/35.txt', '处方药', '国药准字H20050253', '../img/35.jpg', '濮阳市仲亿药业有限公司', '21.50', '0');
INSERT INTO `medicine` VALUES ('36', '大风丸', '卢医山', '../medicine/36.txt', '非处方药', '国药准字Z14021936', '../img/36.jpg', '山西昂生药业有限责任公司', '21.00', '0');
INSERT INTO `medicine` VALUES ('37', '醋氯芬酸片', '美诺芬', '../medicine/37.txt', '处方药', '国药准字H20020231', '../img/37.jpg', '西安海欣制药有限公司', '15.00', '0');
INSERT INTO `medicine` VALUES ('38', '雷公藤多苷片', null, '../medicine/38.txt', '处方药', '国药准字Z43020138', '../img/38.jpg', '湖南协力药业有限公司', '12.80', '0');
INSERT INTO `medicine` VALUES ('39', '内消瘰疬丸', null, '../medicine/39.txt', '处方药', '国药准字Z20026691', '../img/39.jpg', '兰州佛慈制药股份有限公司', '35.00', '0');
INSERT INTO `medicine` VALUES ('40', '夏枯草胶囊', null, '../medicine/40.txt', '处方药', '国药准字Z19991033', '../img/40.jpg', '聚协昌（北京）药业有限公司', '22.50', '0');
INSERT INTO `medicine` VALUES ('41', '利福平胶囊', null, '../medicine/41.txt', '处方药', '国药准字H44020771', '../img/41.jpg', '广东华南药业集团有限公司', '24.00', '0');
INSERT INTO `medicine` VALUES ('42', '内消瘰疬片', null, '../medicine/42.txt', '处方药', '国药准字Z12020267', '../img/42.jpg', '天津中新药业集团股份有限公司隆顺榕制药厂', '50.00', '0');
INSERT INTO `medicine` VALUES ('43', '克比热提片', null, '../medicine/43.txt', '处方药', '国药准字Z20054488', '../img/43.jpg', '陕西盘龙药业集团股份有限公司', '22.00', '0');
INSERT INTO `medicine` VALUES ('44', '夏枯草膏', '', '../medicine/44.txt', '处方药', '国药准字Z42021216', '../img/44.jpg', '黄石飞云制药有限公司', '28.00', '0');
INSERT INTO `medicine` VALUES ('45', '异烟肼片', null, '../medicine/45.txt', '处方药', '国药准字H44020699', '../img/45.jpg', '广东华南药业集团有限公司', '4.00', '0');
INSERT INTO `medicine` VALUES ('46', '注射用重组人干扰素α2b', '安达芬', '../medicine/46.txt', '非处方药', '国药准字S19980082', '../img/46.jpg', '北京医药公司', '39.5', '0');
INSERT INTO `medicine` VALUES ('47', '白消安片', null, '../medicine/47.txt', '非处方药', '国药准字H33020770', '../img/47.jpg', '浙江海正药业股份有限公司', '1.90', '0');
INSERT INTO `medicine` VALUES ('48', '硫鸟嘌呤片', null, '../medicine/48.txt', '非处方药', '国药准字H33020400', '../img/48.jpg', '浙江海力生制药公司', '90.00', '0');
INSERT INTO `medicine` VALUES ('49', '注射用重组人干扰素α1b', '赛若金', '../medicine/49.txt', '非处方药', '国药准字S20033034', '../img/49.jpg', '安徽省芬格欣药业有限公司', '85.00', '0');
INSERT INTO `medicine` VALUES ('50', '注射用重组人干扰素α2b', '安达芬', '../medicine/50.txt', '处方药', '国药准字S19980083', '../img/50.jpg', '安徽安科生物工程(集团)股份有限公司', '76', '0');
INSERT INTO `medicine` VALUES ('51', '复方环磷酰胺片', null, '../medicine/51.txt', '非处方药', '国药准字H20084627', '../img/51.jpeg', '浙江海正药业股份有限公司', '49.00', '0');
INSERT INTO `medicine` VALUES ('52', '苯丁酸氮芥片', '留可然', '../medicine/52.txt', '处方药', '国药准字H20090171', '../img/52.jpg', '德国Excella GmbH', '195.00', '0');
INSERT INTO `medicine` VALUES ('53', '巯嘌呤片', null, '../medicine/53.txt', '处方药', '国药准字H61021058', '../img/53.jpg', '陕西兴邦药业有限公司', '55.00', '0');
INSERT INTO `medicine` VALUES ('54', '达沙替尼片', '依尼舒', '../medicine/54.txt', '处方药', '国药准字H20133272', '../img/54.jpg', '正大天晴药业集团股份有限公司', '570.00', '0');
INSERT INTO `medicine` VALUES ('55', '注射用硫酸长春新碱', null, '../medicine/55.txt', '处方药', '国药准字H20045032', '../img/55.gif', '黄石李时珍药业集团武汉李时珍药业有限公司', '10.50', '0');
INSERT INTO `medicine` VALUES ('56', '注射用门冬酰胺酶', null, '../medicine/56.txt', '处方药', '国药准字H20065348', '../img/56.jpg', '北京双鹭药业股份有限公司', '177.70', '0');
INSERT INTO `medicine` VALUES ('57', '甲磺酸培高利特片', '协良行', '../medicine/57.txt', '处方药', '国药准字H20030056', '../img/57.jpg', '美国礼来公司', '213.00', '0');
INSERT INTO `medicine` VALUES ('58', '卡比多巴片', null, '../medicine/58.txt', '处方药', '国药准字H10970017', '../img/58.jpg', '精华制药集团股份有限公司', '270.00', '0');
INSERT INTO `medicine` VALUES ('59', '卡左双多巴控释片', '息宁', '../medicine/59.txt', '处方药', '国药准字J20050032', '../img/59.jpg', '杭州默沙东制药有限公司', '98.00', '0');
INSERT INTO `medicine` VALUES ('60', '多巴丝肼片', '美多芭', '../medicine/60.txt', '处方药', '国药准字H10930198', '../img/60.jpg', '上海罗氏制药有限公司', '80.00', '0');
INSERT INTO `medicine` VALUES ('61', '盐酸苯海索片', null, '../medicine/61.txt', '处方药', '国药准字H32022135', '../img/61.jpg', '常州康普药业有限公司', '9.00', '0');
INSERT INTO `medicine` VALUES ('62', '盐酸金刚烷胺片', null, '../medicine/62.txt', '处方药', '国药准字H31021561', '../img/62.jpg', '上海衡山药业有限公司', '8.00', '0');
INSERT INTO `medicine` VALUES ('63', '多巴丝肼胶囊', '优多巴', '../medicine/63.txt', '处方药', '国药准字H31021392', '../img/63.jpg', '上海益生源药业有限公司', '68.00', '0');
INSERT INTO `medicine` VALUES ('64', '醋酸泼尼松片', null, '../medicine/64.txt', '处方药', '国药准字H31020675', '../img/64.jpg', '上海医药(集团)有限公司信谊制药总厂', '8.00', '0');
INSERT INTO `medicine` VALUES ('65', '胸腺肽肠溶胶囊', '康司艾', '../medicine/65.txt', '处方药', '国药准字H19991132', '../img/65.jpg', '上海宝龙药业有限公司', '50.00', '0');
INSERT INTO `medicine` VALUES ('66', '硫酸羟氯喹片', '纷乐', '../medicine/66.txt', '处方药', '国药准字H19990263', '../img/66.jpg', '上海中西制药有限公司', '330.00', '0');
INSERT INTO `medicine` VALUES ('67', '狼疮丸', '强列', '../medicine/67.txt', '处方药', '国药准字Z22021973', '../img/67.jpg', '长春海外制药集团有限公司', '82.00', '0');
INSERT INTO `medicine` VALUES ('68', '曲安西龙片', '阿赛松', '../medicine/68.txt', '处方药', '国药准字H10960056', '../img/68.jpg', '天津天药药业股份有限公司', '18.75', '0');
INSERT INTO `medicine` VALUES ('69', '哈西奈德乳膏', null, '../medicine/69.txt', '处方药', '国药准字H12020695', '../img/69.jpg', '安徽新和成皖南药业有限公司', '5.00', '0');
INSERT INTO `medicine` VALUES ('70', '薄芝片', null, '../medicine/70.txt', '处方药', '国药准字Z33020473', '../img/70.jpg', '浙江瑞新药业股份有限公司', '21.00', '0');
INSERT INTO `medicine` VALUES ('71', '骨康胶囊', '奥奇宁', '../medicine/71.txt', '处方药', '国药准字Z20025657', '../img/71.jpg', '贵州维康药业有限公司', '48.00', '1');
INSERT INTO `medicine` VALUES ('72', '骨疏康胶囊', null, '../medicine/72.txt', '处方药', '国药准字Z20060270', '../img/72.jpg', '辽宁康辰药业有限公司', '32.00', '0');
INSERT INTO `medicine` VALUES ('73', '骨松宝颗粒', null, '../medicine/73.txt', '处方药', '国药准字Z20030084', '../img/73.jpg', '贵州富华药业有限责任公司', '367.50', '0');
INSERT INTO `medicine` VALUES ('74', '依普黄酮片', null, '../medicine/74.txt', '处方药', '国药准字H20010477', '../img/74.jpg', '湖北四环制药有限公司', '29.00', '0');
INSERT INTO `medicine` VALUES ('75', '依替膦酸二钠片', '依膦', '../medicine/75.txt', '处方药', '国药准字H10970034', '../img/75.jpg', '正大天晴药业集团股份有限公司', '35.00', '0');
INSERT INTO `medicine` VALUES ('76', '复方氟米松软膏', '奥深', '../medicine/76.txt', '处方药', '医药产品注册证号:HC20100009', '../img/76.jpg', '香港澳美制药厂', '24.50', '0');
INSERT INTO `medicine` VALUES ('77', '卤米松乳膏', '澳能', '../medicine/77.txt', '处方药', '医药产品注册证号HC20100039', '../img/77.jpg', '香港澳美制药厂', '35.00', '0');
INSERT INTO `medicine` VALUES ('78', '冰黄肤乐软膏', null, '../medicine/78.txt', '处方药', '国药准字Z10980140', '../img/78.jpg', '西藏芝芝药业有限公司', '30.00', '0');
INSERT INTO `medicine` VALUES ('79', '醋酸氟轻松软膏', null, '../medicine/79.txt', '处方药', '国药准字H12020838', '../img/79.jpg', '天津太平洋制药有限公司', '3.00', '0');
INSERT INTO `medicine` VALUES ('80', '复方氨肽素片', '迪银', '../medicine/80.txt', '处方药', '国药准字H50021778', '../img/80.jpg', '重庆华邦制药有限公司', '48.00', '0');
INSERT INTO `medicine` VALUES ('81', '消银片', null, '../medicine/81.txt', '处方药', '国药准字Z10910020', '../img/81.jpg', '黑龙江福和华星制药集团股份有限公司', '44.90', '0');
INSERT INTO `medicine` VALUES ('82', '曲安奈德新霉素贴膏', null, '../medicine/82.txt', '处方药', '国药准字H44024941', '../img/82.jpg', '广东恒健制药有限公司', '64.00', '0');
INSERT INTO `medicine` VALUES ('83', '百癣夏塔热片', null, '../medicine/83.txt', '非处方药', '国药准字Z20053609', '../img/83.jpg', '陕西君碧莎制药有限公司', '12.90', '0');
INSERT INTO `medicine` VALUES ('84', '安康欣胶囊', null, '../medicine/84.txt', '处方药', '国药准字Z20023377', '../img/84.jpg', '安徽高山药业有限公司', '126.00', '0');
INSERT INTO `medicine` VALUES ('85', '华蟾素胶囊', null, '../medicine/85.txt', '处方药', '国药准字Z20050846', '../img/85.jpg', '陕西东泰制药有限公司', '198.00', '0');
INSERT INTO `medicine` VALUES ('86', '甲氨蝶呤片', null, '../medicine/86.txt', '处方药', '国药准字H22022674', '../img/86.jpg', '通化茂祥制药有限公司', '180.00', '0');
INSERT INTO `medicine` VALUES ('87', '康力欣胶囊', null, '../medicine/87.txt', '处方药', '国药准字Z20025075', '../img/87.jpg', '云南名扬药业有限公司', '1050.00', '0');
INSERT INTO `medicine` VALUES ('88', '甲泼尼龙片', '美卓乐', '../medicine/88.txt', '处方药', '进口药品注册证号H20110064', '../img/88.jpg', 'Pharmacia Italia S.p.A', '34.00', '0');
INSERT INTO `medicine` VALUES ('89', '氨酚羟考酮片', '泰勒宁', '../medicine/89.txt', '处方药', '国药准字J20150115', '../img/89.jpg', '国药集团工业有限公司', '940.00', '0');
INSERT INTO `medicine` VALUES ('90', '转移因子口服溶液', null, '../medicine/90.txt', '处方药', '国药准字H20054276', '../img/90.jpg', '大连百利天华制药有限公司', '9.2', '0');
INSERT INTO `medicine` VALUES ('91', '益肝灵片', null, '../medicine/91.txt', '处方药', '国药准字Z31020107', '../img/91.jpg', '上海朝辉药业有限公司', '11.5', '0');
INSERT INTO `medicine` VALUES ('92', '泛昔洛韦片', null, '../medicine/92.txt', '处方药', '国药准字H19991379', '../img/92.jpg', '海正辉瑞制药有限公司', '14.5', '0');
INSERT INTO `medicine` VALUES ('93', '拉米夫定片', '健甘灵', '../medicine/93.txt', '处方药', '国药准字H120103481', '../img/93.jpg', '湖南千金湘江药业股份有限公司', '133.00', '0');
INSERT INTO `medicine` VALUES ('94', '转移因子胶囊', null, '../medicine/94.txt', '处方药', '国药准字H20013360', '../img/94.jpg', '金花企业（集团）股份有限公司金花制药厂', '11.38', '0');
INSERT INTO `medicine` VALUES ('95', null, null, '', '处方药', null, '../img/95.jpg', null, null, '0');
INSERT INTO `medicine` VALUES ('96', '苦参素软胶囊', '沃森干泰', '../medicine/96.txt', '处方药', '国药准字H20030843', '../img/96.jpg', '杨凌华盛生物制药有限公司', '32.80', '0');
INSERT INTO `medicine` VALUES ('97', '阿司匹林肠溶片', null, '../medicine/97.txt', '处方药', '国药准字J20130078', '../img/97.jpg', '德国拜耳医药保健有限公司', '14.50', '0');
INSERT INTO `medicine` VALUES ('98', '琥珀酸美托洛尔缓释片', null, '../medicine/98.txt', '处方药', '国药准字J20100098', '../img/98.jpg', '阿斯利康（中国）制药有限公司', '18.90', '0');
INSERT INTO `medicine` VALUES ('99', '冠心静胶囊', null, '../medicine/99.txt', '处方药', '国药准字Z20025812', '../img/99.jpg', '保定中药制药有限公司', '31.50', '0');
INSERT INTO `medicine` VALUES ('100', '可达灵片', null, '../medicine/100.txt', '处方药', '国药准字Z20044361', '../img/100.jpg', '浙江康恩贝制药股份有限公司', '78.00', '0');
INSERT INTO `medicine` VALUES ('101', '救心丸', null, '../medicine/101.txt', '处方药', '注册证号Z20100012', '../img/101.jpg', '日本救心制药株式会社', '133.00', '0');
INSERT INTO `medicine` VALUES ('102', '硝苯地平控释片', null, '../medicine/102.txt', '处方药', '国药准字H20000079', '../img/102.jpg', '上海现代制药股份有限公司', '16.90', '0');
INSERT INTO `medicine` VALUES ('103', '清肺十八味丸', null, '../medicine/103.txt', '处方药', '国药准字Z21020270', '../img/103.jpg', '阜新蒙药有限责任公司', '32.00', '0');
INSERT INTO `medicine` VALUES ('104', '喘嗽宁片', null, '../medicine/104.txt', '处方药', '国药准字Z22025559', '../img/104.jpg', '修正药业集团股份有限公司', '31.00', '0');
INSERT INTO `medicine` VALUES ('105', '祛痰止咳颗粒', null, '../medicine/105.txt', '处方药', '国药准字Z44020143', '../img/105.jpg', '广州市花城制药厂', '19.50', '0');
INSERT INTO `medicine` VALUES ('106', '补金片', null, '../medicine/106.txt', '处方药', '国药准字Z22021815', '../img/106.jpg', '通化民泰药业股份有限公司', '24.00', '0');
INSERT INTO `medicine` VALUES ('107', '如意定喘片', null, '../medicine/107.txt', '处方药', '国药准字Z19983161', '../img/107.jpg', '四川好医生攀西药业有限责任公司', '45.00', '0');
INSERT INTO `medicine` VALUES ('108', '二十五味肺病丸', null, '../medicine/108.txt', '处方药', '国药准字Z20023278', '../img/108.jpg', '西藏神猴药业有限责任公司', '28.40', '0');
INSERT INTO `medicine` VALUES ('109', '丹葶肺心颗粒', null, '../medicine/109.txt', '处方药', '国药准字Z20030098', '../img/109.jpg', '吉林万通药业有限公司', '44.00', '0');
INSERT INTO `medicine` VALUES ('110', '复方丹参片', null, '../medicine/110.txt', '处方药', '国药准字Z44023372', '../img/110.jpg', '广州白云山和记黄埔中药有限公司', '29.80', '0');
INSERT INTO `medicine` VALUES ('111', null, null, '', '处方药', null, '../img/111.jpg', null, null, '0');
INSERT INTO `medicine` VALUES ('112', '利心丸', null, '../medicine/112.txt', '处方药', '国药准字Z22022569', '../img/112.jpg', '吉林市鹿王制药股份有限公司', '20.00', '0');
INSERT INTO `medicine` VALUES ('113', '尼可地尔片', null, '../medicine/113.txt', '处方药', '注册证号H20150023', '../img/113.jpg', 'Tohoku Nipro Pharmaceutical Corporation', '246.00', '0');
INSERT INTO `medicine` VALUES ('114', '硝苯地平控释片', null, '../medicine/114.txt', '处方药', '国药准字H20000079', '../img/114.jpg', '上海现代制药股份有限公司', '16.90', '0');
INSERT INTO `medicine` VALUES ('115', '厄贝沙坦片', null, '../medicine/115.txt', '处方药', '国药准字H20040996', '../img/115.jpg', '海正辉瑞制药有限公司', '9.00', '0');
INSERT INTO `medicine` VALUES ('116', '肝爽颗粒', null, '../medicine/116.txt', '处方药', '国药准字Z20027671', '../img/116.jpg', '保定步长天浩制药有限责任公司', '45.00', '0');
INSERT INTO `medicine` VALUES ('117', '复方鳖甲软肝片', null, '../medicine/117.txt', '处方药', '国药准字Z19991011', '../img/117.jpg', '内蒙古福瑞中蒙药科技股份有限公司', '80.00', '0');
INSERT INTO `medicine` VALUES ('118', '布美他尼片', null, '../medicine/118.txt', '处方药', '国药准字H35020503', '../img/118.jpg', '福州海王福药制药有限公司', '17.00', '0');
INSERT INTO `medicine` VALUES ('119', '五酯胶囊', null, '../medicine/119.txt', '处方药', '国药准字Z10983013', '../img/119.jpg', '四川禾正制药有限责任公司', '25.00', '0');
INSERT INTO `medicine` VALUES ('120', '臌症丸', null, '../medicine/120.txt', '处方药', '国药准字Z19983013', '../img/120.jpg', '邯郸制药股份有限公司', '288.00', '0');
INSERT INTO `medicine` VALUES ('121', '安络化纤丸', null, '../medicine/121.txt', '处方药', '国药准字Z20010098', '../img/121.jpg', '森隆药业有限公司', '852.00', '0');
INSERT INTO `medicine` VALUES ('122', '扶正化瘀胶囊', null, '../medicine/122.txt', '处方药', '国药准字Z20020073', '../img/122.jpg', '上海黄海制药有限责任公司', '720.00', '0');
INSERT INTO `medicine` VALUES ('123', '甘草酸二铵肠溶胶囊', null, '../medicine/123.txt', '处方药', '国药准字H20040628', '../img/123.jpg', '江苏正大天晴药业股份有限公司', '28.00', '0');
INSERT INTO `medicine` VALUES ('124', '黄芪颗粒', null, '../medicine/124.txt', '处方药', '国药准字Z20003380', '../img/124.jpg', '四川百利药业有限责任公司', '29.80', '0');
INSERT INTO `medicine` VALUES ('125', '阿魏酸哌嗪片', null, '../medicine/125.txt', '处方药', '国药准字H43021760', '../img/125.jpg', '湖南康普制药有限公司', '10.80', '0');
INSERT INTO `medicine` VALUES ('126', '黄葵胶囊', null, '../medicine/126.txt', '处方药', '国药准字Z19990040', '../img/126.jpg', '江苏苏中药业集团股份有限公司', '45.00', '0');
INSERT INTO `medicine` VALUES ('127', '肾炎康复片', null, '../medicine/127.txt', '处方药', '国药准字Z10940034', '../img/127.jpg', '天津同仁堂集团股份有限公司', '269.00', '0');
INSERT INTO `medicine` VALUES ('128', '滋补肝肾丸', null, '../medicine/128.txt', '处方药', '国药准字Z11020899', '../img/128.jpg', '北京同仁堂科技发展股份有限公司制药厂', '38.00', '0');
INSERT INTO `medicine` VALUES ('129', '健肾生发丸', null, '../medicine/129.txt', '处方药', '国药准字Z14020282', '../img/129.jpg', '亚宝药业大同制药有限公司', '50', '0');
INSERT INTO `medicine` VALUES ('130', '肾炎温阳胶囊', null, '../medicine/130.txt', '处方药', '国药准字Z10980147', '../img/130.jpg', '山东好当家海森药业有限公司', '25.30', '0');
INSERT INTO `medicine` VALUES ('131', '正清风痛宁缓释片', null, '../medicine/131.txt', '处方药', '国药准字Z20010174', '../img/131.jpg', '湖南正清制药集团股份有限公司', '29.00', '0');
INSERT INTO `medicine` VALUES ('132', '沙格列汀片', null, '../medicine/132.txt', '处方药', '国药准字J20110029', '../img/132.jpg', '中美上海施贵宝制药有限公司', '550.00', '0');
INSERT INTO `medicine` VALUES ('133', '阿卡波糖片', null, '../medicine/133.txt', '处方药', '国药准字H19990205', '../img/133.jpg', '北京拜耳医药保健有限公司', '58.00', '0');
INSERT INTO `medicine` VALUES ('134', '格列齐特缓释片', null, '../medicine/134.txt', '处方药', '国药准字H20044694', '../img/134.jpg', '施维雅(天津)制药有限公司', '48.00', '0');
INSERT INTO `medicine` VALUES ('135', '盐酸二甲双胍片', null, '../medicine/135.txt', '处方药', '国药准字H20023370', '../img/135.jpg', '中美上海施贵宝制药有限公司', '25.50', '0');
INSERT INTO `medicine` VALUES ('136', '维格列汀片', null, '../medicine/136.txt', '处方药', '进口药品注册证号H20110358', '../img/136.jpg', 'Novartis Pharma Stein AG', '760.00', '0');
INSERT INTO `medicine` VALUES ('137', '磷酸西格列汀片', null, '../medicine/137.txt', '处方药', '注册证号H20090834', '../img/137.jpg', '杭州默沙东制药有限公司', '59.00', '0');
INSERT INTO `medicine` VALUES ('138', '格列吡嗪缓释片', null, '../medicine/138.txt', '处方药', '国药准字H10970356', '../img/138.jpg', '扬子江药业集团有限公司', '26.00', '0');
INSERT INTO `medicine` VALUES ('139', '格列美脲片', null, '../medicine/139.txt', '处方药', '国药准字H20057672', '../img/139.jpg', '赛诺菲安万特（北京）制药有限公司', '69.00', '0');
INSERT INTO `medicine` VALUES ('140', '噻托溴铵粉雾剂', null, '../medicine/140.txt', '处方药', '国药准字H20090279', '../img/140.jpg', '浙江仙琚制药股份有限公司', '42.50', '0');
INSERT INTO `medicine` VALUES ('141', '福多司坦片', null, '../medicine/141.txt', '处方药', '国药准字H20110037', '../img/141.jpg', '迪沙药业集团有限公司', '76.80', '0');
INSERT INTO `medicine` VALUES ('142', '乙酰半胱氨酸泡腾片', null, '../medicine/142.txt', '处方药', '进口药品注册证号H20140449', '../img/142.jpg', 'ZambonS.p.A', '25.00', '0');
INSERT INTO `medicine` VALUES ('143', '肺气肿片', null, '../medicine/143.txt', '处方药', '国药准字Z32020724', '../img/143.jpg', '江苏七0七天然制药有限公司', '33.00', '0');
INSERT INTO `medicine` VALUES ('144', '盐酸班布特罗胶囊', null, '../medicine/144.txt', '处方药', '国药准字H20010297', '../img/144.jpg', '四川国瑞药业有限责任公司', '23.00', '0');
INSERT INTO `medicine` VALUES ('145', '茶碱缓释片', null, '../medicine/145.txt', '处方药', '国药准字H44023791', '../img/145.jpg', '广东迈特兴华制药厂', '8.00', '0');
INSERT INTO `medicine` VALUES ('146', '金咳息胶囊', null, '../medicine/146.txt', '处方药', '国药准字Z10920063', '../img/146.jpg', '吉林双药药业集团有限公司', '11.00', '0');
INSERT INTO `medicine` VALUES ('147', '复方羟丙茶碱去氯羟嗪胶囊', null, '../medicine/147.txt', '处方药', '国药准字H32025523', '../img/147.jpg', '苏州第三制药厂有限责任公司', '18.80', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', '123', '123@qq.com', '', '../img/head/0.png', '1');
INSERT INTO `user` VALUES ('2', 'bbb', '123', '123@qq.com', '', '../img/head/0.png', '1');
