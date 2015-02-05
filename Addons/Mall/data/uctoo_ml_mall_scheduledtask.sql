/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : lightness

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-10-15 15:30:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_scheduledtask
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ml_mall_scheduledtask`;
CREATE TABLE `uctoo_ml_mall_scheduledtask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fenz` varchar(255) NOT NULL DEFAULT '*' COMMENT '每分',
  `xiaos` varchar(255) NOT NULL DEFAULT '*' COMMENT '每时',
  `yue` varchar(255) NOT NULL DEFAULT '*' COMMENT '每月',
  `day` varchar(255) NOT NULL DEFAULT '*' COMMENT '每日',
  `zhou` varchar(255) NOT NULL DEFAULT '*' COMMENT '每周',
  `starttime_endtime` text NOT NULL COMMENT '开始和结束时间的序列化数据',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `upruntime` int(10) NOT NULL COMMENT '上次执行时间',
  `downruntime` int(10) NOT NULL COMMENT '下次任务执行时间',
  `title` text NOT NULL COMMENT '任务名称',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_ml_mall_scheduledtask
-- ----------------------------
