<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%@include file="../wwpt/common/w_include_header.jsp" %>
    <script type="text/javascript" src="../wwpt/common/w_common_method.js"></script>
</head>
<body>
<script>
    $(function () {
        alert(1)
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/portal/newlogin.action?account=sjzx&&password=123456",
            data: $('#userLoginForm').serialize(),
            error: function (request) {
                $("#message").html("ÓÃ»§Ãû»òÃÜÂë´íÎó£¬ÇëÖØÐÂµÇÂ¼");
            },
            success: function (data) {
                var message = strToJson(data);
                kan = message;
                if (message.message == "success") {
                    console.log(message)
                    window.open('http://localhost:8080/portal/searchMenu.jsp');
                    // location_href('http://localhost:8080'+message.url);
                } else if (message.message == "teamFail")
                    $("#message").html("¸ÃÓÃ»§Ã»ÓÐÉèÖÃ×éÖ¯£¬ÎÞ·¨µÇÂ½");
                else if (message.message == "powerFail")
                    $("#message").html("¸ÃÓÃ»§Ã»ÓÐÈ¨ÏÞ£¬ÎÞ·¨µÇÂ½");
                else
                    $("#message").html("ÓÃ»§Ãû»òÃÜÂë´íÎó£¬ÇëÖØÐÂµÇÂ¼");
            }
        });
    })

    function strToJson(str) {
        var json = (new Function("return " + str))();
        return json;
    }
</script>
<%--<div class="iframeBox">--%>
<%--    <iframe src="http://localhost:8080/portal/searchMenu.jsp" id="main_frame" name="main_frame" frameborder="0" width="100%"--%>
<%--            height="100%" class="iframeMain"></iframe>--%>
<%--</div>--%>

</body>
</html>