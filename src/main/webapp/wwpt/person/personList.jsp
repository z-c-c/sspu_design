<%@ taglib prefix="tag" uri="object_tag" %>
<%--<%@ page import="com.wonders.security.model.BaseUserInfo" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/w_include_header.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--    <name>涉稳重点人员</name>--%>

    <link rel="stylesheet" href="../css/icon.css"><!--easyui-->
    <link rel="stylesheet" href="../../css/myselect.css">
    <script src="../../js/ajaxfileupload.js" result="text/javascript"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script type="text/javascript" src="../../js/myselect.js"></script>
    <style result="text/css">
        .maskBox {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            height: 100%;
            background: rgba(0, 0, 0, .3);
        }

        .lrTable {
            width: 100%;
            height: auto;
        }

        .lrTable tr {
            height: 36px;
            line-height: 36px;
        }

        .lrTable tr th {
            font-size: 14px;
            height: 40px;
            line-height: 40px;
            background: #fafafa;
            color: #656565;
            font-weight: 700;
            border-bottom: 1px solid #f9f9f9;
        }

        .lrTable tr td {
            text-align: center;
            color: #999;
            border-bottom: 1px solid #ededed;
        }

        .insertBtn {
            color: #409dff;
        }

        .insertBtn::before {
            content: "";
            display: inline-block;
            width: 12px;
            height: 15px;
            /* background: url("../images/icon-add2.png") no-repeat;*/
            position: relative;
            top: 3px;
            margin-right: 4px;
        }

        .pageBox {
            width: 100%;
            height: 26px;
            line-height: 26px;
            padding: 0 40px;
            box-sizing: border-box;
            color: #7a7a7a;
            margin: 30px auto;
        }

        .pageStyle a {
            width: 60px;
            height: 26px;
            line-height: 26px;
            display: inline-block;
            border: 1px solid #ededed;
            color: #999;
            text-align: center;
            border-radius: 4px;
            vertical-align: top;
        }

        .pageStyle ul {
            display: inline-block;
        }

        .pageStyle ul li {
            width: 26px;
            height: 26px;
            line-height: 26px;
            background: #eaedf1;
            border: 1px solid #eaedf1;
            text-align: center;
            border-radius: 4px;
            cursor: pointer;
            float: left;
            margin: 0 4px;
            transition: .3s linear;
        }

        .pageStyle ul li.active {
            background: #409dff;
            border: 1px solid #409dff;
            color: #fff;
        }

        .tanTable2 .center {
            text-align: right;
        }

        .tanTable2 .alertBtn {
            padding: 0 20px;
            line-height: 32px;
        }

        .ml-80 {
            margin-left: 80px;
        }

        .gray {
            color: rgba(0, 0, 0, .45);
        }

        .blueText {
            color: #2c9beb;
            display: inline-block;
            padding: 0 4px;
            box-sizing: border-box;
            border: 1px solid #2c9beb;
            border-radius: 4px;
            font-size: 12px;
        }

        /* 女 */
        .proName1::after {
            content: "";
            display: inline-block;
            width: 20px;
            height: 20px;
            background: url(../images/women.png) no-repeat;
            background-size: 20px;
            position: relative;
            top: 3px;
            margin-left: 3px;
        }

        /* 男 */
        .proName2::after {
            content: "";
            display: inline-block;
            width: 20px;
            height: 20px;
            background: url(../images/men.png) no-repeat;
            background-size: 20px;
            position: relative;
            top: 3px;
            margin-left: 3px;
        }

        .upload-btnn {
            display: none;
        }

        /*美化自定义按钮*/
        .file-input-triggerr {
            width: 70px;
            height: 30px;
            display: inline-block;
            line-height: 30px;
            text-align: center;
            border-radius: 4px;
            background-color: #409dff;
            outline: none;
            color: #fff;
            cursor: pointer;
        }

        .file-namee {
            font-size: 12px;
            color: #999;
            display: inline-block;
        }

        img {
            border: none;
            width: 80px;
            position: relative;
            top: -8px;
        }

        .tabCon > div.tabConSon2 {
            height: 180px;
            position: relative;
            overflow: hidden;
        }

        .main td {
            height: 30px;
        }

        .searchCon {
            width: 100%;
            height: auto;
            padding: 20px;
            box-sizing: border-box;
        }

        .pagination {
            user-select: none;
            float: right;
        }

        .pubBlock {
            width: 900px;
            background: #fff;
            box-shadow: 0px 5px 20px 0px rgba(78, 129, 206, 0.15);
            border-radius: 8px;
            padding: 20px 26px;
            box-sizing: border-box;
            position: relative;
        }

        .select {
            width: 200px;
            color: rgba(0, 0, 0, 0.85);
        }

        .searchCon ul li .proInfo, .peoSty .proInfo {
            width: 20%;
        }

        .fuzzyBox1 {
            width: 200px;
            height: 30px;
            display: none;
            /* display: inline-block; */
            position: relative;
            top: -2px;
            transition: .3s linear;
        }

        .fuzzyBox1 input {
            color: rgba(0, 0, 0, 0.65);
        }

        /*定义滚动条样式（高宽及背景）*/
        ::-webkit-scrollbar {
            width: 6px; /* 滚动条宽度， width：对应竖滚动条的宽度  height：对应横滚动条的高度*/
        }

        /*定义滑块 样式*/
        ::-webkit-scrollbar-thumb {
            background-color: #ccc;
            position: absolute;
            right: 3px;
            width: 4px;
            border-radius: 4px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            opacity: 0;
            filter: alpha(opacity=0);
            -webkit-transition: opacity .2s linear;
            -moz-transition: opacity .2s linear;
            transition: opacity .2s linear;
        }


        .fuzzyData1 {
            background-color: #ffffff;
            box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.12);
            border-radius: 4px;
            border: solid 1px #d2d5db;
            position: absolute;
            min-height: 20px;
            max-height: 200px;
            min-width: 195px;
            z-index: 20;

            display: none;
        }

        .fuzzyData1 > div {
            width: 100%;
            height: auto;
            padding: 10px 0;
            box-sizing: border-box;
        }

        .fuzzyData1 span {
            display: block;
            width: 100%;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: rgba(0, 0, 0, 0.65);
            cursor: pointer;
            padding: 0 20px;
            box-sizing: border-box;
        }

        .searchCon .peoImg {
            width: 116px;
            height: 134px;
            display: inline-block;
            overflow: hidden;
            border-radius: 4px;
            border: solid 1px rgba(0, 0, 0, 0.15);
            box-sizing: border-box;
            background: #fff;
        }

        input[result=file] {
            display: none;
        }

        .pubBox waitPG {
            display: inline-block;
            min-width: 84%;
            vertical-align: top;
            margin-left: 30px;
            font-size: 14px;
            line-height: 30px;
            color: rgba(0, 0, 0, 0.85);
        }
    </style>

