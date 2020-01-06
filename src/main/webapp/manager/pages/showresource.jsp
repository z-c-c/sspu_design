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
	<script src="manager/js/jquery.min.js" result="text/javascript"></script>
	<script src="manager/js/bear.js" result="text/javascript"></script>
	<script src="manager/js/scrollbar.min.js" result="text/javascript"></script>
	<style result="text/css">
		.searchdiv{
			margin-top: 4px;
			height: 90px;
			border: solid 1px #e9e9e9;
			background-color:#ffffff;
			width: 97.5%;
			margin-left: 15px;
		}
		.searchtable{
			margin-top: 36px;
			width: 100%;
			margin-left: 110px;
		}
		.searchtable span{
			font-size: 15px;
			font-weight: 600;
		}
		.searchbtn{
			border: 0;
			width: 45px;
			height: 20px;
			color: #fff;
			background-color: #5196f7;
		}
		.addimg{
			width: 20px;
			height: 20px;
			position: relative;
			top: 5px;
			cursor: pointer;
		}
		.secendmenu{
			display: inline-block !important;
			background: none !important;
			padding-left: 0px !important;
		}
	</style>
	<script result="text/javascript" language="javascript">
		$(function (){
		//模拟滚动条
		// 	$("#catalog").perfectScrollbar();
		//搜索 类切换
			thisAct("#menuTabs");
		//树 - 折叠/展开
		// 	catalogTree("#catalog");
		//树 - 当前选中
		// 	aAct("#catalog");
			var frm = document.getElementById('mainframe');
			//  等iframe加载完毕,若未加载完毕，TagsList（）方法调用无效
			$(frm).load(function(){
				tagTree("TAG_LABLE_PEOPLE",true);
				initLevel();
				initClasses("TAG_LABLE_PEOPLE");
			});

		});


		function search(flag) {

				if($("#menuTabs").find("li:eq(0)").hasClass("act")==true){
					$('#hidesearchtagLableType').val("person");
				}
				if($("#menuTabs").find("li:eq(1)").hasClass("act")==true){
					$('#hidesearchtagLableType').val("unit");
				}
				if($("#menuTabs").find("li:eq(2)").hasClass("act")==true){
					$('#hidesearchtagLableType').val("event");
				}
				$("#mainframe").contents().find("#TagListWithColor").empty();
				// $("#mainframe")[0].contentWindow.$("#TagListWithColor").empty();
				$("#mainframe").contents().find("#tbody").empty();
				// $("#mainframe")[0].contentWindow.$("#tbody").empty();
				$("#mainframe")[0].contentWindow.TagsList("","",1,5);

				document.getElementById('mainframe').contentWindow.num=1;
				document.getElementById('mainframe').contentWindow.page=1;
				if (flag){
					highlight();
				}
		}
		function highlight() {
			var highlightid=$("#searchtagClasses").val();
			$("a").css("color","black");
			$('#'+highlightid+'').css("color","blue");
		}
		function topage(searchTagName,searchtagClasses,searchtagClassesName,isShowAddWindow,searchsecondtagClasses) {

			initSecondClasses(searchtagClasses,searchsecondtagClasses);

			$("#searchTagName").val(searchTagName);
			$("#searchtagClasses option[value="+searchtagClasses+"]").attr("selected","selected");


			$("#hidesearchtagClasses").val(searchtagClasses);
			$("#hidesearchtagClassesName").val(searchtagClassesName);

			$("#isShowAddWindow").val(isShowAddWindow)
			if($("#menuTabs").find("li:eq(0)").hasClass("act")==true){
				$('#hidesearchtagLableType').val("person");
			}
			if($("#menuTabs").find("li:eq(1)").hasClass("act")==true){
				$('#hidesearchtagLableType').val("unit");
			}
			if($("#menuTabs").find("li:eq(2)").hasClass("act")==true){
				$('#hidesearchtagLableType').val("event");
			}
			search(false);
		}
		function showAddWindow() {
			$("#mainframe")[0].contentWindow.showAddWindow();
		}
		function tagTree(lableType,flag) {
			$("#pid").val(lableType);
			initClasses(lableType);
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/getTagTypeTree",
				dataType:"json",
				data:{
					tagLableType:lableType
				},
				success:function (result) {
					search(false);
					var str='';
					if (result){
						for (var i=0;i<result.length;i++){
							var tagtype='<dl>\n' +
									'\t\t\t\t\t<dt onclick="topage(\'\',\''+result[i].code+'\',\''+result[i].typeName+'\',true,\'\')">\n' +
									'\t\t\t\t\t\t<b></b><a class="secendmenu " target="conIframe" href="manager/pages/showresourcecontent.jsp" id="'+result[i].code+'">'+result[i].typeName+'</a > <img onclick="showAddWindow()" src="manager/images/add.png" class="addimg">\n' +
									'\t\t\t\t\t</dt>\n' +
									'\t\t\t\t\t<dd>';
							var secondList=result[i].secondList;
							var secondtagtype='';
							for (var b=0;b<secondList.length;b++){
								var tags='';
								var tagsarr=secondList[b].tags;

								secondtagtype+='<dl>\n' +
										'\t\t\t\t\t<dt onclick="topage(\'\',\''+result[i].code+'\',\''+secondList[b].typeName+'\',true,\''+secondList[b].code+'\')">\n' +
										'\t\t\t\t\t\t<b></b><a class="secendmenu " target="conIframe" href="manager/pages/showresourcecontent.jsp" id="'+secondList[b].code+'">'+secondList[b].typeName+'</a > <img onclick="showAddWindow()" src="manager/images/add.png" class="addimg">\n' +
										'\t\t\t\t\t</dt>\n' +
										'\t\t\t\t\t<dd>';
								for (var t =0;t<tagsarr.length;t++){
									tags+='<a onclick="topage(\''+tagsarr[t].tagName+'\',\''+secondList[b].code+'\',\''+secondList[b].typeName+'\',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">'+tagsarr[t].tagName+'</a >';
								}
								secondtagtype+=tags+'</dd>\n' +
										'\t\t\t\t</dl>';

							}
							tagtype+=secondtagtype+'</dd>\n' +
									'\t\t\t\t</dl>';

							str+=tagtype;
						}
					}
					$("#typetree").html(str);
					//模拟滚动条
					$("#catalog").perfectScrollbar();
					//树 - 折叠/展开
					catalogTree("#catalog");
					//树 - 当前选中
					aAct("#catalog");
					if (!flag) $("#mainframe")[0].contentWindow.hideAddDict();

				}
			});
		}
		function initLevel() {
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/getDictionaries",
				dataType:"json",
				data:{
					dictId:"TAG_LEVEL"
				},
				success:function (result) {
					$("#searchtagLevelValue").empty();
					$("#searchtagLevelValue").append('<option value="" selected="selected">全部</option>');
					for (var i=0;i<result.length;i++){
						$("#searchtagLevelValue").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
					}
				}
			})
		}
		function initClasses(tagLabelType) {
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/getDictionaries",
				dataType:"json",
				data:{
					dictId:tagLabelType
				},
				success:function (result) {
					$("#searchtagClasses").empty();
					$("#searchtagClasses").append('<option value="" selected="selected">全部</option>');
					for(var i=0;i<result.length;i++){
						$("#searchtagClasses").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
					}
				}
			})
		}

		function initSecondClasses(searchtagClasses,searchsecondtagClasses) {
			$.ajax({
				result:"POST",
				url:"TagBaseInfoManager/getDictionaries",
				dataType:"json",
				//async:false,
				data:{
					dictId:searchtagClasses
				},
				success:function (result) {
					$("#searchsecondtagClasses").empty();
					$("#searchsecondtagClasses").append('<option value="" selected="selected">全部</option>');
					for(var i=0;i<result.length;i++){
						$("#searchsecondtagClasses").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
					}
					$("#searchsecondtagClasses option[value="+searchsecondtagClasses+"]").attr("selected","selected");
				}

			});
		}

		function addDict(){
			$("#mainframe")[0].contentWindow.$("#m5").show();
		}
	</script>
