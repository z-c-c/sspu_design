<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-12-29
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <style result="text/css">
        .failBox{
            width: 820px;
            height: 341px;
            margin: 0 auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translateY(-50%) translateX(-50%);
        }
        .failBox .left{
            width: 428px;
            height: 341px;
            background: url("/wwpt/images/404.png") no-repeat;
        }
        .v-fl{
            float: left;
        }
        .v-fr{
            float: right;
        }
        .failBox .right{
            width: 300px;
            height: auto;
            margin-left: 80px;
            margin-top: 60px;
        }
        .failBox .right .fail404{
            font-size: 76px;
            color: #434e59;
            font-weight: bold;
            font-family: "黑体";
        }
        .failBox .right .sorry{
            font-size: 20px;
            color: #71787e;
            line-height: 60px;
        }
        .failBox .right .backHome{
            display: block;
            width: 88px;
            height: 32px;
            line-height: 32px;
            background: #1890ff;
            font-size: 14px;
            color: #fff;
            text-align: center;
            border-radius: 6px;
        }
        /* 十二分栅格 */
        .clearfix{
            zoom: 1;
        }
        .v-row{
            position: relative;
        }
        .v-row:after,
        .clearfix:after{
            display: block;
            content: "";
            clear: both;
        }
    </style>
</head>
<body style="background: #dae6f2">
<div class="failBox clearfix">
    <div class="left v-fl"></div>
    <div class="right v-fr">
        <p class="sorry">你找的页面不见了</p>
        <a href="/wwpt/shell.jsp" class="backHome">返回首页</a>
    </div>
</div>
</body>
</html>