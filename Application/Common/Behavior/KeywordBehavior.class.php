<?php
// +----------------------------------------------------------------------
// | UCToo [ Universal Convergence Technology ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014-2015 http://uctoo.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Patrick <contact@uctoo.com>
// +----------------------------------------------------------------------
/**
 * 从keyword表获取关键词信息，根据关键词信息获取到模块具体回复粉丝的数据信息，组装回复内容给粉丝。
 *
 *
 */
namespace Common\Behavior;
use Think\Behavior;
use Think\Hook;
defined('THINK_PATH') or exit();

// 关键词行为
class KeywordBehavior extends Behavior {

    // 行为扩展的执行入口必须是run
    public function run(&$params){

        if($params['mp_id']){
            $kmap['mp_id'] = $params['mp_id'];
            $kmap['keword'] = $params['weObj']->getRevContent();       //TODO:先只支持精确匹配，后续根据keyword_type字段增加模糊匹配
            $Keyword = M('Keyword')->where($kmap)->find();
            if($Keyword['model'] && $Keyword['aim_id']){              //如果有指定模型，就用模型中的aim_id数据组装回复的内容
                $amap['id'] =  $Keyword['aim_id'];
                $aimData = M($Keyword['model'])->where($amap)->find();
                $reData['Title'] = $aimData['title'];
                $reData['Description'] = $aimData['intro'];
                $reData['PicUrl'] = $aimData['cover'];
                $reData['Url'] = $aimData['url'];
                $params['weObj']->news($reData);
            }else{                                                       //没有指定模型，就用addon的配置信息组装回复的内容

            }

        }else{

        }
    }
}