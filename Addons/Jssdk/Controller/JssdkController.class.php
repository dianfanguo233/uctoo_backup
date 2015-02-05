<?php

namespace Addons\Jssdk\Controller;
use Home\Controller\AddonsController;
use Com\JsSdk;

class JssdkController extends AddonsController{

    // JSSDK 演示页面
    function index() {

        //JSSDK 初始部分
        $param ['token'] = get_token ();
        $param ['openid'] = get_openid ();
        //$id = 1;                                            //如有插件中数据id,分享url中应加入id参数
        $url = addons_url ( 'Jssdk://Jssdk/index', $param );  //分享的url需要和WeixinAddonModel中的组装回复url保持相同
        $this->assign ( 'share_url', $url );

        $info = get_token_appinfo ( $param ['token'] );

        $jssdk = new JSSDK($info ['appid'], $info ['secret']);
        $jssdk->debug = false;	//启用本地调试模式,将官方的两个json文件放到入口文件index.php同级目录即可!
        $signPackage = $jssdk->GetSignPackage();

        $this->assign ( 'signPackage', $signPackage );

        //微信支付部分
        //此处可以动态获取数据库中的MCHID和KEY
        $jssdk->MCHID = "";                            // 动态MCHID;微信支付分配的商户号
        $jssdk->KEY = "";        // 动态KEY;

        //=========步骤2：使用统一支付接口，获取prepay_id============
        //使用统一支付接口
        $jssdk->parameters['openid'] = $param ['openid'];          //trade_type=JSAPI，此参数必传，用户在商户appid下的唯一标识。
        $jssdk->parameters['body']="订单支付";                     //商品或支付单简要描述
        $jssdk->parameters['out_trade_no'] = "outtradeno".time();  //商户系统内部的订单号,32个字符内、可包含字母,不可重复
        $jssdk->parameters['total_fee'] = 1;                      //此处单位为分 出现小数点接口报错必须是整数
        $jssdk->parameters['notify_url'] = 'http://dev.uctoo.com/index.php/addon/Mall/Mall/alarmnotify';   //接收微信支付异步通知回调地址
        $jssdk->parameters['trade_type'] = "JSAPI";               //取值如下：JSAPI，NATIVE，APP
        $jssdk->parameters['spbill_create_ip'] = get_client_ip(); //APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP。

        //以下非必填参数根据需要添加
        //$jssdk->parameters['device_info'] = "013467007045764";            //微信支付分配的终端设备号，商户自定义
        //$jssdk->parameters['detail'] = "UCToo   蓝色";                     //商品名称明细列表
        //$jssdk->parameters['attach'] = "说明";                             //附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
        //$jssdk->parameters['fee_type'] = "CNY";                           //符合ISO 4217标准的三位字母代码，默认人民币：CNY
        //$jssdk->parameters['time_start'] = "20091225091010";              //订单生成时间，格式为yyyyMMddHHmmss
        //$jssdk->parameters['time_expire'] = "20091227091010";             //订单失效时间，格式为yyyyMMddHHmmss
        //$jssdk->parameters['goods_tag'] = "WXG";                          //商品标记，代金券或立减优惠功能的参数
        //$jssdk->parameters['product_id'] = "12235413214070356458058";     //trade_type=NATIVE，此参数必传。此id为二维码中包含的商品ID，商户自行定义。


        $jssdk->prepay_id = $jssdk->getPrepayId();                //微信生成的预支付回话标识，用于后续接口调用中使用，该值有效期为2小时

        //=========步骤3：使用jsapi调起支付============

        $jsApiParameters = $jssdk->getParameters();

        //JSSDK 用户支付完成后的一些系统操作
        $param1 ['dcnum'] = $jssdk->parameters['out_trade_no'];
        $param1 ['openid'] = $jssdk->parameters['openid'];

        $ajaxurl = addons_url ( 'Jssdk://Jssdk/orderpaid', $param1 );  //用户支付完成后，在微信支付返回alarmnotify之前（不保证时序），可以通过ajax调用，进行一些预处理操作

        $jsApiParameters = substr($jsApiParameters,1,-1).",success: function (res) {
                // 支付成功后的js回调函数
                $(\"#chooseWXPay\").hide();
                $.ajax({
		          url: \"$ajaxurl\",
		          success: function( data ) {
			      if(data == \"ok\"){
                    location.reload();
			        }
		          }
	            });
                }";

        $this->assign("jsApiParameters",$jsApiParameters);        //向页面传整理好的调起支付参数


        $this->display ();
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

}
