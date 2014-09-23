var __root = "";//全局跟目录
if (window.location.hostname == "" || window.location.hostname == "localhost"  ) {
    __root = "http://chevy-m.wangfan.com/";

}
//全局域名的判断
function _getDomain() {
    if (window.location.hostname == "" || location.host.indexOf("wangfan") != -1) {
        return "http://chevy.wangfan.com/";
    } else {
        return "http://www.chevrolet.com.cn/";
    }
}

var jackyFn = {
   filterAbs:function (_do, _wrape, _id, property) {
        /*
        * 公共遮罩层的调用：
        * 示例如下：
        jackyFn.filterAbs("yes",$("body"),"filterAbs_domId",{  } );
        * */
        switch (_do) {
            case "yes":
                if (!$(".filterAbs").hasClass("active")) {
                    var _visiH = $(window, "html").height(), _abs = $("<div class='filterAbs' id='" + _id + "'></div>"), _cntH = $("#wrap");
                  //  _abs.appendTo(_wrape).height((_visiH > _cntH) ? _visiH : _cntH).addClass("active");
                }
                if (property) {
                    if (property.zIndex) {
                        $("#" + _id).css({zIndex:property.zIndex});
                    }
                    if (property.opacity) {
                        $("#" + _id).css({opacity:property.opacity});
                    }
                    if (property.background) {
                        $("#" + _id).css({background:property.background});
                    }
                }
                break;
            case "no":
                if (_id) {
                    $("#" + _id).fadeOut(function () {
                        $(this).remove();
                    });
                } else {
                    $(".filterAbs").fadeOut(function () {
                        $(this).remove();
                    });
                }
                break;
            default:
                alert('sorry');
                break
        }
    },
    lazyImgFn:function () {
        /*
        图片延迟加载
        用法：src变成original，且新增class为imgJs在图片上
       */
        $(".imgJs").lazyload({
            threshold:200,
            placeholder:"../../img/o_loading.gif"/*tpa=http://api2.v-top.cn/img/o_loading.gif*/,
            effect:"fadeIn"
        });
    },
    preLoadImagesFn:function (f) {
        /*
        图片素材后台运行的公共方法，调用示例如下：
         arrImgSrc：一个图片路径的二维数组
         jackyFn.preLoadImagesFn({src:arrImgSrc,callbackFn:function(){

        }});
        */
        var imgs = f.src;
        var fnLoad = function (i) {
            var oImg = new Image();
            oImg.onload = function () {
                i++;
                if (i < imgs.length) {
                    fnLoad(i);
                } else {
                    try {
                        f.callbackFn();
                    } catch (e) {
                    }
                }
            };
            oImg.src = imgs[i];
        };
        fnLoad(0);
    },
    mobileBugs:function (obj) {
        //在没有关闭虚拟键盘就直接点击搜索按钮，出现的bug
        obj.css({"position":"relative"});
        setTimeout(function () {
            obj.css({"position":"fixed"});
        }, 500);
    },
    coming:function () {//敬请期待的公共浮层
        var _popHtml = '<div class="popTip" id="popTip"><div class="closeDiv"><a href="javascript:void(0);">×</a></div><div class="boxBody">敬请期待</div></div>';
        $("#popHtml").html(_popHtml);
        jackyFn.filterAbs("yes", $("body"), "filterAbs_coming", {
            opacity:0.5
        });
        $("#popTip .closeDiv").unbind("click").bind("click", function () {
            $("#popTip").fadeOut();
            jackyFn.filterAbs("no", $("body"), "filterAbs_coming");
        });
    },
    loadingFn:function (_do) {  //页面正在loading的公共浮层
        /*
         页面正在loading的公共浮层，调用示例如下：
         显示浮层：jackyFn.loadingFn("yes")
         关闭浮层：jackyFn.loadingFn("no");
         */
        if (_do == "yes") {
            var _popHtml = '<div class="popLoading" id="popLoading" style="z-index: 1000;"> <div class="cnt"> <img src="../../img/o_loading.gif"/*tpa=http://api2.v-top.cn/img/o_loading.gif*/>  正在加载……   </div>  </div>';
            $("#container").append(_popHtml);
            jackyFn.filterAbs("yes", $("#container"), "filterAbs_loading", {
                zIndex:999,
                opacity:1,
                background:"#F1F1F1"
            });
        } else {
            $(".popLoading").fadeOut(function () {
                $(".popLoading").remove();
                jackyFn.filterAbs("no", $("#container"), "filterAbs_loading");
            });
        }
    }
};
 

 
//检查验证Email是否符合规范
function checkEmail(s) {
    if (s.length > 100) {
        window.alert("email地址长度不能超过100位!");
        return false;
    }
    var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$";
    var re = new RegExp(regu);
    if (s.search(re) != -1) {
        return true;
    } else {
        return false;
    }
}
//判断是否谁数字的正则，用户检测普通的电话号码
function isNum(s) {
    var patrnN = /^[0-9]*$/;
    if (!patrnN.exec(s)) {
        return false;
    }
    else {
        return true;
    }
}
/*
 其中 ^ 是以什么开头的意思， $ 是以什么结尾的意思，\d 匹配是任意一位数字，后面跟着的{9}是指\d重复的次数，
 相当于\d\d\d\d\d\d\d\d这个正则表达式匹配的是以13开头和以任意9个数字结尾的字串， / 是正则表达式的分界符，
 后面跟着的 g 呢，是对指定的字串全局匹配（不加则只匹配第一个），事实上有这个 g 和没有 g 在这里的情况是一样的，
 test方法返回一个 Boolean 值，它指出在被查找的字符串中是否存在模式，如存在则返回 true，否则返回 false。
 */
