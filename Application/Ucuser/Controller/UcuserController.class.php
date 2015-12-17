<?php
/**
 * Created by PhpStorm.
 * User: uctoo
 * Date: 15-5-5
 * Time: PM5:20
 */

namespace Admin\Controller;

use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminListBuilder;
use Admin\Builder\AdminTreeListBuilder;
use Common\Model\UcuserModel;
use Com\TPWechat;
use Com\ErrCode;


class UcuserController extends AdminController
{

    public function index($page=1,$r=20)
    {
        //读取数据
        $model = D('Common/Ucuser');
        $map['status'] = array('EGT', 0);
        $map['mp_id'] = get_mpid();

        $list = $model->where($map)->page($page, $r)->order('uid asc')->select();
        int_to_string($list);  //设置status
        foreach ($list as &$val) {
            $val['sex'] = $model->getSex($val['sex']);
        }
        $totalCount = $model->count();
        //显示页面
        $builder = new AdminListBuilder();
        $builder
            ->title('用户列表')
            ->button('同步粉丝数据', array('href' => U('Ucuser/sycUcuser')))
            ->button('获取粉丝信息', array('href' => U('Ucuser/sycUcuserInfo')))
            ->button('数据剔重', array('href' => U('Ucuser/delDup')))
            ->keyText('uid', 'uid')->keyText('openid', 'openid')->keyText('nickname', '昵称')->keyText('sex', '性别')->keyText('province','省份')->keyText('city','城市')->keyText('score1','积分')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }

    /**
     * 同步公众号粉丝数据
     * @param null $ids
     * @author patrick<contact@uctoo.com>
     */
    public function sycUcuser($ids = null){

        $info = get_mpid_appinfo();    //获取当前管理的公众号信息
        $options['token'] = APP_TOKEN;    //初始化options信息
        $options['appid'] = $info['appid'];
        $options['appsecret'] = $info['secret'];
        $options['encodingaeskey'] = $info['encodingaeskey'];
        $weObj = new TPWechat($options);

        $res = $weObj->getUserList();
        $total = $res['total'];
        $countSum = $res['count'];
        $allData = $res['data']['openid'];
        while($countSum < $total) {
            $res = $weObj->getUserList($res['next_openid']);
            $allData = array_merge($allData,$res['data']['openid']);
            $countSum = $countSum+$res['count'];
        }
        $Ucuser = D("Ucuser"); // 实例化Ucuser对象
        $map['mp_id'] = get_mpid();
        $allUcuser = $Ucuser->where($map)->getField('uid,openid');
        $diff = array_diff($allData,$allUcuser);
        foreach($diff as $i) {
            $Ucuser->registerUser( $info['id'] ,$i);
        }
        $this->success('获取粉丝信息成功',U('index'));

    }

    /**
     * 获取公众号粉丝信息
     * @param null $ids
     * @author patrick<contact@uctoo.com>
     */
    public function sycUcuserInfo($ids = null){

        $info = get_mpid_appinfo();    //获取当前管理的公众号信息
        $options['token'] = APP_TOKEN;    //初始化options信息
        $options['appid'] = $info['appid'];
        $options['appsecret'] = $info['secret'];
        $options['encodingaeskey'] = $info['encodingaeskey'];
        $weObj = new TPWechat($options);

        $Ucuser = D("Ucuser"); // 实例化Ucuser对象
        $map['mp_id'] = get_mpid();
        $allUcuser = $Ucuser->where($map)->select();

        foreach($allUcuser as &$i) {
            if(empty($i['nickname'])){
                $res = $weObj->getUserInfo($i['openid']);
                $i = array_merge($i ,$res);
                $i['status'] = 2;                       //已同步过数据资料的状态
                $Ucuser->save($i);
            }
        }
        $this->success('同步粉丝数据成功',U('index'));

    }

    /**
     * 删除公众号重复粉丝信息，忘记当时怎么写的算法了，好像效果是只保留openid相同的最大的那个uid记录
     * @param null $ids
     * @author patrick<contact@uctoo.com>
     */
    public function delDup($ids = null){

        $Ucuser = D("Ucuser"); // 实例化Ucuser对象
        $map['mp_id'] = get_mpid();
        $allUcuser = $Ucuser->where($map)->getField('uid,openid');

        $unDup = array_flip(array_flip($allUcuser));
        $dup = array_diff_assoc($allUcuser,$unDup);
        $dupKeys = array_keys($dup);
        $Ucuser->delete(arr2str($dupKeys));
        $this->success('数据剔重成功',U('index'));
    }

    public function config()
    {
        $list[0]['url'] = addons_url('Ucuser://Ucuser/index', array('mp_id' => get_mpid()));

        //显示页面
        $builder = new AdminListBuilder();
        $builder
            ->title('微会员配置')
            ->keyText('url', '微会员用户中心链接')
            ->data($list)
            ->display();
    }
}
