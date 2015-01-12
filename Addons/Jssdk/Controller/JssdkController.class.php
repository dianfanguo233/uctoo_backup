<?php

namespace Addons\Jssdk\Controller;
use Home\Controller\AddonsController;
use Com\JsSdk;

class JssdkController extends AddonsController{

    // 过期提示页面
    function index() {

        $param ['token'] = get_token ();
        $param ['openid'] = get_openid ();
        $url = addons_url ( 'Jssdk://Jssdk/index', $param );  //分享的url需要和WeixinAddonModel中的组装回复url保持相同
        $this->assign ( 'share_url', $url );

        $info = get_token_appinfo ( $token );

        $jssdk = new JSSDK($info ['appid'], $info ['secret']);
        $jssdk->debug = false;	//启用本地调试模式,将官方的两个json文件放到入口文件index.php同级目录即可!
        $signPackage = $jssdk->GetSignPackage();

        $this->assign ( 'signPackage', $signPackage );

        $this->display ();
    }

}
