/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_review
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_review`;
CREATE TABLE `uctoo_ml_mall_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plcontent` text NOT NULL COMMENT '评论内容',
  `pltime` int(10) NOT NULL COMMENT '评论时间',
  `hftime` int(10) NOT NULL COMMENT '回复时间',
  `hfcontent` text NOT NULL COMMENT '回复内容',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '评论类型',
  `openid` varchar(255) NOT NULL COMMENT '关联的用户id',
  `set_id` int(10) NOT NULL COMMENT '关联的商城id',
  `dishes_id` int(10) NOT NULL COMMENT '关联的商品id或者关联的桌台id',
  `pingji` int(10) NOT NULL DEFAULT '3' COMMENT '商品评级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_review
-- ----------------------------
INSERT INTO `uctoo_ml_mall_review` VALUES ('1', '', '1404723660', '1405328460', '<p>正常线头<br/></p>', '0', '', '0', '0', '3');
