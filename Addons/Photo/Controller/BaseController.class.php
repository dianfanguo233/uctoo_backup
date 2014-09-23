<?php

namespace Addons\Photo\Controller;

use Home\Controller\AddonsController;

class BaseController extends AddonsController {
	var $config;
	function _initialize() {
		$controller = strtolower ( _CONTROLLER );
		
		$res ['title'] = '微相册设置';
		$res ['url'] = addons_url ( 'Photo://Photo/config' );
		$res ['class'] = $controller == 'photo' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '微相册管理';
		$res ['url'] = addons_url ( 'Photo://Photo/lists' );
		$res ['class'] = $controller == 'photo' ? 'current' : '';
		$nav [] = $res;
						
		$this->assign ( 'nav', $nav );
		
		// dump ( $config );
		// dump(get_token());
		
		// 定义模板常量
		$act = strtolower ( _ACTION );
		$temp = $config ['template_' . $act];
		$act = ucfirst ( $act );
		
		define ( 'CUSTOM_TEMPLATE_PATH', ONETHINK_ADDON_PATH . 'Photo/View/default/Template');
	}
}
