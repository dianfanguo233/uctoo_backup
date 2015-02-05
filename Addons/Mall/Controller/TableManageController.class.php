<?php

namespace Addons\Mall\Controller;

use Addons\Mall\Controller\BaseController;

class TableManageController extends BaseController{	
	function _initialize() {
		parent::_initialize ();
		
		// 子导航	
		
		$res ['title'] = '商城设置';
		$res ['url'] = addons_url ( 'Mall://Mall/lists' );
		$nav [] = $res;		
			
		$res ['title'] = '商品管理';
		$res ['url'] = addons_url ( 'Mall://Dishes/lists' );
		
		$nav [] = $res;
		
		$res ['title'] = '商品分类';
		$res ['url'] = addons_url ( 'Mall://DishesType/lists' );
		
		$nav [] = $res;
		
		$res ['title'] = '优惠分类';
		$res ['url'] = addons_url ( 'Mall://DiscountType/lists' );
		
		$nav [] = $res;
		
		$res ['title'] = '属性管理';
		$res ['url'] = addons_url ( 'Mall://TableManage/attrlist' );
		$res ['class'] = 'cur';
		$nav [] = $res;
		
		$this->assign ( 'sub_nav', $nav );
	
	}

	protected $model;
	public function __construct() {
		parent::__construct ();
		$this->model = M ( 'Model' )->getByName ( 'ml_mall_tablemanage' );
		$this->model || $this->error ( '模型不存在！' );
		$this->assign ( 'model', $this->model );
	}
	/**********************属性管理******************************/
	public function attrlist(){
		$fields = array(
			array(
				'name'	=>	'name',
				'title'=>'属性'
			),
			array(
				'name'	=>	'title',
				'title'=>'属性名称'
			),
			array(
				'name'	=>	'desc',
				'title'=>'属性描述'
			),
		);
		$this->assign('fields',$fields);
		$lists = M('MlMallAttr')->select();
		$this->assign('lists',$lists);
		$this->display(T('Addons://Mall@default/TableManage/attrlist' ));
	}
	public function attradd(){
		$post = I('post.');
		if(empty($post)){
			$at = array('atype'=>'add','name'=>'添加属性');
			$this->assign('at',$at);
			$this->display(T('Addons://Mall@default/TableManage/attrinfo' ));
		}else{
			$m = M('MlMallAttr');
			$validate = array(
				array('name','/[A-Za-z0-9_]+/','属性名称不合法。',1,'regex ',1),
				);
			$d = $m->validate($validate)->create();
			if(!$d){
				$this->error($m->getError());
			}else{
				$r = $m->add();
				$r ? $this->success('添加成功。',U('attrlist')) : $this->error('添加失败。');
			}
		}
	}
	public function attredit(){
		$post = I('post.');
		if(empty($post)){
			$at = array('atype'=>'edit','name'=>'编辑属性');
			$this->assign('at',$at);
			$id = I('get.id',0,int);
			if(empty($id)) $this->error('请先选择要编辑的属性。');
			$info = M('MlMallAttr')->find($id);
			$this->assign('info',$info);
			$this->display(T('Addons://Mall@default/TableManage/attrinfo' ));
		}else{
			$m = M('MlMallAttr');
			$d = $m->create();
			if(!$d){
				$this->error($m->getError());
			}else{
				$r = $m->save();
				$r ? $this->success('修改成功。',U('attrlist')) : $this->error('修改失败。');
			}
		}
	}
	public function attrdel(){
		$ids = I('post.ids');
		if(empty($ids)) $this->error('请选择要删除的商品。');
		foreach ($ids as $id) {
			M('MlMallAttr')->where(array('id'=>$id))->delete();
		}
		$this->success('删除完毕。');
	}

	/**********************桌台管理******************************/
	
	/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		$token = get_token();
		$ctid = I("get.ctid",0, 'intval' );
		// 使用提示
		$normal_tips = '每个商城的桌台单独设置，桌台可以从已有的商城桌台复制添加!';
		$this->assign ( 'normal_tips', $normal_tips );
	