</head>
<body>
<input type="hidden" id="sort">
<div class="index-main">
    <div class="fx-left">
        <div class="searchBox">
            <div class="bear-tit">
                <h5>查询条件</h5>
            </div>
            <div class="searchWrap">
                <!-- 高级搜索 -->
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox" style="width: 474px">
                            <input type="text" placeholder="姓名/曾用名/性别/证件号/手机号/籍贯/居住地" id="param">
                        </div>
                        <button class="btn1" onclick=" find(1,true);">搜索</button>
                        <button class="btn2" onclick="reset()">重置</button>
                    </div>

                </div>
                <div class="labelSearch">
                    <div class="clearfix">
                        <span class="labelText v-fl">标签</span>
                        <div class="labelAdd v-fl">
                            <!-- 所有标签 -->
                            <div class="labelAll">
                                <!-- input框 -->
                                <div class="fuzzyBox">
                                    <input class="vV-ipt w-200" id="txt1" result="text" value="" placeholder="请输入标签关键字"
                                           autocomplete="off">
                                </div>
                                <!-- 加号 -->
                                <strong class="addBtn">+</strong>
                            </div>
                        </div>
                    </div>
                    <!-- 分类label -->
                    <div class="labelDown">
                        <i class="labelCloseBtn">×</i>
                        <tag:tag clazz="tabName" id="tag" style="" type="tagDiv"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="searchReault">
            <div class="searchNum">
                <span>为您找到相关结果共<strong id="searchNum">0</strong>项</span>
                <div class="btnGroup">
                    <a onclick="addShow();" id="add" class="active" style="float: right;">新增</a>
                </div>
            </div>

            <div class="searchCon" id="searchCon">

            </div>

            <div id="pagination" class="pagination"></div>
            <div id="eventpage" hidden="hidden" class="pagination"></div>
        </div>
    </div>

    <div class="fx-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>性别分布</h5>
            </div>
            <div class="assessBox">
                <div class="item item1">
                    <i style="background: url(../images/men.png)"></i>
                    <p class="num" id="menCount">0</p>
                    <p class="name">男</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i style="background: url(../images/women.png)"></i>
                    <p class="num" id="womenCount">0</p>
                    <p class="name">女</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>数据聚合（<span id="dataTogetherCount">0</span>）</h5>
                <a target="_blank" onclick="findMore()">更多&gt;&gt;</a>
            </div>
            <div class="dataBox">
                <div class="dataList marquee1">
                    <div class="view" id="dataTogether">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="addPoints" style="display: none;z-index: 1000000">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>选择地点</h5>
        </div>
        <div class="titleCon" style="height: 430px;">
            <iframe src="../event/map.jsp" id="main_frame" name="main_frame" frameborder="0" width="100%"
                    height="100%" class="iframeMain"></iframe>
        </div>
    </div>
