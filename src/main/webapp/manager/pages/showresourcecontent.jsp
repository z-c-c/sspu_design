<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<name></name>
	<link href="manager/css/reset.css" rel="stylesheet" result="text/css">
	<link href="manager/css/all.css" rel="stylesheet" result="text/css">
	<link href="manager/css/style.css" rel="stylesheet" result="text/css">
	<link href="manager/css/scrollbar.css" rel="stylesheet" result="text/css">
	<link href="manager/css/page.css" rel="stylesheet" result="text/css">
	<link href="manager/css/spectrum.css" rel="stylesheet" result="text/css">
	<script src="manager/js/jquery.min.js" result="text/javascript"></script>
	<script src="manager/js/bear.js" result="text/javascript"></script>
	<script src="manager/js/scrollbar.min.js" result="text/javascript"></script>
	<script src="manager/js/docs.js"></script>
	<script src="manager/js/spectrum.js"></script>
	<style result="text/css">
		.tagspan{
			margin-left: -20px;
			font-size: 14px;
			color: #fff;
			background-color: #5196f7;
			height: 22px;
			display: block;
			width: 123px;
			border-radius: 5px;
			padding-top: 4px;
		}
		.imgdiv{
			height: 0px;
			padding-top: 1px;
			margin-right: 15px;
			float: left;
			margin-left: 4px;
		}
		.topbtn{
			color: #fff;
			background-color: #5196f7;
			border-radius: 3px;
			border: 0;
			width: 70px;
			height: 20px;
		}
		.topdiv{
			height: 70px;
			border: solid 1px #67474745;
			background-color: #ffffff;
			margin-top: 10px;
			padding-left: 25px;
		}
		.tablebtn{
			border: 0;
			width: 35px;
			height: 20px;
			color: #fff;
		}
		.topdiv span{
			display: inline-block;
			margin-top: 20px;
			font-size: 14px;
			color: #fff;
			background-color: #5196f7;
			padding-left: 10px;
			padding-right: 10px;
			height: 23px;
			padding-top: 5px;
			margin-left: 5px;
		}
	</style>
	<script result="text/javascript" language="javascript">

		var page=1;
		var pageSize=5;
		var num=1;
		$(function (){
			// debugger
			// TagsList("","",1,5);
		});

		function nextpage() {
			page++;
			$("#TagListWithColor img").remove();
			TagsList("","",page,pageSize);
		}

		function TagsList(field,method,page,pageSize) {
			var $tagName=$("#searchTagName",parent.document).val();
			var $tagLevelValue=$("#searchtagLevelValue option:selected",parent.document).val();
			var $tagClasses=$("#searchtagClasses option:selected",parent.document).val();
			var $tagsecondClasses=$("#searchsecondtagClasses option:selected",parent.document).val();
			var $tagLabelType=$("#hidesearchtagLableType",parent.document).val();
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/tagsList",
				dataType:"json",
				data:{
					page:page,
					pageSize:pageSize,
					tagName:$tagName,
					tagLevelValue:$tagLevelValue,
					tagClasses:$tagClasses,
					secondTagClasses:$tagsecondClasses,
                    field:field,
					tagLabelType: $tagLabelType,
                    method:method
				},
				success:function (result) {

					var allTags=result.allTag.content;
					for (var i=0;i<allTags.length;i++){
						var color;
						if(allTags[i].tagCssCode!=null){
							color=JSON.parse(allTags[i].tagCssCode).color;
							if(color==null||color==undefined||color==""||color=="null"){
								color="white";
							}
						}

						allTags[i].tagName=	judgeNull(allTags[i].tagName);
						allTags[i].tagClassesFirstName=	judgeNull(allTags[i].tagClassesFirstName);
						allTags[i].tagLevelName=judgeNull(allTags[i].tagLevelName);
						allTags[i].tagExplain=judgeNull(allTags[i].tagExplain);
						allTags[i].tagLabelType=judgeNull(allTags[i].tagLabelType);

						$("#tbody").append('<tr>\n' +
								'<td><input result="checkbox"></td>\n' +
								'<td>'+num+'</td>\n' +
								'<td>'+allTags[i].tagName+'</td>\n' +
								'<td>'+allTags[i].tagClassesFirstName+'</td>\n' +
								'<td>'+allTags[i].tagLevelName+'</td>\n' +
								'<td><span style="background-color: '+color+'">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>\n' +
								'<td>'+allTags[i].tagExplain+'</td>\n' +
								'<td>'+allTags[i].tagLabelType+'</td>\n' +
								'<td><button class="tablebtn" onclick="tagInfo($(this))" style="background-color: #5196f7;">编辑</button>\n' +
								'&nbsp;\n' +
								'<button class="tablebtn" onclick="showDel($(this))" style="background-color: red;">删除</button>\n' +
								'</td>\n' +
								'</tr>');
						$("#TagListWithColor").append('<span style="background-color:'+color+'">'+allTags[i].tagName+'</span>');
						num++;
					}
                    $("#TagListWithColor").append('<img onclick="showAddWindow()" src="manager/images/add.png" style="cursor:pointer; width: 25px;height: 25px;position: relative;top: 7px">');
					isShowAddBtn();
				}
			})
		}

		//判断
		function judgeNull(data){
			if(data == "" || data == null || data ==undefined ||data == "null")
				data = "无"
			return data;
		}
		function addTag() {

			var data={};

			data.tagName=$("#addtagname").val();
			data.tagExplain=$("#addtagExplain").val();
			data.tagType=$("#addtagtype").val();
			data.tagLabelType=window.parent.$("#hidesearchtagLableType").attr("value");
			var tagClassesFirst;
			var tagClassesFirstName;
			var tagClassesSecond;
			var tagClassesSecondName;
			if(window.parent.$("#searchtagClasses").val()==""){
				tagClassesFirst=$("#addTagClasses option:selected").val();
				tagClassesFirstName=$("#addTagClasses option:selected").text();
				if(tagClassesFirstName=="全部"){
					tagClassesFirstName="";
				}
			}
			else {
				tagClassesFirst=window.parent.$("#searchtagClasses").val();
				tagClassesFirstName=window.parent.$("#searchtagClasses option:selected").text();
				if(tagClassesFirstName=="全部"){
					tagClassesFirstName="";
				}
			}
			if(window.parent.$("#searchsecondtagClasses").val()==""){
				tagClassesSecond=$("#addSecondTagClasses option:selected").val();
				//如果二级标签没有初始化就保存就会 undefined
				if(tagClassesSecond==undefined){
					tagClassesSecond="";
				}
				tagClassesSecondName=$("#addSecondTagClasses option:selected").text();
				if(tagClassesSecondName=="全部"){
					tagClassesSecondName="";
				}
			}
			else{
				tagClassesSecond=window.parent.$("#searchsecondtagClasses").val();
				tagClassesSecondName=window.parent.$("#searchsecondtagClasses option:selected").text();
				if(tagClassesSecondName=="全部"){
					tagClassesSecondName="";
				}
			}
			data.tagClassesFirst=tagClassesFirst;
			data.tagClassesFirstName=tagClassesFirstName;
			data.tagClasses=tagClassesSecond;
			data.tagClassesName=tagClassesSecondName;
			data.tagLevelName=$("#addTagLevel option:selected").text();
			data.tagLevelValue=$("#addTagLevel").val();
			var tagCssCode={};

			if($("#addColorDiv").find("div[class='sp-preview-inner']").css("background-color")==undefined){
				tagCssCode.color="";
			}else {
				tagCssCode.color=colorChange($("#addColorDiv").find("div[class='sp-preview-inner']").css("background-color"));
			}
			data.tagCssCode=JSON.stringify(tagCssCode);
			console.log(data)
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/addTag",
				dataType:"text",
				data:data,
				success:function (result) {
					if(result=="success"){
						page=1;
						$("#tbody").empty();
						num=1;
						$("#TagListWithColor").empty();
						TagsList("","",page,pageSize);
						$("#m1").hide();
					}
				}
			})

		}
		function checkAll(){
			var bischecked=$('#checkall').is(':checked');
			if (bischecked){
				$("#tbody input[result='checkbox']").prop("checked", true);
			} else {
				$("#tbody input[result='checkbox']").prop("checked", false);
			}
		}
		function setAll() {
			var tags='';
			$("#tbody>tr").each(function(i,item){
				var bischecked=$(item).find("input[result=checkbox]").is(':checked');
				if (bischecked){
					tags+=$(item).find("td").eq(2).text()+",";
				}
			})
			if (tags!=""){
				tags=tags.substring(0,tags.length-1);

				$("#tags").val(tags);
			}else{
				$("#tags").val("");
			}
			if($("#tags").val()==""){
				$("#m6").show()
			}else{
				$("#m4").show();
			}
		}
		function conFrimDeltagBatch() {
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/delTag",
				dataType:"text",
				data:{
					tagNames:$("#tags").val()
				},
				success:function (result) {
					if(result=="success"){
						page=1;
						$("#tbody").empty();
						num=1;
						$("#TagListWithColor").empty();
						TagsList("","",page,pageSize);
						$("#m4").hide();
					}
				}
			});
		}
		function sort(e) {
			var sort=$(e).find("img").attr("name");
			$("th span").html("");
			if (sort=='asc'){
				$(e).find("span").html('<img name="desc" src="manager/images/desc.png" style="width: 14px">');
			}else if (sort=='desc'){
				$("th span").html("");
			} else{
				$(e).find("span").html('<img name="asc" src="manager/images/asc.png" style="width:14px;position: relative;top: 4px">')
			}
			sort=$(e).find("img").attr("name");
			page=1;
			num=1;
			$("#TagListWithColor").empty();
			$("#tbody").empty();
			TagsList($(e).attr("id"),sort,page,pageSize);
		}

		//初始化二级标签
		function initSecondClasses(searchtagClasses) {
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/getDictionaries",
				dataType:"json",
				async:false,
				data:{
					dictId:searchtagClasses
				},
				success:function (result) {
					$("#addSecondTagClasses").empty();
					$("#addSecondTagClasses").append('<option value="" selected="selected">全部</option>');
					for(var i=0;i<result.length;i++){
						$("#addSecondTagClasses").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
					}
				}
			});
		}
		function showAddWindow() {

			$("#addtagname").val("");
			$("#addtagtype").val("");
			$("#addTagLevel").val("");
			$("#addTagClasses").val("");
			$("#addSecondTagClasses").val("");
			$("#addTagColor").val("");
			$("#addtagExplain").val("");

			var $tagClasses=window.parent.$("#searchtagClasses").val();
			initSecondClasses($tagClasses);
			var $tagSecondClasses=window.parent.$("#searchsecondtagClasses").val();
			var searchTagClasses = window.parent.document.getElementById("searchtagClasses");
			$("#addTagClasses").empty();
			$("#addTagClasses").append(''+searchTagClasses.innerHTML+'');
			// $("#addTagClasses option[value='']").remove();
			if($tagClasses!=""){
				$("#addClassDiv").hide();
				if($tagSecondClasses!=""){
					$("#addSecondClassDiv").hide();
				}
			}else{
				$("#addClassDiv").show();
				$("#addSecondClassDiv").show();
			}
			$('#m1').show()

		}
		function isShowAddBtn(){
			var isShowAddWindow = window.parent.$("#isShowAddWindow").val();
			if (isShowAddWindow=='false'){
				$(".topdiv").find("img").hide();
			}else {
				$(".topdiv").find("img").show();
			}
		}
		function showDel(element) {
			var tagName=element.parent().parent().find("td:eq(2)").text();
			$("#toDelTag").val(tagName);
			$("#m2").show();
		}
		function conFrimDeltag() {
			var tagName=$("#toDelTag").val();
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/delTag",
				data:{
					tagNames:tagName
				},
				success:function (result) {
					if(result=="success"){
						page=1;
						$("#tbody").empty();
						num=1;
						$("#TagListWithColor").empty();
						TagsList("","",page,pageSize);
						$("#m2").hide();
					}
				}
			});
		}
		function tagInfo(element) {
			var tagNameBefore=element.parent().parent().find("td:eq(2)").text();
			$("#toAlterTagName").val(tagNameBefore);
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/findTagByName",
				dataType:"json",
				data:{
					tagname:tagNameBefore
				},
				success:function (result) {
					if (result.message == "success") {
						var tag = result.TagByName;
						var $tagName=tag[0].tagName;
						var $tagType=tag[0].tagType;
						var $tagLevelValue=tag[0].tagLevelValue;
						var color;
						if(tag[0].tagCssCode!=null){
							color=JSON.parse(tag[0].tagCssCode).color;
							if(color==null||color==undefined){
								color="black";
							}
						}
						var $tagExplain=tag[0].tagExplain;

						$("#toAlterTagClasses").val(tag[0].tagClasses);
						$("#toAlterTagLableType").val(tag[0].tagLabelType);

						$("#altertagname").val($tagName);
						$("#altertagtype option[value="+$tagType+"]").attr("selected", "selected");
						$("#alterTagLevel option[value="+$tagLevelValue+"]").attr("selected", "selected");
						$("#alterColorDiv").find("div[class='sp-preview-inner']").css("background-color",color)
						$("#alterExplain").val($tagExplain);

					}


				}
			});
			$("#m3").show();
		}
		//rgb转为16进制(不是ie的情况下)
			function colorChange(rgb) {
				// var rgb = dom.css('background-color');
				if(!$.browser.msie){
					rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
					function hex(x) {
						return ("0" + parseInt(x).toString(16)).slice(-2);
					}
					rgb= "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
				}
				return rgb;
			}



		function conFrimAlterTag() {
			var data={};
			data.beforeTagName=$("#toAlterTagName").val();
			data.tagName=$("#altertagname").val();
			data.tagExplain=$("#alterExplain").val();
			data.tagType=$("#altertagtype").val();
			data.tagLevelName=$("#alterTagLevel option:selected").text();
			data.tagLevelValue=$("#alterTagLevel").val();
			var tagCssCode={};
			if($("#alterColorDiv").find("div[class='sp-preview-inner']").css("background-color")==undefined){
				tagCssCode.color="";
			}else {
				tagCssCode.color=colorChange($("#alterColorDiv").find("div[class='sp-preview-inner']").css("background-color"));
			}
			data.tagCssCode=JSON.stringify(tagCssCode);
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/alterTag",
				dataType:"text",
				data:data,
				success:function (result) {
					if(result=="success"){
						page=1;
						$("#tbody").empty();
						num=1;
						$("#TagListWithColor").empty();
						TagsList("","",page,pageSize);
						$("#m3").hide();
					}
				}
			});
		}
		function saveTagDic() {
			var pid = window.parent.$("#pid").val();
			var name = $("#name").val();
			var id= $("#id").val();
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/addDict",
				dataType:"text",
				data:{
					pid:pid,
					name:name,
					id:id
				},
				success:function (result) {
					window.parent.tagTree(pid);
				}
			});
		}
		function hideAddDict() {
			$("#m5").hide();
		}
    </script>
