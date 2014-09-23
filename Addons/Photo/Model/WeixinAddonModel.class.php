<?php
        	
namespace Addons\Photo\Model;
use Home\Model\WeixinModel;
        	
/**
 * Photo的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {	$map ['token'] = get_token ();
		$config = getAddonConfig ( 'Photo' );
		//$param ['pid'] = $info ['id'];
		$param ['token'] = get_token ();
		$param ['openid'] = get_openid ();
		$url = addons_url ( 'Photo://Photo/PhotoList', $param );
		$articles [0] = array (
				'Title' => $config['title'],
				'Description' => $config['info'],
				'PicUrl' => get_picture_url($config['cover']),
				'Url' => $url
		);
	
		$res = $this->replyNews ( $articles );
		}


	// 关注公众号事件
	public function subscribe() {
		return true;
	}
	
	// 取消关注公众号事件
	public function unsubscribe() {
		return true;
	}
	
	// 扫描带参数二维码事件
	public function scan() {
		return true;
	}
	
	// 上报地理位置事件
	public function location() {
		return true;
	}
	
	// 自定义菜单事件
	public function click() {
		return true;
	}	
}
        	