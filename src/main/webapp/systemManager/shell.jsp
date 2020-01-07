<%@ page import="com.zcc.manager.usermanager.entity.UserInfoEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserInfoEntity currentPerson = (UserInfoEntity)session.getAttribute("currentPerson");
%>
<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../systemManager/css/style.css">
    <script type="text/javascript" src="../systemManager/js/jquery.min.js"></script>
</head>
<body>
<div class="shell open">
    <div class="leftmenu">
        <div class="logo"><span onclick="javascript:top.window.location='../wwpt/shell.jsp'" style="cursor: pointer"><&nbsp;&nbsp;</span>后台管理系统
        </div>
        <ul class="menu_1st opened">
            <li><h6><img src="../systemManager/images/idx-icon1.png">基本信息管理</h6>
                <ul class="menu_2nd">
                    <li class="menu_2nd_li f-cur"><a href="../systemManager/pages/tagManager.jsp" target="main_frame">标签管理</a>
                    </li>
                    <li class="menu_2nd_li "><a href="../systemManager/pages/systemManager.jsp" target="main_frame">系统样式管理</a>
                    </li>
                </ul>
            </li>
            <li><h6><img src="../systemManager/images/idx-icon2.png"/>知识库管理</h6>
                <ul class="menu_2nd">
                    <li class="menu_2nd_li"><a href="../systemManager/pages/ontologyManager.jsp" target="main_frame">本体领域管理</a></li>
                    <li class="menu_2nd_li"><a href="../systemManager/pages/instanceManager.jsp" target="main_frame">实例数据管理</a></li>
                    <li class="menu_2nd_li"><a href="../systemManager/pages/wordManager.jsp" target="main_frame">标签管理</a></li>
                </ul>
            </li>
            <li><h6><img src="../systemManager/images/idx-icon3.png"  alt=""/>数据接口管理</h6>
                <ul class="menu_2nd">
                    <li class="menu_2nd_li"><a href="../systemManager/pages/interfaceManager.jsp" target="main_frame">接口管理</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="rightframe">
        <div class="f-header">
            <img class="door" src="../systemManager/images/idx-icon4.png" />
            <div class="infor">
                <span><img src="../systemManager/images/idx-icon5.png" style="margin-right:10px" />星期五&nbsp;13:00:00</span>
                <div>
                    <i class="notice has"></i>
                    <img class="avatar" src="../systemManager/images/idx-icon7.png" />
                    <span><%=currentPerson.getUserName()%></span>
                </div>
            </div>
        </div>
        <div class="main">
            <iframe src="../systemManager/pages/tagManager.jsp" id="main_frame" name="main_frame" frameborder="0"
                    width="100%" height="100%" style="background: #edefef;"></iframe>
        </div>
    </div>
</div>
</body>
<script>
    $(function(){
        $(".menu_1st > li").click(function(){
            if($(".shell").hasClass("open")){
                $(this).hasClass("opened") ? $(this).removeClass("opened") : $(this).addClass("opened").siblings().removeClass("opened");
            }
        });
        $(".menu_2nd_li").click(function(e){
            e.stopPropagation();
            $(".menu_2nd_li").filter(".f-cur").removeClass("f-cur");
            $(this).addClass("f-cur");
        })
        $(".door").click(function(){
            $(".menu_1st > li.opened").removeClass("opened");
            $(".shell").hasClass('open') ? $(".shell").removeClass("open") : $(".shell").addClass("open");
            if ($(".shell").hasClass("open")) {
                $(".logo").text("后台管理系统")
                $(".logo").prepend('<span onclick="javascript:top.window.location=\'../wwpt/shell.jsp\'" style="cursor: pointer"><&nbsp;&nbsp;</span>');

            } else {
                $(".logo").text("");
            }
        })
    })
</script>
</html>
