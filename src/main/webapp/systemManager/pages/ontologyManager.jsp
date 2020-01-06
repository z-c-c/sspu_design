<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>本体领域管理</title>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="systemManager/css/page.css">
    <link rel="stylesheet" href="knowledge/css/jquery.mloading.css">
    <script type="text/javascript" src="systemManager/js/jquery.min.js"></script>
    <script type="text/javascript" src="knowledge/js/jquery.mloading.js"></script>
    <script type="text/javascript" src="systemManager/js/pop.js"></script>
</head>
<body>
<div class="f-content p2-1">
    <div class="f-top">
        <div class="f-title" style="display: inline;"><span>知识库管理&nbsp;/&nbsp;</span>本体领域管理</div>
        <div class="f-title" style="float: right;margin-right:30px;"><span id="createMes"></span></div>
        <%--<div class="search-box">
            <div class="fz-left">
                <img src="systemManager/images/p2-1-icon4.png">
                <span>新增</span>
            </div>
            <div class="fz-right">

            </div>
        </div>--%>
    </div>
    <script>
        $(function () {
            $.ajax({
                url:"ontology/getInstance",
                dataType: "json",
                success: function (res) {
                    if (res.code == 200) {
                        $("#createMes").html("");
                    } else {
                        $("#createMes").html(res.message);
                    }
                }
            })
        })
    </script>
    <div class="f-bott" >
        <iframe marginwidth="0" marginheight="0" width="100%" height="100%" id="myiframe" scrolling="no" onload="changeFrameHeight()" src="systemManager/pages/mxGraph/grapheditor/index.jsp" frameborder="0">
        </iframe>
    </div>

    <script>
        function changeFrameHeight(){
            var ifm = document.getElementById("myiframe");
            ifm.height=document.documentElement.clientHeight;
        }

        window.onresize=function(){
            changeFrameHeight();
        }
    </script>
</div>

</body>
</html>