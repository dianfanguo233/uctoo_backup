/*
UCToo Data Transfer
Date: 2014-09-01 14:06:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uctoo_action
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_action`;
CREATE TABLE `uctoo_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of uctoo_action
-- ----------------------------
INSERT INTO `uctoo_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了管理中心', '1', '0', '1393685660');
INSERT INTO `uctoo_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `uctoo_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '0', '1383285646');
INSERT INTO `uctoo_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `uctoo_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `uctoo_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `uctoo_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `uctoo_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `uctoo_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `uctoo_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `uctoo_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');
INSERT INTO `uctoo_action` VALUES ('12', 'admin_login', '登录后台', '管理员登录后台', '', '[user|get_nickname]在[time|time_format]登录了后台', '2', '1', '1393685618');

-- ----------------------------
-- Table structure for uctoo_action_log
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_action_log`;
CREATE TABLE `uctoo_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=562 DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Table structure for uctoo_addon_category
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_addon_category`;
CREATE TABLE `uctoo_addon_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `icon` int(10) unsigned NOT NULL COMMENT '分类图标',
  `title` varchar(255) NOT NULL COMMENT '分类名',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_addon_category
-- ----------------------------
INSERT INTO `uctoo_addon_category` VALUES ('1', '74', '教育行业', '2');
INSERT INTO `uctoo_addon_category` VALUES ('2', '74', '基础插件', '0');
INSERT INTO `uctoo_addon_category` VALUES ('3', '74', '互动类', '1');
INSERT INTO `uctoo_addon_category` VALUES ('4', '74', '高级插件', '3');

-- ----------------------------
-- Table structure for uctoo_addons
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_addons`;
CREATE TABLE `uctoo_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `type` tinyint(1) DEFAULT '0' COMMENT '插件类型 0 普通插件 1 微信插件 2 易信插件',
  `cate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of uctoo_addons
-- ----------------------------
INSERT INTO `uctoo_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512015', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('22', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1391687096', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '0', 'null', 'thinkphp', '0.1', '1379842319', '1', '0', null);
INSERT INTO `uctoo_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"1669260\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1380273962', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('16', 'Vote', '投票', '支持文本和图片两类的投票功能', '1', '{\"random\":\"1\"}', '地下凡星', '0.1', '1388811198', '1', '1', '3');
INSERT INTO `uctoo_addons` VALUES ('17', 'Chat', '智能聊天', '通过网络上支持的智能API，实现：天气、翻译、藏头诗、笑话、歌词、计算、域名信息/备案/收录查询、IP查询、手机号码归属、人工智能聊天等功能', '1', '{\"tuling_key\":\"d812d695a5e0df258df952698faca6cc\",\"tuling_url\":\"http:\\/\\/www.tuling123.com\\/openapi\\/api\",\"simsim_key\":\"41250a68-3cb5-43c8-9aa2-d7b3caf519b1\",\"simsim_url\":\"http:\\/\\/sandbox.api.simsimi.com\\/request.p\",\"i9_url\":\"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php\",\"rand_reply\":\"\\u6211\\u4eca\\u5929\\u7d2f\\u4e86\\uff0c\\u660e\\u5929\\u518d\\u966a\\u4f60\\u804a\\u5929\\u5427\\r\\n\\u54c8\\u54c8~~\\r\\n\\u4f60\\u8bdd\\u597d\\u591a\\u554a\\uff0c\\u4e0d\\u8ddf\\u4f60\\u804a\\u4e86\\r\\n\\u867d\\u7136\\u4e0d\\u61c2\\uff0c\\u4f46\\u89c9\\u5f97\\u4f60\\u8bf4\\u5f97\\u5f88\\u5bf9\"}', '地下凡星', '0.1', '1389454867', '0', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('18', 'Wecome', '欢迎语', '用户关注公众号时发送的欢迎信息，支持文本，图片，图文的信息', '1', '{\"type\":\"1\",\"title\":\"\",\"description\":\"欢迎关注，请<a href=\"[follow]\">绑定帐号</a>后体验更多功能\",\"pic_url\":\"\",\"url\":\"\"}', '地下凡星', '0.1', '1389620372', '0', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('19', 'UserCenter', '微信用户中心', '实现3G首页、微信登录，微信用户绑定，微信用户信息初始化等基本功能', '1', '{\"random\":\"1\"}', '地下凡星', '0.1', '1390660425', '1', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('23', 'HelloWorld', '微信入门案例', '这是一个简单的入门案例', '1', 'null', '凡星', '0.1', '1393038143', '0', '1', null);
INSERT INTO `uctoo_addons` VALUES ('24', 'BaiduStatistics', '百度统计', '这是百度统计功能，只要开启插件并设置统计代码，就可以使用统计功能了', '1', '{\"code\":\"\"}', 'uctoo.com', '1.0', '1393116011', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('56', 'CustomMenu', '自定义菜单', '自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能', '1', 'null', '凡星', '0.1', '1398264735', '1', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('31', 'Robot', '机器人聊天', '实现的效果如下\r\n用户输入：“机器人学习时间”\r\n微信回复：“你的问题是？”\r\n用户输入：“这个世界上谁最美？”\r\n微信回复： “你的答案是？”\r\n用户回复： “当然是你啦！”\r\n微信回复：“我明白啊，不信你可以问问我”\r\n用户回复：“这个世界上谁最美？”\r\n微信回复：“当然是你啦！”', '1', 'null', '地下凡星', '0.1', '1393987090', '0', '1', '4');
INSERT INTO `uctoo_addons` VALUES ('36', 'Extensions', '融合第三方', '第三方功能扩展', '1', 'null', '地下凡星', '0.1', '1394268715', '1', '1', '4');
INSERT INTO `uctoo_addons` VALUES ('32', 'Suggestions', '建议意见', '用户在微信里输入“建议意见”四个字时，返回一个图文信息，引导用户进入填写建议意见的3G页面，用户填写信息提交后显示感谢之意并提示关闭页面返回微信\r\n管理员可以在管理中心里看到用户反馈的内容列表，并对内容进行编辑，删除操作', '1', '{\"need_truename\":\"0\",\"need_mobile\":\"0\"}', '地下凡星', '0.1', '1394264272', '1', '1', '3');
INSERT INTO `uctoo_addons` VALUES ('38', 'Card', '会员卡', '这是一个临时描述', '1', 'null', '无名', '0.1', '1395235360', '0', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('39', 'WeiSite', '微官网', '微官网', '1', 'null', '凡星', '0.1', '1395326578', '0', '1', '4');
INSERT INTO `uctoo_addons` VALUES ('42', 'Leaflets', '微信宣传页', '微信公众号二维码推广页面，用作推广或者制作广告易拉宝，可以发布到QQ群微博博客论坛等等...', '1', '{\"random\":\"1\"}', '凡星', '0.1', '1396056935', '0', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('48', 'CustomReply', '自定义回复', '这是一个临时描述', '1', 'null', '凡星', '0.1', '1396578089', '1', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('49', 'Forms', '通用表单', '管理员可以轻松地增加一个表单用于收集用户的信息，如活动报名、调查反馈、预约填单等', '1', 'null', '凡星', '0.1', '1396688995', '1', '1', '4');
INSERT INTO `uctoo_addons` VALUES ('50', 'Survey', '微调研', '这是一个临时描述', '1', 'null', '凡星', '0.1', '1396883644', '1', '1', '3');
INSERT INTO `uctoo_addons` VALUES ('51', 'Exam', '微考试', '主要功能有试卷管理，题目录入管理，考生信息和考分汇总管理。', '1', 'null', '凡星', '0.1', '1397035112', '1', '1', '1');
INSERT INTO `uctoo_addons` VALUES ('53', 'Test', '微测试', '主要功能有问卷管理，题目录入管理，用户信息和得分汇总管理。', '1', 'null', '凡星', '0.1', '1397142151', '1', '1', '1');
INSERT INTO `uctoo_addons` VALUES ('54', 'Diy', '万能页面', '可以通过拖拉的方式配置一个3G页面', '1', 'null', '凡星', '0.1', '1397360521', '1', '1', '4');
INSERT INTO `uctoo_addons` VALUES ('58', 'Cascade', '级联菜单', '支持无级级联菜单，用于地区选择、多层分类选择等场景。菜单的数据来源支持查询数据库和直接用户按格式输入两种方式', '1', 'null', '凡星', '0.1', '1398694996', '0', '0', null);
INSERT INTO `uctoo_addons` VALUES ('59', 'Coupon', '优惠券', '配合粉丝圈子，打造粉丝互动的运营激励基础', '1', 'null', '凡星', '0.1', '1399259217', '1', '1', '3');
INSERT INTO `uctoo_addons` VALUES ('60', 'Scratch', '刮刮卡', '刮刮卡', '1', 'null', '凡星', '0.1', '1399273157', '1', '1', '3');
INSERT INTO `uctoo_addons` VALUES ('63', 'Juhe', '聚合数据', '集成聚合数据（http://www.juhe.cn）平台的功能', '1', '{\"stock\":\"\",\"exchange\":\"\",\"gold\":\"\"}', '凡星', '0.1', '1399810730', '0', '1', '4');
INSERT INTO `uctoo_addons` VALUES ('64', 'Tongji', '运营统计', '统计每个插件使用情况', '1', 'null', '凡星', '0.1', '1401437689', '1', '1', '2');
INSERT INTO `uctoo_addons` VALUES ('83', 'YouaskService', '你问我答客服系统', '一个支持你问我答,关键词制定客服的客服系统', '1', 'null', '陌路生人', '0.1', '1403947448', '1', '1', '1');
INSERT INTO `uctoo_addons` VALUES ('84', 'Mall', '微商城', '微商城为商家提供一个平台，在这个更简便的、方便的平台里进行更为现代的电子商务。同时在利用微信的这个平台也可以为商家提供更有效的宣传方式，更有利于商品的推广。', '1', 'null', 'uctoo.com', '0.1', '1409820343', '1', '1', '4');

-- ----------------------------
-- Table structure for uctoo_attachment
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_attachment`;
CREATE TABLE `uctoo_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of uctoo_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_attribute
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_attribute`;
CREATE TABLE `uctoo_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of uctoo_attribute
-- ----------------------------
INSERT INTO `uctoo_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('34', 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '1', '1', '1388815953', '1388815953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('35', 'addon', '关键词所属插件', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '1', '1', '1388816207', '1388816207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('36', 'aim_id', '插件表里的ID值', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '5', '1', '1', '1388816287', '1388816287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('37', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '5', '0', '1', '1388816392', '1388816392', '', '1', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('38', 'keyword', '关键词', 'varchar(50) NOT NULL', 'string', '', '用户在微信里回复此关键词将会触发此投票。', '1', '', '6', '1', '1', '1392969972', '1388930888', 'keyword_unique', '1', '此关键词已经存在，请换成别的关键词再试试', 'function', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('39', 'title', '投票标题', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '6', '1', '1', '1388931041', '1388931041', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('40', 'description', '投票描述', 'text NOT NULL', 'textarea', '', '', '1', '', '6', '0', '1', '1400633517', '1388931173', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('41', 'picurl', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '支持JPG、PNG格式，较好的效果为大图360*200，小图200*200', '1', '', '6', '0', '1', '1388931285', '1388931285', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('42', 'type', '选择类型', 'char(10) NOT NULL', 'radio', '0', '', '1', '0:单选\r\n1:多选', '6', '1', '1', '1388936429', '1388931487', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('43', 'start_date', '开始日期', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '6', '0', '1', '1388931734', '1388931734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('44', 'end_date', '结束日期', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '6', '0', '1', '1388931769', '1388931769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('45', 'is_img', '文字/图片投票', 'tinyint(2) NOT NULL', 'radio', '0', '', '0', '0:文字投票\r\n1:图片投票', '6', '1', '1', '1389081985', '1388931941', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('46', 'vote_count', '投票数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '6', '0', '1', '1388932035', '1388932035', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('47', 'cTime', '投票创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '6', '1', '1', '1388932128', '1388932128', '', '1', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('48', 'vote_id', '投票ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '7', '1', '1', '1388982678', '1388933478', '', '3', '', 'regex', '$_REQUEST[\'vote_id\']', '3', 'string');
INSERT INTO `uctoo_attribute` VALUES ('49', 'name', '选项标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '1', '1', '1388933552', '1388933552', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('50', 'image', '图片选项', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '5', '', '7', '0', '1', '1388984467', '1388933679', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('51', 'opt_count', '当前选项投票数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '7', '0', '1', '1388933860', '1388933860', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('52', 'order', '选项排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '1', '', '7', '0', '1', '1388933951', '1388933951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('53', 'vote_id', '投票ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '0', '', '8', '1', '1', '1388934189', '1388934189', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('54', 'user_id', '用户ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '0', '', '8', '0', '1', '1388934265', '1388934265', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('55', 'token', '用户TOKEN', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '8', '0', '1', '1388934296', '1388934296', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('56', 'options', '选择选项', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '8', '1', '1', '1388934351', '1388934351', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('57', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '8', '0', '1', '1388934413', '1388934392', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('58', 'mTime', '更新时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '6', '0', '1', '1390634006', '1390634006', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('66', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '6', '0', '1', '1391397388', '1391397388', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('67', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '5', '0', '1', '1391399528', '1391399528', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('68', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '11', '1', '1', '1391575873', '1391575210', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('69', 'public_name', '公众号名称', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '11', '1', '1', '1391576452', '1391575955', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('70', 'public_id', '公众号原始id', 'varchar(100) NOT NULL', 'string', '', '请正确填写，保存后不能再修改，且无法接收到微信的信息', '1', '', '11', '1', '1', '1391576472', '1391576015', '', '1', '公众号原始ID已经存在，请不要重复增加', 'unique', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('71', 'wechat', '微信号', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '11', '1', '1', '1391576484', '1391576144', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('72', 'interface_url', '接口地址', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '11', '0', '1', '1392946881', '1391576234', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('73', 'headface_url', '公众号头像', 'varchar(255) NOT NULL', 'picture', '', '', '1', '', '11', '0', '1', '1391599849', '1391576300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('74', 'area', '地区', 'varchar(50) NOT NULL', 'string', '', '', '0', '', '11', '0', '1', '1392946934', '1391576435', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('75', 'addon_config', '插件配置', 'text NOT NULL', 'textarea', '', '', '0', '', '11', '0', '1', '1391576537', '1391576537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('76', 'addon_status', '插件状态', 'text NOT NULL', 'textarea', '', '', '0', '', '11', '0', '1', '1391576571', '1391576571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('77', 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', '0', '', '11', '0', '1', '1392946897', '1391597344', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('78', 'is_use', '是否为当前公众号', 'tinyint(2) NOT NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '11', '0', '1', '1391682184', '1391682184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('90', 'type', '公众号类型', 'char(10) NOT NULL', 'radio', '0', '', '1', '0:订阅号\r\n1:服务号', '11', '0', '1', '1393718575', '1393718575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('91', 'appid', 'AppId', 'varchar(255) NOT NULL', 'string', '', '认证服务号的AppId', '1', '', '11', '0', '1', '1393718830', '1393718735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('92', 'secret', 'Secret', 'varchar(255) NOT NULL', 'string', '', '认证服务号的Secret', '1', '', '11', '0', '1', '1393718806', '1393718806', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('93', 'group_id', '等级', 'int(10) UNSIGNED NOT NULL', 'select', '0', '', '0', '', '11', '0', '1', '1393753499', '1393724468', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('94', 'title', '等级名', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '13', '0', '1', '1393724854', '1393724854', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('95', 'addon_status', '插件权限', 'text NOT NULL', 'checkbox', '', '', '1', '1:好人\r\n2:环境', '13', '0', '1', '1393731903', '1393725072', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('96', 'version', '版本号', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '14', '1', '1', '1393770457', '1393770457', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('97', 'title', '升级包名', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '14', '1', '1', '1393770499', '1393770499', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('98', 'description', '描述', 'text NOT NULL', 'textarea', '', '', '1', '', '14', '0', '1', '1393770546', '1393770546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('99', 'create_date', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '14', '0', '1', '1393770591', '1393770591', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('100', 'download_count', '下载统计', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '14', '0', '1', '1393770659', '1393770659', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('101', 'package', '升级包地址', 'varchar(255) NOT NULL', 'textarea', '', '', '1', '', '14', '1', '1', '1393812247', '1393770727', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('108', 'keyword_length', '关键词长度', 'int(10) UNSIGNED  NULL', 'num', '0', '', '1', '', '5', '0', '1', '1398837058', '1393918566', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('109', 'keyword_type', '匹配类型', 'tinyint(2)  NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '5', '0', '1', '1393979962', '1393919686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('110', 'extra_text', '文本扩展', 'text  NULL', 'textarea', '', '', '0', '', '5', '0', '1', '1393919736', '1393919736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('111', 'extra_int', '数字扩展', 'int(10)  NULL', 'num', '', '', '0', '', '5', '0', '1', '1393919798', '1393919798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('113', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '16', '1', '1', '1394068622', '1394033402', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('114', 'uid', '用户ID', 'int(10)  NULL', 'num', '0', '', '0', '', '16', '0', '1', '1394087760', '1394033447', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('115', 'content', '内容', 'text  NULL', 'editor', '', '', '1', '', '16', '1', '1', '1394033484', '1394033484', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('116', 'cTime', '发布时间', 'int(10)  NULL', 'datetime', '', '', '0', '', '16', '0', '1', '1394033571', '1394033571', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('117', 'attach', '附件', 'varchar(255)  NULL', 'file', '', '', '1', '', '16', '0', '1', '1394033674', '1394033674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('118', 'is_top', '置顶', 'int(10) NULL', 'num', '0', '0表示不置顶，否则其它值表示置顶且值是置顶的时间', '0', '0:不置顶\r\n1:置顶', '16', '0', '1', '1394068971', '1394068787', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('119', 'cid', '分类', 'tinyint(4)  NULL', 'select', '', '', '1', '1:安装使用\r\n2:BUG反馈\r\n3:发展建议\r\n4:微信需求\r\n5:微信开发\r\n6:微信运营\r\n7:站内公告', '16', '1', '1', '1394069964', '1394069964', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('120', 'view_count', '浏览数', 'int(11) UNSIGNED NULL', 'num', '0', '', '0', '', '16', '0', '1', '1394072168', '1394072168', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('121', 'reply_count', '回复数', 'int(11) UNSIGNED NULL', 'num', '0', '', '0', '', '16', '0', '1', '1394072217', '1394072217', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('122', 'title', '应用标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '17', '1', '1', '1394068622', '1394033402', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('123', 'uid', '用户ID', 'int(10) NULL', 'num', '0', '', '0', '', '17', '0', '1', '1394087733', '1394033447', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('124', 'content', '应用详细介绍', 'text  NULL', 'editor', '', '', '1', '', '17', '1', '1', '1394033484', '1394033484', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('125', 'cTime', '发布时间', 'int(10)  NULL', 'datetime', '', '', '0', '', '17', '0', '1', '1394033571', '1394033571', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('126', 'attach', '应用压缩包', 'varchar(255)  NULL', 'file', '', '需要上传zip文件', '1', '', '17', '0', '1', '1394084870', '1394033674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('127', 'is_top', '置顶', 'int(10) NULL', 'num', '0', '0表示不置顶，否则其它值表示置顶且值是置顶的时间', '1', '0:不置顶\r\n1:置顶', '17', '0', '1', '1394068971', '1394068787', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('128', 'cid', '分类', 'tinyint(4)  NULL', 'select', '', '', '0', '1:基础模块\r\n2:行业模块\r\n3:会议活动\r\n4:娱乐模块\r\n5:其它模块', '17', '0', '1', '1394085304', '1394069964', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('129', 'view_count', '浏览数', 'int(11) UNSIGNED NULL', 'num', '0', '', '0', '', '17', '0', '1', '1394072168', '1394072168', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('131', 'img_1', '应用截图1', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '17', '0', '1', '1394084842', '1394084635', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('132', 'img_2', '应用截图2', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '17', '0', '1', '1394084821', '1394084714', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('133', 'img_3', '应用截图3', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '17', '0', '1', '1394084757', '1394084757', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('134', 'img_4', '应用截图4', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '17', '0', '1', '1394084797', '1394084797', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('135', 'download_count', '下载数', 'int(10) UNSIGNED NULL', 'num', '0', '', '0', '', '17', '0', '1', '1394085763', '1394085763', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('136', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '18', '0', '1', '1393234678', '1393234678', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('137', 'content', '内容', 'text NOT NULL', 'textarea', '', '', '1', '', '18', '1', '1', '1393234583', '1393234583', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('138', 'uid', '用户ID', 'int(10) NULL', 'num', '0', '', '0', '', '18', '0', '1', '1393234534', '1393234534', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('160', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '22', '0', '1', '1394268247', '1393921586', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('161', 'api_token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '22', '0', '1', '1393922455', '1393912408', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('162', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '22', '0', '1', '1393913608', '1393913608', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('163', 'api_url', '第三方URL', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '22', '0', '1', '1393912354', '1393912354', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('164', 'output_format', '数据输出格式', 'tinyint(1) NULL', 'select', '0', '', '1', '0:标准微信xml\r\n1:json格式', '22', '0', '1', '1394268422', '1393912288', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('165', 'keyword_filter', '关键词过滤', 'tinyint(2) NOT NULL', 'bool', '0', '如设置电影为触发词,用户输入 电影 美国派 时，如果启用过滤只将美国派这个词发送到的你的接口，如果不过滤 就是整个 电影 美国派全部发送到的接口', '1', '0:不过滤\r\n1:过滤', '22', '0', '1', '1394268410', '1393912057', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('166', 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '多个关键词请用空格格开', '1', '', '22', '1', '1', '1393912492', '1393911842', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('180', 'uid', '用户UID', 'int(10) NULL', 'num', '', '', '0', '', '30', '0', '1', '1395482973', '1395482973', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('181', 'username', '姓名', 'varchar(100) NULL', 'string', '', '', '1', '', '30', '0', '1', '1395483048', '1395483048', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('182', 'phone', '手机号', 'varchar(30) NULL', 'string', '', '', '1', '', '30', '0', '1', '1395483248', '1395483248', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('183', 'number', '卡号', 'varchar(50) NULL', 'string', '', '', '3', '', '30', '0', '1', '1395484806', '1395483310', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('184', 'cTime', '加入时间', 'int(10) NULL', 'datetime', '', '', '0', '', '30', '0', '1', '1395484366', '1395484366', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('185', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '31', '0', '1', '1395485192', '1395485192', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('186', 'content', '通知内容', 'text NOT NULL', 'editor', '', '', '1', '', '31', '0', '1', '1395485247', '1395485247', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('187', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '31', '0', '1', '1395485303', '1395485303', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('194', 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', '0', '', '31', '0', '1', '1395911896', '1395911896', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('195', 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', '0', '', '30', '0', '1', '1395973788', '1395912028', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('197', 'title', '分类标题', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '33', '1', '1', '1395988016', '1395988016', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('198', 'icon', '分类图片', 'int(10) UNSIGNED  NULL', 'picture', '', '', '1', '', '33', '0', '1', '1395988966', '1395988966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('199', 'url', '外链', 'varchar(255) NOT NULL', 'string', '', '为空时默认跳转到该分类的文章列表页面', '1', '', '33', '0', '1', '1401408363', '1395989660', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('200', 'is_show', '显示', 'tinyint(2) NOT NULL', 'bool', '1', '', '1', '0: 不显示\r\n1: 显示', '33', '0', '1', '1395989709', '1395989709', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('201', 'token', 'Token', 'varchar(100)  NULL', 'string', '', '', '0', '', '33', '0', '1', '1395989760', '1395989760', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('202', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '34', '1', '1', '1396061575', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('203', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '34', '0', '1', '1396061814', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('204', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '34', '1', '1', '1396061877', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('205', 'intro', '简介', 'text NULL', 'textarea', '', '', '1', '', '34', '0', '1', '1396061947', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('206', 'cate_id', '所属类别', 'int(10) UNSIGNED NULL', 'select', '0', '要先在微官网分类里配置好分类才可选择', '1', '0:请选择分类', '34', '0', '1', '1396078914', '1396062003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('207', 'cover', '封面图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '34', '0', '1', '1396062093', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('208', 'content', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '34', '0', '1', '1396062146', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('209', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '34', '0', '1', '1396075102', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('210', 'title', '标题', 'varchar(255) NULL', 'string', '', '可为空', '1', '', '35', '0', '1', '1396098316', '1396098316', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('211', 'img', '图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '35', '1', '1', '1396098349', '1396098349', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('212', 'url', '链接地址', 'varchar(255) NULL', 'string', '', '', '1', '', '35', '0', '1', '1396098380', '1396098380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('213', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '35', '0', '1', '1396098464', '1396098464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('214', 'sort', '排序', 'int(10) UNSIGNED NULL', 'num', '0', '值越小越靠前', '1', '', '35', '0', '1', '1396098682', '1396098682', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('215', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '35', '0', '1', '1396098747', '1396098747', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('216', 'url', '关联URL', 'varchar(255)   NULL', 'string', '', '', '1', '', '36', '0', '1', '1394519090', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('218', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '36', '1', '1', '1394519941', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('219', 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '36', '0', '1', '1394519296', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('220', 'sort', '排序号', 'tinyint(4)  NULL', 'num', '0', '数值越小越靠前', '1', '', '36', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('221', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '36', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('423', 'sort', '排序号', 'int(10)  NULL', 'num', '0', '数值越小越靠前', '1', '', '33', '0', '1', '1396340334', '1396340334', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('424', 'icon', '图标', 'int(10) UNSIGNED NULL', 'picture', '', '根据选择的底部模板决定是否需要上传图标', '1', '', '36', '0', '1', '1396506297', '1396506297', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('425', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '数值越小越靠前', '1', '', '34', '0', '1', '1396510508', '1396510508', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('426', 'view_count', '浏览数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '34', '0', '1', '1396510630', '1396510630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('427', 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '多个关键词请用空格分开：例如: 高 富 帅', '1', '', '62', '0', '1', '1396578460', '1396578212', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('428', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '62', '0', '1', '1396623302', '1396578249', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('429', 'content', '回复内容', 'text NOT NULL', 'textarea', '', '请不要多于1000字否则无法发送。支持加超链接，但URL必须带http://', '1', '', '62', '0', '1', '1396607362', '1396578597', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('430', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '64', '1', '1', '1396061575', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('431', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '64', '0', '1', '1396061814', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('432', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '64', '1', '1', '1396061877', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('433', 'intro', '简介', 'text NULL', 'textarea', '', '', '1', '', '64', '0', '1', '1396061947', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('434', 'cate_id', '所属类别', 'int(10) UNSIGNED NULL', 'select', '0', '要先在微官网分类里配置好分类才可选择', '1', '0:请选择分类', '64', '0', '1', '1396078914', '1396062003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('435', 'cover', '封面图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '64', '0', '1', '1396062093', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('436', 'content', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '64', '0', '1', '1396062146', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('437', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '64', '0', '1', '1396075102', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('438', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '数值越小越靠前', '1', '', '64', '0', '1', '1396510508', '1396510508', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('439', 'view_count', '浏览数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '64', '0', '1', '1396510630', '1396510630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('440', 'view_count', '浏览数', 'int(10) UNSIGNED NULL', 'num', '0', '', '0', '', '62', '0', '1', '1396580643', '1396580643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('441', 'sort', '排序号', 'int(10) UNSIGNED NULL', 'num', '0', '', '1', '', '62', '0', '1', '1396580674', '1396580674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('444', 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '65', '0', '1', '1396602514', '1396602514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('445', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '65', '0', '1', '1396602706', '1396602548', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('446', 'mult_ids', '多图文ID', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '65', '0', '1', '1396602601', '1396602578', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('447', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '65', '0', '1', '1396602821', '1396602821', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('448', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '64', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('449', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '62', '0', '1', '1396603007', '1396603007', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('471', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '69', '1', '1', '1396866048', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('472', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '69', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('473', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '69', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('474', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '69', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('475', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '69', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('476', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '69', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('478', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '69', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('479', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '69', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('480', 'password', '表单密码', 'varchar(255) NOT NULL', 'string', '', '如要用户输入密码才能进入表单，则填写此项。否则留空，用户可直接进入表单', '0', '', '69', '0', '1', '1396871497', '1396672643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('481', 'finish_tip', '用户提交后提示内容', 'text NOT NULL', 'textarea', '', '为空默认为：提交成功，谢谢参与', '1', '', '69', '0', '1', '1396676366', '1396673689', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('486', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '70', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('490', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '70', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('491', 'name', '字段名', 'varchar(100) NOT NULL', 'string', '', '请输入字段名 英文字母开头，长度不超过30', '1', '', '70', '1', '1', '1396676840', '1396676792', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('492', 'title', '字段标题', 'varchar(255) NOT NULL', 'string', '', '请输入字段标题，用于表单显示', '1', '', '70', '1', '1', '1396676830', '1396676830', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('493', 'type', '字段类型', 'char(50) NOT NULL', 'select', 'string', '用于表单中的展示方式', '1', 'string:单行输入\r\ntextarea:多行输入\r\nradio:单选\r\ncheckbox:多选\r\nselect:下拉选择\r\ndatetime:时间\r\npicture:上传图片\r\ncascade:级联', '70', '1', '1', '1398742035', '1396683600', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('494', 'extra', '参数', 'text NOT NULL', 'textarea', '', '字段类型为单选、多选、下拉选择和级联选择时的定义数据，其它字段类型为空', '1', '', '70', '0', '1', '1396835020', '1396685105', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('495', 'value', '默认值', 'varchar(255) NOT NULL', 'string', '', '字段的默认值', '1', '', '70', '0', '1', '1396685291', '1396685291', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('496', 'remark', '字段备注', 'varchar(255) NOT NULL', 'string', '', '用于表单中的提示', '1', '', '70', '0', '1', '1396685482', '1396685482', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('497', 'is_must', '是否必填', 'tinyint(2) NOT NULL', 'bool', '', '用于自动验证', '1', '0:否\r\n1:是', '70', '0', '1', '1396685579', '1396685579', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('498', 'validate_rule', '正则验证', 'varchar(255) NOT NULL', 'string', '', '为空表示不作验证', '1', '', '70', '0', '1', '1396685776', '1396685776', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('499', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '值越小越靠前', '1', '', '70', '0', '1', '1396685825', '1396685825', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('500', 'error_info', '出错提示', 'varchar(255) NOT NULL', 'string', '', '验证不通过时的提示语', '1', '', '70', '0', '1', '1396685920', '1396685920', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('501', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '71', '0', '1', '1396688042', '1396688042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('502', 'openid', 'OpenId', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '71', '0', '1', '1396688187', '1396688187', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('503', 'forms_id', '表单ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '71', '0', '1', '1396710064', '1396688308', '', '3', '', 'regex', '', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('504', 'value', '表单值', 'text NOT NULL', 'textarea', '', '', '0', '', '71', '0', '1', '1396688355', '1396688355', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('505', 'cTime', '增加时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '71', '0', '1', '1396688434', '1396688434', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('506', 'can_edit', '是否允许编辑', 'tinyint(2) NOT NULL', 'bool', '0', '用户提交表单是否可以再编辑', '1', '0:不允许\r\n1:允许', '69', '0', '1', '1396688624', '1396688624', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('507', 'forms_id', '表单ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '70', '0', '1', '1396710040', '1396690613', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('508', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '71', '0', '1', '1396690911', '1396690911', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('509', 'is_show', '是否显示', 'tinyint(2) NOT NULL', 'select', '1', '是否显示在表单中', '1', '1:显示\r\n0:不显示', '70', '0', '1', '1396848437', '1396848437', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('510', 'content', '详细介绍', 'text NOT NULL', 'editor', '', '可不填', '1', '', '69', '0', '1', '1396865295', '1396865295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('511', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '73', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('512', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '73', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('513', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '73', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('514', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '73', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('515', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '73', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('516', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '73', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('518', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '73', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('519', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '73', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('520', 'finish_tip', '结束语', 'text NOT NULL', 'textarea', '', '为空默认为：调研完成，谢谢参与', '1', '', '73', '0', '1', '1396953940', '1396953940', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('523', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '74', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('524', 'intro', '问题描述', 'text NOT NULL', 'textarea', '', '', '1', '', '74', '0', '1', '1396954176', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('528', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '74', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('529', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '74', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('530', 'survey_id', 'survey_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '74', '1', '1', '1396954240', '1396954240', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('531', 'type', '问题类型', 'char(50) NOT NULL', 'radio', 'radio', '', '1', 'radio:单选题\r\ncheckbox:多选题\r\ntextarea:简答题', '74', '1', '1', '1396962517', '1396954463', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('532', 'extra', '参数', 'text NOT NULL', 'textarea', '', '类型为单选、多选时的定义数据，格式见上面的提示', '1', '', '74', '0', '1', '1396954558', '1396954558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('533', 'is_must', '是否必填', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '74', '0', '1', '1396954649', '1396954649', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('534', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '值越小越靠前', '1', '', '74', '0', '1', '1396955010', '1396955010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('542', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '75', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('543', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '75', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('544', 'survey_id', 'survey_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '75', '1', '1', '1396955403', '1396955369', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('545', 'question_id', 'question_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '75', '1', '1', '1396955412', '1396955392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('546', 'uid', '用户UID', 'int(10) NULL', 'num', '', '', '0', '', '75', '0', '1', '1396955530', '1396955530', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('547', 'openid', 'OpenId', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '75', '0', '1', '1396955581', '1396955581', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('548', 'answer', '回答内容', 'text NOT NULL', 'textarea', '', '', '0', '', '75', '0', '1', '1396955766', '1396955766', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('549', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '76', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('550', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '0', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '76', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('551', 'title', '试卷标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '76', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('552', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '76', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('553', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '76', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('554', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '0', '', '76', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('555', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '76', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('556', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '76', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('557', 'finish_tip', '结束语', 'text NOT NULL', 'textarea', '', '为空默认为：考试完成，谢谢参与', '0', '', '76', '0', '1', '1396953940', '1396953940', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('558', 'title', '题目标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '77', '1', '1', '1397037377', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('559', 'intro', '题目描述', 'text NOT NULL', 'textarea', '', '', '1', '', '77', '0', '1', '1396954176', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('560', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '77', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('561', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '77', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('562', 'is_must', '是否必填', 'tinyint(2) NOT NULL', 'bool', '1', '', '0', '0:否\r\n1:是', '77', '0', '1', '1397035513', '1396954649', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('563', 'extra', '参数', 'text NOT NULL', 'textarea', '', '每个选项换一行，每项输入格式如：A:男人', '1', '', '77', '0', '1', '1397036210', '1396954558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('564', 'type', '题目类型', 'char(50) NOT NULL', 'radio', 'radio', '', '1', 'radio:单选题\r\ncheckbox:多选题', '77', '1', '1', '1397036281', '1396954463', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('565', 'exam_id', 'exam_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '77', '1', '1', '1396954240', '1396954240', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('566', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '值越小越靠前', '1', '', '77', '0', '1', '1396955010', '1396955010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('567', 'answer', '回答内容', 'text NOT NULL', 'textarea', '', '', '0', '', '78', '0', '1', '1396955766', '1396955766', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('568', 'openid', 'OpenId', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '78', '0', '1', '1396955581', '1396955581', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('569', 'uid', '用户UID', 'int(10) NULL', 'num', '', '', '0', '', '78', '0', '1', '1396955530', '1396955530', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('570', 'question_id', 'question_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '78', '1', '1', '1396955412', '1396955392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('571', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '78', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('572', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '78', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('573', 'exam_id', 'exam_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '78', '1', '1', '1396955403', '1396955369', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('574', 'score', '分值', 'int(10) UNSIGNED NOT NULL', 'num', '0', '考生答对此题的得分数', '1', '', '77', '0', '1', '1397035609', '1397035609', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('575', 'answer', '标准答案', 'varchar(255) NOT NULL', 'string', '', '多个答案用空格分开，如： A B C', '1', '', '77', '0', '1', '1397035889', '1397035889', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('576', 'start_time', '考试开始时间', 'int(10) NOT NULL', 'datetime', '', '为空表示什么时候开始都可以', '1', '', '76', '0', '1', '1397036762', '1397036762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('577', 'end_time', '考试结束时间', 'int(10) NOT NULL', 'datetime', '', '为空表示不限制结束时间', '1', '', '76', '0', '1', '1397036831', '1397036831', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('578', 'score', '得分', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '78', '0', '1', '1397040133', '1397040133', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('579', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '79', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('580', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '79', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('581', 'title', '问卷标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '79', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('582', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '79', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('583', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '79', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('584', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '79', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('586', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '79', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('587', 'finish_tip', '评论语', 'text NOT NULL', 'textarea', '', '详细说明见上面的提示，配置格式：[0-59]不合格', '1', '', '79', '0', '1', '1397142371', '1396953940', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('590', 'title', '题目标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '80', '1', '1', '1397037377', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('591', 'intro', '题目描述', 'text NOT NULL', 'textarea', '', '', '1', '', '80', '0', '1', '1396954176', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('592', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '80', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('593', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '80', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('594', 'is_must', '是否必填', 'tinyint(2) NOT NULL', 'bool', '1', '', '0', '0:否\r\n1:是', '80', '0', '1', '1397035513', '1396954649', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('595', 'extra', '参数', 'text NOT NULL', 'textarea', '', '输入格式见上面的提示', '1', '', '80', '0', '1', '1397142592', '1396954558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('596', 'type', '题目类型', 'char(50) NOT NULL', 'radio', 'radio', '', '0', 'radio:单选题', '80', '1', '1', '1397142548', '1396954463', '', '3', '', 'regex', 'radio', '1', 'string');
INSERT INTO `uctoo_attribute` VALUES ('597', 'test_id', 'test_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '80', '1', '1', '1396954240', '1396954240', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('598', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '值越小越靠前', '1', '', '80', '0', '1', '1396955010', '1396955010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('601', 'answer', '回答内容', 'text NOT NULL', 'textarea', '', '', '0', '', '81', '0', '1', '1396955766', '1396955766', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('602', 'openid', 'OpenId', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '81', '0', '1', '1396955581', '1396955581', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('603', 'uid', '用户UID', 'int(10) NULL', 'num', '', '', '0', '', '81', '0', '1', '1396955530', '1396955530', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('604', 'question_id', 'question_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '81', '1', '1', '1396955412', '1396955392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('605', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '81', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('606', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '81', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('607', 'test_id', 'test_id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '81', '1', '1', '1396955403', '1396955369', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('608', 'score', '得分', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '81', '0', '1', '1397040133', '1397040133', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('609', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '82', '1', '1', '1399038073', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('611', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '82', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('612', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '82', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('613', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '82', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('614', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '82', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('616', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '82', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('617', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '82', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('618', 'url', '访问网址', 'varchar(255) NOT NULL', 'string', '', '为空则自动生成', '0', '', '82', '0', '1', '1398416321', '1397361414', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('619', 'is_close', '是否关闭', 'tinyint(2) NOT NULL', 'bool', '0', '关闭后用户不能再访问该页面', '1', '0:开启\r\n1:关闭', '82', '0', '1', '1397361841', '1397361510', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('620', 'need_login', '游客访问', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:允许\r\n1:禁止', '82', '0', '1', '1397361769', '1397361769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('621', 'layout', '页面参数', 'text NOT NULL', 'textarea', '', '', '0', '', '82', '0', '1', '1397474846', '1397474846', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('622', 'view_count', '浏览数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '82', '0', '1', '1397475862', '1397475862', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('625', 'title', '商品名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '83', '1', '1', '1397520732', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('626', 'intro', '商品简介', 'text NOT NULL', 'textarea', '', '', '1', '', '83', '0', '1', '1397521079', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('627', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '83', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('628', 'cover', '商品封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '83', '0', '1', '1397521134', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('629', 'content', '商品详情', 'text NOT NULL', 'editor', '', '', '1', '', '83', '0', '1', '1397521004', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('630', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '83', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('631', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '83', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('632', 'param', '商品参数', 'text NOT NULL', 'editor', '', '', '1', '', '83', '0', '1', '1397521446', '1397521446', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('633', 'ad_url', '商品广告页面', 'varchar(255) NOT NULL', 'string', '', '可为空，填写商品广告页面的地址', '1', '', '83', '0', '1', '1397521579', '1397521579', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('634', 'buy_url', '购买地址', 'varchar(255) NOT NULL', 'string', '', '用户点击购买按钮时跳转的地址，可以是淘宝等网店的购买地址', '1', '', '83', '0', '1', '1397524287', '1397524287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('635', 'cate_id_1', '商品一级分类', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '83', '0', '1', '1397524477', '1397524433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('636', 'cate_id_2', '商品二级分类', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '83', '0', '1', '1397524466', '1397524466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('637', 'market_price', '市场价', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '1', '', '83', '0', '1', '1397525480', '1397525480', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('638', 'discount_price', '打折价', 'int(10) UNSIGNED NOT NULL', 'num', '0', '为空时只显示市场价', '1', '', '83', '0', '1', '1397525579', '1397525579', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('639', 'view_count', '浏览数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '83', '0', '1', '1397525660', '1397525660', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('640', 'name', '分类标识', 'varchar(255) NOT NULL', 'string', '', '只能使用英文', '0', '', '84', '0', '1', '1398510681', '1397529355', '', '3', '只能输入由数字、26个英文字母或者下划线组成的标识名', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('641', 'title', '分类标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '84', '1', '1', '1397529407', '1397529407', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('642', 'icon', '分类图标', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '84', '0', '1', '1397529461', '1397529461', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('643', 'pid', '上一级分类', 'int(10) UNSIGNED NOT NULL', 'select', '0', '如果你要增加一级分类，这里选择“无”即可', '1', '0:无', '84', '0', '1', '1398266132', '1397529555', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('644', 'path', '分类路径', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '84', '0', '1', '1397529604', '1397529604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('645', 'module', '分类所属功能', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '84', '0', '1', '1397529671', '1397529671', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('646', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '数值越小越靠前', '1', '', '84', '0', '1', '1397529705', '1397529705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('647', 'is_show', '是否显示', 'tinyint(2) NOT NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '84', '0', '1', '1397532496', '1397529809', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('648', 'url', '关联URL', 'varchar(255)   NULL', 'string', '', '', '1', '', '85', '0', '1', '1394519090', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('649', 'keyword', '关联关键词', 'varchar(100) NULL', 'string', '', '关联关键词和关联URL选填一项', '1', '', '85', '0', '1', '1394519232', '1394519054', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('650', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '85', '1', '1', '1394519941', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('651', 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '85', '0', '1', '1394519296', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('652', 'sort', '排序号', 'tinyint(4)  NULL', 'num', '0', '数值越小越靠前', '1', '', '85', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('653', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '85', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('654', 'module', '模块名', 'varchar(255) NOT NULL', 'string', 'Diy', '页面所属的模块', '0', '', '82', '0', '1', '1398350642', '1398350642', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('655', 'intro', '分类描述', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '84', '0', '1', '1398414247', '1398414247', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('656', 'url', '关联URL', 'varchar(255)   NULL', 'string', '', '可用{site_url}代表当前网站根地址', '1', '', '86', '0', '1', '1399083504', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('657', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '86', '0', '1', '1394519941', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('658', 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '86', '0', '1', '1394519296', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('659', 'sort', '排序号', 'tinyint(4)  NULL', 'num', '0', '数值越小越靠前', '1', '', '86', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('660', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '86', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('661', 'icon', '图标', 'int(10) UNSIGNED NULL', 'picture', '', '根据选择的底部模板决定是否需要上传图标', '1', '', '86', '0', '1', '1396506297', '1396506297', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('662', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '84', '0', '1', '1398593086', '1398523502', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('665', 'title', '积分描述', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '87', '1', '1', '1398563786', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('666', 'name', '积分标识', 'varchar(50) NULL', 'string', '', '', '0', '', '87', '0', '1', '1398563853', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('667', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '87', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('668', 'experience', '经验值', 'int(10) NOT NULL', 'num', '0', '可以是正数，也可以是负数，如 -10 表示减10个经验值', '1', '', '87', '0', '1', '1398564024', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('669', 'score', '财富值', 'int(10) NOT NULL', 'num', '0', '可以是正数，也可以是负数，如 -10 表示减10个财富值', '1', '', '87', '0', '1', '1398564097', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('671', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '0', '', '0', '', '87', '0', '1', '1398564146', '1396602859', '', '3', '', 'regex', '', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('672', 'uid', '用户ID', 'int(10) NOT NULL', 'num', '0', '', '1', '', '88', '0', '1', '1398564351', '1398564351', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('673', 'credit_name', '积分标识', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '88', '0', '1', '1398564405', '1398564405', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('674', 'experience', '经验值', 'int(10) NOT NULL', 'num', '0', '', '1', '', '88', '0', '1', '1398564448', '1398564448', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('675', 'score', '财富值', 'int(10) NOT NULL', 'num', '0', '', '1', '', '88', '0', '1', '1398564486', '1398564486', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('676', 'cTime', '记录时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '88', '0', '1', '1398564567', '1398564567', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('677', 'admin_uid', '操作者UID', 'int(10) NOT NULL', 'num', '0', '', '0', '', '88', '0', '1', '1398564629', '1398564629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('678', 'img_1', '商品图片1', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '83', '0', '1', '1398598870', '1398598870', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('679', 'img_2', '商品图片2', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '83', '0', '1', '1398598904', '1398598904', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('680', 'img_3', '商品图片3', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '83', '0', '1', '1398598938', '1398598938', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('681', 'img_4', '商品图片4', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '83', '0', '1', '1398598960', '1398598960', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('682', 'img_5', '商品图片5', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '83', '0', '1', '1398598981', '1398598981', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('683', 'cate_id', '商品分类', 'char(50) NOT NULL', 'cascade', '', '', '1', 'type=db&table=common_category&module=shop_category', '83', '0', '1', '1398693036', '1398599395', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('684', 'token', '公众号', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '89', '0', '1', '1398845862', '1398845862', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('685', 'openid', 'OpenId', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '89', '0', '1', '1398845911', '1398845911', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('686', 'nickname', '昵称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '89', '0', '1', '1398845957', '1398845957', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('687', 'sex', '性别', 'tinyint(1) unsigned NOT NULL ', 'select', '0', '', '1', '0:保密 \r\n1:男性\r\n2:女性', '89', '0', '1', '1398846138', '1398846138', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('688', 'city', '城市', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '89', '0', '1', '1398846223', '1398846223', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('689', 'province', '省份', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '89', '0', '1', '1398846249', '1398846249', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('690', 'country', '国家', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '89', '0', '1', '1398846270', '1398846270', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('691', 'language', '语言', 'varchar(50) NOT NULL', 'string', 'zh_CN', '', '1', '', '89', '0', '1', '1398846305', '1398846305', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('692', 'headimgurl', '头像', 'varchar(255) NOT NULL', 'picture', '', '', '1', '', '89', '0', '1', '1398846357', '1398846357', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('693', 'subscribe_time', '关注时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '89', '0', '1', '1398846406', '1398846406', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('694', 'mobile', '手机号', 'varchar(30) NOT NULL', 'string', '', '', '1', '', '89', '0', '1', '1398848001', '1398848001', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('695', 'status', '用户状态', 'tinyint(1) NULL', 'select', '1', '', '0', '0:未关注\r\n1:已关注\r\n2:已绑定\r\n3:会员卡成员', '89', '0', '1', '1398924711', '1398924711', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('696', 'uid', '管理员UID', 'int(10) NULL', 'num', '', '可以在用户>用户信息页面的列表第一找到管理员的UID', '1', '', '90', '1', '1', '1398944756', '1398933236', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('697', 'mp_id', '公众号ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '90', '1', '1', '1398933300', '1398933300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('698', 'is_creator', '是否为创建者', 'tinyint(2) NOT NULL', 'bool', '0', '', '0', '0:不是\r\n1:是', '90', '0', '1', '1398933380', '1398933380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('699', 'addon_status', '插件权限', 'text NOT NULL', 'checkbox', '', '', '1', '', '90', '0', '1', '1398933475', '1398933475', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('700', 'is_use', '是否为当前管理的公众号', 'tinyint(2) NOT NULL', 'bool', '0', '', '0', '0:不是\r\n1:是', '90', '0', '1', '1398996982', '1398996975', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('701', 'bug_count', '成交量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '83', '0', '1', '1399002900', '1399002900', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('702', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '91', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('704', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '91', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('705', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '91', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('707', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '91', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('709', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '91', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('710', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '91', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('711', 'start_time', '开始时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '91', '0', '1', '1399259416', '1399259416', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('712', 'end_time', '结束时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '91', '0', '1', '1399259433', '1399259433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('713', 'use_tips', '使用说明', 'varchar(255) NOT NULL', 'textarea', '', '用户获取优惠券后显示的提示信息', '1', '', '91', '1', '1', '1399274330', '1399259489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('714', 'end_tips', '过期说明', 'text NOT NULL', 'textarea', '', '活动过期或者结束说明', '1', '', '91', '0', '1', '1399259570', '1399259570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('717', 'num', '优惠券数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '0表示不限制数量', '1', '', '91', '0', '1', '1399259838', '1399259808', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('719', 'max_num', '每人最多允许获取次数', 'int(10) UNSIGNED NOT NULL', 'num', '1', '0表示不限制数量', '1', '', '91', '0', '1', '1400992221', '1399260079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('720', 'follower_condtion', '粉丝状态', 'char(50) NOT NULL', 'select', '1', '粉丝达到设置的状态才能获取', '1', '0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员', '91', '0', '1', '1399260479', '1399260479', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('721', 'credit_conditon', '积分限制', 'int(10) UNSIGNED NOT NULL', 'num', '0', '粉丝达到多少积分后才能领取，领取后不扣积分', '1', '', '91', '0', '1', '1399260618', '1399260618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('722', 'credit_bug', '积分消费', 'int(10) UNSIGNED NOT NULL', 'num', '0', '用积分中的财富兑换、兑换后扣除相应的积分财富', '1', '', '91', '0', '1', '1399260764', '1399260764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('723', 'addon_condition', '插件场景限制', 'varchar(255) NOT NULL', 'string', '', '格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示', '1', '', '91', '0', '1', '1399274022', '1399261026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('724', 'collect_count', '已领取数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '91', '0', '1', '1400992246', '1399270900', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('725', 'view_count', '浏览人数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '91', '0', '1', '1399270926', '1399270926', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('726', 'sn', 'SN码', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '92', '0', '1', '1399272236', '1399272228', '', '3', '', 'regex', 'uniqid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('727', 'uid', '粉丝UID', 'int(10) NOT NULL', 'num', '', '', '0', '', '92', '0', '1', '1399772738', '1399272401', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('728', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '92', '0', '1', '1399272456', '1399272456', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('729', 'is_use', '是否已使用', 'tinyint(2) NOT NULL', 'bool', '0', '', '0', '0:未使用\r\n1:已使用', '92', '0', '1', '1400601159', '1399272514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('730', 'use_time', '使用时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '92', '0', '1', '1399272560', '1399272537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('731', 'addon', '来自的插件', 'varchar(255) NOT NULL', 'string', 'Coupon', '', '4', '', '92', '0', '1', '1399272651', '1399272651', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('732', 'target_id', '来源ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '4', '', '92', '0', '1', '1399272705', '1399272705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('733', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '93', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('734', 'use_tips', '使用说明', 'varchar(255) NOT NULL', 'textarea', '', '用户获取刮刮卡后显示的提示信息', '1', '', '93', '1', '1', '1399274330', '1399259489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('735', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '93', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('736', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '93', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('737', 'end_time', '结束时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '93', '0', '1', '1399259433', '1399259433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('738', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '可为空', '1', '', '93', '0', '1', '1399710705', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('739', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '93', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('740', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '93', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('741', 'start_time', '开始时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '93', '0', '1', '1399259416', '1399259416', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('742', 'end_tips', '过期说明', 'text NOT NULL', 'textarea', '', '活动过期或者结束说明', '1', '', '93', '0', '1', '1399259570', '1399259570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('746', 'predict_num', '预计参与人数', 'int(10) UNSIGNED NOT NULL', 'num', '', '预计人数直接影响抽奖概率：中奖概率 = 奖品总数/(预估活动人数*每人抽奖次数) 要确保100%中奖可设置为1', '1', '', '93', '1', '1', '1399710446', '1399259992', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('747', 'max_num', '每人最多允许抽奖次数', 'int(10) UNSIGNED NOT NULL', 'num', '1', '0表示不限制数量', '1', '', '93', '0', '1', '1399260079', '1399260079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('748', 'follower_condtion', '粉丝状态', 'char(50) NOT NULL', 'select', '1', '粉丝达到设置的状态才能获取', '1', '0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员', '93', '0', '1', '1399260479', '1399260479', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('749', 'credit_conditon', '积分限制', 'int(10) UNSIGNED NOT NULL', 'num', '0', '粉丝达到多少积分后才能领取，领取后不扣积分', '1', '', '93', '0', '1', '1399260618', '1399260618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('750', 'credit_bug', '积分消费', 'int(10) UNSIGNED NOT NULL', 'num', '0', '用积分中的财富兑换、兑换后扣除相应的积分财富', '1', '', '93', '0', '1', '1399260764', '1399260764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('751', 'addon_condition', '插件场景限制', 'varchar(255) NOT NULL', 'string', '', '格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示', '1', '', '93', '0', '1', '1399274022', '1399261026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('752', 'collect_count', '已领取人数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '93', '0', '1', '1399270900', '1399270900', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('753', 'view_count', '浏览人数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '0', '', '93', '0', '1', '1399270926', '1399270926', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('754', 'addon', '来源插件', 'varchar(255) NOT NULL', 'string', 'Scratch', '', '0', '', '94', '0', '1', '1399348676', '1399348676', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('755', 'target_id', '来源ID', 'int(10) UNSIGNED NOT NULL', '', '', '', '4', '', '94', '0', '1', '1399557884', '1399348699', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('756', 'title', '奖项标题', 'varchar(255) NOT NULL', 'string', '', '如特等奖、一等奖。。。', '1', '', '94', '0', '1', '1399557606', '1399348734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('757', 'name', '奖项', 'varchar(255) NOT NULL', 'string', '', '如iphone、吹风机等', '1', '', '94', '0', '1', '1399557624', '1399348785', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('758', 'num', '名额数量', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '94', '0', '1', '1399557753', '1399348843', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('759', 'update_time', '更新时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '93', '0', '1', '1399562468', '1399359204', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('760', 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '值越小越靠前', '1', '', '94', '0', '1', '1399557716', '1399557716', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('761', 'img', '奖品图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '94', '0', '1', '1399557997', '1399557997', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('762', 'prize_id', '奖项ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '0', '', '92', '0', '1', '1399686317', '1399686317', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('764', 'end_img', '过期提示图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '可为空', '1', '', '93', '0', '1', '1399712676', '1399711987', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('766', 'prize_title', '奖项', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '92', '0', '1', '1399790367', '1399790367', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('767', 'jump_url', '提交后跳转的地址', 'varchar(255) NOT NULL', 'string', '', '要以http://开头的完整地址，为空时不跳转', '1', '', '69', '0', '1', '1399800276', '1399800276', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('768', 'icon', '分类图标', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '95', '0', '1', '1400047745', '1400047745', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('769', 'title', '分类名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '95', '0', '1', '1400047764', '1400047764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('770', 'sort', '排序号', 'int(10) NOT NULL', 'num', '0', '值越小越靠前', '1', '', '95', '0', '1', '1400050453', '1400047786', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('772', 'score', '财富值', 'int(10) NOT NULL', 'num', '0', '', '1', '', '89', '0', '1', '1400054524', '1400054524', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('773', 'experience', '经验值', 'int(10) NOT NULL', 'num', '0', '', '1', '', '89', '0', '1', '1400054551', '1400054551', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('774', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '88', '0', '1', '1400603451', '1400603451', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('775', 'nickname', '用户昵称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '18', '0', '1', '1400687052', '1400687052', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('776', 'mobile', '手机号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '18', '0', '1', '1400687075', '1400687075', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('777', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '18', '0', '1', '1400687900', '1400687900', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('778', 'end_img', '过期提示图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '可为空', '1', '', '91', '0', '1', '1400989793', '1400989793', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('779', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '96', '0', '1', '1401371165', '1401371165', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('780', 'month', '月份', 'int(10) NOT NULL', 'num', '', '', '1', '', '96', '0', '1', '1401371192', '1401371192', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('781', 'day', '日期', 'int(10) NOT NULL', 'num', '', '', '1', '', '96', '0', '1', '1401371209', '1401371209', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('782', 'content', '统计数据', 'text NOT NULL', 'textarea', '', '', '1', '', '96', '0', '1', '1401371292', '1401371292', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('783', 'request_count', '请求数', 'int(10) NOT NULL', 'num', '0', '用户回复的次数', '0', '', '5', '0', '1', '1401938983', '1401938983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('784', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '22', '0', '1', '1402454223', '1402454223', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('785', 'jump_url', '外链', 'varchar(255) NOT NULL', 'string', '', '如需跳转填写网址(记住必须有http://)如果填写了图文详细内容，这里请留空，不要设置！', '1', '', '64', '0', '1', '1402482073', '1402482073', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('786', 'name', '分组标识', 'varchar(100) NOT NULL', 'string', '', '英文字母或者下划线，长度不超过30', '1', '', '97', '1', '1', '1403624543', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('787', 'title', '分组标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '97', '1', '1', '1403624556', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('788', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '97', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('789', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '97', '1', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('790', 'level', '最多级数', 'tinyint(1) unsigned NOT NULL', 'select', '3', '', '1', '1:1级\r\n2:2级\r\n3:3级\r\n4:4级\r\n5:5级\r\n6:6级\r\n7:7级', '97', '0', '1', '1404193097', '1404192897', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('791', 'code', '分类扩展编号', 'varchar(255) NOT NULL', 'string', '', '原分类或者导入分类的扩展编号', '0', '', '84', '0', '1', '1404182741', '1404182630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('792', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '94', '0', '1', '1404525428', '1404525428', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('793', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '92', '0', '1', '1404525481', '1404525481', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('794', 'desc', '属性描述', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '144', '0', '1', '1404553449', '1404553449', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('795', 'gid', '商品ID', 'int(10) NOT NULL', 'num', '', '', '1', '', '144', '1', '1', '1404554604', '1404479762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('796', 'aid', '属性ID', 'int(10) NOT NULL', 'num', '', '', '1', '', '144', '1', '1', '1404554591', '1404480194', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('797', 'value', '属性值', 'text NOT NULL', 'textarea', '', '', '1', '', '144', '1', '1', '1404480499', '1404480431', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('798', 'price', '价格', 'varchar(255) NOT NULL', 'string', '0.00', '属性价格', '1', '', '144', '0', '1', '1404489192', '1404489192', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('799', 'icon', '图片', 'varchar(255) NOT NULL', 'string', '', '图片路径', '1', '', '144', '0', '1', '1404489216', '1404489216', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('800', 'name', '属性名称', 'varchar(30) NOT NULL', 'string', '', '', '1', '', '145', '1', '1', '1404447870', '1404447797', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('801', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '145', '1', '1', '1404725643', '1404725643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('802', 'desc', '详细描述', 'text NOT NULL', 'textarea', '', '', '1', '', '145', '1', '1', '1404448091', '1404448091', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('803', 'owner_id', '管理员ID', 'int(10) NOT NULL', 'num', '', '', '4', '', '145', '0', '1', '1409823798', '1404479762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('804', 'address', '联系地址', 'varchar(555) NOT NULL', 'string', '', '', '1', '', '146', '0', '1', '1401694266', '1401694266', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('805', 'truename', '用户名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '146', '0', '1', '1401694187', '1401694187', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('806', 'tel', '联系电话', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '146', '0', '1', '1401694239', '1401694239', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('807', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '146', '0', '1', '1401694162', '1401694162', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('808', 'openid', '微信id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '146', '0', '1', '1401694285', '1401694285', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('809', 'isdefault', '是否默认', 'tinyint(2) NOT NULL', 'bool', '0', '是否默认常用的地址', '0', '0:不是\r\n1:是', '146', '0', '1', '1401694451', '1401694451', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('810', 'set_id', '商城id', 'int(10) NOT NULL', 'num', '', '', '0', '', '146', '0', '1', '1401695024', '1401695024', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('811', 'setid', '商城id', 'int(10) NOT NULL', 'num', '', '', '0', '', '147', '0', '1', '1401617668', '1401617668', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('812', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '147', '0', '1', '1401610661', '1401610661', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('813', 'openid', '用户id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '147', '0', '1', '1401610734', '1401610734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('814', 'cpid', '商品id', 'int(10) NOT NULL', 'num', '', '关联的商品id', '0', '', '147', '0', '1', '1401610839', '1401610839', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('815', 'ismain', '是否为主要', 'tinyint(2) NOT NULL', 'bool', '0', '设置为主要后,可以出现在商品页面推荐', '0', '0:不是\r\n1:是', '148', '0', '1', '1401686835', '1401686207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('816', 'name', '优惠分类名称', 'varchar(255) NOT NULL', 'string', '', '如特价，推荐，限时优惠，特供', '1', '', '148', '0', '1', '1401539832', '1401119661', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('817', 'state', '状态', 'tinyint(2) NOT NULL', 'bool', '0', '停用后将不会显示在优惠分类栏目中', '1', '0:启用\r\n1:停用', '148', '0', '1', '1401119857', '1401119857', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('818', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '148', '0', '1', '1401205296', '1401205296', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('819', 'dishesdatas', '商品id和优惠价格序列化数据', 'text NOT NULL', 'textarea', '', '', '0', '', '148', '0', '1', '1401539979', '1401119705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('820', 'paixu', '排序', 'int(10) NOT NULL', 'num', '0', '数字越大排序越靠前，默认按添加时间排序', '1', '', '148', '0', '1', '1401539873', '1401120018', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('821', 'setid', '商城id', 'int(10) NOT NULL', 'num', '', '关联的商城id', '0', '', '148', '0', '1', '1401540169', '1401539914', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('822', 'tablemanage_id', '关联的属性编号', 'int(10) NOT NULL', 'num', '', '', '0', '', '149', '0', '1', '1401116922', '1401116922', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('823', 'endtime', '过期时间', 'varchar(255) NOT NULL', 'string', '', '订单未支付过期时间', '0', '', '149', '0', '1', '1401699274', '1401116798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('824', 'zftype', '支付方式', 'char(50) NOT NULL', 'select', '0', '', '0', '0:支付宝\r\n1:微信支付\r\n2:网银\r\n3:拉卡拉\r\n4:线下支付', '149', '0', '1', '1401636926', '1401116261', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('825', 'price', '订单原总价', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '149', '0', '1', '1404723179', '1401115968', '/^(d*.d{0,2}|d+).*$/', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('826', 'yhprice', '优惠后的总价', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '149', '0', '1', '1401116031', '1401116031', '/^(d*.d{0,2}|d+).*$/', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('827', 'openid', '关联的微信用户id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '149', '0', '1', '1401115609', '1401115609', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('828', 'dishes_count_datas', '商品序列化数据', 'text NOT NULL', 'textarea', '', '', '0', '', '149', '0', '1', '1404723259', '1401115713', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('829', 'set_id', '关联的商店id', 'int(10) NOT NULL', 'num', '', '', '0', '', '149', '0', '1', '1404723292', '1401115308', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('830', 'statekz', '状态扩展', 'char(50) NOT NULL', 'select', '0', '', '3', '0:未支付\r\n1:已支付\r\n2:(未支付)申请取消订单\r\n3:(已支付)申请取消订单\r\n4:(已支付)退款中\r\n5:(已支付)拒绝申请取消订单\r\n6:已取消', '149', '0', '1', '1402220841', '1401116657', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('831', 'dcnum', '自取单号', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '149', '0', '1', '1401116387', '1401116387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('832', 'state', '状态', 'char(50) NOT NULL', 'select', '0', '确认后的订单取消需要进入审核处理', '3', '0:未确认\r\n1:已确认', '149', '0', '1', '1402218290', '1401116514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('833', 'diningtypes', '订单类型', 'char(50) NOT NULL', 'select', '0', '', '0', '0:自取\r\n1:快递', '149', '0', '1', '1404723389', '1401117110', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('834', 'beizhu', '备注', 'text NOT NULL', 'textarea', '', '', '1', '', '149', '0', '1', '1401612088', '1401612088', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('835', 'cpcount', '商品总数量', 'int(10) NOT NULL', 'num', '0', '', '0', '', '149', '0', '1', '1401611560', '1401611560', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('836', 'ctime', '创建时间', 'varchar(255) NOT NULL', 'string', '', '订单创建时间', '0', '', '149', '0', '1', '1402216495', '1401609275', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('837', 'jctime', '自取/快递时间', 'varchar(255) NOT NULL', 'string', '', '取货时间', '1', '', '149', '0', '1', '1404723464', '1401609319', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('838', 'contactid', '联系信息id', 'int(10) NOT NULL', 'num', '', 'ml_mall_users.id', '0', '', '149', '0', '1', '1404723147', '1401609458', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('839', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '149', '0', '1', '1401610691', '1401610691', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('840', 'plcontent', '评论内容', 'text NOT NULL', 'editor', '', '', '1', '', '150', '0', '1', '1401117765', '1401117765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('841', 'pltime', '评论时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '150', '0', '1', '1401117727', '1401117727', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('842', 'hftime', '回复时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '150', '0', '1', '1401117866', '1401117866', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('843', 'hfcontent', '回复内容', 'text NOT NULL', 'editor', '', '', '1', '', '150', '0', '1', '1401117839', '1401117839', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('844', 'type', '评论类型', 'int(10) NOT NULL', 'num', '0', '评论类型0商品,1属性', '0', '', '150', '0', '1', '1401115001', '1401115001', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('845', 'openid', '关联的用户id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '150', '0', '1', '1401114232', '1401114232', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('846', 'set_id', '关联的商城id', 'int(10) NOT NULL', 'num', '', '', '0', '', '150', '0', '1', '1401114207', '1401114207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('847', 'dishes_id', '关联的商品id或者关联的桌台id', 'int(10) NOT NULL', 'num', '', '', '0', '', '150', '0', '1', '1401114340', '1401114300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('848', 'pingji', '商品评级', 'int(10) NOT NULL', 'num', '3', '商品的星级程度从1-5星', '0', '', '150', '0', '1', '1401114619', '1401114619', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('849', 'paixu', '排序', 'int(10) NOT NULL', 'num', '0', '数字越大,排序越靠前', '1', '', '151', '0', '1', '1401471365', '1401471365', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('850', 'pic', '分类图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '151', '0', '1', '1403941661', '1401113921', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('851', 'name', '分类名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '151', '1', '1', '1403941647', '1401113870', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('852', 'state', '状态', 'tinyint(2) NOT NULL', 'bool', '0', '停用后将不会显示在菜系栏目', '1', '0:启用\r\n1:停用', '151', '0', '1', '1401114031', '1401114031', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('853', 'setid', '关联的商城id', 'int(10) NOT NULL', 'num', '', '', '0', '', '151', '0', '1', '1401433017', '1401433017', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('854', 'dishesdatas', '商品集合', 'text NOT NULL', 'textarea', '', '关联的商品id集合序列化', '0', '', '151', '0', '1', '1401432947', '1401432947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('855', 'introduction', '简介', 'text NOT NULL', 'editor', '', '', '1', '', '151', '0', '1', '1401113979', '1401113979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('856', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '151', '0', '1', '1401204630', '1401204630', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('857', 'owner_id', '管理员ID', 'int(10) NOT NULL', 'num', '', '', '4', '', '151', '0', '1', '1409823878', '1404479762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('858', 'yycount', '预约人数', 'int(10) NOT NULL', 'num', '', '', '1', '', '152', '0', '1', '1401119030', '1401119030', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('859', 'sex', '预约人性别', 'int(10) NOT NULL', 'num', '0', '0未知,1男,2女', '1', '', '152', '0', '1', '1401117511', '1401117511', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('860', 'usermobile', '预约人电话', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '152', '0', '1', '1401117326', '1401117326', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('861', 'username', '预约人姓名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '152', '0', '1', '1401117300', '1401117300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('862', 'openid', '关联微信用户id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '152', '0', '1', '1401117271', '1401117271', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('863', 'tablemanage_id', '桌台编号', 'int(10) NOT NULL', 'num', '', '', '0', '', '152', '0', '1', '1401113324', '1401113324', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('864', 'set_id', '关联的商城编号', 'int(10) NOT NULL', 'num', '', '', '0', '', '152', '0', '1', '1401206543', '1401206543', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('865', 'fenz', '每分', 'varchar(255) NOT NULL', 'string', '*', '设置哪一分钟执行本任务，多个值之间用半角逗号 \",\" 隔开，*”为不限制', '1', '', '153', '0', '1', '1401207395', '1401207395', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('866', 'xiaos', '每时', 'varchar(255) NOT NULL', 'string', '*', '设置哪一小时执行本任务，“*”为不限制', '1', '', '153', '0', '1', '1401207176', '1401207176', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('867', 'yue', '每月', 'varchar(255) NOT NULL', 'string', '*', '设置哪一月执行本任务，“*”为不限制', '1', '', '153', '0', '1', '1401207146', '1401207010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('868', 'day', '每日', 'varchar(255) NOT NULL', 'string', '*', '设置哪一日执行本任务，“*”为不限制', '1', '', '153', '0', '1', '1401207130', '1401207130', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('869', 'zhou', '每周', 'varchar(255) NOT NULL', 'string', '*', '设置星期几执行本任务，“*”为不限制，本设置会覆盖下面的“日”设定', '1', '', '153', '0', '1', '1401206983', '1401206983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('870', 'starttime_endtime', '开始和结束时间的序列化数据', 'text NOT NULL', 'textarea', '', '开始和结束时间的序列化数据', '0', '', '153', '0', '1', '1401112431', '1401112431', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('871', 'state', '状态', 'tinyint(2) NOT NULL', 'bool', '0', '停用后，计划任务将不会执行', '1', '0:启用\r\n1:停用', '153', '0', '1', '1401112617', '1401112617', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('872', 'upruntime', '上次执行时间', 'int(10) NOT NULL', 'datetime', '', '上次任务执行的时间', '0', '', '153', '0', '1', '1401112687', '1401112687', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('873', 'downruntime', '下次任务执行时间', 'int(10) NOT NULL', 'datetime', '', '下次任务执行的时间', '0', '', '153', '0', '1', '1401112735', '1401112735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('874', 'title', '任务名称', 'text NOT NULL', 'textarea', '', '', '1', '', '153', '1', '1', '1401112503', '1401112503', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('875', 'type', '任务类型', 'int(10) NOT NULL', 'num', '0', '0:一次型,1:周期性,2:自定义时间', '1', '', '153', '0', '1', '1401206909', '1401206909', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('876', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '153', '0', '1', '1401205393', '1401205393', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('877', 'paixu', '排序', 'int(10) NOT NULL', 'num', '0', '数字越大排序越靠前，默认按添加时间排序', '1', '', '154', '0', '1', '1401541928', '1401120081', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('878', 'state', '状态', 'tinyint(2) NOT NULL', 'bool', '0', '商品下架后不会出现在菜单中', '1', '0:上架\r\n1:下架', '154', '0', '1', '1401203673', '1401203673', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('879', 'review_count', '评论数量', 'int(10) NOT NULL', 'num', '0', '', '0', '', '154', '0', '1', '1401111125', '1401111125', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('880', 'coverpic', '商品广告图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '商品广告图', '1', '', '154', '0', '1', '1407894973', '1407892418', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('881', 'icon', ' 商品封面 ', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '154', '0', '1', '1401202313', '1401202313', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('882', 'dishes_num', '商品编号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '154', '1', '1', '1401110538', '1401110538', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('883', 'price', '价格', 'varchar(255) NOT NULL', 'string', '', '商品的原价', '1', '', '154', '1', '1', '1401110913', '1401110899', '/^(d*.d{0,2}|d+).*$/', '3', '请输入正确的商品价格', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('884', 'introduction', '商品简介', 'text NOT NULL', 'editor', '', '', '1', '', '154', '0', '1', '1401110665', '1401110665', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('885', 'name', '商品名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '154', '1', '1', '1401110494', '1401110485', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('886', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '154', '0', '1', '1401201073', '1401201073', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('887', 'youhuiid', '优惠id', 'int(10) NOT NULL', 'num', '0', '表示该商品属于那个优惠id', '0', '', '154', '0', '1', '1401693201', '1401688829', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('888', 'attr', '关联属性', 'text NOT NULL', 'string', '', '填写需要的属性', '1', '', '154', '0', '1', '1404643754', '1403929868', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('889', 'featured', '特色推荐', 'char(10) NOT NULL', 'radio', '0', '特色推荐', '1', '0:否\r\n1:是', '154', '0', '1', '1403952052', '1403952052', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('890', 'typeid', '商品分类ID', 'int(10) NOT NULL', 'num', '', '', '1', '', '154', '1', '1', '1404554604', '1404479762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('891', 'owner_id', '管理员ID', 'int(10) NOT NULL', 'num', '', '', '4', '', '154', '0', '1', '1409823843', '1404479762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('892', 'token', ' Token ', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '155', '0', '1', '1401108700', '1401103980', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('893', 'keyword', ' 关键词 ', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '155', '1', '1', '1401108295', '1401108295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('894', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '155', '1', '1', '1401108377', '1401108377', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('895', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '155', '1', '1', '1401108330', '1401108330', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('896', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '155', '1', '1', '1401108403', '1401108403', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('897', 'kfname', '客服名称', 'varchar(255) NOT NULL', 'string', '', '用于评论中显示的回复名称', '1', '', '155', '0', '1', '1401118036', '1401118036', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('898', 'TemplateIndex', '模板编号', 'varchar(255) NOT NULL', 'string', 'default', '使用的模板编号', '0', '', '155', '0', '1', '1401195917', '1401195917', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('899', 'owner_id', '管理员ID', 'int(10) NOT NULL', 'num', '', '', '4', '', '155', '0', '1', '1409821048', '1404479762', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('900', 'logo', '品牌logo', 'int(10) UNSIGNED NOT NULL', 'picture', '', '在品牌页面显示的logo', '1', '', '155', '0', '1', '1407854648', '1407854648', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('901', 'settype', '店铺类型', 'varchar(255) NOT NULL', 'select', '', '店铺类型', '1', '0:商务男装\r\n1:女装配饰\r\n2:特色餐饮\r\n3:运动休闲\r\n4:娱乐\r\n5:美妆', '155', '0', '1', '1407735652', '1407732536', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('902', 'order', '排序', 'int(10) NOT NULL', 'num', '', '商店在界面的显示顺序，数字越大越靠前', '1', '', '155', '0', '1', '1407724183', '1407724183', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('903', 'website', '网址', 'varchar(255) NOT NULL', 'string', '', '本站内店铺地址自动生成，非本站内店铺填写完整url', '1', '', '155', '0', '1', '1407718105', '1407718105', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('904', 'address', '地址', 'varchar(255) NOT NULL', 'string', '', '店铺地址', '1', '', '155', '0', '1', '1407717989', '1407717989', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('905', 'phone', '电话', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '155', '0', '1', '1407717944', '1407717944', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('906', 'status', '状态', 'char(50) NOT NULL', 'select', '', '设置商店是否在前台显示', '1', '1:显示\r\n2:首页推荐\r\n0:不显示\r\n', '155', '0', '1', '1407724099', '1407717694', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('907', 'content', '商店介绍', 'text NOT NULL', 'editor', '', '', '1', '', '155', '0', '1', '1407712315', '1407712315', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('942', 'name', '客服昵称', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '104', '0', '1', '1403959775', '1403947255', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('943', 'token', 'token', 'varchar(60) NOT NULL ', 'string', '', '', '0', '', '104', '0', '1', '1403959638', '1403947256', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('944', 'userName', '客服帐号', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '104', '0', '1', '1403959752', '1403947256', '', '3', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('945', 'userPwd', '客服密码', 'varchar(32) NOT NULL ', 'string', '', '', '1', '', '104', '0', '1', '1403959722', '1403947257', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('946', 'endJoinDate', '客服加入时间', 'int(11) NOT NULL ', 'string', '', '', '0', '', '104', '0', '1', '1403959825', '1403947257', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('947', 'status', '客服在线状态', 'tinyint(1) NOT NULL ', 'bool', '0', '', '0', '0:离线\r\n1:在线', '104', '0', '1', '1404016782', '1403947258', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('948', 'pid', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '105', '0', '1', '1403947272', '1403947272', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('949', 'openid', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '105', '0', '1', '1403947273', '1403947273', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('950', 'enddate', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '105', '0', '1', '1403947273', '1403947273', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('951', 'keyword', '', 'varchar(200) NOT NULL ', 'string', '', '', '1', '', '105', '0', '1', '1403947274', '1403947274', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('952', 'status', '', 'tinyint(1) NOT NULL ', 'string', '2', '', '1', '', '105', '0', '1', '1403947274', '1403947274', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('953', 'state', '客服状态', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:停用\r\n1:启用', '104', '0', '1', '1404016877', '1404016877', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('954', 'isdelete', '是否删除', 'tinyint(2) NOT NULL', 'bool', '0', '', '0', '0:正常\r\n1:已被删除', '104', '0', '1', '1404016931', '1404016931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('955', 'openid', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '106', '0', '1', '1404026716', '1404026716', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('956', 'enddate', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '106', '0', '1', '1404026716', '1404026716', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('957', 'joinUpDate', '', 'int(11) NOT NULL ', 'string', '0', '', '1', '', '106', '0', '1', '1404026716', '1404026716', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('958', 'uid', '', 'int(11) NOT NULL ', 'string', '0', '', '1', '', '106', '0', '1', '1404026717', '1404026717', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('959', 'token', '', 'varchar(40) NOT NULL ', 'string', '', '', '1', '', '106', '0', '1', '1404026717', '1404026717', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('960', 'g_id', '', 'varchar(20) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027302', '1404027302', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('961', 'nickname', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027302', '1404027302', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('962', 'sex', '', 'tinyint(1) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027303', '1404027303', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('963', 'province', '', 'varchar(20) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027303', '1404027303', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('964', 'city', '', 'varchar(30) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027303', '1404027303', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('965', 'headimgurl', '', 'varchar(200) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027304', '1404027304', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('966', 'subscribe_time', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027304', '1404027304', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('967', 'token', '', 'varchar(30) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027305', '1404027305', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('968', 'openid', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027305', '1404027305', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('969', 'status', '', 'tinyint(1) NOT NULL ', 'string', '', '', '1', '', '107', '0', '1', '1404027305', '1404027305', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('970', 'fid', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033503', '1404033503', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('971', 'token', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033503', '1404033503', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('972', 'openid', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033503', '1404033503', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('973', 'date', '', 'varchar(11) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033504', '1404033504', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('974', 'enddate', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033504', '1404033504', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('975', 'model', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033504', '1404033504', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('976', 'num', '', 'int(11) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033505', '1404033505', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('977', 'keyword', '', 'varchar(60) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033505', '1404033505', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('978', 'type', '', 'tinyint(1) NOT NULL ', 'string', '', '', '1', '', '108', '0', '1', '1404033505', '1404033505', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('997', 'code', '分类扩展编号', 'varchar(255) NOT NULL', 'string', '', '原分类或者导入分类的扩展编号', '0', '', '84', '0', '1', '1404182741', '1404182630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('998', 'level', '最多级数', 'tinyint(1) unsigned NOT NULL', 'select', '3', '', '1', '1:1级\r\n2:2级\r\n3:3级\r\n4:4级\r\n5:5级\r\n6:6级\r\n7:7级', '97', '0', '1', '1404193097', '1404192897', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1012', 'tooltype', '工具类型', 'tinyint(2) NOT NULL', 'bool', '0', '', '2', '0:微信消息\r\n1:单独页面', '115', '0', '1', '1404273343', '1404273343', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1013', 'keyword', ' 关键词 ', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '115', '0', '1', '1404273406', '1404273406', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1015', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '115', '0', '1', '1404273542', '1404273542', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1016', 'toolname', '工具名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '115', '0', '1', '1404273609', '1404273609', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1018', 'tooldes', '工具描述', 'text NOT NULL', 'textarea', '', '', '1', '', '115', '0', '1', '1404273652', '1404273652', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1020', 'toolnum', '工具唯一编号', 'varchar(255) NOT NULL', 'string', '', '', '2', '', '115', '0', '1', '1404274841', '1404273757', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1021', 'toolstate', '工具状态', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:启用\r\n1:停用', '115', '0', '1', '1404273809', '1404273809', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1022', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '115', '0', '1', '1404273958', '1404273958', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1034', 'kfid', '客服编号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '104', '0', '1', '1404398387', '1404398387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1035', 'msgkeyword', '消息关键字', 'varchar(555) NOT NULL', 'string', '', '当用户发送的消息中含有关键字时,将自动转到分配的客服人员', '1', '', '116', '0', '1', '1404399336', '1404399336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1036', 'msgkeyword_type', '关键字类型', 'char(50) NOT NULL', 'select', '3', '选择关键字匹配的类型', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '116', '0', '1', '1404399466', '1404399466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1037', 'msgkfaccount', '接待的客服人员', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '116', '0', '1', '1404403340', '1404399587', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1038', 'cTime', '创建时间', 'int(10) NOT NULL', 'date', '', '', '0', '', '116', '0', '1', '1404399629', '1404399629', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1039', 'token', 'token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '116', '0', '1', '1404399656', '1404399656', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1040', 'msgstate', '关键字状态', 'tinyint(2) NOT NULL', 'bool', '1', '停用后用户将不会触发此关键词', '1', '0:停用\r\n1:启用', '116', '0', '1', '1404399749', '1404399749', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1041', 'zjnum', '转接次数', 'int(10) NOT NULL', 'num', '', '', '0', '', '116', '0', '1', '1404399784', '1404399784', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1042', 'zdtype', '指定类型', 'char(10) NOT NULL', 'radio', '0', '选择关键字匹配时是按指定人员或者指定客服组', '1', '0:指定客服人员\r\n1:指定客服组', '116', '0', '1', '1404474672', '1404474672', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1043', 'kfgroupid', '客服分组id', 'int(10) NOT NULL', 'num', '0', '', '0', '', '116', '0', '1', '1404474777', '1404474777', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1044', 'token', 'token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '117', '0', '1', '1404485505', '1404475530', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1045', 'groupname', '分组名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '117', '0', '1', '1404475556', '1404475556', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1046', 'groupdata', '分组数据源', 'text NOT NULL', 'textarea', '', '', '0', '', '117', '0', '1', '1404476127', '1404476127', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1047', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '94', '0', '1', '1404525428', '1404525428', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1048', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '92', '0', '1', '1404525481', '1404525481', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1081', 'token', 'token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '120', '0', '1', '1406094177', '1406094177', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1082', 'worker', '客服名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '120', '0', '1', '1406094257', '1406094257', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1083', 'openid', 'openid', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '120', '0', '1', '1406094276', '1406094276', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1084', 'opercode', '会话状态', 'int(10) NOT NULL', 'num', '', '', '1', '', '120', '0', '1', '1406094322', '1406094322', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1085', 'time', '时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '120', '0', '1', '1406094341', '1406094341', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1086', 'text', '消息', 'text NOT NULL', 'textarea', '', '', '1', '', '120', '0', '1', '1406094387', '1406094387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1087', 'qr_code', '二维码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '121', '1', '1', '1406127577', '1388815953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1088', 'addon', '二维码所属插件', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '121', '1', '1', '1406127594', '1388816207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1089', 'aim_id', '插件表里的ID值', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '121', '1', '1', '1388816287', '1388816287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1090', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '121', '0', '1', '1388816392', '1388816392', '', '1', '', 'regex', 'time', '1', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1091', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '121', '0', '1', '1391399528', '1391399528', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1093', 'action_name', '二维码类型', 'char(30) NOT NULL', 'select', 'QR_SCENE', 'QR_SCENE为临时,QR_LIMIT_SCENE为永久 ', '1', 'QR_SCENE:临时二维码\r\nQR_LIMIT_SCENE:永久二维码', '121', '0', '1', '1406130162', '1393919686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1094', 'extra_text', '文本扩展', 'text NULL ', 'textarea', '', '', '1', '', '121', '0', '1', '1393919736', '1393919736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1095', 'extra_int', '数字扩展', 'int(10) NULL ', 'num', '', '', '1', '', '121', '0', '1', '1393919798', '1393919798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1096', 'request_count', '请求数', 'int(10) NOT NULL', 'num', '0', '用户回复的次数', '0', '', '121', '0', '1', '1402547625', '1401938983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1097', 'scene_id', '场景ID', 'int(10) NOT NULL', 'num', '0', '', '1', '', '121', '0', '1', '1406127542', '1406127542', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1222', 'attach', '上传文件', 'int(10) unsigned NOT NULL ', 'file', '', '支持xls,xlsx两种格式', '1', '', '143', '1', '1', '1407554177', '1407554177', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1316', 'mTime', '更新时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '89', '0', '1', '1408939657', '1408939657', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1317', 'uid', '用户ID', 'int(10) NULL ', 'num', '0', '', '0', '', '152', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1318', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '152', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1319', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '152', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1320', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '152', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1321', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '152', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1322', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '152', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1323', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '152', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1324', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '152', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1325', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '152', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1326', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '152', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1327', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '152', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1328', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '152', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1329', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '152', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1330', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '152', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1331', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '152', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1332', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '152', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1333', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '152', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1334', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '152', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1335', 'level', '优先级', 'int(10) NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '152', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1336', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '152', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1337', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '152', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1338', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '152', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `uctoo_attribute` VALUES ('1339', 'logistics', '物流信息', 'text NOT NULL', 'textarea', '', '', '1', '', '155', '0', '1', '1410254321', '1410254321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `uctoo_attribute` VALUES ('1340', 'thumbnail','属性缩略图','varchar(255) NOT NULL','string','','属性缩略图','1','','0','0','1','1404489216','1404489216','','3','','regex','','3','function');

-- ----------------------------
-- Table structure for uctoo_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_auth_extend`;
CREATE TABLE `uctoo_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of uctoo_auth_extend
-- ----------------------------
INSERT INTO `uctoo_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `uctoo_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for uctoo_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_auth_group`;
CREATE TABLE `uctoo_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_auth_group
-- ----------------------------
INSERT INTO `uctoo_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `uctoo_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for uctoo_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_auth_group_access`;
CREATE TABLE `uctoo_auth_group_access` (
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_auth_rule`;
CREATE TABLE `uctoo_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`module`,`name`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_auth_rule
-- ----------------------------
INSERT INTO `uctoo_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('6', 'admin', '1', 'Admin/Index/index', '首页', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('217', 'admin', '1', 'admin/addons/weixin', '微信插件', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('218', 'admin', '2', 'Admin/Addons/weixin', '插件管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('219', 'admin', '1', 'admin/PublicGroup/PublicGroup', '公众号等级', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('220', 'admin', '1', 'admin/PublicGroup/PublicAdmin', '公众号管理', '1', '');
INSERT INTO `uctoo_auth_rule` VALUES ('221', 'admin', '1', 'admin/update/index', '在线升级', '1', '');

-- ----------------------------
-- Table structure for uctoo_card_member
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_card_member`;
CREATE TABLE `uctoo_card_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户UID',
  `username` varchar(100) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `number` varchar(50) DEFAULT NULL COMMENT '卡号',
  `cTime` int(10) DEFAULT NULL COMMENT '加入时间',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_card_notice
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_card_notice`;
CREATE TABLE `uctoo_card_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '通知内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
-- Table structure for uctoo_category
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_category`;
CREATE TABLE `uctoo_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of uctoo_category
-- ----------------------------
INSERT INTO `uctoo_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');

-- ----------------------------
-- Table structure for uctoo_channel
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_channel`;
CREATE TABLE `uctoo_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_channel
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_common_category
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_common_category`;
CREATE TABLE `uctoo_common_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '分类标识',
  `title` varchar(255) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned NOT NULL COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一级分类',
  `path` varchar(255) NOT NULL COMMENT '分类路径',
  `module` varchar(255) NOT NULL COMMENT '分类所属功能',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `is_show` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `intro` varchar(255) NOT NULL COMMENT '分类描述',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `code` varchar(255) NOT NULL COMMENT '分类扩展编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_common_category
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_common_category_group
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_common_category_group`;
CREATE TABLE `uctoo_common_category_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '分组标识',
  `title` varchar(255) NOT NULL COMMENT '分组标题',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '最多级数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_common_category_group
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_config
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_config`;
CREATE TABLE `uctoo_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_config
-- ----------------------------
INSERT INTO `uctoo_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'UCToo微信开发框架', '0');
INSERT INTO `uctoo_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'UCToo微信开发框架', '1');
INSERT INTO `uctoo_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'UCToo,ThinkPHP,OneThink', '8');
INSERT INTO `uctoo_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭\r\n1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `uctoo_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `uctoo_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“粤ICP备10000000号', '1378900335', '1379235859', '1', '粤ICP备10000000号', '9');
INSERT INTO `uctoo_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `uctoo_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `uctoo_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `uctoo_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n3:用户\r\n4:系统\r\n5:站点', '4');
INSERT INTO `uctoo_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `uctoo_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `uctoo_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `uctoo_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `uctoo_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '4', '', '后台数据每页显示记录数', '1379503896', '1391938052', '1', '20', '10');
INSERT INTO `uctoo_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `uctoo_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `uctoo_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `uctoo_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `uctoo_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `uctoo_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `uctoo_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `uctoo_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname', '0');
INSERT INTO `uctoo_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `uctoo_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '20', '0');
INSERT INTO `uctoo_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `uctoo_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `uctoo_config` VALUES ('38', 'WEB_SITE_VERIFY', '4', '登录验证码', '1', '0:关闭\r\n1:开启', '登录时是否需要验证码', '1378898976', '1378898976', '1', '1', '2');
INSERT INTO `uctoo_config` VALUES ('42', 'ACCESS', '2', '未登录时可访问的页面', '4', '', '不区分大小写', '1390656601', '1390664079', '1', 'Home/User/*\r\nHome/Index/*\r\nhome/weixin/*\r\nadmin/File/*\r\nhome/File/*\r\nhome/Forum/*', '0');
INSERT INTO `uctoo_config` VALUES ('44', 'DEFAULT_PUBLIC_GROUP_ID', '0', '公众号默认等级ID', '3', '', '前台新增加的公众号的默认等级，值为0表示不做权限控制，公众号拥有全部插件的权限', '1393759885', '1393759981', '1', '0', '1');
INSERT INTO `uctoo_config` VALUES ('45', 'SYSTEM_UPDATE_REMIND', '4', '系统升级提醒', '4', '0:关闭\r\n1:开启', '开启后官方有新升级信息会及时在后台的网站设置页面头部显示升级提醒', '1393764263', '1393764263', '1', '1', '5');
INSERT INTO `uctoo_config` VALUES ('46', 'SYSTEM_UPDATRE_VERSION', '0', '系统升级最新版本号', '4', '', '记录当前系统的版本号，这是与官方比较是否有升级包的唯一标识，不熟悉者只勿改变其数值', '1393764702', '1394337646', '1', '20140611', '0');
INSERT INTO `uctoo_config` VALUES ('47', 'FOLLOW_YOUKE_UID', '0', '粉丝游客ID', '0', '', '', '1398927704', '1398927704', '1', '-3349', '0');
INSERT INTO `uctoo_config` VALUES ('48', 'DEFAULT_PUBLIC', '0', '注册后默认可管理的公众号ID', '3', '', '可为空。配置用户注册后即可管理的公众号ID，多个时用英文逗号分割', '1398928794', '1398929088', '1', '', '0');
INSERT INTO `uctoo_config` VALUES ('49', 'DEFAULT_PUBLIC_CREATE_MAX_NUMB', '0', '默认用户最多可创建的公众号数', '3', '', '注册用户最多的创建数，也可以在用户管理里对每个用户设置不同的值', '1398949652', '1398950115', '1', '5', '0');
INSERT INTO `uctoo_config` VALUES ('50', 'COPYRIGHT', '1', '版权信息', '1', '', '', '1401018910', '1401018910', '1', 'UCToo 版权所有', '3');

-- ----------------------------
-- Table structure for uctoo_coupon
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_coupon`;
CREATE TABLE `uctoo_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `start_time` int(10) NOT NULL COMMENT '开始时间',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  `use_tips` varchar(255) NOT NULL COMMENT '使用说明',
  `end_tips` text NOT NULL COMMENT '过期说明',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券数量',
  `max_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '每人最多允许获取次数',
  `follower_condtion` char(50) NOT NULL DEFAULT '1' COMMENT '粉丝状态',
  `credit_conditon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分限制',
  `credit_bug` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分消费',
  `addon_condition` varchar(255) NOT NULL COMMENT '插件场景限制',
  `collect_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已领取数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `end_img` int(10) unsigned NOT NULL COMMENT '过期提示图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_credit_config
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_credit_config`;
CREATE TABLE `uctoo_credit_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '积分描述',
  `name` varchar(50) DEFAULT NULL COMMENT '积分标识',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `experience` int(10) NOT NULL DEFAULT '0' COMMENT '经验值',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '财富值',
  `token` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_credit_config
-- ----------------------------
INSERT INTO `uctoo_credit_config` VALUES ('1', '关注公众号', 'subscribe', '1398565037', '10', '10', '0');
INSERT INTO `uctoo_credit_config` VALUES ('2', '取消关注公众号', 'unsubscribe', '1398565077', '-10', '-10', '0');
INSERT INTO `uctoo_credit_config` VALUES ('3', '参与投票', 'vote', '1398565597', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('4', '参与调研', 'survey', '1398565640', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('5', '参与考试', 'exam', '1398565659', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('6', '参与测试', 'test', '1398565681', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('7', '微信聊天', 'chat', '1398565740', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('8', '建议意见反馈', 'suggestions', '1398565798', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('9', '会员卡绑定', 'card_bind', '1398565875', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('10', '获取优惠卷', 'coupons', '1398565926', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('11', '访问微网站', 'weisite', '1398565973', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('12', '查看自定义回复内容', 'custom_reply', '1398566068', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('13', '填写通用表单', 'forms', '1398566118', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('14', '访问微商店', 'shop', '1398566206', '0', '0', '0');
INSERT INTO `uctoo_credit_config` VALUES ('15', '参与投票', 'vote', '1398758905', '10', '50', 'gh_a23e6c0ae2e3');
INSERT INTO `uctoo_credit_config` VALUES ('16', '参与调研', 'survey', '1398759248', '1', '2', 'gh_a23e6c0ae2e3');
INSERT INTO `uctoo_credit_config` VALUES ('17', '关注公众号', 'subscribe', '1400145471', '10', '10', '-1');
INSERT INTO `uctoo_credit_config` VALUES ('18', '取消关注公众号', 'unsubscribe', '1399989514', '-10', '-10', '-1');
INSERT INTO `uctoo_credit_config` VALUES ('19', '获取优惠卷', 'coupons', '1400059943', '0', '0', '-1');

-- ----------------------------
-- Table structure for uctoo_credit_data
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_credit_data`;
CREATE TABLE `uctoo_credit_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `credit_name` varchar(50) NOT NULL COMMENT '积分标识',
  `experience` int(10) NOT NULL DEFAULT '0' COMMENT '经验值',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '财富值',
  `cTime` int(10) NOT NULL COMMENT '记录时间',
  `admin_uid` int(10) NOT NULL DEFAULT '0' COMMENT '操作者UID',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=662 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_custom_menu
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_custom_menu`;
CREATE TABLE `uctoo_custom_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关联关键词',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_custom_reply_mult
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_custom_reply_mult`;
CREATE TABLE `uctoo_custom_reply_mult` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `mult_ids` varchar(255) NOT NULL COMMENT '多图文ID',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_custom_reply_news
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_custom_reply_news`;
CREATE TABLE `uctoo_custom_reply_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned DEFAULT '0' COMMENT '所属类别',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `content` text NOT NULL COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `jump_url` varchar(255) NOT NULL COMMENT '外链',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_custom_reply_text
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_custom_reply_text`;
CREATE TABLE `uctoo_custom_reply_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `content` text NOT NULL COMMENT '回复内容',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_diy
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_diy`;
CREATE TABLE `uctoo_diy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `url` varchar(255) NOT NULL COMMENT '访问网址',
  `is_close` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否关闭',
  `need_login` tinyint(2) NOT NULL DEFAULT '0' COMMENT '游客访问',
  `layout` text NOT NULL COMMENT '页面参数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `module` varchar(255) NOT NULL DEFAULT 'Diy' COMMENT '模块名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
-- Table structure for uctoo_document
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_document`;
CREATE TABLE `uctoo_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`type`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of uctoo_document
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_document_article
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_document_article`;
CREATE TABLE `uctoo_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of uctoo_document_article
-- ----------------------------
INSERT INTO `uctoo_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- ----------------------------
-- Table structure for uctoo_document_download
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_document_download`;
CREATE TABLE `uctoo_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of uctoo_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_exam
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_exam`;
CREATE TABLE `uctoo_exam` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `finish_tip` text NOT NULL COMMENT '结束语',
  `start_time` int(10) NOT NULL COMMENT '考试开始时间',
  `end_time` int(10) NOT NULL COMMENT '考试结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_exam_answer
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_exam_answer`;
CREATE TABLE `uctoo_exam_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `answer` text NOT NULL COMMENT '回答内容',
  `openid` varchar(255) NOT NULL COMMENT 'OpenId',
  `uid` int(10) DEFAULT NULL COMMENT '用户UID',
  `question_id` int(10) unsigned NOT NULL COMMENT 'question_id',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `exam_id` int(10) unsigned NOT NULL COMMENT 'exam_id',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '得分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_exam_question
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_exam_question`;
CREATE TABLE `uctoo_exam_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '题目标题',
  `intro` text NOT NULL COMMENT '题目描述',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `is_must` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否必填',
  `extra` text NOT NULL COMMENT '参数',
  `type` char(50) NOT NULL DEFAULT 'radio' COMMENT '题目类型',
  `exam_id` int(10) unsigned NOT NULL COMMENT 'exam_id',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分值',
  `answer` varchar(255) NOT NULL COMMENT '标准答案',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
-- Table structure for uctoo_extensions
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_extensions`;
CREATE TABLE `uctoo_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '关键词类型',
  `api_token` varchar(255) NOT NULL COMMENT 'Token',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `api_url` varchar(255) NOT NULL COMMENT '第三方URL',
  `output_format` tinyint(1) DEFAULT '0' COMMENT '数据输出格式',
  `keyword_filter` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词过滤',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_file
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_file`;
CREATE TABLE `uctoo_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Table structure for uctoo_follow
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_follow`;
CREATE TABLE `uctoo_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT '公众号',
  `openid` varchar(255) NOT NULL COMMENT 'OpenId',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `city` varchar(100) NOT NULL COMMENT '城市',
  `province` varchar(100) NOT NULL COMMENT '省份',
  `country` varchar(100) NOT NULL COMMENT '国家',
  `language` varchar(50) NOT NULL DEFAULT 'zh_CN' COMMENT '语言',
  `headimgurl` varchar(255) NOT NULL COMMENT '头像',
  `subscribe_time` int(10) NOT NULL COMMENT '关注时间',
  `mobile` varchar(30) NOT NULL COMMENT '手机号',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '财富值',
  `experience` int(10) NOT NULL DEFAULT '0' COMMENT '经验值',
  `mTime` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_forms
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_forms`;
CREATE TABLE `uctoo_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `password` varchar(255) NOT NULL COMMENT '表单密码',
  `finish_tip` text NOT NULL COMMENT '用户提交后提示内容',
  `can_edit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否允许编辑',
  `content` text NOT NULL COMMENT '详细介绍',
  `jump_url` varchar(255) NOT NULL COMMENT '提交后跳转的地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_forms_attribute
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_forms_attribute`;
CREATE TABLE `uctoo_forms_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `name` varchar(100) NOT NULL COMMENT '字段名',
  `title` varchar(255) NOT NULL COMMENT '字段标题',
  `type` char(50) NOT NULL DEFAULT 'string' COMMENT '字段类型',
  `extra` text NOT NULL COMMENT '参数',
  `value` varchar(255) NOT NULL COMMENT '默认值',
  `remark` varchar(255) NOT NULL COMMENT '字段备注',
  `is_must` tinyint(2) NOT NULL COMMENT '是否必填',
  `validate_rule` varchar(255) NOT NULL COMMENT '正则验证',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `error_info` varchar(255) NOT NULL COMMENT '出错提示',
  `forms_id` int(10) unsigned NOT NULL COMMENT '表单ID',
  `is_show` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_forms_value
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_forms_value`;
CREATE TABLE `uctoo_forms_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `openid` varchar(255) NOT NULL COMMENT 'OpenId',
  `forms_id` int(10) unsigned NOT NULL COMMENT '表单ID',
  `value` text NOT NULL COMMENT '表单值',
  `cTime` int(10) NOT NULL COMMENT '增加时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_forum
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_forum`;
CREATE TABLE `uctoo_forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `content` text COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `attach` varchar(255) DEFAULT NULL COMMENT '附件',
  `is_top` int(10) DEFAULT '0' COMMENT '置顶',
  `cid` tinyint(4) DEFAULT NULL COMMENT '分类',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '浏览数',
  `reply_count` int(11) unsigned DEFAULT '0' COMMENT '回复数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
-- Table structure for uctoo_hooks
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_hooks`;
CREATE TABLE `uctoo_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `搜索索引` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_hooks
-- ----------------------------
INSERT INTO `uctoo_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `uctoo_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop,BaiduStatistics');
INSERT INTO `uctoo_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `uctoo_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `uctoo_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `uctoo_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `uctoo_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `uctoo_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `uctoo_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `uctoo_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `uctoo_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');
INSERT INTO `uctoo_hooks` VALUES ('17', 'weixin', '微信插件必须加载的钩子', '1', '1388810858', 'Vote,Chat,Wecome,UserCenter,HelloWorld,Robot,Suggestions,Extensions,Card,WeiSite,Hitegg,Leaflets,Xydzp,CustomReply,Forms,Survey,Exam,Test,Diy,Shop,CustomMenu,Coupon,Scratch,Juhe,Tongji');
INSERT INTO `uctoo_hooks` VALUES ('18', 'cascade', '级联菜单', '1', '1398694587', 'Cascade');
INSERT INTO `uctoo_hooks` VALUES ('19', 'page_diy', '万能页面的钩子', '1', '1399040364', 'Diy');

-- ----------------------------
-- Table structure for uctoo_import
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_import`;
CREATE TABLE `uctoo_import` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attach` int(10) unsigned NOT NULL COMMENT '上传文件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_import
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_keyword
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_keyword`;
CREATE TABLE `uctoo_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `addon` varchar(255) NOT NULL COMMENT '关键词所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `keyword_length` int(10) unsigned DEFAULT '0' COMMENT '关键词长度',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '匹配类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) DEFAULT NULL COMMENT '数字扩展',
  `request_count` int(10) NOT NULL DEFAULT '0' COMMENT '请求数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_token` (`keyword`,`token`)
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_member
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_member`;
CREATE TABLE `uctoo_member` (
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `public_count` smallint(4) DEFAULT NULL,
  `extra_field` text,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Table structure for uctoo_member_public
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_member_public`;
CREATE TABLE `uctoo_member_public` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `public_name` varchar(50) NOT NULL COMMENT '公众号名称',
  `public_id` varchar(100) NOT NULL COMMENT '公众号原始id',
  `wechat` varchar(100) NOT NULL COMMENT '微信号',
  `interface_url` varchar(255) NOT NULL COMMENT '接口地址',
  `headface_url` varchar(255) NOT NULL COMMENT '公众号头像',
  `area` varchar(50) NOT NULL COMMENT '地区',
  `addon_config` text NOT NULL COMMENT '插件配置',
  `addon_status` text NOT NULL COMMENT '插件状态',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为当前公众号',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `appid` varchar(255) NOT NULL COMMENT 'AppId',
  `secret` varchar(255) NOT NULL COMMENT 'Secret',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_member_public_group
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_member_public_group`;
CREATE TABLE `uctoo_member_public_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '等级名',
  `addon_status` text NOT NULL COMMENT '插件权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_member_public_link
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_member_public_link`;
CREATE TABLE `uctoo_member_public_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '管理员UID',
  `mp_id` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `is_creator` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为创建者',
  `addon_status` text NOT NULL COMMENT '插件权限',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为当前管理的公众号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `um` (`uid`,`mp_id`) 
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_menu
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_menu`;
CREATE TABLE `uctoo_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_menu
-- ----------------------------
INSERT INTO `uctoo_menu` VALUES ('1', '首页', '0', '0', 'Index/index', '1', '', '', '1');
INSERT INTO `uctoo_menu` VALUES ('2', '内容', '0', '2', 'Article/mydocument', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `uctoo_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `uctoo_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('16', '用户', '0', '2', 'User/index', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `uctoo_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `uctoo_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `uctoo_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `uctoo_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `uctoo_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `uctoo_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `uctoo_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `uctoo_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '1', '', '用户管理', '0');
INSERT INTO `uctoo_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `uctoo_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `uctoo_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `uctoo_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `uctoo_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `uctoo_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `uctoo_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `uctoo_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `uctoo_menu` VALUES ('43', '插件管理', '0', '7', 'Addons/weixin', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `uctoo_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `uctoo_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `uctoo_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `uctoo_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `uctoo_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `uctoo_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `uctoo_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `uctoo_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `uctoo_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `uctoo_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `uctoo_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `uctoo_menu` VALUES ('57', '钩子管理', '43', '3', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `uctoo_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('59', '新增', '58', '0', 'model/add', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `uctoo_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('68', '系统', '0', '1', 'Config/group', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `uctoo_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `uctoo_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `uctoo_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `uctoo_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '1', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '1', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `uctoo_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `uctoo_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `uctoo_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `uctoo_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `uctoo_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `uctoo_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `uctoo_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `uctoo_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `uctoo_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `uctoo_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `uctoo_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `uctoo_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `uctoo_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `uctoo_menu` VALUES ('124', '微信插件', '43', '0', 'admin/addons/weixin', '0', '', '扩展', '0');
INSERT INTO `uctoo_menu` VALUES ('126', '公众号等级', '16', '0', 'admin/PublicGroup/PublicGroup', '0', '', '公众号管理', '0');
INSERT INTO `uctoo_menu` VALUES ('127', '公众号管理', '16', '1', 'admin/PublicGroup/PublicAdmin', '0', '', '公众号管理', '0');
INSERT INTO `uctoo_menu` VALUES ('128', '在线升级', '68', '5', 'admin/update/index', '0', '', '系统设置', '0');
INSERT INTO `uctoo_menu` VALUES ('129', '清除缓存', '68', '10', 'admin/Update/delcache', '0', '', '系统设置', '0');

-- ----------------------------
-- Table structure for uctoo_ml_mall_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_model`;
CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_attr_value` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`desc`  varchar(255) NOT NULL  COMMENT '属性描述',
`gid`  int(10) NOT NULL  COMMENT '商品ID',
`aid`  int(10) NOT NULL  COMMENT '属性ID',
`value`  text NOT NULL  COMMENT '属性值',
`price`  varchar(255) NOT NULL  DEFAULT 0.00 COMMENT '价格',
`icon`  varchar(255) NOT NULL  COMMENT '图片',
`thumbnail` varchar(255) NOT NULL  COMMENT '缩略图',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;


-- ----------------------------
-- Table structure for uctoo_ml_mall_attr
-- ----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_attr` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`name`  varchar(30) NOT NULL  COMMENT '属性名称',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`desc`  text NOT NULL  COMMENT '详细描述',
`owner_id` int(10) NOT NULL COMMENT '所属管理员',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;


-- ----------------------------
-- Table structure for uctoo_ml_mall_users
-- ----------------------------
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



-- ----------------------------
-- Table structure for uctoo_ml_mall_order_temp
-- ----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_order_temp` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`setid`  int(10) NOT NULL  COMMENT '商城id',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`openid`  varchar(255) NOT NULL  COMMENT '用户id',
`cpid`  int(10) NOT NULL  COMMENT '商品id',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_discount_type
-- ----------------------------
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


-- ----------------------------
-- Table structure for uctoo_ml_mall_order
-- ----------------------------
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
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_review
-- ----------------------------
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

-- ----------------------------
-- Table structure for uctoo_ml_mall_dishes_type
-- ----------------------------
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
`owner_id` int(10) NOT NULL COMMENT '所属管理员',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_yuyuemanage
-- ----------------------------
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


-- ----------------------------
-- Table structure for uctoo_ml_mall_scheduledtask
-- ----------------------------
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

-- ----------------------------
-- Table structure for uctoo_ml_mall_dishes
-- ----------------------------
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
`owner_id` int(10) NOT NULL COMMENT '所属管理员',
`typeid` int(10) NOT NULL COMMENT '商品分类ID',
`coverpic` int(10) unsigned NOT NULL COMMENT '商品广告图',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;

-- ----------------------------
-- Table structure for uctoo_ml_mall_set
-- ----------------------------
CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_set` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`token`  varchar(255) NOT NULL  COMMENT ' Token ',
`keyword`  varchar(255) NOT NULL  COMMENT ' 关键词 ',
`intro`  text NOT NULL  COMMENT '封面简介',
`title`  varchar(255) NOT NULL  COMMENT '标题',
`cover`  int(10) UNSIGNED NOT NULL  COMMENT '封面图片',
`kfname`  varchar(255) NOT NULL  COMMENT '客服名称',
`TemplateIndex`  varchar(255) NOT NULL  DEFAULT 'default' COMMENT '模板编号',
`owner_id` int(10) NOT NULL COMMENT '所属管理员',
`content` text NOT NULL COMMENT '商店介绍',
`status` char(50) NOT NULL COMMENT '状态',
`phone` varchar(255) NOT NULL COMMENT '电话',
`address` varchar(255) NOT NULL COMMENT '地址',
`website` varchar(255) NOT NULL COMMENT '网址',
`order` int(10) NOT NULL COMMENT '排序',
`settype` varchar(255) NOT NULL COMMENT '店铺类型',
`logo` int(10) unsigned NOT NULL COMMENT '品牌logo',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;


-- ----------------------------
-- Table structure for uctoo_model
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_model`;
CREATE TABLE `uctoo_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of uctoo_model
-- ----------------------------
INSERT INTO `uctoo_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"uid\",\"name\",\"title\",\"category_id\",\"description\",\"root\",\"pid\",\"model_id\",\"type\",\"position\",\"link_id\",\"cover_id\",\"display\",\"deadline\",\"attach\",\"view\",\"comment\",\"extend\",\"level\",\"create_time\",\"update_time\",\"status\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":{\"1\":\"content\"}}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1388921230', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('6', 'vote', '投票', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"description\",\"picurl\",\"type\",\"start_date\",\"end_date\"]}', '1:基础', '', '', '', '', 'id:投票ID\r\nkeyword:关键词\r\ntitle:投票标题\r\ntype|get_name_by_status:类型\r\nis_img|get_name_by_status:状态\r\nvote_count:投票数\r\nids:操作:show&id=[id]|预览,[EDIT]&id=[id]|编辑,[DELETE]|删除', '20', 'title', 'description', '1388930292', '1401017026', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":{\"1\":\"content\",\"2\":\"file_id\",\"3\":\"size\",\"6\":\"download\"},\"2\":{\"2\":\"parse\",\"11\":\"template\"}}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('5', 'keyword', '关键词表', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"addon\",\"aim_id\",\"keyword_length\",\"cTime\",\"extra_text\",\"extra_int\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1388815871', '1407251192', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('7', 'vote_option', '投票选项', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1388933346', '1388933346', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('8', 'vote_log', '投票记录', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1388934136', '1388934136', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('11', 'member_public', '公众号管理', '0', '', '1', '{\"1\":[\"public_name\",\"public_id\",\"wechat\",\"headface_url\",\"type\",\"appid\",\"secret\"]}', '1:基础', '', '', '', '', 'id:公众号ID\r\npublic_name:公众号名称\r\ngroup_id|get_public_group_name:等级\r\nheadface_url:公众号头像\r\ntoken:Token\r\nuid:管理员\r\nis_use|get_name_by_status:当前公众号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,changPublic&id=[id]|切换为当前公众号,help&public_id=[id]#weixin_set|接口配置', '20', 'public_name', '', '1391575109', '1398931552', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('30', 'card_member', '会员卡成员', '0', '', '1', '{\"1\":[\"username\",\"phone\"]}', '1:基础', '', '', '', '', 'number:卡号\r\nusername:姓名\r\nphone:手机号\r\ncTime|time_format:加入时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'username', '', '1395482804', '1395484751', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('13', 'member_public_group', '公众号等级', '0', '', '1', '{\"1\":[\"title\",\"addon_status\"]}', '1:基础', '', '', '', '', 'id:等级ID\r\ntitle:等级名\r\naddon_status:授权的插件\r\npublic_count:公众号数\r\nid:操作:editPublicGroup&id=[id]|编辑,delPublicGroup&id=[id]|删除', '10', 'title', '', '1393724788', '1393730663', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('14', 'update_version', '系统版本升级', '0', '', '1', '{\"1\":[\"version\",\"title\",\"description\",\"create_date\",\"package\"]}', '1:基础', '', '', '', '', 'version:版本号\r\ntitle:升级包名\r\ndescription:描述\r\ncreate_date|time_format:创建时间\r\ndownload_count:下载统计数\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', '', '', '1393770420', '1393771807', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('22', 'extensions', '融合第三方', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"keyword_filter\",\"output_format\",\"api_url\",\"api_token\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_filter|get_name_by_status:关键词过滤\r\noutput_format|get_name_by_status:数据输出格式\r\napi_url:第三方地址\r\napi_token:Token\r\ncTime|time_format:增加时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1393911774', '1394721892', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('16', 'forum', '论坛区', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1394033250', '1394033250', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('17', 'store', '应用商店', '0', '', '1', '{\"1\":[\"type\",\"title\",\"price\",\"attach\",\"logo\",\"content\",\"img_1\",\"img_2\",\"img_3\",\"img_4\",\"is_top\",\"audit\",\"audit_time\"]}', '1:基础', '', '', '', '', 'id:ID值\r\ntype|get_name_by_status:应用类型\r\ntitle:应用标题\r\nprice:价格\r\nlogo|get_img_html:应用LOGO\r\nmTime|time_format:更新时间\r\naudit|get_name_by_status:审核状态\r\naudit_time|time_format:审核时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394033250', '1402885526', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('18', 'suggestions', '建议意见', '0', '', '1', '{\"1\":[\"content\",\"nickname\",\"mobile\"]}', '1:基础', '', '', '', '', 'nickname:昵称\r\ncontent:内容\r\nmobile:联系方式\r\ncTime|time_format:创建时间\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', 'content', '', '1393234169', '1400687145', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('85', 'custom_menu', '自定义菜单', '0', '', '1', '{\"1\":[\"sort\",\"pid\",\"title\",\"keyword\",\"url\"]}', '1:基础', '', '', '', '', 'title:10%菜单名\r\nkeyword:10%关联关键词\r\nurl:50%关联URL\r\nsort:5%排序号\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394518309', '1407571484', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('31', 'card_notice', '会员卡通知', '0', '', '1', '{\"1\":[\"title\",\"content\"]}', '1:基础', '', '', '', '', 'title:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1395485156', '1395485486', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('33', 'weisite_category', '微官网分类', '0', '', '1', '{\"1\":[\"title\",\"icon\",\"url\",\"is_show\",\"status\",\"sort\",\"pid\"]}', '1:基础', '', '', '', '', 'title:15%分类标题\r\nicon|get_img-html:分类图片\r\nurl:30%外链\r\nsort:10%排序号\r\nis_show|get_name_by_status:10%显示\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1395987942', '1406081703', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('34', 'weisite_cms', '文章管理', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nid:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1408326292', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('35', 'weisite_slideshow', '幻灯片', '0', '', '1', '{\"1\":[\"title\",\"img\",\"url\",\"is_show\",\"sort\"]}', '1:基础', '', '', '', '', 'title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nid:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '10', 'title', '', '1396098264', '1408323347', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('36', 'weisite_footer', '底部导航', '0', '', '1', '{\"1\":[\"pid\",\"title\",\"url\",\"sort\"]}', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394518309', '1396507698', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('62', 'custom_reply_text', '文本回复', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"content\",\"sort\"]}', '1:基础', '', '', '', '', 'id:ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\nsort:排序号\r\nview_count:浏览数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1396578172', '1401017369', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('64', 'custom_reply_news', '图文回复', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]}', '1:基础', '', '', '', '', 'id:5%ID\r\nkeyword:10%关键词\r\nkeyword_type|get_name_by_status:20%关键词类型\r\ntitle:30%标题\r\ncate_id:10%所属分类\r\nsort:7%排序号\r\nview_count:8%浏览数\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1401368247', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('65', 'custom_reply_mult', '多图文配置', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1396602475', '1396602475', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('69', 'forms', '通用表单', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cover\",\"can_edit\",\"finish_tip\",\"jump_url\",\"content\"]}', '1:基础', '', '', '', '', 'id:通用表单ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,forms_attribute&id=[id]|字段管理,forms_value&id=[id]|数据管理,preview&id=[id]|预览', '10', 'title', '', '1396061373', '1401017094', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('70', 'forms_attribute', '表单字段', '0', '', '1', '{\"1\":[\"name\",\"title\",\"type\",\"extra\",\"value\",\"remark\",\"is_must\",\"validate_rule\",\"error_info\",\"sort\"]}', '1:基础', '', '', '', '', 'title:字段标题\r\nname:字段名\r\ntype|get_name_by_status:字段类型\r\nid:操作:[EDIT]&forms_id=[forms_id]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1396710959', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('71', 'forms_value', '通用表单数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1396687959', '1396687959', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('73', 'survey', '调研问卷', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"finish_tip\"]}', '1:基础', '', '', '', '', 'id:微调研ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,survey_question&id=[id]|问题管理,survey_answer&id=[id]|数据管理,preview&id=[id]|预览', '10', 'title', '', '1396061373', '1401017145', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('74', 'survey_question', '调研问题', '0', '', '1', '{\"1\":[\"title\",\"type\",\"extra\",\"intro\",\"is_must\",\"sort\"]}', '1:基础', '', '', '', '', 'title:标题\r\ntype|get_name_by_status:问题类型\r\nis_must|get_name_by_status:是否必填\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1396955090', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('75', 'survey_answer', '调研回答', '0', '', '1', '', '1:基础', '', '', '', '', 'openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\ncTime|time_format:发布时间\r\nid:操作:detail?uid=[uid]&survey_id=[survey_id]|回答内容', '10', 'title', '', '1396061373', '1397011511', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('76', 'exam', '考试试卷', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"start_time\",\"end_time\",\"finish_tip\"]}', '1:基础', '', '', '', '', 'id:微考试ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:试卷标题\r\nstart_time|time_format:开始时间\r\nend_time|time_format:结束时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,exam_question&id=[id]|题目管理,exam_answer&id=[id]|考生成绩,preview&id=[id]|试卷预览', '10', 'title', '', '1396061373', '1401017190', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('77', 'exam_question', '考试题目', '0', '', '1', '{\"1\":[\"title\",\"type\",\"extra\",\"intro\",\"is_must\",\"sort\"]}', '1:基础', '', '', '', '', 'title:标题\r\ntype|get_name_by_status:题目类型\r\nscore:分值\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1397035409', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('78', 'exam_answer', '考试回答', '0', '', '1', '', '1:基础', '', '', '', '', 'openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\nscore:成绩\r\ncTime|time_format:考试时间\r\nid:操作:detail?uid=[uid]&exam_id=[exam_id]|答题详情', '10', 'title', '', '1396061373', '1397036455', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('79', 'test', '测试问卷', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"finish_tip\"]}', '1:基础', '', '', '', '', 'id:微测试ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:问卷标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,test_question&id=[id]|题目管理,test_answer&id=[id]|用户记录,preview&id=[id]|问卷预览', '10', 'title', '', '1396061373', '1401017218', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('80', 'test_question', '测试题目', '0', '', '1', '{\"1\":[\"title\",\"extra\",\"intro\",\"sort\"]}', '1:基础', '', '', '', '', 'id:问题编号\r\ntitle:标题\r\nextra:参数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1397145854', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('81', 'test_answer', '测试回答', '0', '', '1', '', '1:基础', '', '', '', '', 'openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\nscore:得分\r\ncTime|time_format:测试时间\r\nid:操作:detail?uid=[uid]&test_id=[test_id]|答题详情', '10', 'title', '', '1396061373', '1397145984', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('82', 'diy', '万能页面', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"cover\",\"intro\",\"is_close\",\"need_login\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\ntitle:标题\r\nis_close|get_name_by_status:是否关闭\r\nneed_login|get_name_by_status:游客访问\r\nview_count:浏览数\r\nid:操作:[EDIT]|编辑,del&id=[id]&_addons=Diy&_controller=Diy|删除,diy&id=[id]&target=_blank&_addons=Diy&_controller=Diy|排版,preview&id=[id]&target=_blank&_addons=Diy&_controller=Diy|预览,show&id=[id]&target=_blank&_addons=Diy&_controller=Diy&token=[token]|访问地址', '10', 'title', '', '1396061373', '1399105105', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('83', 'shop_product', '微商店商品', '0', '', '1', '{\"1\":[\"title\",\"cover\",\"intro\",\"cate_id\",\"market_price\",\"discount_price\",\"buy_url\",\"ad_url\",\"content\",\"param\",\"img_1\",\"img_2\",\"img_3\",\"img_4\",\"img_5\"]}', '1:基础', '', '', '', '', 'id:商品ID\r\ncover|get_img_html:图片\r\ntitle:商品名称\r\ncate_id|getCommonCategoryTitle:分类\r\nmarket_price:市场价\r\ndiscount_price:市场价\r\nview_count:浏览数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398741409', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('84', 'common_category', '通用分类', '0', '', '1', '{\"1\":[\"pid\",\"title\",\"icon\",\"intro\",\"sort\",\"is_show\"]}', '1:基础', '', '', '', '', 'code:编号\r\ntitle:标题\r\nicon|get_img_html:图标\r\nsort:排序号\r\nis_show|get_name_by_status:显示\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1397529095', '1404182789', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('86', 'shop_footer', '底部导航', '0', '', '1', '{\"1\":[\"pid\",\"title\",\"url\",\"sort\"]}', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394518309', '1396507698', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('87', 'credit_config', '积分配置', '0', '', '1', '{\"1\":[\"title\",\"name\",\"experience\",\"score\"]}', '1:基础', '', '', '', '', 'title:积分描述\r\nname:积分标识\r\nexperience:经验值\r\nscore:财富值\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398564809', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('88', 'credit_data', '用户积分记录', '0', '', '1', '{\"1\":[\"credit_name\",\"uid\",\"experience\",\"score\"]}', '1:基础', '', '', '', '', 'uid:用户\r\ncredit_name:积分标识\r\nexperience:经验值\r\nscore:财富值\r\ncTime|time_format:记录时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'uid', '', '1398564291', '1400117739', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('89', 'follow', '粉丝管理', '0', '', '1', '{\"1\":[\"nickname\",\"sex\",\"headimgurl\",\"city\",\"province\",\"country\",\"language\"]}', '1:基础', '', '', '', '', 'id:粉丝编号\r\nopenid:OpenId\r\nnickname:昵称\r\nsex|get_name_by_status:性别\r\nsubscribe_time|time_format:关注时间\r\nids:操作:[EDIT]|编辑', '10', 'nickname', '', '1398845737', '1398846740', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('90', 'member_public_link', '公众号与管理员的关联关系', '0', '', '1', '{\"1\":[\"uid\",\"addon_status\"]}', '1:基础', '', '', '', '', 'uid|get_nickname:管理员\r\naddon_status:授权的插件\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', '', '', '1398933192', '1398947067', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('91', 'coupon', '优惠券', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"intro\",\"cover\",\"use_tips\",\"start_time\",\"end_time\",\"end_img\",\"end_tips\",\"num\",\"max_num\",\"follower_condtion\",\"credit_conditon\",\"credit_bug\",\"addon_condition\"]}', '1:基础', '', '', '', '', 'id:优惠券ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|成员管理,preview?id=[id]&target=_blank|预览', '10', 'title', '', '1396061373', '1401017265', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('92', 'sn_code', 'SN码', '0', '', '1', '{\"1\":[\"prize_title\"]}', '1:基础', '', '', '', '', 'sn:SN码\r\nuid|get_nickname:昵称\r\nprize_title:奖项\r\ncTime|time_format:创建时间\r\nis_use|get_name_by_status:是否已使用\r\nuse_time|time_format:使用时间\r\nid:操作:[DELETE]|删除,set_use?id=[id]|改变使用状态', '10', 'sn', '', '1399272054', '1401013099', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('93', 'scratch', '刮刮卡', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"intro\",\"cover\",\"use_tips\",\"start_time\",\"end_time\",\"end_tips\",\"end_img\",\"predict_num\",\"max_num\",\"follower_condtion\",\"credit_conditon\",\"credit_bug\",\"addon_condition\"]}', '1:基础', '', '', '', '', 'id:刮刮卡ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|中奖管理,lists?target_id=[id]&target=_blank&_controller=Prize|奖品管理,preview?id=[id]&target=_blank|预览', '10', 'title', '', '1396061373', '1401017298', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('94', 'prize', '奖项设置', '0', '', '1', '{\"1\":[\"title\",\"name\",\"num\",\"img\",\"sort\"]}', '1:基础', '', '', '', '', 'title:奖项标题\r\nname:奖项\r\nnum:名额数量\r\nimg|get_img_html:奖品图片\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1399348610', '1399702991', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('95', 'addon_category', '插件分类', '0', '', '1', '{\"1\":[\"icon\",\"title\",\"sort\"]}', '1:基础', '', '', '', '', 'icon|get_img_html:分类图标\r\ntitle:分类名\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1400047655', '1400048130', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('96', 'tongji', '运营统计', '0', '', '1', '{\"1\":[\"month\",\"day\",\"content\"]}', '1:基础', '', '', '', '', 'day:日期', '10', 'day', '', '1401371050', '1401371409', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('97', 'common_category_group', '通用分类分组', '0', '', '1', '{\"1\":[\"name\",\"title\"]}', '1:基础', '', '', '', '', 'name:分组标识\r\ntitle:分组标题\r\nid:操作:cascade?target=_blank&module=[name]|数据管理,[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1403664378', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('104', 'youaskservice_user', '你问我答-客服工号', '0', '', '1', '{\"1\":[\"name\",\"userName\",\"userPwd\",\"state\",\"kfid\"]}', '1:基础', '', '', '', '', 'kfid:编号\r\nname:客服昵称\r\nuserName:客服帐号', '10', 'name', 'userName', '1403947253', '1404398415', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('105', 'youaskservice_logs', '你问我答-聊天记录管理', '0', '', '1', '{\"1\":[\"pid\",\"openid\",\"enddate\",\"keyword\",\"status\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:回复内容\r\nenddate:回复时间', '10', 'keyword', '', '1403947270', '1404060187', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('116', 'youaskservice_keyword', '你问我答-关键词指配', '0', '', '1', '{\"1\":[\"msgkeyword\",\"msgkeyword_type\",\"zdtype\",\"msgstate\"]}', '1:基础', '', '', '', '', 'id:编号\r\nmsgkeyword:关键字\r\nmsgkeyword_type|get_name_by_status:匹配类型\r\nmsgkfaccount:指定的接待客服或分组\r\nmsgstate|get_name_by_status:状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'msgkeyword', '', '1404399143', '1404493938', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('106', 'youaskservice_wechat_enddate', 'youaskservice_wechat_enddate', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1404026714', '1404026714', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('107', 'youaskservice_wechat_grouplist', 'youaskservice_wechat_grouplist', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1404027300', '1404027300', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('108', 'youaskservice_behavior', 'youaskservice_behavior', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1404033501', '1404033501', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('115', 'smalltools', '小工具-管理', '0', '', '1', '{\"1\":[\"keyword\",\"toolname\",\"tooldes\",\"toolstate\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\ntoolname:名称\r\ntooldes:描述\r\ntooltype|get_name_by_status:类型\r\ntoolstate|get_name_by_status:状态', '10', 'toolname', 'tooldes', '1404273263', '1404277639', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('117', 'youaskservice_group', '你问我答-客服分组', '0', '', '1', '{\"1\":[\"groupname\"]}', '1:基础', '', '', '', '', 'id:编号\r\ngroupname:分组名称\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'groupname', '', '1404475456', '1404491410', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('120', 'youaskservice_wxlogs', '你问我答- 微信聊天记录', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1406094050', '1406094093', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('121', 'qr_code', '二维码表', '0', '', '1', '{\"1\":[\"qr_code\",\"addon\",\"aim_id\",\"cTime\",\"extra_text\",\"extra_int\",\"scene_id\",\"action_name\"]}', '1:基础', '', '', '', '', 'scene_id:事件KEY值\r\nqr_code|get_code_img:二维码\r\naction_name|get_name_by_status: 	二维码类型\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'qr_code', '', '1388815871', '1406130247', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('143', 'import', '导入数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1407554076', '1407554076', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('144', 'ml_mall_attr_value', '微商城_属性关联', '0', '', '1', '{\"1\":[\"gid\",\"aid\",\"value\",\"price\",\"icon\",\"desc\"]}', '1:基础', '', '', '', '', 'id:编号\r\ngid:商品ID\r\naid:属性ID\r\nvalue:属性值\r\nprice:属性价格\r\nicon:属性图片\r\ndesc:属性描述\r\nid:操作:[EDIT]&id=[id]]&ctid=[setid]|编辑,[DELETE]|删除', '10', '', '', '1404479659', '1404554224', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('145', 'ml_mall_attr', '微商城-商品属性', '0', '', '1', '{\"1\":[\"name\",\"desc\",\"token\"]}', '1:基础', '', '', '', '', 'id:编号\r\nname:属性名称\r\ndesc:详细描述\r\nid:操作:[EDIT]&id=[id]]&ctid=[setid]|编辑,[DELETE]|删除', '10', '', '', '1404447167', '1404553371', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('146', 'ml_mall_users', '微商城-联系信息', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1401694105', '1401694105', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('147', 'ml_mall_order_temp', '微商城-订单临时表', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1401610576', '1401610576', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('148', 'ml_mall_discount_type', '微商城-优惠分类', '0', '', '1', '{\"1\":[\"state\",\"name\",\"paixu\"]}', '1:基础', '', '', '', '', 'id:编号\r\npaixu:排序号\r\nname:商品分类名称\r\nstate|get_name_by_status:状态\r\nismain|get_name_by_status:是否主要\r\nid:操作:setzhuyao&id=[id]&ctid=[setid]|设置为主要,[EDIT]&id=[id]]&ctid=[setid]|编辑,[DELETE]|删除', '10', 'name', '', '1401119532', '1401973037', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('149', 'ml_mall_order', '微商城-订单管理', '0', '', '1', '{\"1\":[\"beizhu\",\"jctime\"]}', '1:基础', '', '', '', '', 'id:编号\r\ndcnum:订单编号\r\ncontactid:用户id\r\nctime:下单时间\r\njctime:自取/送货时间\r\nyhprice:优惠后总价\r\ncpcount:商品数量\r\nstate|get_name_by_status:状态\r\nstatekz|get_name_by_status:附加状态\r\nbeizhu:备注\r\nid:操作:lookcp&ctid=[set_id]&id=[id]|查看详细,[EDIT]&id=[id]|修改订单状态', '10', '', '', '1401115120', '1404723957', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('150', 'ml_mall_review', '微商城-评论', '0', '', '1', '{\"1\":[\"pltime\",\"plcontent\",\"hfcontent\",\"hftime\"]}', '1:基础', '', '', '', '', 'id:编号\r\nopenid:评论用户id\r\npltime:评论时间', '10', '', '', '1401114177', '1401206740', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('151', 'ml_mall_dishes_type', '微商城-商品分类', '0', '', '1', '{\"1\":[\"name\",\"pic\",\"introduction\",\"state\",\"paixu\"]}', '1:基础', '', '', '', '', 'id:编号\r\npaixu:排序号\r\npic:商品分类图片\r\nname:商品分类名称\r\nstate|get_name_by_status:状态\r\nid:操作:[EDIT]&id=[id]&ctid=[setid]|编辑,[DELETE]|删除', '10', 'name', 'introduction', '1401113818', '1401973013', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('152', 'ml_mall_yuyuemanage', '微商城-电话预约管理', '0', '', '1', '{\"1\":[\"username\",\"usermobile\",\"sex\",\"yycount\"]}', '1:基础', '', '', '', '', 'id:编号\r\nusername:预约人姓名\r\nusermobile:预约人电话\r\nsex:性别\r\nyycount:预约人数', '10', 'username', '', '1401113104', '1401698416', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('153', 'ml_mall_scheduledtask', '微商城-计划任务列表', '0', '', '1', '{\"1\":[\"title\",\"state\",\"type\",\"zhou\",\"yue\",\"day\",\"xiaos\",\"fenz\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:任务名称\r\nupruntime:上次执行时间\r\ndownruntime:下次执行时间', '10', 'title', '', '1401112371', '1401207461', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('154', 'ml_mall_dishes', '微商城-商品库', '0', '', '1', '{\"1\":[\"dishes_num\",\"name\",\"price\",\"icon\",\"coverpic\",\"introduction\",\"state\",\"paixu\",\"attr\",\"featured\"]}', '1:基础', '', '', '', '', 'id:编号\r\npaixu:排序号\r\nicon:商品图片\r\nname:商品名称\r\nstate|get_name_by_status:状态\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]|删除,attr&id=[id]|属性', '10', 'name', 'dishes_num', '1401110349', '1404643658', '1', 'MyISAM');
INSERT INTO `uctoo_model` VALUES ('155', 'ml_mall_set', '微商城-商城设置', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"cover\",\"intro\",\"kfname\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\ntitle:标题\r\nid:操作:show&id=[id]|预览,listsedit&id=[id]|编辑,listsdel&id=[id]|删除', '10', 'title', 'intro', '1401103928', '1401378396', '1', 'MyISAM');


-- ----------------------------
-- Table structure for uctoo_picture
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_picture`;
CREATE TABLE `uctoo_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=365 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_prize
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_prize`;
CREATE TABLE `uctoo_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addon` varchar(255) NOT NULL DEFAULT 'Scratch' COMMENT '来源插件',
  `target_id` int(10) unsigned NOT NULL COMMENT '来源ID',
  `title` varchar(255) NOT NULL COMMENT '奖项标题',
  `name` varchar(255) NOT NULL COMMENT '奖项',
  `num` int(10) unsigned NOT NULL COMMENT '名额数量',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `img` int(10) unsigned NOT NULL COMMENT '奖品图片',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_qr_code
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_qr_code`;
CREATE TABLE `uctoo_qr_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qr_code` varchar(255) NOT NULL COMMENT '二维码',
  `addon` varchar(255) NOT NULL COMMENT '二维码所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `action_name` char(30) NOT NULL DEFAULT 'QR_SCENE' COMMENT '二维码类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) DEFAULT NULL COMMENT '数字扩展',
  `request_count` int(10) NOT NULL DEFAULT '0' COMMENT '请求数',
  `scene_id` int(10) NOT NULL DEFAULT '0' COMMENT '场景ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_qr_code
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_scratch
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_scratch`;
CREATE TABLE `uctoo_scratch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `use_tips` varchar(255) NOT NULL COMMENT '使用说明',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `start_time` int(10) NOT NULL COMMENT '开始时间',
  `end_tips` text NOT NULL COMMENT '过期说明',
  `predict_num` int(10) unsigned NOT NULL COMMENT '预计参与人数',
  `max_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '每人最多允许抽奖次数',
  `follower_condtion` char(50) NOT NULL DEFAULT '1' COMMENT '粉丝状态',
  `credit_conditon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分限制',
  `credit_bug` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分消费',
  `addon_condition` varchar(255) NOT NULL COMMENT '插件场景限制',
  `collect_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已领取人数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `end_img` int(10) unsigned NOT NULL COMMENT '过期提示图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_shop_footer
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_shop_footer`;
CREATE TABLE `uctoo_shop_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_shop_product
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_shop_product`;
CREATE TABLE `uctoo_shop_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '商品名称',
  `intro` text NOT NULL COMMENT '商品简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '商品封面图片',
  `content` text NOT NULL COMMENT '商品详情',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `param` text NOT NULL COMMENT '商品参数',
  `ad_url` varchar(255) NOT NULL COMMENT '商品广告页面',
  `buy_url` varchar(255) NOT NULL COMMENT '购买地址',
  `cate_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品一级分类',
  `cate_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品二级分类',
  `market_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '市场价',
  `discount_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '打折价',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `img_1` int(10) unsigned NOT NULL COMMENT '商品图片1',
  `img_2` int(10) unsigned NOT NULL COMMENT '商品图片2',
  `img_3` int(10) unsigned NOT NULL COMMENT '商品图片3',
  `img_4` int(10) unsigned NOT NULL COMMENT '商品图片4',
  `img_5` int(10) unsigned NOT NULL COMMENT '商品图片5',
  `cate_id` char(50) NOT NULL COMMENT '商品分类',
  `bug_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成交量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for uctoo_smalltools
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_smalltools`;
CREATE TABLE `uctoo_smalltools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tooltype` tinyint(2) NOT NULL DEFAULT '0' COMMENT '工具类型',
  `keyword` varchar(255) NOT NULL COMMENT ' 关键词 ',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `toolname` varchar(255) NOT NULL COMMENT '工具名称',
  `tooldes` text NOT NULL COMMENT '工具描述',
  `toolnum` varchar(255) NOT NULL COMMENT '工具唯一编号',
  `toolstate` tinyint(2) NOT NULL DEFAULT '0' COMMENT '工具状态',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_smalltools
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_sn_code
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_sn_code`;
CREATE TABLE `uctoo_sn_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` varchar(255) NOT NULL COMMENT 'SN码',
  `uid` int(10) NOT NULL COMMENT '粉丝UID',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已使用',
  `use_time` int(10) NOT NULL COMMENT '使用时间',
  `addon` varchar(255) NOT NULL DEFAULT 'Coupon' COMMENT '来自的插件',
  `target_id` int(10) unsigned NOT NULL COMMENT '来源ID',
  `prize_id` int(10) unsigned NOT NULL COMMENT '奖项ID',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `prize_title` varchar(255) NOT NULL COMMENT '奖项',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_store
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_store`;
CREATE TABLE `uctoo_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `content` text COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `attach` varchar(255) DEFAULT NULL COMMENT '插件安装包',
  `is_top` int(10) DEFAULT '0' COMMENT '置顶',
  `cid` tinyint(4) DEFAULT NULL COMMENT '分类',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '浏览数',
  `img_1` int(10) unsigned DEFAULT NULL COMMENT '插件截图1',
  `img_2` int(10) unsigned DEFAULT NULL COMMENT '插件截图2',
  `img_3` int(10) unsigned DEFAULT NULL COMMENT '插件截图3',
  `img_4` int(10) unsigned DEFAULT NULL COMMENT '插件截图4',
  `download_count` int(10) unsigned DEFAULT '0' COMMENT '下载数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
-- Table structure for uctoo_suggestions
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_suggestions`;
CREATE TABLE `uctoo_suggestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `uid` int(10) DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_survey
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_survey`;
CREATE TABLE `uctoo_survey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `finish_tip` text NOT NULL COMMENT '结束语',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_survey_answer
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_survey_answer`;
CREATE TABLE `uctoo_survey_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `survey_id` int(10) unsigned NOT NULL COMMENT 'survey_id',
  `question_id` int(10) unsigned NOT NULL COMMENT 'question_id',
  `uid` int(10) DEFAULT NULL COMMENT '用户UID',
  `openid` varchar(255) NOT NULL COMMENT 'OpenId',
  `answer` text NOT NULL COMMENT '回答内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_survey_question
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_survey_question`;
CREATE TABLE `uctoo_survey_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '问题描述',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `survey_id` int(10) unsigned NOT NULL COMMENT 'survey_id',
  `type` char(50) NOT NULL DEFAULT 'radio' COMMENT '问题类型',
  `extra` text NOT NULL COMMENT '参数',
  `is_must` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_test
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_test`;
CREATE TABLE `uctoo_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '问卷标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `finish_tip` text NOT NULL COMMENT '评论语',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_test_answer
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_test_answer`;
CREATE TABLE `uctoo_test_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `answer` text NOT NULL COMMENT '回答内容',
  `openid` varchar(255) NOT NULL COMMENT 'OpenId',
  `uid` int(10) DEFAULT NULL COMMENT '用户UID',
  `question_id` int(10) unsigned NOT NULL COMMENT 'question_id',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `test_id` int(10) unsigned NOT NULL COMMENT 'test_id',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '得分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_test_question
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_test_question`;
CREATE TABLE `uctoo_test_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '题目标题',
  `intro` text NOT NULL COMMENT '题目描述',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `is_must` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否必填',
  `extra` text NOT NULL COMMENT '参数',
  `type` char(50) NOT NULL DEFAULT 'radio' COMMENT '题目类型',
  `test_id` int(10) unsigned NOT NULL COMMENT 'test_id',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_test_question
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_tongji
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_tongji`;
CREATE TABLE `uctoo_tongji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `month` int(10) NOT NULL COMMENT '月份',
  `day` int(10) NOT NULL COMMENT '日期',
  `content` text NOT NULL COMMENT '统计数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_tongji
-- ----------------------------


-- Table structure for uctoo_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ucenter_admin`;
CREATE TABLE `uctoo_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of uctoo_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ucenter_app`;
CREATE TABLE `uctoo_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of uctoo_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ucenter_member`;
CREATE TABLE `uctoo_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `openid` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for uctoo_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_ucenter_setting`;
CREATE TABLE `uctoo_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of uctoo_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_update_version
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_update_version`;
CREATE TABLE `uctoo_update_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) unsigned NOT NULL COMMENT '版本号',
  `title` varchar(50) NOT NULL COMMENT '升级包名',
  `description` text NOT NULL COMMENT '描述',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `download_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载统计',
  `package` varchar(255) NOT NULL COMMENT '升级包地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for uctoo_url
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_url`;
CREATE TABLE `uctoo_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of uctoo_url
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_userdata
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_userdata`;
CREATE TABLE `uctoo_userdata` (
  `uid` int(10) DEFAULT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_vote
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_vote`;
CREATE TABLE `uctoo_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `title` varchar(100) NOT NULL COMMENT '投票标题',
  `description` text NOT NULL COMMENT '投票描述',
  `picurl` int(10) unsigned NOT NULL COMMENT '封面图片',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '选择类型',
  `start_date` int(10) NOT NULL COMMENT '开始日期',
  `end_date` int(10) NOT NULL COMMENT '结束日期',
  `is_img` tinyint(2) NOT NULL DEFAULT '0' COMMENT '文字/图片投票',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票数',
  `cTime` int(10) NOT NULL COMMENT '投票创建时间',
  `mTime` int(10) NOT NULL COMMENT '更新时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_vote
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_vote_log`;
CREATE TABLE `uctoo_vote_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vote_id` int(10) unsigned NOT NULL COMMENT '投票ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `token` varchar(255) NOT NULL COMMENT '用户TOKEN',
  `options` varchar(255) NOT NULL COMMENT '选择选项',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uctoo_vote_log
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_vote_option`;
CREATE TABLE `uctoo_vote_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vote_id` int(10) unsigned NOT NULL COMMENT '投票ID',
  `name` varchar(255) NOT NULL COMMENT '选项标题',
  `image` int(10) unsigned NOT NULL COMMENT '图片选项',
  `opt_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前选项投票数',
  `order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '选项排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_weisite_category
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_weisite_category`;
CREATE TABLE `uctoo_weisite_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '分类图片',
  `url` varchar(255) NOT NULL COMMENT '外链',
  `is_show` tinyint(2) NOT NULL DEFAULT '1' COMMENT '显示',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_weisite_cms
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_weisite_cms`;
CREATE TABLE `uctoo_weisite_cms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned DEFAULT '0' COMMENT '所属类别',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `content` text NOT NULL COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_weisite_footer
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_weisite_footer`;
CREATE TABLE `uctoo_weisite_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_weisite_slideshow
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_weisite_slideshow`;
CREATE TABLE `uctoo_weisite_slideshow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uctoo_weixin_log
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_weixin_log`;
CREATE TABLE `uctoo_weixin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cTime` int(11) DEFAULT NULL,
  `cTime_format` varchar(30) DEFAULT NULL,
  `data` text,
  `data_post` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7213 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for uctoo_youaskservice_behavior
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_behavior`;
CREATE TABLE `uctoo_youaskservice_behavior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `openid` varchar(60) NOT NULL,
  `date` varchar(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `model` varchar(60) NOT NULL,
  `num` int(11) NOT NULL,
  `keyword` varchar(60) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_behavior
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_youaskservice_group
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_group`;
CREATE TABLE `uctoo_youaskservice_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `groupname` varchar(255) NOT NULL COMMENT '分组名称',
  `groupdata` text NOT NULL COMMENT '分组数据源',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_group
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_youaskservice_keyword
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_keyword`;
CREATE TABLE `uctoo_youaskservice_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msgkeyword` varchar(555) NOT NULL COMMENT '消息关键字',
  `msgkeyword_type` char(50) NOT NULL DEFAULT '3' COMMENT '关键字类型',
  `msgkfaccount` varchar(255) NOT NULL COMMENT '接待的客服人员',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `msgstate` tinyint(2) NOT NULL DEFAULT '1' COMMENT '关键字状态',
  `zjnum` int(10) NOT NULL COMMENT '转接次数',
  `zdtype` char(10) NOT NULL DEFAULT '0' COMMENT '指定类型',
  `kfgroupid` int(10) NOT NULL DEFAULT '0' COMMENT '客服分组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_youaskservice_logs
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_logs`;
CREATE TABLE `uctoo_youaskservice_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `openid` varchar(60) NOT NULL,
  `enddate` int(11) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wp_youaskservice_logs
-- ----------------------------

-- ----------------------------
-- Table structure for wp_youaskservice_user
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_user`;
CREATE TABLE `uctoo_youaskservice_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '客服昵称',
  `token` varchar(60) NOT NULL COMMENT 'token',
  `userName` varchar(60) NOT NULL COMMENT '客服帐号',
  `userPwd` varchar(32) NOT NULL COMMENT '客服密码',
  `endJoinDate` int(11) NOT NULL COMMENT '客服加入时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '客服在线状态',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客服状态',
  `isdelete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `kfid` varchar(255) NOT NULL COMMENT '客服编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_user
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_youaskservice_wechat_enddate
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_wechat_enddate`;
CREATE TABLE `uctoo_youaskservice_wechat_enddate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(60) NOT NULL,
  `enddate` int(11) NOT NULL,
  `joinUpDate` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_wechat_enddate
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_youaskservice_wechat_grouplist
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_wechat_grouplist`;
CREATE TABLE `uctoo_youaskservice_wechat_grouplist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` varchar(20) NOT NULL DEFAULT '',
  `nickname` varchar(60) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(30) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `subscribe_time` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  `openid` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_wechat_grouplist
-- ----------------------------

-- ----------------------------
-- Table structure for uctoo_youaskservice_wxlogs
-- ----------------------------
DROP TABLE IF EXISTS `uctoo_youaskservice_wxlogs`;
CREATE TABLE `uctoo_youaskservice_wxlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `worker` varchar(255) NOT NULL COMMENT '客服名称',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `opercode` int(10) NOT NULL COMMENT '会话状态',
  `time` int(10) NOT NULL COMMENT '时间',
  `text` text NOT NULL COMMENT '消息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uctoo_youaskservice_wxlogs
-- ----------------------------
