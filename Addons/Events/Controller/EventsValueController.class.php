<?php

namespace Addons\Events\Controller;

use Addons\Events\Controller\BaseController;
use Com\JsSdk;

class EventsValueController extends BaseController {
	var $model;
	var $events_id;
	function _initialize() {
		parent::_initialize ();
		
		$this->model = $this->getModel ( 'events_value' );
		
		$param ['events_id'] = $this->events_id = intval ( $_REQUEST ['events_id'] );
		
		$res ['title'] = '活动表单';
		$res ['url'] = addons_url ( 'Events://Events/lists' );
		$res ['class'] = '';
		$nav [] = $res;
		
		$res ['title'] = '数据管理';
		$res ['url'] = addons_url ( 'Events://EventsValue/lists', $param );
		$res ['class'] = 'current';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
	}
	
	// 活动插件的列表模型
	public function lists() {
		// 解析列表规则
		$fields [] = 'openid';
		$fields [] = 'cTime';
		$fields [] = 'events_id';
		
		$girds ['field'] [0] = 'openid';
		$girds ['title'] = 'OpenId';
		$list_data ['list_grids'] [] = $girds;
		
		$girds ['field'] [0] = 'cTime|time_format';
		$girds ['title'] = '增加时间';
		$list_data ['list_grids'] [] = $girds;
		
		$map ['events_id'] = $this->events_id;
		$attribute = M ( 'events_attribute' )->where ( $map )->order('sort asc, id asc')->select ();
		foreach ( $attribute as $vo ) {
			$girds ['field'] [0] = $fields [] = $vo ['name'];
			$girds ['title'] = $vo ['title'];
			$list_data ['list_grids'] [] = $girds;
			
			$attr [$vo ['name']] ['type'] = $vo ['type'];
			
			if ($vo ['type'] == 'radio' || $vo ['type'] == 'checkbox' || $vo ['type'] == 'select') {
				$extra = parse_config_attr ( $vo ['extra'] );
				if (is_array ( $extra ) && ! empty ( $extra )) {
					$attr [$vo ['name']] ['extra'] = $extra;
				}
			} elseif ($vo ['type'] == 'cascade') {
				$attr [$vo ['name']] ['extra'] = $vo ['extra'];
			}
		}
		
		$fields [] = 'id';
		$girds ['field'] [0] = 'id';
		$girds ['title'] = '操作';
		$girds ['href'] = '[EDIT]&events_id=[events_id]|编辑,[DELETE]&events_id=[events_id]|	删除';
		$list_data ['list_grids'] [] = $girds;
		
		$list_data ['fields'] = $fields;
		
		$param ['events_id'] = $this->events_id;
		$param ['model'] = $this->model ['id'];
		$add_url = U ( 'add', $param );
		$this->assign ( 'add_url', $add_url );
		
		// 搜索条件
		$map = $this->_search_map ( $this->model, $fields );
		
		$page = I ( 'p', 1, 'intval' );
		$row = 20;
		
		$name = parse_name ( get_table_name ( $this->model ['id'] ), true );
		$list = M ( $name )->where ( $map )->order ( 'id DESC' )->selectPage ();
		$list_data = array_merge ( $list_data, $list );
		
		foreach ( $list_data ['list_data'] as &$vo ) {
			$value = unserialize ( $vo ['value'] );
			foreach ( $value as $n => &$d ) {
				$type = $attr [$n] ['type'];
				$extra = $attr [$n] ['extra'];
				if ($type == 'radio' || $type == 'select') {
					if (isset ( $extra [$d] )) {
						$d = $extra [$d];
					}
				} elseif ($type == 'checkbox') {
					foreach ( $d as &$v ) {
						if (isset ( $extra [$v] )) {
							$v = $extra [$v];
						}
					}
					$d = implode ( ', ', $d );
				} elseif ($type == 'datetime') {
					$d = time_format ( $d );
				} elseif ($type == 'picture') {
					$d = get_cover_url ( $d );
				} elseif ($type == 'cascade') {
					$d = getCascadeTitle ( $d, $extra );
				}
			}
			
			unset ( $vo ['value'] );
			$vo = array_merge ( $vo, $value );
		}
		
		$this->assign ( $list_data );
		// dump ( $list_data );
		
		$this->display ();
	}
	
	// 活动插件的编辑模型
	public function edit() {
		$this->add ();
	}
	
