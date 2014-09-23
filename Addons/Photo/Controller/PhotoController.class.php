<?php

namespace Addons\Photo\Controller;
use Addons\Photo\Controller\BaseController;

class PhotoController extends BaseController{
	function config() {
		// 使用提示
		//$normal_tips = '在微信里回复“微官网”即可以查看效果，也可点击<a target="_blank" href="' . U ( 'index' ) . '">这里</a>在预览';
		//$this->assign ( 'normal_tips', $normal_tips );
		
		if (IS_POST) {
			$flag = D ( 'Common/AddonConfig' )->set ( _ADDONS, $_POST ['config'] );
			
			if ($flag !== false) {
				$this->success ( '保存成功', Cookie ( '__forward__' ) );
			} else {
				$this->error ( '保存失败' );
			}
			exit ();
		}
		
		parent::config ();
	}

	function photo_pic() {
		$param ['pid'] = I ( 'pid', 0, 'intval' );
		$url = addons_url ( 'Photo://Pic/lists', $param );
		// dump($url);
		//echo "<script>alert('".	$param ['marry_id']."')</script>";
		redirect ( $url );
	}

	public function lists() {
		get_list_field();
		parent::common_lists ( $this->model,0,'photolists' );
	}
	function photoView() {
		$map ['id'] = $pid = I ( 'pid', 0, 'intval' );
		$map ['token'] = get_token ();
		$info = M ( 'photo' )->where ( $map )->find ();//获取相册信息
		if(!(is_array($info) && count($info)>0)||$info['visible']==1)
		{
			$this->assign ( 'msg', '相册不存在！' );
			$this->display ( 'errorMsg' );
			exit();
		}
		$map2 ['pid'] = $pid = I ( 'pid', 1, 'intval' );
		$map2 ['token'] = get_token ();
		$pics = M ( 'photo_pic' )->where ( $map2 )->order ( 'Sord DESC' )->select();
		if(!(is_array($pics) && count($pics)>0))
		{
			$this->assign ( 'msg', '相册还没上传照片！' );
			$this->display ( 'errorMsg' );
			exit();
		}
		$this->assign ( 'pics', $pics );
		$this->display ( 'PhotoView' );

	}
	
	public function PhotoList(){
		$map['token']=get_token();
		$map['visible']=0;
		$info=M('photo')->where($map)->select();
		if($info){
			$this->assign ( 'info', $info );
			$this->display ( 'photolist' );
		}else{
			$this->assign ( 'msg', '相册不存在！' );
			$this->display ( 'errorMsg' );
			exit();
		}
	}

}
