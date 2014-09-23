<?php
        	
namespace Addons\YuYue\Model;
use Home\Model\WeixinModel;
        	
/**
 * YuYue的微信模型
 */
class WeixinAddonModel extends WeixinModel{
	function reply($dataArr, $keywordArr = array()) {

		// 获取后台插件的配置参数
		$config = getAddonConfig ( 'YuYue' ); 
		$desc = $config['description'];
		$items = explode("\n",$config['item']);
		$notice = $config['notice'];
		$noData = $config['noData'];

		$token = get_token ();
		$openid = get_openid ();



		//生成预约内容
		$content_item = "";
		foreach ($items as $item) {
			$param ['token'] = $token;
			$param ['openid'] = $openid;
			$param ['item'] = trim($item);
			$url = addons_url ( 'YuYue://YuYue/form', $param );
			$content_item .= sprintf("\n<a href='%s'>%s</a>\n", $url, trim($item));
		}

		$content = str_replace('[预约项目]', $content_item, $desc);

		//回复最近一次预约
		if($keywordArr)
		{
			$kwyword = $keywordArr['keyword'];
			if( $kwyword == '预约查询' )
			{
				$where['token'] = $token;
				$where['openid'] = $openid;
				$rec = M( 'yuyue' )->where($where)->order('id DESC')->limit(1)->select();
				if( $rec )
				{
					$r = $rec[0];
					$last = "您最近一次预约：\n\n预约号：%s\n预约项目：%s\n预约门店：%s\n预约时间：%s\n预约人数：%s";
					$last = sprintf($last, $r['id'], $r['item'], $r['market'], date('Y.m.d H:i',$r['yTime']), $r['number'] );

					$param1 ['token'] = $token;
					$param1 ['openid'] = $openid;

					$myListsUrl = addons_url ( 'YuYue://YuYue/mylists', $param1 );
					$last .= sprintf("\n\n<a href='%s'>查看更多预约记录</a>\n\n", $myListsUrl);
					$last .= $notice;

					$this->replyText ($last);
					return;
				}
				else
				{
					//没有预约记录
					$nodata_content = $noData . "\n\n" . $content;
					$this->replyText ($nodata_content);
					return;
				}
			}
		}

		$this->replyText ($content);
	}
}
