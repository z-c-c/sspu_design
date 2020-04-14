<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="apptag" uri="app_tags" %>--%>

<!DOCTYPE html>

<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>人员详情</title>
    <%@include file="../common/w_include_header.jsp" %>

    <link rel="stylesheet" href="../css/icon.css"><!--easyui-->
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript" src="../js/my_scrollbar.js"></script>
    <style result="text/css">
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

        /*        .tableStyy td {
                    margin: 0;
                    padding: 0;
                    width: 95px;
                }*/
        .infoBox-l-item1 .pg-status {
            width: 30%;
            height: auto;
            display: inline-block;
            margin-top: -80px;
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

        /*   !*定义滚动条样式（高宽及背景）*!
           ::-webkit-scrollbar {
               width: 6px;   !* 滚动条宽度， width：对应竖滚动条的宽度  height：对应横滚动条的高度*!
               !*background: #007acc;*!
           }

           !*定义滑块 样式*!
           ::-webkit-scrollbar-thumb {
               !*        border-radius: 3px;
                       height: 100px;    !* 滚动条滑块长度 *!*!
               background-color: #ccc;
               position: absolute;
               right: 3px;
               width: 4px;
               !* background-color: #ccc;*!
               border-radius: 4px;
               -webkit-border-radius: 4px;
               -moz-border-radius: 4px;
               opacity: 0;
               filter: alpha(opacity = 0);
               -webkit-transition: opacity.2s linear;
               -moz-transition: opacity .2s linear;
               transition: opacity .2s linear;
           }
   */

        .label {
            display: block;
            padding: .2em .6em .3em;
            font-size: 75%;
            font-weight: 700;
            line-height: 1;
            color: #fff;
            text-align: left;
            /* //white-space: nowrap;*/
            vertical-align: baseline;
            border-radius: .25em;

            margin-left: -7px;
            /*//white-space: normal;*/
            height: 36px;
            overflow: hidden;


        }

        .dataList dl dd .con {
            width: 100%;
            height: 22px;
            font-size: 17px;
            line-height: 24px;
            color: rgba(0, 0, 0, 0.65);
            margin: 8px 0;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
        }

        .con1 {
            /* width: 100%; */
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            width: 100%;
            /* height: 52px; */
            font-size: 14px;
            line-height: 24px;
            color: rgba(0, 0, 0, 0.65);
            margin: 8px 0;
        }

    </style>

</head>
<body>
<div class="index-main">
    <div class="whiteBox" id="whitebox">
        <div class="infoBox-l" id="infobox-l">
            <div class="infoBox-l-item infoBox-l-item1">
                <div id="baseInfo"></div>

            </div>
            <div class="contentWrap">
                <div class="bear-tit bear-tit2 point" id="a1">

                </div>
                <div id="glxx">
                    <div class="infoBox-l-item infoBox-l-item3" id="companyRelation"></div>
                </div>
            </div>

        </div>

        <div class="infoBox-r">
            <div class="pubBlock echart1">
                <div class="checkBox">
                    <a onclick="quanping()" class="screenAll v-fr">全屏</a>
                </div>
                <div class="echartsBox1" id="useiframe"></div>
            </div>
            <div class="infoBox-r-item2" id="personEvent">

            </div>
        </div>
    </div>
</div>

</div>

</body>
<script result="text/javascript">

    var unittag = '';
    $(window).resize(function () {
        footerChangeDetail();
    })
    $(function () {
        //人员基本信息
        personBaseInfo();
        //关联事件
        companyRelation();
        //数据聚合
        personEvent();
        //echarts
        usei();
    });

    var nowObjectName = "";
    var ifhaverelation = false;
    var ifhaverizhi = false;


    function usei() {
        var adid = GetQueryString("personId");
        $("#useiframe").html("<iframe id=\"graphFrame\" src=\"../event/relationList.jsp?objectId=" + adid + "&&objectType=person\"  style=\"width: 100%;height: 210px;border: 0;overflow: hidden;\"></iframe>")
    }

    var cishu = 0;

    function haverelation() {
        if (ifhaverelation) {
            if (cishu == 0) {
                var str1 = "";
                str1 += "<h5 style=\"margin-top: 20px;\">关联信息</h5>";
                $("#a1").html(str1);
                $("#relationinfo").removeAttr("style");
                cishu++;
            }
        }
    }

    var cishu1 = 0;


    function quanping() {
        var id = GetQueryString("personId");
        var url = '../event/relationList.jsp?objectId=' + id + '&&objectType=person&&flag=show';
        openNewWindow(url, 'top');
    }

    function findIndex(id) {
        var url = 'personDetail.jsp?paId=' + id + '';
        openNewWindow(url);
    }

    function secreting(str) {
        var num = str.length;
        var i = Math.ceil(num / 2);
        var str1 = str.substr(0, i);
        var j = num - i;
        for (var m = 0; m < j; m++) {
            str1 += "*";
        }
        return str1;
    }


    function personBaseInfo() {
        var personId = GetQueryString("personId");
        $.ajax({
            url: '/persons/' + personId,
            type: 'get',
            dataType: "json",
            data: {
                "personId": personId
            },
            success: function (data) {
                let person = data.data;

                document.title = judgeNull(person.personName)
                var str1 = "";
                jsonArr = data;

                str1 += "<div><div class=\"name-l\">";
                if (person.personName != null && person.personName != "" && person.personName != "null") {

                    str1 += "<p class=\"con line1\" style=\"font-size: 32px;margin-top: 3px;\">" + person.personName + "</p></div></div>";

                    nowObjectName = person.personName;
                } else {
                    str1 += "<p class=\"con line1\">无</p></div></div>";
                    nowObjectName = "无";
                }
                var image = person.personImage;
                if (image == null || image == "") {
                    image = "../images/people.png";
                } else {

                    image = "/uploads/" + person.personImage;
                }


                str1 += " <div class=\"label\" id=\"personlabel\" style=\" margin-top: 10px;\"> </div>";
                str1 += "                        <div class=\"pg-status v-fr\">\n" +
                    "                            <div>\n" +
                    "                                <p class=\"status\" id=\"ifaccess\"></p></div>\n" +
                    "                            <img src='" + image + "' style='width: 125px;height: 180px'></img>\n" +
                    "                        </div>"

                str1 += " <table border=\"0\" class=\"tableStyy\">";

                if (person.age != "" && person.age != null && person.age != "null") {
                    str1 += "  <tr><td width=\"90\"  style=\"color:#999999;\">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</td><td width=\"350\" >" + person.age + "</td></tr>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;领</td><td width=\"350\"  >无</td></tr>";
                }
                if (person.personUsedName != "" && person.personUsedName != null && person.personUsedName != "null") {
                    str1 += "  <tr><td width=\"90\"  style=\"color:#999999;\">曾&nbsp;  用 &nbsp;名</td><td width=\"350\" >" + person.personUsedName + "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">曾&nbsp;  用 &nbsp;名</td><td width=\"350\"  >无</td>";
                }
                if (person.gender != "" && person.gender != null) {
                    str1 += "<td  width=\"90\" style=\"color:#999999;\">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td><td width=\"350\" >" + person.gender + "</td></tr> ";
                } else {
                    str1 += "<td width=\"90\"  style=\"color:#999999;\">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td><td width=\"350\" >无</td></tr> ";
                }
                if (person.personDocuNum != "" && person.personDocuNum != null && person.personDocuNum != "null") {
                    var re = secreting(person.personDocuNum);
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">证 &nbsp;件&nbsp;号</td><td width=\"350\">" + person.personDocuNum + "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">证 &nbsp;件&nbsp;号</td></td><td width=\"350\">无</td>";
                }
                if (person.phoneNo != "" && person.phoneNo != "null" && person.phoneNo != null) {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</td><td width=\"350\" >" + person.phoneNo + "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</td><td width=\"350\" >无</td></tr>";

                }
                if (person.nationality != "" && person.nationality != null && person.nationality != "null") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍</td><td width=\"350\">" + person.nationality + "</td> ";
                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍</td><td width=\"350\">无</td> ";
                }
                if (person.nativePlace != "" && person.nativePlace != null && person.nativePlace != "null") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯</td><td width=\"350\">" + person.nativePlace + "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯</td><td width=\"350\" >无</td></tr>";

                }

                // if(person.liveStreet==null||person.liveStreet==""||person.liveStreet=="null") {
                //     str1 += "<tr><td width=\"90\" style=\"color:#999999;\">街&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;道</td><td width=\"350\">无</td>";
                // }
                // else{
                //     str1 += "<tr><td width=\"90\" style=\"color:#999999;\">街&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;道</td><td width=\"350\" >" + data[i].liveStreet + "</td>";
                //
                // }
                //
                // if(person.neighborhood==null||person.neighborhood==""||person.neighborhood=="null") {
                //     str1 += " <td width=\"90\" style=\"color:#999999;\">居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委</td><td width=\"350\" >无</td></tr>";
                // }
                // else{
                //     str1 += " <td width=\"90\"  style=\"color:#999999;\">居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委</td><td width=\"350\">" + data[i].neighborhood + "</td></tr>";
                //
                // }
                str1 += "</table>";
                str1 += "<table  border=\"0\" class=\"tableStyy\">";
                if (person.liveAddr == null || person.liveAddr == "" || person.liveAddr == "null") {
                    str1 += "<tr><td width=\"80px\"  style=\"color:#999999;\">住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</td><td width=\"700\" class=\"adress\" >无</td></tr>";
                } else {
                    str1 += "<tr><td width=\"80px\" style=\"color:#999999;\">住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</td><td width=\"700\" class=\"adress\" >" + person.liveAddr + "</td></tr>";

                }
                /* str1 += "<td width=\"90\"  style=\"color:#999999;\"></td><td width=\"350\"  ></td></tr>";
*/
                str1 += "</table>";


                $("#baseInfo").html(str1);
                // ifaccess();
                // personEvent();
                footerChangeDetail();
            }
        })
        $.ajax({
            url: '/tagObjectRelation/findTagByObjectId',
            type: 'POST',
            dataType: "json",
            data: {
                "objectId": personId
            },
            success: function (data) {
                var tags = data.data;
                var str1 = "";
                for (var i = 0; i < tags.length; i++) {
                    var color = JSON.parse(tags[i].tagCssCode).color;
                    str1 += " <span  style=\"background-color:" + color + "\">" + tags[i].tagName + "</span>";
                }
                $("#personlabel").html(str1);
            }
        });
    }

    function getTags(objectId) {
        $.ajax({
            url: '/tagObjectRelation/findTagByObjectId',
            type: 'POST',
            dataType: "json",
            async: false,
            data: {
                "objectId": objectId
            },
            success: function (result) {
                var str = '';
                if (result.message == "success") {
                    // console.log(result)
                    var tags = result.data;
                    for (var i = 0; i < tags.length; i++) {
                        var color = JSON.parse(tags[i].tagCssCode).color;
                        str += " <span  style=\"background-color:" + color + "\">" + tags[i].tagName + "</span>";
                    }
                    unittag = str;
                }
            }
        });
    }


    function findMoreById() {
        var id = GetQueryString("personId");
        var url = 'personDataTogether.jsp?paId=' + id + '';
        openNewWindow(url, 'top');
    }

    function personEvent() {
        var keyObjectListId = GetQueryString("personId");
        $.ajax({
            url: '/persons/dataTogether',
            type: 'POST',
            dataType: "json",
            data: {
                personId: keyObjectListId,
                page: 1,
                pageSize: 5
            },
            success: function (result) {
                if (result.data.total == 0) {
                    $("#result.data.total").hide();
                } else {
                    var str1 = "";
                    let persons = result.data.data;
                    str1 += "<div class=\"bear-tit bear-tit2 m-25\">   <h5>数据聚合（" + result.data.total + "）</h5><a  onclick=\"findMoreById()\">更多>></a>  </div>";
                    for (let i = 0; i < persons.length; i++) {
                        getTags(persons[i].personId);
                        if (persons[i].personName != null && persons[i].personName != "null" && persons[i].personName != "") {
                            str1 += " <div class=\"r-item2-con\"> <div class=\"dataList dataList2\">  <dl><dd class=\"pubBlock\"> <p class=\"con\">" + persons[i].personName + "</p>";
                        } else {
                            str1 += " <div class=\"r-item2-con\"> <div class=\"dataList dataList2\">  <dl><dd class=\"pubBlock\"> <p class=\"con\">无</p>";

                        }
                        /*if (persons[i].eventContent != null&&persons[i].eventContent != ""&&persons[i].eventContent != "null") {
                            str1 += "<p class=\"con1\" >" +persons[i].eventContent + "</p>";
                        }
                        else{*/
                        str1 += "<p class=\"con1\" ></p>";

                        // }

                        str1 += " <div class=\"sourceInfo\">";


                        if (persons[i].age != null && persons[i].age != "" && persons[i].age != "null") {
                            str1 += "<strong style='margin-left: 0px;'><b>年龄 </b><span>" + persons[i].age + "</span> </strong>";
                        } else {
                            str1 += "<strong style='margin-left: 0px;'><b>年龄 </b><span>无</span> </strong>";

                        }
                        if (persons[i].phoneNo != "0" && persons[i].phoneNo != null && persons[i].phoneNo != "null") {
                            str1 += "<em>" + persons[i].phoneNo + "</em>";

                        } else {
                            str1 += "<em>无</em>";
                        }

                        str1 += "</div>";
                        if (unittag != "") {
                            str1 += "<div class=\"label\">";
                            str1 += unittag;
                            str1 += "</div>";
                        }
                        str1 += "</dd> </dl> </div></div>";
                    }
                    $("#personEvent").html(str1);
                    footerChangeDetail();
                }
            }
        });
    }


    function judgeNull(data) {
        if (data == "" || data == null || data == undefined || data == "null")
            data = "无"
        return data;
    }

    function companyRelation() {
        var keyPersonId = GetQueryString("personId");
        //var unitId="";
        $.ajax({
            url: '/eventInfo/findObjectLinkEvent',
            type: 'POST',
            dataType: "json",
            data: {
                "objectId": keyPersonId,
                objectType: 'person'
            },
            success: function (data) {
                var events = data.data;
                if (events.length != 0) {
                    ifhaverelation = true;
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
                            '                                <div class="relatedUnits">' + judgeNull(events[i].eventName) + '</div>\n';
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

</script>
</html>