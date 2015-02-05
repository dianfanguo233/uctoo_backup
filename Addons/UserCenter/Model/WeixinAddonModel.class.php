<?php

namespace Addons\UserCenter\Model;

use Home\Model\WeixinModel;

/**
 * UserCenter的微信模型
 */
class WeixinAddonModel extends WeixinModel {
	
	function reply($dataArr, $keywordArr = array()) {
        $config = getAddonConfig ( 'UserCenter' ); // 获取后台插件的配置参数

        // 其中token和openid这两个参数一定要传，否则程序不知道是哪个微信用户进入了系统
        $param ['token'] = get_token ();
        $param ['openid'] = get_openid ();

        $url = addons_url ( 'UserCenter://UserCenter/userCenter', $param );

        // 组装微信需要的图文数据，格式是固定的
        $articles [0] = array (
            'Title' => '微信用户中心',
            'Description' => '',
            'PicUrl' => SITE_URL . '/Addons/UserCenter/View/default/Public/uccover.png',
            'Url' => $url
        );
        $this->replyNews ( $articles );
	}
	// 关注时的操作
	function subscribe($dataArr) {
		$info = D ( 'Common/Follow' )->init_follow ( $dataArr ['FromUserName'] );
		
		// 增加积分
		session ( 'mid', $info ['id'] );
		add_credit ( 'subscribe' );
	}
	// 取消关注公众号事件
	public function unsubscribe() {
		// 增加积分
		add_credit ( 'unsubscribe' );
	}
}
        	