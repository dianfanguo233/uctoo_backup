<?php
return array(
	'random'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'签到积分模式:',//表单的文字
		'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
		'options'=>array(		 //select 和radion、checkbox的子选项
			'1'=>'固定积分',		 //值=>文字
			'0'=>'随机积分',
		),
		'value'=>'1',			 //表单的默认值
	),
	'score'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'固定签到积分:',//表单的文字
		'type'=>'text',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>'1',		 //表单的默认值
	),
	'score1'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'随机积分下限:',//表单的文字
		'type'=>'text',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>'1',		 //表单的默认值
	),
	'score2'=>array(//配置在表单中的键名 ,这个会是config[random]
		'title'=>'随机积分上限:',//表单的文字
		'type'=>'text',		 //表单的类型：text、textarea、checkbox、radio、select等
		'value'=>'2',		 //表单的默认值
	),
);