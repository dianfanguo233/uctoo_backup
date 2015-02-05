/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:29:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_discount_type
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_discount_type`;
CREATE TABLE `uctoo_ml_mall_discount_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ismain` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为主要',
  `name` varchar(255) NOT NULL COMMENT '优惠分类名称',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `dishesdatas` text NOT NULL COMMENT '商品id和优惠价格序列化数据',
  `paixu` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `setid` int(10) NOT NULL COMMENT '商城id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_discount_type
-- ----------------------------
INSERT INTO `uctoo_ml_mall_discount_type` VALUES ('1', '0', '特价', '0', 'gh_58eed0dc2a8e', 'a:1:{i:0;s:2:\"12\";}', '0', '6');
INSERT INTO `uctoo_ml_mall_discount_type` VALUES ('2', '0', '限时优惠', '0', 'gh_58eed0dc2a8e', 'a:3:{i:0;s:2:\"18\";i:1;s:2:\"22\";i:2;s:2:\"11\";}', '0', '14');
INSERT INTO `uctoo_ml_mall_discount_type` VALUES ('3', '0', '特价', '0', 'gh_58eed0dc2a8e', '', '0', '14');
INSERT INTO `uctoo_ml_mall_discount_type` VALUES ('4', '1', '特价', '0', 'gh_58eed0dc2a8e', '', '1', '5');
INSERT INTO `uctoo_ml_mall_discount_type` VALUES ('5', '0', '特价', '1', 'gh_58eed0dc2a8e', 'a:1:{i:0;s:2:\"10\";}', '1', '15');
