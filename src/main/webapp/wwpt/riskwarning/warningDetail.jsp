<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-11-05
  Time: 15:23
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
    <%@include file="../common/w_include_header.jsp" %>
    <link rel="stylesheet" href="../css/icon.css"><!--easyui-->
    <script type="text/javascript" src="../js/my_scrollbar.js"></script>
    <script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/getParameter.js"></script>
    <script type="text/javascript" src="../common/w_common_method.js"></script>
    <style type="text/css">
        .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {

            line-height: unset;

        }

        .titleCon {
            overflow: scroll;
            height: 400px;

        }

        .dataList dl dd .Zcon {
            width: 100%;
            height: 32px;
            font-size: 14px;
            line-height: 24px;
            color: rgba(0, 0, 0, 0.65);
            margin: 8px 0;
        }

        .infoBox-l-item1 p.line1 {
            font-size: 30px;
            line-height: 1px;
            color: rgba(0, 0, 0, 0.85);
        }

        .dataList2 .label span, .infoBox-l-item .label span, .peoInfo .label span {
            display: inline-block;
            padding: 0 6px;
            box-sizing: border-box;
            font-size: 12px;
            line-height: 24px;
            color: #ffffff;
            border-radius: 4px;
            margin-right: 8px;
            margin-bottom: 8px;
            margin-top: 10px;
            /* position: absolute; */
        }

        .dataList2 .label, .infoBox-l-item .label, .peoInfo .label {
            height: 36px;
            width: 100%;
            margin-top: 20px;
        }


        .tableStyy td {
            margin: 0;
            padding: 0;
            border-bottom: thin dashed gainsboro;
        }

        .tableStyy {
            font-size: 14px;
            line-height: 22px;
            color: rgba(0, 0, 0, 0.85);
        }

        .tableStyy tr {
            height: 40px;
            line-height: 40px;
        }

        .tableStyy tr td.adress {
            color: #2c9beb;
        }

        .tableStyy tr td.adress::after {
            content: "";
            display: inline-block;
            width: 12px;
            height: 14px;
            background: url("../images/icon-adress.png") no-repeat;
            position: relative;
            top: 2px;
            margin-left: 6px;
            border-collapse: collapse;
        }

        .tableStyy tr td.green {
            color: #3fc277;
        }

        .tableSty td {
            margin: 0;
            padding: 0;
            width: 130px;
        }

        .infoBox-l-item1 .pg-status {
            width: 30%;
            height: auto;
            display: inline-block;
            margin-top: -80px;
        }

        #unitName::before {
            content: "";
            display: inline-block;
            width: 23px;
            height: 23px;
            background: url(../images/icon-item3.png) no-repeat;
            background-size: 100% 100%;
            position: relative;
            margin-right: 12px;
            top: 2px;
        }

        .place {
            color: #2c9beb
        }

        .place::after {
            content: "";
            display: inline-block;
            width: 12px;
            height: 14px;
            background: url(../images/icon-adress.png) no-repeat;
            position: relative;
            top: 2px;
            margin-left: 6px;
            border-collapse: collapse;
        }
    </style>
    <script result="text/javascript">

    </script>
</head>
<body>

<div class="index-main">
    <div class="whiteBox">
        <div class="infoBox-l" style="right: 0px">
            <div class="infoBox-l-item infoBox-l-item1">
                <div>
                    <div class="name-l">
                        <!-- 这里一行调用line1  两行调用line2 -->
                        <p class="con line1" id="noticeName"></p>
                        <div class="label" id="noticeTags">
                        </div>
                    </div>
                    <div class="pg-status v-fr">
                        <div>
                            <p class="status-text">预警类型</p>
                            <p class="status" id="noticeType"></p>
                        </div>
                        <!-- 已评估图 -->
                        <i></i>
                    </div>
                </div>
                <p class="complaintText" id="noticeContent">
                </p>
                <table border="0" class="tableSty">
                    <tr>
                        <td width="90" class="tdColor">预警等级：</td>
                        <td width="350" class="green" id="noticeLevel"></td>

                        <td width="90" class="tdColor">预警时间：</td>
                        <td class="green" id="noticeDate"></td>
                    </tr>
                    <tr>
                        <td width="90" class="tdColor">预警对象：</td>
                        <td width="350" id="noticeObjectName" class="green" style="cursor: pointer;"
                            onclick="detail()"></td>

                        <td width="90" class="tdColor">预警对象类型：</td>
                        <td class="green" id="noticeObjectType"></td>
                    </tr>
                    <tr>
                        <td width="90" class="tdColor">预警地点：</td>
                        <td width="350" class="adress" id="noticeAddr"></td>

                    </tr>

                </table>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="objectType">
<input type="hidden" id="objectId">
</body>
<script result="text/javascript">
    var enentId = getParameter("noticeId")
    var unittag;
    $(function () {
        initWarning();
        vVsub();
    })


    function initWarning() {
        $.ajax({
            type: "GET",
            url: "/warnings/" + enentId,
            dataType: "json",
            async: false,
            success: function (result) {
                let warning = result.data;
                if (warning != null) {

                    let tags = JSON.parse(warning.warningTags);

                    for (let i = 0; i < tags.length; i++) {
                        $("#noticeTags").append('<span style="background: ' + tags[i].tagCssCode.color + '" class="green">' + tags[i].tagName + '</span>')
                    }
                    document.title = judgeNull(warning.noticeName);
                    let type = {}
                    type['person'] = "人员预警";
                    type['unit'] = "单位预警";
                    type['event'] = "事件预警";
                    $("#noticeName").text(judgeNull(warning.noticeName));
                    $("#noticeType").text(judgeNull(warning.noticeType));
                    $("#noticeContent").text(judgeNull(warning.noticeContent));
                    let level = ['', '轻度', '一般', '较严重', '严重'];
                    $("#noticeLevel").text(judgeNull(level[warning.noticeLevel]));
                    $("#noticeAddr").text(judgeNull(warning.noticeAddr));
                    $("#noticeObjectType").text(judgeNull(type[warning.noticeObjectType]));
                    $("#noticeObjectName").text(judgeNull(warning.noticeObjectName));
                    if (warning.noticeDate != null) {
                        $("#noticeDate").text(judgeNull(new Date(warning.noticeDate).format("yyyy-MM-dd hh:mm:ss")));
                    } else {
                        $("#noticeDate").text('无');
                    }

                    $("#objectType").val(warning.noticeObjectType);
                    $("#objectId").val(warning.noticeObjectId);

                }

            }
        })
    }

    function judgeNull(data) {
        if (data == "" || data == null || data == undefined || data == "null")
            data = "无"
        return data;
    }

    function detail() {
        toDetail($("#objectType").val(), $("#objectId").val());
    }

</script>
</html>