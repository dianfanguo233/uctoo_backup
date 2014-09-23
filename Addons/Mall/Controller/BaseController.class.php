<?php

namespace Addons\Mall\Controller;

use Home\Controller\AddonsController;

class BaseController extends AddonsController{	
	var $config;
	function _initialize() {
		parent::_initialize();
		
		$controller = strtolower ( _CONTROLLER );
		
		$res ['title'] = '基础设置';
				
		$res ['url'] = addons_url ( 'Mall://Mall/lists' );
		$res ['class'] = ($controller == 'mall'||$controller == 'dishes' ||$controller == 'dishestype' ||$controller == 'discounttype' ||$controller == 'attr' )? 'current' : '';
		$nav [] = $res;		
		
		$res ['title'] = '订单管理';
		$res ['url'] = addons_url ( 'Mall://Order/lists' );
		$res ['class'] = $controller == 'order' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '评论管理';
		$res ['url'] = addons_url ( 'Mall://Review/lists' );
		$res ['class'] = $controller == 'review' ? 'current' : '';
		$nav [] = $res;

		$this->assign ( 'nav', $nav );
		
		$config = getAddonConfig ( 'Mall' );
		$config ['cover_url'] = get_cover_url ( $config ['cover'] );
		$config ['background'] = get_cover_url ( $config ['background'] );
		$this->config = $config;
		$this->assign ( 'config', $config );
				
		// 定义模板常量
		$act = strtolower ( _ACTION );
		$temp = $config ['template_' . $act];
		$act = ucfirst ( $act );
		
		define ( 'CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . 'Mall/View/default/Template');
	}
}
