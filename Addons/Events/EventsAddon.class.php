<?php

namespace Addons\Events;
use Common\Controller\Addon;

/**
 * 通用表单插件
 * @author uctoo
 */

    class EventsAddon extends Addon{

        public $info = array(
            'name'=>'Events',
            'title'=>'微活动',
            'description'=>'如活动介绍、报名、调查反馈、预约填单等',
            'status'=>1,
            'author'=>'uctoo',
            'version'=>'0.1',
            'has_adminlist'=>1,
            'type'=>1         
        );

	public function install() {
		$install_sql = './Addons/Events/install.sql';
		if (file_exists ( $install_sql )) {
			execute_sql_file ( $install_sql );
		}
		return true;
	}
	public function uninstall() {
		$uninstall_sql = './Addons/Events/uninstall.sql';
		if (file_exists ( $uninstall_sql )) {
			execute_sql_file ( $uninstall_sql );
		}
		return true;
	}

        //实现的weixin钩子方法
        public function weixin($param){

        }

    }