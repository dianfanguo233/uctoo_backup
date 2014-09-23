var flagMove = false;
//resizeFn
var resizeFn = {
	
    prevMain:function () {
		
		   var _windowWidth = window.innerWidth != null ? window.innerWidth : $(window).width();
		    var _windowHeight = window.innerHeight != null ? window.innerHeight : $(window).height();
		
		   
		   if(_windowWidth<=_windowHeight)
		   {
		$dwh=_windowWidth-20;
		$mt=(_windowHeight-$dwh-40)/2
		   }
		   else
		   {
			  $dwh=_windowHeight-60;
			  $mt=(_windowHeight-$dwh-40)/2
			   }
		   
		 
		$(".hmenu").css({"margin-top":$mt+"px","width":$dwh+"px","height":$dwh+"px"}) 
       
        $("#main").height(_windowHeight + 500);
        $("#container").height(_windowHeight + 200);
        if (isBrowse().chrome) {
        } else {
            $(window).scrollTop(1);
        }
		
    },
    initDom:function () {
        var _windowHeight = window.innerHeight != null ? window.innerHeight : $(window).height();
        var winVisiH = _windowHeight - $("#head").height()-30; //重置成新高度
        $("#main").height(winVisiH+30);
        $("#serviceBlock").height(winVisiH);
        $("#container").height(_windowHeight);
		$(".ermenu").height(winVisiH);
		
    }
};




var serviceFn = {
    flodFn:function(){
        var T = this;
        $(T.domTitle).each(function(idx){
            $(this).bind("click",function(){
                $(T.domLi).not($(T.domLi).eq(idx)).removeClass("liCurr").find(".f_right").html("+");
                $(T.domText).not($(T.domLi).eq(idx)).stop(true,false).slideUp();
                $(T.domLi).eq(idx).toggleClass("liCurr");
                if($(T.domLi).eq(idx).hasClass("liCurr")){
                    $(T.domLi).eq(idx).find(".f_right").html("-");
                }else{
                    $(T.domLi).eq(idx).find(".f_right").html("+");
                }
                $(T.domText).eq(idx).stop(true,false).slideToggle(function(){

                });
            });
        });
    },
    myScroll:null,
    dragFn:function(){
		 
		
        	window.myScroll = new iScroll("serviceBlock", {
            myscroll:false,
            vScrollbar:true,
            bounce:true,
            fixedScrollbar:false,
            checkDOMChanges:true,
            useTransform:false,
            hideScrollbar:true
        });
        myScroll.refresh();
    },
	loadFHtml:function(){
		$(".switchBtn li").removeClass('switchPoint');
		$(".switchBtn li").eq(0).addClass('switchPoint');
	//	wangfan.detect.onServiceTabChange('金领结服务特色');
		$(".allcon").load("serviceInfo.html .serviceConF",function(){
			 serviceFn.flodFn();
		})
	},
	loadSHtml:function(){
		$(".switchBtn li").removeClass('switchPoint');
		$(".switchBtn li").eq(1).addClass('switchPoint');
	//	wangfan.detect.onServiceTabChange('雪佛兰延保产品');
		$(".allcon").load("serviceInfo.html .serviceConS",function(){
			 serviceFn.flodFn();
			// $(".dasd").height(90);
			 $('.tway').toggle(
			 	function(){
				 	$(".TINFO").slideDown('normal');
					$('.tway b').html('-')
				},function(){
				 	$(".TINFO").slideUp('normal');
					//alert( $(".dasd").height());
					$('.tway b').html('+');
				}
				
			)
		})
	},
	 
    init:function(){
        this.domLi = ".serviceBlock .cntBox .ulList li";
        this.domTitle = ".serviceBlock .cntBox .ulList li .title";
        this.domText = ".serviceBlock .cntBox .ulList li .text";
		 
		//this.loadFHtml();
	 
		this.dragFn();
		 
		this.clickFn();
	 
    }
};
	
$(function () {
 
    document.addEventListener('touchmove', function (e) {
        e.preventDefault();
    }, false);
    window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", orientationChange, false);
    $(window).bind({
        "load":function () {
          
            resizeFn.prevMain();
            resizeFn.initDom();
            jackyFn.loadingFn("no");
            serviceFn.init();

           
        }
    });
});