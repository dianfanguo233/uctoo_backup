<?php
        	
namespace Addons\ScoreDetail\Model;
use Home\Model\WeixinModel;
        	
/**
 * ScoreDetail的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {

		// 其中token和openid这两个参数一定要传，否则程序不知道是哪个微信用户进入了系统
		$param ['survey_id'] = $info ['id'];
		$param ['token'] = get_token ();
		$param ['openid'] = get_openid ();
		$url = addons_url ( 'ScoreDetail://ScoreDetail/lists', $param );

		$score = $this->getScore();
		$content = sprintf("您的积分余额为:%s\n<a href='%s'>点击查看积分明细</a>", $score, $url);
		$this->replyText($content);
	} 

	//获得用户积分
	private function getScore()
	{
		$score = 0;
		$map['openid']=get_openid ();
		$map['token']=get_token ();
		$follow = M('follow')->where($map)->select();
		if($follow)
		{
			$score = $follow[0]['score'];
		}
		return $score;
	}
}
        	