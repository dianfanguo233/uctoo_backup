/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_order_temp
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_order_temp`;
CREATE TABLE `uctoo_ml_mall_order_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setid` int(10) NOT NULL COMMENT '商城id',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `openid` varchar(255) NOT NULL COMMENT '用户id',
  `cpid` int(10) NOT NULL COMMENT '商品id',
  `param` varchar(255) NOT NULL COMMENT '商品参数',
  `slt_attrids` varchar(255) NOT NULL COMMENT '定制参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_order_temp
-- ----------------------------
INSERT INTO `uctoo_ml_mall_order_temp` VALUES ('433', '15', 'gh_58eed0dc2a8e', '2527', '29', '{\"baseprice\":\"690\",\"cfgpricesum\":\"150\",\"dzprice\":\"690\",\"cfgprice\":\"1530\",\"slt_attrids\":\"38,41,45,82\"}', '38,41,45,82');
INSERT INTO `uctoo_ml_mall_order_temp` VALUES ('439', '15', 'gh_58eed0dc2a8e', '2525', '32', '{\"baseprice\":\"298\",\"cfgpricesum\":\"150\",\"dzprice\":\"298\",\"cfgprice\":\"746\",\"slt_attrids\":\"60,87,86\"}', '60,87,86');
INSERT INTO `uctoo_ml_mall_order_temp` VALUES ('429', '15', 'gh_58eed0dc2a8e', '2525', '32', '{\"baseprice\":\"298\",\"cfgpricesum\":\"150\",\"dzprice\":\"298\",\"cfgprice\":\"746\",\"slt_attrids\":\"60,87,86\"}', '60,87,86');
INSERT INTO `uctoo_ml_mall_order_temp` VALUES ('430', '15', 'gh_58eed0dc2a8e', '2529', '29', '{\"baseprice\":\"690\",\"cfgpricesum\":\"0\",\"dzprice\":\"690\",\"cfgprice\":\"1380\",\"slt_attrids\":\"38\"}', '38');
