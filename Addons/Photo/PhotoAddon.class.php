<?php

namespace Addons\Photo;
use Common\Controller\Addon;

/**
 * 微相册插件
 * @author xiaodu
 */

    class PhotoAddon extends Addon{

        public $info = array(
            'name'=>'Photo',
            'title'=>'微相册',
            'description'=>'为用户提供图片的存储和展示服务，在微相册里，您可以方便的创建相册，轻松地发布您需要展示的照片，还可以拓展为商家开展活动的一种展现方式。',
            'status'=>1,
            'author'=>'张尼玛',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Photo/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Photo/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }