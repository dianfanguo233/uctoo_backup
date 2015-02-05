<?php

namespace Addons\Mall\Controller;

use Home\Controller\AddonsController;
use Com\JsSdk;

class MallController extends AddonsController{	
	function _initialize() {
		parent::_initialize ();
		$controller = strtolower ( _CONTROLLER );
		
		$prex = C('DB_PREFIX');
                define('PREX', $prex);
		
		//S:daley:add:主导航
		$res ['title'] = '基础设置';
				
		$res ['url'] = addons_url ( 'Mall://Mall/lists' );
		$res ['class'] = ($controller == 'mall'||$controller == 'dishes' ||$controller == 'dishestype' ||$controller == 'discounttype' ||$controller == 'attr' )? 'current' : '';
		$nav [] = $res;		
		
		$res ['title'] = '订单管理';
		$res ['url'] = addons_url ( 'Mall://Order/lists' );
		$res ['class'] = $controller == 'order' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '评论管理';
		$res ['url'] = addons_url ( 'Mall://Review/lists' );
		$res ['class'] = $controller == 'review' ? 'current' : '';
		$nav [] = $res;
		$this->assign ( 'nav', $nav );		
		unset($nav);
		//End
		
		// 子导航		
		$action = strtolower ( _ACTION );
		
		$res ['title'] = '商城设置';
		$res ['url'] = addons_url ( 'Mall://Mall/lists' );
		$res ['class'] = ($action == 'lists' || $action == 'listsadd' || $action == 'listsedit')  ? 'cur' : '';		
		$nav [] = $res;		
			
		$res ['title'] = '商品管理';
		$res ['url'] = addons_url ( 'Mall://Dishes/lists' );
		$res ['class'] = $controller == 'dishes' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '商品分类';
		$res ['url'] = addons_url ( 'Mall://DishesType/lists' );
		$res ['class'] = $controller == 'dishestype' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '优惠分类';
		$res ['url'] = addons_url ( 'Mall://DiscountType/lists' );
		$res ['class'] = $controller == 'discounttype' ? 'current' : '';
		$nav [] = $res;
		
		$res ['title'] = '属性管理';
		$res ['url'] = addons_url ( 'Mall://Attr/attrlist' );
		$res ['class'] = $controller == 'attr' ? 'current' : '';
		$nav [] = $res;
		
		$this->assign ( 'sub_nav', $nav );
	
	}
	
	protected $model;
	public function __construct() {
		parent::__construct ();
		$this->model = M ( 'Model' )->getByName ( 'ml_mall_set' );
		$this->model || $this->error ( '模型不存在！' );
		$this->assign ( 'model', $this->model );
	}
	
	/***********************************手机显示*******************************************/
	
