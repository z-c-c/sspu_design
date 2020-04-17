<%@ taglib prefix="tag" uri="object_tag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html class="html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>

    <%@include file="/wwpt/common/w_include_header.jsp"%>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript" src="../js/warningUtil.js" ></script>

      <style result="text/css">
        .windowBtn{
            background-color: #2c9beb;
            border: solid 1px #2c9beb;
            color: #fff;
            margin-right: 8px;
            display: inline-block;
            width: 60px;
            height: 25px;
            border-radius: 4px;
        }
        .vV-slider.off:before{
            left: 21px;
        }
        .vV-slider.off{
            background-color: #999;
        }
        .vV-slider{
            display: inline-block;
            position: relative;
            width: 40px;
            height: 20px;
            background-color: #12ce66;
            border-radius: 20px;
            cursor: pointer;
            vertical-align: middle;
            -webkit-transition: all .5s;
            transition: all .5s;
        }
        .vV-slider:before{
            display: block;
            content: "";
            position: absolute;
            top: 1px;
            left: 1px;
            width: 18px;
            height: 18px;
            background-color: #fff;
            border-radius: 18px;
            -webkit-transition: all .5s;
            transition: all .5s;
        }
        .labelLine{
            height: 26px;
            text-align: right;
            width: 600px;
            /*white-space: nowrap;*/
            /* text-overflow: ellipsis; */
            overflow: hidden;
            word-break: break-all;
        }
        .zwsj{
            background: url('/wwpt/images/zwsj.png') no-repeat center;
        }
        .tabCon > div.tabConSon2{
            height: 180px;
            position: relative;
            overflow: hidden;
        }
    </style>
    <script result="text/javascript">
        $(function () {

            jeDate("#noticeDate", {
                theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
                format: "YYYY-MM-DD hh:mm:ss",
                zIndex: 3000,
            });
            tagfind();
            $(".tabConSon2").perfectScrollbar();
            // 输入框控件调用
            vVsub();

            //隐藏列表框
            $("body").click(function () {
                $(".fuzzyData").fadeOut();
            });

            //移入移出效果
            $(".spanItem").hover(function () {
                $(this).css('background-color', '#dbf1fc');
            }, function () {
                $(this).css('background-color', 'white');
            });


            //项点击
            var labelArr = [];
            var labelAllH = 0;
            var labelTop = 0;
            $(".spanItem").on("click", function () {
                var textCon = $(this).text();
                if (labelArr.indexOf(textCon) != -1) {
                    return
                }
                labelArr.push(textCon);
                // 隐藏输入框
                $(".fuzzyBox").css("display", "none");
                // $("#txt1").val(textCOn);
                $(".labelAll").prepend('<span>\n' +
                    '                <strong>' + textCon + '</strong>\n' +
                    '                <i class="labelClose">×</i>\n' +
                    '            </span>');
                clickHandle();
                eventList(true,1)
                $(".labelCloseBtn").click()
            });
            $(".tabCon .span").on("click", function () {
                var textHtml = $(this).html();
                if (labelArr.indexOf(textHtml) != -1) {
                    return
                }
                labelArr.push(textHtml);
                $(".fuzzyBox").css("display", "none");
                //清空输入框
                $("#txt1").val("");
                $("#txt1").keyup();

                $(".labelAll").prepend('<span>\n' +
                    '                        <strong>' + textHtml + '</strong>\n' +
                    '                        <i class="labelClose">×</i>\n' +
                    '                    </span>');
                clickHandle();
                eventList(true,1)
                $(".labelCloseBtn").click()
            });
            // 标签删除
            $('.labelAll').on("click", ".labelClose", function () {
                var removeStr = $(this).parent().find("strong").text();
                removeByValue(labelArr, removeStr);
                $(this).parent().remove();
                clickHandle();
                eventList(true,1)
                $(".labelCloseBtn").click()
            });

        })

    </script>
    <script result="text/javascript">
        var searchonOff = true;
        $(function(){
            // 小导航
            $(".y-selectbox-item").hover(function() {
                $(this).children(".y-selectbox-item-name").show(200);
            }, function() {
                $(this).children(".y-selectbox-item-name").hide(200);
            })
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

            $("#date01").jeDate({
                isinitVal: false,
                festival: false,
                ishmsVal: false,
                minDate: '2016-06-16 23:59:59',
                maxDate: $.nowDate(0),
                format: "YYYY-MM-DD",
                zIndex: 3000,
            })
            $("#date02").jeDate({
                isinitVal: false,
                festival: false,
                ishmsVal: false,
                minDate: '2016-06-16 23:59:59',
                maxDate: $.nowDate(0),
                format: "YYYY-MM-DD",
                zIndex: 3000,
            })
            $("#date03").jeDate({
                isinitVal: false,
                festival: false,
                ishmsVal: false,
                minDate: '2016-06-16 23:59:59',
                maxDate: $.nowDate(0),
                format: "YYYY-MM-DD",
                zIndex: 3000,
            });

            // 排序方式
            $(".statusList li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
            })
            var sortflag=true;
            var sortHtml = "";
            $(".sortMethod").click(function(){
                if (sortflag){
                    $(".sortText").slideDown();
                }else {
                    $(".sortText").slideUp();
                }
                sortflag=!sortflag;
            });
            $(".sortText p").click(function(){
                $(this).parent().slideUp();
                sortHtml = $(this).html();
                $(".sortMethod").html(sortHtml);
                $(".sortMethod").attr("id",$(this).attr("id"));
                eventList(true,1);
                sortflag=!sortflag;
            });


            // 弹窗关闭
            $(".kuang i.close").click(function(){
                $(".tanBox").fadeOut();
            })
            // 弹框滚动条
            $(".titleCon").perfectScrollbar();
        })


    </script>
