<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>后台管理系统</name>
    <link rel="stylesheet" href="manager/css/reset.css">
    <link rel="stylesheet" href="manager/css/style.css">
    <link rel="stylesheet" href="manager/css/scrollbar.css">
    <script src="manager/js/jquery.min.js" result="text/javascript"></script>
    <script result="text/javascript">
        $(function(){
            // 左侧菜单切换
            $(".navBox").find("li").mouseover(function(){
                $(this).find(".subMenu").show();
            });
            $(".navBox").find("li").mouseout(function(){
                $(this).find(".subMenu").hide();
            })
        })
    </script>
    <style>
        html,body{
            position: relative;
            height: 100%;
        }
        .headerBox .adminInfo {
		    width: 100px;
		}
		.headerBox .adminInfo .avatar{
			left: 10px;
		}
		.headerBox .adminInfo .name{
			position: relative;
			left: 10px;
		}
    </style>
</head>
<body>
    <div class="headerBox clearfix">
        <h1 class="v-fl"></h1>
        <h2 class="v-fl">后台管理系统</h2>
        <div class="v-fr adminInfo">
            <p class="name v-fl"><span id="username"></span></p>
            <div class="avatar v-fl">
                <span></span>
                <div class="dropDown">
                    <p class="setting">设置</p>
                    <p class="logout">退出</p>
                </div>
            </div>
        </div>
    </div>
    <div class="conWrap">
        <div class="navBox v-fl">
            <ul>
                <li>
                    <a href="manager/pages/statistics.jsp" target="mainiframe" class="firstMenu">运行监控</a>
<%--                    <div class="subMenu">--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">一般项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">信息化项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">公用经费</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">发改委项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">经信委项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">突发项目</a>--%>
<%--                    </div>--%>
                </li>
                <li>
                    <a href="manager/pages/showresource.jsp" target="mainiframe" class="firstMenu">标签管理</a>
<%--                    <div class="subMenu">--%>
<%--                        <a href="manager/pages/tagDicSource.jsp" target="mainiframe">一般项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">信息化项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">公用经费</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">发改委项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">经信委项目</a>--%>
<%--                        <a href="manager/pages/black.html" target="mainiframe">突发项目</a>--%>
<%--                    </div>--%>
                </li>
                <li>
                    <a href="manager/pages/relationSource.jsp" target="mainiframe" class="firstMenu">关系管理</a>
                    <%--<div class="subMenu">
                        <a href="manager/pages/black.html" target="mainiframe">一般项目</a>
                        <a href="manager/pages/black.html" target="mainiframe">信息化项目</a>
                        <a href="manager/pages/black.html" target="mainiframe">公用经费</a>
                        <a href="manager/pages/black.html" target="mainiframe">发改委项目</a>
                        <a href="manager/pages/black.html" target="mainiframe">经信委项目</a>
                        <a href="manager/pages/black.html" target="mainiframe">突发项目</a>
                    </div>--%>
                </li>

            </ul>
        </div>
        <div class="mainIframe v-fl">
            <iframe src="manager/pages/statistics.jsp" frameborder="0" name="mainiframe" width="100%" height="100%"></iframe>
        </div>
    </div>
</body>
</html>