<?php

namespace Addons\Mall\Controller;

use Addons\Mall\Controller\BaseController;

class DishesController extends BaseController{	
	function _initialize() {
		parent::_initialize ();
		
		// 子导航	
		
		$res ['title'] = '商城设置';
		$res ['url'] = addons_url ( 'Mall://Mall/lists' );
		$nav [] = $res;		
			
		$res ['title'] = '商品管理';
		$res ['url'] = addons_url ( 'Mall://Dishes/lists' );
		$res ['class'] = 'cur';
		$nav [] = $res;
		
		$res ['title'] = '商品分类';
		$res ['url'] = addons_url ( 'Mall://DishesType/lists' );
		$res ['class'] = '';
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
		$this->model = M ( 'Model' )->getByName ( 'ml_mall_dishes' );
		$this->model || $this->error ( '模型不存在！' );
		$this->assign ( 'model', $this->model );
	}
	
/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		// 使用提示
		$normal_tips = '多个分店可以共用商品';
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
		// 关键字搜索//daley:2014.06.30:bak:
		$map ['token'] = get_token ();
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
		
		// 读取模型数据列表
		
		empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
		$name = parse_name ( get_table_name ( $this->model ['id'] ), true );
		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		foreach ($data as $key => $val) {
			$data[$key]['icon'] = '<img src="' . M('Picture')->where(array('id'=>$val['icon']))->getField('path').'" height="50" />';
		}

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
		$this->display ( T ( 'Addons://Mall@default/Dishes/lists' ) );
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
				$this->success ( '添加' . $this->model ['title'] . '成功！', U ( 'lists' ) );
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
                //判断并删除未关联的属性值
                $attrid = I('post.attr');
                if(!empty($attrid)){
                    $atds = explode(',',$attrid);
                    M('ml_mall_attr_value')->where(array('gid'=>intval($_POST['id']),'aid'=>array('not in',$atds)))->delete();
                }
				$this->success ( '保存' . $this->model ['title'] . '成功！', U ( 'lists' ) );
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
	//增加，调用属性
	public function getattr(){
        $uid = get_mid();
        $isadmin = getPublicMax($uid);
        $where['token']=get_token();
        if(!$isadmin) $where['owner_id'] = $uid;
		$data = M('MlMallAttr')->where($where)->select();
		$this->ajaxReturn($data);
	}

    public function attr(){
        $prex = C('DB_PREFIX');
        $id = I('get.id',0,int);
		//S:daley:2014.07.06:取商品信息
		$proModel = M('ml_mall_dishes')->where(array('id'=>$id));
		$proInfo = $proModel->select();
		//print_r($proInfo);exit;
		$normal_tips = "对商品（ID：{$id}，".$proInfo[0]['name']."）进行属性管理";
		$this->assign ( 'normal_tips', $normal_tips );
		//End
        $attrid = $proModel->getField('attr');
        $aids = explode(',',$attrid);
        $this->assign('aids',$aids);
        //权限
        $uid = get_mid();
        $isadmin = getPublicMax($uid);
        $where['a.token']=get_token();
        $where['v.gid']=$id;
        if(!$isadmin) $where['a.owner_id'] = $uid;
        $attr = M('MlMallAttr as a')
            ->join('right join '.$prex.'ml_mall_attr_value as v on v.aid=a.id')
            ->join('left join '.$prex.'picture as p on v.icon=p.id')
            ->field('a.*,a.id as aid,v.id as id,v.value,v.price,v.thumbnail,p.path as icon')
            ->where($where)
            ->select();
        $this->assign('gid',$id);
        $this->assign('list_data',$attr);
        $this->display();
    }
    public function attradd(){
        $post = I('post.');
        if(empty($post)){
            $gid = I('get.gid',0,int);
            $aids = M('ml_mall_dishes')->where(array('id'=>$gid))->getField('attr');
            if(!empty($aids)) $aids=explode(',',$aids);
            //权限
            $uid = get_mid();
            $isadmin = getPublicMax($uid);
            $map['token']=get_token();
            if(!$isadmin) $map['owner_id'] = $uid;
            if(!empty($aids)) $map['id'] = array('in',$aids);
            $attr = M('MlMallAttr')->where($map)->select();
            $tp = array(
                'title' => '添加属性',
                'gid' => $gid,
                'attr' => $attr,
            );
            $this->assign('tp',$tp);
            $this->display('attrinfo');
        }else{
            $m = M('MlMallAttrValue');
            $validate = array(
                array('gid','require','没有选择任何商品。'),
                array('value','require','属性值不能为空。'),
                array('price','/^\-?[0-9]+(\.[0-9]{1,2})?$/','属性价格变动只能为2位的(负)小数。如：10.10 或 -10.10',2,'regex',3),
            );
            $d = $m->validate($validate)->create();
            if(!$d){
                $this->error($m->getError());
            }else{
                $r = $m->add();
                $r ? $this->success('添加成功。',U('attr','id='.$post['gid'])) : $this->error('添加失败。');
            }
        }
    }
    public function attredit(){
        $post = I('post.');
        if(empty($post)){
            $id = I('get.id',0,int);
            $info = M('ml_mall_attr_value')->find($id);
            $aids = M('ml_mall_dishes')->where(array('id'=>$info['gid']))->getField('attr');
            if(!empty($aids)) $aids=explode(',',$aids);
            //权限
            $uid = get_mid();
            $isadmin = getPublicMax($uid);
            $map['token']=get_token();
            if(!$isadmin) $map['owner_id'] = $uid;
            if(!empty($aids)) $map['id'] = array('in',$aids);
            $attr = M('MlMallAttr')->where($map)->select();
            $tp = array(
                'title' => '编辑属性',
                'gid' => $info['gid'],
                'attr' => $attr,
            );
            $this->assign('tp',$tp);
            $this->assign('info',$info);
            $this->display('attrinfo');
        }else{
            $m = M('ml_mall_attr_value');
            $validate = array(
                array('gid','require','没有选择任何商品。'),
                array('value','require','属性值不能为空。'),
                array('price','/^\-?[0-9]+(\.[0-9]{1,2})?$/','属性价格变动只能为2位的(负)小数。如：10.10 或 -10.10',2,'regex',3),
            );
            $d = $m->validate($validate)->create();
            if(!$d){
                $this->error($m->getError());
            }else{
                $r = $m->save();
                $r ? $this->success('修改成功。',U('attr','id='.$post['gid'])) : $this->error('修改失败。');
            }
        }
    }
    public function attrdel(){
        $ids = I('request.ids');
        if(empty($ids)) $this->error('请选择要删除的属性。');
        if(!is_array($ids)) $ids = array($ids);
        foreach ($ids as $id) {
            M('ml_mall_attr_value')->where(array('id'=>$id))->delete();
        }
        $this->success('删除完毕。');
    }
}