<%@ taglib prefix="apptag" uri="app_tags" %>
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
    <script result="text/javascript" src="../js/easyui-lang-zh_CN.js" ></script>

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



            jeDate("#yujing", {
                theme: { bgcolor: "#00A1CB", pnColor: "#00CCFF" },
                format: "YYYY-MM-DD",
                multiPane: false,
                range: " 至 "
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

            // 高级搜索

            $(".advancedSearch").click(function(){
                if(searchonOff){
                    $(this).html("收起工具");
                    $(this).addClass("active");
                    $(".advanceBox").addClass("active");
                    $(".advanceBox").animate({"height":"228px"},100);
                }else{
                    $(this).html("高级搜索");
                    $(this).removeClass("active");
                    $(".advanceBox").removeClass("active");
                    $(".advanceBox").animate({"height":"70px"},100);
                }
                searchonOff = !searchonOff;
            })
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
        function searchList(flag,page) {
            if (!searchonOff) {
                $(".advancedSearch").click();
            }
            $(".labelCloseBtn").click();
            eventList(flag,page);
        }
        $(".clearBtn").click(function(){
            $(this).prev().val("");
        })


    </script>
</head>
<body>
<input id="warningid" result="hidden">


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
                        <div class="inpBox">
                            <input id="keyWord" result="text" placeholder="请输入关键字">
                        </div>
                        <button class="btn1" onclick="searchList(true,1)">搜索</button>
                        <button class="btn2" onclick="chongzhi()">重置</button>
                        <a href="javascript:;" class="advancedSearch">高级搜索</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>处理状态：</span>
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:245px;height:28px;"
                                         id="searchHandleStatus" name="wwJdName" dictId="FXDC_CLZT"/>
                            <span>预警等级：</span>
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:245px;height:28px;"
                                         id="searchNoticeLeave" name="wwJdName" dictId="FXDC_YJDJ"/>

                        </div>

                        <div>

                            <span>预警大类：</span>
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:245px;height:28px;"
                                         id="searchNoticeClassFirst" name="wwJdName" dictId="WTQD_MDLB"/>
                            <span>预警小类：</span>
                            <select class="vV-drop w-246" style="width:245px;height:28px;"
                                    id="noticeClass" name="wwJdName">
                                <option>请选择</option>
                            </select>

                        </div>

                        <div>
                            <span>预警日期：</span>
                            <div class="jeinpbox">
                                <input result="text" class="vV-ipt date jeinput w-246" id="yujing" placeholder="请选择">
                            </div>

                        </div>
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
                        <apptag:dict result="tagDiv" clazz="tabName" id="tag" name="tag" dictId="TAG_MODULE"
                                     defVal="TAG_LABLE_PEOPLE"/>

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
                <ul class="statusList v-fl" style="width: 400px">
                    <li onclick="statusSearch('all')" class="active">全部</li>
                    <li onclick="statusSearch('1')" id="dqyj">当前预警</li>
                    <li onclick="statusSearch('0')" id="lsyj">历史预警</li>
                </ul>
                <div class="sortList v-fr">
                    <a href="javascript:;" class="sort sortMethod" id="">排序方式</a>
                    <div class="sortDown sortText">
                        <p id="noticeLevel">按预警等级</p>
                        <p id="noticeDate">按预警时间</p>
                    </div>
                </div>
            </div>
            <div class="searchCon">
                <ul id="contentUl">

                </ul>
            </div>
            <div id="pagination" class="pagination"></div>
        </div>
    </div>

    <div class="fx-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>预警情况</h5>
            </div>
            <div class="assessBox">
                <div class="item item1">
                    <i></i>
                    <p id="kaiqiNum" class="num">0个</p>
                    <p class="name">当前预警</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p id="guanbiNum" class="num">0个</p>
                    <p class="name">历史预警</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tanBox" style="display: none">
    <div class="pubBlock kuang" style="height: 400px">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>新增</h5>
        </div>
        <div class="titleCon">
            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="20%" class="center">预警名称：</td>
                        <td width="30%">
                            <input id="addNoticeName" class="vV-ipt" result="text" value="">
                            <i class="clearBtn"></i>
                        </td>
                        <td class="center">预警等级：</td>
                        <td>
                            <ul class="vV-tabs" id="addNoticeLevelOption">
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">预警大类：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:200px;height:28px;"
                                         id="addNoticeClassesFirst" name="wwJdName" dictId="WTQD_MDLB"/>
                        </td>
                        <td width="20%" class="center">预警小类：</td>
                        <td width="30%">
                            <select id="addNoticeClasses" class="vV-drop w-246" style="width:200px;height:28px;"></select>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">处理状态：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:200px;height:28px;"
                                         id="addNoticeHandleStatues" name="wwJdName" dictId="FXDC_CLZT"/>
                        </td>

                    </tr>
                    <tr>
                        <td class="center">预警内容：</td>
                        <td colspan="3">
                            <textarea id="addNoticeContent" class="vV-area w-400 m8"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="60" align="right">
                            <button style="margin-right: 10px" class="alertBtn" onclick="save()">保存</button>
                        </td>
                        <td colspan="2" height="60" align="letf">
                            <button onclick="javascript:$('.tanBox').fadeOut();" class="alertBtn" onclick="save()" style="background-color: red;margin-left: 10px">取消</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 小导航 -->
<div class="y-selectbox">
    <div  onclick="topage('sjhj.jsp')" class="y-selectbox-item y-selectbox-item_sty1">
        <div class="y-selectbox-item-img1"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos1">数据汇聚</div>
    </div>
    <div onclick="topage('warningMap.jsp')" class="y-selectbox-item y-selectbox-item_sty2">
        <div class="y-selectbox-item-img2"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos2">态势分析</div>
    </div>
    <div class="y-selectbox-item y-selectbox-item_sty3">
        <div class="y-selectbox-item-img3"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos3">预警列表</div>
    </div>
</div>
<script result="text/javascript">
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
        eventList(true,1);
        getWarningStatusNum();
        // rightEventNotice(11)
        // rightEventNotice();
        // getSearchTags();
        initNoticeLevelOption()
        $('#addNoticeClassesFirst').change(function (e) {
            console.log($(this).val())
            changeSecondClasses($(this).val(),null,'addNoticeClasses')
        })
        $('#searchNoticeClassFirst').change(function (e) {
            console.log($(this).val())
            changeSecondClasses($(this).val(),null,'noticeClass')
        })
    });
    function initNoticeLevelOption() {
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionaries",
            dataType:'json',
            data:{
                dictId:'FXDC_YJDJ'
            },
            success:function (result) {
                for (var i=0;i<result.length;i++){
                    var str=' <li id="'+result[i].code+'">'+result[i].name+'</li>';
                    $("#addNoticeLevelOption").append(str);
                }
                $(".vV-tabs").children().click(function(){
                    $(this).addClass("act")
                        .siblings().removeClass("act");
                });
            }
        });
    }
    //小类变化
    function changeSecondClasses(id,value,e) {
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionaries",
            dataType:'json',
            data:{
                dictId:id
            },
            success:function (result) {
                $("#"+e).empty();
                $("#"+e).append('<option value="">请选择</option>')
                for (var i = 0; i < result.length; i++) {
                    var str='<option value="'+result[i].dictPK.id+'">'+result[i].name+'</option>';
                    $("#"+e).append(str)
                }
                if (value){
                    $("#"+e).val(value);
                }

            }
        })
    }
    function eventList(flag,page,status){
        $(".statusList li").removeClass("active")
        $(".statusList li").eq(0).addClass("active")
        $("#contentUl").html("")
        var data={};
        var tags = '';
        $(".labelAll span strong").each(function(){tags+=$(this).text()+','})
        if (tags){
            tags=tags.substring(0,tags.length-1);
            data.tagName=tags;
        }
        var startTime;
        var endTime;
        var yujing=$("#yujing").val();
        if (yujing){
            yujing=yujing.trim();
            var arr=yujing.split("至");
            startTime = arr[0].replace(" ", "");
            endTime=arr[1].replace(" ", "");
        }
        if (startTime){
            startTime = startTime+" 00:00:00";
            data.startTime=startTime;

        }
        if (endTime){
            endTime = endTime+" 23:59:59";
            data.endTime=endTime;
        }
        var noticeClass = $("#noticeClass").find("option:selected").text()
        if (noticeClass!='请选择'){
            data.noticeClass=noticeClass;
        }
        var searchNoticeClassFirst = $("#searchNoticeClassFirst").find("option:selected").text()
        if (searchNoticeClassFirst!='请选择'){
            data.warningClassesFirst=searchNoticeClassFirst;
        }
        var noticeName = $("#noticeName").val();
        if (noticeName){
            data.noticeName=noticeName;
        }
        var noticeLeave =$("#searchNoticeLeave").val();

        if (noticeLeave) {
            data.noticeLevel=noticeLeave;
        }
        if (status){
            data.handleStatus=status;
        } else {
            var searchHandleStatus=$("#searchHandleStatus").val()

            if (searchHandleStatus) {
                data.handleStatus=searchHandleStatus;
            }
        }

        var noticeContent = $("#noticeContent").val();
        if (noticeContent){
            data.noticeContent=noticeContent;
        }
        data.page=page;
        data.pageSize = 5;
        var sortName=$(".sortMethod").attr("id");
        if (sortName){
            data.sortName=sortName;
            data.sortType='desc';
        }
        data.searchKey = $("#keyWord").val();
        data.objectType='warning';
        data.districtCode='310104';

        $("#contentUl").mLoading("show");
        var starDate = new Date()
        var timerl=window.setTimeout(function () {
            $.ajax({
                result:"POST",
                url:"/esSearch/searchKey",
                // url:"/riskWarningController/getRiskWarningList",
                dataType:"json",
                data:data,
                success:function (result) {
                    console.log(result)
                    if (flag) {
                        // 分页
                        var pageTotal;
                        if (result.data.totalElements<=5){
                            pageTotal=1;
                        } else {
                            pageTotal=Math.ceil(result.data.totalElements/5);
                        }
                        $("#totle").text(result.data.totalElements)
                        //if (result.data.totalElements>0){
                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //必填,总页数
                                pageAmount: 5,  //每页多少条
                                dataTotal: result.data.totalElements, //总共多少条数据
                                curPage: 1, //初始页码,不填默认为1
                                pageSize: 5, //分页个数,不填默认为5
                                showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                                showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                                getPage: function (page) {
                                    //获取当前页数
                                    eventList(false,page);
                                }
                            });
                     //   }

                    }
                    loadContent(result.data.content);
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
            // var unixTimestamp = new Date(data[i].noticeDate);
            // var time = unixTimestamp.toLocaleString().replace(/\//g, "-");
            getEvents(data[i].noticeId);

            var tagStr='';
            var leavestr='';
            var tags =data[i].warningTags;
            if (tags){
                for (var t =0;t<tags.length;t++) {
                    tagStr+='<span name="'+tags[t].description+'" style="background: '+tags[t].tagColorCode+'" class="green">'+tags[t].tagName+'</span>';
                }
            }
            var noticeContent='暂无';
            if(data[i].noticeContent&&data[i].noticeContent!='null'){
                noticeContent=data[i].noticeContent;
            }
            var str = '<li>\n' +
                '                            <div class="pubBox waitPG">\n';
            if (data[i].noticeLevel=='1'){
                leavestr="严重";
                str+='                                <i style="background:url(../../images/icon-red.png) no-repeat;" class="icon">\n';
            } else if (data[i].noticeLevel=='2') {
                leavestr="中等";
                str+='                                <i style="background:url(../../images/icon-orange.png) no-repeat;" class="icon">\n';
            }else {
                leavestr="一般";
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
                '                                        <span>'+judgeNull(data[i].noticeDate)+'</span>\n' +
                '                                    </div>\n' +
                '                                    <div class="item">\n' +
                '                                        <i></i>\n' +
                '                                        <span style="cursor: pointer" onclick="towarningEventsPage(\''+data[i].noticeId+'\')">数据聚合（'+num+'）</span>\n' +
                '                                    </div>\n' +
                '                                    <div style="position: absolute" class="item">\n';
            if (data[i].handleStatus=="1"){
                str+='                                        预警开关&nbsp;&nbsp;<div id="'+data[i].noticeId+'" onclick="changeStatus(\''+data[i].noticeId+'\',\''+data[i].handleStatus+'\')" class="vV-slider"></div>' ;
            } else {
                str+='                                        预警开关&nbsp;&nbsp;<div id="'+data[i].noticeId+'" onclick="changeStatus(\''+data[i].noticeId+'\',\''+data[i].handleStatus+'\')" class="vV-slider off"></div>' ;
            }

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
                // '                                            <p onclick="changeStatus(\''+data[i].noticeId+'\',\''+data[i].handleStatus+'\')">'+warningStatus+'</p>\n' +
                '                               </div>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                            </div>\n' +
                '                        </li>';


            $("#contentUl").append(str);
        }



        // rightEventNotice(noticeIds) //临时注释
        }
    }
    function getEvents(noticeId) {
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getEvenListByNoticeId",
            dataType:"json",
            data:{
                noticeId:noticeId,
            },
            async:false,
            success:function (result) {
                num=result.length;
            }
        })

    }
    function updateEvent(id) {
        $("#warningid").val(id);
        $('.tanBox').show();
        showMsg()
    }
    function changeStatus(id,val) {
        if ($("#"+id).hasClass("off")){
            val='1';
        }else {
            val='0';
        }
        $.ajax({
            result:"POST",
            url:"/riskWarningController/updateRiskWarning",
            dataType:"text",
            data:{
                noticeId:id,
                handleStatus:val
            },
            success:function (result) {

                // if (val=="0"&&$("#dqyj").hasClass("active")){
                //     $("#dqyj").click()
                //     $("#dqyj").addClass("active").siblings().removeClass("active");
                // }else if (val=="1"&&$("#lsyj").hasClass("active")) {
                //     $("#lsyj").click()
                //     $("#lsyj").addClass("active").siblings().removeClass("active");
                // }

                // eventList(true,1);
            }
        })
    }

    function showMsg() {
        var id = $("#warningid").val();
        $.ajax({
            result: "POST",
            url: "/riskWarningController/findWarningBaseInfoById",
            dataType: "json",
            data:
                {
                    id:id
                },
            success:function (result) {
                if(result.message="success"){
                    var event= result.result;
                    $("#addNoticeName").val(event.noticeName);
                    onchangeFlag=false;
                    changeSecondClasses(event.warningClassesFirstCode,event.warningClassesSecondCode,'addNoticeClasses')
                    $("#addNoticeClassesFirst").val(event.warningClassesFirstCode);
                    $("#addNoticeHandleStatues").val(event.handleStatus);
                    $("#addNoticeLevelOption li").each(function () {
                        if ($(this).attr("id")==event.noticeLevel) {
                            $(this).addClass("act");
                        }else {
                            $(this).removeClass("act");
                        }
                    })
                    $("#addNoticeContent").val(event.noticeContent);
                }
            }
        })
    }

    function save() {
        var eventEarlyWarningBo={};
        eventEarlyWarningBo.noticeName=$("#addNoticeName").val();


        if ($("#addNoticeClasses").val()){
            eventEarlyWarningBo.noticeClasses=$("#addNoticeClasses").find("option:selected").text();
            eventEarlyWarningBo.warningClassesSecondCode=$("#addNoticeClasses").val();
        }
        if ($("#addNoticeClassesFirst").val()){
            eventEarlyWarningBo.warningClassesFirst=$("#addNoticeClassesFirst").find("option:selected").text();
            eventEarlyWarningBo.warningClassesFirstCode=$("#addNoticeClassesFirst").val();
        }
        if ($("#addNoticeHandleStatues").val()){
            eventEarlyWarningBo.handleStatus=$("#addNoticeHandleStatues").val();
        }
        $("#addNoticeLevelOption li").each(function () {
            if ($(this).attr("class")=='act') {
                eventEarlyWarningBo.noticeLevel=$(this).attr("id")
            }
        })
        eventEarlyWarningBo.noticeContent=$("#addNoticeContent").val();
        eventEarlyWarningBo.noticeId=$("#warningid").val();
        $.ajax({
            result:"POST",
            url:"/riskWarningController/updateRiskWarning",
            dataType:"text",
            data:eventEarlyWarningBo,
            success:function (result) {
                $(".tanBox").fadeOut();
                eventList(true,1)
            }
        })

    }
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
                        result:"POST",
                        url:"/riskWarningController/delWarningBaseInfo",
                        dataType:"text",
                        data:{
                            noticeId:noticeId
                        },
                        success:function (result) {
                            eventList(true,1)
                        }
                    });
                }
            }
        });

    }
    function getWarningStatusNum() {
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getWarningStatusNum",
            dataType:"json",
            success:function (result) {
                $("#kaiqiNum").text(result.kaiqi)
                $("#guanbiNum").text(result.guanbi)
            }
        })
    }
    function rightEventNotice(noticeId) {
        var starDate = new Date()
        var timerl=window.setTimeout(function () {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getEvenListByNoticeId_LSSY",
                dataType:"json",
                data:{
                    noticeId:noticeId,
                },
                success:function (result) {
                    var warning=result;
                    $("#rightTotle").text("");
                    $("#dataList").empty();
                    $("#rightTotle").text("数据聚合（"+warning.length+"）")
                    if (result&&result.length==0){
                        $(".dataBox").addClass("zwsj");
                    }else {
                        $(".dataBox").removeClass("zwsj");
                        for (var i = 0; i < warning.length; i++) {
                            getTags(warning[i].eventId,'event');
                            var source=warning[i].eventSource;
                            if (!source){
                                source='无';
                            }
                            var str = '';
                            str='<dl>\n' +
                                '                        <dt>\n' +
                                '                            <span name="'+judgeNull(warning[i].eventName)+'" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">'+judgeNull(warning[i].eventName)+'</span>\n' +
                                '                            <i class="new"></i>\n' +
                                '                        </dt>\n' +
                                '                        <dd>\n' +
                                '                            <p name="'+judgeNull(warning[i].eventContent)+'" class="con" ">'+judgeNull(warning[i].eventContent)+'</p>\n' +
                                '                            <div class="sourceInfo">\n' +
                                '                                <strong style="margin-left:0px">\n' +
                                '                                    <b>来源</b>\n' +
                                '                                    <span>'+source+'</span>\n' +
                                '                                </strong>\n' +
                                '                                <em>'+formatDatebox(new Date(warning[i].occuredTime),"-",true)+'</em>\n' +
                                '                            </div>\n' +
                                '                        </dd>\n' +
                                '                    </dl>';
                            $("#dataList").append(str)
                        }
                    }

                }
            })
            $("#dataList").mLoading("hide");
            window.clearTimeout(timerl)
        },new Date()-starDate)
    }

    function statusSearch(e) {
        if (e!='all'){
            eventList(true,1,e)
        } else{
            eventList(true,1,null)
        }
    }
    function chongzhi() {
        $("#noticeClass").html('<option>请选择</option>');
        $("#searchNoticeClassFirst").val("");
        $("#searchNoticeLeave").val("");
        $("#searchHandleStatus").val("");
        $(".drop a").removeClass("act");
        $("#noticeName").val("");
        $("#noticeContent").val("");
        $("#yujing").val("");
        $("#keyWord").val("");
        $(".labelAll .labelClose").click();
        eventList(true,1);
    }

    function todetail(id,result,objectId) {
        openNewWindow('/wwpt/riskwarning/warningDetail.jsp?noticeId='+id+"&&noticeObjectType="+result+"&&noticeObjectId="+objectId);
    }

    function towarningEventsPage(id){
        if (id){
            openNewWindow('warningEventsList.jsp?noticeId='+id);
        } else {
            openNewWindow('warningEventsList.jsp?noticeId='+noticeIds);
        }


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