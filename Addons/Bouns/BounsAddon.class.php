<?php

namespace Addons\Bouns;
use Common\Controller\Addon;

/**
 * 微红包插件
 * @author uctoo
 */

    class BounsAddon extends Addon{

        public $info = array(
            'name'=>'Bouns',
            'title'=>'微红包',
            'description'=>'微红包配合粉丝圈子，打造粉丝互动的运营激励基础',
            'status'=>1,
            'author'=>'uctoo',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Bouns/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Bouns/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }