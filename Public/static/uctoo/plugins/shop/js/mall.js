//删除购物车商品
oncartdel();
//判断值是否在数组中
function inArray(needle,haystack){
	type=typeof(needle);
	if(type=='string' || type=='number'){
		for(var i in haystack){
			if(haystack[i]==needle)
				return true;
		}
	}
	return false;
}
function oncartdel(){
	$(".price_remover a.remove").click(function(){
		var url=$(this).attr('href');
		$.get(url,'',function(data){
			upcartgoods(data);
			//$(this).parents('li.clearfix').remove();
		});
		return false;
	});
}
//更新购物车
function upcartgoods(goods){
	if(!goods){
		goods = [];
		goods.allnum=0;
		goods.allprice="0.00";
	}
	if(typeof(goods.allnum)=='undefined')
		goods.allnum=0;
	$("#topCart_allnum").html(goods.allnum);
	if(typeof(goods.allprice)=='undefined')
		goods.allprice="0.00";
	$("#topCart_allprice").html("￥"+goods.allprice);	
	if(goods.status==1){
		var html = '';
		var tmp_attr='';
		$.each(goods,function(i,v){
			//daley:2014.06.30:style="width:50px" for IE9
			if(v.id){ //alert(v.ori_attr);alert(v.attr);
				if(v.ori_attr!='')
					tmp_attr='<div>属性: '+v.attr+'</div>';
				else
					tmp_attr='';
				html += '\
				<li class="clearfix">\
					<a href="'+v.url+'"><img class="fll" width="50" style="width:50px" src="'+v.icon+'" /></a>\
					<div class="cart_list_product_title">\
						<a href="'+v.url+'">'+v.name+'</a>\
						<div>数量: '+v.num+'</div>\
						'+tmp_attr+'\
					</div>\
					<div class="price_remover">\
						<a href="'+v.delurl+'" class="remove" title="删除">×</a>\
						<span class="amount">¥'+v.price+'</span>\
					</div>\
				</li>\
				';
			}
		});
		if(html=='')
			html='<li style="text-align:center">您还未选购商品哦。</li>';
		$("#topCart_goods").html(html);
	}
	else//处理错误信息
		alert(goods.info);	
	oncartdel();
}
//添加购物车
function addcart(goods_id,sid){	
	if(!goods_id){
		showbox('购物车','您还没有选择商品。');
		return false;
	}
	//S:判断是否选择商品属性
	var sltTmp;
	var d_flag=1;
	var slt_attrids=[];
	if($("#pro_attr_div_"+goods_id).html()!=''){ //如果商品有属性
		$("#pro_attr_div_"+goods_id+" div").each(function(){
			sltTmp=$(".pro_attr[slt=1]",$(this))[0];
			if(typeof(sltTmp)=='undefined'){
				if(typeof(pageFlag)!='undefined' && pageFlag=='pro_detail')//如果在商品详细页
					alert("请选择“"+$(this).attr('name')+"”");
				else{		
					if(document.getElementById('d_cart_box')!=null)
						alert("请选择“"+$(this).attr('name')+"”");
					selectshop(goods_id,sid);
				}
				d_flag=0;
				return false;	
			}
			else
				slt_attrids.push($(sltTmp).attr('attr_id'));
		});
		if(d_flag==0)
			return false;
	}
	//End
	if(!sid){
		if(typeof(pageFlag)!='undefined' && pageFlag=='pro_detail')//如果在商品详细页
			alert("请选择“供货商”");
		else{
			if(document.getElementById('d_cart_box')!=null)
				alert("请选择“供货商”");
			selectshop(goods_id,'');
		}
	}else{
		//提交到购物车
		//alert(slt_attrids.join(','));return;http://weixin.topspring.com/index.php?s=/Home/Index/shopcart/act/add.html
		$.post('/index.php?s=/Home/Index/shopcart/act/add.html',{id:goods_id,sid:sid,slt_attrids:slt_attrids.join(',')},function(data){ //"{:U('shopcart','act=add')}"
			showbox("购物车",data.info);
			//daley:2014.06.30:避免已存在商品的时候刷新购物车（此时未取出购物车数据）
			if(data.info!='购物车已存在该商品。')
				upcartgoods(data.goods);
		},'JSON');
		//alert(33);
	}
}
//cart box//选择商店（供货商）和属性goods_id：商品ID,value:供货商初始值
function selectshop(goods_id,value){//
	$.post('/index.php?s=/Home/Index/getshops.html',{id:goods_id},function(data){ //"{:U('getshops')}"
		if(!data){
			showbox("购物车","暂无相关供货商。");
		}else{
			//S:daley:2014.07.05:add:选择商品属性
			var html='<div id="d_cart_box" pro_id="'+goods_id+'">';
			if($('#pro_attr_div_'+goods_id).html()!='')
				html+='请选择商品属性：<br />'+$('#pro_attr_div_'+goods_id).html();
			//End
			html += '请选择供货商：<select id="buyshop"><option value="" class="active"'+(value==''?' selected="selected"':'')+'>请选择供货商</option>';
			$.each(data,function(i,v){
				html +='<option value="'+v.id+'"'+(value==v.id?' selected="selected"':'')+'>'+v.title+'</option>';
			});
			html += '</select></div>';
			showbox('购物车',html,function(){
				/*$(".pro_attr").click(function(){pro_attr_click(this)});
				$(".pro_attr").mouseover(function(){pro_attr_mouseover(this)});
				$(".pro_attr").mouseout(function(){pro_attr_mouseout(this)});*/
				var sid=$("#buyshop").val();
				addcart(goods_id,sid);
			});
		}
	});
	
}
//提示
function showbox(title,html,func){
	$("#shopdialog").html(html);
	$("#shopdialog").dialog({
			title:title,
			show:"slideDown",
			buttons: [ { 
				text: "确定", 
				click: function() { 
					$( this ).dialog( "close" ); 
					//daley:bak:func();
					try{func()}catch(e){}
				} } ]
		});
}