function chkMobile(tel){
//	var tel = document.all("text").value;
//	if(/^13\d{9}$/g.test(tel)||(/^15[6,8,9]\d{8}$/g.test(tel))){
    if(/^12\d{9}$/g.test(tel)||/^13\d{9}$/g.test(tel)||(/^15\d{9}$/g.test(tel))||(/^18\d{9}$/g.test(tel))){
        //	console.log("手机号正确");
        return true;
    }
    else{
        //	console.log("手机号错误");
        return false;
    }
}

//设置本地临时存储
var storageFn = {
    get:function (name) {
        var _name;//暂时禁用,因为ios7下的safari有问题
        if(/AppleWebKit.*Version\/7\.0.*Safari.*/.exec(window.navigator.userAgent)){
            return $.cookie(name);
        }
        try{
            _name = window.localStorage.getItem(name);
        }catch(err){
            _name = $.cookie(name);
        }

        return _name;
    },
    set:function (name, val) {
        if(/AppleWebKit.*Version\/7\.0.*Safari.*/.exec(window.navigator.userAgent)){
             $.cookie(name, val);
        }
       try {
            window.localStorage.setItem(name, val);
        } catch(err) {
            $.cookie(name, val);
        }
        this.property[name] = val;
        return val;
    },
    deleteF:function (name) {
        if(/AppleWebKit.*Version\/7\.0.*Safari.*/.exec(window.navigator.userAgent)){
            $.cookie(name, null);
        }
        try{
            window.localStorage.removeItem(name);
        } catch(err) {
            $.cookie(name, null);
        }
    },
    property:{}
};

//判断是否是touch手持设备
function isTouchMobile() {
    if (checkPlatform() == "android" || checkPlatform() == "iphone" || checkPlatform() == "ipod" || checkPlatform() == "ipad" || checkPlatform() == "blackberry") {
        return true;
    } else {
        return false;
    }
}
//判断手机端浏览器
function isBrowse() {
    var ua = navigator.userAgent;
    var browser = this.browser = {};
    var firefox = ua.match(/Firefox\/([\d.]+)/);
    var chrome = navigator.userAgent.match(/Chrome\/([\d.]+)/) || navigator.userAgent.match(/CriOS\/([\d.]+)/);
    if (chrome) {
        browser.chrome = true;
        browser.version = chrome[1];
    } else if (firefox) {
        browser.firefox = true;
        browser.version = firefox[1];
    }
    return browser
}

//面向对象公共方法
function inherit(o) {
    var f = function () {
    };
    f.prototype = o;
    return new f;
}

