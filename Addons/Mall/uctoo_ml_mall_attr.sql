/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : weixin

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-07-02 17:06:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_attr
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_attr`;
CREATE TABLE `uctoo_ml_mall_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '属性名称',
  `title` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_ml_mall_attr
-- ----------------------------
INSERT INTO `uctoo_ml_mall_attr` VALUES ('3', 'color', '颜色', '商品的颜色。');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('4', 'xingshu2', '属性2', '属性2的介绍');