//计算商品价格并显示//daley:continue:算法可以再优化
function getMainPrice(pro_id){
	//此处，#pro_attr_div_{$id}如为<p>元素，则用$('#pro_attr_div_{$id} .pro_attr')不行
	var floatPrice=parseFloat($('#ori_mainprice_'+pro_id).html());//初始价格
	$('#pro_attr_div_'+pro_id+' .pro_attr').each(function(){
		if($(this).attr('slt')==1){
			floatPrice+=parseFloat($(this).attr('price'));//浮动价格
		}		
	});
	floatPrice=floatPrice.toFixed(2);
	//alert(floatPrice);
	$('#mainprice_'+pro_id).html(floatPrice);
}
//ctrl：控制无限循环调用
function pro_attr_click(it,ctrl){
	if($(it).attr('path')!='')//设置属性对应图片
		$('#mainimg').attr('src',$(it).attr('path'));
	//background:url(/Public/Home/images/d_slt.jpg) no-repeat right 0 bottom 0
	$(".pro_attr",$(it).parent()).attr('slt',0).css({'background':'none','border':'1px solid #999'});
	$(it).attr('slt',1).css({'background':'url(/Public/Home/images/d_slt.jpg) no-repeat right 0 bottom 0','border':'1px solid #f00'});
	//$(it).unbind('mouseout');
	var itPp=$(it).parent().parent();
	var pro_id=itPp.attr('pro_id');	
	//alert($(it).parent().parent().attr('id'));
	//S:购物车弹出框和页面Div的映射
	if(ctrl==0){
		var attr_id=$(it).attr('attr_id');
		/*if(!inArray(attr_id,slt_attrids))
			slt_attrids.push(attr_id);*/
		if(itPp.attr('id')=='d_cart_box')
			pro_attr_click($("#pro_attr_div_"+pro_id+" .pro_attr[attr_id='"+attr_id+"']")[0],1);			
		else
			pro_attr_click($("#d_cart_box .pro_attr[attr_id='"+attr_id+"']")[0],1);
		getMainPrice(pro_id);
	}
	//End
	//getMainPrice(pro_id);
}
function pro_attr_config(it,ctrl){

    //background:url(/Public/Home/images/d_slt.jpg) no-repeat right 0 bottom 0
    $(".pro_attr",$(it).parent()).attr('slt',0).css({'background':'none','border':'1px solid #999'});
    $(it).attr('slt',1).css({'background':'url(/Public/Home/images/d_slt.jpg) no-repeat right 0 bottom 0','border':'1px solid #f00'});
    //$(it).unbind('mouseout');
    var itPp=$(it).parent().parent();
    var pro_id=itPp.attr('pro_id');
    //alert($(it).parent().parent().attr('id'));
    //S:购物车弹出框和页面Div的映射
    if(ctrl==0){
        var attr_id=$(it).attr('attr_id');
        /*if(!inArray(attr_id,slt_attrids))
         slt_attrids.push(attr_id);*/
        if(itPp.attr('id')=='d_cart_box')
            pro_attr_click($("#pro_attr_div_"+pro_id+" .pro_attr[attr_id='"+attr_id+"']")[0],1);
        else
            pro_attr_click($("#d_cart_box .pro_attr[attr_id='"+attr_id+"']")[0],1);
        getMainPrice(pro_id);
    }
    //End
    //getMainPrice(pro_id);
}
function pro_attr_cfg(it,ctrl){

    $(".pro_attr",$(it).parent()).attr('slt',0).css({'background':'none','border':'1px solid #999'});
    $(it).attr('slt',1).css({'background':'url(/Public/Home/images/d_slt.jpg) no-repeat right 0 bottom 0','border':'1px solid #f00'});

    var baseprice = parseFloat($('#base_price').attr("price"));
    var attrpricesum = 0;
    var dzprice = parseFloat($('#dzprice .pro_attr[slt=1]').attr("price"));;
    //选中状态的属性价格总和，包括可配置属性和固定属性
    $( ".pro_attr[slt=1]" ).each(function() {
        attrpricesum = attrpricesum + parseFloat($( this).attr("price"));
    });
    var cfgpricesum = attrpricesum - dzprice; //可配置项价格总和= 所有属性价格总和 - dzprice项总和
    var cfgprice = baseprice+cfgpricesum+dzprice ; //商品总价= 原价+定制价+价格调节属性
    $('#cfg_price').attr("price",cfgprice)
    $('#cfg_price').html(baseprice+'(原价)+'+cfgpricesum+'(配件价)+'+dzprice+'（定制价）='+'￥'+cfgprice);

}
function pro_attr_mouseover(it){
	$(it).css('border','1px solid #f00');
}
function pro_attr_mouseout(it){
	if($(it).attr('slt')==0)
		$(it).css('border','1px solid #999');
}
/*$(".pro_attr").click(function(){pro_attr_click(this)});
$(".pro_attr").mouseover(function(){pro_attr_mouseover(this)});
$(".pro_attr").mouseout(function(){pro_attr_mouseout(this)});*/