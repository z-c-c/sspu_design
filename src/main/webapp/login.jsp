<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<title>事件治理平台</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="./css/reset.css">
		<link rel="stylesheet" type="text/css" href="./wwpt/css/style.css">
		<script type="text/javascript" src="./js/jquery.min.js"></script>
		<script type="text/javascript" src="./wwpt/js/bear.js"></script>
		<script type="text/javascript" src="./js/md5.min.js"></script>
		<script type="text/javascript" language="javascript">
			var ps;
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
				getKey();
				$.ajax({
					cache:false,
					type: 'POST',
					url: "/login/login",
					async: false,
					data: {
						userName: $("#userName").val(),
						passWord: ps,
						flag: $("#flag").val()

					},
					dataType : 'json',
					error: function () {
						messageTr.style.display="inline-block";
						$("#message").html("系统繁忙，请重试。");
						$("#loginBtn").html("登录");
						$("#loginBtn").attr("disabled",false);
					},
					success:function(data){
						debugger
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
			function adminLogin() {
				top.location.href = './managerLogin.jsp'
			}

			function getKey() {
				ps = $("#password").val();
				$.ajax({
					cache: false,
					type: 'get',
					url: "/key/",
					async: false,
					dataType: 'json',
					success: function (result) {
						let publicKey = result.data.publicKey;
						let privateKey = result.data.privateKey;
						ps = md5(md5(ps + publicKey) + privateKey);
					}
				})
			}
		</script>
	</head>
	<body>
		<div class="y-lgnall">
			<div class="y-videoframe">
				<video id="v1" src="video/loginbg.mp4" width="100%" autoplay loop muted="muted"></video>
			</div>
			<div class="y-lgnarea">
				<div class="y-lgnarea-title"></div>
				<form class="y-lgnblock" id="form1">
					<div class="y-form-inner">
						<div class="y-lgnblock-title">登录</div>
						<div class="y-lgnblock-input">
							<input name="userName"  id="userName" class="y-input" type="text" placeholder="请输入您的用户名" />
						</div>
						<div class="y-lgnblock-input">
							<input name="passWord" id="password" class="y-input" type="password" placeholder="请输入您的密码" />
<%--							<input type="hidden" name="type" value="" id="type">--%>
							<input type="hidden" name="flag" value="0" id="flag">
						</div>
						<div class="y-check clearfix" style="height: 30px">
							<div class="v-fl">
								<input id="remember" type="checkbox" style="display: none;" />
<%--								<label id="y-fakebox" for="remember">√</label>--%>
								<label for="remember" style="margin-left: 4px;"onclick="adminLogin()">管理员登陆</label>
							</div>
							<a href='#' class="v-fr" style="color: #fff;">忘记密码</a>
						</div>
                        <div class="rememberPwd" id="messageTr" style="width: 100%;text-align: center;height: 15px">
                            <font style="color:red;font-size: 17px" id="message"></font>
                        </div>
						<button type="button" class="y-lgnblock-btn"  onclick="subForm()" id="loginBtn">登录</button>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script>
		/*宽高100%缩放 - 整屏*///缩放的DIV上CSS要加上transform-origin: top left;
		function widthFull(shell) {
			$("body").css({ overflow: "hidden" });
			$(window).resize(function () {
				var $width = $(window).width(),
						$height = $(window).height(),
						wRate = $width / $(shell).width(),
						hRate = $height / $(shell).height();
				$(shell).css({ transform: "scale(" + wRate + "," + hRate + ")" });
			}).trigger('resize');
		};
		$(function() {
			widthFull(".y-lgnall");
			$("label").click(function(){
				if($('#remember').is(":checked")){
					$('#y-fakebox').removeClass("checked");
				}else{
					$('#y-fakebox').addClass("checked");
				}
			})
		})
	</script>
</html>
