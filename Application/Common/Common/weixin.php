<?php
/**
 * Created by PhpStorm.
 * User: uctoo
 * Date: 15-4-7
 * Time: 上午11:26
 * @author:patrick admin@uctoo.com
 */

function addWeixinLog($data, $data_post = '') {
    $log ['cTime'] = time ();
    $log ['cTime_format'] = date ( 'Y-m-d H:i:s', $log ['cTime'] );
    $log ['data'] = is_array ( $data ) ? serialize ( $data ) : $data;
    $log ['data_post'] = is_array ( $data_post ) ? serialize ( $data_post ) : $data_post;
    M ( 'weixin_log' )->add ( $log );
}

// 获取当前用户的Token
function get_token($token = NULL) {
    if ($token !== NULL) {
        session ( 'token', $token );
    } elseif (! empty ( $_REQUEST ['token'] )) {
        session ( 'token', $_REQUEST ['token'] );
    }
    $token = session ( 'token' );
    if (empty ( $token )) {
        $token = session('user_auth.token');
    }
    if (empty ( $token )) {
        return - 1;
    }

    return $token;
}

// 获取公众号的信息
function get_token_appinfo($token = '') {
    empty ( $token ) && $token = get_token ();
    $map ['public_id'] = $token;
    $info = M ( 'member_public' )->where ( $map )->find ();
    return $info;
}

// 获取公众号的信息
function get_token_appname($token = '') {
    empty ( $token ) && $token = get_token ();
    $map ['public_id'] = $token;
    $info = M ( 'member_public' )->where ( $map )->find ();
    return $info['public_name'];
}