	// 活动插件的增加模型
	public function add() {
		$id = I ( 'id', 0 );
		
		$events = M ( 'events' )->find ( $this->events_id );
		$events ['cover'] = ! empty ( $events ['cover'] ) ? get_cover_url ( $events ['cover'] ) : ADDON_PUBLIC_PATH . '/background.png';
		if($events ['map']){
			$mapPoint = json_decode ( $events ['map'], true );
			$events ['longitude'] = $mapPoint['longitude'];
			$events ['latitude'] = $mapPoint['latitude'];
		}
		$this->assign ( 'events', $events );


		if (! empty ( $id )) {
			$act = 'save';
			
			$data = M ( get_table_name ( $this->model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
			
			// dump($data);
			$value = unserialize ( htmlspecialchars_decode ( $data ['value'] ) );
			// dump($value);
			unset ( $data ['value'] );
			$data = array_merge ( $data, $value );
			
			$this->assign ( 'data', $data );
			// dump($data);
		} else {
			$act = 'add';
			if ($this->mid != 0 && $this->mid != '-1') {
				$map ['uid'] = $this->mid;
				$map ['events_id'] = $this->events_id;
				
				$data = M ( get_table_name ( $this->model ['id'] ) )->where ( $map )->find ();
				if ($data && $events ['jump_url']) {
					redirect ( $events ['jump_url'] );
				}
			}
		}
		
		// dump ( $events );
		
		$map ['events_id'] = $this->events_id;
		$map ['token'] = get_token ();
		$fields [1] = M ( 'events_attribute' )->where ( $map )->order ( 'sort asc, id asc' )->select ();

		//JSSDK
		$shareparam ['token'] = $map ['token'];
		$shareparam ['openid'] = get_openid ();
		$shareparam ['events_id'] = $this->events_id;
		$url = addons_url ( 'Events://EventsValue/add', $shareparam );
		$this->assign ( 'share_url', $url );

		$info = get_token_appinfo ( $token );

		$jssdk = new JSSDK($info ['appid'], $info ['secret']);
		$jssdk->debug = false;	//启用本地调试模式,将官方的两个json文件放到入口文件index.php同级目录即可!
		$signPackage = $jssdk->GetSignPackage();
		$this->assign ( 'info', $info );
		$this->assign ( 'signPackage', $signPackage );

		if (IS_POST) {
			foreach ( $fields [1] as $vo ) {
				$error_tip = ! empty ( $vo ['error_info'] ) ? $vo ['error_info'] : '请正确输入' . $vo ['title'] . '的值';
				$value = $_POST [$vo ['name']];
				if (($vo ['is_must'] && empty ( $value )) || (! empty ( $vo ['validate_rule'] ) && ! M()->regex ( $value, $vo ['validate_rule'] ))) {
					$this->error ( $error_tip );
					exit ();
				}

				$post [$vo ['name']] = $vo ['type'] == 'datetime' ? strtotime ( $_POST [$vo ['name']] ) : $_POST [$vo ['name']];
				unset ( $_POST [$vo ['name']] );
			}
			
			$_POST ['value'] = serialize ( $post );
			$act == 'add' && $_POST ['uid'] = $this->mid;
			// dump($_POST);exit;
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'], $fields [1] );
			
			if ($Model->create () && $res = $Model->$act ()) {
				// 增加积分
				add_credit ( 'events' );
				
				$param ['events_id'] = $this->events_id;
				$param ['id'] = $act == 'add' ? $res : $id;
				$param ['model'] = $this->model ['id'];
				$url = empty ( $events ['jump_url'] ) ? U ( 'edit', $param ) : $events ['jump_url'];
				
				$tip = ! empty ( $events ['finish_tip'] ) ? $events ['finish_tip'] : '提交成功，谢谢参与';
				$this->success ( $tip, $url, 5 );
			} else {
				$this->error ( $Model->getError () );
			}
			exit ();
		}
		
		$fields [1] [] = array (
				'is_show' => 4,
				'name' => 'events_id',
				'value' => $this->events_id
		);
		
		$this->assign ( 'fields', $fields );
		$this->meta_title = '新增' . $this->model ['title'];
		
		$this->display ( 'add' );
	}
	function detail() {
		$events = M ( 'events' )->find ( $this->events_id );
		$events ['cover'] = ! empty ( $events ['cover'] ) ? get_cover_url ( $events ['cover'] ) : ADDON_PUBLIC_PATH . '/background.png';
		$this->assign ( 'events', $events );
		
		$this->display ();
	}
	function map() {   //暂时没用此方法，先以弹出层实现
		$events = M ( 'events' )->find ( $this->events_id );
		$events ['cover'] = ! empty ( $events ['cover'] ) ? get_cover_url ( $events ['cover'] ) : ADDON_PUBLIC_PATH . '/background.png';
		if($events ['map']){
			$mapPoint = json_decode ( $events ['map'], true );
			$events ['longitude'] = $mapPoint['longitude'];
			$events ['latitude'] = $mapPoint['latitude'];
		}

		$this->assign ( 'events', $events );

		$this->display ();
	}
	// 活动插件的删除模型
	public function del() {
		parent::common_del ( $this->model );
	}
}
