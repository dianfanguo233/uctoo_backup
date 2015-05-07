<?php

namespace Addons\Weicj\Controller;
use Home\Controller\AddonsController;

class WeicjController extends AddonsController{


		public function index(){

		$params['mp_id'] = $map['id'] = I('id');
		hook('init_ucuser',$params);   //把消息分发到addons/ucuser/init_ucuser的方法中,初始化公众号粉丝信息

		$info = M('weicj')->where($map)->find();

		$info['pic1'] = get_cover_url($info['pic1']);
		$info['pic2'] = get_cover_url($info['pic2']);
		$info['pic3'] = get_cover_url($info['pic3']);
		$info['pic4'] = get_cover_url($info['pic4']);
		$info['pic5'] = get_cover_url($info['pic5']);
		$info['pic6'] = get_cover_url($info['pic6']);
		$info['clickpic'] = get_cover_url($info['clickpic']);

		if($info['andio']){
			$file = M ( 'file' )->where ( 'id=' . $info['andio'] )->find ();
			$filename = 'http://'.$_SERVER['HTTP_HOST']. '/Uploads/Download/' . $file ['savepath'] . $file ['savename'];
			$info['trueaudio'] = $filename;
		}else{	
			$info['trueaudio'] = $info['audio2'];
		}

		$this->assign('info',$info);

		//$templateFile = $this->model ['template_list'] ? $this->model ['template_list'] : '';
		$this->display ( T('Addons://Weicj@Weicj/index') );
	}

}