</div>
<div class="tanBox" id="warningInfo" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>事件预警</h5>
        </div>
        <div class="titleCon" style="height: 330px;">
            <div class="baseTable">
                <table border="0" style="width: 700px;">
                    <tr>
                        <td width="20%" class="center">预警名称</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="noticeName" style="width: 200px;"
                                   autocomplete="no">
                        </td>
                        <td width="20%" class="center">预警等级</td>
                        <td width="30%">
                            <select class="vV-drop" id="noticeLevel" style="width: 200px;">
                                <option value="4" selected>严重</option>
                                <option value="3">较严重</option>
                                <option value="2">一般</option>
                                <option value="1">轻度</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">预警内容</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;height: 200px"
                                      id="noticeContent"></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0" style="width: 700px;">
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveWarning()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="addnew" style="display: none">
    <div class="pubBlock kuang" style="width: 850px">
        <i class="close" onclick="javascript:$('#addnew').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>人员信息</h5>
        </div>
        <div class="titleCon" id="insertnew" style="height: 500px;">
            <div class="baseTable" style="height: 700px;">
                <table border="0">
                    <tr>
                        <td class="center">人员照片：</td>
                        <td colspan="3">
                            <div class="uploadBox">
                                <div class="uploadSty">
                                    <img src="../images/imgIcon.png" onclick="browerfile.click()" id="QRCode"/>
                                    <input type="file" id="browerfile" name="browerfile" style="display:none"
                                           class="fileBtn">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">姓名：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="personName" value="">
                        </td>
                        <td width="20%" class="center">性别：</td>
                        <td width="30%">
                            <select class="select" id="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </td>


                    </tr>

                    <tr>
                        <td width="20%" class="center">年龄：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="number" id="age" value="">
                        </td>
                        <td width="20%" class="center">证件号：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="personIdentityNo" value="">
                        </td>


                    </tr>
                    <tr>
                        <td width="20%" class="center">国籍：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="nationality" value="">
                        </td>

                        <td width="20%" class="center">籍贯：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="nativePlace" value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">手机号：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="phoneNo" value="">
                        </td>

                        <td width="20%" class="center">居住地：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="liveAddr" value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">居住地经度：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="longti" value="" autocomplete="off"
                                   placeholder="双击通过地图选择" ondblclick="choicePoint()">
                        </td>

                        <td width="20%" class="center">居住地维度：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="lati" value="" autocomplete="off"
                                   ondblclick="choicePoint()">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">曾用名：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" type="text" id="personUsedName" value="">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">标签联动</td>
                        <td colspan="3">
                            <tag:tag clazz="vV-drop" style="width:550px;height:28px;" id="linkTag" type="tagSelect"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="updatePersonId">