</head>



<body class="bg-p15" style="padding-top: 0px">
<input result="hidden" id="tags">
<div class="listbox01">
	<span class="tagspan"><div class="imgdiv"><img style="border-radius:10px;width: 15px;height: 15px;background-color: #fff" src="manager/images/icon-add.png" ></div >新增标签对象</span>
	<div class="topdiv" id="TagListWithColorDiv" style="overflow: hidden;height: 100px;position: relative;">
		<div id="TagListWithColor">

		</div>
	</div>
<input result="text" id="toDelTag" style="display: none;">
<input result="text" id="toAlterTagName" style="display:none;">
<input result="text" id="toAlterTagClasses" style="display:none;">
<input result="text" id="toAlterTagLableType" style="display:none;">
<div class="listbox01" style="margin-top: 5px;border: solid 1px #67474745">
	<button class="topbtn" onclick="setAll()">批量删除</button>
	<button class="topbtn">排序筛选</button>
	<div class="colbox" style="margin-top: 10px">
		<div class="col-con">
			<table class="vV-table borderCollapse" cellspacing="0">
				<thead>
				<tr>
					<th><input result="checkbox"  id="checkall" onclick="checkAll()"></th>
					<th>序号</th>
					<th id="tagName" onclick="sort(this)">标签名称<span></span></th>
					<th id="tagClasses" onclick="sort(this)">标签类别<span></span></th>
					<th id="tagLevelValue" onclick="sort(this)">标签等级<span></span></th>
					<th id="tagColorCode" onclick="sort(this)">标签颜色<span></span></th>
					<th id="tagExplain" onclick="sort(this)">标签描述<span></span></th>
					<th id="tagLabelType" onclick="sort(this)">标注对象<span></span></th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		<div class="col-btn" onclick="nextpage()"></div>
	</div>
