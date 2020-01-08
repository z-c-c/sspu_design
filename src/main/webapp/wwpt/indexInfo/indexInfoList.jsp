<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>搜索结果</name>
    <%@include file="../common/w_include_header.jsp" %>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript" src="../js/getParameter.js"></script>
    <style>
        .labelBox {
            max-width: 380px;
            top: 15px;
            right: 0;
            height: 26px;
            overflow: hidden;
            text-align: right;
            display: inline-block;
            line-height: 22px;
            position: absolute;
        }

        .labelBox span {
            margin-top: 1px;
        }

        .bear-tit h5 {
            height: 22px;
            font-size: 15px;
            color: #333;
            line-height: 22px;
            text-indent: 15px;
            border-left: #418ade 5px solid;
            display: inline-block;
        }

        .statusList {
            width: 420px;
            height: 20px;
            position: absolute;
            left: 60%;
            transform: translateY(-50%);
        }

        .statusList li {
            width: 140px;
        }
    </style>
    <script result="text/javascript">
        function createPageInfo(pageInfo) {
            if (pageInfo != null && pageInfo != undefined && pageInfo != "") {
                var totalPages = pageInfo.totalPages == null ? 0 : pageInfo.totalPages;
                var size = pageInfo.pageSize == null ? 0 : pageInfo.pageSize;
                var totalElements = pageInfo.totalElements == null ? 0 : pageInfo.totalElements;
                var number = pageInfo.page == null ? 0 : pageInfo.page;

                $(".bear-tit h5").text("共有" + totalElements + "条结果");
                // 分页
                new Page({
                    id: 'pagination',
                    pageTotal: totalPages, //必填,总页数
                    pageAmount: size,  //每页多少条
                    dataTotal: totalElements, //总共多少条数据
                    curPage: number + 1, //初始页码,不填默认为1
                    pageSize: 5, //分页个数,不填默认为5
                    showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                    showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                    getPage: function (page) {
                        //获取当前页数
                        console.log(page);
                        //转跳
                        var result = $(".statusList li.active").attr("id");
                        getInfoByPage(result, page);
                    }
                });
            }
        }

        function goDetailPage(id, result, objName) {
            var url = "";
            if ('person' == result) {
                url = '../person/personDetail.jsp?paId=' + id;
            } else if ('event' == result) {
                url = "../event/eventDetail.jsp?eventId=" + id + "&eventName=" + objName;
            } else if ('risk' == result) {
                url = "../riskAssess/riskAssessDetail.jsp?eventId=" + id + "&eventName=" + objName;
            }
            if (url != null && url != undefined && url != "") {
                openNewWindow(url/*, "_target"*/);
            }
        }

        function getInfoByPage(result, page) {
            if (pageType == null || pageType == undefined || pageType == "") {
                location_href('/wwpt/shell.jsp');
            }
            if (result == undefined || result == null || result == "") {
                result == "event";
            }
            var url = "/indexController/";
            if (pageType == "waitLog") {
                url += "getWaitLogInfo";
            } else if (pageType == "newInfo") {
                url += "getLatestNewsInfo";
            } else {
                location_href('/wwpt/shell.jsp');
            }
            var pageSize = 5;
            $.ajax({
                url: url,
                dataType: "json",
                data: {
                    //判断是否是数字
                    page: isNaN(page) ? 1 : page,
                    rows: isNaN(pageSize) ? 5 : pageSize,
                    result: result
                },
                result: "post",
                success: function (res) {
                    // debugger;
                    if (res.code == "200") {
                        //分页信息
                        $(".peoBox").empty();
                        var pageInfo = res.data.pageInfo;
                        createPageInfo(pageInfo);
                        //列表内容信息
                        var contentData = res.data.content;
                        var html = "";
                        if (contentData != null && contentData != undefined && contentData != "") {
                            for (var i = 0; i < contentData.length; i++) {
                                var objectInfo = contentData[i].objectInfo;
                                console.log(objectInfo);
                                var objectType = contentData[i].objectType;
                                var tag = contentData[i].tag;
                                if ("person" == objectType) {
                                    if (pageType == "waitLog") {
                                        var personId = objectInfo.PERSON_ID;
                                        var personName = objectInfo.PERSON_NAME == null ? "未知" : objectInfo.PERSON_NAME;
                                        var personImage = objectInfo.PERSON_IMAGE == null || objectInfo.PERSON_IMAGE == "" ? "wwpt/images/people.png" : objectInfo.PERSON_IMAGE;
                                        var gender = objectInfo.GENDER == null ? "未知" : objectInfo.GENDER;
                                        var phoneNum = objectInfo.PHONE_NUM == null ? "未知" : objectInfo.PHONE_NUM;
                                        var personDocuNum = objectInfo.PERSON_DOCU_NUM == null ? "未知" : objectInfo.PERSON_DOCU_NUM;
                                        var nativePlace = objectInfo.NATIVE_PLACE == null ? "未知" : objectInfo.NATIVE_PLACE;
                                        var livePlace = objectInfo.LIVE_PLACE == null ? "未知" : objectInfo.LIVE_PLACE;
                                        html += createPersonInfoHtml(personId, personName, personImage, gender, phoneNum, personDocuNum, nativePlace, livePlace, tag, objectType);
                                    } else {
                                        var eventId = objectInfo.EVENT_ID;
                                        var eventName = objectInfo.EVENT_NAME == null ? "无" : objectInfo.EVENT_NAME;
                                        var eventContent = objectInfo.EVENT_CONTENT == null ? "无" : objectInfo.EVENT_CONTENT;
                                        var occurredTime = objectInfo.OCCURED_TIME == null ? "无" : new Date(objectInfo.OCCURED_TIME.time).Format("yyyy.MM.dd");
                                        html += createEventHtml(eventId, eventName, eventContent, occurredTime, tag, objectType);
                                    }
                                } else {
                                    var eventId = objectInfo.EVENT_ID;
                                    var eventName = objectInfo.EVENT_NAME == null ? "无" : objectInfo.EVENT_NAME;
                                    var eventContent = objectInfo.EVENT_CONTENT == null ? "无" : objectInfo.EVENT_CONTENT;
                                    var occurredTime = objectInfo.OCCURED_TIME == null ? "无" : new Date(objectInfo.OCCURED_TIME.time).Format("yyyy.MM.dd");
                                    html += createEventHtml(eventId, eventName, eventContent, occurredTime, tag, objectType);
                                }
                            }
                        }
                        $(".peoBox").html(html);
                    } else {
                        $.messager.alert('Warning', res.message);
                    }
                }
            });
        }


        function createPersonInfoHtml(personId, personName, personImage, gender, phoneNum, personDocuNum, nativePlace, livePlace, tag, objectType) {
            var html = "";
            //onclick=\"goDetailPage('" + personId + "','" + result + "','"+personName+"')\"
            html += "<div class=\"pubBlock\" onclick=\"goDetailPage('" + personId + "','" + objectType + "','" + personName + "')\">\n" +
                "                <div class=\"peoImg\">\n" +
                "                    <img src=\"" + personImage + "\" alt=\"\">\n" +
                "                </div>\n" +
                "                <div class=\"peoInfo\">\n" +
                "                    <div>\n" +
                "                        <span class=\"name\">" + personName + "</span>\n" +
                "                        <div class=\"label\">\n";
            if (tag != null && tag.length > 0) {
                for (var j = 0; j < tag.length; j++) {
                    var tagColor = tag[j].tagColorCode;
                    var tagName = tag[j].tagName;
                    html += "<span style=\"background: " + tagColor + "\" class=\"green\">" + tagName + "</span>\n";
                }
            }
            html +=
                "                        </div>\n" +
                "                    </div>\n" +
                "                    <p>\n" +
                "                        <span>姓名：</span>\n" +
                "                        <strong>" + gender + "</strong>\n" +
                "                        <span class=\"ml-60\">电话：</span>\n" +
                "                        <strong>" + phoneNum + "</strong>\n" +
                "                    </p>\n" +
                "                    <p>\n" +
                "                        <span>证件号：</span>\n" +
                "                        <strong>" + personDocuNum + "</strong>\n" +
                "                    </p>\n" +
                "                    <p>\n" +
                "                        <span>户籍地：</span>\n" +
                "                        <strong>" + nativePlace + "</strong>\n" +
                "                    </p>\n" +
                "                    <p>\n" +
                "                        <span>居住地址：</span>\n" +
                "                        <strong>" + livePlace + "</strong>\n" +
                "                    </p>\n" +
                "                </div>\n" +
                "            </div>";
            return html;
        }

        function createEventHtml(eventId, eventName, eventContent, occurredTime, tag, objectType) {
            var html = "";
            objectType = objectType == undefined || objectType == null || objectType == "" ? "event" : objectType;
            //onclick=\"goDetailPage('" + eventId + "','event','"+eventName+"')\"
            html += "<div class=\"pubBlock peoSty\" onclick=\"goDetailPage('" + eventId + "','" + objectType + "','" + eventName + "')\">" +
                "                <p class=\"proName\">" + eventName + "</p>\n" +
                "                <p class=\"proInfo\">\n" + eventContent +
                "                </p>\n" +
                "                <div class=\"infoBox\">\n" +
                "                    <div class=\"item\">\n" +
                "                        <i></i>\n" +
                "                        <span>" + occurredTime + "</span>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "                <div class=\"labelBox\">\n";
            if (tag != null && tag.length > 0) {
                for (var j = 0; j < tag.length; j++) {
                    var tagColor = tag[j].tagColorCode;
                    var tagName = tag[j].tagName;
                    html += "<span style=\"background: " + tagColor + "\" class=\"green\">" + tagName + "</span>\n";
                }
            }
            html +=
                "                </div>\n" +
                "            </div>";
            return html;
        }

        //页面数据类型/
        var pageType = "";

        $(function () {
            //走正常搜索路线
            debugger;
            var name = getParameter("name");
            name = decodeURI(name);
            pageType = getParameter("result");
            $("name").html(name);
            if (pageType == null || pageType == undefined || pageType == "") {
                location_href('/wwpt/shell.jsp');
            }
            if (pageType == "waitLog") {
                $("#person").html("涉稳重点人员");
            }
            getInfoByPage(null, 1);

            // searchOneKey(1);

            // 切换
            $(".statusList li").click(function () {
                $(this).addClass("active").siblings().removeClass("active");
            });
        });

    </script>
</head>
<body>
<div class="index-main mt-15">
    <div class="bear-block peopleInfo">
        <div class="bear-tit">
            <h5>共有0条结果</h5>
            <ul class="statusList v-fl" id="handleResolve">
                <li class="active" onclick="getInfoByPage('event',1)" id="event">重大矛盾事件</li>
                <li onclick="getInfoByPage('risk',1)" id="risk">风险评估事件</li>
                <li onclick="getInfoByPage('person',1)" id="person">涉稳重点人员事件</li>
            </ul>
        </div>

        <div class="peoBox">
        </div>
        <div id="pagination" class="pagination"></div>
    </div>
</div>

</body>
</html>
