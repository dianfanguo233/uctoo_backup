<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {
     protected $CartGoods;
	 function _initialize(){
        parent::_initialize();		
        $prex = C('DB_PREFIX');
        define('PREX', $prex);
        $sid = cookie('sid');
        define('SID', $sid);
        $shop = M('MlMallSet')->select();
        $this->assign('shop',$shop);
        $this->assign('sid',$sid);
        $this->assign('shop_title','商城');
        //购物车
        /*$CartGoods = getcartgoods();
		//echo '<pre>';print_r($CartGoods);exit;
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);*/
        //echo $sid;
    }
	// 系统首页
	public function index() {
        redirect ( U ( 'home/index/main' ) );
	}
    public function hello() {
        $this->display ();
    }
	// 系统介绍
	public function introduction() {
		$this->display ();
	}
	// 系统下载
	public function download() {
		$this->display ();
	}
	// 系统帮助
	public function help() {
		if (isset ( $_GET ['public_id'] )) {
			$map ['id'] = intval ( $_GET ['public_id'] );
			$info = M ( 'member_public' )->where ( $map )->find ();
			$this->assign ( 'token', $info ['token'] );
		} else {
			$this->assign ( 'token', '你的公众号的Token' );
		}
		$this->display ();
	}
	// 系统关于uctoo
	public function about() {
		$this->display ();
	}
    // 系统关于uct
    public function aboutus() {
        $this->display ();
    }
    // 加入我们
    public function jobs() {
        $this->display ();
    }
    // 品牌导购
    public function brand() {
        $this->display ();
    }


    public function brands() {

        $issues = M(Issue);
        $map['pid']  = array('neq',0);

       $issueData = $issues->where($map)->select();

        $this->assign('issueData',$issueData);

        $brands = M()->query("select a.id,a.title,a.issue_id,b.path from ".PREX."issue_content a,".PREX."avatar b where a.status=1 and a.uid=b.uid ORDER BY a.issue_id");
        $map1['status']  = array('eq',1);

        $this->assign('brands',$brands);

        $this->display ();
    }

    // 品牌导购
    public function floors() {
        $this->display ();
    }
	//daley:add:2014.07.20:商城首页
	public function shopindex(){
		//取商家列表
		$shopsTmp=M()->query("select a.id,a.token,a.intro,a.title,a.kfname,b.public_name,c.path from ".PREX."ml_mall_set a,".PREX."member_public b,".PREX."picture c where a.token=b.token and a.cover=c.id");
		foreach($shopsTmp as $k=>$v){
			$shops[$v['token']][]=$v;
		}
		//echo '<pre>';print_r($shops);exit;
		//End
		$this->assign('shops',$shops);
		$this->display();		
	}
	//daley:add:2014.07.20:商店详情页
	public function shopdetail(){
        //商品ID
        $id=intval($_GET['id']);
        if($id==0)
            $cue='商店ID格式错误！';
		else{
			$shopInfo=M('ml_mall_set as a')->join(PREX.'picture as p ON a.cover=p.id')->where(array('a.id'=>$id))->limit(1)->select();
            if(empty($shopInfo))
                $cue='商店ID不存在！';
			else{
				$shopInfo=$shopInfo[0];
				//daley:token:设置token
				get_token($shopInfo['token']);
				$shop_title=$shopInfo['title'].'-商城';
				$this->assign('id',$id);
				$this->assign('shop_title',$shop_title);
				$this->assign('shopInfo',$shopInfo);					
			}
			//echo '<pre>';print_r($shopInfo);
		}
		//exit;
        $this->assign('cue',$cue);
		$CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);
        $this->display();			
	}

    //patrick:add:2014.07.15:移动端商店详情页
    public function shopdt(){
        //商品ID
        $id=intval($_GET['id']);
        if($id==0)
            $cue='商店ID格式错误！';
        else{
            $shopInfo=M('ml_mall_set as a')->join(PREX.'picture as p ON a.cover=p.id')->where(array('a.id'=>$id))->limit(1)->select();
            if(empty($shopInfo))
                $cue='商店ID不存在！';
            else{
                $shopInfo=$shopInfo[0];
                //daley:token:设置token
                get_token($shopInfo['token']);
                $shop_title=$shopInfo['title'].'-商城';
                $this->assign('id',$id);
                $this->assign('shop_title',$shop_title);
                $this->assign('shopInfo',$shopInfo);
            }
            //echo '<pre>';print_r($shopInfo);
        }
        //exit;
        $this->assign('cue',$cue);
        $CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);


        //S:取商店中的商品
        $proIdsInShopId=M('ml_mall_dishes_type')->where(array('setid'=>$id))->getField('id,dishesdatas');

        //var_dump($proIdsInShopId);
        foreach($proIdsInShopId as $k=>$v){
            $proIdsInShopId[$k]=unserialize($v);
            $proIdsInShopId[$k]=implode(',',$proIdsInShopId[$k]);
        }
        $proIdsInShopId=explode(',',implode(',',$proIdsInShopId));

        $where['d.id']=array('in',$proIdsInShopId);

        //获取产品
        //$products = M("MlMallDishes as d");
        $pdData = M('MlMallDishes as d')->where($where)->select();
        $pics =M()->query("select * from ".PREX."picture p");
            //M()->query("select d.*,p.path as icon from ".PREX."picture p,".PREX."ml_mall_dishes d where d.id in $proIdsInShopId and d.icon=p.id");
          $this->assign('Products',$pdData);
        $this->assign('pics',$pics);

        //商品ID
        $id=intval($_REQUEST['id']);
        if($id==0){//daley:continue:人性化提示
            $cue='商店ID格式错误！';
            die($cue);
        }
        $shopInfo=M('ml_mall_set')->where(array('id'=>$id))->limit(1)->select();
        if(empty($shopInfo)){
            $cue='商店ID不存在！';
            die($cue);
        }
        $shopInfo=$shopInfo[0];
        //价格筛选
        $amount = I('post.amount');
        $this->assign('amount',$amount);
        if(!empty($amount)){
            preg_match_all('/￥([0-9]+).*￥([0-9]+)/', $amount, $matches);
            $price_min = $matches[1][0];
            $price_max = $matches[2][0];
            //daley:2014.06.30:add:筛选后赋值
            $this->assign('price_min',$price_min);
            $this->assign('price_max',$price_max);
        }
        else{//daley:2014.06.30:add:筛选后赋值
            $this->assign('price_min',0);
            $this->assign('price_max',500);
        }
        //产品分类
        $prex = C('DB_PREFIX');
        $category = M('MlMallDishesType as m')->join(PREX.'ml_mall_set as s on m.setid=s.id')->field('m.*,s.title')->where("s.id={$id} and m.state=0 and m.token='".get_token()."'")->select();
        //var_dump($category);exit;
        $pids = array();
        foreach ($category as $key => $cate) {
            //$pid = unserialize($cate['dishesdatas']);
            $cats[$cate['setid']]['name'] = $cate['title'];
            $cats[$cate['setid']]['cate'][] = array(
                'name'  =>  $cate['name'],
                'url'   =>  U('shoppdlist','cid='.$cate['id']),
            );
            // $cats[$cate['setid']][$key]['dishesdatas'] = $pid;
            // $cats[$cate['setid'][$key]['url']	= U('shoppdlist','cid='.$cate['id']);
            //if(!empty($pid)) $pids=array_merge($pids,$pid);
        }
        $this->assign('Categorys',$cats);
        //查询条件
        $orderby = I('post.orderby','paixu asc');
        $this->assign('orderby',$orderby);
        $where = array('d.state' => 0,'d.token' => get_token());
        $where['d.price'][] = array('egt',intval($price_min));
        if(!empty($price_max)){
            $where['d.price'][] = array('elt',intval($price_max));
            $where['d.price'][] = 'and';
        }
        //S:取商店中的商品
        $proIdsInShopId=M('ml_mall_dishes_type')->where(array('setid'=>$id))->getField('id,dishesdatas');
        //var_dump($proIdsInShopId);
        foreach($proIdsInShopId as $k=>$v){
            $proIdsInShopId[$k]=unserialize($v);
            $proIdsInShopId[$k]=implode(',',$proIdsInShopId[$k]);
        }
        $proIdsInShopId=explode(',',implode(',',$proIdsInShopId));
        //var_dump($proIdsInShopId);
        $where['d.id']=array('in',$proIdsInShopId);
        //exit;
        //End
        //获取分页等参数
        $page['num'] = 12;
        $page['allnum'] = M('MlMallDishes as d')->join($prex.'picture as p ON d.icon=p.id')->where($where)->count();
        //var_dump($page['allnum']);
        $page['now'] = I('get.p',1,int);
        $page['allpage'] = ceil($page['allnum']/$page['num']);
        for($i=0;$i<$page['allpage'];$i++){
            if($i<9){
                $page['show'][] = U('','p='.($i+1));
            }
        }
        if($page['allpage']>10){
            $page['lastpage'] = U('','p='.$page['allpage']);
        }
        $this->assign('page',$page);
        //获取产品
        $products = M('MlMallDishes as d')
            ->join($prex.'picture as p ON d.icon=p.id')
            ->field('d.*,p.path as icon')
            ->where($where)
            ->order('d.'.$orderby)
            ->limit(($page['now']-1)*$page['num'],$page['num'])
            ->select();
        foreach ($products as $key => $good) {
            $products[$key]['price'] = number_format($good['price'],2,'.','');
            //daley:bak:2014.7.11:$products[$key]['url'] = U('shopproduct','id='.$good['id']);
            $products[$key]['url'] = "index.php?s=/addon/Mall/Mall/cpinfo/ctid/{$id}/cpid/".$good['id'].".html";
                                     ///index.php?s=/addon/Mall/Mall/cpinfo/ctid/{$ctid}/cpid/{$cp.id}.html
            if($good['featured']) $featured[] = $products[$key];
            //S:取商品属性
            //$tmp=M('ml_mall_attr_value')->where("gid={$id} and aid in(".$pt['attr'].")")->select();
            $attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.desc,b.name,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$good['id']." and a.aid=b.id and b.token='".get_token()."'");
            foreach($attrs_tmp as $k=>$v){
                $attrs[$v['aid']][]=$v;
            }
            //print_r($attrs);
            //S:区分可选择属性和固定属性
            foreach($attrs as $k=>$v){
                //可选择属性
                if(count($v)>=2){
                    $attrs1[$v[0]['aid']]=$v;
                }
                //固定属性
                /*elseif(count($v)==1){
                    $attrs2[$v[0]['aid']]=$v[0];
                }*/
            }
            $products[$key]['attrs1']=$attrs1;
            unset($attrs1);
            unset($attrs);
            //echo '<pre>';print_r($attrs1);print_r($attrs2);exit;
            //End
            //End
        }
        //daley:debug:
        //echo '<pre>';print_r($products);exit;
        $shop_title=$shopInfo['title'].'-商城';
        $this->assign('shop_title',$shop_title);
        $this->assign('id',$id);
        $this->assign('featured',$featured);
        $this->assign('Products',$products);
        $CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);
        $this->display();
    }

    // 切换商城
    public function qiehuan(){
    	$sid = I('get.sid',0,int);
    	cookie('sid',$sid);
    	$this->ajaxReturn('1');
    }
    //搜索页面//搜索商品//daley:continue:
    public function search(){
        $prex = PREX;
        $search = I('post.search');
        $orderby = I('post.orderby','paixu');
        $where['d.state'] = 0;
        if(!empty($search)) $where['d.name'] = array('like','%'.$search.'%');
        $this->assign('search',$search);
        $this->assign('orderby',$orderby);
        //获取分页等参数
        $page['num'] = 12;
        $page['allnum'] = M('MlMallDishes as d')->join($prex.'picture as p ON d.icon=p.id')->where($where)->count();
        $page['now'] = I('get.p',1,int);
        $page['allpage'] = ceil($page['allnum']/$page['num']);
        for($i=0;$i<$page['allpage'];$i++){
            if($i<9){
                $page['show'][] = U('','p='.($i+1));
            }
        }
        if($page['allpage']>10){
            $page['lastpage'] = U('','p='.$page['allpage']);
        }
        $this->assign('page',$page);
        //获取产品
        $products = M('MlMallDishes as d')
                    ->join($prex.'picture as p ON d.icon=p.id')
                    ->field('d.*,p.path as icon')
                    ->where($where)
                    ->order('d.'.$orderby)
                    ->limit(($page['now']-1)*$page['num'],$page['num'])
                    ->select();
        foreach ($products as $key => $good) {
            $products[$key]['price'] = number_format($good['price'],2,'.','');
            $products[$key]['url'] = U('shopproduct','id='.$good['id']);
            //if($good['featured']) $featured[] = $products[$key];
			//S:取商品属性
			//$tmp=M('ml_mall_attr_value')->where("gid={$id} and aid in(".$pt['attr'].")")->select();
			$attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.desc,b.name,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$good['id']." and a.aid=b.id and b.token='".get_token()."'");	
			foreach($attrs_tmp as $k=>$v){
				$attrs[$v['aid']][]=$v;
			}
			//print_r($attrs);
			//S:区分可选择属性和固定属性
			foreach($attrs as $k=>$v){
				//可选择属性
				if(count($v)>=2){
					$attrs1[$v[0]['aid']]=$v;	
				}
				//固定属性
				/*elseif(count($v)==1){
					$attrs2[$v[0]['aid']]=$v[0];
				}*/
			}			
			$products[$key]['attrs1']=$attrs1;
			unset($attrs1);
			unset($attrs);
			//echo '<pre>';print_r($attrs1);print_r($attrs2);exit;
			//End			
        }
        //$this->assign('featured',$featured);
        $this->assign('Products',$products);
		//$this->productcols();
		$CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);	        
        $this->display('shoppdlist');		
    }
    // 商城产品列表
    public function shoppdlist() {
    	$prex = C('DB_PREFIX');
    	//分类产品ID
    	$cid = I('get.cid',0,int);
		if($cid==0)//daley:continue:友好提示
			die('商品分类ID格式错误！');
    	//daley:bak:2014.07.11:$pid = M('MlMallDishesType')->where('id='.$cid." and token='".get_token()."'")->getField('dishesdatas');
		$clsInfo = M('MlMallDishesType')->where('id='.$cid)->limit(1)->getField('id,setid,dishesdatas,token');
		$clsInfo=$clsInfo[$cid];
		if(empty($clsInfo))
			die('商品分类ID不存在！');
		//daley:token:设置token
		get_token($clsInfo['token']);
		$sid=$clsInfo['setid'];
		$this->assign('sid',$sid);//商店ID
		//exit;
    	$pids = unserialize($clsInfo['dishesdatas']);
    	$this->assign('cid',$cid);
    	//查询条件
    	$orderby = I('post.orderby','paixu');
    	$this->assign('orderby',$orderby);
    	$where = array('d.id'=>array('in',$pids),'d.state' => 0,'d.token' => get_token());
    	//获取分页等参数
    	$page['num'] = 12;
    	$page['allnum'] = M('MlMallDishes as d')->join($prex.'picture as p ON d.icon=p.id')->where($where)->count();
    	$page['now'] = I('get.p',1,int);
    	$page['allpage'] = ceil($page['allnum']/$page['num']);
    	for($i=0;$i<$page['allpage'];$i++){
    		if($i<9){
    			$page['show'][] = U('','p='.($i+1));
    		}
    	}
    	if($page['allpage']>10){
    		$page['lastpage'] = U('','p='.$page['allpage']);
    	}
    	$this->assign('page',$page);
    	//获取产品
    	$products = M('MlMallDishes as d')
    				->join($prex.'picture as p ON d.icon=p.id')
    				->field('d.*,p.path as icon')
    				->where($where)
    				->order('d.'.$orderby)
    				->limit(($page['now']-1)*$page['num'],$page['num'])
    				->select();
    	foreach ($products as $key => $good) {
    		$products[$key]['price'] = number_format($good['price'],2,'.','');
			//daley:bak:2014.7.11:$products[$key]['url'] = U('shopproduct','id='.$good['id']);
			$products[$key]['url'] = "/index.php?s=/Home/Index/shopproduct/sid/{$sid}/id/".$good['id'].".html";
    		//if($good['featured']) $featured[] = $products[$key];
			//S:取商品属性
			//$tmp=M('ml_mall_attr_value')->where("gid={$id} and aid in(".$pt['attr'].")")->select();
			$attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.desc,b.name,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$good['id']." and a.aid=b.id and b.token='".get_token()."'");	
			foreach($attrs_tmp as $k=>$v){
				$attrs[$v['aid']][]=$v;
			}
			//print_r($attrs);
			//S:区分可选择属性和固定属性
			foreach($attrs as $k=>$v){
				//可选择属性
				if(count($v)>=2){
					$attrs1[$v[0]['aid']]=$v;	
				}
				//固定属性
				/*elseif(count($v)==1){
					$attrs2[$v[0]['aid']]=$v[0];
				}*/
			}			
			$products[$key]['attrs1']=$attrs1;
			unset($attrs1);
			unset($attrs);
			//echo '<pre>';print_r($attrs1);print_r($attrs2);exit;
			//End
    	}
		//var_dump($sid);exit;
    	//$this->assign('featured',$featured);
    	$this->assign('Products',$products);
		$this->productcols($sid);
		$CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);
        $this->display();
    }
    // 商城产品侧边栏/商店商品
    public function shopsidebar() {
        //商品ID
        $id=intval($_REQUEST['id']);
        if($id==0){//daley:continue:人性化提示
            $cue='商店ID格式错误！';
			die($cue);
		}
		$shopInfo=M('ml_mall_set')->where(array('id'=>$id))->limit(1)->select();
		if(empty($shopInfo)){
			$cue='商店ID不存在！';	
			die($cue);
		}
		$shopInfo=$shopInfo[0];
    	//价格筛选
    	$amount = I('post.amount');
        $this->assign('amount',$amount);
    	if(!empty($amount)){
            preg_match_all('/￥([0-9]+).*￥([0-9]+)/', $amount, $matches);
	    	$price_min = $matches[1][0];
	    	$price_max = $matches[2][0];
			//daley:2014.06.30:add:筛选后赋值
			$this->assign('price_min',$price_min);
			$this->assign('price_max',$price_max);
    	}
		else{//daley:2014.06.30:add:筛选后赋值
			$this->assign('price_min',0);
			$this->assign('price_max',500);			
		}
    	//产品分类
    	$prex = C('DB_PREFIX');
    	$category = M('MlMallDishesType as m')->join(PREX.'ml_mall_set as s on m.setid=s.id')->field('m.*,s.title')->where("s.id={$id} and m.state=0 and m.token='".get_token()."'")->select();
		//var_dump($category);exit;
    	$pids = array();
    	foreach ($category as $key => $cate) {
    		//$pid = unserialize($cate['dishesdatas']);
            $cats[$cate['setid']]['name'] = $cate['title'];
    		$cats[$cate['setid']]['cate'][] = array(
                'name'  =>  $cate['name'],
                'url'   =>  U('shoppdlist','cid='.$cate['id']),
            );
            // $cats[$cate['setid']][$key]['dishesdatas'] = $pid;
    		// $cats[$cate['setid'][$key]['url']	= U('shoppdlist','cid='.$cate['id']);
    		//if(!empty($pid)) $pids=array_merge($pids,$pid);
    	}
    	$this->assign('Categorys',$cats);
    	//查询条件
    	$orderby = I('post.orderby','paixu asc');
    	$this->assign('orderby',$orderby);
    	$where = array('d.state' => 0,'d.token' => get_token());
    	$where['d.price'][] = array('egt',intval($price_min));
    	if(!empty($price_max)){
            $where['d.price'][] = array('elt',intval($price_max));
            $where['d.price'][] = 'and';
        }
		//S:取商店中的商品
		$proIdsInShopId=M('ml_mall_dishes_type')->where(array('setid'=>$id))->getField('id,dishesdatas');
		//var_dump($proIdsInShopId);
		foreach($proIdsInShopId as $k=>$v){
			$proIdsInShopId[$k]=unserialize($v);
			$proIdsInShopId[$k]=implode(',',$proIdsInShopId[$k]);
		}
		$proIdsInShopId=explode(',',implode(',',$proIdsInShopId));
		//var_dump($proIdsInShopId);
		$where['d.id']=array('in',$proIdsInShopId);		
		//exit;
		//End
    	//获取分页等参数
    	$page['num'] = 12;
    	$page['allnum'] = M('MlMallDishes as d')->join($prex.'picture as p ON d.icon=p.id')->where($where)->count();
    	//var_dump($page['allnum']);
        $page['now'] = I('get.p',1,int);
    	$page['allpage'] = ceil($page['allnum']/$page['num']);
    	for($i=0;$i<$page['allpage'];$i++){
    		if($i<9){
    			$page['show'][] = U('','p='.($i+1));
    		}
    	}
    	if($page['allpage']>10){
    		$page['lastpage'] = U('','p='.$page['allpage']);
    	}
    	$this->assign('page',$page);
    	//获取产品
    	$products = M('MlMallDishes as d')
    				->join($prex.'picture as p ON d.icon=p.id')
    				->field('d.*,p.path as icon')
    				->where($where)
    				->order('d.'.$orderby)
    				->limit(($page['now']-1)*$page['num'],$page['num'])
    				->select();
    	foreach ($products as $key => $good) {
    		$products[$key]['price'] = number_format($good['price'],2,'.','');
    		//daley:bak:2014.7.11:$products[$key]['url'] = U('shopproduct','id='.$good['id']);
			$products[$key]['url'] = "/index.php?s=/Home/Index/shopproduct/sid/{$id}/id/".$good['id'].".html";
    		if($good['featured']) $featured[] = $products[$key];
			//S:取商品属性
			//$tmp=M('ml_mall_attr_value')->where("gid={$id} and aid in(".$pt['attr'].")")->select();
			$attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.desc,b.name,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$good['id']." and a.aid=b.id and b.token='".get_token()."'");	
			foreach($attrs_tmp as $k=>$v){
				$attrs[$v['aid']][]=$v;
			}
			//print_r($attrs);
			//S:区分可选择属性和固定属性
			foreach($attrs as $k=>$v){
				//可选择属性
				if(count($v)>=2){
					$attrs1[$v[0]['aid']]=$v;	
				}
				//固定属性
				/*elseif(count($v)==1){
					$attrs2[$v[0]['aid']]=$v[0];
				}*/
			}			
			$products[$key]['attrs1']=$attrs1;
			unset($attrs1);
			unset($attrs);
			//echo '<pre>';print_r($attrs1);print_r($attrs2);exit;
			//End					
			//End			
    	}
		//daley:debug:
		//echo '<pre>';print_r($products);exit;
		$shop_title=$shopInfo['title'].'-商城';
		$this->assign('shop_title',$shop_title);
		$this->assign('id',$id);
    	$this->assign('featured',$featured);
    	$this->assign('Products',$products);
		$CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);
        $this->display();
    }
    // ajax获取产品对应的商店
    public function getshops(){
        $goods_id = I('post.id',0,int);
        if(empty($goods_id)) $result=0;
        $shopid = getShopClsIdByProId($goods_id,1);
        $result = M('ml_mall_set')->field('id,title')->where(array('id'=>array('in',$shopid)))->select();
        $this->ajaxReturn($result);
    }
    // 商城产品购物车
    public function shopcart() {
        $act = I('get.act','show');
        if($act=='show'){
            //购物车页面
			//daley:bak:$this->productcols();
			//daley:continue:取商城名称
			$CartGoods = getcartgoods();
			$this->CartGoods = $CartGoods;
			$this->assign('CartGoods',$CartGoods);			
            $this->display();
        }elseif($act=='update'){
            //更新购物车商品
            $post = I('post.');
            //daley:bak:2014.07.11:$cartGoods = cookie('shopcart');
			$cartGoods = cookie('shopcart');
			//echo '<pre>';print_r($post);print_r($cartGoods);//exit;
            foreach ($cartGoods as $k => $v) {
                $cartGoods[$k] = json_decode($v,true);
				//print_r($cartGoods[$k]);exit;
				//daley:add:if:2014.07.11:因为多个商城的购物车存在于同一个cookie
				if(isset($post['goods_'.$cartGoods[$k]['id'].'_'.$cartGoods[$k]['slt_attrids']])){
					if(!preg_match("/^\d+$/",$post['goods_'.$cartGoods[$k]['id'].'_'.$cartGoods[$k]['slt_attrids']])) $this->error('商品数量格式错误。');
					$cartGoods[$k]['num']=$post['goods_'.$cartGoods[$k]['id'].'_'.$cartGoods[$k]['slt_attrids']];
				}
            }
			//print_r($cartGoods);
			//exit;
			/*echo '<pre>';
			print_r($post);
			print_r($cartGoods);*/
			//exit;
            /*daley:bak:foreach ($post as $key => $num) {
                if(preg_match('/^goods_/', $key)){
                    $gs = explode('_', $key);
                    foreach ($cartGoods as $key => $val) {
                        if($val['id']==$gs[1] and $val['slt_attrids']=$gs[2]){
                            $cartGoods[$key]['num'] = $num;
                        }
                    }
                }
            }*/
			/*foreach($cartGoods as $k=>$v){
				$cartGoods[$k]['num']=$post['goods_'.$v['id'].'_'.$v['slt_attrids']];
			}*/
			//print_r($cartGoods);
			//exit;
            foreach ($cartGoods as $key => $val) {
                $cartGoods[$key] = json_encode($val);
            }
            cookie('shopcart',$cartGoods);
            $this->success('购物车更新成功!',U('shopcart'));
        }elseif($act=='del'){
            //删除购物车商品
            $id = I('get.id',0,int);
			$slt_attrids=I('slt_attrids');//属性IDS
            if(empty($id)) $this->error('请先选择要删除的购物车商品。');
			//daley:add:$slt_attrids!=''——是因为商品可能没有可选择属性
			if($slt_attrids!='' and (!preg_match("/^(\d+,)*\d+$/",$slt_attrids))) $this->error('购物车商品属性错误。');
			$cartGoods = cookie('shopcart');
            foreach ($cartGoods as $key => $g) {
                $g = json_decode($g,true);
                if($g['id']==$id and $g['slt_attrids']==$slt_attrids) unset($cartGoods[$key]);
            }
            cookie('shopcart',$cartGoods);
            $CartGoods = getcartgoods();
            IS_AJAX ? $this->ajaxReturn($CartGoods) : $this->success('商品删除成功。');
        }elseif($act=='add'){
            //添加商品
            $addid = I('post.id',0,int);//商品ID
            $addsid = I('post.sid',0,int);//商店ID
			$slt_attrids=I('slt_attrids');//属性IDS
			//S:处理$slt_attrids
			$slt_attrids=explode(',',$slt_attrids);
			sort($slt_attrids);
			$slt_attrids=implode(',',$slt_attrids);
			//End
            $result = array('status'=>false,'info'=>'购物车添加商品失败。');
            if(!empty($addid) && !empty($addsid)){
                $has = false;
                $cartGoods = cookie('shopcart');
				//var_dump($cartGoods);
                foreach ($cartGoods as $g) {
                    $g = json_decode($g,true);
					//var_dump($g);
					//购物车已存在该商品的判断还应该加上属性
                    if($g['id']==$addid and $g['slt_attrids']==$slt_attrids) $has=true;
                }
				//echo 'aa';
				//exit;
                if(!$has){//如果未添加商品
                    $cartGoods[] = json_encode(array('id'=>$addid,'sid'=>$addsid,'slt_attrids'=>$slt_attrids,'num'=>1,'token'=>get_token()));					
                    cookie('shopcart',$cartGoods);
					//var_dump($cartGoods);exit;
                    $result = array('status'=>true,'info'=>'购物车添加商品成功。');
                    $result['goods'] = getcartgoods();//返回Ajax调用                
				}else{
                    $result = array('status'=>false,'info'=>'购物车已存在该商品。');
                }
            }
            IS_AJAX ? $this->ajaxReturn($result) : $this->success($result['info']);
        }
    }
    // 商城产品支付
    public function shoppay() {
        //$str = 'a:1:{i:13;a:12:{s:2:"id";s:2:"13";s:5:"token";s:15:"gh_3ee44a31f642";s:4:"name";s:9:"油辣子";s:10:"dishes_num";s:3:"001";s:4:"icon";s:3:"372";s:12:"introduction";s:16:"<p>非常霜</p>";s:5:"price";s:2:"17";s:12:"review_count";s:1:"0";s:5:"paixu";s:1:"0";s:5:"state";s:1:"0";s:8:"youhuiid";s:1:"0";s:3:"num";i:4;}}';
        //$str = unserialize($str);
        //print_r($str);
        $post = I('post.');
		$CartGoods = getcartgoods();
		$this->CartGoods = $CartGoods;
        if(!empty($post)){
            $cart = cookie('shopcart');
            if(empty($cart)) $this->error('购物车没有商品。',U('shopindex'));
            //接收用户数据
            foreach ($post as $key => $value) {
                $k = explode('_', $key);
                if($k[0]=='user'){
                    //user表数据
                    $userinfo[$k[1]] = $value;
                }elseif($k[0]=='order'){
                    //order表数据
                    $orderinfo[$k[1]] = $value;
                }
            }
            if(empty($userinfo['truename'])) $this->error('收货人信息不能为空。');
            if(empty($userinfo['tel'])) $this->error('联系电话不能为空。');
            if(empty($userinfo['address'])) $this->error('收货地址不能为空。');
            //生成订单号
            $dcnum = 'sn'.microtime(true)*10000;
            //购物车商品信息
            foreach ($this->CartGoods as $key => $good) {
                if(empty($good['id'])) continue;
                $goods[$good['sid']][] = array(
                        'id'    =>  $good['id'],
                        'name' => $good['name'],
                        'price' => $good['price'],
                        'icon' => $good['icon'],
                        'num' => $good['num'],
                        'allprice' => $good['allprice']
                    );
            }
            //组合order表通用数据
            $orderinfo['dcnum'] = $dcnum;
            $orderinfo['ctime'] = date('Y-m-d H:i:s');
            $orderinfo['state'] = '已下单';
            $orderinfo['cpcount'] = $this->CartGoods['allnum'];
            //组合订单数据并入库
            foreach ($goods as $is => $gs) {
                //组合users表数据
                $userinfo['set_id'] = $is;
				//daley:加入token
				$userinfo['token']=get_token();
                $contactid = M('ml_mall_users')->add($userinfo);
                if(empty($contactid)) continue;
                //订单合并入库
                $price = 0; //优惠前总价
                $cpcount = 0; //商品总数量
                foreach ($gs as $i => $g) {
                    $price += $g['allprice'];
                    $cpcount += $g['num'];
                }
                $orderinfo['set_id'] = $is;
                $orderinfo['yhprice'] = $price; //优惠后的总价
                $orderinfo['price'] = $price;
                $orderinfo['cpcount'] = $cpcount;
                $orderinfo['contactid'] = $contactid; //收货信息关联ID
                $orderinfo['dishes_count_datas'] = serialize($gs);//商品信息
				$orderinfo['token']=get_token();
                M('ml_mall_order')->add($orderinfo);
            }
            //daley:bak:2014.07.11://cookie('shopcart',null);
			foreach ($cartGoods as $k => $v) {
                $v = json_decode($v,true);
                if($v['token']==get_token()) unset($cartGoods[$k]);
            }
			cookie('shopcart',$cartGoods);
            $this->success('订单已成功提交。',U('shopindex'));
        }
        $this->assign('CartGoods',$CartGoods);
        $this->display ();
    }
    // 商城产品详情
    public function shopproduct() {
		//var_dump($_GET);exit;        
        $id=intval($_GET['id']);//商品ID
		$sid=intval($_GET['sid']);//商店ID
        if($id==0)
            $cue='商品ID格式错误！';
		elseif($sid==0)
			$cue='商店ID格式错误！';
        else{
			$shopInfo=M('ml_mall_set')->where(array('id'=>$sid))->limit(1)->select();
			if(empty($shopInfo)){
				$cue='商店ID不存在！';	
				//die($cue);
			}
			else{
				$shopInfo=$shopInfo[0];
				//daley:token:设置token
				get_token($shopInfo['token']);		
				$pt = M ( 'ml_mall_dishes' )->where (array('id'=>$id,'token'=>get_token()))->limit(1)->select ();
				//var_dump($pt);exit;
				if(empty($pt))
					$cue='商品ID不存在！';    
				else{
					$pt=$pt[0];
					$shop_ids=getShopClsIdByProId($id);
					if(empty($shop_ids))
						$cue='商品ID暂未指定商家！';
					else{
						//print_r($shop_ids);exit;
						if(!in_array($sid,$shop_ids))
							$cue='商品ID不属于商家ID！';
						else{
							//取上一条
							$prev_item=M('ml_mall_dishes')->where("id<{$id} and token='".get_token()."'")->order('id desc')->limit(1)->getField('id,id,name');
							$prev_item=array_values($prev_item);
							//取下一条
							$next_item=M('ml_mall_dishes')->where("id>{$id} and token='".get_token()."'")->order('id asc')->limit(1)->getField('id,id,name');
							$next_item=array_values($next_item);
							//取商家（供货商）列表
							$shops=M('ml_mall_set')->where("id in(".implode(",",$shop_ids).") and token='".get_token()."'")->getField('id,title');
							//取商品图片
							$pt['path'] = M ( 'picture' )->where (array('id'=>$pt['icon']))->limit(1)->getField('path');
							//取商品属性//daley:建议属性名称和属性别名统一成一个
							//daley:2014.07.06:bak:
							/*$pt['attr']=json_decode($pt['attr'],true);
							$mallattrs = M('ml_mall_attr')->select();
							$attrs = array();
							foreach ($mallattrs as $key => $attr) {
								$attrs[$attr['name']] = $attr['title'];
							}
							*/
							//S:取商品属性
							//$tmp=M('ml_mall_attr_value')->where("gid={$id} and aid in(".$pt['attr'].")")->select();
							$attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.desc,b.name,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid={$id} and a.aid=b.id and b.token='".get_token()."'");					
							//echo '<pre>';print_r($attrs_tmp);exit;
							foreach($attrs_tmp as $k=>$v){
								$attrs[$v['aid']][]=$v;
							}
							//print_r($attrs);
							//S:区分可选择属性和固定属性
							foreach($attrs as $k=>$v){
								//可选择属性
								if(count($v)>=2){
									$attrs1[$v[0]['aid']]=$v;	
								}
								//固定属性
								elseif(count($v)==1){
									$attrs2[$v[0]['aid']]=$v[0];
								}
							}
							//echo '<pre>';print_r($attrs1);print_r($attrs2);exit;
							//End					
							//End
							//var_dump($pt);exit;
							$pt['price'] = number_format($pt['price'],2,'.','');
							//获取商品属性;attr
							$this->assign('id',$id);
							$this->assign('sid',$sid);
							$this->assign('attrs1',$attrs1);
							$this->assign('attrs2',$attrs2);
							$this->assign ( 'pt', $pt );                    
							$this->assign ( 'shops', $shops );
							$this->assign ( 'prev_item', $prev_item );
							$this->assign ( 'next_item', $next_item );
							$this->assign ( 'shop_title', $pt['name'].'-商城');
						}
					}
				}
			}
        }
        $this->assign ( 'cue', $cue );
		$this->productcols($sid);
		$CartGoods = getcartgoods();
        $this->CartGoods = $CartGoods;
        $this->assign('CartGoods',$CartGoods);
        $this->display ();
    }
	// 授权协议
	public function license() {
		$this->display ();
	}
	// 下载UCToo
	public function downloadFile() {
		M ( 'config' )->where ( 'name="DOWNLOAD_COUNT"' )->setInc ( 'value' );
		redirect ( 'http://www.uctoo.com/Uploads/Download/uctoo.zip' );
	}
	// 远程获取最新版本号
	public function update_version() {
		die ( M ( 'update_version' )->getField ( "max(`version`)" ) );
	}
	// 远程获取升级包信息
	public function update_json() {
		$old_version = intval ( $_REQUEST ['version'] );
		$new_version = M ( 'update_version' )->getField ( "max(`version`)" );
		
		$res = array ();
		if ($old_version < $new_version) {
			$res = M ( 'update_version' )->field ( 'version,title,description,create_date' )->where ( 'version>' . $old_version )->select ();
		}
		
		die ( json_encode ( $res ) );
	}
	// 下载升级包
	public function download_update_package() {
		$map ['version'] = intval ( $_REQUEST ['version'] );
		$package = M ( 'update_version' )->where ( $map )->getField ( 'package' );
		if (empty ( $package )) {
			$this->error ( '下载的文件不存在或已被移除' );
		}
		M ( 'update_version' )->where ( $map )->setInc ( 'download_count' );
		
		redirect ( $package );
	}
	public function main() {
		if (! is_login ()) {
			Cookie ( '__forward__', $_SERVER ['REQUEST_URI'] );
			$url = U ( 'home/user/login' );
			redirect ( $url );
		}
		$page = I ( 'p', 1, 'intval' );
		
		// 关键字搜索
		$map ['type'] = 1;
		$key = 'title';
		if (isset ( $_REQUEST [$key] )) {
			$map [$key] = array (
					'like',
					'%' . $_REQUEST [$key] . '%' 
			);
			unset ( $_REQUEST [$key] );
		}
		
		$row = 15;
		
		$data = M ( 'addons' )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();
		$token_status = D ( 'Common/AddonStatus' )->getList ( true );
		
		foreach ( $data as $k => &$vo ) {
			if ($token_status [$vo ['name']] === '-1') {
				unset ( $data [$k] );
				// $vo ['status_title'] = '无权限';
				// $vo ['action'] = '';
				// $vo ['color'] = '#CCC';
				// $vo ['status'] = 0;
			} elseif ($token_status [$vo ['name']] === 0) {
				$vo ['status_title'] = '已禁用';
				$vo ['action'] = '启用';
				$vo ['color'] = '#CCC';
				$vo ['status'] = 0;
			} else {
				$vo ['status_title'] = '已启用';
				$vo ['action'] = '禁用';
				$vo ['color'] = '';
				$vo ['status'] = 1;
			}
		}
		
		/* 查询记录总数 */
		$count = M ( 'addons' )->where ( $map )->count ();
		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$this->assign ( '_page', $page->show () );
		}
		
		$this->assign ( 'list_data', $data );
		
		$res ['title'] = '插件管理';
		$res ['url'] = U ( 'main' );
		$res ['class'] = 'current';
		$nav [] = $res;
		
		$this->assign ( 'nav', $nav );
		$this->display ();
	}
	function setStatus() {
		$addon = I ( 'addon' );
		$token_status = D ( 'Common/AddonStatus' )->getList ();
		if ($token_status [$addon] === '-1') {
			$this->success ( '无权限设置' );
		}
		
		$status = 1 - I ( 'status' );
		$res = D ( 'Common/AddonStatus' )->set ( $addon, $status );
		$this->success ( '设置成功' );
	}
	
	// 宣传页面
	function leaflets() {
		$name = 'Leaflets';
		$config = array ();
		
		$map ['token'] = I ( 'get.token' );
		$addon_config = M ( 'member_public' )->where ( $map )->getField ( 'addon_config' );
		$addon_config = json_decode ( $addon_config, true );
		if (isset ( $addon_config [$name] )) {
			$config = $addon_config [$name];
			
			$config ['img'] = is_numeric ( $config ['img'] ) ? get_cover_url ( $config ['img'] ) : SITE_URL . '/Addons/Leaflets/View/default/Public/qrcode_default.jpg';
			$this->assign ( 'config', $config );
		} else {
			$this->error ( '请先保存宣传页的配置' );
		}
		define ( 'ADDON_PUBLIC_PATH', ONETHINK_ADDON_PATH . 'Leaflets/View/default/Public' );
		
		$this->display ( SITE_PATH . '/Addons/Leaflets/View/default/Leaflets/show.html' );
	}
	
		// 定时任务调用入口
	function cron() {
		D ( 'Home/Cron' )->run ();
		echo date ( 'Y-m-d H:i:s' ) . "\r\n";
	}

	//daley:2014.06.30:取特色/精品推荐、最新上架、热卖商品、随机推荐//daley:add:2014.07.11:$sid:商家ID
	function productcols($sid){
		//S:取商店中的商品
		$proIdsInShopId=M('ml_mall_dishes_type')->where(array('setid'=>$sid))->getField('id,dishesdatas');
		//var_dump($proIdsInShopId);
		foreach($proIdsInShopId as $k=>$v){
			$proIdsInShopId[$k]=unserialize($v);
			$proIdsInShopId[$k]=implode(',',$proIdsInShopId[$k]);
		}
		$proIdsInShopId=implode(',',$proIdsInShopId);
		//var_dump($proIdsInShopId);
		//$where['d.id']=array('in',$proIdsInShopId);		
		//exit;
		//End
		//获取特色/精品推荐
		$products = M('MlMallDishes as d')
				->join(PREX.'picture as p ON d.icon=p.id')
				->field('d.*,p.path as icon')
				->where("d.id in({$proIdsInShopId}) and d.featured=1 and d.state=0 and d.token='".get_token()."'")
				->order('d.paixu')
				->limit('8')
				->select();
		foreach ($products as $key => $good) {
			$products[$key]['price'] = number_format($good['price'],2,'.','');
    		//daley:bak:2014.7.11:$products[$key]['url'] = U('shopproduct','id='.$good['id']);
			$products[$key]['url'] = "/index.php?s=/Home/Index/shopproduct/sid/{$sid}/id/".$good['id'].".html";			
		}
		$this->assign('featured',$products);
		//最新产品
		$newgoods = M('MlMallDishes as d')
					->join(PREX.'picture as p ON d.icon=p.id')
					->field('d.*,p.path as icon')
					->where("d.id in({$proIdsInShopId}) and d.state=0 and d.token='".get_token()."'")
					->order('d.id desc')
					->limit(3)
					->select();
		foreach ($newgoods as $key => $good) {
			$newgoods[$key]['price'] = number_format($good['price'],2,'.','');
			//daley:bak:2014.7.11:$newgoods[$key]['url'] = U('shopproduct','id='.$good['id']);
			$newgoods[$key]['url'] = "/index.php?s=/Home/Index/shopproduct/sid/{$sid}/id/".$good['id'].".html";	
		}
		$this->assign('newgoods',$newgoods);
		//热门推荐
		$hotgoods = M('MlMallDishes as d')
					->join(PREX.'picture as p ON d.icon=p.id')
					->field('d.*,p.path as icon')
					->where("d.id in({$proIdsInShopId}) and d.state=0 and d.token='".get_token()."'")
					->order('d.paixu desc')
					->limit(3)
					->select();
		foreach ($hotgoods as $key => $good) {
			$hotgoods[$key]['price'] = number_format($good['price'],2,'.','');
			//daley:bak:2014.7.11:$hotgoods[$key]['url'] = U('shopproduct','id='.$good['id']);
			$hotgoods[$key]['url'] = "/index.php?s=/Home/Index/shopproduct/sid/{$sid}/id/".$good['id'].".html";
		}
		$this->assign('hotgoods',$hotgoods);
		//随机推荐
		$suijigoods = M('MlMallDishes as d')
					->join(PREX.'picture as p ON d.icon=p.id')
					->field('d.*,p.path as icon')
					->where("d.id in({$proIdsInShopId}) and d.state=0 and d.token='".get_token()."'")
					->order('rand()')
					->limit(3)
					->select();
		foreach ($suijigoods as $key => $good) {
			$suijigoods[$key]['price'] = number_format($good['price'],2,'.','');
			//daley:bak:2014.7.11:$suijigoods[$key]['url'] = U('shopproduct','id='.$good['id']);
			$suijigoods[$key]['url'] = "/index.php?s=/Home/Index/shopproduct/sid/{$sid}/id/".$good['id'].".html";
		}
		$this->assign('suijigoods',$suijigoods);		
	}
}
//daley:add:根据商品ID取商店ID或分类ID（$t:1，取商店ID；2，取分类ID）
function getShopClsIdByProId($proid,$t=1){
    $tmp=M('ml_mall_dishes_type')->getField('id,setid,dishesdatas');
    //print_r($tmp);//exit;
    foreach($tmp as $k=>$v){
        $tmp[$k]['dishesdatas']=unserialize($v['dishesdatas']);
        if(in_array($proid,$tmp[$k]['dishesdatas'])){
            if($t==1)
                $ids[]=$v['setid'];
            elseif($t==2)
                $ids[]=$v['id'];
        }
    }
    //print_r($tmp);exit;
    return $ids;
}

