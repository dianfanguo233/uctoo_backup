/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_yuyuemanage
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_yuyuemanage`;
CREATE TABLE `uctoo_ml_mall_yuyuemanage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yycount` int(10) NOT NULL COMMENT '预约人数',
  `sex` int(10) NOT NULL DEFAULT '0' COMMENT '预约人性别',
  `usermobile` varchar(255) NOT NULL COMMENT '预约人电话',
  `username` varchar(255) NOT NULL COMMENT '预约人姓名',
  `openid` varchar(255) NOT NULL COMMENT '关联微信用户id',
  `tablemanage_id` int(10) NOT NULL COMMENT '桌台编号',
  `set_id` int(10) NOT NULL COMMENT '关联的商城编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_yuyuemanage
-- ----------------------------