</head>


<body class="bg-p15" style="padding: 0 0 0 0 ">
<input result="hidden" id="hidesearchtagClasses" >
<input result="hidden" id="hidesearchtagClassesName">
<input result="hidden" id="isShowAddWindow" value="true">
<input result="hidden" id="hidesearchtagLableType" value="person">
<input result="hidden" id="pid" value="TAG_LABLE_PEOPLE">
<div class="searchdiv">
	<table class="searchtable">
		<tr>
			<td style="width: 20%">
				<span>标签名称：</span><input result="text" value="" placeholder="请输入..." id="searchTagName">
			</td>
			<td style="width: 20%">
				<span>标签等级：</span>
				<select style="width: 160px" id="searchtagLevelValue">

				</select>
			</td>
			<td style="width: 20%">
				<span>一级类别：</span>
				<select style="width: 160px" id="searchtagClasses" onchange="initSecondClasses($('#searchtagClasses option:selected').val())">
				</select>
			</td>
			<td style="width: 25%">
				<span>二级类别：</span>
				<select style="width: 160px" id="searchsecondtagClasses">
					<option value="" selected="selected"></option>
				</select>
			</td>
			<td style="width: 20%">
				<button class="searchbtn" onclick="search()">查询</button>
			</td>
		</tr>
	</table>


