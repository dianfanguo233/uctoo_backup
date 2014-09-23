<?php

namespace Addons\SingIn\Controller;
use Home\Controller\AddonsController;

class SingInController extends AddonsController{

 function lists(){
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		
		// 关键字搜索
		$map ['token'] = get_token ();
		$key = $this->model ['search_key'] ? $this->model ['search_key'] : 'uid';
		if (isset ( $_REQUEST [$key] )) {
			$map [$key] = array (
					'like',
					'%' . htmlspecialchars ( $_REQUEST [$key] ) . '%' 
			);
			unset ( $_REQUEST [$key] );
		}

		// 条件搜索
		foreach ( $_REQUEST as $name => $val ) {
			if (in_array ( $name, $fields )) {
				$map [$name] = $val;
			}
		}

		// 读取模型数据列表		
		$row = 20;
		$name = 'signin_log';

		//查询数据
		$data = M ( $name )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		/* 查询记录总数 */
		$count = M ( $name )->where ( $map )->count ();
		
		// 获取相关的用户信息
		$uids = getSubByKey ( $data, 'uid' );
		$uids = array_filter ( $uids );
		$uids = array_unique ( $uids );
		if (! empty ( $uids )) {
			$map ['openid'] = array (
					'in',
					$uids 
			);
			$map ['token'] = get_token();
			$members = M ( 'follow' )->where ( $map )->field ( 'id,openid,nickname,mobile' )->select ();
			foreach ( $members as $m ) {
				$user [$m ['openid']] = $m;
			}
			foreach ( $data as &$vo ) {
				$vo ['user_id'] = $user [$vo ['uid']] ['id'];
				$vo ['mobile'] = $user [$vo ['uid']] ['mobile'];
				$vo ['nickname'] = $user [$vo ['uid']] ['nickname'];
			}
		}

		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$this->assign ( '_page', $page->show () );
		}

		$this->assign ( 'list_data', $data );
		$this->meta_title = $this->model ['title'] . '列表';
		$this->display ( T ( 'Addons://SingIn@SingIn/lists' ) );
 }
}