/*
 整合水平方向的KV切换以及竖直方向的整屏切换
__touchDirection：全局的方向
 __touchMinR：在某个方向上产生的最低位移，大于这个位移才算有效的方向，否则不算产生真正的方向
===========================================================
公共KV轮播切换方法调用示例如下：
var aveoKV = inherit(cmnKVfn);
aveoKV.init({
     kvUL:"#car_kv .ulPic",
     kvLI:"#car_kv .ulPic li",
     switchUL:"#car_kv .ulSwitch",
     switchLI:"#car_kv .ulSwitch li"
 });
===========================================================
公共车型动画的方法调用示例如下：
var aveoFn = inherit(carIdxFn);
aveoFn.init({
    dragObj:"#contentCar",
    step:$("#main").height()
});

* */
var __touchDirection = null;        //全局方向
var __touchMinR = 20;               //全局touch最小半径
/*
* 公共KV轮播切换*/
var cmnKVfn = {
    kvUL:null,
    kvLI:null,
    switchUL:null,
    switchLI:null,
    subTitle:null,
    step:null,
    kvId:null,
    maxKvLen:null,
    timer:null,
    duration:null,
    autoPlay:null,
    init:function (f) {
        //初始化获取对象
        this.kvUL = f.kvUL;									//包括KV列表的整体UL
        this.kvLI = f.kvLI;									//显示KV的每一个LI
        this.switchUL = f.switchUL;							//包含切换标签的整体UL
        this.switchLI = f.switchLI;							//显示切换标签的每一个LI
        this.kvId = 0;										     //默认显示第几个
        this.maxKvLen = $(f.switchLI).length;
        this.duration = f.duration || 7000;
        this.autoPlay = (f.autoPlay != undefined )? f.autoPlay : true;        //默认自动播放
        this.subTitle = f.subTitle || null;                     //每一张图片的标题
        this.step = f.step || $(window).width();                 //移动KV的步长
        var kvUL = $(this.kvUL), kvLI = $(this.kvLI);
        kvLI.width(this.step);
        kvUL.width(kvLI.length * this.step);				         //设置包含KV的整体UL的宽度
        this.switchF(this.kvId);							      //显示指定的KV
        this.bindEvent();									        //初始化绑定方法
    },
    switchF:function (idx) {
        var THIS = this;
        $(THIS.switchLI).removeClass("liCurr").eq(idx).addClass("liCurr");
        var _L = -this.step * idx;
            setTimeout(function () {//如果不延迟,手机上划动无动画效果,但如果连上mac 的safari就无此问题
                $(THIS.kvUL).stop(true, false).animate({left:_L }, 400);
                //因为自动轮播
                //_gaq.push(['_trackPageview', '/'+__gaCarType__+'/home/bottom/pic'+idx]);
            }, 5);
        THIS.kvId = idx;
        if (THIS.subTitle != null) {
            $(THIS.subTitle.dom).html(THIS.subTitle.json[THIS.kvId]);
        }
    },

    bindEvent:function () {
        var THIS = this;
        var sectionKV = $(THIS.kvUL)[0];
        var _touch = null, _touchStartX = null, _touchStartY = null, _touchEndtX = null, _touchEndtY = null, _distanceX = null, _distanceY = null, _posL, _touchDrc;
        var eventFn = {
            startFn:function (e) {
                if (isTouchMobile() == false) {
                    e.preventDefault();
                }
                _touchStartX = isTouchMobile() == true ? e.touches[0].pageX : e.pageX;
                _touchStartY = isTouchMobile() == true ? e.touches[0].pageY : e.pageY;
                _touch = "down";
                _posL = parseInt($(THIS.kvUL).css("left"));
                clearInterval(THIS.timer);
            },
            moveFn:function (e) {
            //    $("#test").html('__touchDirection:' + __touchDirection);
                if (__touchDirection == "UP" || __touchDirection == "DOWN") {
                    return;
                }
                e.preventDefault();
                //	e.stopPropagation();
                if (_touch == "down") {
                    _touchEndtX = isTouchMobile() == true ? e.touches[0].pageX : e.pageX;
                    _touchEndtY = isTouchMobile() == true ? e.touches[0].pageY : e.pageY;
                    _distanceX = _touchEndtX - _touchStartX;
                    _distanceY = _touchEndtY - _touchStartY;
                    if (Math.abs(_distanceX) > Math.abs(_distanceY)) {
                        if (_distanceX > __touchMinR) {
                            _touchDrc = "RIGHT";
                            $(THIS.kvUL).css({left:_posL + _distanceX - 20});
                            __touchDirection = _touchDrc;
                        } else if (_distanceX < -__touchMinR) {
                            _touchDrc = "LEFT";
                            $(THIS.kvUL).css({left:_posL + _distanceX + 20});
                            __touchDirection = _touchDrc;
                        } else {
                            _touchDrc = "default";
                        }
                    } else {
                        if (_distanceY > __touchMinR) {
                            _touchDrc = "DOWN";
                        }
                        else if (_distanceY < -__touchMinR) {
                            _touchDrc = "UP";
                        } else {
                            _touchDrc = "default";
                        }
                    }
                }

            },
            endFn:function (e) {
                if (!isTouchMobile()) {
                    e.preventDefault();
                }
                _touch = "up";
                if(THIS.autoPlay == true){
                    clearInterval(THIS.timer);
                    THIS.timer = window.setInterval(function () {
                        THIS.kvId = THIS.kvId + 1 < THIS.maxKvLen ? THIS.kvId + 1 : 0;
                        THIS.switchF(THIS.kvId);
                    }, THIS.duration);
                }
            //    $("#test").html('__touchDirection:' + _distanceX + " " + __touchDirection);
                if (__touchDirection == "UP" || __touchDirection == "DOWN") {
                    __touchDirection = null;
                    return;
                }
                switch (_touchDrc) {
                    case "LEFT":
                        THIS.touchDistance(_distanceX);
                        break;
                    case "RIGHT":
                        THIS.touchDistance(_distanceX);
                        break;
                    case "UP":
                        break;
                    case "DOWN":
                        break;
                    default:
                        break;
                }
            },
            cancelFn:function (e) {
                $("#test").html("cancelFn is true");
                eventFn.endFn(e);
            }
        };
        if (isTouchMobile() == true) {
            sectionKV.ontouchstart = function (e) {
                eventFn.startFn(e);
            };
            sectionKV.ontouchmove = function (e) {
                eventFn.moveFn(e);
            };
            sectionKV.ontouchend = function (e) {
                eventFn.endFn(e);
            };
            sectionKV.touchcancel = function (e) {
                eventFn.cancelFn(e);
            }
        } else {
            sectionKV.onmousedown = function (e) {
                eventFn.startFn(e);
            };
            sectionKV.onmousemove = function (e) {
                eventFn.moveFn(e);
            };
            sectionKV.onmouseup = function (e) {
                eventFn.endFn(e);
            };
        }
        $(THIS.switchLI).each(function (idx, node) {
            $(this).unbind("click").bind("click", function (e) {
                e.preventDefault();
                THIS.switchF(idx);
                clearInterval(THIS.timer);
             //   wangfan.detect.onClickCarKv(idx);

                if (THIS.autoPlay == true) {
                    THIS.timer = window.setInterval(function () {
                        THIS.kvId = THIS.kvId + 1 < THIS.maxKvLen ? THIS.kvId + 1 : 0;
                        THIS.switchF(THIS.kvId);
                    }, THIS.duration);
                }
            })
        });
        if (THIS.autoPlay == true) {
            clearInterval(THIS.timer);
            THIS.timer = window.setInterval(function () {
                THIS.kvId = THIS.kvId + 1 < THIS.maxKvLen ? THIS.kvId + 1 : 0;
                THIS.switchF(THIS.kvId);
            }, THIS.duration);
            $(THIS.kvUL).hover(function () {
                clearInterval(THIS.timer);
            }, function () {
                clearInterval(THIS.timer);
                THIS.timer = window.setInterval(function () {
                    THIS.kvId = THIS.kvId + 1 < THIS.maxKvLen ? THIS.kvId + 1 : 0;
                    THIS.switchF(THIS.kvId);
                }, THIS.duration);
            });
        }
    },
    touchDistance:function (_distanceX) {
        if (_distanceX < 0) {
            this.kvId = this.kvId + 1 <= $(this.kvLI).length - 1 ? this.kvId + 1 : $(this.kvLI).length - 1;
            this.switchF(this.kvId);
         //   wangfan.detect.onTouchChangeCarKv('touch_left', this.kvId);

        }
        else if (_distanceX > 0) {
            this.kvId = this.kvId - 1 >= 0 ? this.kvId - 1 : 0;
            this.switchF(this.kvId);
          //  wangfan.detect.onTouchChangeCarKv('touch_right', this.kvId);

        }
    }
};
/*
 * 车型动画 * */
