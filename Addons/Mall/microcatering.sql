--
-- 表的结构 `uctoo_ml_mall_discount_type`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_discount_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ismain` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为主要',
  `name` varchar(255) NOT NULL COMMENT '优惠分类名称',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `dishesdatas` text NOT NULL COMMENT '商品id和优惠价格序列化数据',
  `paixu` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `setid` int(10) NOT NULL COMMENT '商城id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `uctoo_ml_mall_discount_type`
--


-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_dishes`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_dishes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paixu` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `review_count` int(10) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `icon` int(10) unsigned NOT NULL COMMENT ' 商品封面 ',
  `dishes_num` varchar(255) NOT NULL COMMENT '商品编号',
  `price` varchar(255) NOT NULL COMMENT '价格',
  `introduction` text NOT NULL COMMENT '商品简介',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `youhuiid` int(10) NOT NULL DEFAULT '0' COMMENT '优惠id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `uctoo_ml_mall_dishes`
--

INSERT INTO `uctoo_ml_mall_dishes` (`id`, `paixu`, `state`, `review_count`, `icon`, `dishes_num`, `price`, `introduction`, `name`, `token`, `youhuiid`) VALUES
(1, 1, 0, 0, 388, '1', '200', '<p>夏季新款，详细介绍这里写啊小编。</p>', '衬衣', 'gh_3da51bd7cc0d', 0),
(2, 2, 0, 0, 389, '2', '150', '<p>童装T恤啊亲，别买错了。</p>', '童装T恤', 'gh_3da51bd7cc0d', 0),
(3, 1, 0, 0, 392, '1', '35', '<p>20世纪初期，意大利人阿奇布夏发明蒸汽压力咖啡机的同时，也发展出了卡布奇诺咖啡。卡布奇诺是一种加入以同量的意大利特浓咖啡和蒸汽泡沫牛奶相混合的意大利咖啡。此时咖啡的颜色，就像卡布奇诺教会的修士在深褐色的外衣上覆上一条头巾一样，咖啡因此得名。传统的卡布奇诺咖啡是三分之一浓缩咖啡，三分之一蒸汽牛奶和三分之一泡沫牛奶。</p>', '卡布奇诺', 'gh_3da51bd7cc0d', 0),
(4, 4, 0, 0, 393, '4', '40', '<p>拿铁咖啡是意大利浓缩咖啡与牛奶的经典混合，意大利人也很喜欢把拿铁作为早餐的饮料。意大利人早晨的厨房里，照得到阳光的炉子上通常会同时煮着咖啡和牛奶。喝拿铁的意大利人，与其说他们喜欢意大利浓缩咖啡，不如说他们喜欢牛奶，也只有espresso才能给普普通通的牛奶带来让人难以忘怀的味道。</p>', '拿铁', 'gh_3da51bd7cc0d', 0),
(5, 5, 0, 0, 394, '5', '30', '<p>夏日么么茶，可续杯。</p>', '么么茶', 'gh_3da51bd7cc0d', 0),
(6, 1, 0, 0, 396, '001', '88', '<p>衬衫</p>', 'T雪', 'gh_58eed0dc2a8e', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_dishes_type`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_dishes_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paixu` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `pic` int(10) unsigned NOT NULL COMMENT '商品分类图片',
  `name` varchar(255) NOT NULL COMMENT '商品分类名称',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `setid` int(10) NOT NULL COMMENT '关联的商城id',
  `dishesdatas` text NOT NULL COMMENT '商品集合',
  `introduction` text NOT NULL COMMENT '简介',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=99 ;

--
-- 导出表中的数据 `uctoo_ml_mall_dishes_type`
--

INSERT INTO `uctoo_ml_mall_dishes_type` (`id`, `paixu`, `pic`, `name`, `state`, `setid`, `dishesdatas`, `introduction`, `token`) VALUES
(91, 0, 372, '川菜', 0, 4, 'N;', '<p>麻辣是特色</p>', 'gh_3ee44a31f642'),
(92, 0, 375, '粤菜55', 0, 4, 'a:1:{i:0;s:2:"13";}', '<p>清炖</p>', 'gh_3ee44a31f642'),
(93, 0, 372, '川菜', 0, 5, 'N;', '<p>麻辣是特色</p>', 'gh_3ee44a31f642'),
(94, 0, 375, '粤菜22', 0, 5, 'a:1:{i:0;s:2:"13";}', '<p>清炖</p>', 'gh_3ee44a31f642'),
(95, 1, 390, '夏装', 0, 1, 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', '<p>优衣库夏装</p>', 'gh_3da51bd7cc0d'),
(97, 2, 394, '茶', 0, 2, 'a:1:{i:0;s:1:"5";}', '<p>茶饮</p>', 'gh_3da51bd7cc0d'),
(98, 3, 393, '咖啡', 0, 2, 'a:2:{i:0;s:1:"4";i:1;s:1:"3";}', '<p>咖啡饮品</p>', 'gh_3da51bd7cc0d');

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_order`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tablemanage_id` int(10) NOT NULL COMMENT '关联的属性编号',
  `endtime` varchar(255) NOT NULL COMMENT '过期时间',
  `zftype` char(50) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `price` varchar(255) NOT NULL COMMENT '订单原总价',
  `yhprice` varchar(255) NOT NULL COMMENT '优惠后的总价',
  `openid` varchar(255) NOT NULL COMMENT '关联的微信用户id',
  `dishes_count_datas` text NOT NULL COMMENT '订单的商品数量序列化数据',
  `set_id` int(10) NOT NULL COMMENT '关联的商城id',
  `statekz` char(50) NOT NULL DEFAULT '0' COMMENT '状态扩展',
  `dcnum` varchar(255) NOT NULL COMMENT '订单单号',
  `state` char(50) NOT NULL DEFAULT '0' COMMENT '状态',
  `diningtypes` char(50) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `beizhu` text NOT NULL COMMENT '备注',
  `cpcount` int(10) NOT NULL DEFAULT '0' COMMENT '商品总数量',
  `ctime` varchar(255) NOT NULL COMMENT '创建时间',
  `jctime` varchar(255) NOT NULL COMMENT '就餐时间',
  `contactid` int(10) NOT NULL COMMENT '关联的联系id',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=19 ;

--
-- 导出表中的数据 `uctoo_ml_mall_order`
--

INSERT INTO `uctoo_ml_mall_order` (`id`, `tablemanage_id`, `endtime`, `zftype`, `price`, `yhprice`, `openid`, `dishes_count_datas`, `set_id`, `statekz`, `dcnum`, `state`, `diningtypes`, `beizhu`, `cpcount`, `ctime`, `jctime`, `contactid`, `token`) VALUES
(14, 5, '14-06-09 18:02:29', '0', '', '68', 'owYXBjtoBtTAx_4hxSptaUTCawUQ', 'a:1:{i:13;a:12:{s:2:"id";s:2:"13";s:5:"token";s:15:"gh_3ee44a31f642";s:4:"name";s:9:"油辣子";s:10:"dishes_num";s:3:"001";s:4:"icon";s:3:"372";s:12:"introduction";s:16:"<p>非常霜</p>";s:5:"price";s:2:"17";s:12:"review_count";s:1:"0";s:5:"paixu";s:1:"0";s:5:"state";s:1:"0";s:8:"youhuiid";s:1:"0";s:3:"num";i:4;}}', 4, '0', '2014060253531019', '0', '1', '', 4, '14-06-02 18:02:29', '2014-06-02 7:00:00', 2, 'gh_3ee44a31f642'),
(15, 0, '14-06-15 13:27:06', '0', '', '238', '-1', 'a:1:{i:13;a:12:{s:2:"id";s:2:"13";s:5:"token";s:15:"gh_3ee44a31f642";s:4:"name";s:9:"油辣子";s:10:"dishes_num";s:3:"001";s:4:"icon";s:3:"372";s:12:"introduction";s:16:"<p>非常霜</p>";s:5:"price";s:2:"17";s:12:"review_count";s:1:"0";s:5:"paixu";s:1:"0";s:5:"state";s:1:"0";s:8:"youhuiid";s:1:"0";s:3:"num";i:14;}}', 4, '6', '2014060897515151', '0', '1', '', 14, '14-06-08 13:27:06', '2014-06-08 3:00:00', 3, 'gh_3ee44a31f642'),
(16, 5, '14-06-15 14:54:46', '0', '', '153', '-1', 'a:1:{i:13;a:12:{s:2:"id";s:2:"13";s:5:"token";s:15:"gh_3ee44a31f642";s:4:"name";s:9:"油辣子";s:10:"dishes_num";s:3:"001";s:4:"icon";s:3:"372";s:12:"introduction";s:16:"<p>非常霜</p>";s:5:"price";s:2:"17";s:12:"review_count";s:1:"0";s:5:"paixu";s:1:"0";s:5:"state";s:1:"0";s:8:"youhuiid";s:1:"0";s:3:"num";i:9;}}', 4, '0', '2014060854484856', '0', '0', '', 9, '14-06-08 14:54:46', '2014-06-08 1:00:00', 3, 'gh_3ee44a31f642'),
(17, 5, '14-06-15 15:21:12', '0', '', '153', '-1', 'a:1:{i:13;a:12:{s:2:"id";s:2:"13";s:5:"token";s:15:"gh_3ee44a31f642";s:4:"name";s:9:"油辣子";s:10:"dishes_num";s:3:"001";s:4:"icon";s:3:"372";s:12:"introduction";s:16:"<p>非常霜</p>";s:5:"price";s:2:"17";s:12:"review_count";s:1:"0";s:5:"paixu";s:1:"0";s:5:"state";s:1:"0";s:8:"youhuiid";s:1:"0";s:3:"num";i:9;}}', 4, '2', '2014060856505410', '1', '0', '', 9, '14-06-08 15:21:12', '2014-06-08 1:00:00', 3, 'gh_3ee44a31f642'),
(18, 0, '14-06-29 14:45:12', '4', '', '150', 'oOakbt7UwAdG-odQGyWt5bcYCbBU', 'a:1:{i:2;a:12:{s:2:"id";s:1:"2";s:5:"paixu";s:1:"2";s:5:"state";s:1:"0";s:12:"review_count";s:1:"0";s:4:"icon";s:3:"389";s:10:"dishes_num";s:1:"2";s:5:"price";s:3:"150";s:12:"introduction";s:41:"<p>童装T恤啊亲，别买错了。</p>";s:4:"name";s:10:"童装T恤";s:5:"token";s:15:"gh_3da51bd7cc0d";s:8:"youhuiid";s:1:"0";s:3:"num";i:1;}}', 1, '0', '2014062256101975', '0', '1', '', 1, '14-06-22 14:45:12', '2014-06-22 14:00:00', 4, 'gh_3da51bd7cc0d');

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_order_temp`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_order_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setid` int(10) NOT NULL COMMENT '商城id',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `openid` varchar(255) NOT NULL COMMENT '用户id',
  `cpid` int(10) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `uctoo_ml_mall_order_temp`
--

INSERT INTO `uctoo_ml_mall_order_temp` (`id`, `setid`, `token`, `openid`, `cpid`) VALUES
(1, 1, 'gh_3da51bd7cc0d', '-1', 2),
(3, 2, 'gh_3da51bd7cc0d', 'oOakbtyo4HNgzeWCD1Rf_6-iF9Y4', 3);

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_review`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plcontent` text NOT NULL COMMENT '评论内容',
  `pltime` int(10) NOT NULL COMMENT '评论时间',
  `hftime` int(10) NOT NULL COMMENT '回复时间',
  `hfcontent` text NOT NULL COMMENT '回复内容',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '评论类型',
  `openid` varchar(255) NOT NULL COMMENT '关联的用户id',
  `set_id` int(10) NOT NULL COMMENT '关联的商城id',
  `dishes_id` int(10) NOT NULL COMMENT '关联的商品id或者关联的桌台id',
  `pingji` int(10) NOT NULL DEFAULT '3' COMMENT '商品评级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `uctoo_ml_mall_review`
--


-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_scheduledtask`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_scheduledtask` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `uctoo_ml_mall_scheduledtask`
--


-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_set`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT ' Token ',
  `keyword` varchar(255) NOT NULL COMMENT ' 关键词 ',
  `intro` text NOT NULL COMMENT '封面简介',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `kfname` varchar(255) NOT NULL COMMENT '客服名称',
  `TemplateIndex` varchar(255) NOT NULL DEFAULT 'default' COMMENT '模板编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `uctoo_ml_mall_set`
