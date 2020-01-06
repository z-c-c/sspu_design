
/*****脚本*****/

/*当前选中*/
function thisAct(select){
	$(select).children().click(function(){
		$(this).addClass("act").siblings().removeClass("act");
	});
}

/*a当前选中*/
function aAct(select){
	$(select).find("a").click(function(){
		$(select).find("a").removeClass("act");
		$(this).addClass("act");
	});
}

/*顶部菜单选中*/
function headNav(select){
	$(select).find("a").click(function(){
		$(select).find("a").removeClass("act");
		$(this).addClass("act");
	});
}

/*tabs*/
function tabsAct(tabsNav,tabsMain){
	$(tabsMain).children().eq(0).nextAll().hide();
	$(tabsNav).children().click(function(){
		var thisNav = $(this).index();
		$(this).addClass("act").siblings().removeClass("act");
		$(tabsMain).children().hide().eq(thisNav).fadeIn(200);
	});
}

/*catalogTree*/
function catalogTree(tree){
	$(tree).find("dt").click(function(){
		if($(this).hasClass("act")){
			$(this).removeClass("act").siblings("dd").slideDown(200);
		}else{
			$(this).addClass("act").siblings("dd").slideUp(200);
		}
	});
}

/*colbox*/
function colbox(){
	$(".colbox").find(".col-btn").click(function(){
		if($(this).hasClass("act")){
			$(this).removeClass("act").siblings(".col-con").removeClass("act");
		}else{
			$(this).addClass("act").siblings(".col-con").addClass("act");
		}
	});
}

/*addCart*/
function addCart(){
	$(".add-cart").click(function(){
		$(this).toggleClass("act");
	});
}

//关闭弹窗
function popClose(pop){
	$(pop).find(".close,.zhe").click(function(){
		$(pop).fadeOut(200);
	});
}



/*****组件*****/
/*vVsub*/
function vVsub(){
//radio
	$(".vV-radio:not(.dis)").click(function(){
		var thisName = $(this).attr("name");
		$("body").find(".vV-radio[name="+thisName+"]").removeClass("ck");
		$(this).addClass("ck");
	});
//checkbox
	$(".vV-check:not(.dis)").click(function(){
		$(this).toggleClass("ck");
	});
//drop
	$(".vV-drop:not(.dis)").click(function(){
		$(this).addClass("focus").find(".drop").fadeIn(200);
	});
	$(".vV-drop").mouseleave(function(){
		$(this).removeClass("focus").find(".drop").fadeOut(200);
	});
	$(".vV-drop .drop a").click(function(){
		var ckText = $(this).html();
		$(this).addClass("act")
			.siblings().removeClass("act")
			.parents(".vV-drop").find(".view").html(ckText);
	});
	$(".vV-drop .case").each(function(){
		// $(this).perfectScrollbar();
		$(this).parents(".drop").hide();
	});
//slider
	$(".vV-slider:not(.dis)").click(function(){
		$(this).toggleClass("off");
	});
//counter
	$(".vV-counter").each(function(){
		$(this).append("<b></b><i></i>");
	});
	$(".vV-counter input").focus(function(){
		$(this).parents(".vV-counter").addClass("focus");
	});
	$(".vV-counter input").blur(function(){
		var nub = parseInt($(this).val().replace(/[^0-9]/ig,""));
		$(this).val(nub);
		$(this).parents(".vV-counter").removeClass("focus");
	});
	$("body").on("click",".vV-counter b",function(){
		var nub = parseInt($(this).siblings("input").val())-1;
		if(nub>0){
			$(this).siblings("input").val(nub);
		}else{
			$(this).siblings("input").val(0);
		}
	});
	$("body").on("click",".vV-counter i",function(){
		var nub = parseInt($(this).siblings("input").val())+1;
		$(this).siblings("input").val(nub);
	});
//tabs
	$(".vV-tabs").children().click(function(){
		$(this).addClass("act")
			.siblings().removeClass("act");
	});
//paging
	$(".vV-paging form a").click(function(){
		$(this).addClass("act")
			.siblings().removeClass("act");
	});
//label
	$(".vV-lab").each(function(){
		$(this).append("<i class='iconfont'>&#xeed7;</i>");
	});
	$("body").on("click",".vV-lab i",function(){
		$(this).parent().remove();
	});
}

// 左侧菜单折叠
function leftMenuTab(){
	var dt = $(".leftMenuBox").find("dt");
	dt.click(function(){
		$(this).toggleClass("active");
		if($(this).next("dd").hasClass("displayNone")){
			$(this).next("dd").removeClass("displayNone");
		}else{
			$(this).next("dd").addClass("displayNone");
		}
	})
}

// 申请资源切换
function myTab(){
	$("#titleTab").find("li").click(function(){
		$(this).addClass("act").siblings().removeClass("act");
		if($(this).index() == 0){
			$(".source1").show().siblings().hide();
		}else{
			$(".source2").show().siblings().hide();
		}
	})
}

// 我的待办轮播
function myToDo() {
	var _now=0;
	   var oul = $(".myToDo-con ul");
	   var numl = $(".indicator li");
	   var wid = $(".myToDo-con ul li").width();
	   //数字图标实现
	   numl.click(function () {
		   var index = $(this).index();
		   $(this).addClass("active").siblings().removeClass();
		   oul.animate({'left': -wid * index}, 500);
	   })
	   //左右箭头轮播
	   $(".myToDo .prev").click(function () {
		   if (_now>=1) _now--;
		   else _now=3;
		   ani();
	   });
	   $(".myToDo .next").click(function () {
		   if (_now == numl.size() - 1) {
			   _now = 0;
		   }
		   else _now++;
		   ani();
	   });
	   //动画函数
	   function ani(){
		   numl.eq(_now).addClass("active").siblings().removeClass();
		   oul.animate({'left': -wid * _now}, 500);
	   }
	   //以下代码如果不需要自动轮播可删除
	   //自动动画
	   var _interval=setInterval(showTime,2000);
	   function  showTime() {
		   if (_now == numl.size() - 1) {
			   _now = 0;
		   }
		   else _now++;
		   ani();
	   }
	   //鼠标停留在画面时停止自动动画，离开恢复
	   $(".myToDo-con").mouseover(function(){
		   clearTimeout(_interval);
	   });
	   $(".myToDo-con").mouseout(function(){
		   _interval=setInterval(showTime,2000);
	   });
}