</div>
<div class="menu" style="top: 100px">

	<ul id="menuTabs" class="tabs"><!--只做了类切换，内容树结构相同，后台做相应json切换-->
		<li class="act" onclick="tagTree('TAG_LABLE_PEOPLE')">人员</li>
		<li onclick="tagTree('TAG_LABLE_COMPANY')">单位</li>
		<li onclick="tagTree('TAG_LABLE_EVENT')">事件</li>
	</ul>
	<div id="catalog" class="catalog">
		<dl>
			<dt>
				<b></b>对象标签<img onclick="addDict()" src="manager/images/add.png" class="addimg">
			</dt>
			<dd id="typetree">
				<%--<dl>--%>
					<%--<dt onclick="topage('','TYPE_PERSON_BASIC',true)">--%>
						<%--<b></b><a class="secendmenu " target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_BASIC">基本标签</a> <img onclick="showAddWindow()" src="manager/images/add.png" class="addimg">--%>
					<%--</dt>--%>
					<%--<dd>--%>
						<%--<dl>--%>
							<%--<dt onclick="topage('','TYPE_PERSON_BASIC',true)">--%>
								<%--<b></b><a class="secendmenu " target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_BASIC">基本标签</a> <img onclick="showAddWindow()" src="manager/images/add.png" class="addimg">--%>
							<%--</dt>--%>
							<%--<dd>--%>
								<%--<a onclick="topage('外籍','TYPE_PERSON_BASIC',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">外籍</a>--%>
								<%--<a onclick="topage('未成年人','TYPE_PERSON_BASIC',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">未成年人</a>--%>
								<%--<a onclick="topage('养老院老人','TYPE_PERSON_BASIC',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">养老院老人</a>--%>
								<%--<a onclick="topage('老人','TYPE_PERSON_BASIC',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">老人</a>--%>
								<%--<a onclick="topage('信访老户','TYPE_PERSON_BASIC',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">信访老户</a>--%>
								<%--<a onclick="topage('信用低','TYPE_PERSON_BASIC',false)" href="manager/pages/showresourcecontent.jsp" target="conIframe">信用低</a>--%>
							<%--</dd>--%>
						<%--</dl>--%>
					<%--</dd>--%>
				<%--</dl>--%>