//获取购物车内的商品信息//daley:continue:所有商城的购物车公用的一个cookie（用token区分）
function getcartgoods(){
    $cksc = cookie('shopcart');
	//print_r($cgds);//exit;
	$cgds=array();
    foreach ($cksc as $k => $v) {
        $temp = json_decode($v,true);
		if($temp['token']==get_token()){
			$cgds[]=$temp;
			if(!empty($temp['id'])) $gids[]=$temp['id'];
		}		
    }
    $goodsInfo = M('MlMallDishes as d')
                ->join(PREX.'picture as p ON d.icon=p.id')                
                ->where(array('d.state'=>'0','d.id'=>array('in',$gids),'token'=>get_token()))
				->getField('d.id,d.name,d.price,p.path as icon');
	foreach($cgds as $k=>$v){
		$cgds[$k]=array_merge($v,$goodsInfo[$v['id']]);
		$allnum += intval($cgds[$k]['num']);//总数量
		//S:选择了属性的情况下，校正价格
		//$CartGoods[$key]['price'] = $slt_attrids[$good['id']];
		//$ckPrice=M()->query("select sum(price) as ck_price from ".PREX."ml_mall_attr_value where id in(".$cgds[$k]['slt_attrids'].") limit 0,1");
		//$ckPrice=$ckPrice[0]['ck_price'];
		$attrsTmp=M('ml_mall_attr_value')->where("id in(".$cgds[$k]['slt_attrids'].")")->getField('id,value,price');
		//print_r($attrsTmp);exit;
		$ckPrice=0;
		foreach($attrsTmp as $kk=>$vv){
			$ckPrice+=floatval($vv['price']);
			$cgds[$k]['ori_attr'].=','.$vv['value'];
		}
		$cgds[$k]['ori_attr']=substr($cgds[$k]['ori_attr'],1);
		$cgds[$k]['attr']="<span title='".$cgds[$k]['ori_attr']."'>".mb_substr($cgds[$k]['ori_attr'],0,6,'utf8')."</span>";
		$cgds[$k]['price']=floatval($cgds[$k]['price'])+$ckPrice;
		$cgds[$k]['allprice']=$cgds[$k]['price']*intval($cgds[$k]['num']);
		$allprice+=$cgds[$k]['allprice'];
		//End
		$cgds[$k]['price']=number_format($cgds[$k]['price'],2,'.','');
		$cgds[$k]['allprice']=number_format($cgds[$k]['allprice'],2,'.','');
		$allprice=number_format($allprice,2,'.','');
        //daley:bak:2014.07.11:$cgds[$k]['url']=U('shopproduct','id='.$cgds[$k]['id']);
		$cgds[$k]['url']="/index.php?s=/Home/Index/shopproduct/sid/".$cgds[$k]['sid']."/id/".$cgds[$k]['id'].".html";
        $cgds[$k]['delurl']=U('shopcart','act=del&id='.$cgds[$k]['id'].'&slt_attrids='.$cgds[$k]['slt_attrids']);
		//S:daley:add:2014.07.11:去掉其它商城的购物车数据
		//if($cgds[$k]['id']=='')
			//unset($cgds[$k]);
		//End
	}	
	//$cgds=array_values($cgds);
	$cgds['allprice']=$allprice;
	$cgds['allnum']=$allnum;
	$cgds['status']=1;
	//print_r($cgds);exit;
	return $cgds;
}