<?php

namespace Addons\UserCenter\Controller;

use Home\Controller\AddonsController;
use User\Api\UserApi;
use Addons\Tianyi\TianyiAddon;

/**
 * 粉丝用户控制器
 * @author patrick <patrickwang@uctoo.com>
 */
class UserController extends AddonsController {


    /* 用户中心首页 */
    public function index() {
    }

    /* 注册页面 */
    public function register($username = '', $password = '', $repassword = '', $mobile = '', $verify = '') {
        
        if (IS_POST) { // 注册用户
            /* 检测验证码 */
           // if (! check_verify ( $verify )) {
           //     $this->error ( '验证码输入错误！' );
           // }
            $password = I ( 'post.password' );
            $repassword = I ( 'post.repassword' );
            $mobile = $username = I ( 'post.username' );  //注册用户时手机号码与用户名相同。
            $verify = I ( 'post.verify' );

            $info ['mobile'] = $mobile;

            $res = M ( 'ucenter_member' )->where ( $info )->find ();

           // if ($res)
             //   return $res ['id'];

            $email = $username. '@uctoo.com';

            //确认手机验证码正确
            $mobiletoVerity = session('send_sms.mobile');

            if ($mobile != $mobiletoVerity) {
                $this->error("验证的手机与注册的手机不符合");
            }

            $addon = new TianyiAddon();

            if (!$addon->checkVerify($mobiletoVerity, $verify)) {
                $this->error("手机验证码错误");
            }
            /* 检测密码 */
            if ($password != $repassword) {
                $this->error ( '密码和重复密码不一致！' );
            }

            /* 调用注册接口注册用户 */
            $User = new UserApi ();

            $uid = $User->register ( $username, $password, $email, $mobile, $openid = '', $token = '' );

            if (0 < $uid) { // 注册成功

                $data ['openid'] = $uid;   //注册帐号openid设置为与uid相同。
                $data ['password'] = $password;
                $res = $User->updateInfo ( $uid, $password, $data );

                // TODO: 发送验证邮件
                $user = array('uid' => $uid, 'nickname' => $username,'openid' => $uid,'mobile' => $mobile, 'status' => 1);

                if(!M('Follow')->add($user)){
                    $this->error('用户添加失败！');
                } else {
                    $this->success('用户添加成功！',addons_url ( 'UserCenter://User/login' ));
                }
            } else { // 注册失败，显示错误信息
                $this->error ( $this->showRegError ( $uid ) );
            }
        } else { // 显示注册表单
            $this->meta_title = '注册用户';
            $this->display ();
        }
    }

    public function doBindMobile($mobile)
    {
        //调用API发送手机验证码
        $mobile = I ( 'post.mobile' );

        $result = callApi('Public/sendSms', array($mobile));
        $this->ensureApiSuccess($result);

        //显示成功消息
        $this->success($result['message']);
    }

    /* 登录页面 */
    public function login($username = '', $password = '', $verify = '') {
        if (IS_POST) { // 登录验证
            /* 检测验证码 */
          //  if (C ( 'WEB_SITE_VERIFY' ) && ! check_verify ( $verify )) {
          //      $this->error ( '验证码输入错误！' );
          //  }
            $username = I ( 'post.username' );  //注册用户时手机号码与用户名相同。
            $password = I ( 'post.password' );
            /* 调用UC登录接口登录 */
            $user = new UserApi ();
            $uid = $user->login ( $username, $password, 3);//参数3采用手机号码登录
            if (0 < $uid) { // UC登录成功
                /* 登录用户 */
                $Follow = D ( 'Follow' );
                if ($Follow->login ( $uid )) { // 登录用户

                        $url = addons_url ( 'UserCenter://UserCenter/usercenter' );


                    session ( 'is_follow_login', 2 );  //会员登录设置为2

                    $this->success ( '登录成功！', $url );
                } else {
                    $this->error ( $Follow->getError () );
                }
            } else { // 登录失败
                switch ($uid) {
                    case - 1 :
                        $error = '用户不存在或被禁用！';
                        break; // 系统级别禁用
                    case - 2 :
                        $error = '密码错误！！';
                        break;
                    default :
                        $error = '未知错误！';
                        break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error ( $error );
            }
        } else { // 显示登录表单

            $this->display ();
        }
    }

    /* 退出登录 */
    public function logout() {
        if (is_login ()) {
            D ( 'Follow' )->logout ();
            $this->success ( '退出成功！', addons_url ( 'UserCenter://User/login' ) );
        } else {
            $this->redirect ( addons_url ( 'UserCenter://User/login' ) );
        }
    }

    /* 验证码，用于登录和注册 */
    public function verify() {
        $verify = new \Think\Verify ();
        $verify->entry ( 1 );
    }

    /**
     * 获取用户注册错误信息
     *
     * @param integer $code
     *        	错误编码
     * @return string 错误信息
     */
    private function showRegError($code = 0) {
        switch ($code) {
            case - 1 :
                $error = '用户名长度必须在16个字符以内！';
                break;
            case - 2 :
                $error = '用户名被禁止注册！';
                break;
            case - 3 :
                $error = '用户名被占用！';
                break;
            case - 4 :
                $error = '密码长度必须在6-30个字符之间！';
                break;
            case - 5 :
                $error = '邮箱格式不正确！';
                break;
            case - 6 :
                $error = '邮箱长度必须在1-32个字符之间！';
                break;
            case - 7 :
                $error = '邮箱被禁止注册！';
                break;
            case - 8 :
                $error = '邮箱被占用！';
                break;
            case - 9 :
                $error = '手机格式不正确！';
                break;
            case - 10 :
                $error = '手机被禁止注册！';
                break;
            case - 11 :
                $error = '手机号被占用！';
                break;
            default :
                $error = '未知错误';
        }
        return $error;
    }

    /**
     * 修改密码提交
     *
     * @author huajie <banhuajie@163.com>
     */
    public function profile() {
        if (! is_login ()) {
            $this->error ( '您还没有登陆', U ( 'User/login' ) );
        }
        if (IS_POST) {
            // 获取参数
            $uid = is_login ();
            $password = I ( 'post.old' );
            $repassword = I ( 'post.repassword' );
            $data ['password'] = I ( 'post.password' );
            empty ( $password ) && $this->error ( '请输入原密码' );
            empty ( $data ['password'] ) && $this->error ( '请输入新密码' );
            empty ( $repassword ) && $this->error ( '请输入确认密码' );

            if ($data ['password'] !== $repassword) {
                $this->error ( '您输入的新密码与确认密码不一致' );
            }

            $Api = new UserApi ();
            $res = $Api->updateInfo ( $uid, $password, $data );
            if ($res ['status']) {
                $this->success ( '修改密码成功！' );
            } else {
                $this->error ( $res ['info'] );
            }
        } else {
            $this->display ();
        }
    }

}
