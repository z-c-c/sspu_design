<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2020-04-07
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <%@include file="../common/w_include_header.jsp" %>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/myPagination.js"></script>
    <script type="text/javascript" src="../js/vVsub.js"></script>
    <script type="text/javascript" src="../common/w_common_method.js"></script>
    <script type="text/javascript" src="../js/jquery.mloading.js"></script>
    <script type="text/javascript" src="../js/warningUtil.js"></script>
    <script type="text/javascript">
        let personTags = '';
        $(function () {
            // 输入框控件调用
            vVsub();
            footerChange();
        });
        $(window).resize(function () {
            footerChange();
        });

        function footerChange() {
            // .index-main高度
            var indexMainH = $(".peopleInfo").outerHeight(true);
            $(".footerBox").css("top", indexMainH + 50);
        }

        $(function () {
            findPerson(1, 5, true);
        });

        function findPerson(page, pageSize, flag) {
            $("#personList").mLoading("show");
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
                                $("#num").text(result.data.total);
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
                                        findPerson(page, 5, false);
                                        //获取当前页数
                                    }
                                });

                            }
                            let data = result.data.data;
                            $("#personList").empty();
                            for (let i = 0; i < data.length; i++) {
                                getTags(data[i].personId);
                                let images = data[i].personImage;
                                if (images == "" || images == null || images == 'null') {
                                    images = "../images/people.png";
                                } else {
                                    images = "/uploads/" + data[i].personImage;
                                }
                                $("#personList").append(' <div class="pubBlock">\n' +
                                    '                <div class="peoImg">\n' +
                                    '                    <img src=' + images + ' alt=\'' + judgeNull(data[i].personName) + '\'>\n' +
                                    '                </div>\n' +
                                    '                <div class="peoInfo">\n' +
                                    '                    <div style="cursor: pointer;" onclick="toDetail(\'' + "person" + '\',\'' + data[i].personId + '\')">\n' +
                                    '                        <span class="name" style="cursor: pointer;" onclick="toDetail(\'' + "person" + '\',\'' + data[i].personId + '\')">' + judgeNull(data[i].personName) + '</span>\n' +
                                    '                        <div class="label">\n' +
                                    '' + personTags + '' +
                                    '                        </div>\n' +
                                    '                    </div>\n' +
                                    '                    <p>\n' +
                                    '                        <span>性别：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].gender) + '</strong>\n' +
                                    '                        <span class="ml-60">电话：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].phoneNo) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                    <p>\n' +
                                    '                        <span>证件号：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].personIdentityNo) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                    <p>\n' +
                                    '                        <span>户籍地：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].nativePlace) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                    <p>\n' +
                                    '                        <span>居住地址：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].liveAddr) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                </div>\n' +
                                    '            </div>');
                            }
                        }
                    });
                } else {
                    var personId = GetQueryString("paId");
                    $.ajax({
                        type: "post",
                        url: "/persons/dataTogether",
                        dataType: "json",
                        data: {
                            "personId": personId,
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
                                $("#num").text(result.data.total);
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
                                        findPerson(page, 5, false);
                                        //获取当前页数
                                    }
                                });

                            }
                            let data = result.data.data;
                            $("#personList").empty();
                            for (let i = 0; i < data.length; i++) {
                                getTags(data[i].personId);
                                let images = data[i].personImage;
                                if (images == "" || images == null || images == 'null') {
                                    images = "../images/people.png";
                                } else {
                                    images = "/uploads/" + data[i].personImage;
                                }
                                $("#personList").append(' <div class="pubBlock">\n' +
                                    '                <div class="peoImg">\n' +
                                    '                    <img src=' + images + ' alt=\'' + judgeNull(data[i].personName) + '\'>\n' +
                                    '                </div>\n' +
                                    '                <div class="peoInfo">\n' +
                                    '                    <div style="cursor: pointer;" onclick="toDetail(\'' + "person" + '\',\'' + data[i].personId + '\')">\n' +
                                    '                        <span class="name" >' + judgeNull(data[i].personName) + '</span>\n' +
                                    '                        <div class="label">\n' +
                                    '' + personTags + '' +
                                    '                        </div>\n' +
                                    '                    </div>\n' +
                                    '                    <p>\n' +
                                    '                        <span>性别：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].gender) + '</strong>\n' +
                                    '                        <span class="ml-60">电话：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].phoneNo) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                    <p>\n' +
                                    '                        <span>证件号：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].personIdentityNo) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                    <p>\n' +
                                    '                        <span>户籍地：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].nativePlace) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                    <p>\n' +
                                    '                        <span>居住地址：</span>\n' +
                                    '                        <strong>' + judgeNull(data[i].liveAddr) + '</strong>\n' +
                                    '                    </p>\n' +
                                    '                </div>\n' +
                                    '            </div>');
                            }
                        }
                    });
                }
                $("#personList").mLoading("hide");
                window.clearTimeout(time1);
            }, new Date() - beginDate + 300);
        }

        //人员标签
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
                    personTags = str;
                }
            });
        }


    </script>
</head>
<body>
<div class="index-main mt-15">
    <div class="bear-block peopleInfo">
        <div class="bear-tit">
            <h5>共有<span id="num">0</span>条结果</h5>
        </div>

        <div class="peoBox" id="personList">
            <%--            <div class="pubBlock">--%>
            <%--                <div class="peoImg">--%>
            <%--                    <img src="../images/people.png" alt="">--%>
            <%--                </div>--%>
            <%--                <div class="peoInfo">--%>
            <%--                    <div>--%>
            <%--                        <span class="name">孙海</span>--%>
            <%--                        <div class="label">--%>
            <%--                            <span class="green">劳资纠纷</span>--%>
            <%--                            <span class="blue">有市监类行政处罚史</span>--%>
            <%--                            <span class="yellow">暴力前科</span>--%>
            <%--                            <span class="green">劳资纠纷</span>--%>
            <%--                            <span class="blue">有市监类行政处罚史</span>--%>
            <%--                            <span class="yellow">暴力前科</span>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                    <p>--%>
            <%--                        <span>姓名：</span>--%>
            <%--                        <strong>男</strong>--%>
            <%--                        <span class="ml-60">电话：</span>--%>
            <%--                        <strong>13523523232</strong>--%>
            <%--                    </p>--%>
            <%--                    <p>--%>
            <%--                        <span>证件号：</span>--%>
            <%--                        <strong>321009********1111</strong>--%>
            <%--                    </p>--%>
            <%--                    <p>--%>
            <%--                        <span>户籍地：</span>--%>
            <%--                        <strong>上海市徐汇区</strong>--%>
            <%--                    </p>--%>
            <%--                    <p>--%>
            <%--                        <span>居住地址：</span>--%>
            <%--                        <strong>上海市徐汇区田林14村41号柳州路宜山路</strong>--%>
            <%--                    </p>--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>
        <div id="pagination" class="pagination" style="left:30%"></div>
    </div>
</div>
</body>
</html>