--

INSERT INTO `uctoo_ml_mall_set` (`id`, `token`, `keyword`, `intro`, `title`, `cover`, `kfname`, `TemplateIndex`) VALUES
(1, 'gh_3da51bd7cc0d', '优衣库', '优衣库', '优衣库', 387, '优衣库客服', 'default'),
(2, 'gh_3da51bd7cc0d', '星巴克', '星巴克', '星巴克', 391, '星巴克客服', 'default'),
(3, 'gh_58eed0dc2a8e', 'uniqlo', 'uniqlo', 'uniqlo', 395, 'uniqlo客服', 'default');

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_tablemanage`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_tablemanage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ztnum` varchar(255) NOT NULL COMMENT '桌台编号',
  `setid` int(10) NOT NULL COMMENT '商城id',
  `paixu` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `ztdes` text NOT NULL COMMENT '属性简介',
  `state` char(50) NOT NULL DEFAULT '0' COMMENT '状态',
  `yongccount` int(10) NOT NULL COMMENT '用餐人数',
  `zttype` varchar(255) NOT NULL DEFAULT '0' COMMENT '属性类型',
  `ztname` varchar(255) NOT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `uctoo_ml_mall_tablemanage`
--

INSERT INTO `uctoo_ml_mall_tablemanage` (`id`, `ztnum`, `setid`, `paixu`, `token`, `ztdes`, `state`, `yongccount`, `zttype`, `ztname`) VALUES
(5, '01', 4, 0, 'gh_3ee44a31f642', '<p>只有这个</p>', '0', 6, '1', '国色甜香');

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_users`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(555) NOT NULL COMMENT '联系地址',
  `truename` varchar(255) NOT NULL COMMENT '用户名称',
  `tel` varchar(255) NOT NULL COMMENT '联系电话',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `openid` varchar(255) NOT NULL COMMENT '微信id',
  `isdefault` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `set_id` int(10) NOT NULL COMMENT '商城id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `uctoo_ml_mall_users`
--

INSERT INTO `uctoo_ml_mall_users` (`id`, `address`, `truename`, `tel`, `token`, `openid`, `isdefault`, `set_id`) VALUES
(1, '123', '张三', '13400000000', 'gh_3ee44a31f642', '-1', 0, 2),
(2, '特三个月', '张三', '13438109388', 'gh_3ee44a31f642', 'owYXBjtoBtTAx_4hxSptaUTCawUQ', 0, 4),
(3, '123', '333', '13400000000', 'gh_3ee44a31f642', '-1', 0, 4),
(4, '深圳', 'patrick', '18665861715', 'gh_3da51bd7cc0d', 'oOakbt7UwAdG-odQGyWt5bcYCbBU', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uctoo_ml_mall_yuyuemanage`
--

CREATE TABLE IF NOT EXISTS `uctoo_ml_mall_yuyuemanage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yycount` int(10) NOT NULL COMMENT '预约人数',
  `sex` int(10) NOT NULL DEFAULT '0' COMMENT '预约人性别',
  `usermobile` varchar(255) NOT NULL COMMENT '预约人电话',
  `username` varchar(255) NOT NULL COMMENT '预约人姓名',
  `openid` varchar(255) NOT NULL COMMENT '关联微信用户id',
  `tablemanage_id` int(10) NOT NULL COMMENT '桌台编号',
  `set_id` int(10) NOT NULL COMMENT '关联的商城编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `uctoo_ml_mall_yuyuemanage`
--

