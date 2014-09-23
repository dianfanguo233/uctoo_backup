<?php

namespace Addons\Photo\Controller;

use Addons\Photo\Controller\BaseController;

class PicController extends BaseController {
	var $model;
	var $Uid;
    var $pid;
	function _initialize() {
		$this->model = $this->getModel ( 'photo_pic' );
		
		$param ['pid'] = $this->pid = intval ( $_REQUEST ['pid'] );
		
		$res ['title'] = '微相册';
		$res ['url'] = addons_url ( 'Photo://Photo/lists' );
		$res ['class'] = '';
		$nav [] = $res;
		
		$res ['title'] = '相册列表';
		$res ['url'] = addons_url ( 'Photo://Pic/lists', $param );
		$res ['class'] = 'current';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
	}
	// 通用插件的列表模型
	public function lists() {
		
		// 解析列表规则
		$data = $this->_list_grid ( $this->model );
		//dump ( $data );
		
		$this->assign ( $data );
		$this->assign ( 'pid',$this->pid);
		// 搜索条件
		$map = $this->_search_map ( $this->model, $data ['fields'] );
		
	    $map ['pid'] = $this->pid;
		//$data ['fields'] [] = 'sum(score) as total';
	    
		$name = parse_name ( get_table_name ( $this->model ['id'] ), true );
		$list = M ( $name )->where ( $map )->field ( $data ['fields'] )->order ( ' id DESC' )->selectPage ();
		foreach ( $list ['list_data'] as &$vo ) {
		//	$member = get_memberinfo ( $vo ['uid'] );

			if (! empty ( $vo ['pic'] ))
				$vo ['Photo'] = '<div class="upload-pre-item"  ><img src="' . get_picture_url ( $vo ['pic'] ) . '" width="50" height="50" /></div>';
		}
		
		$this->assign ( $list );
		
		$this->display ('Photo/piclists');
	}
	
	//通用插件的增加模型
      public function add() {
		$_POST ['token'] = get_token ();
		
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				$param ['pid'] = $this->pid;
				$param ['model'] = $this->model ['id'];
				$url = U ( 'lists', $param );
				$this->success ( '添加成功！', $url );
			} else {
				$this->error ( $Model->getError () );
			}
			exit ();
		}
		
		parent::common_add ( $this->model );
	}
	public function edit() {
		
		$id = I ( 'id' );
		
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $Model->save ()) {
				$param ['pid'] = $this->pid;
				$param ['model'] = $this->model ['id'];
				$url = U ( 'lists', $param );
				$this->success ( '保存' . $this->model ['title'] . '成功！', $url );
			} else {
				$this->error ( $Model->getError () );
			}
		}
		
		parent::common_edit ( $this->model );
	}
	// 通用插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}
}
