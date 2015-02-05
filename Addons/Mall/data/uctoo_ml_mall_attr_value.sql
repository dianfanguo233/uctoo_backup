/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:29:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_attr_value`;
CREATE TABLE `uctoo_ml_mall_attr_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `desc` varchar(255) NOT NULL COMMENT '属性描述',
  `gid` int(10) NOT NULL COMMENT '商品ID',
  `aid` int(10) NOT NULL COMMENT '属性ID',
  `value` text NOT NULL COMMENT '属性值',
  `price` varchar(255) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `icon` varchar(255) NOT NULL COMMENT '图片',
  `thumbnail` int(10) unsigned NOT NULL COMMENT '缩略图',
  `pricetype` char(50) NOT NULL DEFAULT '0' COMMENT '价格类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_attr_value
-- ----------------------------
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('1', '红色，加20元', '10', '1', '红色', '20', '438', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('2', '蓝色，减6元', '10', '1', '蓝色', '-6', '437', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('3', '小号', '10', '2', 'M', '0', '436', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('5', '', '10', '2', 'S', '10', '439', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('7', '固定属性', '10', '4', '西洋风情', '', '408', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('8', '', '10', '5', 'daley test', '', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('9', '', '15', '24', '四川', '', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('10', '红色加10元。', '18', '27', '红色', '10', '408', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('11', '蓝色减10元。', '18', '27', '蓝色', '-10', '448', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('12', '', '25', '1', '原色', '99', '542', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('13', '', '25', '2', '70C', '99', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('14', '', '25', '1', '粉色', '10', '481', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('15', '', '25', '1', '蓝色', '20', '482', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('16', '', '25', '29', '粉色', '10', '483', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('17', '', '25', '29', '蓝色', '20', '484', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('18', 'X', '25', '2', '75C', '10', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('19', '20', '25', '2', '75D', '20', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('20', '定制价100元', '27', '30', '红色', '100', '549', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('21', '定制价200元', '27', '30', '白色', '200', '550', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('22', '定制价200元', '27', '29', '红色', '200', '549', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('23', '定制价220元', '27', '29', '白色', '220', '550', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('27', '定制价60元', '27', '30', '肤色', '60', '548', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('26', '定制价70元', '27', '29', '肤色', '70', '548', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('28', 'dzprice = 产品原价*属性值 + 属性价格变动', '27', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('29', '肤色套装', '28', '34', '肤色套装', '0', '552', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('30', '黑色套装', '28', '34', '黑色套装', '200', '553', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('31', '0', '28', '35', '75B', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('32', '0', '28', '35', '76C', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('33', '50', '28', '35', '78D', '50', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('34', '0', '28', '36', '80', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('35', '0', '28', '36', '79', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('36', '定制加100元', '27', '37', '吊坠', '100', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('38', '玫瑰肤', '29', '30', '玫瑰肤', '0', '563', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('39', '玛瑙红', '29', '30', '玛瑙红', '0', '578', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('40', '杏白色', '29', '30', '杏白色', '0', '579', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('41', '玫瑰肤', '29', '29', '玫瑰肤', '0', '563', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('42', '玛瑙红', '29', '29', '玛瑙红', '0', '578', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('43', '杏白色', '29', '29', '杏白色', '0', '579', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('44', '定制价', '29', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('45', '吊坠', '29', '37', '吊坠', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('46', '宝石印花', '30', '30', '宝石印花', '0', '580', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('47', '彩色花朵', '30', '30', '彩色花朵', '0', '594', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('48', '蝴蝶印花', '30', '30', '蝴蝶印花', '0', '595', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('49', '宝石印花', '30', '29', '宝石印花', '0', '580', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('50', '彩色花朵', '30', '29', '彩色花朵', '0', '594', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('51', '蝴蝶印花', '30', '29', '蝴蝶印花', '0', '595', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('52', '定制价', '30', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('53', '吊坠', '30', '37', '吊坠', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('54', '黛色经编', '31', '30', '黛色经编', '0', '596', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('55', '鹅黄双色经编', '31', '30', '鹅黄双色经编', '0', '605', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('56', '黛色经编', '31', '29', '黛色经编', '0', '596', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('57', '鹅黄双色经编', '31', '29', '鹅黄双色经编', '0', '605', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('58', '定制价', '31', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('59', '吊坠', '31', '37', '吊坠', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('60', '玫瑰肤', '32', '27', '玫瑰肤', '0', '606', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('61', '玛瑙红', '32', '27', '玛瑙红', '0', '616', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('62', '杏白色', '32', '27', '杏白色', '0', '617', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('63', '定制价', '32', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('64', '宝石印花', '33', '27', '宝石印花', '0', '626', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('65', '彩色花朵', '33', '27', '彩色花朵', '0', '628', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('66', '蝴蝶印花', '33', '27', '蝴蝶印花', '0', '629', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('67', '定制价', '33', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('68', '鹅黄双色经编', '34', '27', '鹅黄双色经编', '0', '630', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('69', '黛色经编', '34', '27', '黛色经编', '0', '649', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('71', '定制价', '34', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('73', '鹅黄双色经编', '35', '27', '鹅黄双色经编', '0', '640', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('74', '黛色经编', '35', '27', '黛色经编', '0', '650', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('75', '定制价', '35', '32', '1', '0', '', '0', '0');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('77', '旅行内衣包装袋', '31', '38', '旅行内衣包装袋', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('78', '旅行内衣包装袋', '31', '39', '旅行内衣包装袋', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('85', '', '33', '39', '旅行内衣包装袋', '150', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('87', '旅行内衣包装袋', '32', '39', '旅行内衣包装袋', '150', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('81', '旅行内衣包装袋', '30', '39', '旅行内衣包装袋', '150', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('82', '旅行内衣包装袋', '29', '39', '旅行内衣包装袋', '150', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('84', '鸡心吊坠', '33', '37', '鸡心吊坠', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('86', '', '32', '37', '鸡心吊坠', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('88', '鸡心吊坠', '36', '37', 'PS01', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('89', '鸡心吊坠', '36', '37', 'PS02', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('90', '鸡心吊坠', '36', '37', 'PS03', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('91', '鸡心吊坠', '36', '37', 'PS04', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('92', '鸡心吊坠', '36', '37', 'PS05', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('93', '鸡心吊坠', '36', '37', 'PS06', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('94', '鸡心吊坠', '36', '37', 'PS07', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('95', '鸡心吊坠', '36', '37', 'PS09', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('96', '鸡心吊坠', '36', '37', 'PS10', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('97', '鸡心吊坠', '36', '37', 'PS11', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('98', '鸡心吊坠', '36', '37', 'PS12', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('99', '鸡心吊坠', '36', '37', 'PS13', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('100', '鸡心吊坠', '36', '37', 'PS14', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('101', '鸡心吊坠', '36', '37', 'PS15', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('102', '鸡心吊坠', '36', '37', 'PS16', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('103', '鸡心吊坠', '36', '37', 'PS17', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('104', '鸡心吊坠', '36', '37', 'PS18', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('105', '鸡心吊坠', '36', '37', 'PS19', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('106', '鸡心吊坠', '36', '37', 'PS20', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('107', '鸡心吊坠', '36', '37', 'PS21', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('108', '鸡心吊坠', '36', '37', 'PS22', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('109', '鸡心吊坠', '36', '37', 'PS23', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('110', '鸡心吊坠', '36', '37', 'PS24', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('111', '鸡心吊坠', '36', '37', 'PS25', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('112', '鸡心吊坠', '36', '37', 'PS26', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('113', '鸡心吊坠', '36', '37', 'PS27', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('114', '鸡心吊坠', '36', '37', 'PS28', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('115', '鸡心吊坠', '36', '37', 'PS29', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('116', '鸡心吊坠', '36', '37', 'PS30', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('117', '鸡心吊坠', '36', '37', 'PS31', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('118', '鸡心吊坠', '36', '37', 'PS32', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('119', '鸡心吊坠', '36', '37', 'PS33', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('120', '鸡心吊坠', '36', '37', 'PS34', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('121', '鸡心吊坠', '36', '37', 'PS35', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('122', '鸡心吊坠', '36', '37', 'PS36', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('123', '鸡心吊坠', '36', '37', 'PS37', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('124', '鸡心吊坠', '36', '37', 'PS38', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('125', '鸡心吊坠', '36', '37', 'PS39', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('126', '鸡心吊坠', '36', '37', 'PS40', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('127', '鸡心吊坠', '36', '37', 'PS41', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('128', '鸡心吊坠', '36', '37', 'PS42', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('129', '鸡心吊坠', '36', '37', 'PS43', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('130', '鸡心吊坠', '36', '37', 'PS44', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('131', '鸡心吊坠', '36', '37', 'PS45', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('132', '鸡心吊坠', '36', '37', 'PS46', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('133', '鸡心吊坠', '36', '37', 'PS47', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('134', '鸡心吊坠', '36', '37', 'PS48', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('135', '鸡心吊坠', '36', '37', 'PS49', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('136', '鸡心吊坠', '36', '37', 'PS50', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('137', '鸡心吊坠', '36', '37', 'PS51', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('138', '鸡心吊坠', '36', '37', 'PS52', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('139', '鸡心吊坠', '36', '37', 'PS53', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('140', '鸡心吊坠', '36', '37', 'PS54', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('141', '鸡心吊坠', '36', '37', 'PS55', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('142', '鸡心吊坠', '36', '37', 'PS56', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('143', '鸡心吊坠', '36', '37', 'PS57', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('144', '鸡心吊坠', '36', '37', 'PS58', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('145', '鸡心吊坠', '36', '37', 'PS59', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('146', '鸡心吊坠', '36', '37', 'PS60', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('147', '鸡心吊坠', '36', '37', 'PS61', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('148', '鸡心吊坠', '36', '37', 'PS62', '0', '', '559', '1');
INSERT INTO `uctoo_ml_mall_attr_value` VALUES ('149', '鸡心吊坠', '36', '37', 'PS63', '0', '', '559', '1');
