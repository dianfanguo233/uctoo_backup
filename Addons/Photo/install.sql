INSERT INTO `uctoo_model` (`name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES ('photo', '微相册', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"intro\",\"cover\",\"visible\",\"sord\"]}', '1:基础', '', '', '', '', 'title:标题\r\ncover:封面\r\nvisible:可见性\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398498938', '1', 'MyISAM');


INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ('keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '0', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'visible', '是否显示相册', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:可见\r\n1:隐藏', '0', '0', '1', '1398485662', '1398485489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'title', '相册名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '0', '1', '1', '1398485406', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '0', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ('cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '0', '1', '1', '1398573850', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '0', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '0', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'sord', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '1', '数字越大越靠前', '0', '0', '1', '1398486028', '1398486028', '', '3', '', 'regex', '', '3', 'function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;



INSERT INTO `uctoo_model` (`name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES ('photo_pic', '相册图片模型', '0', '', '1', '{\"1\":[\"pic\",\"intro\",\"sord\"]}', '1:基础', '', '', '', '', 'pid:相册ID\r\npic:相片\r\nintro:简介\r\nsord:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398573924', '1', 'MyISAM');

INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'sord', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '数字越大越靠前', '1', '', '0', '0', '1', '1398485965', '1398485965', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'intro', '描述', 'text NOT NULL', 'textarea', '', '', '1', '', '0', '0', '1', '1398485864', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'pic', '图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '0', '1', '1', '1398573907', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '0', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '0', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` ( `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES ( 'pid', '相册ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '0', '1', '1', '1398492815', '1398485903', '', '3', '', 'regex', '', '3', 'function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_photo
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_photo`;


CREATE TABLE `uctoo_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '相册名称',
  `intro` text NOT NULL COMMENT '封面简介',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `visible` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否显示相册',
  `sord` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for uctoo_photo_pic
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_photo_pic`;
CREATE TABLE `uctoo_photo_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `intro` text NOT NULL COMMENT '描述',
  `pic` int(10) unsigned NOT NULL COMMENT '图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `pid` int(10) unsigned NOT NULL COMMENT '相册ID',
  `sord` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
