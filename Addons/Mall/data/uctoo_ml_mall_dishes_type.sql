/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_dishes_type
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_dishes_type`;
CREATE TABLE `uctoo_ml_mall_dishes_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paixu` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` int(10) unsigned NOT NULL COMMENT '分类图片',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `setid` int(10) NOT NULL COMMENT '关联的商城id',
  `dishesdatas` text NOT NULL COMMENT '商品集合',
  `introduction` text NOT NULL COMMENT '简介',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `owner_id` int(10) NOT NULL COMMENT '所属管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_dishes_type
-- ----------------------------
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('101', '1', '0', '夏装', '0', '5', 'a:4:{i:0;s:2:\"20\";i:1;s:2:\"22\";i:2;s:2:\"19\";i:3;s:2:\"10\";}', '<p>优衣库夏装</p>', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('102', '1', '0', '新品', '0', '6', 'a:1:{i:0;s:2:\"11\";}', '<p>新品</p>', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('103', '2', '382', '6月上新', '0', '6', 'a:1:{i:0;s:2:\"12\";}', '<p>6月上新</p>', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('105', '0', '0', '分类2', '0', '10', 'a:1:{i:0;s:2:\"18\";}', '<p>分类1</p>', 'gh_58eed0dc2a8e', '2494');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('106', '0', '0', 'test', '0', '11', 'a:1:{i:0;s:2:\"17\";}', '<p>123</p>', 'gh_3da51bd7cc0d', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('107', '0', '0', 't123', '0', '11', 'a:1:{i:0;s:2:\"16\";}', '', 'gh_3da51bd7cc0d', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('108', '0', '0', '夏日新品', '0', '13', 'a:1:{i:0;s:2:\"21\";}', '', 'gh_58eed0dc2a8e', '2489');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('109', '0', '0', '秋装', '0', '5', 'a:2:{i:0;s:2:\"11\";i:1;s:2:\"25\";}', '', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('110', '1', '0', '夏装', '0', '14', 'a:6:{i:0;s:2:\"20\";i:1;s:2:\"22\";i:2;s:2:\"19\";i:3;s:2:\"10\";i:4;s:2:\"23\";i:5;s:2:\"24\";}', '<p>优衣库夏装</p>', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('111', '0', '0', '秋装', '0', '14', 'a:3:{i:0;s:2:\"18\";i:1;s:2:\"21\";i:2;s:2:\"11\";}', '', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('117', '0', '0', '臻宠定制', '0', '15', 'a:8:{i:0;s:2:\"33\";i:1;s:2:\"32\";i:2;s:2:\"31\";i:3;s:2:\"30\";i:4;s:2:\"29\";i:5;s:2:\"36\";i:6;s:2:\"35\";i:7;s:2:\"34\";}', '', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('116', '1', '0', '精品预售', '1', '15', 'N;', '<p>精品预售</p>', 'gh_58eed0dc2a8e', '161');
INSERT INTO `uctoo_ml_mall_dishes_type` VALUES ('118', '0', '0', '甜品', '0', '16', 'N;', '', 'gh_58eed0dc2a8e', '2491');
