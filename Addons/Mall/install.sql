CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_attr_value` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`desc`  varchar(255) NOT NULL  COMMENT '属性描述',
`gid`  int(10) NOT NULL  COMMENT '商品ID',
`aid`  int(10) NOT NULL  COMMENT '属性ID',
`value`  text NOT NULL  COMMENT '属性值',
`price`  varchar(255) NOT NULL  DEFAULT 0.00 COMMENT '价格',
`icon`  varchar(255) NOT NULL  COMMENT '图片',
`thumbnail` varchar(255) NOT NULL  COMMENT '缩略图',
`pricetype` char(50) NOT NULL DEFAULT 0 COMMENT '价格类型',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_attr_value','微商城_属性关联','0','','1','{"1":["gid","aid","value","price","icon","desc"]}','1:基础','','','','','id:编号\r\ngid:商品ID\r\naid:属性ID\r\nvalue:属性值\r\nprice:属性价格\r\nicon:属性图片\r\ndesc:属性描述\r\nid:操作:[EDIT]&id=[id]]&ctid=[setid]|编辑,[DELETE]|删除','10','','','1404479659','1404554224','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','属性描述','varchar(255) NOT NULL','string','','','1','','0','0','1','1404553449','1404553449','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('gid','商品ID','int(10) NOT NULL','num','','','1','','0','1','1','1404554604','1404479762','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('aid','属性ID','int(10) NOT NULL','num','','','1','','0','1','1','1404554591','1404480194','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('value','属性值','text NOT NULL','textarea','','','1','','0','1','1','1404480499','1404480431','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('price','价格','varchar(255) NOT NULL','string','0.00','属性价格','1','','0','0','1','1404489192','1404489192','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon','图片','varchar(255) NOT NULL','string','','图片路径','1','','0','0','1','1404489216','1404489216','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('thumbnail','属性缩略图','varchar(255) NOT NULL','string','','属性缩略图','1','','0','0','1','1404489216','1404489216','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_attr` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`name`  varchar(30) NOT NULL  COMMENT '属性名称',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`desc`  text NOT NULL  COMMENT '详细描述',
`is_show`  char(50) NOT NULL  DEFAULT 1 COMMENT '是否显示',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_ml_mall_attr` (`id`,`desc`,`name`,`token`) VALUES ('1','颜色看看','颜色','gh_58eed0dc2a8e');
INSERT INTO `uctoo_ml_mall_attr` (`id`,`desc`,`name`,`token`) VALUES ('2','商品的尺寸','尺寸','gh_58eed0dc2a8e');
INSERT INTO `uctoo_ml_mall_attr` (`id`,`desc`,`name`,`token`) VALUES ('4','','风格','gh_58eed0dc2a8e');
INSERT INTO `uctoo_ml_mall_attr` (`id`,`desc`,`name`,`token`) VALUES ('5','','固定属性','gh_58eed0dc2a8e');
INSERT INTO `uctoo_ml_mall_attr` (`id`,`desc`,`name`,`token`) VALUES ('13','ttt','ttt','gh_58eed0dc2a8e');
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_attr','微商城-商品属性','0','','1','{"1":["name","desc"]}','1:基础','','','','','id:编号\r\nname:属性名称\r\ndesc:详细描述\r\nid:操作:[EDIT]&id=[id]]&ctid=[setid]|编辑,[DELETE]|删除','10','','','1404447167','1404553371','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','属性名称','varchar(30) NOT NULL','string','','','1','','0','1','1','1404447870','1404447797','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','1','','0','1','1','1404725643','1404725643','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('desc','详细描述','text NOT NULL','textarea','','','1','','0','1','1','1404448091','1404448091','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_show','是否显示','char(50) NOT NULL','select','1','是否显示','1','1:显示\r\n0:不显示','0','0','1','1411882432','1411882432','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_users` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`address`  varchar(555) NOT NULL  COMMENT '联系地址',
`truename`  varchar(255) NOT NULL  COMMENT '用户名称',
`tel`  varchar(255) NOT NULL  COMMENT '联系电话',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`openid`  varchar(255) NOT NULL  COMMENT '微信id',
`isdefault`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '是否默认',
`set_id`  int(10) NOT NULL  COMMENT '商城id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_users','微商城-联系信息','0','','1','','1:基础','','','','','','10','','','1401694105','1401694105','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('address','联系地址','varchar(555) NOT NULL','string','','','1','','0','0','1','1401694266','1401694266','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('truename','用户名称','varchar(255) NOT NULL','string','','','1','','0','0','1','1401694187','1401694187','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tel','联系电话','varchar(255) NOT NULL','string','','','1','','0','0','1','1401694239','1401694239','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401694162','1401694162','','3','','regex','get_token','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','微信id','varchar(255) NOT NULL','string','','','0','','0','0','1','1401694285','1401694285','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('isdefault','是否默认','tinyint(2) NOT NULL','bool','0','是否默认常用的地址','0','0:不是\r\n1:是','0','0','1','1401694451','1401694451','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('set_id','商城id','int(10) NOT NULL','num','','','0','','0','0','1','1401695024','1401695024','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;



CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_order_temp` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`setid`  int(10) NOT NULL  COMMENT '商城id',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`openid`  varchar(255) NOT NULL  COMMENT '用户id',
`cpid`  int(10) NOT NULL  COMMENT '商品id',
`param` varchar(255) NOT NULL COMMENT '商品参数',`param` varchar(255) NOT NULL COMMENT '商品参数',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_order_temp','微商城-订单临时表','0','','1','','1:基础','','','','','','10','','','1401610576','1401610576','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('setid','商城id','int(10) NOT NULL','num','','','0','','0','0','1','1401617668','1401617668','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401610661','1401610661','','3','','regex','get_token','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','用户id','varchar(255) NOT NULL','string','','','0','','0','0','1','1401610734','1401610734','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cpid','商品id','int(10) NOT NULL','num','','关联的商品id','0','','0','0','1','1401610839','1401610839','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('param','商品参数','varchar(255) NOT NULL','string','','商品包含的属性，定制价格等参数','0','','0','0','1','1412064496','1412064496','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_discount_type` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`ismain`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '是否为主要',
`name`  varchar(255) NOT NULL  COMMENT '优惠分类名称',
`state`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '状态',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`dishesdatas`  text NOT NULL  COMMENT '商品id和优惠价格序列化数据',
`paixu`  int(10) NOT NULL  DEFAULT 0 COMMENT '排序',
`setid`  int(10) NOT NULL  COMMENT '商城id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_discount_type','微商城-优惠分类','0','','1','{"1":["state","name","paixu"]}','1:基础','','','','','id:编号\r\npaixu:排序号\r\nname:商品分类名称\r\nstate|get_name_by_status:状态\r\nismain|get_name_by_status:是否主要\r\nid:操作:setzhuyao&id=[id]&ctid=[setid]|设置为主要,[EDIT]&id=[id]]&ctid=[setid]|编辑,[DELETE]|删除','10','name','','1401119532','1401973037','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ismain','是否为主要','tinyint(2) NOT NULL','bool','0','设置为主要后,可以出现在商品页面推荐','0','0:不是\r\n1:是','0','0','1','1401686835','1401686207','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','优惠分类名称','varchar(255) NOT NULL','string','','如特价，推荐，限时优惠，特供','1','','0','0','1','1401539832','1401119661','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','tinyint(2) NOT NULL','bool','0','停用后将不会显示在优惠分类栏目中','1','0:启用\r\n1:停用','0','0','1','1401119857','1401119857','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401205296','1401205296','','3','','regex','get_token','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('dishesdatas','商品id和优惠价格序列化数据','text NOT NULL','textarea','','','0','','0','0','1','1401539979','1401119705','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('paixu','排序','int(10) NOT NULL','num','0','数字越大排序越靠前，默认按添加时间排序','1','','0','0','1','1401539873','1401120018','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('setid','商城id','int(10) NOT NULL','num','','关联的商城id','0','','0','0','1','1401540169','1401539914','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_order` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`tablemanage_id`  int(10) NOT NULL  COMMENT '关联的属性编号',
`endtime`  varchar(255) NOT NULL  COMMENT '过期时间',
`zftype`  char(50) NOT NULL  DEFAULT 0 COMMENT '支付方式',
`price`  varchar(255) NOT NULL  COMMENT '订单原总价',
`yhprice`  varchar(255) NOT NULL  COMMENT '优惠后的总价',
`openid`  varchar(255) NOT NULL  COMMENT '关联的微信用户id',
`dishes_count_datas`  text NOT NULL  COMMENT '商品序列化数据',
`set_id`  int(10) NOT NULL  COMMENT '关联的商店id',
`statekz`  char(50) NOT NULL  DEFAULT 0 COMMENT '状态扩展',
`dcnum`  varchar(255) NOT NULL  COMMENT '自取单号',
`state`  char(50) NOT NULL  DEFAULT 0 COMMENT '状态',
`diningtypes`  char(50) NOT NULL  DEFAULT 0 COMMENT '订单类型',
`beizhu`  text NOT NULL  COMMENT '备注',
`cpcount`  int(10) NOT NULL  DEFAULT 0 COMMENT '商品总数量',
`ctime`  varchar(255) NOT NULL  COMMENT '创建时间',
`jctime`  varchar(255) NOT NULL  COMMENT '自取/快递时间',
`contactid`  int(10) NOT NULL  COMMENT '联系信息id',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`logistics`  text NOT NULL  COMMENT '物流信息',
`transaction_id`  varchar(32) NOT NULL  COMMENT '微信支付流水号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_order','微商城-订单管理','0','','1','{"1":["beizhu","jctime"]}','1:基础','','','','','id:编号\r\ndcnum:订单编号\r\ncontactid:用户id\r\nctime:下单时间\r\njctime:自取/送货时间\r\nyhprice:优惠后总价\r\ncpcount:商品数量\r\nstate|get_name_by_status:状态\r\nstatekz|get_name_by_status:附加状态\r\nbeizhu:备注\r\nid:操作:lookcp&ctid=[set_id]&id=[id]|查看详细,[EDIT]&id=[id]|修改订单状态','10','','','1401115120','1404723957','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tablemanage_id','关联的属性编号','int(10) NOT NULL','num','','','0','','0','0','1','1401116922','1401116922','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('endtime','过期时间','varchar(255) NOT NULL','string','','订单未支付过期时间','0','','0','0','1','1401699274','1401116798','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zftype','支付方式','char(50) NOT NULL','select','0','','0','0:支付宝\r\n1:微信支付\r\n2:网银\r\n3:拉卡拉\r\n4:线下支付','0','0','1','1401636926','1401116261','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('price','订单原总价','varchar(255) NOT NULL','string','','','0','','0','0','1','1404723179','1401115968','/^(d*.d{0,2}|d+).*$/','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('yhprice','优惠后的总价','varchar(255) NOT NULL','string','','','0','','0','0','1','1401116031','1401116031','/^(d*.d{0,2}|d+).*$/','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','关联的微信用户id','varchar(255) NOT NULL','string','','','0','','0','0','1','1401115609','1401115609','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('dishes_count_datas','商品序列化数据','text NOT NULL','textarea','','','0','','0','0','1','1404723259','1401115713','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('set_id','关联的商店id','int(10) NOT NULL','num','','','0','','0','0','1','1404723292','1401115308','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('statekz','状态扩展','char(50) NOT NULL','select','0','','3','0:未支付\r\n1:已支付\r\n2:(未支付)申请取消订单\r\n3:(已支付)申请取消订单\r\n4:(已支付)退款中\r\n5:(已支付)拒绝申请取消订单\r\n6:已取消\r\n7:已完成\r\n8:待发货\r\n9:已发货10:退货中','0','0','1','1402220841','1401116657','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('dcnum','自取单号','varchar(255) NOT NULL','string','','','0','','0','0','1','1401116387','1401116387','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','char(50) NOT NULL','select','0','确认后的订单取消需要进入审核处理','3','0:未确认\r\n1:已确认','0','0','1','1402218290','1401116514','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('diningtypes','订单类型','char(50) NOT NULL','select','0','','0','0:自取\r\n1:快递','0','0','1','1404723389','1401117110','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('beizhu','备注','text NOT NULL','textarea','','','1','','0','0','1','1401612088','1401612088','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cpcount','商品总数量','int(10) NOT NULL','num','0','','0','','0','0','1','1401611560','1401611560','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('ctime','创建时间','varchar(255) NOT NULL','string','','订单创建时间','0','','0','0','1','1402216495','1401609275','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('jctime','自取/快递时间','varchar(255) NOT NULL','string','','取货时间','1','','0','0','1','1404723464','1401609319','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('contactid','联系信息id','int(10) NOT NULL','num','','ml_mall_users.id','0','','0','0','1','1404723147','1401609458','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401610691','1401610691','','3','','regex','get_token','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('logistics', '物流信息', 'text NOT NULL', 'textarea', '', '', '1', '', '0', '0', '1', '1410254321', '1410254321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('transaction_id','微信支付流水号','varchar(32) NOT NULL','string','','微信支付流水号','1','','0','0','1','1422955304','1422955304','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_review` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`plcontent`  text NOT NULL  COMMENT '评论内容',
`pltime`  int(10) NOT NULL  COMMENT '评论时间',
`hftime`  int(10) NOT NULL  COMMENT '回复时间',
`hfcontent`  text NOT NULL  COMMENT '回复内容',
`type`  int(10) NOT NULL  DEFAULT 0 COMMENT '评论类型',
`openid`  varchar(255) NOT NULL  COMMENT '关联的用户id',
`set_id`  int(10) NOT NULL  COMMENT '关联的商城id',
`dishes_id`  int(10) NOT NULL  COMMENT '关联的商品id或者关联的桌台id',
`pingji`  int(10) NOT NULL  DEFAULT 3 COMMENT '商品评级',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_review','微商城-评论','0','','1','{"1":["pltime","plcontent","hfcontent","hftime"]}','1:基础','','','','','id:编号\r\nopenid:评论用户id\r\npltime:评论时间','10','','','1401114177','1401206740','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('plcontent','评论内容','text NOT NULL','editor','','','1','','0','0','1','1401117765','1401117765','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pltime','评论时间','int(10) NOT NULL','datetime','','','1','','0','0','1','1401117727','1401117727','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('hftime','回复时间','int(10) NOT NULL','datetime','','','1','','0','0','1','1401117866','1401117866','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('hfcontent','回复内容','text NOT NULL','editor','','','1','','0','0','1','1401117839','1401117839','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','评论类型','int(10) NOT NULL','num','0','评论类型0商品,1属性','0','','0','0','1','1401115001','1401115001','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','关联的用户id','varchar(255) NOT NULL','string','','','0','','0','0','1','1401114232','1401114232','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('set_id','关联的商城id','int(10) NOT NULL','num','','','0','','0','0','1','1401114207','1401114207','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('dishes_id','关联的商品id或者关联的桌台id','int(10) NOT NULL','num','','','0','','0','0','1','1401114340','1401114300','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pingji','商品评级','int(10) NOT NULL','num','3','商品的星级程度从1-5星','0','','0','0','1','1401114619','1401114619','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_dishes_type` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`paixu`  int(10) NOT NULL  DEFAULT 0 COMMENT '排序',
`pic`  int(10) UNSIGNED NOT NULL  COMMENT '分类图片',
`name`  varchar(255) NOT NULL  COMMENT '分类名称',
`state`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '状态',
`setid`  int(10) NOT NULL  COMMENT '关联的商城id',
`dishesdatas`  text NOT NULL  COMMENT '商品集合',
`introduction`  text NOT NULL  COMMENT '简介',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_ml_mall_dishes_type` (`id`,`paixu`,`pic`,`name`,`state`,`setid`,`dishesdatas`,`introduction`,`token`) VALUES ('101','1','0','夏装','0','5','a:1:{i:0;s:2:"10";}','<p>优衣库夏装</p>','gh_58eed0dc2a8e');
INSERT INTO `uctoo_ml_mall_dishes_type` (`id`,`paixu`,`pic`,`name`,`state`,`setid`,`dishesdatas`,`introduction`,`token`) VALUES ('102','1','0','新品','0','6','a:1:{i:0;s:2:"11";}','<p>新品</p>','gh_58eed0dc2a8e');
INSERT INTO `uctoo_ml_mall_dishes_type` (`id`,`paixu`,`pic`,`name`,`state`,`setid`,`dishesdatas`,`introduction`,`token`) VALUES ('103','2','382','6月上新','0','6','a:1:{i:0;s:2:"12";}','<p>6月上新</p>','gh_58eed0dc2a8e');
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_dishes_type','微商城-商品分类','0','','1','{"1":["name","pic","introduction","state","paixu"]}','1:基础','','','','','id:编号\r\npaixu:排序号\r\npic:商品分类图片\r\nname:商品分类名称\r\nstate|get_name_by_status:状态\r\nid:操作:[EDIT]&id=[id]&ctid=[setid]|编辑,[DELETE]|删除','10','name','introduction','1401113818','1401973013','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('paixu','排序','int(10) NOT NULL','num','0','数字越大,排序越靠前','1','','0','0','1','1401471365','1401471365','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('pic','分类图片','int(10) UNSIGNED NOT NULL','picture','','','1','','0','0','1','1403941661','1401113921','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','分类名称','varchar(255) NOT NULL','string','','','1','','0','1','1','1403941647','1401113870','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','tinyint(2) NOT NULL','bool','0','停用后将不会显示在菜系栏目','1','0:启用\r\n1:停用','0','0','1','1401114031','1401114031','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('setid','关联的商城id','int(10) NOT NULL','num','','','0','','0','0','1','1401433017','1401433017','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('dishesdatas','商品集合','text NOT NULL','textarea','','关联的商品id集合序列化','0','','0','0','1','1401432947','1401432947','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('introduction','简介','text NOT NULL','editor','','','1','','0','0','1','1401113979','1401113979','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401204630','1401204630','','3','','regex','get_token','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_yuyuemanage` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`yycount`  int(10) NOT NULL  COMMENT '预约人数',
`sex`  int(10) NOT NULL  DEFAULT 0 COMMENT '预约人性别',
`usermobile`  varchar(255) NOT NULL  COMMENT '预约人电话',
`username`  varchar(255) NOT NULL  COMMENT '预约人姓名',
`openid`  varchar(255) NOT NULL  COMMENT '关联微信用户id',
`tablemanage_id`  int(10) NOT NULL  COMMENT '桌台编号',
`set_id`  int(10) NOT NULL  COMMENT '关联的商城编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_yuyuemanage','微商城-电话预约管理','0','','1','{"1":["username","usermobile","sex","yycount"]}','1:基础','','','','','id:编号\r\nusername:预约人姓名\r\nusermobile:预约人电话\r\nsex:性别\r\nyycount:预约人数','10','username','','1401113104','1401698416','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('yycount','预约人数','int(10) NOT NULL','num','','','1','','0','0','1','1401119030','1401119030','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sex','预约人性别','int(10) NOT NULL','num','0','0未知,1男,2女','1','','0','0','1','1401117511','1401117511','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('usermobile','预约人电话','varchar(255) NOT NULL','string','','','1','','0','0','1','1401117326','1401117326','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('username','预约人姓名','varchar(255) NOT NULL','string','','','1','','0','0','1','1401117300','1401117300','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','关联微信用户id','varchar(255) NOT NULL','string','','','0','','0','0','1','1401117271','1401117271','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('tablemanage_id','桌台编号','int(10) NOT NULL','num','','','0','','0','0','1','1401113324','1401113324','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('set_id','关联的商城编号','int(10) NOT NULL','num','','','0','','0','0','1','1401206543','1401206543','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_scheduledtask` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`fenz`  varchar(255) NOT NULL  DEFAULT '*' COMMENT '每分',
`xiaos`  varchar(255) NOT NULL  DEFAULT '*' COMMENT '每时',
`yue`  varchar(255) NOT NULL  DEFAULT '*' COMMENT '每月',
`day`  varchar(255) NOT NULL  DEFAULT '*' COMMENT '每日',
`zhou`  varchar(255) NOT NULL  DEFAULT '*' COMMENT '每周',
`starttime_endtime`  text NOT NULL  COMMENT '开始和结束时间的序列化数据',
`state`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '状态',
`upruntime`  int(10) NOT NULL  COMMENT '上次执行时间',
`downruntime`  int(10) NOT NULL  COMMENT '下次任务执行时间',
`title`  text NOT NULL  COMMENT '任务名称',
`type`  int(10) NOT NULL  DEFAULT 0 COMMENT '任务类型',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_scheduledtask','微商城-计划任务列表','0','','1','{"1":["title","state","type","zhou","yue","day","xiaos","fenz"]}','1:基础','','','','','id:编号\r\ntitle:任务名称\r\nupruntime:上次执行时间\r\ndownruntime:下次执行时间','10','title','','1401112371','1401207461','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('fenz','每分','varchar(255) NOT NULL','string','*','设置哪一分钟执行本任务，多个值之间用半角逗号 "," 隔开，*”为不限制','1','','0','0','1','1401207395','1401207395','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('xiaos','每时','varchar(255) NOT NULL','string','*','设置哪一小时执行本任务，“*”为不限制','1','','0','0','1','1401207176','1401207176','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('yue','每月','varchar(255) NOT NULL','string','*','设置哪一月执行本任务，“*”为不限制','1','','0','0','1','1401207146','1401207010','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('day','每日','varchar(255) NOT NULL','string','*','设置哪一日执行本任务，“*”为不限制','1','','0','0','1','1401207130','1401207130','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('zhou','每周','varchar(255) NOT NULL','string','*','设置星期几执行本任务，“*”为不限制，本设置会覆盖下面的“日”设定','1','','0','0','1','1401206983','1401206983','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('starttime_endtime','开始和结束时间的序列化数据','text NOT NULL','textarea','','开始和结束时间的序列化数据','0','','0','0','1','1401112431','1401112431','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','tinyint(2) NOT NULL','bool','0','停用后，计划任务将不会执行','1','0:启用\r\n1:停用','0','0','1','1401112617','1401112617','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('upruntime','上次执行时间','int(10) NOT NULL','datetime','','上次任务执行的时间','0','','0','0','1','1401112687','1401112687','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('downruntime','下次任务执行时间','int(10) NOT NULL','datetime','','下次任务执行的时间','0','','0','0','1','1401112735','1401112735','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','任务名称','text NOT NULL','textarea','','','1','','0','1','1','1401112503','1401112503','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','任务类型','int(10) NOT NULL','num','0','0:一次型,1:周期性,2:自定义时间','1','','0','0','1','1401206909','1401206909','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401205393','1401205393','','3','','regex','get_token','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;



CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_dishes` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`paixu`  int(10) NOT NULL  DEFAULT 0 COMMENT '排序',
`state`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '状态',
`review_count`  int(10) NOT NULL  DEFAULT 0 COMMENT '评论数量',
`icon`  int(10) UNSIGNED NOT NULL  COMMENT ' 商品封面 ',
`dishes_num`  varchar(255) NOT NULL  COMMENT '商品编号',
`price`  varchar(255) NOT NULL  COMMENT '价格',
`introduction`  text NOT NULL  COMMENT '商品简介',
`name`  varchar(255) NOT NULL  COMMENT '商品名称',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`youhuiid`  int(10) NOT NULL  DEFAULT 0 COMMENT '优惠id',
`attr`  text NOT NULL  COMMENT '关联属性',
`featured`  char(10) NOT NULL  DEFAULT 0 COMMENT '特色推荐',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_ml_mall_dishes` (`id`,`paixu`,`state`,`review_count`,`icon`,`dishes_num`,`price`,`introduction`,`name`,`token`,`youhuiid`,`attr`,`featured`) VALUES ('10','1','0','0','410','1','500','<p>优衣库衬衣</p>','衬衣','gh_58eed0dc2a8e','0','1,2,4,5','1');
INSERT INTO `uctoo_ml_mall_dishes` (`id`,`paixu`,`state`,`review_count`,`icon`,`dishes_num`,`price`,`introduction`,`name`,`token`,`youhuiid`,`attr`,`featured`) VALUES ('11','1','0','0','434','2','50','<p>亚历山大雪糕1</p>','雪糕1','gh_58eed0dc2a8e','0','2','1');
INSERT INTO `uctoo_ml_mall_dishes` (`id`,`paixu`,`state`,`review_count`,`icon`,`dishes_num`,`price`,`introduction`,`name`,`token`,`youhuiid`,`attr`,`featured`) VALUES ('12','2','0','0','435','2','30','<p>巧克力雪糕</p>','巧克力雪糕','gh_58eed0dc2a8e','1','1','0');
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_dishes','微商城-商品库','0','','1','{"1":["dishes_num","name","price","icon","introduction","state","paixu","attr","featured"]}','1:基础','','','','','id:编号\r\npaixu:排序号\r\nicon:商品图片\r\nname:商品名称\r\nstate|get_name_by_status:状态\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]|删除,attr&id=[id]|属性','10','name','dishes_num','1401110349','1404643658','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('paixu','排序','int(10) NOT NULL','num','0','数字越大排序越靠前，默认按添加时间排序','1','','0','0','1','1401541928','1401120081','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('state','状态','tinyint(2) NOT NULL','bool','0','商品下架后不会出现在菜单中','1','0:上架\r\n1:下架','0','0','1','1401203673','1401203673','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('review_count','评论数量','int(10) NOT NULL','num','0','','0','','0','0','1','1401111125','1401111125','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('icon',' 商品封面 ','int(10) UNSIGNED NOT NULL','picture','','','1','','0','0','1','1401202313','1401202313','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('dishes_num','商品编号','varchar(255) NOT NULL','string','','','1','','0','1','1','1401110538','1401110538','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('price','价格','varchar(255) NOT NULL','string','','商品的原价','1','','0','1','1','1401110913','1401110899','/^(d*.d{0,2}|d+).*$/','3','请输入正确的商品价格','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('introduction','商品简介','text NOT NULL','editor','','','1','','0','0','1','1401110665','1401110665','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('name','商品名称','varchar(255) NOT NULL','string','','','1','','0','1','1','1401110494','1401110485','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1401201073','1401201073','','3','','regex','get_token','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('youhuiid','优惠id','int(10) NOT NULL','num','0','表示该商品属于那个优惠id','0','','0','0','1','1401693201','1401688829','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attr','关联属性','text NOT NULL','string','','填写需要的属性','1','','0','0','1','1404643754','1403929868','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('featured','特色推荐','char(10) NOT NULL','radio','0','特色推荐','1','0:否\r\n1:是','0','0','1','1403952052','1403952052','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_set` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NOT NULL  COMMENT ' Token ',
`keyword`  varchar(255) NOT NULL  COMMENT ' 关键词 ',
`intro`  text NOT NULL  COMMENT '封面简介',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`cover`  int(10) UNSIGNED NOT NULL  COMMENT '封面图片',
`kfname`  varchar(255) NOT NULL  COMMENT '客服名称',
`TemplateIndex`  varchar(255) NOT NULL  DEFAULT 'default' COMMENT '模板编号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_set','微商城-商城设置','0','','1','{"1":["keyword","title","cover","intro","kfname"]}','1:基础','','','','','id:编号\r\nkeyword:关键词\r\ntitle:标题\r\nid:操作:show&id=[id]|预览,listsedit&id=[id]|编辑,listsdel&id=[id]|删除','10','title','intro','1401103928','1401378396','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token',' Token ','varchar(255) NOT NULL','string','','','0','','0','0','1','1401108700','1401103980','','3','','regex','get_token','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword',' 关键词 ','varchar(255) NOT NULL','string','','','1','','0','1','1','1401108295','1401108295','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NOT NULL','textarea','','','1','','0','1','1','1401108377','1401108377','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1401108330','1401108330','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) UNSIGNED NOT NULL','picture','','','1','','0','1','1','1401108403','1401108403','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('kfname','客服名称','varchar(255) NOT NULL','string','','用于评论中显示的回复名称','1','','0','0','1','1401118036','1401118036','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('TemplateIndex','模板编号','varchar(255) NOT NULL','string','default','使用的模板编号','0','','0','0','1','1401195917','1401195917','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_order_his` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`return_code`  varchar(16) NOT NULL  COMMENT '返回状态码',
`return_msg`  varchar(128) NOT NULL  COMMENT '返回信息',
`appid`  varchar(32) NOT NULL  COMMENT '公众账号ID',
`mch_id`  varchar(32) NOT NULL  COMMENT '商户号',
`nonce_str`  varchar(32) NOT NULL  COMMENT '随机字符串',
`sign`  varchar(32) NOT NULL  COMMENT '签名',
`result_code`  varchar(16) NOT NULL  COMMENT '业务结果',
`err_code`  varchar(32) NOT NULL  COMMENT '错误代码',
`err_code_des`  varchar(128) NOT NULL  COMMENT '错误代码描述',
`openid`  varchar(128) NOT NULL  COMMENT '用户标识',
`is_subscribe`  varchar(1) NOT NULL  COMMENT '是否关注公众账号',
`trade_type`  varchar(16) NOT NULL  COMMENT '交易类型',
`bank_type`  varchar(16) NOT NULL  COMMENT '付款银行',
`total_fee`  int(10) NOT NULL  COMMENT '总金额',
`cash_fee`  int(10) NOT NULL  COMMENT '现金支付金额',
`transaction_id`  varchar(32) NOT NULL  COMMENT '微信支付订单号',
`out_trade_no`  varchar(32) NOT NULL  COMMENT '商户订单号',
`attach`  varchar(128) NOT NULL  COMMENT '商家数据包',
`time_end`  varchar(14) NOT NULL  COMMENT '支付完成时间',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `uctoo_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) VALUES ('ml_mall_order_his','微商城-交易历史数据','0','','1','{"1":["return_code","return_msg","appid","mch_id","nonce_str","sign","result_code","err_code","err_code_des","openid","is_subscribe","trade_type","bank_type","total_fee","cash_fee","transaction_id","out_trade_no","attach","time_end"]}','1:基础','','','','','openid:用户标识\r\nout_trade_no:商户订单号\r\ntransaction_id:微信支付订单号\r\ntotal_fee:总金额\r\ntime_end:完成时间\r\n','10','','','1422948359','1422951067','1','MyISAM');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('return_code','返回状态码','varchar(16) NOT NULL','string','','返回状态码','1','','0','1','1','1422949540','1422949540','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('return_msg','返回信息','varchar(128) NOT NULL','string','','返回信息','1','','0','0','1','1422949659','1422949659','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('appid','公众账号ID','varchar(32) NOT NULL','string','','微信分配的公众账号ID','1','','0','1','1','1422949729','1422949729','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mch_id','商户号','varchar(32) NOT NULL','string','','微信支付分配的商户号','1','','0','1','1','1422949782','1422949782','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('nonce_str','随机字符串','varchar(32) NOT NULL','string','','随机字符串，不长于32位','1','','0','1','1','1422949857','1422949857','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sign','签名','varchar(32) NOT NULL','string','','签名','1','','0','1','1','1422949895','1422949895','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('result_code','业务结果','varchar(16) NOT NULL','string','','业务结果','1','','0','1','1','1422949981','1422949981','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('err_code','错误代码','varchar(32) NOT NULL','string','','错误代码','1','','0','0','1','1422950033','1422950033','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('err_code_des','错误代码描述','varchar(128) NOT NULL','string','','错误返回的信息描述','1','','0','0','1','1422950073','1422950073','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','用户标识','varchar(128) NOT NULL','string','','用户在商户appid下的唯一标识','1','','0','1','1','1422950114','1422950114','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_subscribe','是否关注公众账号','varchar(1) NOT NULL','string','','用户是否关注公众账号，Y-关注，N-未关注，仅在公众账号类型支付有效','1','','0','1','1','1422950212','1422950212','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('trade_type','交易类型','varchar(16) NOT NULL','string','','JSAPI、NATIVE、APP','1','','0','1','1','1422950254','1422950254','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('bank_type','付款银行','varchar(16) NOT NULL','string','','银行类型，采用字符串类型的银行标识，银行类型见附表','1','','0','1','1','1422950285','1422950285','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('total_fee','总金额','int(10) NOT NULL','num','','订单总金额，单位为分','1','','0','1','1','1422950334','1422950334','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cash_fee','现金支付金额','int(10) NOT NULL','num','','现金支付金额订单现金支付金额','1','','0','1','1','1422950415','1422950415','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('transaction_id','微信支付订单号','varchar(32) NOT NULL','string','','微信支付订单号','1','','0','1','1','1422950465','1422950465','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('out_trade_no','商户订单号','varchar(32) NOT NULL','string','','商户系统的订单号，与请求一致','1','','0','1','1','1422950506','1422950506','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('attach','商家数据包','varchar(128) NOT NULL','string','','商家数据包，原样返回','1','','0','0','1','1422950547','1422950547','','3','','regex','','3','function');
INSERT INTO `uctoo_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('time_end','支付完成时间','varchar(14) NOT NULL','string','','支付完成时间，格式为yyyyMMddHHmmss','1','','0','1','1','1422950583','1422950583','','3','','regex','','3','function');
UPDATE `uctoo_attribute` SET model_id= (SELECT MAX(id) FROM `uctoo_model`) WHERE model_id=0;