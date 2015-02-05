<?php

namespace Addons\YuYue\Controller;
use Home\Controller\AddonsController;

class YuYueController extends AddonsController{

	//后台查看预约列表
	public function lists(){
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		                                
		// 关键字搜索
		$map ['token'] = get_token ();
		$key = $this->model ['search_key'] ? $this->model ['search_key'] : 'name';
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
		$name = 'yuyue';

		//查询数据
		$data = M ( $name )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		// echo("<pre>");
		// print_r($data);
		// die();
		/* 查询记录总数 */
		$count = M ( $name )->where ( $map )->count ();
		
		// 获取相关的用户信息
		$uids = getSubByKey ( $data, 'openid' );
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
		$this->display ();
	}

	//后台查看预约详情并添加备忘
	public function view(){
		if(IS_POST){

			$memo = I('post.memo');

			$where['id'] = I('post.id',0,'int');
			$where['token'] = get_token();

			$res = M('yuyue')->where($where)->setField('memo',$memo);

			if($res){
    			redirect ( addons_url ( 'YuYue://YuYue/lists' ) );
			} else {
				$this->error('保存失败!');
			}

		}
		$map['token'] = get_token ();
		$map['id'] = I('get.id',0,'int');
		$rec = M('yuyue')->where($map)->select();
		if($rec){
			$this->assign('data',$rec[0]);
		}
		$this->display();
	}

	//微信提交预约资料
	public function form(){
		if(IS_POST){

			$token = get_token ();
			$openid = get_openid ();

			$item = I('post.item');
			$market = I('post.market');
			$name = I('post.name');
			$phone = I('post.phone');
			$number = I('post.number',0,'int');
			$remark = I('post.remark');

			if(empty($name)){
				$this->error('请输入联系人!');
			}

			if(empty($phone)){
				$this->error('请输入手机!');
			}
			
			$yTime_date = I('post.yTime');
			$temp1 = explode("-",$yTime_date); 
			$yTimeHour = I('post.yTimeHour');
			$yTimeMin = I('post.yTimeMin');
			$yTime = mktime($yTimeHour,$yTimeMin,0,$temp1[1],$temp1[2],$temp1[0]);

			$data['token'] = $token;
			$data['openid'] = $openid;
			$data['item'] = $item;
			$data['market'] = $market;
			$data['name'] = $name;
			$data['phone'] = $phone;
			$data['number'] = $number;
			$data['yTime'] = $yTime;
			$data['cTime'] = time();
			$data['item'] = $item;
			$data['remark'] = $remark;
			$data['status'] = 1;

			$res = M('yuyue')->add($data);
			if($res)
			{
    			redirect ( addons_url ( 'YuYue://YuYue/mylists' ) );
			}
			else
			{
				$this->error('提交失败!');
			}

		}

		//获取配置
		$config = getAddonConfig ( 'YuYue' ); 
		$desc = str_replace("\n", "<br>", $config['description']);
		$items = explode("\n",$config['item']);
		$markets = explode("\n",$config['market']);
		$notice = str_replace("\n", "<br>", $config['notice']);

		$item_i = I('get.item');

		foreach ($items as &$item) {
			$item = trim($item);
		}
		foreach ($markets as &$market) {
			$market = trim($market);
		}

		$this->assign('desc', $desc);
		$this->assign('items', $items);
		$this->assign('markets', $markets);
		$this->assign('items', $items);
		$this->assign('notice', $notice);
		$this->assign('item_i', $item_i);

		$this->display();
	}

	//用户查询最近10条预约
	public function mylists(){

		$map ['token'] = get_token ();
		$map ['openid'] = get_openid ();
		$data = M ( 'yuyue' )->where ( $map )->order ( 'id DESC' )->limit(10)->select();

		$this->assign('list_data',$data);
		$this->display();
	}

}