	//显示
	public function show(){
		$id = I ( 'id', 0, 'intval' );
		$token = get_token();
		
		$ctid=$id;
		$this->assign ( 'ctid', $ctid);
		
	//	$map ['token'] = $token;
		$map ['setid'] = $id;				
		//查询商品分类信息
		$data = M ( "ml_mall_dishes_type" )->field ('id,name,setid,dishesdatas,state')->where ( $map )->order ( 'id DESC' )->select ();
		$newdata = array();
		foreach($data as $cx){
			//还原数据			
			$cpdataids = unserialize($cx["dishesdatas"]);
			$cx["dishesdatas"] = $cpdataids;
			
			$cx["cpinfo"] = array();
			if(isset($cpdataids)){
				//查询商品信息//daley:debug:
				$querysql = "select id,`name`,dishes_num,price,icon,coverpic,introduction,paixu,(select left(name,2) from ".C ( 'DB_PREFIX' )."ml_mall_discount_type where id =youhuiid ) as yhname from ".C ( 'DB_PREFIX' )."ml_mall_dishes where token='".$token."' and id in (".implode(",",$cpdataids).") order by paixu desc";//daley:2014.06.30:bak:token='".$token."' and		
				$cx["cpinfo"] = M ()->query($querysql);
			}
			
			$newdata[] = $cx;			
		}
		$this->assign ( 'selType', $newdata);
		
		
		//查询优惠信息
		$yhdata = M ( "ml_mall_discount_type" )->field ('id,name,setid,dishesdatas')->where ( $map )->order ( 'id DESC' )->select ();
		$newyhdata = array();
		foreach($yhdata as $cx){
			//还原数据			
			$cpdataids = unserialize($cx["dishesdatas"]);
			$cx["dishesdatas"] = $cpdataids;
			
			$cx["cpinfo"] = array();
			if(isset($cpdataids)){
				//查询商品信息			
				$cx["cpinfo"] = M ("ml_mall_dishes")->field("id,`name`,dishes_num,price,icon,coverpic,introduction,paixu")
					->where (array("token"=>$token,"id"=>array("in",implode(",",$cpdataids))))
					->order ( 'paixu desc' )
					->select();		
			}
			
			$newyhdata[] = $cx;			
		}
		$this->assign ( 'yhdatas', $newyhdata);
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$id))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
			
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/index' ) );		
	}
	
	public function mylove(){
		echo "敬请期待！";
		exit();
	}

	public function alarmnotify(){
		$post_data = $GLOBALS ['HTTP_RAW_POST_DATA'];
		\Think\Log::record ( "alarmnotify". $post_data  );

	    $result = xmlToArray($post_data);
		$resp = true;
		$respdata["return_code"] = "SUCCESS";
		$respdata["return_msg"] = "";

		$map["appid"] = $result["appid"];
		$map["mch_id"] = $result["mch_id"];
		$map["openid"] = $result["openid"];
		$map["out_trade_no"] = $result["out_trade_no"];

		$orderdata = M ( "ml_mall_order_his" )->where ( $map )->order ( 'id DESC' )->find();

		if($orderdata["id"] != ""){
			//已经记录过的订单数据

			$map1["openid"] = $orderdata["openid"];
			$map1["dcnum"] = $orderdata["out_trade_no"];

			//TODO:进行安全校验，修订订单支付状态
			$dddata = M ("ml_mall_order")->where ($map1)->order ( 'id asc' )->find ();
			if($dddata["statekz"] == "0" || $dddata["statekz"] == "1"){
				//未支付，设置为已支付，没有记录交易流水的将交易流水写入订单表
				M ("ml_mall_order")->where ($map1)->save(array("statekz"=>1,"transaction_id"=>$orderdata["transaction_id"]));
			}
			if($resp == true){//根据不同的错误设置返回数据
				return arrayToXml($respdata);
			}else{
				return arrayToXml($respdata);
			}

		}else{
			$order = M ( "ml_mall_order_his" );
			/* 保存附件 */
			if($order->create($result) && $order->add()){
				$resp = true;
			} else {
				$resp = false;
				$respdata["return_msg"] = "保存订单数据错误";
			}
		}
	}

	/*******************************订单***********************************/

	//我的订单
	public function myorder(){
		$id = I ( 'ctid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();
		
		$ctid=$id;
		$this->assign ( 'ctid', $ctid);

    //    $is_follow_login = session ( 'is_follow_login' );
    //    $this->assign ( 'is_follow_login', $is_follow_login );
    //    if($is_follow_login < 2){  //app登录状态为2，小于2未登录
    //    redirect ( addons_url ( 'UserCenter://User/login' ) );
    //        $this->success ( '请先登录！', addons_url ( 'UserCenter://User/login' ) );
    //        $this->display ( T ( 'Addons://UserCenter@default/User/login' ) );
    //        exit ();
    //    }

		//Jssdk 初始化
		$info = get_token_appinfo ( $token );

		$jssdk = new JSSDK($info ['appid'], $info ['secret']);
		$jssdk->debug = false;	//启用本地调试模式,将官方的两个json文件放到入口文件index.php同级目录即可!
		$signPackage = $jssdk->GetSignPackage();

		$this->assign ( 'signPackage', $signPackage );

		$jssdk->MCHID = "";      // 动态MCHID;
		$jssdk->KEY = "";        // 动态KEY;
		$jssdk->parameters['openid']=$openid;//商品描述
		$jssdk->parameters['body']="订单支付";//商品描述

		$jssdk->parameters['notify_url'] = 'http://dev.uctoo.com/index.php/addon/Mall/Mall/alarmnotify';
		$jssdk->parameters['trade_type'] = "JSAPI";
		$jssdk->parameters['spbill_create_ip'] = get_client_ip();

		//=========步骤3：使用jsapi调起支付============


		$map ['token'] = $token;
		$map ['set_id'] = $id;
		$map ['openid'] = $openid;
		
		$fx = C ( 'DB_PREFIX' );
		
		//查询我的订单
		$querysql = "select b.truename,b.tel,a.* from ".$fx ."ml_mall_order a left join ".$fx ."ml_mall_users b on a.contactid=b.id where a.set_id=".$id." and a.openid='".$openid."' and a.token='".$token."' and a.statekz !='6' ORDER BY a.ctime desc";
		$myorderdatas = M ()->query($querysql);

		foreach($myorderdatas as & $dd){
            if($dd["yhprice"]!= 0 && $dd["statekz"]== 0){

				$out_trade_no = $jssdk->parameters['out_trade_no'] = $dd["dcnum"];
				$jssdk->parameters['total_fee'] = $dd["yhprice"]*100; //此处单位为分 出现小数点接口报错必须是整数

				$jssdk->prepay_id = $jssdk->getPrepayId();
				$jsApiParameters = $jssdk->getParameters();
				$ddid = $dd["id"];
				$url = "/index.php/addon/Mall/Mall/orderpaid/dcnum/$out_trade_no.html";
				$dd["jsApiParameters"] = substr($jsApiParameters,1,-1).",success: function (res) {
                // 支付成功后的回调函数
                $(\".$ddid\").hide();
                $.ajax({
		          url: \"$url\",
		          success: function( data ) {
			      if(data == \"ok\"){
                    location.reload();
			        }
		          }
	            });
                }";
			}

		}


		$this->assign ( 'myorderdatas', $myorderdatas);

		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$id))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
		
		$myorderid = M ( 'Model' )->getByName ( 'ml_mall_order' );
		$this->assign('myorderid',$myorderid ['id']);
		
		//是否成功
		$success = I('get.success',0,'intval');
		$this->assign ( 'success', $success);
	
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/myorder' ) );	
	}

	//商品定制//微信端
	public function cpconfig(){
		$ctid = I ( 'get.ctid', 0, 'intval' );
		$id = I ( 'get.cpid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();

   //     $is_follow_login = session ( 'is_follow_login' );
   //     $this->assign ( 'is_follow_login', $is_follow_login );
				
		$ctid=$ctid;
		$this->assign ( 'ctid', $ctid);
		
		$map1 ['token'] = $token;
		$map1 ['setid'] = $ctid;
		$map1 ['openid'] = $openid;
		
		$map ['token'] = $token;
		$map ['id'] = $id;	

		$sumprice = 0;
		$sumcount = 0;
		//查询商品
		$myordertemp = M ( "ml_mall_order_temp" )->where ( $map1 )->order ( 'id DESC' )->select ();
		$myshopdatas = array();

        foreach($myordertemp as $order_temp){

            $cfgparam = json_decode($order_temp["param"], true);
            $slt_attrids = $cfgparam[slt_attrids];                        //用户选择的产品属性值id
            //商品属性值
            $slt_attrs=M()->query("select a.id,a.aid,a.value,a.price,a.pricetype,a.desc,b.name,b.is_show,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path,(select path from ".PREX."picture where a.thumbnail=".PREX."picture.id) as thumbnail from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$order_temp["cpid"]." and a.id in (".$slt_attrids.") and a.aid=b.id and b.token='".$token."'");

            if(isset($myshopdatas[$order_temp["cpid"]][$slt_attrids])){   //购物车中相同id的产品，但不同的配置项，拆分成了不同sku的产品。
                $cpdata = $myshopdatas[$order_temp["cpid"]][$slt_attrids];
                $cpdata["num"] = ($cpdata["num"]+1);
                $sumprice= ($sumprice + intval($cfgparam[cfgprice]));
                $sumcount= ($sumcount + 1);
                $myshopdatas[$order_temp["cpid"]][$slt_attrids] = $cpdata;
            }else{
                $cpdata1 = M ( "ml_mall_dishes" )->where (array("token"=>$token,"id"=>$order_temp["cpid"]))->find();
                $cpdata1["num"] = 1;
                $cpdata1["param"] = $cfgparam;
                $cpdata1["sltattrs"] = $slt_attrs;
                if($slt_attrs!= ""){
                    foreach($slt_attrs as $showattrs){
                        $cpdata1["cartshowattrs"] = $cpdata1["cartshowattrs"].$showattrs[name].":".$showattrs[value]."(￥".$showattrs[price].");</br>";
                    }
                }

                $sumprice= ($sumprice + intval($cfgparam[cfgprice]));
                $sumcount= ($sumcount + 1);

                $myshopdatas[$order_temp["cpid"]][$slt_attrids] = $cpdata1;
            }
        }
				
		//统计价格
		$this->assign ( 'sumprice', $sumprice);
		$this->assign ( 'sumcount', $sumcount);			
		
		//商品信息
		$cpdata = M ( "ml_mall_dishes" )->where ( $map )->order ( 'id DESC' )->find();
		if(isset($cpdata)){
			$cpdata["yhprice"] = $cpdata["price"];
		}
		
		//取商品图片
            $cpdata['path'] = M ( 'picture' )->where (array('id'=>$cpdata['icon']))->limit(1)->getField('path');

		$this->assign ( 'cpdata', $cpdata);
		
		//商品属性
		$attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.pricetype,a.desc,b.name,b.is_show,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path,(select path from ".PREX."picture where a.thumbnail=".PREX."picture.id) as thumbnail from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$id." and a.aid=b.id and b.token='".get_token()."'");
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

        //20140916 patrick:固定属性中影响价格的特殊计算
       /* foreach($attrs2 as $k=>&$v){
            //如果产品固定属性中有名字为dzprice的属性，则此属性的调节价格=商品原价*此属性的value值+此属性price值
            if($v['name']=='dzprice'){
                $v['price']=$cpdata["price"]*$v['value']+$v['price'];
            }
        }*/
        unset($v);
            		$this->assign ( 'attrs1', $attrs1);
                    $this->assign ( 'attrs2', $attrs2);

		//查询主要的优惠信息
		$data = M ( "ml_mall_discount_type" )->field ('id,name,setid,dishesdatas,paixu')->where (array("token"=>$token,"setid"=>$ctid,"ismain"=>1))->order ( 'paixu DESC' )->limit("1")->select ();
		$newdata = array();
		foreach($data as $cx){
			//还原数据			
			$cpdataids = unserialize($cx["dishesdatas"]);
			$cx["dishesdatas"] = $cpdataids;
			
			$cx["cpinfo"] = array();
			if(isset($cpdataids)){
				//查询商品信息			
				$cx["cpinfo"] = M ("ml_mall_dishes")->field("id,`name`,dishes_num,price,icon,introduction,paixu")
					->where (array("token"=>$token,"id"=>array("in",implode(",",$cpdataids))))
					->order ( 'paixu desc' )
					->select();		
			}
			
			$newdata = $cx;			
		}
		$this->assign ( 'yhlists', $newdata);
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
	
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/cpconfig' ) );	
	}
	
	//查看商品信息//微信端
	public function cpinfo(){
		$ctid = I ( 'get.ctid', 0, 'intval' );
		$id = I ( 'get.cpid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();

		$this->assign ( 'ctid', $ctid);
		
		$map1 ['token'] = $token;
		$map1 ['setid'] = $ctid;
		$map1 ['openid'] = $openid;
		
		$map ['token'] = $token;
		$map ['id'] = $id;	

		$sumprice = 0;
		$sumcount = 0;
		//查询商品
		$myordertemp = M ( "ml_mall_order_temp" )->where ( $map1 )->order ( 'id DESC' )->select ();
		$myshopdatas = array();
		
		foreach($myordertemp as $order_temp){
			if(isset($myshopdatas[$order_temp["cpid"]])){
				$cpdata = $myshopdatas[$order_temp["cpid"]];
				$cpdata["num"] = ($cpdata["num"]+1);
				$sumprice= ($sumprice + intval($cpdata["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata;
			}else{
				$cpdata1 = M ( "ml_mall_dishes" )->where (array("token"=>$token,"id"=>$order_temp["cpid"]))->find();
				$cpdata1["num"] = 1;
				$sumprice= ($sumprice + intval($cpdata1["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata1;
			}			
		}	
				
		//统计价格
		$this->assign ( 'sumprice', $sumprice);
		$this->assign ( 'sumcount', $sumcount);			
		
		//商品信息
		$cpdata = M ( "ml_mall_dishes" )->where ( $map )->order ( 'id DESC' )->find();
		if(isset($cpdata)){
			$cpdata["yhprice"] = $cpdata["price"];
		}
		
		//取商品图片
            $cpdata['path'] = M ( 'picture' )->where (array('id'=>$cpdata['icon']))->limit(1)->getField('path');

		$this->assign ( 'cpdata', $cpdata);
		
		//商品属性
		$attrs_tmp=M()->query("select a.id,a.aid,a.value,a.price,a.desc,b.name,(select path from ".PREX."picture where a.icon=".PREX."picture.id) as path from ".PREX."ml_mall_attr_value a,".PREX."ml_mall_attr b where a.gid=".$id." and a.aid=b.id and b.token='".get_token()."'");	
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
			           
            		$this->assign ( 'attrs1', $attrs1);
                    $this->assign ( 'attrs2', $attrs2);

		//查询主要的优惠信息
		$data = M ( "ml_mall_discount_type" )->field ('id,name,setid,dishesdatas,paixu')->where (array("token"=>$token,"setid"=>$ctid,"ismain"=>1))->order ( 'paixu DESC' )->limit("1")->select ();
		$newdata = array();
		foreach($data as $cx){
			//还原数据			
			$cpdataids = unserialize($cx["dishesdatas"]);
			$cx["dishesdatas"] = $cpdataids;
			
			$cx["cpinfo"] = array();
			if(isset($cpdataids)){
				//查询商品信息			
				$cx["cpinfo"] = M ("ml_mall_dishes")->field("id,`name`,dishes_num,price,icon,introduction,paixu")
					->where (array("token"=>$token,"id"=>array("in",implode(",",$cpdataids))))
					->order ( 'paixu desc' )
					->select();		
			}
			
			$newdata = $cx;			
		}
		$this->assign ( 'yhlists', $newdata);
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
	
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/cpinfo' ) );	
	}
	
	//查看商品信息
	public function cppicinfo(){
		$ctid = I ( 'get.ctid', 0, 'intval' );
		$id = I ( 'get.cpid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();
				
		$ctid=$ctid;
		$this->assign ( 'ctid', $ctid);
		
		$map1 ['token'] = $token;
		$map1 ['setid'] = $ctid;
		$map1 ['openid'] = $openid;
		
		$map ['token'] = $token;
		$map ['id'] = $id;

		$sumprice = 0;
		$sumcount = 0;
		//查询商品
		$myordertemp = M ( "ml_mall_order_temp" )->where ( $map1 )->order ( 'id DESC' )->select ();
		$myshopdatas = array();
		foreach($myordertemp as $order_temp){
			if(isset($myshopdatas[$order_temp["cpid"]])){
				$cpdata = $myshopdatas[$order_temp["cpid"]];
				$cpdata["num"] = ($cpdata["num"]+1);
				$sumprice= ($sumprice + intval($cpdata["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata;
			}else{
				$cpdata1 = M ( "ml_mall_dishes" )->where (array("token"=>$token,"id"=>$order_temp["cpid"]))->find();
				$cpdata1["num"] = 1;
				$sumprice= ($sumprice + intval($cpdata1["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata1;
			}			
		}	
				
		//统计价格
		$this->assign ( 'sumprice', $sumprice);
		$this->assign ( 'sumcount', $sumcount);		
		
		//商品信息
		$cpdata = M ( "ml_mall_dishes" )->where ( $map )->order ( 'id DESC' )->find();
		if(isset($cpdata)){
			$cpdata["yhprice"] = $cpdata["price"];
		}
		$this->assign ( 'cpdata', $cpdata);
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
	
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/cppicinfo' ) );	
	}
	
	
	//[postajax]添加到购物车
	public function add_cart(){

 //       $is_follow_login = session ( 'is_follow_login' );
 //       $this->assign ( 'is_follow_login', $is_follow_login );
        $orderTempIds = array();

		$token = get_token();
		$ctid = I("get.ctid",0, 'intval' );
		$cpid = I("get.cpid",0, 'intval' );
		$num = I("post.num",0, 'intval' );
		$openid = get_openid();
		
		$data["token"] = $token;
		$data["openid"] = $openid;
		$data["cpid"] = $cpid;
		$data["setid"] = $ctid;
		if($num >=0){
			M ("ml_mall_order_temp")->add($data);		
		}else{
			//删除一条
			M ("ml_mall_order_temp")->where($data)->limit('1')->delete();
		}

		echo "ok";	
	}	
	
	//[getajax]删除菜单
	public function delshop(){
		$token = get_token();
		$ctid = I("get.ctid",0, 'intval' );
		$cpid = I("get.cpid",0, 'intval' );
		$openid = get_openid();

		$data["token"] = $token;
		$data["openid"] = $openid;
		$data["cpid"] = $cpid;
		$data["setid"] = $ctid;
		M ("ml_mall_order_temp")->where($data)->delete();	
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
		echo "ok";
	}
	
	//[postajax]查询商品信息
	public function getcpinfobyid(){
		$token = get_token();
		$cpid = I("post.cpid",0, 'intval' );
			
		$cpinfo = M ("ml_mall_dishes")->where(array("token"=>$token,"id"=>$cpid))->find();				
		$cpinfo["icon"] = get_cover_url($cpinfo["icon"]);
		echo json_encode($cpinfo);	
	}

	//[postajax]订单已支付
	public function orderpaid(){

		$token = get_token();
		$dcnum = I('dcnum');
		$openid = get_openid();

		$map["token"] = $token;
		$map["openid"] = $openid;
		$map["dcnum"] = $dcnum;

		//未支付状态的订单设置为已支付状态，没有安全认证，仅代表状态，通过微信支付订单查询接口获得准确状态
		$dddata = M ("ml_mall_order")->where ($map)->order ( 'id asc' )->find ();

			if($dddata["statekz"] == "0"){
				//未支付，设置为已支付
				M ("ml_mall_order")->where ($map)->save(array("statekz"=>1));
			}

		echo "ok";
	}

	//取消订单
	public function delmyorder(){
		$ctid = I ( 'get.ctid', 0, 'intval' );
		$ddid = I ( 'get.ddid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();
		
		$this->assign ( 'ctid', $ctid);
				
		$fx = C ( 'DB_PREFIX' );
		
		//查询订单是否已经确认,确认的需要进入审核由管理员进行删除
		$dddata = M ("ml_mall_order")->where (array("token"=>$token,"id"=>$ddid,"openid"=>$openid))->order ( 'id asc' )->find ();
		if($dddata["state"] == "1"){
			//进入审核			
			if($dddata["statekz"] == "0"){
				//未支付
				M ("ml_mall_order")->where (array("token"=>$token,"id"=>$ddid,"openid"=>$openid))->save(array("statekz"=>2));
			}else{
				//已经支付
				M ("ml_mall_order")->where (array("token"=>$token,"id"=>$ddid,"openid"=>$openid))->save(array("statekz"=>3));
			}
			 
			
		}else{
			if($dddata["statekz"] == "0"){
				//未支付
				//直接删除
				M ("ml_mall_order")->where (array("token"=>$token,"id"=>$ddid,"openid"=>$openid))->save(array("statekz"=>6));
			}else{
				//已经支付
				M ("ml_mall_order")->where (array("token"=>$token,"id"=>$ddid,"openid"=>$openid))->save(array("statekz"=>3));
			}
		}
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
		
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/myorder' ) );	
	}
	
	//查看商品
	public function lookcp(){
		$ctid = I ( 'get.ctid', 0, 'intval' );
		$ddid = I ( 'get.ddid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();
		
		$this->assign ( 'ctid', $ctid);
				
		$fx = C ( 'DB_PREFIX' );
		
		//查询订单信息		
		$querysql = "select b.truename,b.tel,b.address,a.* from ".$fx ."ml_mall_order a left join ".$fx ."ml_mall_users b on a.contactid=b.id where a.set_id=".$ctid." and a.openid='".$openid."' and a.token='".$token."' and a.id='".$ddid."' and a.statekz != '6' ORDER BY a.ctime desc";
		$myorderdatas = M ()->query($querysql);
		$newdata = array();
		foreach($myorderdatas as $cp){
			//还原数据			
			$cpdataids = unserialize($cp["dishes_count_datas"]);
			$cp["dishes_count_datas"] = $cpdataids;
			$newdata[]  = $cp;
		}
		$this->assign ( 'ddcpdatas', $newdata);

		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
		
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/myordercp' ) );	
	}
	
	
	/**************************************购物车***************************************************/
		
	public function myshop(){
		$ctid = I ( 'ctid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();
				
		$this->assign ( 'ctid', $ctid);
  //      $is_follow_login = session ( 'is_follow_login' );
  //      $this->assign ( 'is_follow_login', $is_follow_login );
		
		$map ['token'] = $token;
		$map ['setid'] = $ctid;
		$map ['openid'] = $openid;

		$sumprice = 0;
		$sumcount = 0;
		//查询商品
		$myordertemp = M ( "ml_mall_order_temp" )->where ( $map )->order ( 'id DESC' )->select ();
        $ml_mall_order_temp = M ( "ml_mall_order_temp" );
        $tempCpids = $ml_mall_order_temp->where ( $map )->getField('cpid',true); //购物车中存在的商品id，用于比较缺少哪些捆绑销售产品

		$myshopdatas = array();
		foreach($myordertemp as $order_temp){
			if(isset($myshopdatas[$order_temp["cpid"]])){
				$cpdata = $myshopdatas[$order_temp["cpid"]];
				$cpdata["num"] = ($cpdata["num"]+1);
				$sumprice= ($sumprice + intval($cpdata["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata;
			}else{
				$cpdata1 = M ( "ml_mall_dishes" )->where (array("token"=>$token,"id"=>$order_temp["cpid"]))->find();
				$cpdata1["num"] = 1;
				$sumprice= ($sumprice + intval($cpdata1["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata1;
			}			
		}	
		
		$this->assign ( 'myshopdatas', $myshopdatas);
		
		//统计价格
		$this->assign ( 'sumprice', $sumprice);
		$this->assign ( 'sumcount', $sumcount);
		
		//查询模板
		$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
		$TemplateIndex = "default";
		
		if($ctdata["id"] != ""){
			$TemplateIndex = $ctdata["TemplateIndex"];		
		}
	
		$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/myshop' ) );	
	}

	public function jiesuan(){
		$ctid = I ( 'ctid', 0, 'intval' );
		$token = get_token();
		$openid = get_openid();

		$this->assign ( 'ctid', $ctid);
  //      $is_follow_login = session ( 'is_follow_login' );
  //      $this->assign ( 'is_follow_login', $is_follow_login );

  //      if($is_follow_login < 2){  //app登录状态为2，小于2未登录
         //   redirect ( addons_url ( 'UserCenter://User/login' ) );
  //          $this->success ( '请先登录！', addons_url ( 'UserCenter://User/login' ) );
        //    $this->display ( T ( 'Addons://UserCenter@default/User/login' ) );
  //          exit ();
  //      }
        $user = get_followinfo ( $this->mid );
        $this->assign ( 'user', $user );

        $sumprice = 0;
		$sumcount = 0;
				
		$map ['token'] = $token;
		$map ['setid'] = $ctid;
		$map ['openid'] = $openid;
		
		//查询商品		
		$myordertemp = M ( "ml_mall_order_temp" )->where ( $map )->order ( 'id DESC' )->select ();
		$myshopdatas = array();
		foreach($myordertemp as $order_temp){
			if(isset($myshopdatas[$order_temp["cpid"]])){
				$cpdata = $myshopdatas[$order_temp["cpid"]];
				$cpdata["num"] = ($cpdata["num"]+1);
				$sumprice= ($sumprice + intval($cpdata["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata;
			}else{
				$cpdata1 = M ( "ml_mall_dishes" )->where (array("token"=>$token,"id"=>$order_temp["cpid"]))->find();
				$cpdata1["num"] = 1;
				$sumprice= ($sumprice + intval($cpdata1["price"]));
				$sumcount= ($sumcount + 1);
				$myshopdatas[$order_temp["cpid"]] = $cpdata1;
			}			
		}	
		
		$this->assign ( 'myshopdatas', $myshopdatas);
		
		//统计价格
		$this->assign ( 'sumprice', $sumprice);
		$this->assign ( 'sumcount', $sumcount);
		
		if (IS_POST) {
			// 自动补充token
			$_POST ['token'] = get_token ();
			$_POST ['openid'] = $openid;
			$_POST ['jctime'] = $_POST["buytimestamp"]." ".$_POST["hour"].":00:00";
			$_POST ['ctime'] = date("y-m-d H:i:s",time());
			$_POST ['set_id'] = $ctid;
			$_POST ['dcnum'] = date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
			//7天后过期自动删除(计划任务)
			$_POST ['endtime'] = date("y-m-d H:i:s",strtotime("+7 day"));
			
			$mm = M("ml_mall_order"); 
			//保存联系信息
			if($_POST ['contactid'] == "0"){
				$musers = M("ml_mall_users"); 
				//查询是否已经存在相同的
				$oldmuser = $musers->where(array("truename"=>$_POST ['username'],"tel"=>$_POST ['tel'],"address"=>$_POST ['address'],"openid"=>$openid,"set_id"=> $ctid))->find();
				if($oldmuser["id"] >0){
					$_POST ['contactid'] =  $oldmuser["id"];
				}else{					
					if ($musers->create () && $muserid = $musers->add ()) {	
						$_POST ['contactid'] = $muserid;
					}
				}
			}
			
			$_POST["dishes_count_datas"] = serialize($myshopdatas);
			if ($mm->create () && $orderid = $mm->add ()) {
				//成功后删除临时订单信息
				M ( "ml_mall_order_temp" )->where ( $map )->delete();
				$this->success ( '提交订单成功！', U ( 'myorder?success=1&ctid='.$ctid ) );
			} else {
				$this->error ( $Model->getError () );
			}			
			
		} else {
			
			//查询桌台
			$mytables = M ( "ml_mall_tablemanage" )->where (array("token"=>$token,"setid"=>$ctid) )->order ( 'paixu DESC' )->select ();
			$this->assign ( 'mytables', $mytables);
			
			//设置时间日期 
			$nowdates =array();
			for($i = 0; $i < 5; $i++){
				$dates["value"] =date("Y-m-d",strtotime("+".$i." day"));
				$dates["text"] = date("m月d日",strtotime("+".$i." day"));
				$nowdates[] = $dates;
			}
			$this->assign ( 'nowdates', $nowdates);
			
			//查询联系方式			
			$mycontact = M ( "ml_mall_users" )->where (array("token"=>$token,"set_id"=>$ctid,"openid"=>$openid) )->order ( 'id DESC' )->select ();
			$this->assign ( 'mycontact', $mycontact);
			
			//查询模板
			$ctdata = M ("ml_mall_set")->where (array("token"=>$token,"id"=>$ctid))->order ( 'id asc' )->find ();
			$TemplateIndex = "default";
			
			if($ctdata["id"] != ""){
				$TemplateIndex = $ctdata["TemplateIndex"];		
			}
			$this->display ( T ( 'Addons://Mall@default/Template/'.$TemplateIndex.'/jiesuan' ) );
		}
	}
	
	/**************************************管理***************************************************/
		
	/**
	 * 显示指定模型列表数据
	 */
	public function lists() {
		// 使用提示
		$normal_tips = '“微商城”可以添加多个分店';
                $param ['token'] = get_token ();
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
		$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( 'id DESC' )->page ( $page, $row )->select ();//daley:2014.06.30:bak:->where ( $map )
		
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
		$this->display ( T ( 'Addons://Mall@default/Mall/lists' ) );		
	}	
	
	public function listsadd() {		
		if (IS_POST) {
			// 自动补充token
			$_POST ['token'] = get_token ();
			$Model = D ( parse_name ( get_table_name ( $this->model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $this->model ['id'] );
			if ($Model->create () && $micsetid = $Model->add ()) {				
				// 保存关键词
				D ( 'Common/Keyword' )->set ( I ( 'keyword' ), 'Mall', $micsetid );
				
				$this->success ( '添加' . $this->model ['title'] . '成功！', U ( 'lists' ) );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			
			$micset_fields = get_model_attribute ( $this->model ['id'] );
			$this->assign ( 'fields', $micset_fields );
			
			$this->meta_title = '新增' . $this->model ['title'];
			$this->display ('listsadd');			
		}
	}
	
	public function listsedit() {
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
				// 保存关键词
				D ( 'Common/Keyword' )->set ( I ( 'post.keyword' ), 'Mall', I ( 'post.id' ) );
				
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
			$this->display ( 'listsedit');
		}
	}
	
	public function listsdel() {
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
	
	
	public function tz(){
		echo "敬请期待！";
		exit();
	}
	
	public function detail(){
		echo "敬请期待！";
		exit();
	}
}
