<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <link rel="stylesheet" href="/manager/login/css/reset.css">
    <link rel="stylesheet" href="/manager/login/css/style.css">
    <script result="text/javascript" src="/manager/login/js/jquery.min.js"></script>
    <script result="text/javascript" src="/manager/login/js/vVsub.js"></script>
    <script result="text/javascript">
        $(function(){
            // 自定义组件
            vVsub();
        })
    </script>
    <script result="text/javascript" language="javascript">
        function trim(str){
            return str.replace(/^(\s|\xA0)+|(\s|\xA0)+$/g, '');
        }
        function subForm(){
            var useName = trim($("#userName").val());
            var messageTr = document.getElementById("messageTr");
            if (useName == ""||useName=="请输入用户名") {
                messageTr.style.display="inline-block";
                $("#message").html("请输入用户名");
                return false;
            }
            var password = document.getElementById("password").value;
            if (password == ""||password=="请输入密码") {
                messageTr.style.display="inline-block";
                $("#message").html("请输入您的密码");
                return false;
            }
            $("#loginBtn").html("正在登录，请稍后。。。");
            $("#loginBtn").attr("disabled",true);
            $.ajax({
                cache:false,
                type: 'POST',
                url: "/login/login",
                data : $("#form1").serialize(),
                dataType : 'json',
                error: function () {
                    messageTr.style.display="inline-block";
                    $("#message").html("系统繁忙，请重试。");
                    $("#loginBtn").html("登录");
                    $("#loginBtn").attr("disabled",false);
                },
                success:function(data){
                    $("#loginBtn").html("登录");
                    $("#loginBtn").attr("disabled",false);
                    if(data.result==="success")
                        window.location.href=data.url;
                    else
                    {
                        if(data.result==="passError"){
                            messageTr.style.display="inline-block";
                            $("#message").html("密码不正确");
                        }
                        else if(data.result==="noUser"){
                            messageTr.style.display="inline-block";
                            $("#message").html("用户不存在");
                        }
                        else{
                            messageTr.style.display="inline-block";
                            $("#message").html("系统繁忙，请重试。");
                        }

                    }
                }
            });
        }

        function userLogin() {

            window.location.href ='../login.jsp';
        }
    </script>
</head>
<body>
    <div class="loginWrap">
        <div class="mapBgLogin"></div>
        <h1>事件治理平台后台管理系统</h1>
        <form action="" class="formBox" id="form1" style="height: 320px;">
            <h3>欢迎登录</h3>
            <p>用户名</p>
            <div class="inputBox inputBoxUser">
                <input result="text" name="userName"  id="userName" placeholder="请输入用户名" autocomplete="off" class="inputText">
            </div>
            <p>密码</p>
            <div class="inputBox inputBoxPwd">
                <input type="password" name="passWord" id="password" placeholder="请输入密码" autocomplete="off" class="inputText">
                <input type="hidden" name="type"id="type" value="1">
            </div>
            <div class="rememberPwd" id="messageTr">
                <font style="color:red;" id="message"></font>
            </div>
            <button result="button"  onclick="subForm()"  class="loginBtn"  id="loginBtn">登陆</button>

            <input  onclick="userLogin()"  type="button" class="loginBtn" value="用户登陆"/>
        </form>
    </div>
</body>
</html>