</head>
<body>
<input id="warningid" type="hidden">


<div class="index-main">
    <div class="fx-left" style="right: 15px;">
        <div class="searchBox">
            <div class="bear-tit">
                <h5>查询条件</h5>
            </div>
            <div class="searchWrap">
                <!-- 高级搜索 -->
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox">
                            <input id="keyWord" type="text" placeholder="预警名称/预警对象名称"
                                   onkeypress="if(event.keyCode==13){eventList(true,1,'')}">
                        </div>
                        <button class="btn1" onclick="eventList(true,1,'')">搜索</button>
                        <button class="btn2" onclick="chongzhi()">重置</button>
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
                                    <input class="vV-ipt w-200" id="txt1" result="text" value=""  placeholder="请输入标签关键字" autocomplete="off">

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
                    <span>
                        为您找到到相关结果
                        <strong id="totle">0</strong>
                        项
                    </span>

            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" style="width: 400px" id="objectType">
                    <li onclick="eventList(true,1,'')" class="active">全部</li>
                    <li onclick="eventList(true,1,'event')">事件预警</li>
                    <li onclick="eventList(true,1,'unit')">单位预警</li>
                    <li onclick="eventList(true,1,'person')">人员预警</li>
                </ul>
                <%--                <div class="sortList v-fr">--%>
                <%--                    <a href="javascript:;" class="sort sortMethod" id="">排序方式</a>--%>
                <%--                    <div class="sortDown sortText">--%>
                <%--                        <p id="noticeLevel">按预警等级</p>--%>
                <%--                        <p id="noticeDate">按预警时间</p>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
            <div class="searchCon">
                <ul id="contentUl">

                </ul>
            </div>
            <div id="pagination" class="pagination"></div>
        </div>
    </div>
</div>


<div class="tanBox" id="addEvent" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>修改预警</h5>
        </div>
        <div class="titleCon" style="height: 330px;">
            <div class="baseTable">
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>基本信息</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">预警名称</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="noticeName" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">预警时间</td>
                        <td width="30%">
                            <input id="noticeDate" class="vV-ipt date w-246 Time" type="text" value=""
                                   placeholder="请选择时间"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">预警内容</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="noticeContent"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">预警等级</td>
                        <td width="30%">
                            <select class="vV-drop" id="noticeLevel" style="width: 200px;">
                                <option value="4" selected>严重</option>
                                <option value="3">较严重</option>
                                <option value="2">一般</option>
                                <option value="1">轻度</option>
                            </select>
                        </td>
                        <td width="20%" class="center">预警对象类型</td>
                        <td width="30%">
                            <select class="vV-drop" id="noticeObjectType" style="width: 200px;" disabled="true">
                                <option value="event" selected>事件预警</option>
                                <option value="person">人员预警</option>
                                <option value="unit">单位预警</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">预警对象名称</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;height: 30px;"
                                      id="noticeObjectName" readonly></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0" style="width: 700px;">
                    <tr id="update">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        f
    </div>
</div>
<!-- 小导航 -->
<%--<div class="y-selectbox">
    <div onclick="topage('warningMap.jsp')" class="y-selectbox-item y-selectbox-item_sty2">
        <div class="y-selectbox-item-img2"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos2">态势分析</div>
    </div>
    <div class="y-selectbox-item y-selectbox-item_sty3">
        <div class="y-selectbox-item-img3"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos3">预警列表</div>
    </div>
</div>--%>
<script type="text/javascript">
    function topage(jsp) {
        location_href("/wwpt/riskwarning/"+jsp);
    }


    var num;
    var sethover;
    var noticeIds='';
    var labelArr = [];
    var labelAllH = 0;
    var labelTop = 0;
    var eventtag='';
    var onchangeFlag=true;
    $(function () {
        eventList(true, 1, '');

    });


    function eventList(flag, page, noticeObjectType) {

        $("#contentUl").html("")
        var data={};
        var tags = '';
        $(".labelAll span strong").each(function(){tags+=$(this).text()+','})
        if (tags){
            tags=tags.substring(0,tags.length-1);
            data.tagName=tags;
        }
        data.noticeName = $("#keyWord").val();
        data.noticeObjectType = noticeObjectType;
        data.tags = tags;
        data.page=page;
        data.pageSize = 5;


        $("#contentUl").mLoading("show");
        var starDate = new Date()
        var timerl=window.setTimeout(function () {
            $.ajax({
                type: "POST",
                url: "/warnings/find",
                dataType:"json",
                data:data,
                success:function (result) {
                    $("#totle").text(result.data.total);
                    if (flag) {
                        // 分页
                        var pageTotal;
                        if (result.data.total <= 5) {
                            pageTotal=1;
                        } else {
                            pageTotal = Math.ceil(result.data.total / 5);
                        }
                        $("#totle").text(result.data.totalElements)

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
                                    //获取当前页数
                                    eventList(false, page, noticeObjectType);
                                }
                            });


                    }
                    loadContent(result.data.data);
                    // 操作下拉
                    var dropSort = true;
                    $(".searchCon ul li .sort").click(function(){
                        if(dropSort){
                            $(this).next().fadeIn();
                        }else{
                            $(this).next().fadeOut();
                        }
                        dropSort = !dropSort;
                    })
                    $(".sortDown2 p").click(function(){
                        $(this).parent().fadeOut();
                        dropSort = !dropSort;
                    })
                    $(".sortDown").mouseleave(function(){
                        $(this).fadeOut(200);
                        dropSort = !dropSort;
                    });
                    //slider
                    $(".vV-slider:not(.dis)").click(function(){
                        $(this).toggleClass("off");
                    });

                }
            })
            $("#contentUl").mLoading("hide");
            window.clearTimeout(timerl)
        },new Date()-starDate)

    }
    function  loadContent(data) {
        noticeIds='';
        if (data.length == 0) {
           var  str1="<img src=\"../images/noImage.png\" style=\"margin-left: 400px;\">";
            $("#contentUl").append(str1);
        }
        else{
        for (var i = 0;i<data.length;i++){
            if (i==data.length-1){
                noticeIds+=data[i].noticeId
            } else {
                noticeIds+=data[i].noticeId+",";
            }

            // getEvents(data[i].noticeId);

            var tagStr='';
            var leavestr='';
            var tags = JSON.parse(data[i].warningTags);
            if (tags){
                for (var t =0;t<tags.length;t++) {
                    tagStr += '<span name="' + tags[t].tagName + '" style="background: ' + tags[t].tagCssCode.color + '" class="green">' + tags[t].tagName + '</span>';
                }
            }
            var noticeContent='暂无';
            if(data[i].noticeContent&&data[i].noticeContent!='null'){
                noticeContent=data[i].noticeContent;
            }
            var str = '<li>\n' +
                '                            <div class="pubBox waitPG">\n';
            if (data[i].noticeLevel == '4') {
                leavestr="严重";
                str+='                                <i style="background:url(../../images/icon-red.png) no-repeat;" class="icon">\n';
            } else if (data[i].noticeLevel == '3') {
                leavestr = "较严重";
                str += '                                <i style="background:url(../../images/icon-orange.png) no-repeat;" class="icon">\n';
            } else if (data[i].noticeLevel == '2') {
                leavestr = "一般";
                str += '                                <i style="background:url(../../images/icon-green.png) no-repeat;" class="icon">\n';
            }else {
                leavestr = "轻度";
                str+='                                <i style="background:url(../../images/icon-green.png) no-repeat;" class="icon">\n';
            }

            str+='                                    <span>'+leavestr+'</span>\n' +
                '                                </i>\n' +
                // '                                            <p style="cursor: pointer" class="proName" onclick="todetail(\''+data[i].noticeId+'\')">'+data[i].noticeName+'</p>\n' +
                '                                            <p style="cursor: pointer" class="proName" onclick="todetail(\''+data[i].noticeId+'\',\''+data[i].noticeObjectType+'\',\''+data[i].noticeObjectId+'\')">'+data[i].noticeName+'</p>\n' +
                '                                <p style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" name="'+noticeContent+'" class="proInfo">'+noticeContent+'</p>\n' +
                '                                <div class="infoBox">\n' +
                '                                    <div class="item" style="width: 175px">\n' +
                '                                        <i></i>\n' +
                '                                        <span>' + judgeNull(new Date(data[i].noticeDate).format("yyyy-MM-dd hh:mm:ss")) + '</span>\n' +
                '                                    </div>\n' +
                '                                    <div class="item">\n' +
                '                                        <i></i>\n' +
                '                                        <span style="cursor: pointer">预警类型：' + judgeNull(data[i].noticeType) + '</span>\n' +
                '                                    </div>\n' +
                '                                    <div class="item">\n' +
                '                                        <i></i>\n' +
                '                                        <span style="cursor: pointer">预警对象：' + judgeNull(data[i].noticeObjectName) + '</span>\n' +
                '                                    </div>\n' +
                '                                    <div style="position: absolute" class="item">\n';

            str+='                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="labelBox labelLine" style="height: 26px">\n' +tagStr+
                '                                </div>\n' +
                '                                <div class="btnGroup">\n' +
                '                                    <div class="sortList sortList2 v-fr">\n' +
                '                                        <a href="javascript:;" class="sort">操作</a>\n' +
                '                                        <div class="sortDown sortDown2">\n' +
                '                                            <p onclick="todetail(\''+data[i].noticeId+'\',\''+data[i].noticeObjectType+'\',\''+data[i].noticeObjectId+'\')">详情</p>\n' +
                '                                            <p onclick="updateEvent(\''+data[i].noticeId+'\')">修改</p>\n' +
                '                                            <p onclick="conFrimDel(\''+data[i].noticeId+'\')">删除</p>\n' +
                '                               </div>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                            </div>\n' +
                '                        </li>';


            $("#contentUl").append(str);
        }
        }
    }

    function updateEvent(id) {
        $("#warningid").val(id);
        showMsg()
        $('.tanBox').show();
    }


    function showMsg() {
        var id = $("#warningid").val();
        $.ajax({
            type: "GET",
            url: "/warnings/" + id,
            dataType: "json",
            success:function (result) {
                if(result.message="success"){
                    var warning = result.data;
                    $("#warningid").val(warning.noticeId);
                    $("#noticeName").val(warning.noticeName);
                    $("#noticeDate").val(new Date(warning.noticeDate).format("yyyy-MM-dd hh:mm:ss"));
                    $("#noticeContent").val(warning.noticeContent);
                    $("#noticeLevel").val(warning.noticeLevel);
                    $("#noticeObjectType").val(warning.noticeObjectType);
                    $("#noticeObjectName").val(warning.noticeObjectName);
                }
            }
        })
    }

    function save() {
        var data = {};
        data.noticeId = $("#warningid").val();
        data.noticeName = $("#noticeName").val();
        data.noticeDate = parserDate($("#noticeDate").val());
        data.noticeContent = $("#noticeContent").val();
        data.noticeLevel = $("#noticeLevel").val();
        $.ajax({
            type: 'post',
            url: '/warnings/save',
            dataType: 'json',
            data: data,
            success:function (result) {
                if (result.message == 'success') {
                    $('.tanBox').hide();
                    successOperator();
                    eventList(true, 1, '');
                }
            }
        })
    }

    function successOperator() {
        $.messager.alert("操作提示", "操作成功!");
    }

    var parserDate = function (date) {
        var t = Date.parse(date);
        if (!isNaN(t)) {
            return new Date(Date.parse(date.replace(/-/g, "/")));
        } else {
            return new Date();
        }
    };
    function conFrimDel(noticeId){
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r){
                    $.ajax({
                        type: "post",
                        url: "/warnings/del",
                        data: {
                            noticeId: noticeId
                        },
                        dataType: "json",
                        success: function (result) {
                            successOperator();
                            eventList(true, 1, '');
                        }
                    });
                }
            }
        });

    }

    function chongzhi() {

        $(".drop a").removeClass("act");
        $("#noticeName").val("");
        $("#noticeContent").val("");
        $("#keyWord").val("");
        $(".labelAll .labelClose").click();

        $("#objectType").find("li").removeClass("active");
        $("#objectType").find("li").eq(0).addClass("active");
        eventList(true, 1, '');
    }

    function todetail(id,result,objectId) {
        openNewWindow('/wwpt/riskwarning/warningDetail.jsp?noticeId=' + id);
    }


    function clickHandle(){
        labelAllH = $(".labelAll").outerHeight(true);
        if(labelAllH == "76"){
            $(".searchWrap").css({"height":"200px"});
            $(".labelDown").css("top","84px");
        }else if(labelAllH == "114"){
            $(".searchWrap").css({"height":"240px"});
            $(".labelDown").css("top","124px");
        }else{
            $(".searchWrap").css({"height":"152px"});
            $(".labelDown").css("top","44px");
        }
    }
</script>
</body>
</html>