var carIdxFn = {
    dragObj:null,       //鼠标或手势作用事件的对象
    touch:null,         //鼠标或手势临时变量
    touchMove:null,     //具有滑动动画的对象
    touchStartX:null,   //鼠标或手势开始的X轴位置
    touchStartY:null,   //鼠标或手势开始的Y轴位置
    touchEndtX:null,    //鼠标或手势结束的X轴位置
    touchEndtY:null,    //鼠标或手势结束的Y轴位置
    distanceX:null,     //鼠标或手势产生的X轴位移
    distanceY:null,     //鼠标或手势产生的Y轴位移
    touchDrc:null,      //鼠标或手势最终获得的移动方向，值有：LEFT、RIGHT、UP、DOWN
    currSence:null,     //记录可见区显示的当前的场景ID，从0计数
    maxLen:null,        //记录滑动对象的总个数
    step:null,          //记录滑动对象的总个数
    isAnimate:false, //记录滑动对象是否具有动画的状态，值有：true、false
    touchFn:function() {           //统一鼠标、手势的事件为一体
        var T = this;
        if (isTouchMobile() == true) {          //touch事件
            $(T.dragObj)[0].ontouchstart = function (e) {
                T.startFn(e);
            };
            $(T.dragObj)[0].ontouchmove = function (e) {
                T.moveFn(e);
            };
            $(T.dragObj)[0].ontouchend = function (e) {
                T.endFn(e);
            }
        } else {                //鼠标事件
            $(T.dragObj)[0].onmousedown = function (e) {
                T.startFn(e);
            };
            $(T.dragObj)[0].onmousemove = function (e) {
                T.moveFn(e);
            };
            $(T.dragObj)[0].onmouseup = function (e) {
                T.endFn(e);
            }
        }
    },
    startFn:function (e) {          // //鼠标或手指按住不动的方法
        //    e.preventDefault();           //不能阻止，否则在touch设备上a、onclick不能点
        if (isTouchMobile() == false) {     //在PC上，需要阻止一下默认事件
            e.preventDefault();
        }
        e.stopPropagation();            //取消冒泡，很有必要
        $(".car_kv,.car_detail .cmnBox").removeClass("trans");      //移除CSS3动画
        this.touchStartX = isTouchMobile() == true ? e.touches[0].pageX : e.pageX;
        this.touchStartY = isTouchMobile() == true ? e.touches[0].pageY : e.pageY;
        this.touch = "down";
    },
    moveFn:function (e) {            //鼠标或手指按住正在拖动的方法
        e.preventDefault();
        e.stopPropagation();             //取消冒泡，很有必要
        var T = this;
        if (this.touch == "down") {
            if (__touchDirection == "LEFT" || __touchDirection == "RIGHT") {        //如果方向是左右，则取消下面的动作
                return;
            }
            this.touchMove = true;
            this.touchEndtX = isTouchMobile() == true ? e.touches[0].pageX : e.pageX;
            this.touchEndtY = isTouchMobile() == true ? e.touches[0].pageY : e.pageY;
            this.distanceX = this.touchEndtX - this.touchStartX;
            this.distanceY = this.touchEndtY - this.touchStartY;
            if (Math.abs(this.distanceY) < __touchMinR) {
                return;
            }
            if (Math.abs(this.distanceX) > Math.abs(this.distanceY)) {          //当X轴移动的位移大于 Y轴移动的位置
            }
            else {                                                                      //当X轴移动的位移小于等于 Y轴移动的位置，记为：Y轴移动，调用Y方向的方法
                var y = this.distanceY;
                var _t, _top;
                if (this.distanceY > __touchMinR) {
                    this.touchDrc = "DOWN";         //向下逐步滑动            一个临时的变量，记录手势按下去的状态，
                    __touchDirection = this.touchDrc;
                    if (this.currSence == 0) {
                    }
                    if (this.currSence == 1) {
                        i = this.currSence;
                        _top = -T.step + y < 0 ? -T.step + y : 0;
                        $(".car_kv").css({top:_top, zIndex:3});
                        $(".box" + i).css({top:0.5 * y, zIndex:2});
                    }
                    else {
                        i = this.currSence;
                        _top = -T.step + y < 0 ? -T.step + y : 0;
                        $(".box" + (i - 1)).css({top:_top, zIndex:3});
                        $(".box" + i).css({top:0.5 * y, zIndex:2});
                    }
                    //页面向上的逐帧动画
                }
                else if (this.distanceY < -__touchMinR) {          //滑动位移小于0，
                    this.touchDrc = "UP";               //向上逐步滑动
                    __touchDirection = this.touchDrc;
                    /*页面向上的逐帧动画
                     this.distanceY     : 纵向移动的位移
                     this.currSence ：场景ID
                     */
                    if (this.currSence == 0) {
                        _top = $("#car_kv").height() > T.step ? $("#car_kv").height() + 50 : $("#car_kv").height();
                        $(".car_kv").css({top:0.5 * y, zIndex:0});
                        var _box1Top = _top + y > 0 ? _top + y : 0;
                        $(".box1").css({top:_box1Top, zIndex:2});
                    }
                    else if (this.currSence == this.maxLen) {
                    }
                    else {
                        var i = this.currSence;
                        $(".box" + i).css({top:0.5 * y, zIndex:0});
                        _t = T.step - 35;
                        _top = _t + y > 0 ? _t + y : 0;
                        $(".box" + (i + 1)).css({top:_top, zIndex:2});
                    }
                } else {
                    this.touchDrc = "default";
                }
            }
        }
    },
    endFn:function (e) {                //鼠标或手指松开的方法

        this.touch = "up";
        if (__touchDirection == "LEFT" || __touchDirection == "RIGHT") {
            __touchDirection = null;
            return;
        }else{
            __touchDirection = null;
        }
        if (this.touchMove) {
            this.touchMove = false;
            if (this.distanceY >= __touchMinR) {
                if (this.currSence >= 1) {
                    this.currSence--;
                    this.isAnimate = true;
                    this.animateFn();
                }
            } else if (this.distanceY <= -__touchMinR) {
                if (this.currSence < this.maxLen) {
                    this.currSence++;
                    this.isAnimate = true;
                    this.animateFn();
                }
             } else {
                 this.animateFn();
            }

        }
     //   $("#test").html("__touchDirection:" + __touchDirection);
    },
    //手指或鼠标松开后的动画
    animateFn:function () {              //手指或者鼠标松开后 恢复定位的动画（后期优化尽量改成CSS3）
        var T = this;
        $(".car_kv,.car_detail .cmnBox").addClass("trans");

        if (this.currSence == 0) {
            var _top = $("#car_kv").height() > T.step ? $("#car_kv").height() + 50 : $("#car_kv").height();
            $(".car_kv").css({top:0});
            $(".cmnBox").not($(".car_kv")).css({top:T.step });
            $(".box1").css({top:_top });
        }
        else if (this.currSence == 1) {
            $(".car_kv").css({top:-$("#car_kv").height()});
            $(".box1").css({top:0});
            $(".box2").css({top:T.step - 35});
        }
        else {
            $(".box" + (this.currSence - 1)).css({top:-T.step});
            $(".box" + (this.currSence)).css({top:0 });
            $(".box" + (this.currSence + 1)).css({top:T.step - 35});
        }

        window.setTimeout(function(){

            $(window).trigger("myScrollEnd");           //抛出自定义事件
        },500);     //时间与.trans 的时间一致
    },

    init:function (f) {
        var T = this;
        this.dragObj = f.dragObj || "body";         //当前拖动的DOM
        this.currSence = f.currSence || 0;          //当前场景
        this.maxLen = f.maxLen || $(".cmnBox").length;                 //当前场景
        this.step = f.step || 480;                    //当前场景
        $(".car_detail .cmnBox").height(this.step);

        this.touchFn();
        this.animateFn();
    }
};




