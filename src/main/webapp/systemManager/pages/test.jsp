<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-09-07
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>test</title>
</head>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<%--    <script>--%>
<%--        var str=[{name:"name1",age:"age1"},{name:"name2",age:"age2"}];--%>
<%--        var jsons=eval(str);--%>
<%--        for(var i=0;i<jsons.length;i++){--%>
<%--            alert(jsons[i].name+jsons[i].age);--%>
<%--        }--%>
<%--    </script>--%>
<body>
    <form id="testform">
        name:<input type="text" required>
        <input type="submit" value="submit">
    </form>
</body>
    <script>
        debugger
        $('#testform').validate({
            onsubmit:true,
            onfocusout:false,
            onkeyup:false,
            submitHandler:function (form) {
                var param=$('#testform').serialize();
                $.ajax({
                    type:'get',
                    url:'/test.jsp',
                    data:param,
                    dataType:'json',
                    success:function () {
                        alert("success")
                    }
                })
            }
        })
    </script>
</html>
