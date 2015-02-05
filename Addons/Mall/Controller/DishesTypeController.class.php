<?php

namespace Addons\Mall\Controller;

use Addons\Mall\Controller\BaseController;

class DishesTypeController extends BaseController{	
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
		$res ['class'] = 'cur';
		$nav [] = $res;
		
		$res ['title'] = '优惠分类';
		$res ['url'] = addons_url ( 'Mall://DiscountType/lists' );
		$res ['class'] = '';
		$nav [] = $res;
		
		$res ['title'] = '属性管理';
		$res ['url'] = addons_url ( 'Mall://Attr/attrlist' );
		$res ['class'] = '';
		$nav [] = $res;
		
		$this->assign ( 'sub_nav', $nav );
	
	}
	
	
	protected $model;
	public function __construct() {
		parent::__construct ();
		$this->model = M ( 'Model' )->getByName ( 'ml_mall_dishes_type' );
		$this->model || $this->error ( '模型不存在！' );
		$this->assign ( 'model', $this->model );
	}
	/********************商品分类设置****************************/
	public function cpset(){
        $uid = get_mid();
        $isadmin = getPublicMax($uid);
		// 使用提示
		$normal_tips = '操作说明:<br/>&nbsp;&nbsp;1.选择您需要配置的商城<br/>&nbsp;&nbsp;2.左边为商品列表,右边商品分类已有的商品列表,蓝色部分为商品分类<br/>&nbsp;&nbsp;3.配置好后保存即可';
		$this->assign ( 'normal_tips', $normal_tips );
	
	
		$ctid = I("get.ctid",0, 'intval' );
		$token = get_token();
		
		//添加选择商城数据
        $cwhere = array("token"=>$token);
        if(!$isadmin) $cwhere['owner_id']=$uid;
		$ctdata = M ("ml_mall_set")->where ($cwhere)->order ( 'id asc' )->select ();//daley:2014.06.30:bak:->where (array("token"=>$token))
		$this->assign ( 'list_ctdata', $ctdata );
		//商城切换url
		$sel_ct_url = U('cpset?ctid={id}');
		$this->assign ( 'sel_ct_url', $sel_ct_url );

        if(!$isadmin) $map['owner_id']=$uid;
		$map ['token'] = $token;
		//默认取第一个商城的数据
		if($ctid == 0){
			$map ['setid'] = $ctdata[0]["id"];
			$ctid = $ctdata[0]["id"];
		}else{
			$map ['setid'] = $ctid;			
		}
		$this->assign ( 'ctid', $ctid );
		
		//查询商品分类信息
		$data = M ( "ml_mall_dishes_type" )->field ('id,name,setid,dishesdatas')->where ( $map )->order ( 'id DESC' )->select ();
		$newdata = array();
		foreach($data as $cx){
			//还原数据			
			$cx["dishesdatas"] = unserialize($cx["dishesdatas"]);			
			$newdata[] = $cx;			
		}
		$this->assign ( 'selType', json_encode($newdata));
		
		//查询商品
        $dwhere = array("token"=>$token);
        if(!$isadmin) $dwhere['owner_id']=$uid;
		$dishesdatas = M ("ml_mall_dishes")->field("id,`name`,dishes_num,introduction,paixu")->where ($dwhere)->order ( 'paixu desc' )->select();
		$this->assign ( 'dishesdatas', json_encode($dishesdatas));
		
		$this->display ( T ( 'Addons://Mall@default/DishesType/cpset' ) );		
	}
	
	//[postajax]
	public function savecx(){
		$token = get_token();		
		$cxdatas = I("post.cxdatas");
		$ctid = I("get.ctid",0, 'intval' );
		foreach($cxdatas as $cx){			
			 M ("ml_mall_dishes_type")->where(array("setid"=>$ctid,"id"=>$cx["cxid"]))->save(array("dishesdatas"=>serialize($cx["datas"])));			
		}
		echo "商品分类配置成功!";
	}
	
	/**********************商品分类管理******************************/
	
	/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		$token = get_token();
		$ctid = I("get.ctid",0, 'intval' );
		// 使用提示
		$normal_tips = '每个商城的商品分类单独设置，商品分类可以从已有的商城商品分类复制添加!';
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
        //->判断管理员权限
        $uid = get_mid();
        $isadmin = getPublicMax($uid);
        if(!$isadmin) $map['owner_id'] = $uid;
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
        $cwhere = array("token"=>$token);
        if(!$isadmin) $cwhere['owner_id'] = $uid;
		$ctdata = M ("ml_mall_set")->where ($cwhere)->order ( 'id asc' )->select ();//daley:2014.06.30:bak:->where (array("token"=>$token))
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
		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		
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
		
		
		$this->display ( T ( 'Addons://Mall@default/DishesType/lists' ) );		
	}
	
	//商城复制
	public function ctfz(){
		$from = I("post.from",0, 'intval' );
		$to = I("post.to",0, 'intval' );
		
		$token = get_token();
		//复制商品分类
		$dishestypedata_by_from = M ("ml_mall_dishes_type")->where (array("token"=>$token,"setid"=>$from))->order ( 'id asc' )->select();
		//不能自己复制自己
		if($from != $to){
			$newdishestype = M ("ml_mall_dishes_type");
			foreach($dishestypedata_by_from as $dishestype){			
				 $dishestype["setid"] = $to;			
				 unset($dishestype["id"]);
				 $newarray = $dishestype;				
				 $newdishestype->add($newarray);
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
		$ctid = I("get.ctid",0, 'intval' );	
		$this->assign ( 'ctid', $ctid );
		if (IS_POST) {
            //->判断管理员权限
            $uid = get_mid();
            $isadmin = getPublicMax($uid);
            if(!$isadmin){
                $owner_id = M(parse_name ( get_table_name ( $this->model ['id'] ), 1 ))->where(array('id'=>$id))->getField('owner_id');
                if($owner_id!=$uid) $this->error("您没有权限。");
            }

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
        //->判断管理员权限
        $uid = get_mid();
        $isadmin = getPublicMax($uid);
        if(!$isadmin){
            is_array($ids) ? $gid=$ids : $gid[]=$ids;
            foreach($gid as $id){
                $owner_id = M(parse_name ( get_table_name ( $this->model ['id'] ), 1 ))->where(array('id'=>$id))->getField('owner_id');
                if($owner_id!=$uid) $this->error("没有权限。");
            }
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