<%--				<dl>--%>
<%--					<dt onclick="topage('','TYPE_PERSON_CIVIL',true)">--%>
<%--						<b></b><a class="secendmenu" target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_CIVIL">民政类</a> <img onclick="showAddWindow()" src="manager/images/add.png" class="addimg">--%>
<%--					</dt>--%>
<%--					<dd>--%>
<%--						<a onclick="topage('退休人员异地回沪','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">退休人员异地回沪</a>--%>
<%--						<a onclick="topage('纯老家庭','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">纯老家庭</a>--%>
<%--						<a onclick="topage('廉租家庭','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">廉租家庭</a>--%>
<%--						<a onclick="topage('支内回沪','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">支内回沪</a>--%>
<%--						<a onclick="topage('低保','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">低保</a>--%>
<%--						<a onclick="topage('重残','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">重残</a>--%>
<%--						<a onclick="topage('残疾','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">残疾</a>--%>
<%--						<a onclick="topage('困境儿童','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">困境儿童</a>--%>
<%--						<a onclick="topage('有救助经历','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">有救助经历</a>--%>
<%--						<a onclick="topage('支出型贫困','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">支出型贫困</a>--%>
<%--						<a onclick="topage('综合帮扶','TYPE_PERSON_BASIC',false)" href="manager/pages/black.html" target="conIframe">综合帮扶</a>--%>
<%--					</dd>--%>
<%--				</dl>--%>
<%--				<dl>--%>
<%--					<dt onclick="topage('','TYPE_PERSON_SOCIETY',true)">--%>
<%--						<b></b><a class="secendmenu" target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_SOCIETY">人社类</a> <img src="manager/images/add.png" class="addimg">--%>
<%--					</dt>--%>
<%--					<dd>--%>
<%--						<a onclick="topage('失业','TYPE_PERSON_SOCIETY',false)" href="manager/pages/black.html" target="conIframe">失业</a>--%>
<%--						<a onclick="topage('劳动保障监察行政处理','TYPE_PERSON_SOCIETY',false)" href="manager/pages/black.html" target="conIframe">劳动保障监察行政处理</a>					</dd>--%>
<%--				</dl>--%>
<%--				<dl>--%>
<%--					<dt onclick="topage('','TYPE_PERSON_ILLEGAL',true)">--%>
<%--						<b></b> <a class="secendmenu" target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_ILLEGAL">违法处罚类</a><img src="manager/images/add.png" class="addimg">--%>
<%--					</dt>--%>
<%--					<dd>--%>
<%--						<a onclick="topage('暴力犯罪史','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">暴力犯罪史</a>--%>
<%--						<a onclick="topage('涉毒','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">涉毒</a>--%>
<%--						<a onclick="topage('涉性','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">涉性</a>--%>
<%--						<a onclick="topage('城管监管对象','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">城管监管对象</a>--%>
<%--						<a onclick="topage('社区矫正在册','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">社区矫正在册</a>--%>
<%--						<a onclick="topage('刑满释放','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">刑满释放</a>--%>
<%--						<a onclick="topage('医闹','TYPE_PERSON_ILLEGAL',false)" href="manager/pages/black.html" target="conIframe">医闹</a>--%>
<%--					</dd>--%>
<%--				</dl>--%>
<%--				<dl>--%>
<%--					<dt onclick="topage('','TYPE_PERSON_HEALTH',true)">--%>
<%--						<b></b><a class="secendmenu" target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_HEALTH">健康类</a><img src="manager/images/add.png" class="addimg">--%>
<%--					</dt>--%>
<%--					<dd>--%>
<%--						<a onclick="topage('有精神病史','TYPE_PERSON_HEALTH',false)" href="manager/pages/black.html" target="conIframe">有精神病史</a>--%>
<%--						<a onclick="topage('重疾','TYPE_PERSON_HEALTH',false)" href="manager/pages/black.html" target="conIframe">重疾</a>--%>
<%--					</dd>--%>
<%--				</dl>--%>
<%--				<dl>--%>
<%--					<dt onclick="topage('','TYPE_PERSON_BUSINESS',true)">--%>
<%--						<b></b><a class="secendmenu" target="conIframe" href="manager/pages/showresourcecontent.jsp" id="TYPE_PERSON_BUSINESS">工商类</a><img src="manager/images/add.png" class="addimg">--%>
<%--					</dt>--%>
<%--					<dd>--%>
<%--						<a onclick="topage('法人','TYPE_PERSON_BUSINESS',false)" href="manager/pages/black.html" target="conIframe">法人</a>--%>
<%--						<a onclick="topage('企业当事人','TYPE_PERSON_BUSINESS',false)" href="manager/pages/black.html" target="conIframe">企业当事人</a>--%>
<%--						<a onclick="topage('个体户当事人','TYPE_PERSON_BUSINESS',false)" href="manager/pages/black.html" target="conIframe">个体户当事人</a>--%>
<%--					</dd>--%>
<%--				</dl>--%>
			</dd>
		</dl>
	</div>
</div>
<div class="content" style="top: 100px">
	<iframe id="mainframe" src="manager/pages/showresourcecontent.jsp" name="conIframe" frameborder="0" width="100%" height="100%"></iframe>
</div>

</body>
</html>