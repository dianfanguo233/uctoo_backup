/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_set
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_set`;
CREATE TABLE `uctoo_ml_mall_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT ' Token ',
  `keyword` varchar(255) NOT NULL COMMENT ' 关键词 ',
  `intro` text NOT NULL COMMENT '封面简介',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `kfname` varchar(255) NOT NULL COMMENT '客服名称',
  `TemplateIndex` varchar(255) NOT NULL DEFAULT 'default' COMMENT '模板编号',
  `owner_id` int(10) NOT NULL COMMENT '所属管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_set
-- ----------------------------
INSERT INTO `uctoo_ml_mall_set` VALUES ('11', 'gh_3da51bd7cc0d', '商业中心金店', '商业中心金店，出售各种金品金饰。', '商业中心金店', '440', '小微', 'default', '161');
INSERT INTO `uctoo_ml_mall_set` VALUES ('15', 'gh_58eed0dc2a8e', '莱特妮丝', '莱特妮丝是女装高端品牌。', '莱特妮丝', '458', '小妮', 'default', '161');
