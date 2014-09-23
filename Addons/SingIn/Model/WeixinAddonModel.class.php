<?php
        	
namespace Addons\SingIn\Model;
use Home\Model\WeixinModel;
        	
/**
 * SingIn的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {
		$config = getAddonConfig( 'SingIn' ); // 获取后台插件的配置参数
		$uid = get_openid();
		$token = get_token();

		//检查是否已签到
		if($this->check_SignIn($uid,$token))
		{
			$this->replyText ("亲，今天已经签到过了，请明天再来哦，谢谢！");
			return true;
		}

		$score = 0;

		//计算积分
		if($config['random']==1)
		{
			//固定积分
			$score = (int)$config['score'];
		}
		else
		{
			//随机积分
			$score = rand((int)$config['score1'],(int)$config['score2']);
		}

		// 记录日志
		$data ['uid'] = $uid;
		$data ['token'] = $token;
		$data ['sTime'] = time ();
		$data ['score'] = $score;
		$res = M( 'signin_log' )->add ( $data );
		
		if($res)
		{
			add_credit ( 'signin', 0, array('score'=>$score,'experience'=>$score));
			$total = $this->getScore();
			$this->replyText ( sprintf("恭喜您,签到成功\n本次签到获得%s积分\n当前总积分%s\n%s",$score,$total, date('Y-m-d H:i:s',time())));
		}
		else
		{
			$this->replyText ( '签到失败,请联系客服!' );
		}

	}

	private function check_SignIn($uid,$token){
		$result = false;

		$date = date('Y-m-d 00:00:00', time());
		$temp = explode(" ",$date); 
		$temp1 = explode("-",$temp[0]); 
		$temp2 = explode(":",$temp[1]); 
		$today = mktime($temp2[0],$temp2[1],$temp2[2],$temp1[1],$temp1[2],$temp1[0]); 

		$map['uid']   = $uid;
		$map['token'] = $token;
		$map['sTime'] = array('egt',$today);
		$cnt = M('signin_log')->where($map)->count('id');
		if($cnt>=1)
		{
			$result = true;
		}
		return $result;
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