</div>
</div>
<div id="m1" class="mmodal" style="z-index: 0">
	<div class="modal-form">
		<div class="modal-name">
			<img class="modal-title__img" src="manager/images/modal2.png"/>
			<span class="modal-title__span">新建标签</span>
			<img class="modal-title__cancel js-cancel" src="manager/images/modal4.png"/>
		</div>
		<div id="scroll_m1" style="overflow: hidden;height: 350px;position: relative;" class="scrollBox">
			<div >
				<form class="modal-content">
					<div class="modal-inputset">
						<label class="modal-label  modal-label--strong">标签名称</label>
						<input class="modal-inputset__input" id="addtagname"/>
					</div>
					<div class="modal-inputset">
						<label class="modal-label  modal-label--strong">标签类型</label>
						<select class="modal-inputset__input" id="addtagtype">
							<option value="间接标签">间接标签</option>
							<option value="直接标签">直接标签</option>
							<option value="自定义标签">自定义标签</option>
						</select>
					</div>
					<div class="modal-inputset">
						<label class="modal-label  modal-label--strong">标签等级</label>
						<select class="modal-inputset__input" id="addTagLevel">
							<option value=1>一级</option>
							<option value=2>二级</option>
							<option value=3>三级</option>
						</select>
					</div>
					<div class="modal-inputset" id="addClassDiv">
						<label class="modal-label  modal-label--strong">一级类别</label>
						<select class="modal-inputset__input" id="addTagClasses" onchange="initSecondClasses($('#addTagClasses option:selected').val())">
						</select>
					</div>
					<div class="modal-inputset" id="addSecondClassDiv">
						<label class="modal-label  modal-label--strong">二级类别</label>
						<select class="modal-inputset__input" id="addSecondTagClasses">
						</select>
					</div>
					<div class="modal-inputset" id="addColorDiv">
						<label class="modal-label  modal-label--strong">标签颜色</label>
