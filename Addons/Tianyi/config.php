<?php
return array(
    'expire' => array(
        'title' => '验证码有效期（秒）：',
        'type' => 'text',
        'value' => '120',
    ),

    'clean_interval' => array(
        'title' => '清理数据库间隔（秒）：',
        'type' => 'text',
        'value' => '86400'
    ),

    'app_id' => array(
        'title' => '天翼应用APPID：',
        'type' => 'text',
        'value' => '',
    ),

    'app_secret' => array(
        'title' => '天翼应用密钥：',
        'type' => 'text',
        'value' => '',
    ),

    'access_token' => array(
        'title' => '天翼访问令牌(Access Token)：',
        'type' => 'text',
        'value' => '',
    ),

    'refresh_token' => array(
        'title' => '天翼刷新令牌(Refresh Token)：',
        'type' => 'text',
        'value' => '',
    ),

    'update_access_token_interval' => array(
        'title' => '访问令牌刷新间隔（秒）：',
        'type' => 'text',
        'value' => '1728000',
    ),

    'api_url' => array(
        'title' => '短信接口地址：',
        'type' => 'text',
        'value' => '',
    ),

    'orgId' => array(
        'title' => '短信接口参数orgId：',
        'type' => 'text',
        'value' => '',
    ),

    'userName' => array(
        'title' => '短信接口参数userName：',
        'type' => 'text',
        'value' => '',
    ),
    'password' => array(
        'title' => '短信接口参数password：',
        'type' => 'text',
        'value' => '',
    ),
    'mobileList' => array(
        'title' => '目的号码（如果为多个号码中间用半角的逗号“,”分隔）：',
        'type' => 'text',
        'value' => '',
    ),

    'content' => array(
        'title' => '短信模板：',
        'type' => 'text',
        'value' => '',
    ),

);