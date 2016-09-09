-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 01 月 11 日 05:19
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `uctoo_v0.6`
--

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_action`
--
DROP TABLE IF EXISTS `uctoo_tplmsg`;
CREATE TABLE `uctoo_tplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `mp_id` varchar(50) NOT NULL COMMENT '公众号ID',
  `template_id` varchar(50) NOT NULL COMMENT '消息模板ID',
  `name` varchar(100) NOT NULL COMMENT '标题',
  `industry` varchar(100) NOT NULL COMMENT '行业',
  `topcolor` varchar(50) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  `content` varchar(255) NOT NULL COMMENT '详细内容',
  `url` varchar(255) NOT NULL COMMENT '详情URL',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mp_id` (`mp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `uctoo_tplmsg` VALUES ('3', '1', '919f95036e68433c72749421307dc99d', 'diW6jm5hBwemeoDF0FZdU2agSZ9kydje22YJIC0gVMo', '购买成功通知', 'IT科技 - 互联网|电子商务', '#FF0000', '您好，您已购买成功。\r\n\r\n商品信息：{{name.DATA}}\r\n{{remark.DATA}}', 'http://test.uctoo.com/index.php?s=/home/addons/execute/Ucuser/Ucuser/index/mp_id/919f95036e68433c72749421307dc99d.html');
INSERT INTO `uctoo_tplmsg` VALUES ('4', '1', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', '积分变动通知', 'IT科技 - 互联网|电子商务', '#FF0000', '{{first.DATA}}\r\n\r\n{{FieldName.DATA}}:{{Account.DATA}}\r\n{{change.DATA}}积分:{{CreditChange.DATA}}\r\n积分余额:{{CreditTotal.DATA}}\r\n{{Remark.DATA}}', 'http://test.uctoo.com/index.php?s=/home/addons/execute/Ucuser/Ucuser/index/mp_id/919f95036e68433c72749421307dc99d.html');


DROP TABLE IF EXISTS `uctoo_tplmsg_field`;
CREATE TABLE `uctoo_tplmsg_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL COMMENT 'tplmsg表的ID',
  `mp_id` varchar(50) NOT NULL COMMENT '公众号ID',
  `template_id` varchar(50) NOT NULL COMMENT '消息模板ID',
  `name` varchar(50) NOT NULL COMMENT '消息模板字段名',
  `value` varchar(1000) NOT NULL COMMENT '消息模板字段值',
  `color` varchar(50) NOT NULL DEFAULT '#173177' COMMENT '字段颜色',
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `mp_id` (`mp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `uctoo_tplmsg_field` VALUES ('2', '3', '919f95036e68433c72749421307dc99d', 'diW6jm5hBwemeoDF0FZdU2agSZ9kydje22YJIC0gVMo', 'name', 'UCToo{$product_name}', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('5', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'first', '{$from_name}给你打了分：', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('4', '3', '919f95036e68433c72749421307dc99d', 'diW6jm5hBwemeoDF0FZdU2agSZ9kydje22YJIC0gVMo', 'remark', 'hahahaha', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('6', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'FieldName', '总威望', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('7', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'Account', '{$score2}', '#FF0000');
INSERT INTO `uctoo_tplmsg_field` VALUES ('8', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'change', '增加', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('9', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'CreditChange', '10', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('10', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'CreditTotal', '{$score1}', '#173177');
INSERT INTO `uctoo_tplmsg_field` VALUES ('11', '4', '919f95036e68433c72749421307dc99d', 'cGwtzvU8HleBVvrIIq7WjpwXWjW4kvQY6d02Fa7jAdE', 'Remark', '点击详情，查看打分结果，还可以给对方打分！', '#173177');



INSERT INTO `uctoo_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `icon`, `module`) VALUES ('1024', '模板消息', '1000', '10', 'Tplmsg/index', '1', '', '基础设置', '0', '', '');
INSERT INTO `uctoo_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES ('12', 'TplMsg', '模板消息发送', '模板消息发送插件', '1', null, 'UCToo', '0.1.0', '1450244557', '0');
INSERT INTO `uctoo_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES ('73', 'wxpay', '微信支付', '1', '1442221555', 'Wxpay');
INSERT INTO `uctoo_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES ('74', 'TplMsg', '模板消息发送钩子', '2', '1450243898', 'TplMsg');