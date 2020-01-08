
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="apptag" uri="app_tags" %>

<!DOCTYPE html>

<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>涉稳重点人员详情</name>
    <%@include file="../common/w_include_header.jsp"%>

    <link rel="stylesheet" href="../css/icon.css"><!--easyui-->
    <script result="text/javascript" src="../common/w_common_method.js"></script>
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
            height:36px;
            width: 100%;
            margin-top: 20px;
        }




        .tableStyy td {
            margin: 0;
            padding: 0;
            border-bottom : thin dashed gainsboro;
        }
        .tableStyy{
            font-size: 14px;
            line-height: 22px;
            color: rgba(0, 0, 0, 0.85);
        }
        .tableStyy tr{
            height: 40px;
            line-height: 40px;
        }
        .tableStyy tr td.adress{
            color: #2c9beb;
        }
        .tableStyy tr td.adress::after{
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
        .tableStyy tr td.green{
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
            height:36px;
            overflow:hidden;


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
<body >
<div class="index-main">
    <div class="whiteBox" id="whitebox">
        <div class="infoBox-l" id="infobox-l">
            <div class="infoBox-l-item infoBox-l-item1" >
                <div id="baseInfo"></div>

                <div class="catalogue">
                    <span class="v-fl">目录</span>
                    <div class="v-fl">
                        <div id="catalog">
                            <a href=\"javascript:;\" style="display:none;" id="relationinfo">关联信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="rizhiinfo">日志信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="shangfanginfo">上访信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="jiaozhenginfo">矫正信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="shifanginfo">刑满释放信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="qsninfo">重点青少年信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="yaowuinfo" >药物滥用人员信息</a>
                            <a href=\"javascript:;\" style="display:none;" id="jingshenginfo" >严重精神障碍人员信息</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="contentWrap">
                <div class="bear-tit bear-tit2 point" id="a1">

                </div>
                <div id="glxx">
                <div class="infoBox-l-item infoBox-l-item3" id="companyRelation"></div>
                <div class="infoBox-l-item infoBox-l-item4" id="peopleBox" ></div>
                </div>

                <div id="czxx">
                <div class="infoBox-l-item infoBox-l-item5" id="rizhixinxi" style="margin-left: -20px;"></div>
                <div class="infoBox-l-item infoBox-l-item6" id="normalcheck"></div>
                <div class="infoBox-l-item infoBox-l-item6" id="bosscheck"></div>
                <div class="infoBox-l-item infoBox-l-item6" id="chuzhirizhi"></div>
                </div>

                <div class="infoBox-l-item infoBox-l-item6" id="xinfang">

                </div>

                <div class="infoBox-l-item infoBox-l-item6" id="tsrq0" style="margin-bottom: 30px;">

                </div>

                <div class="infoBox-l-item infoBox-l-item6" id="tsrq1" style="margin-bottom: 30px;">

                </div>

                <div class="infoBox-l-item infoBox-l-item6" id="tsrq2" style="margin-bottom: 30px;">

                </div>

                <div class="infoBox-l-item infoBox-l-item6" id="tsrq3" style="margin-bottom: 30px;">

                </div>

                <div class="infoBox-l-item infoBox-l-item6" id="tsrq4" style="margin-bottom: 30px;">

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
<div class="tanBox"   id = "addInInfluent" style="display: none">

    <div class="pubBlock kuang">
        <i class="close"  onclick="javascript:$('#addInInfluent').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>录入维稳库</h5>
        </div>
        <div class="titleCon ps-container ">
            <div class="baseTable">
                <table border="0">
                    <tr  id="alwayshide"> <input result="hidden" id="personId"></tr>
                    <tr>
                        <td class="center" >人员照片：</td>
                        <td colspan="3">
                            <div class="uploadBox">
                                <div class="uploadSty">
                                    <img  src="../images/imgIcon.png"  id="QRCode" />
                                    <input disabled result="file" id="browerfile"   name="browerfile" style="display:none" class="fileBtn">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">姓名：</td>
                        <td width="30%">
                            <input disabled  class="vV-ipt" result="text" id="personName" value="">
                        </td>

                        <td width="20%" class="center">曾用名：</td>
                        <td width="30%">
                            <input  disabled  class="vV-ipt" result="text" id="personUsedName" value="">
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">性别：</td>
                        <td width="30%">
                            <input disabled  class="vV-ipt" result="text" id="gender" value="">
                        </td>

                        <td width="20%" class="center">证件号：</td>
                        <td colspan="3">
                            <input disabled  class="vV-ipt" result="text" id="personDocuNum" value="">
                        </td> </tr>
                    <tr>
                        <td width="20%" class="center">国籍：</td>
                        <td width="30%">
                            <input disabled  class="vV-ipt" result="text" id="nationality" value="">
                        </td>

                        <td width="20%" class="center">籍贯：</td>
                        <td width="30%">
                            <input disabled class="vV-ipt" result="text" id="nativePlace" value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">手机号：</td>
                        <td width="30%">
                            <input disabled class="vV-ipt" result="text" id="phoneNum" value="">
                        </td>

                        <td width="20%" class="center">数据来源：</td>
                        <td width="30%">
                            <input disabled class="vV-ipt" result="text" id="dataSource" value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">所属街道：</td>
                        <td width="30%">
                            <input disabled class="vV-ipt" result="text" id="liveStreet"  value="">
                        </td>
                        <td width="20%" class="center">居委：</td>
                        <td width="30%">
                            <input disabled class="vV-ipt" result="text" id="neighborhood"  value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">地址：</td>
                        <td colspan="3">
                            <input disabled id="livePlace" class="vV-ipt" result="text" value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">录入原因：</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" id="putReason" ></textarea>
                        </td>
                    </tr>

<%--                    <tr>
                        <td width="20%" class="center">入库时间：</td>
                        <td width="30%">
                            <input id="putDate" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">

                        </td>
                    </tr>--%>
                    <tr>
                        <td class="center">标签联动：</td>
                        <td colspan="3">
                            <div id="treeBox">
                                <!--id必须是treeBox  -->
                                <input class="focusEl" result="text"  id="addLabel" placeholder="请选择">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">操作人：</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value=""  id="putUserId">
                        </td>

                        <td width="20%" class="center">责任诉求：</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value=""  id="zrsq">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">稳控责任单位：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" value=""  id="wkunit">
                        </td>

                        <td width="20%" class="center">化解责任单位：</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value=""  id="hjunit">
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">矛盾类型：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-tabs" id="conflictType" name="conflictType" style="width: 200px;" dictId="WTQD_MDLB"
                                         textName="mdlx" defText="all"/>
                        </td>

                        <td width="20%" class="center">矛盾级别：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-tabs" id="conflictRank" name="conflictRank" style="width: 200px;" dictId="WTQD_MDJB"
                                         textName="mdjb" defText="all"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveInfluent()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

</div>

</body>
<script result="text/javascript">
    var normalnum=0;
    var bossnum=0;
    var tagsJson = [];
    var catalog="";

    $(window).resize(function () {
        footerChangeDetail();
    })
    $(function () {
        personBaseInfo();
        personRelation();
        companyRelation();
        //personEvent();
        bosscheck();
        normalcheck();
        chuzhirizhi();
        initPersonTags();
        usei();
        xfRecord();
        personRecordFile();

        /*setEndTime(function(){ footerChange(); }, 3000);*/

        $("#alwayshide").hide();
    });

    var nowObjectName="";
    var ifhaverelation =false;
    var ifhaverizhi=false;


    function usei() {
        var adid = GetQueryString("paId");
        $("#useiframe").html("<iframe id=\"graphFrame\" src=\"personRelationList.jsp?objectId="+adid+"&&objectType=person\"  style=\"margin-left: 0px;margin-top:-70px;width: 100%;height: 310px;border: 0;overflow: hidden;\"></iframe>")
    }

    var cishu=0;
    function  haverelation(){
        if(ifhaverelation){
            if(cishu==0){
                var str1="";
                str1+="<h5 style=\"margin-top: 20px;\">关联信息</h5>";
                $("#a1").html(str1);
                $("#relationinfo").removeAttr("style");
                cishu++;
            }
        }
    }
    var cishu1=0;
    function ifaccess() {
        var personId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/KeyObjectInfoById',
            result: 'POST',
            async:false,
            dataType: "json",
            data: {
                "personId": personId
            },
            success: function (data) {
                if(data[0].sfhj==1){
                    $("#ifaccess").html("<p>已化解</p>");
                }
                else if(data[0].sfhj==0){
                    $("#ifaccess").html("<p>未化解</p>");
                }
                else{
                    $("#ifaccess").html("<p>其他</p>");
                }

            }
        })
    }
    function  haverizhi(){
        if(ifhaverizhi){
            if(cishu1==0){
                var str1="";
                str1+=" <div class=\"bear-tit bear-tit2 point\" id=\"a4\"><h5>日志信息</h5></div>\n" +
                    "   <div class=\"countBox\" style=\"margin-top: 20px;\">\n" +
                    "                <div class=\"count\" > <i></i><p>处理总数</p><strong id=\"allcount\">0</strong></div>\n" +
                    "                <div class=\"clearfix countInfo\"><div class=\"item clearfix\" > <span class=\"v-fl\">依法处置</span> <strong class=\"v-fr\" id=\"normalhandle\">0</strong> </div>\n" +
                    "                   <div class=\"item clearfix\" ><span class=\"v-fl\">领导批示</span> <strong class=\"v-fr\" id=\"bosshandle\">0</strong> </div> \n" +
                    "                        <div class=\"item clearfix\" ><span class=\"v-fl\">处置日志</span> <strong class=\"v-fr\" id=\"chuzhirizhihandle\">0</strong> </div> \n" +
                    "                </div>\n" +
                    "            </div>";
                $("#rizhixinxi").html(str1);
                $("#czxx").css("margin-bottom","30px");
                $("#rizhiinfo").removeAttr("style");
                cishu1++;
            }
        }
    }


    //初始化单位标签
    function initUnitTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findTagByType",
            dataType: "json",
            async: false,//异步改为同步
            data: {
                tagLabelType: "unit",
            },
            success: function (result) {
                if (result.message != "error") {
                    var units = {"level": 1, "name": "单位"};
                    var unitClasses = [];
                    var tagList = result.list;
                    $("#unitTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        $("#unitTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
                        var classes = {"level": 2, "name": tag[0].tagClassesFirstName};
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var unittag = {"level": 3, "name": tagName};
                            tags.push(unittag);
                        }
                        classes.children = tags;
                        unitClasses.push(classes);
                    }
                    units.children = unitClasses;
                    tagsJson.push(units);
                }
            }
        });
    }

    //初始化事件标签
    function initEventTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findTagByType",
            dataType: "json",
            async: false,//异步改为同步
            data: {
                tagLabelType: "event",
            },
            success: function (result) {
                if (result.message != "error") {
                    var events = {"level": 1, "name": "事件"};
                    var eventClasses = [];
                    var tagList = result.list;
                    $("#eventTags").empty();
                    for (var i = 0; i < tagList.length; i++) {

                        var tag = tagList[i];//某一类的list
                        $("#eventTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
                        var classes = {"level": 2, "name": tag[0].tagClassesFirstName};
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var eventtag = {"level": 3, "name": tagName};
                            tags.push(eventtag);
                        }
                        classes.children = tags;
                        eventClasses.push(classes);
                    }
                    events.children = eventClasses;
                    tagsJson.push(events);
                }
            }
        })
    }

    //初始化人员标签
    function initPersonTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findTagByType",
            dataType: "json",
            // async: false,//异步改为同步
            data: {
                tagLabelType: "person",
            },
            success: function (result) {
                if (result.message != "error") {
                    var persons = {"level": 1, "name": "人","id":uuid(),"uid":uuid(),"pid":uuid()};
                    var personClasses = [];
                    var tagList = result.list;
                    $("#personTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        $("#personTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
                        var classes = {"level": 2, "name": tag[0].tagClassesFirstName,"id":uuid(),"uid":uuid(),"pid":uuid()};
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var persontag = {"level": 3, "name": tagName,"id":uuid(),"uid":uuid(),"pid":uuid()};
                            tags.push(persontag);

                        }
                        classes.children = tags;
                        personClasses.push(classes);
                    }
                    persons.children = personClasses;
                    tagsJson.push(persons);
                    initpersontagflag=true;
                    initSelect();
                }
            }
        });
    }


    function initSelect(){
        // 标签联动
        treeBox({
            el: '$(".focusEl")', //焦点事件DOM 必传
            width: { // 各级列表宽度 可选 不传默认值就为 160，160，160，200
                lv1: 80,
                lv2: 100,
                lv3: 160,
                selected: 200
            },
            // selectedNum:3,// 设置可以选择多少个复选框 可选 不传默认3
            height: 260, //高度 不传默认值 280

            selectedNum: 20,
            // data: jobs.info, //数据 必传
            data: tagsJson,
            confirm: function (res) { //回调函数 必传 会以json的格式返回所选中的数据
                for (var k in res) {
                    $(".jobType").eq(k).val(res[k].value);
                    $(".jobType").eq(k).attr('name', 'jobType[' + res[k].uid + ']');
                }
            }
        });
    }


    function quanping(){
        var id = GetQueryString("paId");
        var url='personRelationList.jsp?objectId='+id+'&&objectType=person';
        openNewWindow(url);
    }

    function findIndex(id){
        var url='personDetail.jsp?paId='+id+'';
        openNewWindow(url);
    }
    function secreting(str){
        var num=str.length;
        var i=Math.ceil(num/2);
        var str1=str.substr(0,i);
        var j=num-i;
        for(var m=0;m<j;m++){
            str1+="*";
        }
     return str1;
    }



    function personBaseInfo() {
        var personId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/personBaseInfo',
            result: 'POST',
            dataType: "json",
            data: {
                "personId": personId
            },
            success: function (data) {
                var str1 = "";
                jsonArr = data;
                for (var i = 0; i < data.length; i++) {
                    str1 += "<div><div class=\"name-l\">";
                    if(data[i].personName!=null&&data[i].personName!=""&&data[i].personName!="null"){

                        str1 += "<p class=\"con line1\" style=\"font-size: 32px;margin-top: 3px;\">"+data[i].personName+"</p></div></div>";


                        nowObjectName=data[i].personName;
                    }
                    else{
                        str1 += "<p class=\"con line1\">无</p></div></div>";
                        nowObjectName="无";
                    }

                    str1 += " <div class=\"label\" id=\"personlabel\" style=\" margin-top: 10px;\"> </div>";
                    str1+="                        <div class=\"pg-status v-fr\">\n" +
                        "                            <div>\n" +
                        "                                <p class=\"status-text\">状态</p>\n" +
                        "                                <p class=\"status\" id=\"ifaccess\"></p></div>\n" +
                        "                            <!-- 已评估图 -->\n" +
                        "                            <i></i>\n" +
                        "                        </div>"

                    str1 += " <table border=\"0\" class=\"tableStyy\">";

                    if(data[i].personUsedName!=""&&data[i].personUsedName!=null&&data[i].personUsedName!="null"){
                        str1 += "  <tr><td width=\"90\"  style=\"color:#999999;\">曾&nbsp;  用 &nbsp;名</td><td width=\"350\" >" + data[i].personUsedName + "</td>";
                    }
                    else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">曾&nbsp;  用 &nbsp;名</td><td width=\"350\"  >无</td>";
                    }
                    if(data[i].gender=="0") {

                        str1 += "<td  width=\"90\" style=\"color:#999999;\">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td><td width=\"350\" >女</td> ";
                    }
                    else if(data[i].gender=="1") {

                        str1 += "<td  width=\"90\" style=\"color:#999999;\">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td><td width=\"350\" >男</td> ";
                    }
                    else  {
                        str1 += "<td width=\"90\"  style=\"color:#999999;\">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td><td width=\"350\" >无</td> ";
                    }
                    if(data[i].personDocuNum!=""&&data[i].personDocuNum!=null&&data[i].personDocuNum!="null") {
                        var re=secreting(data[i].personDocuNum);
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">证 &nbsp;件&nbsp;号</td><td width=\"350\">" + re + "</td>";
                    }
                    else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">证 &nbsp;件&nbsp;号</td></td><td width=\"350\">无</td>";
                    }
                    if(data[i].phoneNum!=""&&data[i].phoneNum!="null"&&data[i].phoneNum!=null) {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</td><td width=\"350\" >" + data[i].phoneNum + "</td></tr>";
                    }
                    else{
                        str1 += "<td width=\"90\" style=\"color:#999999;\">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</td><td width=\"350\" >无</td></tr>";

                    }
                    if(data[i].nationality!=""&&data[i].nationality!=null&&data[i].nationality!="null") {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍</td><td width=\"350\">" + data[i].nationality + "</td> ";
                    }
                    else {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍</td><td width=\"350\">无</td> ";
                    }
                    if(data[i].nativePlace!=""&&data[i].nativePlace!=null&&data[i].nativePlace!="null") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯</td><td width=\"350\">" + data[i].nativePlace + "</td></tr>";
                    }
                    else{
                        str1 += "<td width=\"90\" style=\"color:#999999;\">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯</td><td width=\"350\" >无</td></tr>";

                    }


                    if(data[i].liveStreet==null||data[i].liveStreet==""||data[i].liveStreet=="null") {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">街&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;道</td><td width=\"350\">无</td>";
                    }
                    else{
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">街&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;道</td><td width=\"350\" >" + data[i].liveStreet + "</td>";

                    }

                    if(data[i].neighborhood==null||data[i].neighborhood==""||data[i].neighborhood=="null") {
                        str1 += " <td width=\"90\" style=\"color:#999999;\">居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委</td><td width=\"350\" >无</td></tr>";
                    }
                    else{
                        str1 += " <td width=\"90\"  style=\"color:#999999;\">居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委</td><td width=\"350\">" + data[i].neighborhood + "</td></tr>";

                    }
                    str1 += "</table>";
                    str1 += "<table  border=\"0\" class=\"tableStyy\">";
                    if(data[i].livePlace==null||data[i].livePlace==""||data[i].livePlace=="null") {
                        str1 += "<tr><td width=\"90\"  style=\"color:#999999;\">住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</td><td width=\"700\" class=\"adress\" >无</td></tr>";
                    }
                    else{
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</td><td width=\"700\" class=\"adress\" >" + data[i].livePlace + "</td></tr>";

                    }
                    /* str1 += "<td width=\"90\"  style=\"color:#999999;\"></td><td width=\"350\"  ></td></tr>";
*/
                    str1 += "</table>";
                }

                $("#baseInfo").html(str1);
                ifaccess();
                personEvent();
                footerChangeDetail();
            }
        })
        //getPersonTag();
        $.ajax({
            url: '/personaffair/getPersonTag',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": personId
            },
            success: function (data) {
                var str1 = "";
                for (var i = 0; i < data.length; i++) {
                    var color=data[i].tagCssCode.split(":");
                    var colorcode = color[1].substring(1,(color[1].length-2));
                    str1 += " <span  style=\"background-color:" + colorcode + "\">" + data[i].tagName + "</span>";
                }
                $("#personlabel").html(str1);
            }
        });
    }
    function getTags(objectId){
        $.ajax({
            result:"POST",
            url:"/objectTagManager/getObjectTag",
            dataType:"json",
            async:false,
            data:{
                objectId:objectId,
            },
            success:function (result) {
                var str='';
                if (result.message=="success"){
                    var tags=result.objectTag;
                    for (var i=0;i<tags.length;i++){
                        var color=tags[i].tagCssCode.split(":");
                        var colorcode = color[1].substring(1,(color[1].length-2));
                        str+='<span style="background: '+colorcode+'" class="green">'+tags[i].tagName+'</span>';
                    }
                }
                unittag=str;
            }
        });
    }


    function findMoreById(){
        var id= GetQueryString("paId");
        var url='dataTogether.jsp?paId='+id+'';
        openNewWindow(url);
    }

    function personEvent(){
        var keyObjectListId= GetQueryString("paId");

        $.ajax({
            url: '/personaffair/personEvent',
            result: 'POST',
            dataType: "json",
            data:{
                "keyObjectListId":keyObjectListId},
            success:function(data){
                var str1 = "";
                var num=0;
                var count=0;
                for(var n in data){
                    num=num+1;
                }
                if(num!=0) {
                    str1 += "<div class=\"bear-tit bear-tit2 m-25\">   <h5>数据聚合（" + num + "）</h5><a  onclick=\"findMoreById()\">更多>></a>  </div>";
                    for (var k in data) {
                        //控制只输出最多5条数据
                        if (count < 5) {
                            getTags(data[k][0].eventId);
                            if (!unittag) {
                                unittag = ''
                            }
                            if (data[k][1].eventName != null&&data[k][1].eventName != "null"&&data[k][1].eventName != "") {
                                str1 += " <div class=\"r-item2-con\"> <div class=\"dataList dataList2\">  <dl><dd class=\"pubBlock\"> <p class=\"con\">" + data[k][1].eventName + "</p>";
                            }
                            else{
                                str1 += " <div class=\"r-item2-con\"> <div class=\"dataList dataList2\">  <dl><dd class=\"pubBlock\"> <p class=\"con\">无事件名</p>";

                            }
                            if (data[k][1].eventContent != null&&data[k][1].eventContent != ""&&data[k][1].eventContent != "null") {
                                str1 += "<p class=\"con1\" >" + data[k][1].eventContent + "</p>";
                            }
                            else{
                                str1 += "<p class=\"con1\" >无</p>";

                            }

                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">" + nowObjectName + "</span>";


                            if (data[k][1].eventSource != null&&data[k][1].eventSource !=""&&data[k][1].eventSource !="null") {
                                str1 += "<strong><b>来源</b><span>" + data[k][1].eventSource + "</span> </strong>";
                            }
                            else{
                                str1 += "<strong><b>来源</b><span>无</span> </strong>";

                            }
                            if (data[k][1].occurredTime != "0" && data[k][1].occurredTime != null && data[k][1].occurredTime != "null") {
                                var time = timestampToTime(data[k][1].occurredTime.time);
                                if(time!="1970-01-1 "){
                                    str1 += "<em>" + time + "</em>";
                                }

                                else{
                                    str1+="<em>暂无时间</em>";
                                }
                            }

                            str1 += "</div>";
                            if (unittag != "") {
                                str1 += "<div class=\"label\">";
                                str1 += unittag;
                                str1 += "</div>";
                            }
                            str1 += "</dd> </dl> </div></div>";
                            count = count + 1;
                        } else if (count >= 5) {
                            break;
                        }
                    }
                    $("#personEvent").html(str1);
                }
                footerChangeDetail();
            }
        });
    }
    function getCaption(obj){
        return obj.split("@@@@")[1]
    }
    function normalcheck() {
        var keyPersonId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/normalcheck',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },
            success:function(data){
                var str1 = "";
                if(data.length!=0) {
                    str1 += " <div class=\"sub-tit mt-24 point\" id=\"a5\"> ";
                    str1 += "          <h4>依法处置（" + data.length + "）</h4>\n" +
                        "                <a href=\"javascript:;\"> </a>\n" +
                        "            </div>\n" +
                        "            <div class=\"con mt-40\" >";
                    str1+="<ul class=\"historyList mt-10\">";
                    ifhaverizhi=true;
                    haverizhi();
                    countallnum();
                    for (var i = 0; i < data.length; i++) {
                        str1+="<li>";
                        if (data[i].handleContent != null&&data[i].handleContent !=""&&data[i].handleContent !="null") {
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">" + data[i].handleContent + "</p>";
                        }
                        else{
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">无</p>";

                        }
                        if (data[i].handleUser != null) {
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">" + data[i].handleUser + "</span>";
                        }
                        else{
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">无</span>";

                        }
                        //  str1 += "<strong><b>来源</b><span>"+data[i].eventSource+"</span> </strong>";
                        if (data[i].handleDate != "0"&&data[i].handleDate!=null&&data[i].handleDate!="null") {
                            var time = timestampToTime(data[i].handleDate.time);
                            str1 += "<em>" + time + "</em> </div>";
                        }
                        else{
                            str1 += "<em>无</em> </div>";
                        }
                        if (data[i].handleFilepath != null&&data[i].handleFilepath != ""&&data[i].handleFilepath != "null") {
                            str1 += "<div class=\"appendix\"><span onclick=\"downLoadFj('"+data[i].handleFilepath+"')\">" + getCaption(data[i].handleFilepath) + "</span></div>";
                        }
                        str1 += " \n" +
                            "                       </dd>\n" +
                            "                       </dl>\n" +
                            "                       </div></li>";

                    }
                    str1 += "</ul></div>";
                    $("#normalcheck").html(str1);
                    $("#czxx").css("margin-bottom","30px");
                }
                normalnum = data.length;
                $("#normalhandle").html(normalnum);

                footerChangeDetail();
            }
        });
    }
    function downLoadFj(pgPath) {
        if(pgPath==""){
            $.messager.alert("操作提示","无附件!");
        }else{
            $('<form id="exportEvent" method="post" action="/eventManager/downloadFj?fileName='+pgPath+'"></form>').appendTo('body').submit().remove();
        }
    }

    function bosscheck() {
        var keyPersonId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/bosscheck',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },
            success:function(data){
                if(data.length!=0) {
                    var str1 = "";
                    str1 += "               <div class=\"sub-tit mt-24 point\" id=\"a6\">\n" +
                        "                    <h4>领导批示（" + data.length + "）</h4>\n" +
                        "                </div>\n" +
                        "                <div class=\"con mt-40\">";
                    str1 += "<ul class=\"historyList mt-10\">";
                    ifhaverizhi=true;
                    haverizhi();
                    countallnum();
                    for (var i = 0; i < data.length; i++) {
                        str1+="<li>"
                        if (data[i].handleContent != null&&data[i].handleContent != ""&&data[i].handleContent != "null") {
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">" + data[i].handleContent + "</p>";
                        }
                        else{
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">无</p>";

                        }
                        if (data[i].handleUser != null&&data[i].handleUser != ""&&data[i].handleUser != "null") {
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">" + data[i].handleUser + "</span>";
                        }
                        else{
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">无</span>";
                        }
                        if (data[i].handleDate != "0"&&data[i].handleDate!=null&&data[i].handleDate!="null") {
                            var time = timestampToTime(data[i].handleDate.time);
                            str1 += "<em>" + time + "</em> </div>";
                        }
                        else{
                            str1 += "<em>无</em> </div>";
                        }
                        if (data[i].handleFilepath != null&&data[i].handleFilepath != ""&&data[i].handleFilepath != "null") {
                            str1 += "<div class=\"appendix\"><span onclick=\"downLoadFj('"+data[i].handleFilepath+"')\">" + getCaption(data[i].handleFilepath) + "</span></div>";
                        }
                        str1 += " \n" +
                            "                       </dd>\n" +
                            "                       </dl>\n" +
                            "                       </div></li>";

                    }
                    str1 += "</ul></div>";


                    $("#bosscheck").html(str1);
                    $("#czxx").css("margin-bottom","30px");

                }
                bossnum = data.length;
                $("#bosshandle").html(bossnum);
                footerChangeDetail();
            }
        });
    }


    function chuzhirizhi() {
        var keyPersonId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/chuzhirizhi',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },
            success:function(data){
                var str1 = "";
                if(data.length!=0) {
                    str1 += " <div class=\"sub-tit mt-24 point\" id=\"a7\" style=\"margin-top: 4px;\"> ";
                    str1 += "          <h4>处置日志（" + data.length + "）</h4>\n" +
                        "                <a href=\"javascript:;\"> </a>\n" +
                        "            </div>\n" +
                        "            <div class=\"con mt-40\" >";
                    //str1 += "<div class=\"bear-tit bear-tit2 m-25\">   <h5>数据聚合（"+data.length+"）</h5><a href=\"javascript:;\">更多>></a>  </div>";
                    str1+="<ul class=\"historyList mt-10\">";
                    ifhaverizhi=true;
                    haverizhi();
                    countallnum();
                    for (var i = 0; i < data.length; i++) {
                        str1+="<li>";
                        if (data[i].handleContent != null&&data[i].handleContent != ""&&data[i].handleContent != "null") {
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">" + data[i].handleContent + "</p>";
                        }
                        else{
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">无</p>";

                        }
                        if (data[i].handleUser != null&&data[i].handleUser !=""&&data[i].handleUser !="null") {
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">" + data[i].handleUser + "</span>";
                        }
                        else{
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">无</span>";

                        }
                        if (data[i].handleDate != "0"&&data[i].handleDate!=null&&data[i].handleDate!="null") {
                            var time = timestampToTime(data[i].handleDate.time);
                            str1 += "<em>" + time + "</em> </div>";
                        }
                        else{
                            str1 += "<em>无</em> </div>";
                        }
                        if (data[i].handleFilepath != null&&data[i].handleFilepath != ""&&data[i].handleFilepath != "null") {
                            str1 += "<div class=\"appendix\"><span onclick=\"downLoadFj('"+data[i].handleFilepath+"')\">" + getCaption(data[i].handleFilepath) + "</span></div>";
                        }
                        else{
                            str1 += "<div class=\"appendix\"><span>无</span></div>";
                        }
                        str1 += " \n" +
                            "                       </dd>\n" +
                            "                       </dl>\n" +
                            "                       </div></li>";

                    }
                    str1 += "</ul></div>";
                    $("#chuzhirizhi").html(str1);
                    $("#czxx").css("margin-bottom","30px");
                }
                normalnum = data.length;
                $("#chuzhirizhihandle").html(normalnum);

                footerChangeDetail();
            }
        });
    }

    function xfRecord() {
        var keyPersonId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/xfRecord',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },

            success:function(data){
                if(data.length!=0) {
                    $("#shangfanginfo").removeAttr("style");

                    var str1 = "";
                    str1+="               <div class=\"bear-tit bear-tit2 point\" id=\"a5\">\n" +
                        "                   <h5  style=\"margin-left: -20px;\">上访信息</h5>\n" +
                        "               </div>"
                    str1 += "               <div class=\"sub-tit mt-24 point\" id=\"a7\">\n" +
                        "                    <h4>上访记录（" + data.length + "）</h4>\n" +
                        "                </div>\n" +
                        "                <div class=\"con mt-40\">";
                    str1 += "<ul class=\"historyList mt-10\">";
                    for (var i = 0; i < data.length; i++) {
                        str1+="<li>";
                        if (data[i].sftype=="2") {
                            str1 += " <div class=\"sourceInfo\"> <span >本地上访</span>";
                        }
                        if (data[i].sftype == "1") {
                            str1 += " <div class=\"sourceInfo\"> <span >进京上访</span>";
                        }
                        if (data[i].jyqk != null&&data[i].jyqk !=""&&data[i].jyqk !="null") {
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">" + data[i].jyqk + "</p>";
                        }
                        else{
                            str1 += "<div class=\"dataList dataList2\"><dl><dd> <p class=\"conW\">无</p>";
                        }

                        if (data[i].lrry != null&&data[i].lrry !=""&&data[i].lrry !="null") {
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">" + data[i].lrry + "</span>";
                        }
                        else{
                            str1 += " <div class=\"sourceInfo\"> <span class=\"name\">无</span>";

                        }

                        if (data[i].rq != "0"&&data[i].rq!=null&&data[i].rq!="null") {
                            var time = timestampToTime(data[i].rq.time);
                            str1 += "<em>" + time + "</em> </div>";
                        }
                        else{
                            str1 += "<em>无</em></div>";
                        }
                        if (data[i].filepath != null&&data[i].filepath !=""&&data[i].filepath !="null") {

                            str1 += "<div class=\"appendix\"><span onclick=\"downLoadFj('"+data[i].filepath+"')\">" + getCaption(data[i].filepath) + "</span></div>";

                        }


                        str1 += " \n" +
                            "                       </dd>\n" +
                            "                       </dl>\n" +
                            "                       </div></li>";

                    }
                    str1 += "</ul></div>";


                    $("#xinfang").html(str1);


                }
                footerChangeDetail();
            }
        });
    }

    function countallnum() {
        var keyPersonId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/allRelation',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },
            success: function (data) {
                $("#allcount").html(data.length);
            }
        })
    }



    function saveInfluent() {
        var personId = $('#personId').val();
        var personName=$("#personName").val();
        var personUsedName= $('#personUsedName').val();
        var gender= $("#gender").val();
        var personDocuNum= $('#personDocuNum').val();
        var nationality= $('#nationality').val();
        var phoneNum= $('#phoneNum').val();
        var nativePlace= $('#nativePlace').val();
        var dataSource= $('#dataSource').val();
        var liveStreet= $("#liveStreet").val();
        var neighborhood= $("#neighborhood").val();
        var livePlace=$("#livePlace").val();
        var putReason=$('#putReason').val();
        var putUserId= $('#putUserId').val();
 /*       var putDate= $('#putDate').val();*/

        var label= $('#addLabel').val();

        if(label==""){
            label="null";
        }
        var wkunit=$('#wkunit').val();
        var hjunit=$('#hjunit').val();
        var zrsq=$('#zrsq').val();
        var conflictType= $("#conflictType option:selected").val();
        var conflictRank= $("#conflictRank option:selected").val();
        var personImage= $('#QRCode').attr("src");
        $.ajax({
            url: '/personaffair/addInfluentPersonHaveId',
            result: 'POST',
            dataType: "json",
            data: {
                "personImage":personImage,
                "personId":personId,
                "personName": personName,
                "personUsedName": personUsedName,
                "gender": gender,
                "personDocuNum": personDocuNum,
                "nationality": nationality,
                "phoneNum": phoneNum,
                "nativePlace": nativePlace,
                "dataSource": dataSource,
                "liveStreet": liveStreet,
                "neighborhood": neighborhood,
                "livePlace": livePlace,
                "putReason": putReason,
                "putUserId": putUserId,
              /*  "putDate": putDate,*/
                "label": label,
                "wkunit":wkunit,
                "hjunit":hjunit,
                "zrsq":zrsq,
                "conflictType":conflictType,
                "conflictRank":conflictRank
            },
            success: function (data) {
                if(data==true){
                    $('#addInInfluent').fadeOut();
                    $.messager.alert("操作提示","操作成功!");


                }else
                {
                    $('#addInInfluent').fadeOut();
                    $.messager.alert('操作提示',"操作失败");

                }
            }
        })
    }

    function personRelation() {
        var keyPersonId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/personRelation',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },
            success:function(data){

                 var str1="";
                str1+=" <div class=\"sub-tit mt-24 point\" id=\"a4\"> ";
                var num=0;
                for(var j in data){
                    num=num+1;
                }
                if(num!=0) {
                    ifhaverelation=true;
                    haverelation();
                    str1 += "          <h4>关联人员（" + num + "）</h4></div> <div class=\"peopleBox\">";
                    for (var k in data) {
                        str1 += "<ul><li><div class=\"imgBox\">";
                            if(data[k]["image"]!=null&&data[k]["image"]!="null"&&data[k]["image"]!=""){
                                 str1+= "<img src=\"/uploads/"+data[k]["image"]+"\" alt=\"\">";

                             }
                             else{
                        str1+= "<img src=\"../images/people.png\" alt=\"\">";

                         }
                        str1 += "<p>" + data[k]["name"] + "</p>";
                        str1 += "            </div>\n" +
                            "                    <div class=\"maskBox\">\n" +
                            "                        <a href=\"javascript:;\" onclick=\"addInInfluent('" + data[k]["personId"] + "')\" class=\"add\">加入维稳库</a>\n" +
                            "                        <a href=\"javascript:;\" onclick=\"findIndex('" + data[k]["personId"] + "')\" class=\"detail\">查看详情</a>\n" +
                            "                        </div>\n" +
                            "                        </li>\n" +
                            "\n" +
                            "                        </ul>";

                    }
                    str1 += "</div>";
                    if(num>5){
                        str1+="                <div class=\"arrowBox\">\n" +
                            "                    <a href=\"javascript:;\" class=\"next\"></a>\n" +
                            "                    <a href=\"javascript:;\" class=\"prev\"></a>\n" +
                            "                </div>";}
                    $("#peopleBox").html(str1);
                    $("#glxx").css("margin-bottom","30px");

                }
                footerChangeDetail();
            }
        });
    }
    function addInInfluent(id){
     /*   $("#putDate").val("");*/
        $("#putUserId").val("");
        $('#putReason').val("");
        $("#addLabel").val("");

        $.ajax({
            url: '/personaffair/personBaseInfo',
            result: 'POST',
            dataType: "json",
            data: {
                "personId": id
            },
            success: function (data) {
                $('#personId').val(id);
                $('#personName').val(data[0].personName);
                $('#personUsedName').val(data[0].personUsedName);

                if(data[0].gender=="0"){
                    $('#gender').val("女");
                }
                else if(data[0].gender=="1"){
                    $('#gender').val("男");
                }
                else{
                    $('#gender').val("无");
                }
                $('#personDocuNum').val(data[0].personDocuNum);
                $('#nationality').val(data[0].nationality);
                $('#phoneNum').val(data[0].phoneNum);
                $('#nativePlace').val(data[0].nativePlace);
                $('#dataSource').val(data[0].dataSource);
                $('#liveStreet').val(data[0].liveStreet);
                $('#neighborhood').val(data[0].neighborhood);
                $('#livePlace').val(data[0].livePlace);
                if (data[0].personImage != null && data[0].personImage != "" && data[0].personImage != "null") {

                    $("#QRCode").attr("src", "/uploads/"+data[0].personImage);
                }
                else{
                    $("#QRCode").attr("src", "../images/people.png");


                }
            }

        })
        $("#addInInfluent").fadeIn();
    }



    function companyRelation() {
        var keyPersonId = GetQueryString("paId");
        //var unitId="";
        $.ajax({
            url: '/personaffair/companyRelation',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId
            },
            success:function(data){
                var num=0;
                for(var a in data){
                    num=num+1;
                }
                if(num!=0) {
                    ifhaverelation=true;
                    haverelation();
                    var str1 = "";
                    str1 += "               <div class=\"sub-tit mt-24 point\" id=\"a3\">\n" +
                        "                    <h4>关联单位</h4>\n" +
                        "                </div>\n" +
                        "                <div>"

                    console.log(data);
                    for (var k in data) {
                        str1 += "   <div class=\"pubBlock\">   <div class=\"relatedUnits\">" + data[k]["companyinfo"].unitName + "</div>";
                        str1 += " <div class=\"label\">";
                        for (var k2 in data[k]["companytag"]) {
                            var color=data[k]["companytag"][k2].tagCssCode.split(":");
                            var colorcode = color[1].substring(1,(color[1].length-2));
                            str1 += " <span  style=\"background-color:" + colorcode + "\">" + data[k]["companytag"][k2].tagName + "</span>";
                        }
                        str1 += "</div>";
                        if (data[k]["companyinfo"].unitLegalPerson != null&&data[k]["companyinfo"].unitLegalPerson != "") {
                            str1 += "     <div class=\"text\"><strong>法定代言人：</strong><span>" + data[k]["companyinfo"].unitLegalPerson + "</span> </div>";
                        }
                        if (data[k]["companyinfo"].unitIndustry !="null"&&data[k]["companyinfo"].unitIndustry != null&&data[k]["companyinfo"].unitIndustry !="") {
                            str1 += "  <div class=\"text\">\n" +
                                "                    <strong>所属行业：</strong>\n" +
                                "                <span>" + data[k]["companyinfo"].unitIndustry + "</span>\n" +
                                "                </div>";
                        }
                        else{
                            str1 += "  <div class=\"text\">\n" +
                                "                    <strong>所属行业：</strong>\n" +
                                "                <span>无</span>\n" +
                                "                </div>";
                        }
                        if (data[k]["companyinfo"].usccCode !="null"&&data[k]["companyinfo"].usccCode != null&&data[k]["companyinfo"].usccCode !="") {
                            str1 += "\n" +
                                "                <div class=\"text\">\n" +
                                "                    <strong>统一社会信用代码：</strong>\n" +
                                "                <span>" + data[k]["companyinfo"].usccCode + "</span>\n" +
                                "                </div>";
                        }
                        else{
                            str1 += "\n" +
                                "                <div class=\"text\">\n" +
                                "                    <strong>统一社会信用代码：</strong>\n" +
                                "                <span>无</span>\n" +
                                "                </div>";
                        }
                        if (data[k]["companyinfo"].registerAddr != "null"&&data[k]["companyinfo"].registerAddr != null&&data[k]["companyinfo"].registerAddr !="") {
                            str1 += " <div class=\"text\">\n" +
                                "                    <strong>注册地址：</strong>\n" +
                                "                <span>" + data[k]["companyinfo"].registerAddr + "</span>\n" +
                                "                </div>";
                        }
                        else{
                            str1 += " <div class=\"text\">\n" +
                                "                    <strong>注册地址：</strong>\n" +
                                "                <span>无</span>\n" +
                                "                </div>";
                        }
                        if (data[k]["companyinfo"].dataSource != "null"&&data[k]["companyinfo"].dataSource != null&&data[k]["companyinfo"].dataSource!="") {
                            str1 += "    <div class=\"text text2 clearfix\">\n" +
                                "                    <strong>数据来源：</strong>\n" +
                                "                <span>" + data[k]["companyinfo"].dataSource + "</span>\n" +
                                "                </div>";
                        }
                        else{
                            str1 += "    <div class=\"text text2 clearfix\">\n" +
                                "                    <strong>数据来源：</strong>\n" +
                                "                <span>无</span>\n" +
                                "                </div>";
                        }
                        str1 += "   </div>";

                    }
                    str1 += "   </div>";
                    $("#companyRelation").append(str1);
                    $("#glxx").css("margin-bottom","30px");
                }
                footerChangeDetail();
            }
        })

    }


    $(function(){
        $(".titleCon").perfectScrollbar();

/*        // 输入框控件调用
        vVsub();
        jeDate("#putDate", {
            theme: { bgcolor: "#00A1CB", pnColor: "#00CCFF" },
            format: "YYYY-MM-DD",
            multiPane: true,
        });*/
        // 右侧滚动条颜色设置
        var oMyBar1 = new MyScrollBar({
            selId: 'scrollbar01',
            bgColor: 'rgba(50, 50, 50, 0)',
            barColor: '#f4f4f4',
            enterColor: '#479cfd',
            enterShow: false,
            borderRadius: 2,
            width: 3
        });
        // 显示右侧固定的模块
        $(window).scroll(function () {
            var scrollTop = $(document).scrollTop();
            var documentHeight = $(document).height();
            var windowHeight = $(window).height();
            var itemH = $(".infoBox-r").outerHeight(true);
            var contentItems = $(".contentWrap").find(".point");
            var currentItem = "";
            // 屏幕滚动超过右侧“引用本篇的法规”的最后一个元素的距屏幕顶部的距离的时候，出现固定的模块
            if (scrollTop >= itemH) {
                $(".anchor").removeClass("visi");
            } else {
                $(".anchor").addClass("visi");
            }

            if (scrollTop + windowHeight == documentHeight) {
                // 如果滚动到底部，就等于最后一个id的锚点
                currentItem = "#" + contentItems.last().attr("id");
            } else {
                contentItems.each(function () {
                    var contentItem = $(this);
                    var offsetTop = contentItem.offset().top;
                    if (scrollTop > offsetTop - 30) {//此处的200视具体情况自行设定，因为如果不减去一个数值，在刚好滚动到一个div的边缘时，菜单的选中状态会出错，比如，页面刚好滚动到第一个div的底部的时候，页面已经显示出第二个div，而菜单中还是第一个选项处于选中状态
                        currentItem = "#" + contentItem.attr("id");
                    }
                });
            }
            if (currentItem && currentItem != $(".anchorList").find(".active").attr("href")) {
                $(".anchorList").find(".active").removeClass("active");
                $(".anchorList").find("[href=" + currentItem + "]").addClass("active");
                oMyBar1.jump({
                    id: currentItem.slice(1) + "_id",
                    time: 400
                })
            }
        });

        //当点击跳转链接后，回到页面顶部位置
        $(".topBtn").click(function () {
            if ($('html').scrollTop()) {
                $('html').animate({ scrollTop: 0 }, 500);
                return false;
            }
            $('body').animate({ scrollTop: 0 }, 500);
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

        // 生命周期 标签位置
        var liLen = $(".timeAxis").find("li").length;
        var liW = $(".timeAxis").find("li").outerWidth(true);
        $(".timeAxis").css("width", liW * (liLen - 1) + "px");
        $(".timeWrap i.line").css("width", liW * (liLen - 1) + "px");
        for (var i = 0; i < liLen + 1; i++) {
            $(".timeAxis").find("li:nth-child(" + (i + 1) + ")").css({ "left": (i * 180 + 30) + "px" });
            if (i % 2 != 0 && i != 0) {
                $(".timeAxis").find("li:nth-child(" + (i + 1) + ")").css({ "top": 140 + "px" });
            } else {
                $(".timeAxis").find("li:nth-child(" + (i + 1) + ")").css({ "top": 16 + "px" });
            }
        }
        // 生命周期滚动条
        var oMyBar2 = new MyScrollBar({
            selId: 'scrollbar02',
            bgColor: 'rgba(50, 50, 50, 0)',
            barColor: '#e7e7e7',
            enterColor: '#479cfd',
            enterShow: false,
            hasX: true,
            hasY: false,
            borderRadius: 2,
            width: 4
        });
        oMyBar2.jump({
            pos: 'left',
            time: 400
        });

        // 流程的宽度
        var defaultW = $(".infoBox-l-item").outerWidth(true);
        $(".historyList li").css("width", defaultW - 57 +"px");

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
                $('.peopleBox ul').css({ "marginLeft": -liW }).delay(8).queue(function () {
                    $('.peopleBox ul').animate({ "marginLeft": 0 })
                    flag = true
                    $(this).dequeue();
                })
            }
        })

        $(".arrowBox .next").click(function () {
            if (flag) {
                flag = false
                $('.peopleBox ul').animate({ "marginLeft": -liW }).delay(8).queue(function () {
                    $('.peopleBox ul').find("li").eq(0).appendTo($('.peopleBox ul'))
                    $('.peopleBox ul').css({ "marginLeft": 0 })
                    flag = true
                    $(this).dequeue();
                })
            }
        })

    })


    function personRecordFile() {
        var personId = GetQueryString("paId");
        $.ajax({
            url: '/personaffair/KeyObjectInfoById',
            result: 'POST',
            dataType: "json",
            data: {
                "personId": personId
            },
            success: function (data) {
                if (data[0].personType != null) {
                    var typearr = data[0].personType;
                    var splitinfo = typearr.split(",");

                    for (var i = 0; i < splitinfo.length; i++) {
                        if (splitinfo[i] == "tsrq_0") {
                            getTsrq0(personId);

                        } else if (splitinfo[i] == "tsrq_1") {
                            getTsrq1(personId);
                        } else if (splitinfo[i] == "tsrq_2") {
                            getTsrq2(personId);
                        } else if (splitinfo[i] == "tsrq_3") {
                            getTsrq3(personId);
                        } else if (splitinfo[i] == "tsrq_4") {
                            getTsrq4(personId);
                        }

                    }

                }

            }
        })
    }

    function getTsrq0(personId) {
        $.ajax({
            url: '/personaffair/getTsrq0',
            result: 'POST',
            dataType: "json",

            data: {
                "objectId": personId
            },
            success: function (data) {
                var str1 = "";
                str1 += " ";

                str1+="<div class=\"bear-tit bear-tit2 point\" id=\"a6\">\n" +
                    " <h5 style=\"margin-left: -20px;\">矫正信息</h5>\n" +
                    "               </div>";
                $("#jiaozhenginfo").removeAttr("style");
                for(var i=0;i<data.length;i++) {
                    str1 += " <table border=\"0\" class=\"tableSty\" style=\"margin-left: 10px;\">";

                    if (data[i].jiaozhengleibieName != "") {
                        str1 += "  <tr><td width=\"90\" style=\"color:#999999;\"> 矫正类别</td><td colspan=\"3\" >" + data[i].jiaozhengleibieName + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\"> 矫正类别</td><td colspan=\"3\"  >无</td>";
                    }
                    if (data[i].jiaozhengKaishishijian != "") {
                        time=data[i].jiaozhengKaishishijian.substr(0,10);
                        str1 += "<td width=\"90\" style=\"color:#999999;\">矫正开始时间</td><td colspan=\"3\" >" + time + "</td></tr> ";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">矫正开始时间</td><td colspan=\"3\" >无</td></tr> ";
                    }
                    if (data[i].jiaozhengJieshushijian != "") {
                        time=data[i].jiaozhengJieshushijian.substr(0,10);
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">矫正结束时间</td><td colspan=\"3\" >" + time + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">矫正结束时间</td></td><td colspan=\"3\" >无</td>";
                    }
                    if (data[i].jiaozhengqixian != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\"> 矫正期限</td><td colspan=\"3\"  >" + data[i].jiaozhengqixian + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\"> 矫正期限</td><td colspan=\"3\">无</td></tr>";

                    }
                    if (data[i].zhengzhimianmaoName != "") {
                        str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">政治面貌</td><td colspan=\"3\" >" + data[i].zhengzhimianmaoName + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">政治面貌</td><td colspan=\"3\"  >无</td>";
                    }
                    if (data[i].anyouName != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">案由</td><td colspan=\"3\" >" + data[i].anyouName + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">案由</td><td colspan=\"3\" >无</td></tr>";

                    }
                    if (data[i].fanzuijingguo != "") {
                        str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">犯罪经过</td><td colspan=\"3\" >" + data[i].fanzuijingguo + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">犯罪经过</td><td colspan=\"3\"  >无</td>";
                    }
                    if (data[i].xingfaleixingName != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">刑罚类型</td><td colspan=\"3\" >" + data[i].xingfaleixingName + "</td> </tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">刑罚类型</td><td colspan=\"3\" >无</td> </tr>";
                    }
                    if (data[i].xingfashijian != "") {
                        time=data[i].xingfashijian.substr(0,10);
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">刑罚时间</td><td colspan=\"3\" >" + time + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">刑罚时间</td></td><td colspan=\"3\" >无</td>";
                    }
                    if (data[i].panjuejiguan != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">判决机关</td><td colspan=\"3\"  >" + data[i].panjuejiguan + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">判决机关</td><td colspan=\"3\">无</td></tr>";

                    }
                    if (data[i].panjueshijian != "") {
                        time=data[i].panjueshijian.substr(0,10);
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">判决时间</td><td colspan=\"3\"  >" + time + "</td> ";
                    } else {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">判决时间</td><td colspan=\"3\" >无</td> ";
                    }
                    if (data[i].jzjbName != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">矫正级别</td><td colspan=\"3\" >" + data[i].jzjbName + "</td> </tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">矫正级别</td><td colspan=\"3\" >无</td> </tr>";
                    }
                    if (data[i].sishiName != "") {
                        str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">是否四史</td><td colspan=\"3\" >" + data[i].sishiName + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">是否四史</td><td colspan=\"3\"  >无</td>";
                    }
                    if (data[i].leifanName != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">是否累犯</td><td colspan=\"3\" >" + data[i].leifanName + "</td> </tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">是否累犯</td><td colspan=\"3\" >无</td> </tr>";
                    }
                    if (data[i].sansheName != "") {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">是否三涉</td><td colspan=\"3\" >" + data[i].sansheName + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">是否三涉</td></td><td colspan=\"3\" >无</td>";
                    }
                    if (data[i].wuduName != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">是否五独</td><td colspan=\"3\"  >" + data[i].wuduName + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">是否五独</td><td colspan=\"3\">无</td></tr>";

                    }
                    if (data[i].sanwuName != "") {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否三无</td><td colspan=\"3\"  >" + data[i].sanwuName + "</td> ";
                    } else {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否三无</td><td colspan=\"3\" >无</td> ";
                    }
                    if (data[i].sfsdName != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">是否涉毒</td><td colspan=\"3\" >" + data[i].sfsdName + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">是否涉毒</td><td colspan=\"3\" >无</td></tr>";

                    }


                    if (data[i].zddx != "") {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">重点对象状态</td><td colspan=\"3\" >" + data[i].zddx + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">重点对象状态</td></td><td colspan=\"3\" >无</td>";
                    }
                    if (data[i].zydx != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">重要对象状态</td><td colspan=\"3\"  >" + data[i].zydx + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">重要对象状态</td><td colspan=\"3\">无</td></tr>";

                    }
                    if (data[i].rujiaoriqi != "") {
                        time=data[i].rujiaoriqi.substr(0,10);
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">入矫日期</td><td colspan=\"3\"  >" + time + "</td> ";
                    } else {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">入矫日期</td><td colspan=\"3\" >无</td> ";
                    }
                    if (data[i].zhongzhiriqi != "") {
                        time=data[i].zhongzhiriqi.substr(0,10);
                        str1 += "<td width=\"90\" style=\"color:#999999;\">终止日期</td><td colspan=\"3\"  >" + time+ "</td></tr> ";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">终止日期</td><td colspan=\"3\" >无</td></tr> ";
                    }


                    str1 += "</table>";

                }
                $("#tsrq0").html(str1);
                footerChangeDetail();
            }
        })
    }



    function getTsrq1(personId) {
        $.ajax({
            url: '/personaffair/getTsrq1',
            result: 'POST',
            dataType: "json",

            data: {
                "objectId": personId
            },
            success: function (data) {
                var str1 = "";
                str1 += " ";

                str1+="<div class=\"bear-tit bear-tit2 point\" id=\"a7\">\n" +
                    "                   <h5  style=\"margin-left: -20px;\">刑满释放信息</h5>\n" +
                    "               </div>";
                $("#shifanginfo").removeAttr("style");
                str1 += " <table border=\"0\" class=\"tableSty\" style=\"margin-left: 10px;\">";

                if (data[0].zuiming != "") {
                    str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">罪名</td><td colspan=\"3\" >" + data[0].zuiming + "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">罪名</td><td colspan=\"3\"  >无</td>";
                }
                if (data[0].zuiming2 != "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">罪名2</td><td colspan=\"3\" >" + data[0].zuiming2 + "</td></tr> ";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">罪名2</td><td colspan=\"3\" >无</td></tr> ";
                }
                if (data[0].jingshenbingText!= "") {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">是否精神病患者</td><td colspan=\"3\" >" + data[0].jingshenbingText+ "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">是否精神病患者</td></td><td colspan=\"3\" >未知</td>";
                }
                if (data[0].canjiText!= "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">是否残疾</td><td colspan=\"3\"  >" + data[0].canjiText+ "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">是否残疾</td><td colspan=\"3\">未知</td></tr>";

                }
                if (data[0].xidurenyuanText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否吸毒人员</td><td colspan=\"3\"  >" + data[0].xidurenyuanText + "</td> ";
                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否吸毒人员</td><td colspan=\"3\" >未知</td> ";
                }
                if (data[0].zhongdianduixiangText != "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">是否重点帮教对象</td><td colspan=\"3\" >" + data[0].zhongdianduixiangText+ "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">是否重点帮教对象</td><td colspan=\"3\" >未知</td></tr>";

                }


                if (data[0].bikongduixiangText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否公安落实管控措施（必控对象）</td><td colspan=\"3\" >" + data[0].bikongduixiangText + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否公安落实管控措施（必控对象）</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].rudangrutuanText != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否入党入团</td><td colspan=\"3\" >" + data[0].rudangrutuanText + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否入党入团</td><td colspan=\"3\">未知</td></tr>";

                }





                if (data[0].lingdaoText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\"> 是否担任领导职务</td><td colspan=\"3\" >" + data[0].lingdaoText + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\"> 是否担任领导职务</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].biaozhangText != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否受党政机关表彰</td><td colspan=\"3\" >" + data[0].biaozhangText + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否受党政机关表彰</td><td colspan=\"3\">未知</td></tr>";

                }
                if (data[0].baleirenyuanText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否八类人员</td><td colspan=\"3\" >" + data[0].baleirenyuanText + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否八类人员</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].waidifanhurenyuanText != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否外地返沪人员</td><td colspan=\"3\" >" + data[0].waidifanhurenyuanText + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否外地返沪人员</td><td colspan=\"3\">未知</td></tr>";

                }
                if (data[0].jiuyefangshiText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">目前就业方式</td><td colspan=\"3\" >" + data[0].jiuyefangshiText + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">目前就业方式</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].muqiananzhijiuyeText != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">目前安置就业情况</td><td colspan=\"3\" >" + data[0].muqiananzhijiuyeText + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">目前安置就业情况</td><td colspan=\"3\">未知</td></tr>";

                }





                if (data[0].sflsbjText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否落实帮教</td><td colspan=\"3\" >" + data[0].sflsbjText + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否落实帮教</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].wlsbjReason != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">未落实帮教原因</td><td colspan=\"3\" >" + data[0].wlsbjReason + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">未落实帮教原因</td><td colspan=\"3\">无</td></tr>";

                }    if (data[0].levelText != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">风险评估等级</td><td colspan=\"3\" >" + data[0].levelText + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">风险评估等级</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].xingshiriqi != "" ) {
                    time=data[0].xingshiriqi.substr(0,10);
                    str1 += " <td width=\"90\" style=\"color:#999999;\">刑释日期</td><td colspan=\"3\" >" + time + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">刑释日期</td><td colspan=\"3\">无</td></tr>";

                }    if (data[0].transferDate != "") {
                    time=data[0].transferDate.substr(0,10);
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">转为在册日期</td><td colspan=\"3\" >" + time + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">转为在册日期</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].jieshuriqi != "" ) {
                    time=data[0].jieshuriqi.substr(0,10);
                    str1 += " <td width=\"90\" style=\"color:#999999;\">结束日期</td><td colspan=\"3\" >" + time + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">结束日期</td><td colspan=\"3\">未知</td></tr>";

                }
                str1 += "</table>";
                /* str1+="</li></ul>";
                 str1+="</div>";*/
                $("#tsrq1").html(str1);
                footerChangeDetail();
            }
        })
    }

    function getTsrq2(personId) {
        $.ajax({
            url: '/personaffair/getTsrq2',
            result: 'POST',
            dataType: "json",

            data: {
                "objectId": personId
            },
            success: function (data) {
                var str1 = "";
                str1 += " ";

                str1+="<div class=\"bear-tit bear-tit2 point\" id=\"a8\">\n" +
                    "                   <h5  style=\"margin-left: -20px;\">重点青少年信息</h5>\n" +
                    "               </div>";
                $("#qsninfo").removeAttr("style");
                str1 += " <table border=\"0\" class=\"tableSty\" style=\"margin-left: 10px;\">";

                if (data[0].category != "") {
                    str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">类别</td><td colspan=\"3\" >" + data[0].category + "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">类别</td><td colspan=\"3\"  >无</td>";
                }
                if (data[0].othercategory!= "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">其他类别</td><td colspan=\"3\" >" + data[0].othercategory + "</td> </tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">其他类别</td><td colspan=\"3\" >无</td> </tr>";
                }
                if (data[0].politics!= "") {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">政治面貌</td><td colspan=\"3\" >" + data[0].politics+ "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">政治面貌</td></td><td colspan=\"3\" >无</td>";
                }
                if (data[0].education!= "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">教育情况</td><td colspan=\"3\"  >" + data[0].education+ "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">教育情况</td><td colspan=\"3\">无</td></tr>";

                }
                if (data[0].jobschoolstatus != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">学位</td><td colspan=\"3\"  >" + data[0].jobschoolstatus + "</td> ";
                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">学位</td><td colspan=\"3\" >无</td> ";
                }
                if (data[0].im != "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">im</td><td colspan=\"3\" >" + data[0].im+ "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">im</td><td colspan=\"3\" >无</td></tr>";

                }


                if (data[0].islabormanual != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否体力劳动</td><td colspan=\"3\" >" + data[0].islabormanual + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否体力劳动</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].isjobseek != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否在找工作</td><td colspan=\"3\" >" + data[0].isjobseek + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">是否在找工作</td><td colspan=\"3\">无</td></tr>";

                }





                if (data[0].skills != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">技能</td><td colspan=\"3\" >" + data[0].skills + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">技能</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].health != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">健康情况</td><td colspan=\"3\" >" + data[0].health + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">健康情况</td><td colspan=\"3\">未知</td></tr>";

                }
                if (data[0].marriage != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否婚配</td><td colspan=\"3\" >" + data[0].marriage + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">是否婚配</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].speciality != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">特长</td><td colspan=\"3\" >" + data[0].speciality + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">特长</td><td colspan=\"3\">无</td></tr>";

                }
                if (data[0].furtheredu != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">深造情况</td><td colspan=\"3\" >" + data[0].furtheredu + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">深造情况</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].trainingexpectation != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">期望学习内容</td><td colspan=\"3\" >" + data[0].trainingexpectation + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">期望学习内容</td><td colspan=\"3\">未知</td></tr>";

                }





                if (data[0].jobexpectation != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">期望工作</td><td colspan=\"3\" >" + data[0].jobexpectation + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">期望工作</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].growexpectation != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">期望发展</td><td colspan=\"3\" >" + data[0].growexpectation + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">期望发展</td><td colspan=\"3\">无</td></tr>";

                }    if (data[0].familyinfo != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">家庭背景</td><td colspan=\"3\" >" + data[0].familyinfo + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">家庭背景</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].familystruct != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">家庭结构</td><td colspan=\"3\" >" + data[0].familystruct + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">家庭结构</td><td colspan=\"3\">无</td></tr>";

                }    if (data[0].familyedu != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">家人教育情况</td><td colspan=\"3\" >" + data[0].familyedu + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">家人教育情况</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].livingenvironment != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">生活环境</td><td colspan=\"3\" >" + data[0].livingenvironment + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">生活环境</td><td colspan=\"3\">未知</td></tr>";

                }
                str1 += "</table>";

                $("#tsrq2").html(str1);
                footerChangeDetail();
            }
        })
    }


    function getTsrq3(personId) {
        $.ajax({
            url: '/personaffair/getTsrq3',
            result: 'POST',
            dataType: "json",

            data: {
                "objectId": personId
            },
            success: function (data) {
                var str1 = "";
                str1 += " ";

                str1+=" <div class=\"bear-tit bear-tit2 point\" id=\"a9\">\n" +
                    "                   <h5  style=\"margin-left: -20px;\">药物滥用人员信息</h5>\n" +
                    "               </div>";
                $("#yaowuinfo").removeAttr("style");
                for(var i=0;i<data.length;i++) {
                    str1 += " <table border=\"0\" class=\"tableSty\" style=\"margin-left: 10px;\">";

                    if (data[i].pcsmc != "") {
                        str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">派出所名称</td><td colspan=\"3\" >" + data[i].pcsmc + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">派出所名称</td><td colspan=\"3\"  >无</td>";
                    }
                    if (data[i].pcsxm != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">派出所项目</td><td colspan=\"3\" >" + data[i].pcsxm + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">派出所项目</td><td colspan=\"3\" >无</td></tr> ";
                    }
                    if (data[i].pcsdh != "") {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">派出所电话</td><td colspan=\"3\" >" + data[i].pcsdh + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">派出所电话</td></td><td colspan=\"3\" >无</td>";
                    }
                    if (data[i].sgid != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">事故编号</td><td colspan=\"3\"  >" + data[i].sgid + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">事故编号</td><td colspan=\"3\">无</td></tr>";

                    }
                    if (data[i].sgxm != "") {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">事故名称</td><td colspan=\"3\"  >" + data[i].sgxm + "</td> ";
                    } else {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">事故名称</td><td colspan=\"3\" >无</td> ";
                    }
                    if (data[i].fprq != "") {
                        time=data[i].fprq.substr(0,10);
                        str1 += "<td width=\"90\" style=\"color:#999999;\">发配日期</td><td colspan=\"3\" >" +time+ "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">发配日期</td><td colspan=\"3\" >无</td></tr>";

                    }
                    if (data[i].xdlb1 != "") {
                        str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">类别1</td><td colspan=\"3\" >" + data[i].xdlb1 + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">类别1</td><td colspan=\"3\"  >无</td>";
                    }
                    if (data[i].xdlb2 != "") {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">类别2</td><td colspan=\"3\" >" + data[i].xdlb2 + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">类别2</td><td colspan=\"3\" >无</td></tr>";
                    }
                    if (data[i].xdlb3 != "") {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">类别3</td><td colspan=\"3\" >" + data[i].xdlb3 + "</td>";
                    } else {
                        str1 += " <tr><td width=\"90\" style=\"color:#999999;\">类别3</td></td><td colspan=\"3\" >无</td>";
                    }
                    if (data[i].qdxysj != "") {
                        time=data[i].qdxysj.substr(0,10);
                        str1 += "<td width=\"90\" style=\"color:#999999;\">签订协议时间</td><td colspan=\"3\"  >" + time + "</td></tr>";
                    } else {
                        str1 += "<td width=\"90\" style=\"color:#999999;\">签订协议时间</td><td colspan=\"3\">无</td></tr>";

                    }
                    if (data[i].xsdpmc != "") {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">吸食毒品名称</td><td colspan=\"3\"  >" + data[i].xsdpmc + "</td></tr> ";
                    } else {
                        str1 += "<tr><td width=\"90\" style=\"color:#999999;\">吸食毒品名称</td><td colspan=\"3\" >无</td></tr> ";
                    }



                    str1 += "</table>";

                }
                $("#tsrq3").html(str1);
                footerChangeDetail();
            }
        })
    }


    function getTsrq4(personId) {
        $.ajax({
            url: '/personaffair/getTsrq4',
            result: 'POST',
            dataType: "json",

            data: {
                "objectId": personId
            },
            success: function (data) {
                var str1 = "";
                str1 += " ";
                str1+="<div class=\"bear-tit bear-tit2 point\" id=\"a10\">\n" +
                    "                   <h5  style=\"margin-left: -20px;\">严重精神障碍人员信息</h5>\n" +
                    "               </div>";
                $("#jingshenginfo").removeAttr("style");
                str1 += " <table border=\"0\" class=\"tableSty\" style=\"margin-left: 10px;\">";

                if (data[0].yjdblx != "") {
                    str1 += "  <tr><td width=\"90\" style=\"color:#999999;\">以奖代补类型</td><td colspan=\"3\" >" + data[0].yjdblx + "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">以奖代补类型</td><td colspan=\"3\"  >无</td>";
                }
                if (data[0].qyqk!= "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">签约情况</td><td colspan=\"3\" >" + data[0].qyqk + "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">签约情况</td><td colspan=\"3\" >无</td></tr>";
                }
                if (data[0].zy!= "") {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">职业</td><td colspan=\"3\" >" + data[0].zy+ "</td>";
                } else {
                    str1 += " <tr><td width=\"90\" style=\"color:#999999;\">职业</td></td><td colspan=\"3\" >无</td>";
                }
                if (data[0].whcd!= "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">文化程度</td><td colspan=\"3\"  >" + data[0].whcd+ "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">文化程度</td><td colspan=\"3\">无</td></tr>";

                }
                if (data[0].hyzk != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">婚姻状况</td><td colspan=\"3\"  >" + data[0].hyzk + "</td> ";
                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">婚姻状况</td><td colspan=\"3\" >无</td> ";
                }
                if (data[0].ylfyly != "") {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">医疗费用来源</td><td colspan=\"3\" >" + data[0].ylfyly+ "</td></tr>";
                } else {
                    str1 += "<td width=\"90\" style=\"color:#999999;\">医疗费用来源</td><td colspan=\"3\" >无</td></tr>";

                }


                if (data[0].gllx != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">管理类型</td><td colspan=\"3\" >" + data[0].gllx + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">管理类型</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].jjqk != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">经济情况</td><td colspan=\"3\" >" + data[0].jjqk + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">经济情况</td><td colspan=\"3\">无</td></tr>";

                }





                if (data[0].khrxm != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">看护人姓名</td><td colspan=\"3\" >" + data[0].khrxm + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">看护人姓名</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].khryhzgx != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">看护人与患者关系</td><td colspan=\"3\" >" + data[0].khryhzgx + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">看护人与患者关系</td><td colspan=\"3\">未知</td></tr>";

                }
                if (data[0].zdmc != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">诊断名称</td><td colspan=\"3\" >" + data[0].zdmc + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">诊断名称</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].sfrq != "" ) {
                    time=data[0].sfrq.substr(0,10);
                    str1 += " <td width=\"90\" style=\"color:#999999;\">随访日期</td><td colspan=\"3\" >" + time + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">随访日期</td><td colspan=\"3\">无</td></tr>";

                }
                if (data[0].jcglfj != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">基础管理分级</td><td colspan=\"3\" >" + data[0].jcglfj + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">基础管理分级</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].wxxwdj != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">危险行为等级</td><td colspan=\"3\" >" + data[0].wxxwdj + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">危险行为等级</td><td colspan=\"3\">未知</td></tr>";

                }





                if (data[0].fjfl != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">分级分类</td><td colspan=\"3\" >" + data[0].fjfl + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">分级分类</td><td colspan=\"3\" >未知</td>";

                }

                if (data[0].fsfs != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">访视方式</td><td colspan=\"3\" >" + data[0].fsfs + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">访视方式</td><td colspan=\"3\">无</td></tr>";

                }    if (data[0].fsdx != "") {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">访视对象</td><td colspan=\"3\" >" + data[0].fsdx + "</td>";

                } else {
                    str1 += "<tr><td width=\"90\" style=\"color:#999999;\">访视对象</td><td colspan=\"3\" >无</td>";

                }

                if (data[0].sfjgmc != "" ) {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">随访机构名称</td><td colspan=\"3\" >" + data[0].sfjgmc + "</td></tr>";
                } else {
                    str1 += " <td width=\"90\" style=\"color:#999999;\">随访机构名称</td><td colspan=\"3\">无</td></tr>";

                }
                str1 += "</table>";

                $("#tsrq4").html(str1);
                footerChangeDetail();
            }
        })
    }

</script>
</html>