/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:29:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_attr
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_attr`;
CREATE TABLE `uctoo_ml_mall_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '属性名称',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `desc` text NOT NULL COMMENT '详细描述',
  `owner_id` int(10) NOT NULL COMMENT '所属管理员',
  `is_show` char(50) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_attr
-- ----------------------------
INSERT INTO `uctoo_ml_mall_attr` VALUES ('1', '颜色', 'gh_58eed0dc2a8e', '2014年春季主要颜色: 08 深灰色 62 粉蓝色 50 浅绿色 00 白色 30 浅米色 12 桃红色 24 亮橙色 03 灰色 11 粉红色 69 藏青色 66 蓝色 09 黑色尺码: 155/80A(S) 160/84A(M) 160/88A(L', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('2', '尺寸', 'gh_58eed0dc2a8e', '尺码: 155/80A(S) 160/84A(M) 160/88A(L', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('4', '风格', 'gh_58eed0dc2a8e', '', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('5', '固定属性', 'gh_58eed0dc2a8e', '', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('30', '杯面设计', 'gh_58eed0dc2a8e', '杯面设计', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('25', '颜色', 'gh_3da51bd7cc0d', '商品的颜色', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('26', '尺寸', 'gh_3da51bd7cc0d', '商品的尺寸。', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('27', '颜色', 'gh_58eed0dc2a8e', '商品的颜色', '2494', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('28', '布料（A）', 'gh_58eed0dc2a8e', '机车帆布，动感时尚。', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('29', '下围设计', 'gh_58eed0dc2a8e', '鸡心颜色', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('31', '肩带颜色', 'gh_58eed0dc2a8e', '肩带颜色', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('32', 'dzprice', 'gh_58eed0dc2a8e', 'dzprice = 产品原价*属性值 + 属性价格变动', '161', '0');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('33', 'kbsell', 'gh_58eed0dc2a8e', '捆绑销售产品ID，购买完A产品，购买流程跳至产品ID为B的产品。', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('34', '款式', 'gh_58eed0dc2a8e', '定制款式', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('35', '文胸尺寸', 'gh_58eed0dc2a8e', '文胸尺寸', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('36', '底裤尺寸', 'gh_58eed0dc2a8e', '底裤尺寸', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('37', '鸡心吊坠', 'gh_58eed0dc2a8e', '鸡心吊坠配饰', '161', '1');
INSERT INTO `uctoo_ml_mall_attr` VALUES ('39', '旅行内衣包装袋', 'gh_58eed0dc2a8e', '旅行内衣包装袋', '161', '1');