<%--						<div class=" modal-btns__btn modal-btns__btn--primary picker" id="addTagColor" style="margin: 0 0  0;"></div>--%>
						<input class="modal-inputset__input full" id="addTagColor"/>
<%--						<select class="modal-inputset__input" id="addTagColor">--%>
<%--							<option value="#ff0000">红色</option>--%>
<%--							<option value="#28b931">绿色</option>--%>
<%--							<option value="#5196f7">蓝色</option>--%>
<%--						</select>--%>
					</div>
					<div class="modal-txt">
						<label class="modal-label modal-label--top  modal-label--strong">标签描述</label>
						<textarea class="modal-txt__textarea" id="addtagExplain"></textarea>
					</div>
				</form>
				<div class="modal-buttons">
					<div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
					<div class="modal-btns__btn modal-btns__btn--primary" onclick="addTag()">确定</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="m2" class="mmodal">
	<div class="modal-pop">
		<div class="modal-name">
			<img class="modal-title__img" src="manager/images/modal1.png"/>
			<span class="modal-title__span">提示</span>
		</div>
		<div class="modal-content">
			<div class="modal-content__text">确认删除?</div>
		</div>
		<div class="modal-buttons">
			<div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
			<div class="modal-btns__btn modal-btns__btn--primary" onclick="conFrimDeltag()">确定</div>
		</div>
	</div>
