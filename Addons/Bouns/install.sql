CREATE TABLE IF NOT EXISTS `uctoo_bouns` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`use_tips`  varchar(255) NOT NULL  COMMENT '使用说明',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`intro`  text NOT NULL  COMMENT '封面简介',
`end_time`  int(10) NOT NULL  COMMENT '结束时间',
`cover`  int(10) UNSIGNED NOT NULL  COMMENT '封面图片',
`back_ground`  int(10) UNSIGNED NOT NULL  COMMENT '封面图片',
`cTime`  int(10) UNSIGNED NOT NULL  COMMENT '发布时间',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`start_time`  int(10) NOT NULL  COMMENT '开始时间',
`end_tips`  text NOT NULL  COMMENT '过期说明',
`end_img`  int(10) UNSIGNED NOT NULL  COMMENT '过期提示图片',
`num`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '微红包数量',
`max_num`  int(10) UNSIGNED NOT NULL  DEFAULT 1 COMMENT '每人最多允许获取次数',
`follower_condtion`  char(50) NOT NULL  DEFAULT 1 COMMENT '粉丝状态',
`credit_conditon`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '积分限制',
`credit_bug`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '积分消费',
`addon_condition`  varchar(255) NOT NULL  COMMENT '插件场景限制',
`collect_count`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '已领取数',
`view_count`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '浏览人数',
`url`  varchar(255) NOT NULL  COMMENT '红包url地址',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('bouns','微红包','0','','1','{"1":["keyword","title","intro","cover","back_ground","use_tips","start_time","end_time","end_img","end_tips","url","num","max_num","follower_condtion","credit_conditon","credit_bug","addon_condition"]}','1:基础','','','','','id:微红包ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|成员管理,preview?id=[id]&target=_blank|预览','10','title','','1396061373','1401017265','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396624337','1396061575','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('use_tips','使用说明','varchar(255) NOT NULL','textarea','','用户获取微红包后显示的提示信息','1','','0','1','1','1399274330','1399259489','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NOT NULL','textarea','','','1','','0','0','1','1396624505','1396061947','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_time','结束时间','int(10) NOT NULL','datetime','','','1','','0','0','1','1399259433','1399259433','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) UNSIGNED NOT NULL','picture','','','1','','0','0','1','1396624534','1396062093','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('back_ground','背景图片','int(10) UNSIGNED NOT NULL','picture','','领取红包前的广告页面','1','','0','0','1','1396624534','1396062093','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NOT NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('start_time','开始时间','int(10) NOT NULL','datetime','','','1','','0','0','1','1399259416','1399259416','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_tips','过期说明','text NOT NULL','textarea','','活动过期或者结束说明','1','','0','0','1','1399259570','1399259570','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('end_img','过期提示图片','int(10) UNSIGNED NOT NULL','picture','','可为空','1','','0','0','1','1400989793','1400989793','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('num','微红包数量','int(10) UNSIGNED NOT NULL','num','0','0表示不限制数量','1','','0','0','1','1399259838','1399259808','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('max_num','每人最多允许获取次数','int(10) UNSIGNED NOT NULL','num','1','0表示不限制数量','1','','0','0','1','1400992221','1399260079','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('follower_condtion','粉丝状态','char(50) NOT NULL','select','1','粉丝达到设置的状态才能获取','1','0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员','0','0','1','1399260479','1399260479','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_conditon','积分限制','int(10) UNSIGNED NOT NULL','num','0','粉丝达到多少积分后才能领取，领取后不扣积分','1','','0','0','1','1399260618','1399260618','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('credit_bug','积分消费','int(10) UNSIGNED NOT NULL','num','0','用积分中的财富兑换、兑换后扣除相应的积分财富','1','','0','0','1','1399260764','1399260764','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('addon_condition','插件场景限制','varchar(255) NOT NULL','string','','格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示','1','','0','0','1','1399274022','1399261026','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('collect_count','已领取数','int(10) UNSIGNED NOT NULL','num','0','','0','','0','0','1','1400992246','1399270900','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('view_count','浏览人数','int(10) UNSIGNED NOT NULL','num','0','','0','','0','0','1','1399270926','1399270926','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('url','红包url地址','varchar(255) NOT NULL','string','','红包完整url地址，以http://或https://开头','1','','0','1','1','1420452734','1420452734','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;