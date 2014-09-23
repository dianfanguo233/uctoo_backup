<?php
return array(
	'description'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'预约回复模板',//表单的文字
		'type'=>'textarea',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>"在线预约有惊喜哦！\n请选择预约项目：\n\n[预约项目]\n\n电话预约：<a href='tel:13888888888'>13888888888</a>\n\n店铺地址：\n店铺详细地址",			 //表单的默认值
	),
	'item'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'预约项目:',//表单的文字
		'type'=>'textarea',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>"项目1\n项目2",			 //表单的默认值
	),
	'market'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'预约门店:',//表单的文字
		'type'=>'textarea',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>"门店1\n门店2",			 //表单的默认值
	),
	'notice'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'预约页面底部提示:',//表单的文字
		'type'=>'textarea',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>"请提前1天预约\n预约电话：<a href='tel:13888888888'>13888888888</a>\n\n店铺地址：\n店铺详细地址",			 //表单的默认值
	),

	'noData'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'查询无预约时回复内容',//表单的文字
		'type'=>'textarea',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>"您目前没有预约。",			 //表单的默认值
	),
);
