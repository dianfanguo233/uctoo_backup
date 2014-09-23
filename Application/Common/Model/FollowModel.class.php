<?php

namespace Common\Model;

use Think\Model;
use User\Api\UserApi;

/**
 * 粉丝操作
 */
class FollowModel extends Model {
	function init_follow($openid,$is_subscribe = true) {
		$data ['token'] = get_token ();
		$data ['openid'] = $openid;
		
		$info = $this->where ( $data )->find ();

        if ($info) {
            if ($is_subscribe) {
                $save ['subscribe_time'] = $info ['subscribe_time'] = time ();
                $res = $this->where ( $data )->save ( $save );
            }
		} else {
			$data ['subscribe_time'] = time ();
			$uid = $this->get_uid_by_ucenter ( $data ['openid'], $data ['token'] );
			if ($uid > 0) {
				$data ['id'] = $uid;
				$res = $this->add ( $data );
			}
			
			$info = $data;
		}
		return $info;
	}
	// 自动初始化微信用户
	function get_uid_by_ucenter($openid, $token) {
		$info ['openid'] = $openid;
		$info ['token'] = $token;
		$res = M ( 'ucenter_member' )->where ( $info )->find ();
		
		if ($res)
			return $res ['id'];
		
		$email = time ().rand(01,99)  . '@uctoo.com';
		$nickname = uniqid().rand(01,99);
		
		/* 调用注册接口注册用户 */
		$User = new UserApi ();
		$uid = $User->register ( $nickname, '123456', $email, '', $openid, $token );
		
		return $uid;
	}
	
	/**
	 * 获取粉丝全部信息
	 */
	public function getFollowInfo($id) {
		static $_followInfo;
		if (isset ( $_followInfo [$id] )) {
			return $_followInfo [$id];
		}
		
		$_followInfo [$id] = $this->find ( $id );
		return $_followInfo [$id];
	}

    /**
     * 登录指定用户
     *
     * @param integer $uid
     *        	用户ID
     * @return boolean ture-登录成功，false-登录失败
     */
    public function login($uid) {
        /* 检测是否在当前应用注册 */
        $map['id'] = $uid;

        $user = $this->field ( true )->where($map)->find ();

        if (! $user) { // 未注册
            /* 转到帐号注册页 */

                $this->error = '无用户信息，请重新登录或注册帐号！';
            return false;
        } elseif (1 > $user ['status']) {
            $this->error = '用户未激活或已禁用！'; // 应用级别禁用
            return false;
        }

        /* 登录用户 */
        $this->autoLogin ( $user );

        // 记录行为
        action_log ( 'user_login', 'follow', $uid, $uid );

        return true;
    }

    /**
     * 注销当前用户
     *
     * @return void
     */
    public function logout() {
        session ( 'mid', null );
        session ( 'user_auth', null );
        session ( 'user_auth_sign', null );
        session ( 'token', null );
        session ( 'openid', null );
        session ( 'is_follow_login', null );
    }

    /**
     * 自动登录用户
     *
     * @param integer $user
     *        	用户信息数组
     */
    public function autoLogin($user) {
        /* 更新登录信息 */
        $data = array (
            'uid' => $user ['id'],
            'login' => array (
                'exp',
                '`login`+1'
            ),
            'last_login_time' => NOW_TIME,
            'last_login_ip' => get_client_ip ( 1 )
        );
       // $this->save ( $data );

        /* 记录登录SESSION和COOKIES */
        $auth = array (
            'uid' => $user ['id'],
            'username' => get_username ( $user ['id'] ),
            'last_login_time' => $data ['last_login_time']
        );

        session ( 'mid', $user ['id'] );
        session ( 'openid', $user ['openid'] );
        session ( 'user_auth', $auth );
        session ( 'user_auth_sign', data_auth_sign ( $auth ) );
    }
}
?>
