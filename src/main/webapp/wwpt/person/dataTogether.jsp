<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@include file="../common/w_include_header.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/style2.css">
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style result="text/css">
    .pagination {
    user-select: none;
    text-align: center;
    }
    </style>

</head>
<body>
<div class="index-main mt-15" id="footerhigh">
    <div class="bear-block peopleInfo" >
        <div class= "bear-tit">
            <h5>共有<span id="num">0</span>条数据</h5>
               </div>
        <div id="allinfo"></div>
        <div id="pagination" class="pagination"></div>
    </div>

</div>

</body>
<script type="text/javascript">
    $(function () {
        findEvent(1,5,true);
    });

    function findEvent(page, pageSize,flag) {
        $("#allinfo").mLoading("show");
        let beginDate = new Date();
        let time1 = window.setTimeout(function () {
            var personId = GetQueryString("paId");
            //如果id为空，则是全部人员的数据聚合
            if (personId == null) {
                $.ajax({
                    type: "post",
                    url: "/persons/dataTogether/all",
                    dataType: "json",
                    data: {
                        "page": page,
                        "pageSize": pageSize
                    },
                    success: function (result) {

                        if (flag) {
                            // 分页
                            let pageTotal;
                            if (result.data.total <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.data.total / 5);
                            }
                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //必填,总页数
                                pageAmount: 5,  //每页多少条
                                dataTotal: result.data.total, //总共多少条数据
                                curPage: 1, //初始页码,不填默认为1
                                pageSize: 5, //分页个数,不填默认为5
                                showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                                showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                                getPage: function (page) {
                                    findEvent(page,5, false);
                                    //获取当前页数

                                }
                            });

                        }
                        let data = result.data.data;
                        let str1 = "";
                        $("#num").html(result.data.total);
                        for (let i = 0; i < data.length; i++) {
                            str1 += "<div class=\"peoBox\"><div class=\"pubBlock peoSty\">";
                            if (data[i].personName != "" && data[i].personName != null && data[i].personName != "null") {

                                str1 += "<p class=\"proName\">" + data[i].personName + "</p>";
                            }
                            else{
                                str1 += "<p class=\"proName\">暂无</p>";

                            }
                            // if (data[i][2].eventContent != null&&data[i][2].eventContent!="null"&&data[i][2].eventContent!="") {
                            //
                            //
                            //     str1 += "<p class=\"proInfo\">" + data[i][2].eventContent + "</p>";
                            //
                            // }
                            // else{
                            str1 += "<p class=\"proInfo\">412723199804038759</p>";
                            // }
                            // if (data[i][2].occurredTime != "0" && data[i][2].occurredTime != "null" && data[i][2].occurredTime != null) {
                            //     var time = timestampToTime(data[i][2].occurredTime);
                            //
                            //     str1 += " <div class=\"infoBox\"><div class=\"item\">\n" +
                            //         "                        <i></i><span>" + time + "</span>\n" +
                            //         "                    </div>";
                            // }
                            // else{
                                str1+=" <div class=\"infoBox\"><div class=\"item\">\n" +
                                    "                        <i></i><span>男</span>\n" +
                                    "                    </div>";
                            // }
                            // if (data[i][0].objectName != null&&data[i][0].objectName !=""&&data[i][0].objectName !="null") {
                            //     str1 += "<div class=\"item\">\n" +
                            //         "                        <i></i>\n" +
                            //         "                        <a href=\"javascript:;\">" + data[i][0].objectName + "</a>\n" +
                            //         "                    </div>";
                            // }
                            // else{
                                str1 += "<div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <a href=\"javascript:;\">年龄:10</a>\n" +
                                    "                    </div>";
                            // }
                            // if (data[i][2].eventSource != null&&data[i][2].eventSource !=""&&data[i][2].eventSource !="null") {
                            //     str1 += "<div class=\"item\">\n" +
                            //         "                        <i></i>\n" +
                            //         "                        <a href=\"javascript:;\">" + data[i][2].eventSource + "</a>\n" +
                            //         "                    </div>";
                            // }
                            // else {
                                str1 += "<div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <a href=\"javascript:;\">13122310326</a>\n" +
                                    "                    </div>";
                            // }

                            str1 += " </div>\n" +
                                "        </div></div>";
                        }
                        $("#allinfo").html(str1);
                    }
                });
            } else {
                var personId = GetQueryString("paId");
                console.log(personId);
                $.ajax({
                    url: '/personaffair/findMoreEventById',
                    result: 'POST',
                    dataType: "json",
                    data: {
                        "pages": page,
                        "keyObjectListId": personId,
                        "rows": pageSize
                    },
                    success: function (result) {
                        if (flag) {
                            // 分页
                            var pageTotal;
                            if (result.total <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.total / 5);
                            }

                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //必填,总页数
                                pageAmount: 5,  //每页多少条
                                dataTotal: result.total, //总共多少条数据
                                curPage: 1, //初始页码,不填默认为1
                                pageSize: 5, //分页个数,不填默认为5
                                showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                                showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                                getPage: function (page) {
                                    console.log(page);

                                    findEvent(page, 5, false);
                                    //获取当前页数

                                }
                            });

                        }
                        var data = result.rows;
                        var str1 = "";

                        $("#num").html(result.total);
                        for (var i = 0; i < data.length; i++) {

                            str1 += "<div class=\"peoBox\"><div class=\"pubBlock peoSty\">";
                            if (data[i][2].eventName != null && data[i][2].eventName != null && data[i][2].eventName != "null") {

                                str1 += "<p class=\"proName\">" + data[i][2].eventName + "</p>";
                            } else {
                                str1 += "<p class=\"proName\">无</p>";
                            }
                            if (data[i][2].eventContent != null && data[i][2].eventContent != null && data[i][2].eventContent != "null") {

                                str1 += "<p class=\"proInfo\">" + data[i][2].eventContent + "</p>";
                            } else{
                                str1 += "<p class=\"proInfo\">无</p>";
                            }
                            if (data[i][2].occurredTime != "0" && data[i][2].occurredTime != "null" && data[i][2].occurredTime != null) {

                                var time = timestampToTime(data[i][2].occurredTime);
                                str1 += " <div class=\"infoBox\"><div class=\"item\">\n" +
                                    "                        <i></i><span>" + time + "</span>\n" +
                                    "                    </div>";
                            } else {
                                str1 += " <div class=\"infoBox\"><div class=\"item\">\n" +
                                    "                        <i></i><span>暂无时间</span>\n" +
                                    "                    </div>";
                            }
                            if (data[i][0].objectName != null && data[i][0].objectName != null && data[i][0].objectName != "null") {
                                str1 += "<div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <a href=\"javascript:;\">" + data[i][0].objectName + "</a>\n" +
                                    "                    </div>";
                            } else {
                                str1 += "<div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <a href=\"javascript:;\">无</a>\n" +
                                    "                    </div>";
                            }
                            if (data[i][2].eventSource != null && data[i][2].eventSource != null && data[i][2].eventSource != "null") {
                                str1 += "<div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <a href=\"javascript:;\">" + data[i][2].eventSource + "</a>\n" +
                                    "                    </div>";
                            } else {
                                str1 += "<div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <a href=\"javascript:;\">无</a>\n" +
                                    "                    </div>";
                            }

                            str1 += " </div>\n" +
                                "        </div></div>";
                        }
                        $("#allinfo").html(str1);
                    }
                });
            }
            $("#allinfo").mLoading("hide");
            window.clearTimeout(time1);},new Date()-beginDate+300);
    }



    $(function () {
        // 输入框控件调用
        vVsub();

        // 分页
        new Page({
            id: 'pagination',
            pageTotal: 50, //必填,总页数
            pageAmount: 10,  //每页多少条
            dataTotal: 500, //总共多少条数据
            curPage: 1, //初始页码,不填默认为1
            pageSize: 5, //分页个数,不填默认为5
            showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
            showSkipInputFlag: true, //是否支持跳转,不填默认不显示
            getPage: function (page) {
                //获取当前页数
                console.log(page);
            }
        });

        footerChange();
    });
    $(window).resize(function () {
        footerChange();
    })

    function footerChange() {
        // .index-main高度
        var indexMainH = $("#footerhigh").outerHeight(true);
        $(".footerBox").css("top", indexMainH + 50);

    }
</script>
</html>