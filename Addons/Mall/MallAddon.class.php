<?php

namespace Addons\Mall;
use Common\Controller\Addon;

/**
 * 微商城插件
 * @author daley
 */

    class MallAddon extends Addon{

        public $info = array(
            'name'=>'Mall',
            'title'=>'微商城',
            'description'=>'微商城为商家提供一个平台，在这个更简便的、方便的平台里进行更为现代的电子商务。同时在利用微信的这个平台也可以为商家提供更有效的宣传方式，更有利于商品的推广。',
            'status'=>1,
            'author'=>'daley',
            'version'=>'0.1',
            'has_adminlist'=>1,//daley:edit:
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Mall/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Mall/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }