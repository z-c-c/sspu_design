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
    <script result="text/javascript" src="../js/my_scrollbar.js"></script>
    <script result="text/javascript" src="../js/bootstrap-select.min.js"></script>
    <script result="text/javascript" src="../js/bootstrap.min.js"></script>
    <script result="text/javascript" src="../js/getParameter.js"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style result="text/css">
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
                        <td width="90" class="tdColor">时间：</td>
                        <td width="350" id="occuredTime"></td>

                        <td width="90" class="tdColor">地点：</td>
                        <td class="green" id="adress"></td>
                    </tr>
                    <tr>
                        <td class="tdColor">甲方：</td>
                        <td width="260" id="wwDsrA"></td>

                        <td width="90" class="tdColor">乙方：</td>
                        <td  id="wwDsrB"> </td>
                    </tr>
                    <tr>
                        <td class="tdColor">矛盾类别：</td>
                        <td width="260" id="wwMdlb"></td>

                        <td width="90" class="tdColor">矛盾级别：</td>
                        <td class="green" id="wwMdjb" style="color: black"> </td>
                    </tr>
                    <tr>
                        <td class="tdColor">涉及人数：</td>
                        <td id="wwSjrs"></td>
                        <td class="tdColor">涉及领域：</td>
                        <td id="wwSjly"> </td>
                    </tr>
                    <tr>
                        <td class="tdColor">协办部门：</td>
                        <td id="wwZrbmXb"></td>
                        <td class="tdColor">所属街道：</td>
                        <td id="wwJdName" class="tdColor"  style="color: black"> </td>
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
                        <h4>关联单位</h4>
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
                        <h4>处理日志</h4>

                    </div>
                    <div class="countBox">
                        <div class="count">
                            <i></i>
                            <p>处理总数</p>
                            <strong id="handleLogCount">0</strong>
                        </div>
                        <div class="clearfix countInfo">
                            <div class="item clearfix">
                                <span class="v-fl">召开会议</span>
                                <strong class="v-fr" id="metting">0</strong>
                            </div>
                            <div class="item clearfix">
                                <span class="v-fl">人员聚集</span>
                                <strong class="v-fr" id="personAssemble">0</strong>
                            </div>
                            <div class="item clearfix">
                                <span class="v-fl">日常处置</span>
                                <strong class="v-fr" id="daily">0</strong>
                            </div>
                            <div class="item clearfix">
                                <span class="v-fl">集访人次</span>
                                <strong class="v-fr" id="personNumber">0</strong>
                            </div>
                        </div>
                    </div>
                    <div class="con mt-40" >
                        <ul class="historyList mt-10" id="handleLogList">
                            <li>
                                <div class="dataList dataList2">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="infoBox-l-item infoBox-l-item6" id="leaderBox">
                    <div class="sub-tit mt-24 point" id="a6">
                        <h4>领导批示（<span id="leaderCount">0</span>）</h4>
                    </div>
                    <div>
                        <ul class="historyList mt-10" id="leaderList">
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
<div class="tanBox"   id = "addInInfluent" style="display: none">
    <div class="pubBlock kuang">
        <i class="close"  onclick="javascript:$('#addInInfluent').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>加入维稳库</h5>
        </div>
        <div class="titleCon">
            <div class="">
                <table border="0">
                    <tr  id="alwayshide"> <input result="hidden" id="personId"></tr>
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
                        <td width="20%" class="center">人员类别：</td>
                        <td width="30%">
                            <select id="addofpersonType" name="personType" class="selectpicker"  style="width:220px;height:28px;" multiple data-live-search="true">
                                <option>药物滥用人员</option>
                                <option>社区矫正人员</option>
                                <option>刑满释放人员</option>
                                <option>严重精神障碍者</option>
                                <option>重点青少年</option>
                                <option>涉邪人员</option>
                                <option>信访人员</option>
                                <option>涉军重点人员</option>
                                <option>涉金融类投资受损人员</option>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">录入原因：</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" id="putReason" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">操作人：</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value=""  id="putUserId">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">入库时间：</td>
                        <td width="30%">
                            <input id="putDate" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">

                        </td>
                    </tr>
                    <tr>
                        <td class="center">标签联动：</td>
                        <td colspan="3">
                            <div id="treeBox">
                                <input class="focusEl" result="text"  id="addLabel" placeholder="请选择">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                            </div>
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
        initLeader();
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

        jeDate("#putDate", {
            theme: { bgcolor: "#00A1CB", pnColor: "#00CCFF" },
            format: "YYYY-MM-DD",
            multiPane: true,
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

        openNewWindow("eventRelationList.jsp?objectId="+enentId+"&&objectType=event&&flag=show");
    }
    function eventRelation() {
        $("#relationIframe").html("<iframe id=\"graphFrame\" src=\"eventRelationList.jsp?objectId="+enentId+"&&objectType=event\"  style=\"width: 100%;height: 210px;border: 0;overflow: hidden;\"></iframe>")
    }
    function findIndex(id){
        openNewWindow ('../person/personDetail.jsp?paId='+id+'') ;
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
            result:"POST",
            url:"/objectTagManager/getObjectTag",
            dataType:"json",
            data:{
                objectId:eventid
            },
            success:function (result) {
                if(result.message=="success"){
                    var tags=result.objectTag;
                    $("#eventTags").empty();
                    for (var i = 0; i <tags.length ; i++) {
                        var color=tags[i].tagCssCode.split(":");
                        var colorcode = color[1].substring(1,(color[1].length-2));
                        $("#eventTags").append('<span  style="cursor: pointer;background-color:'+colorcode+'">'+tags[i].tagName+'</span>');
                    }
                }
            }
        });
    }
    function initEvent() {
        $.ajax({
            result: "POST",
            url: "/eventManager/findEventBaseInfoById",
            dataType: "json",
            data: {
                eventType: "contradictionEvent",
                eventId: enentId
            },
            success: function (result) {
                var eventById=result.eventById;
                var contradictionEventById=result.contradictionEventById;

                var eventName=eventById.eventName;
                if(eventName==null||eventName.trim().length==0){
                    eventName="无";
                }
                document.name=eventName;
                var eventStatus=contradictionEventById.wwSfhj;
                if(eventStatus=="1"){
                    eventStatus="已化解";
                }else {
                    eventStatus="未化解";
                }
                var eventContent=eventById.eventContent;
                if(eventContent==null||eventContent.trim().length==0){
                    eventContent="无";
                }
                var occuredTime=new Date(eventById.occuredTime).format("yyyy-MM-dd hh:mm:ss")
                if(eventById.occuredTime==null){
                    occuredTime="无";
                }
                var occuredPlace=eventById.occuredPlace;
                if(occuredPlace==null||occuredPlace.trim().length==0){
                    occuredPlace="无";
                }
                var wwDsrA=contradictionEventById.wwDsrA;
                if(wwDsrA==null||wwDsrA.trim().length==0){
                    wwDsrA="无";
                }
                var wwDsrB=contradictionEventById.wwDsrB;
                if(wwDsrB==null||wwDsrB.trim().length==0){
                    wwDsrB="无";
                }
                var wwMdlb=contradictionEventById.wwMdlb;
                if(wwMdlb==null||wwMdlb.trim().length==0){
                    wwMdlb="无";
                }
                var wwMdjb=contradictionEventById.wwMdjb;
                if(wwMdjb==null||wwMdjb.trim().length==0){
                    wwMdjb="无";
                }
                var wwSjrs=contradictionEventById.wwSjrs;
                if(wwSjrs==null||wwSjrs.trim().length==0){
                    wwSjrs="无";
                }
                var wwSjly=contradictionEventById.wwSjly;
                if(wwSjly==null||wwSjly.trim().length==0){
                    wwSjly="无";
                }

                var wwZrbmXb=contradictionEventById.wwZrbmXb;
                if(wwZrbmXb==null||wwZrbmXb.trim().length==0){
                    wwZrbmXb="无";
                }

                var wwJdName=contradictionEventById.wwJdName;
                if(wwJdName==null||wwJdName.trim().length==0){
                    wwJdName="无";
                }

                $("#eventName").text(eventName);
                $("#eventStatus").text(eventStatus);
                $("#eventContent").text(eventContent);
                $("#occuredTime").text(occuredTime);
                $("#occuredPlace").text(occuredPlace);
                $("#wwDsrA").text(wwDsrA);
                $("#wwDsrB").text(wwDsrB);
                $("#wwMdjb").text(wwMdjb)
                $("#wwMdlb").text(wwMdlb);
                $("#wwSjrs").text(wwSjrs);
                $("#wwSjly").text(wwSjly)
                $("#wwZrbmXb").text(wwZrbmXb);
                $("#wwJdName").text(wwJdName)
            }
        })
    }

    function dataTogether() {
        $.ajax({
            result: "post",
            url: "/eventManager/dataTogetherWithPage",
            dataType: "json",
            data:{
                eventId:enentId,
                page:1,
                pageSize:5
            },
            success:function (result) {
                var list= result.dataTogether;
                var count=result.count;
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
                    var eventName= list[i].EVENT_NAME;
                    if(eventName==null||eventName.trim().length==0){
                        eventName="无";
                    }
                    var eventContent=list[i].EVENT_CONTENT;
                    if(eventContent==null||eventContent.trim().length==0){
                        eventContent="无";
                    }
                    var eventSource=list[i].EVENT_SOURCE;
                    if(eventSource==null||eventSource.trim().length==0){
                        eventSource="无";
                    }
                    var stCreateTime=new Date(list[i].ST_CREATE_TIME).format("yyyy-MM-dd hh:mm:ss");
                    if(stCreateTime==null){
                        stCreateTime="无";
                    }
                    getTags(list[i].EVENT_ID);
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
            result: "POST",
            url: "/eventManager/listEventRelationObject",
            dataType: "json",
            async: false,
            data: {
                eventId: enentId,
                objectType: "person",
            },
            success: function (result) {

                if(result.message=="success"){
                    var relationObject=result.relationObject;
                    $("#linkPeople").empty();
                    $("#linkPeopleCount").text(result.count)
                    if(relationObject.length==0){
                        $("#linkPeopleBox").hide();
                        $("#linkPerson").hide();
                    }
                    relationCount+=relationObject.length;
                    if(relationCount<=6){
                        $("#arrowBox").hide();
                    }
                    for (var i = 0; i < relationObject.length; i++) {
                        var personName=relationObject[i].personName;
                        if(personName==null||personName.trim().length==0){
                            personName="无";
                        }
                        $("#linkPeople").append(' <li>\n' +
                            '                            <div class="imgBox">\n' +
                            '                                <img src="../images/icon-person.jpg" alt="">\n' +
                            '                                <p>'+relationObject[i].personName+'</p>\n' +
                            '                            </div>\n' +
                            '                            <div class="maskBox">\n' +
                            '                                <a onclick="addInInfluent(\''+relationObject[i].personId+'\')" class="add">加入维稳库</a>\n' +
                            '                                <a onclick="findIndex(\''+relationObject[i].personId+'\')" class="detail">查看详情</a>\n' +
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
            result: "POST",
            url: "/eventManager/listEventRelationObject",
            dataType: "json",
            async: false,
            data: {
                eventId: enentId,
                objectType: "unit",
            },
            success: function (result) {

                if (result.message == "success") {
                    var relationObject = result.relationObject;
                    $("#linkUnit").empty();
                    $("#linkUnit").append(' <div class="sub-tit mt-24 point" id="a3">\n' +
                        '                                <h4>关联单位</h4>\n' +
                        '                                </div>');
                    if(relationObject.length==0){
                        $("#linkUnit").hide();
                    }
                    relationCount+=relationObject.length;
                    for (var i = 0; i < relationObject.length; i++) {

                        getTags(relationObject[i].unitId);
                        if (!unittag){
                            unittag=''
                        }

                        var unitName=relationObject[i].unitName;
                        if(unitName==null||unitName.trim().length==0){
                            unitName="无";
                        }
                        var unitLegalPerson=relationObject[i].unitLegalPerson;
                        if(unitLegalPerson==null||unitLegalPerson.trim().length==0){
                            unitLegalPerson="无";
                        }
                        var unitIndustry=relationObject[i].unitIndustry;
                        if(unitIndustry==null||unitIndustry.trim().length==0){
                            unitIndustry="无";
                        }
                        var usccCode=relationObject[i].usccCode;
                        if(usccCode==null||usccCode.trim().length==0){
                            usccCode="无";
                        }
                        var registerAddr=relationObject[i].registerAddr;
                        if(registerAddr==null||registerAddr.trim().length==0){
                            registerAddr="无";
                        }
                        var unitAddr=relationObject[i].unitAddr;
                        if(unitAddr==null||unitAddr.trim().length==0){
                            unitAddr="无";
                        }

                        $("#linkUnit").append('  <div class="pubBlock">\n' +
                            '                                <div class="relatedUnits">'+unitName+'</div>\n' +
                            '                                <div class="label" id="labels">\n' +unittag+
                            '                                </div>\n' +
                            '                                <div class="text">\n' +
                            '                                <strong>法定代言人：</strong>\n' +
                            '                            <span>'+unitLegalPerson+'</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>所属行业：</strong>\n' +
                            '                            <span>'+unitIndustry+'</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>统一社会信用代码：</strong>\n' +
                            '                            <span>'+usccCode+'</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text">\n' +
                            '                                <strong>注册地址：</strong>\n' +
                            '                            <span>'+registerAddr+'</span>\n' +
                            '                            </div>\n' +
                            '                            <div class="text text2 clearfix">\n' +
                            '                                <strong>单位地址：</strong>\n' +
                            '                            <span>'+unitAddr+'</span>\n' +
                            '                            </div>\n' +
                            '                            </div>');
                    }
                }
            }
        })
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
                        str+='<span style="background: '+tags[i].tagColorCode+'" class="green">'+tags[i].tagName+'</span>';
                    }
                }
                unittag=str;
            }
        });
    }
    function initHandleLog() {
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/listEventHandleLog",
            dataType: "json",
            async:false,
            data: {
                eventId: enentId,
                result:"0"
            },
            success: function (result) {
                if (result.message == "success") {

                    var metting=0;
                    var personAssemble=0;
                    var daily=0;
                    var personNumber=0;
                    var eventHandleLog = result.eventHandleLog;
                    var handleLogCount=eventHandleLog.length;
                    $("#handleLogList").empty();
                    if(eventHandleLog.length==0){
                        $("#handleLogBox").hide();
                    }
                    handleCount+= eventHandleLog.length;
                    for (var i = 0; i < eventHandleLog.length; i++) {
                        if(eventHandleLog[i].handleJflx=="WTQD_JFLX_THREE"){//召开会议
                            metting++;
                        }
                        if(eventHandleLog[i].handleJflx=="WTQD_JFLX_ONE"){//人员聚集
                            personAssemble++;
                        }
                        if(eventHandleLog[i].handleJflx=="WTQD_JFLX_TWO"){//日常处置
                            daily++;
                        }
                        personNumber=personNumber+Number(eventHandleLog[i].handleJfrs);


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
                        var pgPath=eventHandleLog[i].handleFilepath;
                        var FjName="";
                        debugger
                        if(pgPath==null||pgPath.trim().length==0){
                            pgPath="";
                            FjName='无'
                        }else{
                            FjName=getCaption(eventHandleLog[i].handleFilepath);
                        }
                        $("#handleLogList").append(' <li style="height: auto;padding-bottom: 20px;">\n' +
                            '                                <div class="dataList dataList2">\n' +
                            '                                    <dl>\n' +
                            '                                        <dd>\n' +
                            '                                            <p class="conW">'+handleContent+'</p>\n' +
                            '                                            <div class="sourceInfo">\n' +
                            // '                                                <span class="name">'+handleUser+'</span>\n' +
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
                    $("#metting").text(metting);
                    $("#personAssemble").text(personAssemble);
                    $("#daily").text(daily)
                    $("#personNumber").text(personNumber)
                    footerChangeDetail();
                }
            }
        });

    }
    //截取字符串
    function getCaption(obj){
        return obj.split("@@@@")[1]
    }
    function initLeader() {
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/listEventHandleLog",
            dataType: "json",
            async:false,
            data: {
                eventId: enentId,
                result:"1"
            },
            success: function (result) {
                if (result.message == "success") {

                    var eventHandleLog = result.eventHandleLog;
                    var handleLogCount=eventHandleLog.length;
                    $("#leaderCount").text(eventHandleLog.length);
                    $("#leaderList").empty();
                    if(eventHandleLog.length==0){
                        $("#leaderBox").hide();
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
                        var pgPath=eventHandleLog[i].handleFilepath;
                        var FjName="";
                        if(pgPath==null||pgPath.trim().length==0){
                            pgPath="";
                            FjName='无'
                        }else{
                            FjName=getCaption(eventHandleLog[i].handleFilepath);
                        }
                        $("#leaderList").append('<li style="height:auto ;padding-bottom: 20px;">\n' +
                            '                                <div class="dataList dataList2">\n' +
                            '                                    <dl>\n' +
                            '                                        <dd>\n' +
                            '                                            <p class="conW">'+handleContent+'</p>\n' +
                            '                                            <div class="sourceInfo">\n' +
                            // '                                                <span class="name">'+handleUser+'</span>\n' +
                            '                                                <em>'+handleDate+'</em>\n' +
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
                    footerChangeDetail();
                }

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
    function toEventDataTogether(eventId) {
        openNewWindow("dataTogether.jsp?Type="+eventId+"");
    }

    function addInInfluent(id){
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
                $('#gender').val(data[0].gender);
                $('#personDocuNum').val(data[0].personDocuNum);
                $('#nationality').val(data[0].nationality);
                $('#phoneNum').val(data[0].phoneNum);
                $('#nativePlace').val(data[0].nativePlace);
                $('#dataSource').val(data[0].dataSource);
                $('#liveStreet').val(data[0].liveStreet);
                $('#neighborhood').val(data[0].neighborhood);
                $('#livePlace').val(data[0].livePlace);
            }

        })
        $("#addInInfluent").fadeIn();
    }
    $(function() {
        $(".selectpicker").selectpicker({
            noneSelectedText : '请选择'    //默认显示内容
        });
        $(window).on('load', function() {
            $('.selectpicker').selectpicker('refresh');
        });

    });
    function saveInfluent() {
        var personId = $('#personId').val();
        var personName=$("#personName").val();
        var personUsedName= $('#personUsedName').val();
        //$('#gender').val(data[0].gender);
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

        if($('#addofpersonType').selectpicker('val')==null||$('#addofpersonType').selectpicker('val').trim().length==0){
            var personType="";
        }else{
            var personType=$('#addofpersonType').selectpicker('val').toString();
        }
        var putUserId= $('#putUserId').val();
        var putDate= $('#putDate').val();
        var label= $('#addLabel').val();
        //var personImage= $('#QRCode').attr("src");
        $.ajax({
            url: '/personaffair/addInfluentPersonHaveId',
            result: 'POST',
            dataType: "json",
            data: {
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
                "personType": personType,
                "putUserId": putUserId,
                "putDate": putDate,
                "label": label,
                /*                       "personImage": personImage*/
            },
            success: function (data) {
                if(data==true){
                    $.messager.alert('操作提示',"操作成功");
                }else
                {
                    $.messager.alert('操作提示',"操作失败");
                }
            }
        })
    }
</script>
</html>