//调试模式
function viewrModelFn() {
    if (storageFn.get("viewer") != "Programmer") {        //非程序员模式
        var _str = checkPlatform();
        if (_str == "ipad") {
       //     window.location.href = "http://www.chevrolet.com.cn/";
        }
        if (_str == "windows") {
        //    window.location.href = "http://www.chevrolet.com.cn/";
        }
        else {
            //其余归类为手机模式
        }
    }
    //程序员模式
    else {

    }
}




/*
 * 手机上全屏看大图，可拖拽，可滑动轮播展示
 * */
var jackyPicViewJ = {
    moveObj:".popPicView .boxBody .ulList",
    currIdx:0,
    maxIdx:0,
    stepW:"",
    bindEvent:function () {
        var _touchStartX, _touchDown, _touchMove, _posL, _distanceX, _mObj = $(jackyPicViewJ.moveObj)[0];
        if (checkPlatform() == "android" || checkPlatform() == "iphone" || checkPlatform() == "ipod" || checkPlatform() == "ipad" || checkPlatform() == "blackberry") {  //MOBILE
            _mObj.ontouchstart = function (e) {
                e.preventDefault();
                _touchStartX = e.touches[0].pageX;
                _touchDown = true;
                _posL = parseInt($(_mObj).css("left"));
            };
            _mObj.ontouchmove = function (e) {
                if (_touchDown) {
                    _touchMove = true;
                    _distanceX = e.touches[0].pageX - _touchStartX;
                    //     $("#test").text(_distanceX);
                }
            };
            _mObj.ontouchend = function (e) {
                e.preventDefault();
                if (_touchDown && _touchMove) {
                    _touchDown = false;
                    _touchMove = false;
                    if (_distanceX > 20) {     //从左向右
                        jackyPicViewJ.currIdx = jackyPicViewJ.currIdx - 1 >= 0 ? jackyPicViewJ.currIdx - 1 : jackyPicViewJ.currIdx;
                        jackyPicViewJ.animateFn();
                    }
                    else if (_distanceX < -20) {
                        jackyPicViewJ.currIdx = jackyPicViewJ.currIdx + 1 <= jackyPicViewJ.maxIdx ? jackyPicViewJ.currIdx + 1 : jackyPicViewJ.currIdx;
                        jackyPicViewJ.animateFn();
                    } else {
                        console.log("滑动不够:" + _touchDown);
                    }
                }
            };
        } else {
            $(jackyPicViewJ.moveObj)[0].onmousedown = function (e) {
                e.preventDefault();
                _touchStartX = e.pageX;
                _touchDown = true;
                _posL = parseInt($(_mObj).css("left"));
            };
            $(jackyPicViewJ.moveObj)[0].onmousemove = function (e) {
                if (_touchDown) {
                    _touchMove = true;
                    _distanceX = e.pageX - _touchStartX;
                    //    $("#test").text(_distanceX);
                }
            };
            $(jackyPicViewJ.moveObj)[0].onmouseup = function (e) {
                e.preventDefault();
                if (_touchDown && _touchMove) {
                    _touchDown = false;
                    _touchMove = false;
                    if (_distanceX > 20) {     //从左向右
                        jackyPicViewJ.currIdx = jackyPicViewJ.currIdx - 1 >= 0 ? jackyPicViewJ.currIdx - 1 : jackyPicViewJ.currIdx;
                        jackyPicViewJ.animateFn();
                    }
                    else if (_distanceX < -20) {
                        jackyPicViewJ.currIdx = jackyPicViewJ.currIdx + 1 <= jackyPicViewJ.maxIdx ? jackyPicViewJ.currIdx + 1 : jackyPicViewJ.currIdx;
                        jackyPicViewJ.animateFn();
                    } else {
                        console.log("滑动不够:" + _touchDown);
                    }
                }
            };
        }
    },
    jsonPic:[
    ],
    jsonWord:[
    ],
    animateFn:function (method) {
        if (method == "init") {
            $(jackyPicViewJ.moveObj).css({marginLeft:-jackyPicViewJ.currIdx * jackyPicViewJ.stepW});
        } else {
            $(jackyPicViewJ.moveObj).animate({marginLeft:-jackyPicViewJ.currIdx * jackyPicViewJ.stepW}, 200);
        }
    },
    data:function () {
        $(jackyPicViewJ.moveObj).width(jackyPicViewJ.stepW * (jackyPicViewJ.maxIdx + 1));
        var _html = "", picurl,picword;
        for (var i = 0; i <= jackyPicViewJ.maxIdx; i++) {
            picurl = jackyPicViewJ.jsonPic[i];
            wordurl = jackyPicViewJ.jsonWord[i];
            _html += '<li style="background-image: url(' + picurl + ')"><span class="carInfo">'+wordurl+'</span></li>';
        }
        $(jackyPicViewJ.moveObj).html(_html).find("li").width(jackyPicViewJ.stepW).height(window.innerHeight);
        jackyPicViewJ.animateFn("init");        //默认展示的图片id
        jackyPicViewJ.bindEvent();              //手动展示
    },
    init:function () {
        $(".aLightPic").each(function (idx, node) {
            jackyPicViewJ.jsonPic[idx] = $(this).attr("href");
            jackyPicViewJ.jsonWord[idx] = $(this).attr("data-word");
			if(jackyPicViewJ.jsonWord[idx]== null){
				$('.carInfo').hide();
			}
            jackyPicViewJ.stepW = window.innerWidth;
            jackyPicViewJ.maxIdx = jackyPicViewJ.jsonPic.length - 1;
            $(this).unbind("click").bind("click", function (e) {
                e.preventDefault();
                $("#popHtml").load("/data.html #popPicView", function () {
                    jackyPicViewJ.currIdx = idx;        //设置要展示的图片id
                    jackyPicViewJ.data();
                    jackyFn.filterAbs("yes", $("body"), "filterAbs_PicView");
                    $("#popPicView").fadeIn();
                });
             //   wangfan.detect.onClickCarHomPic($(this));
            });
        });
    },
    resize:function () {
        jackyPicViewJ.stepW = window.innerWidth;
        $(jackyPicViewJ.moveObj).find("li").width(window.innerWidth).height(window.innerHeight);
        $(jackyPicViewJ.moveObj).width(jackyPicViewJ.stepW * (jackyPicViewJ.maxIdx + 1));
        this.animateFn("init");
    }
};