		$page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据		                                
		// 解析列表规则
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', $this->model ['list_grid'] );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复字段信息
		$fields = array_unique ( $fields );
		// 关键字搜索
		$map ['token'] = $token;
		$key = $this->model ['search_key'] ? $this->model ['search_key'] : 'title';
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
		$row = empty ( $this->model ['list_row'] ) ? 20 : $this->model ['list_row'];
		
		//添加选择商城数据
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token))->order ( 'id asc' )->select ();
		$this->assign ( 'list_ctdata', $ctdata );
		//商城切换url
		$sel_ct_url = U('lists?ctid={id}');
		$this->assign ( 'sel_ct_url', $sel_ct_url );
		
		
		//默认只取第一个商城的数据
		if($ctid == 0){
			$map ['setid'] = $ctdata[0]["id"];
			$ctid = $ctdata[0]["id"];
		}else{
			$map ['setid'] = $ctid;			
		}
		$this->assign ( 'ctid', $ctid );
		
		// 读取模型数据列表		
		empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
		$name = parse_name ( get_table_name ( $this->model ['id'] ), true );
		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )/*->where ( $map )*/->order ( 'id DESC' )->page ( $page, $row )->select ();
		
		/* 查询记录总数 */
		$count = M ( $name )->where ( $map )->count ();
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$this->assign ( '_page', $page->show () );
		}
		
		$this->assign ( 'list_grids', $grids );
		$this->assign ( 'list_data', $data );
		$this->meta_title = $this->model ['title'] . '列表';
		
		
		$this->display ( T ( 'Addons://Mall@default/TableManage/lists' ) );		
	}
	
	//商城复制
	public function ctfz(){
		$from = I("post.from",0, 'intval' );
		$to = I("post.to",0, 'intval' );
		
		$token = get_token();
		//复制桌台
		$TableManagedata_by_from = M ("ml_mall_tablemanage")->where (array("token"=>$token,"setid"=>$from))->order ( 'id asc' )->select();
		//不能自己复制自己
		if($from != $to){
			$newTableManage = M ("ml_mall_tablemanage");
			foreach($TableManagedata_by_from as $TableManage){			
				 $TableManage["setid"] = $to;			
				 unset($TableManage["id"]);
				 $newarray = $TableManage;				
				 $newTableManage->add($newarray);
			}
		}
		echo "复制成功!";
	}
	
	public function add() {	
		$ctid = I("get.ctid",0, 'intval' );
		if (IS_POST) {
			// 自动补充token
			$_POST ['token'] = get_token ();
			$_POST ['setid'] =  $ctid ;
			
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $micsetid = $Model->add ()) {					
				$this->success ( '添加' . $this->model ['title'] . '成功！', U ( 'lists?ctid='.$ctid ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			
			$micset_fields = get_model_attribute ( $this->model ['id'] );
			$this->assign ( 'fields', $micset_fields );
			
			$this->assign ( 'ctid', $ctid );
			
			$this->meta_title = '新增' . $this->model ['title'];
			$this->display ('add');			
		}
	}
	
	public function edit() {
		// 获取模型信息
		$id = I ( 'id', 0, 'intval' );			
		if (IS_POST) {
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $Model->save ()) {	
				$this->success ( '保存' . $this->model ['title'] . '成功！', U ( 'lists?ctid='.$ctid ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$fields = get_model_attribute ( $this->model ['id'] );			
			// 获取数据
			$data = M ( get_table_name ( $this->model ['id'] ) )->find ( $id );
			$data || $this->error ( '数据不存在！' );
						
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . $this->model ['title'];
			$this->display ( 'edit');
		}
	}
	
	public function del() {
		$ids = I ( 'id', 0 );
		if (empty ( $ids )) {
			$ids = array_unique ( ( array ) I ( 'ids', 0 ) );
		}
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		
		$Model = M ( get_table_name ( $this->model ['id'] ) );
		$map = array (
				'id' => array (
						'in',
						$ids 
				) 
		);
		$map ['token'] = get_token ();		
		
		if ($Model->where ( $map )->delete ()) {
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
}
