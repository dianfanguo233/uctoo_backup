<?php

namespace Addons\Events\Controller;

use Home\Controller\AddonsController;

class EventsController extends AddonsController {

	var $model;
	function _initialize() {
		$this->model = $this->getModel ( 'events' );
		parent::_initialize ();
	}

	function events_attribute() {
		$param ['events_id'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Events://EventsAttribute/lists', $param );
		// dump($url);
		redirect ( $url );
	}
	function events_value() {
		$param ['events_id'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Events://EventsValue/lists', $param );
		// dump($url);
		redirect ( $url );
	}
	function events_export() {
	}
	function preview() {
		$param ['events_id'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Events://EventsValue/add', $param );
		// dump($url);
		redirect ( $url );
	}
	// 获取所属分类
	function getCateData() {
		$map ['is_show'] = 1;
		$map ['token'] = get_token ();
		$list = M ( 'weisite_category' )->where ( $map )->select ();
		foreach ( $list as $v ) {
			$extra .= $v ['id'] . ':' . $v ['title'] . "\r\n";
		}

		return $extra;
	}

	// 活动插件的编辑模型
	public function edit() {
		$model = $this->model;
		$id = I ( 'id' );

		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $Model->save ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'events' );

				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );

			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields [1] as &$vo ) {
					if ($vo ['name'] == 'cate_id') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}

			// 获取数据
			$data = M ( get_table_name ( $model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );

			$token = get_token ();
			if (isset ( $data ['token'] ) && $token != $data ['token'] && defined ( 'ADDON_PUBLIC_PATH' )) {
				$this->error ( '非法访问！' );
			}

			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . $model ['title'];

			$this->display ();
		}
	}

	public function add() {
		$model = $this->model;
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );

		if (IS_POST) {
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {
				D ( 'Common/Keyword' )->set ( $_POST ['keyword'], _ADDONS, $id, $_POST ['keyword_type'], 'events' );

				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );

			$extra = $this->getCateData ();
			if (! empty ( $extra )) {
				foreach ( $fields [1] as &$vo ) {
					if ($vo ['name'] == 'cate_id') {
						$vo ['extra'] .= "\r\n" . $extra;
					}
				}
			}

			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增' . $model ['title'];

			$this->display ();
		}
	}


}
