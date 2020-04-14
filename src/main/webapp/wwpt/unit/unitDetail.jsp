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
            background: url(../images/icon-house.png) no-repeat;
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
        <div class="infoBox-l">
            <div class="infoBox-l-item infoBox-l-item1">
                <div>
                    <div class="name-l">
                        <!-- 这里一行调用line1  两行调用line2 -->
                        <p class="con line1" id="unitName"></p>
                        <div class="label" id="unitTags">
                        </div>
                    </div>
                    <div class="pg-status v-fr">
                        <div>
                            <p class="status-text">状态</p>
                            <p class="status" id="status"></p>
                        </div>
                        <!-- 已评估图 -->
                        <i></i>
                    </div>
                </div>
                <p class="complaintText" id="unitDetail">
                </p>
                <table border="0" class="tableSty">
                    <tr>
                        <td width="90" class="tdColor">单位法人：</td>
                        <td width="350" class="green" id="unitLegalPerson"></td>

                        <td width="90" class="tdColor">社会信用码：</td>
                        <td class="green" id="usccCode"></td>
                    </tr>
                    <tr>
                        <td width="90" class="tdColor">单位行业：</td>
                        <td width="350" class="green" id="industry"></td>

                        <td width="90" class="tdColor">注册时间：</td>
                        <td class="green" id="registerTime"></td>
                    </tr>
                    <tr>
                        <td width="90" class="tdColor">单位地址：</td>
                        <td width="350" id="addr" class="adress">1</td>
                    </tr>

                </table>
                <div class="catalogue" id="catalogue">
                    <span class="v-fl">目录</span>
                    <div class="v-fl" id="ml">
                    </div>
                </div>
            </div>
            <div class="contentWrap">
                <div class="bear-tit bear-tit2 point" id="a1">
                    <%--                    <h5>关联情况</h5>--%>
                </div>
                <div id="glxx">
                    <div class="infoBox-l-item infoBox-l-item3" id="companyRelation"></div>
                </div>
                <%--                <div class="infoBox-l-item infoBox-l-item3" id="linkUnit">--%>
                <%--                    <div class="sub-tit mt-24 point" id="a3">--%>
                <%--                        <h4>关联单位（<span id="linkUnitCount">0</span>）</h4>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
        <div class="infoBox-r">
            <div class="pubBlock echart1">
                <div class="checkBox">
                    <div class="dressBox">
                    </div>
                    <a onclick="quanping()" class="screenAll v-fr">全屏</a>
                </div>
                <div class="echartsBox1" id="relationIframe">
                </div>
            </div>
            <div class="infoBox-r-item2" id="dataTogetherBox">
                <div class="bear-tit bear-tit2 m-25">
                    <h5>数据聚合（<span id="dataTogetherCount">0</span>）</h5>
                    <a onclick="toEventDataTogether(enentId)">更多>></a>
                </div>
                <div class="r-item2-con">
                    <div class="dataList dataList2" id="dataTogether">


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script result="text/javascript">
    var enentId = getParameter("unitId")
    var unittag;
    var relationCount = 0;
    var handleCount = 0;
    var catalogues = [];

    $(function () {
        initUnit();
        dataTogether();
        // initRelationPerson();
        initRelationEvent();
        objectTagList("");
        // initHandleLog();
        eventRelation();
        // 输入框控件调用
        vVsub();

        if (relationCount == 0) {
            $("#a1").hide();
        } else {
            catalogues.push("<a href=\"javascript:;\">" + (catalogues.length + 1) + "、关联情况</a>");
        }
        if (handleCount == 0) {
            $("#a2").hide();
        } else {
            catalogues.push("<a href=\"javascript:;\">" + (catalogues.length + 1) + "、处置情况</a>");
        }

        //初始化目录
        $("#ml").empty();
        $("#ml").append(catalogues);
        if ((relationCount == 0) && (handleCount == 0)) {
            $("#catalogue").hide();
        }

        //当点击跳转链接后，回到页面顶部位置
        $(".topBtn").click(function () {
            if ($('html').scrollTop()) {
                $('html').animate({scrollTop: 0}, 500);
                return false;
            }
            $('body').animate({scrollTop: 0}, 500);
            return false;
        });

        // 点击列表按钮，列表隐藏
        var listShow = true;
        $(".listBtn").click(function () {
            if (listShow) {
                $(".anchorTop").addClass("visi");
            } else {
                $(".anchorTop").removeClass("visi");
            }
            listShow = !listShow;
        });

        // 政法类切换
        $(".statusList li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        })

        // 关联人员
        //li元素的宽（包括padding，margin，border）
        var liW = $('.peopleBox ul li').outerWidth(true);
        var len = $('.peopleBox ul li').length;
        $('.peopleBox ul').css("width", liW * len);
        var flag = true
        if ($(".btnList li").length > 5) {
            $(".moveBtn").fadeIn();
        } else {
            $(".moveBtn").fadeOut();
        }
        $(".arrowBox .prev").click(function () {
            if (flag) {
                flag = false
                $('.peopleBox ul').find("li").eq(len - 1).prependTo($('.peopleBox ul'))
                $('.peopleBox ul').css({"marginLeft": -liW}).delay(8).queue(function () {
                    $('.peopleBox ul').animate({"marginLeft": 0})
                    flag = true
                    $(this).dequeue();
                })
            }
        })

        $(".arrowBox .next").click(function () {
            if (flag) {
                flag = false
                $('.peopleBox ul').animate({"marginLeft": -liW}).delay(8).queue(function () {
                    $('.peopleBox ul').find("li").eq(0).appendTo($('.peopleBox ul'))
                    $('.peopleBox ul').css({"marginLeft": 0})
                    flag = true
                    $(this).dequeue();
                })
            }
        })



    })

    $(window).resize(function () {
        footerChangeDetail();
    })
    function quanping() {
        openNewWindow("../event/relationList.jsp?objectId=" + enentId + "&&objectType=unit&&flag=show", "top");
    }
    function eventRelation() {
        $("#relationIframe").html("<iframe id=\"graphFrame\" src=\"../event/relationList.jsp?objectId=" + enentId + "&&objectType=unit&&flag=false\"  style=\"width: 100%;height: 210px;border: 0;overflow: hidden;\"></iframe>")
    }

    function findIndex(id) {
        openNewWindow('../person/personDetail.jsp?personId=' + id + '', 'top');
    }

    //事件已有标签
    function objectTagList(id) {
        var eventid;
        if (id == "") {
            eventid = enentId;
        } else {
            eventid = id;
        }
        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType: "json",
            data: {
                objectId: eventid
            },
            success: function (result) {
                if (result.message == "success") {
                    var tags = result.data;
                    $("#eventTags").empty();
                    for (var i = 0; i < tags.length; i++) {
                        var color = JSON.parse(tags[i].tagCssCode).color;
                        var colorcode = color[1].substring(1, (color[1].length - 2));
                        $("#unitTags").append('<span  style="cursor: pointer;background-color:' + color + '">' + tags[i].tagName + '</span>');
                    }
                }
            }
        });
    }

    function initUnit() {
        $.ajax({
            type: "GET",
            url: "/units/" + enentId,
            dataType: "json",
            success: function (result) {
                let unit = result.data;
                if (unit != null) {
                    document.title = judgeNull(unit.unitName);
                    var unitStatus = unit.status;
                    if (unit.status == "1") {
                        unitStatus = "在经营";
                    } else {
                        unitStatus = "未经营";
                    }
                    $("#unitName").text(judgeNull(unit.unitName));
                    $("#status").text(unitStatus);
                    $("#unitDetail").text(judgeNull(unit.unitDetail));
                    $("#unitLegalPerson").text(judgeNull(unit.unitLegalPerson));
                    $("#usccCode").text(judgeNull(unit.usccCode));
                    $("#industry").text(judgeNull(unit.industry));
                    if (unit.registerTime != null) {
                        $("#registerTime").text(judgeNull(new Date(unit.registerTime).format("yyyy-MM-dd hh:mm:ss")));
                    } else {
                        $("#occurredTime").text('暂无');
                    }

                    $("#addr").text(judgeNull(unit.addr));
                }

            }
        })
    }

    function judgeNull(data) {
        if (data == "" || data == null || data == undefined || data == "null")
            data = "无"
        return data;
    }

    function dataTogether() {
        $.ajax({
            type: "post",
            url: "/units/dataTogether",
            dataType: "json",
            data: {
                unitId: enentId,
                page: 1,
                pageSize: 5
            },
            success: function (result) {
                var list = result.data.data;
                var count = result.data.total;
                $("#dataTogetherCount").text(count);
                $("#dataTogether").empty();
                var length;
                if (list.length >= 3) {
                    length = 3;
                } else {
                    length = list.length;
                }
                if (count == 0) {
                    $("#dataTogetherBox").hide();
                }
                for (var i = 0; i < length; i++) {
                    getTags(list[i].unitId);
                    if (!unittag) {
                        unittag = ''
                    }
                    var unitStatus = list[i].status;
                    if (list[i].status == "1") {
                        unitStatus = "在经营";
                    } else {
                        unitStatus = "未经营";
                    }

                    var time;
                    if (list[i].registerTime != null) {
                        time = judgeNull(new Date(list[i].registerTime).format("yyyy-MM-dd hh:mm:ss"));
                    } else {
                        time = '暂无';
                    }

                    $("#dataTogether").append('<dl>\n' +
                        '                                <dd class="pubBlock">\n' +
                        '                                    <p class="con" style="height: 23px; font-size: 17px;white-space: nowrap; text-overflow:ellipsis; overflow: hidden;font-weight: bold">' + judgeNull(list[i].unitName) + '</p>\n' +
                        '                                    <p class="Zcon" style="margin-left: 0px; white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">' + judgeNull(list[i].unitName) + '</p>\n' +
                        '                                    <div class="sourceInfo">\n' +
                        '                                        <strong style="margin-left: 0px;">\n' +
                        '                                            <b>经营状态</b>\n' +
                        '                                            <span>' + unitStatus + '</span>\n' +
                        '                                        </strong>\n' +
                        '                                        <em>注册时间：' + time + '</em>\n' +
                        '                                    </div>\n' +
                        '                                    <div class="label">\n' + unittag +
                        '                                    </div>\n' +
                        '                                </dd>\n' +
                        '                            </dl>');

                }
                footerChangeDetail();
            }
        })
    }


    //事件关联人员列表
    function initRelationPerson() {
        $.ajax({
            type: "POST",
            url: "/eventInfo/findEventRelationObject",
            dataType: "json",
            async: false,
            data: {
                eventId: enentId,
                objectType: "person",
            },
            success: function (result) {

                if (result.message == "success") {
                    var persons = result.data;
                    $("#linkPeople").empty();
                    $("#linkPeopleCount").text(persons.length)
                    if (persons.length == 0) {
                        $("#linkPeopleBox").hide();
                        $("#linkPerson").hide();
                    }
                    relationCount += persons.length;
                    if (relationCount <= 6) {
                        $("#arrowBox").hide();
                    }
                    for (var i = 0; i < persons.length; i++) {
                        var personName = persons[i].personName;
                        if (personName == null || personName.trim().length == 0) {
                            personName = "无";
                        }
                        $("#linkPeople").append(' <li>\n' +
                            '                            <div class="imgBox">\n' +
                            '                                <img src="../images/icon-person.jpg" alt="">\n' +
                            '                                <p>' + personName + '</p>\n' +
                            '                            </div>\n' +
                            '                            <div class="maskBox">\n' +
                            // '                                <a onclick="addInInfluent(\'' + persons[i].personId + '\')" class="add">加入维稳库</a>\n' +
                            '                                <a onclick="findIndex(\'' + persons[i].personId + '\')" class="add">查看详情</a>\n' +
                            '                            </div>\n' +
                            '                        </li>')
                    }

                    // 关联人员
                    //li元素的宽（包括padding，margin，border）
                    var liW = $('.peopleBox ul li').outerWidth(true);
                    var len = $('.peopleBox ul li').length;
                    $('.peopleBox ul').css("width", liW * len);
                    var flag = true
                    if ($(".btnList li").length > 5) {
                        $(".moveBtn").fadeIn();
                    } else {
                        $(".moveBtn").fadeOut();
                    }
                    $(".arrowBox .prev").click(function () {
                        if (flag) {
                            flag = false
                            $('.peopleBox ul').find("li").eq(len - 1).prependTo($('.peopleBox ul'))
                            $('.peopleBox ul').css({"marginLeft": -liW}).delay(8).queue(function () {
                                $('.peopleBox ul').animate({"marginLeft": 0})
                                flag = true
                                $(this).dequeue();
                            })
                        }
                    })

                    $(".arrowBox .next").click(function () {
                        if (flag) {
                            flag = false
                            $('.peopleBox ul').animate({"marginLeft": -liW}).delay(8).queue(function () {
                                $('.peopleBox ul').find("li").eq(0).appendTo($('.peopleBox ul'))
                                $('.peopleBox ul').css({"marginLeft": 0})
                                flag = true
                                $(this).dequeue();
                            })
                        }
                    })
                }
            }
        });
    }

    function initRelationEvent() {
        $.ajax({
            url: '/eventInfo/findObjectLinkEvent',
            type: 'POST',
            dataType: "json",
            data: {
                "objectId": enentId,
                objectType: 'unit'
            },
            success: function (data) {
                var events = data.data;
                if (events.length != 0) {
                    // ifhaverelation = true;
                    // haverelation();

                    $("#companyRelation").empty();
                    $("#companyRelation").append(' <div class="sub-tit mt-24 point" id="a3">\n' +
                        '                                <h4>关联事件（<span id="linkUnitCount">0</span>）</h4>\n' +
                        '                                </div>');
                    if (events.length == 0) {
                        $("#companyRelation").hide();
                    }
                    $("#linkUnitCount").text(events.length);
                    // relationCount += events.length;
                    for (var i = 0; i < events.length; i++) {

                        getTags(events[i].eventId);
                        if (!unittag) {
                            unittag = ''
                        }
                        if (events[i].isHandle == 1) {
                            events[i].isHandle = '已处置';
                        } else {
                            events[i].isHandle = '未处置';
                        }

                        if (events[i].isSettlement == 1) {
                            events[i].isSettlement = '已化解';
                        } else {
                            events[i].isSettlement = '未化解';
                        }
                        let time = events[i].occurredTime == null ? "无" : new Date(events[i].occurredTime).format("yyyy-MM-dd hh:mm:ss");

                        var str = '  <div class="pubBlock">\n' +
                            '                                <div class="relatedUnits" style="cursor: pointer;" onclick="toDetail(\'' + "event" + '\',\'' + events[i].eventId + '\')">' + judgeNull(events[i].eventName) + '</div>\n';
                        if (unittag != '') {
                            str += '                                <div class="label" style="margin-top: -3px">\n' + unittag +
                                '                                </div>\n';
                        } else {
                            str += '<div class="label" style="margin-top: -25px"></div>'
                        }

                        str +=
                            '                            <div class="text">\n' +
                            '                                <strong>是否处置：</strong>\n' +
                            '                            <span>' + judgeNull(events[i].isHandle) + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>是否化解：</strong>\n' +
                            '                            <span>' + judgeNull(events[i].isSettlement) + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>发生时间：</strong>\n' +
                            '                            <span>' + time + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text text2 clearfix">\n' +
                            '                                <strong>发生地址：</strong>\n' +
                            '                            <span class="place"">' + judgeNull(events[i].occurredPlace) + '</span>\n' +
                            '                            </div>\n' +
                            '                            </div>';
                        $("#companyRelation").append(str);
                    }
                    $("#glxx").css("margin-bottom", "30px");
                }
                footerChangeDetail();
            }
        })
    }

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
                if (result.message == "success") {
                    var tags = result.data;
                    for (var i = 0; i < tags.length; i++) {
                        var color = JSON.parse(tags[i].tagCssCode).color;
                        str += '<span style="background: ' + color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag = str;
            }
        });
    }

    function toEventDataTogether(eventId) {
        openNewWindow("dataTogether.jsp?Type=" + eventId + "", 'top');
    }

    $(function () {
        $(".selectpicker").selectpicker({
            noneSelectedText: '请选择'    //默认显示内容
        });
        $(window).on('load', function () {
            $('.selectpicker').selectpicker('refresh');
        });

    });
</script>
</html>