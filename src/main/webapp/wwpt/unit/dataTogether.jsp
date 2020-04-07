<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-11-05
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>单位数据聚合</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@include file="../common/w_include_header.jsp" %>
    <link rel="stylesheet" href="../css/style1.css">
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style result="text/css">
        .backG {
            background: url('/wwpt/images/noImage.png') no-repeat bottom center;
        }

        .topCot {
            position: relative;
            /*top: -2px;*/
        }
    </style>
</head>
<body>
<div class="index-main mt-15">
    <div class="bear-block peopleInfo whiteBox" style="position: relative">
        <div class="bear-tit">
            <h5>共有<span id="dataTogetherCount">0</span>条数据</h5>
        </div>
        <div class="peoBox" id="dataTogether">
        </div>
        <br><br><br><br><br>
        <div id="pagination" class="pagination" style="position: absolute;bottom: 0px;left: 30%;"></div>
    </div>
</div>

<%--<div class="footerBox"></div>--%>
</body>
<script result="text/javascript">
    var result = getParameter("Type");
    var unittag;
    var eventDateTogetherCount;


    $(function () {

        if (result == "unit") {
            initAllDataTogether(1, true);
        } else {
            initEventDataTogether(result, 1, true);
        }

        // 输入框控件调用
        vVsub();
        // 分页
        // new Page({
        //     id: 'pagination',
        //     pageTotal: 50, //必填,总页数
        //     pageAmount: 10,  //每页多少条
        //     dataTotal: 500, //总共多少条数据
        //     curPage: 1, //初始页码,不填默认为1
        //     pageSize: 5, //分页个数,不填默认为5
        //     showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
        //     showSkipInputFlag: true, //是否支持跳转,不填默认不显示
        //     getPage: function (page) {
        //         //获取当前页数
        //         console.log(page);
        //     }
        // });
        // footerChange();
    });
    $(window).resize(function () {
        footerChange();
    })

    function footerChange() {
        // .index-main高度
        var indexMainH = $(".peopleInfo").outerHeight(true);
        if (indexMainH < 750) {
            indexMainH = 750;
        }
        $(".whiteBox").css("height", indexMainH);
        $(".footerBox").css("top", indexMainH + 50);
    }

    //单个事件数据聚合数量
    function eventDataTogether(eventId) {
        $.ajax({
            type: "post",
            url: "/eventInfo/findDataTogether",
            dataType: "json",
            async: false,
            data: {
                eventId: eventId,
                page: 1,
                pageSize: 5
            },
            success: function (result) {
                var count = result.data.count;
                eventDateTogetherCount = count;
            }
        })
    }

    function initEventDataTogether(unitId, page, flag) {

        $.ajax({
            type: "post",
            url: "/units/dataTogether",
            dataType: "json",
            data: {
                unitId: unitId,
                page: page,
                pageSize: 5
            },
            success: function (result) {
                var list = result.data.data;
                var count = result.data.total;
                if (flag) {
                    // 分页
                    var pageTotal;
                    if (count <= 5) {
                        pageTotal = 1;
                    } else {
                        pageTotal = Math.ceil(count / 5);
                    }
                    new Page({
                        id: 'pagination',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 5,  //每页多少条
                        dataTotal: count, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 5, //分页个数,不填默认为5
                        showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                        showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                        getPage: function (page) {
                            //获取当前页数
                            initEventDataTogether(unitId, page, false);
                        }
                    });
                }
                $("#dataTogetherCount").text(count);
                $("#dataTogether").empty();
                if (list.length == 0) {
                    var strs = '<li class="backG topCot" style="height: 350px;">' +
                        '</li>';
                    $("#dataTogether").append(strs);
                }
                for (var i = 0; i < list.length; i++) {

                    eventDataTogether(list[i].unitId);
                    if (!eventDateTogetherCount) {
                        eventDateTogetherCount = 0;
                    }
                    getTags(list[i].unitId);
                    if (!unittag) {
                        unittag = ''
                    }
                    var EVENT_NAME = list[i].unitName;
                    if (EVENT_NAME == null || EVENT_NAME.trim().length == 0) {
                        EVENT_NAME = '暂无';
                    }
                    var EVENT_CONTENT = list[i].unitDetail;
                    if (EVENT_CONTENT == null || EVENT_CONTENT.trim().length == 0) {
                        EVENT_CONTENT = '暂无';
                    }
                    var OCCURED_TIME = new Date(list[i].registerTime).format("yyyy-MM-dd hh:mm:ss");
                    if (list[i].registerTime == null || list[i].registerTime == 0) {
                        OCCURED_TIME = '暂无';
                    }

                    $("#dataTogether").append('  <div class="pubBlock peoSty">\n' +
                        '                <p class="proName">' + EVENT_NAME + '</p>\n' +
                        '                <p class="proInfo" style="width: 100%">' + EVENT_CONTENT + '</p>\n' +
                        '                <div class="infoBox">\n' +
                        '                    <div class="item">\n' +
                        '                        <i></i>\n' +
                        '                        <span>' + OCCURED_TIME + '</span>\n' +
                        '                    </div>\n' +
                        // '                    <div class="item">\n' +
                        // '                        <i></i>\n' +
                        // '                        <a onclick="toEventDataTogether(\'' + list[i].eventId + '\')" style="cursor: pointer">数据聚合（'+eventDateTogetherCount+'）</a>\n' +
                        // '                    </div>\n' +
                        '                </div>\n' +
                        '                <div class="labelBox">\n' + unittag +
                        '                </div>\n' +
                        '            </div>');
                }
                footerChange();
            }
        })

    }

    function toEventDataTogether(eventId) {

        openNewWindow("dataTogether.jsp?Type=" + eventId + "");
    }

    //事件的数据聚合
    function initAllDataTogether(page, flag) {
        $.ajax({
            type: "post",
            url: "/units/dataTogether/all",
            dataType: "json",
            data: {
                page: page,
                pageSize: 5
            },
            success: function (result) {
                let list = result.data.data;
                let count = result.data.total;
                if (flag) {
                    // 分页
                    var pageTotal;
                    if (count <= 5) {
                        pageTotal = 1;
                    } else {
                        pageTotal = Math.ceil(count / 5);
                    }
                    new Page({
                        id: 'pagination',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 5,  //每页多少条
                        dataTotal: count, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 5, //分页个数,不填默认为5
                        showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                        showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                        getPage: function (page) {
                            //获取当前页数
                            initAllDataTogether(page, false);
                        }
                    });
                }
                $("#dataTogetherCount").text(count);
                $("#dataTogether").empty();
                if (list.length == 0) {
                    let strs = '<li class="backG topCot" style="height: 350px;">' +
                        '</li>';
                    $("#dataTogether").append(strs);
                }
                for (let i = 0; i < list.length; i++) {

                    eventDataTogether(list[i].unitId);
                    if (!eventDateTogetherCount) {
                        eventDateTogetherCount = 0;
                    }
                    getTags(list[i].unitId);
                    if (!unittag) {
                        unittag = ''
                    }
                    var EVENT_NAME = list[i].unitName;
                    if (EVENT_NAME == null || EVENT_NAME.trim().length == 0) {
                        EVENT_NAME = '暂无';
                    }
                    var EVENT_CONTENT = list[i].unitDetail;
                    if (EVENT_CONTENT == null || EVENT_CONTENT.trim().length == 0) {
                        EVENT_CONTENT = '暂无';
                    }
                    var OCCURED_TIME = new Date(list[i].registerTime).format("yyyy-MM-dd hh:mm:ss");
                    if (list[i].registerTime == null) {
                        OCCURED_TIME = '暂无';
                    }
                    $("#dataTogether").append('  <div class="pubBlock peoSty">\n' +
                        '                <p class="proName">' + EVENT_NAME + '</p>\n' +
                        '                <p class="proInfo" style="width: 100%">' + EVENT_CONTENT + '</p>\n' +
                        '                <div class="infoBox">\n' +
                        '                    <div class="item">\n' +
                        '                        <i></i>\n' +
                        '                        <span>' + OCCURED_TIME + '</span>\n' +
                        '                    </div>\n' +
                        '                    <div class="item">\n' +
                        '                        <i></i>\n' +
                        '                        <a onclick="toEventDataTogether(\'' + list[i].eventId + '\')" style="cursor: pointer">数据聚合（' + eventDateTogetherCount + '）</a>\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <div class="labelBox">\n' + unittag +
                        '                </div>\n' +
                        '            </div>');
                }
                footerChange();
            }
        });

    }

    //事件标签
    function getTags(objectId) {
        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType: "json",
            async: false,
            data: {
                objectId: objectId,
            },
            success: function (result) {
                var str = '';
                if (result.code == "success") {
                    var tags = result.data;
                    for (var i = 0; i < tags.length; i++) {
                        let color = JSON.parse(tags[i].tagCssCode).color;
                        str += '<span style="background: ' + color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag = str;
            }
        });
    }
</script>
</html>