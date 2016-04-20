<?php
// +----------------------------------------------------------------------
// | UCToo [ Universal Convergence Technology ]
// +----------------------------------------------------------------------
// | Copyright (c) 2015 http://www.uctoo.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: patrick <contact@uctoo.com> <http://www.uctoo.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminListBuilder;
use Admin\Builder\AdminTreeListBuilder;

use Think\Model;

/**
 *
 * Class AppstoreController
 * @package Admin\controller
 * @patrick
 *
 */



class AppstoreController extends AdminController
{

    function _initialize()
    {
        parent::_initialize();
        //dump($_COOKIE);die;
    }

    public function index()
    {
     //
//        var_dump($_SERVER);
//        var_dump($_COOKIE);;
        $this->display();
    }


/*
     * 下载模块，插件，
     *
     * */
    public function downfile($url='http://jiuyang.com/index.php?s=/jiuyang/index/wxqrcexcel.html'){
        $fd = D('Appstorefile');
       // dump($fd);
//
//        switch($type){
////            模块
//            case 0 :
//                break;
////            插件
//            case 1 :
//                break;
//        }


        $path = __ROOT__.'\updata\resource.txt';
        dump(fopen($url, 'a'));
        dump(__ROOT__);
        dump($path);
        dump(file_exists($path));
        dump(fopen($path, 'a'));
//        die;
        dump($fd->getFile($url,$path));
        die;

    }


    /*
     * 下载模块
     * */
    public function getfile(){

        //echo 111;die;
//        cookie('PHPSESSID','ud1pen71s03oro4gpv082n8vm7');

//        $url = 'http://0.6rc.com/index.php/jiuyang/index/putfile/name/aaa';
        $url = 'http://www.uctoo.cn/index.php?s=/sappstore/index/download_file/aspv_id/1.html';

//echo $cookie_file;die;

//        $ch = curl_init();
//        $timeout = 5;
//        curl_setopt($ch, CURLOPT_URL, $url);
//        curl_setopt($ch, CURLOPT_HEADER, 0);
//        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);//在需要用户检测的网页里需要增加下面两行
//        curl_setopt($ch, CURLOPT_COOKIEFILE,  $cookie_file);
//        //curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
//        //curl_setopt($ch, CURLOPT_USERPWD, US_NAME.”:”.US_PWD);



        $cookie_file='PHPSESSID=ud1pen71s03oro4gpv082n8vm7;';
        $url = 'http://www.uctoo.cn/index.php?s=/sappstore/index/download_file/aspv_id/1.html';
        $ch = curl_init($url);
        $dpost = array('ajax'=>1,);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_COOKIE, $cookie_file); //使用上面获取的cookies
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dpost);
        $contents = curl_exec($ch);

        $header= curl_getinfo($ch);
        //dump($header);
        curl_close($ch);

        if($header['http_code']!==200){
            $this->error('网络错误');
        }

        $res = explode(';',$header['content_type']);
        if($res[0]=='application/json'){
            $res_error=json_decode($contents,true);
            $this->error($res_error['info']);

        }
        $downname = date('ymd:hms',time()).rand(031,12123134);
//        if($header['http_code']==)

//        echo $contents;

        //这个是可以的
//      $url = __ROOT__.'updata/aaa.zip';
//      $contents =file_get_contents($url);
//      dump($contents);die;
        //下载文件   TODO:未定义下载方式，与服务端对接后确定；
        $path = __ROOT__.'updata/'.$downname.'.zip';
        $dir = dirname($path);
        if(!is_dir($dir)) mkdir($path);
        $fp =fopen($path,'wb');
        fwrite($fp,$contents);
        fclose($fp);
        echo 111;
        $modelname = $this->unzip($downname);
//        dump()
        $this->install($modelname);
    }

    /*
     * 输出文件供下载；
     * */
    public function putfile(){
        $name = I('name');
        $path = __ROOT__ . 'Public/' . $name . '.zip';
//        var_dump($path);die;
//        $ch = fopen($path,'r');
//        $res = fread($ch);
//        fclose($ch);
        $res = file_get_contents($path);
        echo $res;
//        return $res;

    }

        /*
         * 解压安装模块
         * 用xxx模块文件夹进行压缩；
         * 解压出来就是Aplication/XXX模块/
         * */
    public function unzip($a){
        $name = $a.'.zip';
        $type = I('type');

        load('Appstore/function');
        $size = get_zip_originalsize($name,$type);
        $modelname = explode('/',$size);
        return $modelname['1'];
    }

    /*
     * 模块安装
     *
     *
     * */
    public function install($name){
        $module['name'] = $name;
        $moduleModel = D('Common/Module');
        $moduleModel->reload();
        $module = $moduleModel->getModule($module['name']);
        $res = $moduleModel->install($module['id']);
        
        $installsql = APP_PATH.$module['name'].'/info/install.sql';
        $res = D('')->executeSqlFile($installsql);
        


    }



















}