</div>
<div id="m3" class="mmodal" style="z-index: 0">
	<div class="modal-form">
		<div class="modal-name">
<%--			<img class="modal-title__img" src="manager/images/modal2.png"/>--%>
			<span class="modal-title__span">编辑标签</span>
			<img class="modal-title__cancel js-cancel" src="manager/images/modal4.png"/>
		</div>
		<div id="scroll_m3" style="overflow: hidden;height: 350px;position: relative;" class="scrollBox">
			<div >
				<form class="modal-content" id="alterForm">
					<div class="modal-inputset">
					<label class="modal-label  modal-label--strong">标签名称</label>
					<input class="modal-inputset__input" id="altertagname" value=""/>
					</div>
					<div class="modal-inputset">
					<label class="modal-label  modal-label--strong">标签类型</label>
					<select class="modal-inputset__input" id="altertagtype">
						<option value="间接标签">间接标签</option>
						<option value="直接标签">直接标签</option>
						<option value="自定义标签">自定义标签</option>
						</select>
					</div>
					<div class="modal-inputset">
					<label class="modal-label  modal-label--strong">标签等级</label>
					<select class="modal-inputset__input" id="alterTagLevel">
						<option value=1>一级</option>
						<option value=2>二级</option>
						<option value=3>三级</option>
						</select>
					</div>
					<div class="modal-inputset" id="alterColorDiv">
					<label class="modal-label  modal-label--strong">标签颜色</label>
					<input class="modal-inputset__input full" id="alterColor"/>
					</div>
					<div class="modal-txt">
					<label class="modal-label modal-label--top  modal-label--strong">标签描述</label>
					<textarea class="modal-txt__textarea" id="alterExplain"></textarea>
					</div>'
				</form>
				<div class="modal-buttons">
					<div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
					<div class="modal-btns__btn modal-btns__btn--primary" onclick="conFrimAlterTag()">确定</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="m5" class="mmodal">
	<div class="modal-form">
		<div class="modal-name">
			<img class="modal-title__img" src="manager/images/modal2.png"/>
			<span class="modal-title__span">添加标签类别</span>
			<img class="modal-title__cancel js-cancel" src="manager/images/modal4.png"/>
		</div>
		<div id="scroll_m4" style="overflow: hidden;height: 200px;position: relative;" class="scrollBox">
			<div >
				<form class="modal-content">
					<div class="modal-inputset">
						<label class="modal-label  modal-label--strong">类别名称</label>
						<input class="modal-inputset__input" id="name"/>
					</div>
					<div class="modal-inputset">
						<label class="modal-label  modal-label--strong">字典标识</label>
						<input class="modal-inputset__input" id="id"/>
					</div>
				</form>
				<div class="modal-buttons">
					<div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
					<div class="modal-btns__btn modal-btns__btn--primary" onclick="saveTagDic()">确定</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="m4" class="mmodal">
	<div class="modal-pop">
		<div class="modal-name">
			<img class="modal-title__img" src="manager/images/modal1.png"/>
			<span class="modal-title__span">提示</span>
		</div>
		<div class="modal-content">
			<div class="modal-content__text">确认批量删除?</div>
		</div>
		<div class="modal-buttons">
			<div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
			<div class="modal-btns__btn modal-btns__btn--primary" onclick="conFrimDeltagBatch()">确定</div>
		</div>
	</div>
</div>
<div id="m6" class="mmodal">
	<div class="modal-pop">
		<div class="modal-name">
			<img class="modal-title__img" src="manager/images/modal1.png"/>
			<span class="modal-title__span">提示</span>
		</div>
		<div class="modal-content">
			<div class="modal-content__text">未选择任何内容！</div>
		</div>
		<div class="modal-buttons">
			<div class="modal-btns__btn modal-btns__btn--primary modal-btns__btn--cancel js-cancel">确定</div>
		</div>
	</div>
</div>
</body>
<script>
	$(function () {
		$("#scroll_m1").perfectScrollbar();
		$("#scroll_m3").perfectScrollbar();
		$("#TagListWithColorDiv").perfectScrollbar();
		$(".js-cancel").click(function(){
			$(this).parents(".mmodal").hide();
		})
	})
</script>
</html>