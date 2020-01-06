// JavaScript Document

$(function(){
	'use strict';
/*弹出框隐藏*/
	$(".pop").hide();
	$("#hiddenDiv").css({"visibility":"visible"});
/*导航切换*/
	$(".header-nav a").click(function(){
		$(".header-nav a").removeClass("active");
		$(this).addClass("active");
	});
/*下拉链接*/
	$(".dropdown-link").click(function(){
		if($(this).children("ul").is(":hidden")){
			$(this).children("ul").fadeIn(100);
		}else{
			$(this).children("ul").fadeOut(100);
		}
	});
	$(".dropdown-link").mouseleave(function(){
		$(this).children("ul").fadeOut(100);
	});
/*消息提醒下拉切换*/
     $('.dropdown-notice').click(function () {
		if($(this).find(".notice-box").is(":hidden")){
			$(this).find(".notice-box").fadeIn(100);
		}else{
			$(this).find(".notice-box").fadeOut(100);
		}
     });  
	$(".dropdown-notice").mouseleave(function(){
		$(this).children(".notice-box").fadeOut(100);
	});
/*header-hover*/
	$(".header-box").hover(function(){
		$(this).addClass("hover");
	},function(){
		$(this).removeClass("hover");
	});
/*左边一级菜单滚动*/
    $("#menuScrollbar").perfectScrollbar();
/*左边菜单点击切换*/
	$(".menu-1st-box>span").click(function(){
		if($(this).parents(".menu-left").hasClass("menu-1st-collapse")){
			$(this).removeClass("menu-1st-ctrl");
			$(this).parents(".menu-left").removeClass("menu-1st-collapse");
			var mainLeft = $(".menu-2nd-box").offset().left+180;
			$(".main").stop(true,true).animate({left:mainLeft},100);
		}else{
			$(this).addClass("menu-1st-ctrl");
			$(this).parents(".menu-left").addClass("menu-1st-collapse");
			var mainLeft = $(".menu-2nd-box").offset().left+180;
			$(".main").stop(true,true).animate({left:mainLeft},100);
		}
	});
/*没有二级菜单的一级菜单被点击时*/
	$(".menu-2nd-box .menu-2nd").eq(0).show();
	$(".menu-1st a").click(function(){
		var menuNub = $(".menu-1st a").index(this);
		$(this).addClass("menu-1st-cur").siblings("a").removeClass("menu-1st-cur");
		$(".menu-2nd").hide().eq(menuNub).fadeIn(200);
		$(".menu-2nd-box em").removeClass("menu-2nd-collapse");
		if($(this).hasClass("menu-no2nd")){
			$(".menu-2nd-box").stop(true,true).animate({right:0},100,function(){
				var mainLeft = $(".menu-2nd-box").offset().left+180;
				$(".main").stop(true,true).animate({left:mainLeft},100);
			});
		}else{
			$(".menu-2nd-box").stop(true,true).animate({right:-180},100,function(){
				var mainLeft = $(".menu-2nd-box").offset().left+180;
				$(".main").stop(true,true).animate({left:mainLeft},100);
			});
		}
	});
	$(".menu-2nd b").hide();
	$(".menu-2nd-cur b").show();
	$(".menu-2nd span").click(function(){
		if($(this).siblings("b").is(":hidden")){
			$(".menu-2nd li").removeClass("menu-2nd-cur");
			$(this).parent("li").addClass("menu-2nd-cur");
			$(".menu-2nd b").slideUp(200);
			$(this).siblings("b").slideDown(200);
		}else{
			$(this).parent("li").removeClass("menu-2nd-cur");
			$(this).siblings("b").slideUp(200);
		}
	});
	$(".menu-2nd a").click(function(){
		$(".menu-2nd a").removeClass("menu-3rd-cur");
		$(this).addClass("menu-3rd-cur");
		$(".check .pop-box iframe").remove();
	});
/*二级菜单控制按钮*/
	$(".menu-2nd-box em").hover(function(){
		if(!$(this).is(":animated")){
			$(this).stop(true,true).animate({width:20},100);
		}
	},function(){
		if(!$(this).is(":animated")){
			$(this).stop(true,true).animate({width:13},100);
		}
	});
	$(".menu-2nd-box em").click(function(){
		if($(this).hasClass("menu-2nd-collapse")){
			$(this).removeClass("menu-2nd-collapse");
			$(".menu-2nd-box").stop(true,true).animate({right:-180},100,function(){
				var mainLeft = $(".menu-2nd-box").offset().left+180;
				$(".main").stop(true,true).animate({left:mainLeft},100);
			});
		}else{
			$(this).addClass("menu-2nd-collapse");
			$(".menu-2nd-box").stop(true,true).animate({right:0},100,function(){
				var mainLeft = $(".menu-2nd-box").offset().left+180;
				$(".main").stop(true,true).animate({left:mainLeft},100);
			});
		}
	});
	
/*菜单缩小时说明*/
	$(".pobox").hide();
	$(".menu-1st a").hover(function(){
		if($(".menu-left").hasClass("menu-1st-collapse")){
		}else{
			var my = $(this).offset();
			$(".pobox").css({ "left" : 48,"top" : my.top});
			var poText = $(this).text();
			$(".pobox").html(poText);
			$(".pobox").show();
		}
	},function(){
		$(".pobox").hide();
	});
/*关闭按钮点击*/
	$(".pop-close").click(function(){
		$(this).parents(".pop").fadeOut(500);
		$(this).parents(".pop-box").stop(true,true).animate({top:0,opacity:"0"},500);
	});
/*弹出框拖动*/
	var dragging = false;
	var iX, iY;
	var helfMove;
	$(".move").mousedown(function(e) {
		dragging = true;
		iX = e.clientX - $(this).parent().offset().left;
		iY = e.clientY - $(this).parent().offset().top;
		helfMove = $(this).parent().width()/2;
		$(this).parent().addClass("move-now");
		return false;
	});
	$(document).mousemove(function(e) {
		if (dragging) {
			var oX = e.clientX - iX;
			var oY = e.clientY - iY;
			$(".move-now").css({left:oX+helfMove, top:oY });
			return false;
		}
	});
	$(document).mouseup(function(e) {
		dragging = false;
		$(".move-now").parent().removeClass("move-now");
 	});


});
