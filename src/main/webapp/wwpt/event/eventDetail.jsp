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
    <%@include file="../common/w_include_header.jsp"%>
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
        .dataList dl dd .Zcon{
            width: 100%;
            height: 32px;
            font-size: 14px;
            line-height: 24px;
            color: rgba(0, 0, 0, 0.65);
            margin: 8px 0;
        }

        #eventName::before {
            content: "";
            display: inline-block;
            width: 23px;
            height: 23px;
            background: url(../images/icon-item1.png) no-repeat;
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
                        <p class="con line1" id="eventName" ></p>
                        <div class="label" id="eventTags" >
                        </div>
                    </div>
                    <div class="pg-status v-fr">
                        <div>
                            <p class="status-text">状态</p>
                            <p class="status" id="eventStatus"></p>
                        </div>
                        <!-- 已评估图 -->
                        <i></i>
                    </div>
                </div>
                <p class="complaintText" id="eventContent">
                </p>
                <table border="0" class="tableSty">
                    <tr>
                        <td width="90" class="tdColor">发生时间：</td>
                        <td width="350" id="occurredTime"></td>

                        <td width="90" class="tdColor">发生地点：</td>
                        <td class="adress" id="occurredPlace"></td>
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
                    <h5>关联情况</h5>
                </div>
                <div class="infoBox-l-item infoBox-l-item3" id="linkUnit">
                    <div class="sub-tit mt-24 point" id="a3">
                        <h4>关联单位（<span id="linkUnitCount">0</span>）</h4>
                    </div>
                </div>
                <div class="infoBox-l-item infoBox-l-item4" id="linkPerson">
                    <div class="sub-tit mt-24 point" id="a4">
                        <h4>关联人员（<span id="linkPeopleCount"></span>）</h4>
                    </div>
                    <div class="peopleBox" id="linkPeopleBox">
                        <ul id="linkPeople">
                        </ul>
                    </div>
                    <div class="arrowBox" id="arrowBox">
                        <a href="javascript:;" class="next"></a>
                        <a href="javascript:;" class="prev"></a>
                    </div>
                </div>
                <br>
                <div class="bear-tit bear-tit2 point" id="a2">
                    <h5>处置情况</h5>
                </div>
                <div class="infoBox-l-item infoBox-l-item5" id="handleLogBox">
                    <div class="sub-tit mt-24 point" id="a5">
                        <h4>处理日志(<span id="handleLogCount">0</span>)</h4>

                    </div>
                    <%--  <div class="countBox">
                          <div class="count">

                          </div>
                          <div class="clearfix countInfo">
                              <div class="item clearfix">

                              </div>
                              <div class="item clearfix">

                              </div>
                              <div class="item clearfix">

                              </div>
                              <div class="item clearfix">

                              </div>
                          </div>
                      </div>--%>
                    <div class="con mt-40" >
                        <ul class="historyList mt-10" id="handleLogList">
                            <li>
                                <div class="dataList dataList2">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
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
    var enentId =getParameter("eventId")
    var unittag;
    var relationCount=0;
    var handleCount=0;
    var catalogues=[];

    $(function(){
        initEvent();
        dataTogether();
        initRelationPerson();
        initRelationUnit();
        objectTagList("");
        initHandleLog();
        eventRelation();
        // 输入框控件调用
        vVsub();

        if(relationCount==0){
            $("#a1").hide();
        }else {
            catalogues.push("<a href=\"javascript:;\">"+(catalogues.length+1)+"、关联情况</a>");
        }
        if(handleCount==0){
            $("#a2").hide();
        }else{
            catalogues.push("<a href=\"javascript:;\">"+(catalogues.length+1)+"、处置情况</a>");
        }

        //初始化目录
        $("#ml").empty();
        $("#ml").append(catalogues);
        if((relationCount==0)&&(handleCount==0)){
            $("#catalogue").hide();
        }

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

    $(window).resize(function () {
        footerChangeDetail();
    })
    function quanping() {

        location_href("relationList.jsp?objectId=" + enentId + "&&flag=show", "top");
    }
    function eventRelation() {
        $("#relationIframe").html("<iframe id=\"graphFrame\" src=\"relationList.jsp?objectId=" + enentId + "\"  style=\"width: 100%;height: 210px;border: 0;overflow: hidden;\"></iframe>")
    }
    function findIndex(id){
        openNewWindow('../person/personDetail.jsp?personId=' + id + '', 'top');
    }

    //事件已有标签
    function objectTagList(id) {
        var eventid;
        if(id==""){
            eventid=enentId;
        }else{
            eventid=id;
        }
        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType:"json",
            data:{
                objectId:eventid
            },
            success:function (result) {
                if(result.message=="success"){
                    var tags = result.data;
                    $("#eventTags").empty();
                    for (var i = 0; i <tags.length ; i++) {
                        var color = JSON.parse(tags[i].tagCssCode).color;
                        var colorcode = color[1].substring(1,(color[1].length-2));
                        $("#eventTags").append('<span  style="cursor: pointer;background-color:' + color + '">' + tags[i].tagName + '</span>');
                    }
                }
            }
        });
    }
    function initEvent() {
        $.ajax({
            type: "POST",
            url: "/eventInfo/findById",
            dataType: "json",
            data: {
                eventId: enentId
            },
            success: function (result) {
                console.log(result)
                let event = result.data;
                if (event != null) {
                    document.title = judgeNull(event.eventName);
                var eventStatus = event.isSettlement;
                if (event.isSettlement == "1") {
                    eventStatus = "已化解";
                } else {
                    eventStatus = "未化解";
                }
                $("#eventName").text(judgeNull(event.eventName));
                $("#eventStatus").text(eventStatus);
                $("#eventContent").text(judgeNull(event.eventContent));
                if (event.occurredTime != null) {
                    $("#occurredTime").text(judgeNull(new Date(event.occurredTime).format("yyyy-MM-dd hh:mm:ss")));
                } else {
                    $("#occurredTime").text('暂无');
                }

                $("#occurredPlace").text(judgeNull(event.occurredPlace));
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
            url: "/eventInfo/findDataTogether",
            dataType: "json",
            data:{
                eventId:enentId,
                page:1,
                pageSize:5
            },
            success:function (result) {
                var list = result.data.dataTogether;
                var count = result.data.count;
                $("#dataTogetherCount").text(count);
                $("#dataTogether").empty();
                var length;
                if(list.length>=3){
                    length=3;
                }else{
                    length=list.length;
                }
                if(count==0){
                    $("#dataTogetherBox").hide();
                }
                for (var i = 0; i < length; i++) {
                    var eventName = list[i].eventName;
                    if(eventName==null||eventName.trim().length==0){
                        eventName="无";
                    }
                    var eventContent = list[i].eventContent;
                    if(eventContent==null||eventContent.trim().length==0){
                        eventContent="无";
                    }
                    var eventSource=list[i].EVENT_SOURCE;
                    if(eventSource==null||eventSource.trim().length==0){
                        eventSource="无";
                    }
                    var stCreateTime = new Date(list[i].occurredTime).format("yyyy-MM-dd hh:mm:ss");
                    if (stCreateTime == list[i].occurredTime) {
                        stCreateTime="无";
                    }
                    getTags(list[i].eventId);
                    if (!unittag){
                        unittag=''
                    }
                    $("#dataTogether").append('<dl>\n' +
                        '                                <dd class="pubBlock">\n' +
                        '                                    <p class="con" style="height: 23px; font-size: 17px;white-space: nowrap; text-overflow:ellipsis; overflow: hidden;font-weight: bold">'+eventName+'</p>\n' +
                        '                                    <p class="Zcon" style="margin-left: 0px; white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">'+eventContent+'</p>\n' +
                        '                                    <div class="sourceInfo">\n' +
                        '                                        <strong style="margin-left: 0px;">\n' +
                        '                                            <b>来源</b>\n' +
                        '                                            <span>'+eventSource+'</span>\n' +
                        '                                        </strong>\n' +
                        '                                        <em>'+stCreateTime+'</em>\n' +
                        '                                    </div>\n' +
                        '                                    <div class="label">\n' +unittag+
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

                if(result.message=="success"){
                    var persons = result.data;
                    $("#linkPeople").empty();
                    $("#linkPeopleCount").text(persons.length)
                    if (persons.length == 0) {
                        $("#linkPeopleBox").hide();
                        $("#linkPerson").hide();
                    }
                    relationCount += persons.length;
                    if(relationCount<=6){
                        $("#arrowBox").hide();
                    }
                    for (var i = 0; i < persons.length; i++) {
                        var personName = persons[i].personName;
                        if(personName==null||personName.trim().length==0){
                            personName="无";
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
                }
            }
        });
    }
    function initRelationUnit() {
        $.ajax({
            type: "POST",
            url: "/eventInfo/findEventRelationObject",
            dataType: "json",
            async: false,
            data: {
                eventId: enentId,
                objectType: "unit",
            },
            success: function (result) {
                if (result.message == "success") {
                    var units = result.data;
                    $("#linkUnit").empty();
                    $("#linkUnit").append(' <div class="sub-tit mt-24 point" id="a3">\n' +
                        '                                <h4>关联单位（<span id="linkUnitCount">0</span>）</h4>\n' +
                        '                                </div>');
                    if (units.length == 0) {
                        $("#linkUnit").hide();
                    }
                    $("#linkUnitCount").text(units.length);
                    relationCount += units.length;
                    for (var i = 0; i < units.length; i++) {

                        getTags(units[i].unitId);
                        if (!unittag){
                            unittag=''
                        }

                        let time = units[i].registerTime == null ? "无" : new Date(units[i].registerTime).format("yyyy-MM-dd hh:mm:ss");

                        $("#linkUnit").append('  <div class="pubBlock">\n' +
                            '                                <div class="relatedUnits">' + judgeNull(units[i].unitName) + '</div>\n' +
                            '                                <div class="label" id="labels">\n' +unittag+
                            '                                </div>\n' +
                            '                                <div class="text">\n' +
                            '                                <strong>单位法人：</strong>\n' +
                            '                            <span>' + judgeNull(units[i].unitLegalPerson) + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>所属行业：</strong>\n' +
                            '                            <span>' + judgeNull(units[i].industry) + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>统一社会信用代码：</strong>\n' +
                            '                            <span>' + judgeNull(units[i].usccCode) + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>注册时间：</strong>\n' +
                            '                            <span>' + time + '</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text text2 clearfix">\n' +
                            '                                <strong>单位地址：</strong>\n' +
                            '                            <span class="place">' + judgeNull(units[i].addr) + '</span>\n' +
                            '                            </div>\n' +
                            '                            </div>');
                    }
                }
            }
        })
    }
    function getTags(objectId){
        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType:"json",
            async:false,
            data:{
                objectId:objectId,
            },
            success:function (result) {
                var str='';
                if (result.message=="success"){
                    var tags = result.data;
                    for (var i=0;i<tags.length;i++){
                        var color = JSON.parse(tags[i].tagCssCode).color;
                        str += '<span style="background: ' + color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag=str;
            }
        });
    }
    function initHandleLog() {
        var data = {};
        data.eventId = enentId;
        data.page = 1;
        data.pageSize = 10;
        $.ajax({
            type: "GET",
            url: "/eventInfo/findEventHandleLog",
            dataType: "json",
            async:false,
            data: data,
            success: function (result) {

                if (result.message == "success") {

                    var eventHandleLog = result.data.all;
                    var handleLogCount=eventHandleLog.length;
                    $("#handleLogList").empty();
                    if(eventHandleLog.length==0){
                        $("#handleLogBox").hide();
                    }
                    handleCount+= eventHandleLog.length;
                    for (var i = 0; i < eventHandleLog.length; i++) {

                        var  handleContent=eventHandleLog[i].handleContent;
                        if(handleContent==null||handleContent.trim().length==0){
                            handleContent="无";
                        }
                        var handleUser= eventHandleLog[i].handleUser;
                        if(handleUser==null||handleUser.trim().length==0){
                            handleUser="无";
                        }
                        var handleDate=new Date(eventHandleLog[i].handleDate).format("yyyy-MM-dd hh:mm:ss");
                        if(eventHandleLog[i].handleDate==null){
                            eventHandleLog[i].handleDate="无";
                        }
                        var pgPath = eventHandleLog[i].handleFilePath;
                        var FjName="";
                        if(pgPath==null||pgPath.trim().length==0){
                            pgPath="";
                            FjName='无'
                        }else{
                            FjName = getCaption(eventHandleLog[i].handleFilePath);
                        }
                        $("#handleLogList").append(' <li style="height: auto;padding-bottom: 20px;">\n' +
                            '                                <div class="dataList dataList2">\n' +
                            '                                    <dl>\n' +
                            '                                        <dd>\n' +
                            '                                            <p class="conW">'+handleContent+'</p>\n' +
                            '                                            <div class="sourceInfo">\n' +
                            '                                                <span class="name">' + handleUser + '</span>\n' +
                            '                                                <em style="color: rgba(0, 0, 0, 0.25);">'+handleDate+'</em>\n' +
                            '                                            </div>\n' +
                            // '                                            <div class="appendix">\n' +
                            // '                                                <span>附件1.docx</span>\n' +
                            // '                                                <span>附件2.docx</span>\n' +
                            // '                                                <span>附件3.docx</span>\n' +
                            // '                                            </div>\n' +
                            '                                            <div class="appendix">\n' +
                            '                                                <span onclick="downLoadFj(\''+pgPath+'\')">'+FjName+'</span>\n' +
                            '                                            </div>\n' +
                            '                                        </dd>\n' +
                            '                                    </dl>\n' +
                            '                                </div>\n' +
                            '                            </li>');
                    }

                    $("#handleLogCount").text(handleLogCount);
                    footerChangeDetail();
                }
            }
        });

    }
    //截取字符串
    function getCaption(obj){
        return obj.split("ZCC")[1]
    }

    function downLoadFj(pgPath) {
        console.log(pgPath)
        if(pgPath==""){
            $.messager.alert("操作提示","无附件!");
        }else{
            $('<form id="exportEvent" method="POST" action="/eventInfo/downloadFile" enctype="multipart/form-data" accept-charset="UTF-8">' +
                '<input name="filePath" value="' + pgPath + '"></input></form>').appendTo('body').submit().remove();
        }
    }
    function toEventDataTogether(eventId) {
        openNewWindow("dataTogether.jsp?Type=" + eventId + "", 'top');
    }

    $(function() {
        $(".selectpicker").selectpicker({
            noneSelectedText : '请选择'    //默认显示内容
        });
        $(window).on('load', function() {
            $('.selectpicker').selectpicker('refresh');
        });

    });
</script>
</html>