/*
 * 判断手机或touch设备横竖屏
 * */
function orientationChange() {
    if (window.orientation == 90 || window.orientation == -90) {      //横屏
        var fn90 = function () {//横屏时调用的方法
            if ($("#filterAbs_PicView").hasClass("active")) {
            } else {
                //$("#popScreenH").show();
                jackyFn.filterAbs("yes", $("body"), "fiterAbs_popScreenH", {
                    zIndex:999
                });
            }
        };
        if ($("#nav").hasClass("active")) {//如果有active，表示导航是展开的状态，
            $("#head .menu .iconMenu").click(); //执行自动点击，收起导航
            window.setTimeout(function () {
                fn90();
            }, 400)
        } else {
            fn90();
        }
    } else {
        $("#popScreenH").hide();
        jackyFn.filterAbs("no", $("body"), "fiterAbs_popScreenH");
        //默认竖屏
    }
    resizeFn.prevMain();        //预加载基本的尺寸方法
    resizeFn.initDom();         //重置dom显示比例
    $("#popScreenH").width(window.innerWidth).height(window.innerHeight);
    try {
        jackyPicViewJ.resize();     //查看大图的时候，横竖屏切换需要改变图片尺寸
    } catch (err) {

    }
}
 

function highttestBtnFn(){
	storageFn.set('ishightTestdrive','yes');
	window.location.href="{:CUSTOM_TEMPLATE_PATH}Index/mall/js/try.html";
}

$(function () {
    $("body").append('<div class="popScreenH" id="popScreenH"></div>');         //出现横屏遮罩，提示用户竖屏浏览
    //初始化浏览模式
   // viewrModelFn();
    
    jackyFn.loadingFn("yes");       //出现loading浮层

    
    if (storageFn.get("viewer") == "Programmer") {  //程序员开发模式，显示test显示条，只是为了测试，不影响正式线上
        $("#test").show();
    }else{
        $("#test").hide();
    }

    //微信分享的图标
  //  $("body").prepend('<div style="position:absolute; z-index:999; top:-10000px; left:0;"><img src="../../icon-300x300.png"/*tpa=http://api2.v-top.cn/icon-300x300.png*/></div>');
});

/*
 ga方法

 _gaq.push(['_trackEvent', "nav",'click','logo']);
 _gaq.push(['_trackPageview', '/test-link/']);

 */
//$.getScript("js/detect_code.js"/*tpa={:CUSTOM_TEMPLATE_PATH}Index/mall/js/js/detect_code.js*/,function(){
//console.log("已载入检测代码JS");
//});