<input type="hidden" id="toUpdateWarningId">
</body>
<script result="text/javascript">
    function successOperator() {
        $.messager.alert("操作提示", "操作成功!");
    }

    function reset() {
        $("#param").val("");
        $(".labelAll span strong").each(function () {
            // var removeStr = $(this).text();
            $(this).parent().remove();
        });
        find(1, true);
    }

    function addShow() {
        $("#updatePersonId").val("");
        $("#QRCode").attr("src", "../images/imgIcon.png");
        $("#personName").val("");
        $("#gender").val("");
        $("#age").val("");
        $("#personUsedName").val("");
        $("#personIdentityNo").val("");
        $("#nationality").val("");
        $("#nativePlace").val("");
        $("#phoneNo").val("");
        $("#liveAddr").val("");
        $(".fs-options").find('div').removeClass("selected");
        $(".fs-label").eq(0).attr("title", "");
        $(".fs-label").eq(0).text("");
        $("#addnew").show();
    }

    function editShow(personId) {
        $("#updatePersonId").val(personId);
        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType: "json",
            data: {
                objectId: personId
            },
            success: function (result) {
                if (result.code === "success") {
                    let tags = result.data;
                    let names = '';
                    $(".fs-options").eq(0).find('div').removeClass("selected");
                    for (let i = 0; i < tags.length; i++) {
                        names += tags[i].tagName + ",";
                        $(".fs-options").eq(0).find('div[data-value=\"' + tags[i].tagId + '\"]').addClass("selected");
                    }
                    names = names.substr(0, names.length - 1);
                    $(".fs-label").eq(0).attr("title", names);
                    $(".fs-label").eq(0).text(names);
                }
            }
        });
        $.ajax({
            type: "GET",
            url: "/persons/" + personId,
            dataType: "json",
            success: function (result) {
                let person = result.data;
                if (person.personImage != "" && person.personImage != null && person.personImage != "null") {
                    $("#QRCode").attr("src", "/uploads/" + safeToString(person.personImage));
                }
                $("#personName").val(person.personName);
                $("#gender").val(person.gender);
                $("#personUsedName").val(person.personUsedName);
                $("#personIdentityNo").val(person.personIdentityNo);
                $("#nationality").val(person.nationality);
                $("#nativePlace").val(person.nativePlace);
                $("#phoneNo").val(person.phoneNo);
                $("#liveAddr").val(person.liveAddr);
                $("#age").val(person.age);
                $("#longti").val(person.longti);
                $("#lati").val(person.lati);
                $("#addnew").show();
            }
        })
    }

    function save() {
        let data = {};
        data.personId = $("#updatePersonId").val();
        data.personName = $("#personName").val();
        data.age = $("#age").val();
        data.personUsedName = $("#personUsedName").val();
        data.gender = $("#gender").val();
        data.personIdentityNo = $("#personIdentityNo").val();
        data.nationality = $("#nationality").val();
        data.nativePlace = $("#nativePlace").val();
        data.phoneNo = $("#phoneNo").val();
        data.liveAddr = $("#liveAddr").val();
        data.longti = $("#longti").val();
        data.lati = $("#lati").val();
        var tags = '';
        $(".fs-options").eq(0).find('div').each(function () {
            if ($(this).hasClass('selected')) {

                tags += $(this).context.dataset.value + ',';
            }
        });
        data.tags = safeToString(tags);
        $.ajax({
            type: "POST",
            url: "/persons/save",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.code == 'success') {
                    upImage(result.data);

                    $("#addnew").hide();
                    //照片上传成功后再刷新页面
                    // find(1, true);

                }
            }
        })
    }

    function find(page, flag) {
        var tags = '';
        $(".labelAll span strong").each(function () {
            tags += $(this).attr("id") + ','
        });
        if (tags) {
            tags = tags.substring(0, tags.length - 1);
        }
        let data = {};
        data.param = $("#param").val();
        data.page = page;
        data.pageSize = 5;
        data.tags = tags;
        $.ajax({
            type: "POST",
            url: "/persons/find",
            dataType: 'json',
            data: data,
            success: function (result) {
                if (result.code == 'success') {
                    let total = result.data.total;
                    $("#searchNum").text(total);
                    let persons = result.data.data;
                    if (flag) {
                        // 分页
                        var pageTotal;
                        if (total <= 5) {
                            pageTotal = 1;
                        } else {
                            pageTotal = Math.ceil(total / 5);
                        }
                        new Page({
                            id: 'pagination',
                            pageTotal: pageTotal, //必填,总页数
                            pageAmount: 5,  //每页多少条
                            dataTotal: total, //总共多少条数据
                            curPage: 1, //初始页码,不填默认为1
                            pageSize: 5, //分页个数,不填默认为5
                            showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                            showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                            getPage: function (page) {
                                find(page, false);
                            }

                        });
                    }

                    let str1 = "";
                    for (let i = 0; i < persons.length; i++) {
                        getTags(persons[i].personId);
                        if (!unittag) {
                            unittag = ''
                        }
                        dataTogetherById(persons[i].personId);
                        // pid = result["data"]["content"][i].id;
                        str1 += "<ul >";
                        str1 += "<li>";
                        str1 += "<div class=\"pubBox \" id=\"info\">";
                        if (persons[i].personImage != null && persons[i].personImage != "" && persons[i].personImage != "null") {
                            str1 += "<div style=\"float: left;\"><img src=\"/uploads/" + persons[i].personImage + "\" style=\"width: 80px;height: 100px; margin-left: 20px;top: -8px\"alt=\"\"></div>"
                        } else {
                            str1 += "<div style=\"float: left;\"><img src=\"../images/people.png\" style=\"margin-left: 20px;top: -8px\"alt=\"\"></div>"
                        }
                        str1 += "<div style=\"margin-left: 120px;\"><p class=\"proInfo\" name=\"paId\" hidden=\"hidden\">" + persons[i].personId + "</p>";
                        if (persons[i].personName != null && persons[i].personName != "" && persons[i].personName != "null") {
                            str1 += "<p class=\"proName\" style=\"font-size:17px;\" name=\"objectName\" onclick=\"personIndex('" + persons[i].personId + "')\">" + persons[i].personName;

                            if (persons[i].gender == "男") {
                                //  str1 += "<img  src=\"wwpt/images/men.png\" style=\"position: absolute;height: 23px;\"/> ";
                                str1 += "<span class=\"proName2\"></span>";
                            }
                            if (persons[i].gender == "女") {
                                //str1 += "<img  src=\"wwpt/images/women.png\" style=\"position: absolute;height: 23px;\"/> ";
                                str1 += "<span class=\"proName1\"></span>";
                            }
                            str1 += "</p>"
                        }
                        str1 += "<div class=\"labelBox\">";
                        str1 += unittag;
                        str1 += "</div><table>";
                        if (persons[i].personIdentityNo != null && persons[i].personIdentityNo != "" && persons[i].personIdentityNo != "null") {
                            str1 += "<tr><td class=\"proInfo\">证件号：" + persons[i].personIdentityNo + "</td> ";
                        } else {
                            str1 += "<tr><td class=\"proInfo\">证件号：无</td> ";

                        }

                        if (persons[i].phoneNo != null && persons[i].phoneNo != "" && persons[i].phoneNo) {
                            str1 += "<td class=\"proInfo\" style=\"margin-left: 250px;\">电话：" + persons[i].phoneNo + "</td></tr>";
                        } else {
                            str1 += "<td class=\"proInfo\" style=\"margin-left: 250px;\">电话:无</td></tr>";

                        }
                        str1 += "</table>";

                        str1 += "<div class='infoBox'><div class=\"item\"><i></i><span>年龄:" + persons[i].age + "岁</span></div><div class=\"item\"><i></i><span onclick='toMoreDateTogether(\"" + persons[i].personId + "\",\"" + personCount + "\")' style='cursor: pointer'>数据聚合(" + personCount + ")</span></div></div>";
                        // str1 += "</div>";
                        // str1 += "</div>";
                        str1 += "<div class=\"btnGroup\">";
                        str1 += '<a class="btnSty" onclick="showWarning(\'' + persons[i].personId + '\')">预警</a>';
                        str1 += "<div class=\"sortList sortList2 v-fr\">";
                        str1 += "<a onclick='showPress(this)' class=\"sort\">操作</a>";
                        str1 += "<div class=\"sortDown sortDown2\">";
                        str1 += "<p  onclick=\"personIndex('" + persons[i].personId + "')\">详情</p><p onclick=\"editShow('" + persons[i].personId + "')\">修改</p><p onclick=\"delPerson('" + persons[i].personId + "')\">删除</p>";
                        str1 += " </div></div></div>";
                        str1 += "</div></li></ul>";
                    }
                    $("#searchCon").html(str1);

                    if (str1 === "") {
                        str1 += "<img src=\"../images/noImage.png\" style=\"margin-left: 400px;\">";
                        $("#searchCon").html(str1);
                    }
                }
            }
        })
    }

    function showWarning(personId) {
        $("#noticeName").val('');
        $("#noticeContent").val('');
        $("#noticeLevel").val('');
        $.ajax({
            type: 'post',
            url: '/warnings/find/type',
            data: {
                objectId: personId,
                objectType: 'person'
            }, success: function (result) {
                let warning = result.data;
                if (warning == null) {
                    $("#toUpdateWarningId").val('');
                    $.messager.alert("提示", "该人员无预警");
                } else {
                    $("#toUpdateWarningId").val(warning.noticeId);
                    $("#noticeName").val(warning.noticeName);
                    $("#noticeContent").val(warning.noticeContent);
                    $("#noticeLevel").val(warning.noticeLevel);
                }
            }
        })
        $("#updatePersonId").val(personId);
        $("#warningInfo").show();
    }

    function saveWarning() {
        let data = {};
        data.noticeId = $("#toUpdateWarningId").val();
        data.noticeName = $("#noticeName").val();
        data.noticeContent = $("#noticeContent").val();
        data.noticeLevel = $("#noticeLevel").val();
        data.noticeObjectId = $("#updatePersonId").val();
        data.noticeObjectType = 'person';
        $.ajax({
            type: 'post',
            url: '/warnings/save',
            data: data,
            dataType: 'json',
            success: function (result) {
                if (result.code == 'success') {
                    successOperator();
                    $("#warningInfo").hide();
                }
            }
        });
    }

    function toMoreDateTogether(personId, count) {
        if (count == 0) {
            noDataTogether();
        } else {
            openNewWindow("personDataTogether.jsp?paId=" + personId + "", 'top');
        }
    }

    function noDataTogether() {
        $.messager.alert("操作提示", "无数据聚合!");
    }

    function genderCount() {
        $.ajax({
            type: "GET",
            url: "/persons/gender",
            dataType: "json",
            success: function (result) {
                if (result.code === "success") {
                    $("#menCount").text(result.data.men + "人");
                    $("#womenCount").text(result.data.women + "人");
                }
            }

        })
    }

    //进入页面显示默认内容
    var tagsJson = [];
    var unittag = "";
    var nowpage = 1;
    var personCount = 0;

    $(function () {

        genderCount();
        find(1, true);
        dataTogether();
        tagfind();
        $("#linkTag").fSelect();
        var pageI = 0
        $(".pageStyle ul li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            pageI = $(this).index();
        })
        $(".prevPage").click(function () {
            pageI--;
            if (pageI <= 0) {
                pageI = 0;
            }
            $(".pageStyle ul li").eq(pageI).addClass("active").siblings().removeClass("active");
        })
        $(".nextPage").click(function () {
            pageI++;
            if (pageI >= $(".pageStyle ul li").length) {
                pageI = $(".pageStyle ul li").length - 1;
            }
            $(".pageStyle ul li").eq(pageI).addClass("active").siblings().removeClass("active");
        })

        vVsub();

        // 关闭弹窗
        $(".close").click(function () {
            $(".maskBox").fadeOut(200);
        })
    })

    function selectFile(thisdom) {
        thisdom.prev().trigger('click')
        thisdom.prev().on('change', function (event) {
            var fileName = event.target.files[0].name
            thisdom.next().text(fileName)
        })
    }

    var province = null;
    var cities;


    // 高级搜索的标签联动
    var province1 = null;
    var cities;


    function formatterdate(val, row) {
        if (val == null)
            return '';
        var format = 'yyyy-MM-dd hh:mm:ss';
        var d = new Date(val.time);
        return d.format(format);
    }


    //删除
    function delPerson(id) {
        var paId = id;
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    var personId = paId;
                    $.ajax({
                        url: '/personaffair/deletePerson',
                        result: 'post',
                        async: false,
                        dataType: "json",
                        data: {"paId": personId},
                        success: function (result) {
                            $.messager.alert("操作提示", "操作成功!");
                            //window.location.reload();
                        },
                        error: function (error) {
                            $.messager.alert("操作提示", "操作失败!");
                            // window.location.reload();
                        }
                    })

                }
            }
        })
    }


    //个人主页
    function personIndex(id) {
        var url = 'personDetail.jsp?personId=' + id + '';
        openNewWindow(url, 'top');
    }


    function getTags(objectId) {
        $.ajax({
            type: "POST",
            url: "/tagBaseInfo/findByObjectId",
            dataType: "json",
            async: false,
            data: {
                objectId: objectId
            },
            success: function (result) {
                var str = '';
                if (result.code === "success") {
                    var tags = result.data;
                    var tagCount = 10;
                    if (tags.length >= tagCount) {
                        tags.length = tagCount;
                    }
                    for (var i = 0; i < tags.length; i++) {
                        str += '<span style="background: ' + JSON.parse(tags[i].tagCssCode).color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag = str;

            }
        });
    }

    var searchonOff = true;


    function findnum(id) {
        var objectId = id;

        $.ajax({
            url: '/personaffair/personEvent',
            result: 'POST',
            dataType: "json",
            data: {
                "keyObjectListId": objectId,
            },
            success: function (data) {
                var num = 0;
                for (var k in data) {
                    num = num + 1;
                }
                var str1 = "";
                str1 += "<i></i> <span onclick=\'jump(\"" + id + "\")\'>数据聚合（" + num + "）</span> ";


                $("#" + id).html(str1);


            }
        })
    }

    function jump(id) {
        var url = 'dataTogether.jsp?paId=' + id + '';
        openNewWindow(url, 'top');
    }

    function footerChange() {
        // .index-main高度
        var indexMainH = $(".fx-left").outerHeight(true);
        var indexMainHR = $(".fx-right").outerHeight(true);
        if (indexMainH < indexMainHR) {
            indexMainH = indexMainHR - 45;
        }
    }


    function findMore() {
        let url = 'personDataTogether.jsp';
        openNewWindow(url, 'top');
    }


    function upImage(personId) {
        var fileEleId = "browerfile";
        var attrName = "browerfile";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/persons/upImage",
            fileElementId: fileEleId,
            async: false,
            dataType: "json",
            data: {
                attrName: attrName,
                personId: personId
            },
            success: function (result) {
                find(1, true);
                successOperator();
            }, error: function (result) {
                find(1, true);
                successOperator();
            }
        });
    }


    function newAdduploadImg() {
        var img = '';

        //获取图片路径的方法，兼容多种浏览器，通過createObjectURL实现


        //实现上上传图片功能代码
        $(function () {

            $("#browerfile").change(function (e) {
                ifuploadimg = true;
                var path = browerfile.value;
                var objUrl = getObjectURL(this.files[0]);
                if (objUrl) {
                    $('#QRCode').attr("src", objUrl);
                }
                var file = e.target.files[0];
                var reader = new FileReader();
                reader.readAsDataURL(file); // 读出 base64
                reader.onloadend = function () {
                    // 图片的 base64 格式, 可以直接当成 img 的 src 属性值
                    img = reader.result;
                    // 下面逻辑处理

                };
            })
        })
    }

    newAdduploadImg();

    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) {
            url = window.createObjectURL(file); //basic
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }

        return url;
    }


    function getCaption(obj) {
        return obj.split("@@@@")[1]
    }


    function allDataTogether() {
        $.ajax({
            url: '/persons/dataTogether/all',
            result: 'POST',
            dataType: "json",
            data: {
                page: 1,
                pageSize: 5
            },
            success: function (data) {
                var str1 = "";
                var count = 0;

                for (var i = 0; i < data.length; i++) {

                    str1 += "<dl> <dt>";
                    if (data[i].EVENT_NAME != null && data[i].EVENT_NAME != "" && data[i].EVENT_NAME != "null") {

                        str1 += "<span>" + data[i].EVENT_NAME + "</span><i class=\"new\"></i></dt><dd>";
                    } else {
                        str1 += "<span>无事件名</span><i class=\"new\"></i></dt><dd>";

                    }
                    if (data[i].EVENT_CONTENT != null && data[i].EVENT_CONTENT != "" && data[i].EVENT_CONTENT != "null") {

                        str1 += "<p class=\"con\"  style=\"white-space: nowrap; text-overflow:ellipsis; overflow: hidden;\">" + data[i].EVENT_CONTENT + "</p>";
                    } else {
                        str1 += "<p class=\"con\"  style=\"white-space: nowrap; text-overflow:ellipsis; overflow: hidden;\">无事件内容</p>";

                    }
                    str1 += "<div class=\"sourceInfo\">";
                    if (data[i].OBJECT_NAME != null && data[i].OBJECT_NAME != "" && data[i].OBJECT_NAME != "null") {

                        str1 += " <span class=\"name\">" + data[i].OBJECT_NAME + "</span>";
                    } else {
                        str1 += " <span class=\"name\">无</span>";
                    }
                    if (data[i].EVENT_SOURCE != null && data[i].EVENT_SOURCE != "" && data[i].EVENT_SOURCE != "null") {
                        str1 += "  <strong> <b>来源 ：</b><span>" + data[i].EVENT_SOURCE + "</span> </strong>";
                    } else {
                        str1 += "  <strong> <b>来源 ：</b><span>无</span> </strong>";

                    }

                    if (data[i].OCCURED_TIME != null && data[i].OCCURED_TIME != "0" && data[i].OCCURED_TIME != "null") {
                        var time = timestampToTime(data[i].OCCURED_TIME.time);
                        if (time != "1970-01-1 ") {
                            str1 += "<em>" + time + "</em>";
                        }

                    } else {
                        str1 += "<em>无</em>";
                    }


                    str1 += "</div></dd></dl>";
                }

                $("#dataList").html(str1);
                if (str1 == "") {
                    str1 += "<img src=\"../images/noImage.png\" style=\"\n" +
                        "    margin-left: 130px;\n" +
                        "    margin-top: 40px;\n" +
                        "\">";

                }
            }
        })

    }

    //数据聚合汇总
    function dataTogether() {
        $("#dataBoxLoading").mLoading("show");
        var beginDate = new Date();
        var timer1 = window.setTimeout(function () {
            $.ajax({
                type: "post",
                url: "/persons/dataTogether/all",
                dataType: "json",
                data: {
                    page: 1,
                    pageSize: 5
                },
                success: function (result) {
                    let list = result.data.data;
                    let count = result.data.total;
                    $("#dataTogetherCount").text(count);
                    $("#dataTogether").empty();
                    if (count === 0) {
                        let str = '<li style="height: 200px" class="backG"></li>';
                        $("#dataTogether").append(str);
                    }
                    for (let i = 0; i < list.length; i++) {
                        var person = list[i];
                        var personName = person.personName;
                        if (personName == null || personName.trim().length == 0) {
                            personName = '无';
                        }
                        var phoneNo = person.phoneNo;
                        if (phoneNo == null || phoneNo.trim().length == 0) {
                            phoneNo = '无';
                        }
                        var age = person.age;
                        if (age == null || age.trim().length == 0) {
                            age = '无';
                        }

                        $("#dataTogether").append('<dl>\n' +
                            '                              <dt>\n' +
                            '                              <span style="font-weight: bold;white-space: nowrap; text-overflow:ellipsis; overflow: hidden; ">' + personName + '</span>\n' +
                            '                              <i class="new"></i>\n' +
                            '                                </dt>\n' +
                            '                                <dd>\n' +
                            // '                                <p class="con" style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">' + eventContent + '' +
                            '                                </p>\n' +
                            '                            <div class="sourceInfo">\n' +
                            '                                <strong style="margin-left: 0px;">\n' +
                            '                                <b>年龄</b>\n' +
                            '                                <span>' + age + '</span>\n' +
                            '                                </strong>\n' +
                            '                                <em>' + phoneNo + '</em>\n' +
                            '                            </div>\n' +
                            '                            </dd>\n' +
                            '                            </dl>');

                    }
                }
            });
            $("#dataBoxLoading").hide();
            window.clearTimeout(timer1);
        }, new Date() - beginDate + 200)
    }

    function dataTogetherById(personId) {
        $.ajax({
            type: "post",
            url: "/persons/dataTogether",
            dataType: "json",
            async: false,
            data: {
                personId: personId,
                page: 1,
                pageSize: 1
            },
            success: function (result) {
                if (result.code == 'success') {
                    personCount = result.data.total;
                }

            }
        })
    }

    $(function () {
        /*导航切换*/
        $(".header-nav a").click(function () {
            $(".header-nav a").removeClass("active");
            $(this).addClass("active");
        });
        /*下拉链接*/
        $(".dropdown-link").click(function () {
            if ($(this).children("ul").is(":hidden")) {
                $(this).children("ul").fadeIn(100);
            } else {
                $(this).children("ul").fadeOut(100);
            }
        });
        $(".dropdown-link").mouseleave(function () {
            $(this).children("ul").fadeOut(100);
        });
        /*消息提醒下拉切换*/
        $('.dropdown-notice').click(function () {
            if ($(this).find(".notice-box").is(":hidden")) {
                $(this).find(".notice-box").fadeIn(100);
            } else {
                $(this).find(".notice-box").fadeOut(100);
            }
        });
        $(".dropdown-notice").mouseleave(function () {
            $(this).children(".notice-box").fadeOut(100);
        });
        /*header-hover*/
        $(".header-box").hover(function () {
            $(this).addClass("hover");
        }, function () {
            $(this).removeClass("hover");
        });

        // 输入框控件调用
        vVsub();


        // //新增的模糊查询下拉框滚动条

        //弹出列表框
        $("#addPersonName").click(function () {
            choosePerson();
            $("#showdata").fadeIn();
            return false;
        });

        //隐藏列表框
        $("body").click(function () {
            $("#showdata").fadeOut();
        });

        //移入移出效果
        $(".spanItem").hover(function () {
            $(this).css('background-color', '#dbf1fc');
        }, function () {
            $(this).css('background-color', 'white');
        });


        $("#addPersonName").keyup(function () {
            $("#showdata").fadeIn();//只要输入就显示列表框

            if ($("#addPersonName").val().length <= 0) {
                $(".spanItem").css('display', 'block');//如果什么都没填，跳出，保持全部显示状态
                return;
            }

            $(".spanItem").css('display', 'none');//如果填了，先将所有的选项隐藏

            for (var i = 0; i < $(".spanItem").length; i++) {
                //模糊匹配，将所有匹配项显示
                if ($(".spanItem").eq(i).text().substr(0, $("#addPersonName").val().length) == $("#addPersonName").val()) {
                    $(".spanItem").eq(i).css('display', 'block');
                }
            }
        });


        $(".tabConSon2").perfectScrollbar();


        //标签点击，填充到标签列表框
        var labelArr = [];
        var labelAllH = 0;
        var labelTop = 0;
        $(".tabCon .span").on("click", function () {
            var textHtml = $(this).html();
            if (labelArr.indexOf(textHtml) != -1) {
                return
            }
            var id = $(this).attr("id");
            labelArr.push(textHtml);
            $(".fuzzyBox").css("display", "none");
            //清空输入框
            $("#txt1").val("");
            $("#txt1").keyup();

            $(".labelAll").prepend('<span>\n' +
                '                        <strong id="' + id + '">' + textHtml + '</strong>\n' +
                '                        <i class="labelClose">×</i>\n' +
                '                    </span>');
            $(".labelCloseBtn").trigger('click');
            find(1, true);
            clickHandle();
        });

        // 标签删除
        $('.labelAll').on("click", ".labelClose", function () {
            var removeStr = $(this).parent().find("strong").text();
            removeByValue(labelArr, removeStr);
            $(this).parent().remove();
            $(".labelCloseBtn").trigger('click');
            find(1, true)
            clickHandle();
        });
        $('.easyui-combobox').combobox({
            // 定义用户是否可以直接输入文本到字段中。
            editable: false,
            // 自适应高度。
            panelHeight: 'auto',
            // 设置需要固定的高度(适用于1.4或以上版本)。
            panelMaxHeight: 154
        });    // 人-社会实体-事件切换
        $(".tabName div").mouseenter(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".tabCon").children().eq($(this).index()).removeClass("displayNone").siblings().addClass("displayNone");
        })
        // 标签弹窗关闭
        $(".labelCloseBtn").click(function () {
            $("#txt1").val("");
            $("#txt1").keyup();
            $(".labelDown").fadeOut();
            $(".fuzzyBox").css("display", "none");
        })
        $('.easyui-combobox').combobox({
            // 定义用户是否可以直接输入文本到字段中。
            editable: false,
            // 自适应高度。
            panelHeight: 'auto',
            // 设置需要固定的高度(适用于1.4或以上版本)。
            panelMaxHeight: 154
        });


// 弹框滚动条
        $("#insertnew").perfectScrollbar();
        // 排序方式
        $(".statusList li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        })
        var sortHtml = "";
        $(".sortMethod").click(function () {
            $(this).next().slideDown();
        });
        $(".sortText p").click(function () {
            $(this).parent().slideUp();
            sortHtml = $(this).html();
            $(".sortMethod").html(sortHtml);
        });

        // 弹窗关闭
        $(".kuang i.close").click(function () {
            $(this).parent().parent().fadeOut();
            // $(".tanBox").fadeOut();
        })
        $(".clearBtn").click(function () {
            $(this).prev().val("");
        })
    })


    function choicePoint() {
        $("#main_frame")[0].contentWindow.showPoint($("#longti").val(), $("#lati").val());
        $("#addPoints").show();
    }

    function editnew(id) {
        $("#addshowname").hide();
        $("#editshowname").show();

        editnewshow(id);
    }

    //操作
    var showSort = true;

    function showPress(obj) {
        if (showSort) {
            $(obj).next().fadeIn();
        } else {
            $(obj).next().fadeOut();
        }
        showSort = !showSort;
    }

    //获取标签

    var num = $("#labelAll").find("span").length;

</script>
</html>