/**
 * 
 * 
 * 20160829
 * 新增的js方法请加到最后，并添加相应注释
 * 新增的js方法请加到最后，并添加相应注释
 * 新增的js方法请加到最后，并添加相应注释
 * 新增的js方法请加到最后，并添加相应注释
 * 新增的js方法请加到最后，并添加相应注释
 * 新增的js方法请加到最后，并添加相应注释
 * 新增的js方法请加到最后，并添加相应注释
 * 
 * 
 * 
 * 
 */


//鼠标滑过表格标题效果
function col_on(i) {
	var col=document.getElementById("col"+i);
	col.style.backgroundColor="#d6e7f7";
}
	
function col_out(i) {
	var col=document.getElementById("col"+i);
	col.style.backgroundColor="";
}

//TAB选项卡效果
function selectTag(showContent,selfObj){
	// 操作标签
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// 操作内容
	for(i=0; j=document.getElementById("tagContent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
}


// 显示隐藏层
function select_changed(){  
   document.getElementById("list_search_div").style.display= document.getElementById("list_search_div").style.display=="none"? "":"none";
} 

//复选框全选效果
function CheckAll()
{     
  for (var k=0;k<document.event_type.elements.length;k++)
    {
      var e = document.event_type.elements[k];
      if (e.name != 'allbox')
	e.checked = document.event_type.allbox.checked;
    }
}




function onlyCheckOne(){
	var elementGroup = event.srcElement.parentElement.getElementsByTagName("INPUT");
		for (var i=0;i<elementGroup.length;i++){
			if (elementGroup.item(i)!=event.srcElement 
					&& elementGroup.item(i).type=="checkbox" 
					&& elementGroup.item(i).name== event.srcElement.name ){
				elementGroup.item(i).checked = false;
			}
		}
	}


//乘法函数，用来得到精确的乘法结果
//说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
//调用：accMul(arg1,arg2)
//返回值：arg1乘以arg2的精确结果
function accMul(arg1,arg2)
{
	if(!isNaN(arg1) && !isNaN(arg2)){
		arg1=String(arg1);var i=arg1.length-arg1.indexOf(".")-1;i=(i>=arg1.length)?0:i
		arg2=String(arg2);var j=arg2.length-arg2.indexOf(".")-1;j=(j>=arg2.length)?0:j
		return (arg1.replace(".","")*arg2.replace(".","")/Math.pow(10,i+j)).toFixed(4)
	}else return 0
}

//加法函数，用来得到精确的加法结果
//说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
//调用：accAdd(arg1,arg2)
//返回值：arg1加上arg2的精确结果
function accAdd(arg1,arg2,num){
	if(accAdd.arguments.length < 3) num = 4;
	if(!isNaN(arg1) && !isNaN(arg2)){
		var r1,r2,m;
		try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
		try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
		m=Math.pow(10,Math.max(r1,r2))
		return ((arg1*m+arg2*m)/m) .toFixed(num)
	}else return 0
}

//减法函数，用来得到精确的加法结果
//说明：javascript的减法结果会有误差，在两个浮点数相减的时候会比较明显。这个函数返回较为精确的减法结果。
//调用：accSub(arg1,arg2)
//返回值：arg1加上arg2的精确结果
function accSub(arg1,arg2){
	if(!isNaN(arg1) && !isNaN(arg2)){
		var r1,r2,m;
		try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
		try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
		m=Math.pow(10,Math.max(r1,r2))
		return ((arg1*m-arg2*m)/m).toFixed(4)
	}else return 0
}

//除法函数，用来得到精确的除法结果
//说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
//调用：accDiv(arg1,arg2)
//返回值：arg1除以arg2的精确结果
function accDiv(arg1,arg2){
	if(!isNaN(arg1) && !isNaN(arg2)){
		var t1=0,t2=0,r1,r2;
		try{t1=arg1.toString().split(".")[1].length}catch(e){}
		try{t2=arg2.toString().split(".")[1].length}catch(e){}
		with(Math){
			r1=Number(arg1.toString().replace(".",""))
			r2=Number(arg2.toString().replace(".",""))
			return ((r1/r2)*pow(10,t2-t1)).toFixed(4);
		}
	}else return 0;
}
//格式化数据函数，用来格式化数据
//返回值：arg格式化后的结果
function formatValue(arg,num){
	if(!isNaN(arg)){
		var r,m;
		try{r=arg.toString().split(".")[1].length}catch(e){r=0}
		m=Math.pow(10,Math.max(r))
		return ((arg*m)/m).toFixed(num)
	}else{
		return arg;
	}
}
//格式化数据函数，用来格式化数据
//返回值：arg格式化后的结果
function showValue(id,num){
	var arg = document.getElementById(id).value;
	if(!isNaN(arg)){
		document.getElementById(id).value = formatValue(arg,num);
	}
}


//查询时form表单的提交
//add by zhangxiaoman
function queryFormSubmit(queryDiv,resultTblId) {
	var input = $("#"+queryDiv+"").find('input');
	var param = new Object();
	for (var i=0; i < input.length; i++) {
		if(input[i].value != "") {					
			if(param[input[i].name] != null)
				param[input[i].name] += ";"+input[i].value;
			else
				param[input[i].name] = input[i].value;
		}
	}
	$("#"+resultTblId+"").commonGrid("reload",param);
}

//add by zhangxiaoman(解决datagrid自适应问题)
function resizeGrid(listTbl){
	$('#'+listTbl+'').datagrid('resize', {
		width:function(){return document.body.clientWidth-10;}
	});
}

//获取传入datagrid表头的title
function getColTitles(grid){
	var frofs=grid.datagrid("getColumnFields",false);
	var fsstr="";
	for(var i=0;i<frofs.length;i++){
		var fo=grid.datagrid("getColumnOption",frofs[i]);
		if(fo.title!="操作"){
			if(fsstr==""){
				fsstr=fo.title;	
			}else {
			fsstr=fsstr+","+fo.title;
			}	
		}
	}
	return fsstr;
}
//获取传入datagrid表头的id
function getColFields(grid){
	var fs = grid.datagrid("getColumnFields",false);
	var tmp = fs.pop();
	if(tmp!="operate"){
		fs.push(tmp);
	}
	return fs;
}










/**
 * 以下是新增方法
 * 以下是新增方法
 * 以下是新增方法
 * 以下是新增方法
 * 以下是新增方法
 * 以下是新增方法
 */
//返回宽度百分比
function countWidth(widthPercent,browseWidth){
	return (widthPercent*browseWidth)/100;
}



//弹出新的DIV，目前最多三层，可在index.jsp扩展
//layerNo：弹出层数，从1开始，number类型
//dwidth：弹出div的宽度，string型，百分比or像素，不支持auto
//dheight：弹出div的高度，string型，百分比or像素or auto
//fsrc：div内iframe的src
//fwidth(非必填)：div内iframe宽度，string型，百分比or像素or auto
//fheight(非必填)：div内iframe高度，string型，百分比or像素or auto
//divCss(非必填)：除以上外，需要扩展到DIV的样式，object类型
//例子：openInNewFrame(layerNo,"800.8px","60%","600","90.8%","/test.jsp",{"background-color":"#aaaaaa"});
function openInNewFrame(layerNo,dwidth,dheight,fsrc,fwidth,fheight,divCss){
	var winH = document.body.clientHeight;
	fwidth = fwidth || "100%";
	fheight = fheight || "100%";
	divCss = divCss || {};
	var dmargin = -parseFloat(dwidth)/2;
	var dmargin_top = -parseFloat(dheight)/2;
	var divClass = "newDiv-" + layerNo;
	var newFrameName = "newFrame-"+layerNo;
	$("div."+divClass, top.document).fadeIn(300);
	$("."+divClass+" .pop-box", top.document)
		.css({"z-index":layerNo*1000,"width":dwidth,"height":dheight,"margin-left":dmargin})
		.css(divCss)
		.stop(true, true).animate({
			top : winH/2 + dmargin_top,
			opacity : "1"
			}, 300);
	var fsrcTmp = $("."+divClass+" .pop-box iframe", top.document).attr("src");
	if(fsrc.indexOf("_query")==-1){//如果非查询页面
		$("."+divClass+" .pop-box iframe", top.document).remove();
		$("."+divClass+" .pop-box", top.document).append("<iframe id='"+newFrameName+"' name='"+newFrameName+"' frameborder='0' scrolling='no' width='"+fwidth+"'  height='"+fheight+"' src='"+fsrc+"' ></iframe>");
	}else{
		if(fsrc != fsrcTmp){
			$("."+divClass+" .pop-box iframe", top.document).remove();
			$("."+divClass+" .pop-box", top.document).append("<iframe id='"+newFrameName+"' name='"+newFrameName+"' frameborder='0' scrolling='no' width='"+fwidth+"' height='"+fheight+"' src='"+fsrc+"' ></iframe>");
		}
	}
}

//关闭浮现的DIV
//target(非必填):层数，即DIV打开时的layerNo参数，不传值则默认关闭顶层DIV，支持数组方式一次关闭多个DIV
//例子：closeFrame()关闭顶层;closeFrame(2)关闭第二层;closeFrame([1,2])关闭1,2层
function closeFrame(target){
	//当手动新增安帮对象时，用户添加子女，但没保存安帮对象，便要删除临时id添加的子女
	var pidTemp = $("#pidTemp").val();
	if(pidTemp){
		$.post("/careChildren/deleteCareChildrenByPid",{pid:pidTemp},function(data){
			//alert(pidTemp+data);
		});
	}
	var targetArr = (target instanceof Array) ? target : [];
	if (target && targetArr.length==0) {
		targetArr.push(target);
	}
	var $divs = $("#hiddenDiv",top.document).find("div.pop.inuse");
	var $divArr = [];
	for( var i=0; i<$divs.length; i++) {
		var $div = $divs.eq(i);
		if($div.css("display")=="block"){
			$divArr.push($div);
		}
	}
	if (targetArr.length == 0) {
		if ($divArr.length==0) {
			top.close();
		}else{
			$divArr[$divArr.length-1].fadeOut(300);
		}
		return;
	}
	for (var j = 0; j < targetArr.length; j++) {
		$divArr[targetArr[j]-1].fadeOut(300);
	}
}



/*全屏打开一个新窗口*/
function openAllscreenwin(winURL)
{
	var Allscreenwin = window.open(winURL,"","height=720,width=1015,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
	Allscreenwin.resizeTo(screen.availWidth, screen.availHeight);
}
function openFullWindow(winURL)
{
	window.open(winURL,"", "width=" + screen.availWidth + ",height=" + screen.availHeight + ",top=0,left=0,toolbar=yes,menubar=yes,scrollbars=yes,resizable=yes,location=yes,status=yes");
}
/*居中打开一个新窗口，高度，宽度自定义*/
function openWindowInCenter(winURL,height,width)
{
	var top = (750 - height)/2;
	var left = (1259 - width)/2;
	var InCenterwin = window.open(winURL,"","height=" + height + ",width=" + width + ",top=" + top + ",left=" + left + ",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");

}
//加载附件
function annexDivLoad(annexDivId,typeId,businessId){
	if(businessId!=null&&businessId!=""&&businessId!=undefined){//修改
		  $("#"+annexDivId).load("../../../../mhpm/common/annex_forward.jsp?autoUpload=Y&checkbox=Y&type=list&typeId="+typeId+"&bussinessId="+businessId+"&random="+Math.random()*1000);
	}else{//新增
		  $("#"+annexDivId).load("../../../../mhpm/common/annex_forward.jsp?completeFunc=completeAnnexFunc&autoUpload=N&checkbox=Y&type=list&typeId="+typeId+"&bussinessId="+businessId+"&random="+Math.random()*1000);
	}
}

//验证表单信息,(需要结合easyui-validatebox使用，
//且逻辑验证的表单需要包含displayName属性，
//非空验证的表单需要missingMessage属性)
//参数validType:
//"empty"=仅非空验证;
//"logic"=仅逻辑验证;
//空或不传=两种都验证
function validateForm(validType){
	var flag = true;
	var $validEle = $(".easyui-validatebox");
	$validEle.each(function(index){
		if(!$(this).validatebox('isValid')){
			if((this.getAttribute('required')=="true" || this.getAttribute('required')=="required") && (this.value==null || this.value=="")){
				if (validType && validType!="empty") {
					return;
				}
				alert(this.getAttribute('missingMessage'));
				this.focus();
			}else{
				if (validType && validType!="logic") {
					return;
				}
				alert(this.getAttribute('displayName')+"不符合规范");
				var value = this.value;
				this.value = "";
				this.focus();
				this.value = value;
			}
			flag = false;
			return false;
		}
	});
	return flag;
}

/**************************
*Desc:提交操作时遮罩
*Argument:type=0 全屏遮 1局部遮
*Version:1.0.0
**************************/
 (function ($) { 
    $.fn.jqLoading =function(option) {
        var defaultVal = {
            backgroudColor: "#ECECEC",//背景色
            backgroundImage: "/azbj/images/loading.gif",//背景图片
            text: "正在加载中，请耐心等待....",//文字 
            width: 150,//宽度
            height: 60,//高度
            type:0 //0全部遮，1 局部遮
             
        };
        var opt = $.extend({}, defaultVal, option);
        if (opt.type == 0) {
            //全屏遮
            openLayer();
        } else {
            //局部遮(当前对象应为需要被遮挡的对象)
            openPartialLayer(this);
        }
         
        //销毁对象
        if (option === "destroy") {
            closeLayer();
        }
         
        //设置背景层高
        function height () {
            var scrollHeight, offsetHeight;
            // handle IE 6
            if ($.support.boxModel && $.support.leadingWhitespace) {
                scrollHeight = Math.max(document.documentElement.scrollHeight, document.body.scrollHeight);
                offsetHeight = Math.max(document.documentElement.offsetHeight, document.body.offsetHeight);
                if (scrollHeight < offsetHeight) {
                    return $(window).height();
                } else {
                    return scrollHeight;
                }
                // handle "good" browsers
            }
            else if ($.support.objectAll) {
                return $(document).height() - 4;
            }
            else {
                return $(document).height();
            }
        };
         
        //设置背景层宽
        function width() {
            var scrollWidth, offsetWidth;
            // handle IE
            if ($.support.boxModel) {
                scrollWidth = Math.max(document.documentElement.scrollWidth, document.body.scrollWidth);
                offsetWidth = Math.max(document.documentElement.offsetWidth, document.body.offsetWidth);
                if (scrollWidth < offsetWidth) {
                    return $(window).width();
                } else {
                    return scrollWidth;
                }
                // handle "good" browsers
            }
            else {
                return $(document).width();
            }
        };
         
        /*==========全部遮罩=========*/
        function openLayer() {
            //背景遮罩层
            var layer = $("<div id='layer'></div>");
            layer.css({
                zIndex:9998,
                position: "absolute",
                height: height() + "px",
                width: width() + "px",
                background: "black",
                top: 0,
                left: 0,
                filter: "alpha(opacity=30)",
                opacity: 0.3
               
            });
            
           //图片及文字层
            var content = $("<div id='content_zzc'></div>");
            content.css({
                textAlign: "left",
                position:"absolute",
                zIndex: 9999,
                height: opt.height + "px",
                width: opt.width + "px",
                top: "50%",
                left: "50%",
                verticalAlign: "middle",
                background: opt.backgroudColor,
                borderRadius:"8px",
                fontSize:"13px"
            });
             
            content.append("<img style='vertical-align:middle;margin:"+(opt.height/4)+"px; 0 0 5px;margin-right:5px;' src='" + opt.backgroundImage + "' /><span style='text-align:center; vertical-align:middle;'>" + opt.text + "</span>");
            $("body").append(layer).append(content);
            var top = content.css("top").replace('px','');
            var left = content.css("left").replace('px','');
            content.css("top",(parseFloat(top)-opt.height/2)).css("left",(parseFloat(left)-opt.width/2));
             
           return this;
        }
        //销毁对象
        function closeLayer() {
            $("#layer,#content_zzc,#partialLayer").remove();
            return this;
        }
         
        /*==========局部遮罩=========*/
        function openPartialLayer(obj) {
          
            var eheight = $(obj).css("height");//元素带px的高宽度
            var ewidth = $(obj).css("width");
            var top = $(obj).offset().top; // 元素在文档中位置 滚动条不影响
            var left = $(obj).offset().left;
            var layer = $("<div id='partialLayer'></div>");
            layer.css({
                style: 'z-index:9998',
                position: "absolute",
                height: eheight,
                width: ewidth,
                background: "black",
                top: top,
                left: left,
                filter: "alpha(opacity=60)",
                opacity: 0.6,
                borderRadius:"3px",
                dispaly: "block"
            });
            $("body").append(layer);
            return this;
        }
    };
     
})(jQuery)


// 对Date的扩展，将 Date 转化为指定格式的String   
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
// 例子：   
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{  
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  
 
 

$.fn.serializeObject = function()
{
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};

//wegov2字典----------------start-------------------
function dictSelectChange(thisSelect,nullText){
	if($(thisSelect).find("option:selected").text()!=nullText){
		$(thisSelect).next("input").val($(thisSelect).find("option:selected").text());
	}else{
		$(thisSelect).next("input").val("");
	}
}


function dictComboTreeChange(target,textName){
	
}

function dictCheckBoxChange(object,textName){
	var checkboxs=new Array();
	var inputName=$(object).attr("name");
	if(inputName!=null&&inputName!=""){
		$("input[name='"+inputName+"'][type='checkbox']:checked").each(function(){
			checkboxs.push($(this).next("label").text());
		});
		$("input[name='"+textName+"']").val(checkboxs.join(","));
	}
}

function dictRadioChange(object,textName){
	var radioName=$(object).attr("name");
	if(radioName!=null&&radioName!=""){
		$("input[name='"+radioName+"'][type='radio']:checked").each(function(){
			$("input[name='"+textName+"']").val($(this).next("label").text());
		});
	}
}

//wegov2字典----------------end-------------------

//保存遮罩
function jqLoadingSave(options){
	var defaultOptions = {
			height : 100,
			width : 240,
			text : "正在保存，请稍候..."
		};
	$.extend(defaultOptions,options);
	$.fn.jqLoading(defaultOptions);
}
//保存
function alertSaveSuccess(){
	$.messager.alert("系统提示","保存成功！");
}
//操作失败
function alertOperateFail(){
	$.messager.alert("系统提示","操作失败，请和管理员联系！");
}

//检查每组checkbox是否全未选，如果是，设置name值为空字符串
function checkboxFilter(scope){
	$(".checkboxFilter",scope).each(function(){
		var scopeTemp = $(this);
		var count = 0;
		$("input[type='checkbox']:checked",scopeTemp).each(function(){
			count++;
		});
		if(count==0){
			var name = $("input:first-child",scopeTemp).attr("name");
			var html = "<input type='hidden' name='"+name+"' value=''>";
			scopeTemp.append(html);
		}
	});
}

//查看
function lookOperate(ff){
	//隐藏font（红色的*号）
	$(ff).find("font").each(function(index){
		$(this).hide();
	});
	$(ff).find("b").each(function(index){
		$(this).hide();
	});
	//checkbox/radio
	$(ff+" input[type=checkbox],"+ff+" input[type=radio]").each(function(){
		$(this).parent().prev().show();
		$(this).parent().hide();
	});
	//easyui combobox/datebox/combogrid 显示文本
	$(ff+" select").each(function(){
		$(this).prev().show();
		$(this).combo("destroy");
	});
	$(ff).find(".areaClass").each(function(){
		$(this).parent().prev().show();
		$(this).parent().hide();
	});
	$(ff).find(".easyui-datebox").each(function(){
		$(this).prev().show();
		$(this).datebox("destroy");
	});
	$(ff).find(".easyui-numberbox").each(function(){
		$(this).prev().show();
		$(this).numberbox("destroy");
	});
	$(ff).find(".easyui-textbox.abdx-info").each(function(){
		$(this).prev().show();
		$(this).textbox("destroy");
	});
	$(ff).find(".easyui-textbox").each(function(){
		var val = $(this).textbox("getValue");
		$(this).parent().append(val);
		$(this).textbox("destroy");
	});
	//普通文本框
	$(ff+" input[type=text],"+ff+" textarea").each(function(index){
		var val = $(this).val();
		$(this).hide();
		$(this).parent().append(val);//替换为文本
	});
	$(".easyui-linkbutton.pd10").hide();//隐藏按钮
}

//省市区级联初始化
function initArea(parentId, areaId){
	var parentVal = $("#"+parentId).attr("defaultValue");
	var tcode = $("#"+parentId).attr("tcode");
	$("#"+parentId).combobox({
		url: '/azbj/easyui/areaCombobox?parentId='+tcode,
		value: parentVal,
		valueField: 'id',
		textField: 'text'
	});
	$("#"+areaId).attr("tcode", parentVal);
	var areaVal = $("#"+areaId).attr("defaultValue");
	$("#"+areaId).combobox({
		url: '/azbj/easyui/areaCombobox?parentId='+parentVal,
		value: areaVal,
		valueField: 'id',
		textField: 'text'
	});
}
//省市区级联变动
function changeArea(province, city, county){
	$("#"+province).combobox({
		onSelect: function(r1){
			var provinceCode = r1.id;
			$("#"+city).combobox({
				url: '/azbj/easyui/areaCombobox?parentId='+provinceCode,
				value: '',
				valueField: 'id',
				textField: 'text',
				onSelect: function(r2){
					var cityCode = r2.id;
					$("#"+county).combobox({
						url: '/azbj/easyui/areaCombobox?parentId='+cityCode,
						value: '',
						valueField: 'id',
						textField: 'text'
					});
				}
			});
			$("#"+county).combobox({//将区combobox置空
				url: '/azbj/easyui/areaCombobox?parentId=',
				value: '',
				valueField: 'id',
				textField: 'text'
			});
		}
	});
}

//户籍迁移、人户分离只能每月25号到下个月12号才能发起
function createAble(){
	var date = new Date();
	var day = date.getDate();
	if(day<26 && day>12){
		$.messager.alert("系统提示", "该工作仅能在当月26号到下个月12号之间申请！");
		return false;
	}else
		return true;
}

/**
 * 多选checkbox，当选择其他时，显示填写框，不选是，隐藏填写框
 * name checkbox的name属性值
 * nameQita 选其他时填写框的name属性值
 * value checkbox选其他时的value属性值
 */
function checkboxSelectQita(name, nameQita, num){
	$("input[name='"+name+"']").bind("click",function(){
		var val = $(this).val();
		if(val == num){
			if($(this).prop("checked")){
				$("input[name='"+nameQita+"']").show();
			}else{
				$("input[name='"+nameQita+"']").val("");
				$("input[name='"+nameQita+"']").hide();
			}
		}
	});
}

function refreshPersonInfo(data){
	var rows = data.rows;
	for(var i=0; i<rows.length; i++){
		var row = rows[i];
		$.post("/personInfo/getPersonInfo",{id:row.pid},function(result){
			var personInfo = result.rows[0];
			$("."+personInfo.id).each(function(index,e){
				var attr = $(this).attr("attr");
				$(this).text(personInfo[attr]);
			});
		});
	}
}
//统计checkBox
function setCheckboxValue(checkboxName,codeInputId,textInputId){
	var checkboxes = document.getElementsByName(checkboxName);
	var code = "";
	var text = "";
	for(var i=0;i<checkboxes.length;i++){
		if(checkboxes[i].checked){
			if(code==""){
				code = $(checkboxes[i]).attr("value");
				text = $(checkboxes[i]).attr("text");
			}else {
				code = code + "," + $(checkboxes[i]).attr("value");
				text = text + "," + $(checkboxes[i]).attr("text");
			}
		}
	}
	document.getElementById(codeInputId).value=code;
	document.getElementById(textInputId).value=text;
}

//初始化Checkbox
function initCheckboxValue(checkboxName,codeInputId){
	var checkboxes = document.getElementsByName(checkboxName);
	var codeInput = document.getElementById(codeInputId);
	var codes = codeInput.value.split(",");
	for(var i=0;i<checkboxes.length;i++){
		if(inArr(checkboxes[i].value,codes)){
			checkboxes[i].checked=true;
		}
	}
}
function inArr(value,arr){
	for(var i=0;i<arr.length;i++){
		if(value==arr[i]){
			return true;
		}
	}
	return false;
}
/**
 * 根据日期检查是否可以生成报表
 * @return
 */
function checkReportDate(yearS,monthS){
	var yearI = parseInt(yearS);
	var monthI = parseInt(monthS);
	
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	
	if(yearI>year
		|| yearI==year&&monthI>month
		|| yearI==year&&monthI==month&&day<25){
			alert("只有在当月的25日之后才能生成该月固定报表和需求情况分析表!")
			return false;
		}
	return true;
	
}

/**
 * 检查下级单位是否都添加报表
 * @param num 报表下级生成数
 * @return
 */
function checkReportRow(num) {
	var isComplete;
	$.ajax({
		type:"POST",
		url:"/azbj/report/reportInfo/action/reportRowCompleteAction.jsp",
		data:{rowNum:num},
		async:false,
		success:function(data) {
			isComplete = data;
		}
	});
	return isComplete;
}

function checkReportQuarter(yearVal,quarterVal) {
	var endDay = new Date();
	
	if (quarterVal == 4) {
		endDay.setFullYear(+ yearVal + 1, 0, 1);
	} else {
		endDay.setFullYear(yearVal, quarterVal*3,1);
	}
	//待检查时间
	if(endDay>new Date()){
		$.messager.alert("系统提示","请在当季度结束后生成报表");
		return false;
	}
	return true;
}