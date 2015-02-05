/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_users
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_users`;
CREATE TABLE `uctoo_ml_mall_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(555) NOT NULL COMMENT '联系地址',
  `truename` varchar(255) NOT NULL COMMENT '用户名称',
  `tel` varchar(255) NOT NULL COMMENT '联系电话',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `openid` varchar(255) NOT NULL COMMENT '微信id',
  `isdefault` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `set_id` int(10) NOT NULL COMMENT '商城id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_users
-- ----------------------------
INSERT INTO `uctoo_ml_mall_users` VALUES ('22', '1234', '阿里-管理控制台', '18920002000', 'gh_58eed0dc2a8e', '2513', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('23', '', '阿里', '13900000000', 'gh_58eed0dc2a8e', '2513', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('24', '深圳市福田区', 'Alice', '13900000000', 'gh_58eed0dc2a8e', '2514', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('25', '', '18924670905', '18924670905', 'gh_58eed0dc2a8e', '2524', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('26', '', '18924670905', '18924670905', 'gh_58eed0dc2a8e', '2524', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('27', '', '13632670710', '13632670710', 'gh_58eed0dc2a8e', '2525', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('28', 'shekou', '18665861715', '18665861715', 'gh_58eed0dc2a8e', '2527', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('29', '', '13632670710', '13632670710', 'gh_58eed0dc2a8e', '2525', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('30', '', '13632670710', '13632670710', 'gh_58eed0dc2a8e', '2525', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('31', '', '13632670710', '13632670710', 'gh_58eed0dc2a8e', '2525', '0', '15');
INSERT INTO `uctoo_ml_mall_users` VALUES ('21', 'innovalley', '13000000000', '13000000000', 'gh_58eed0dc2a8e', '2511', '0', '15');
