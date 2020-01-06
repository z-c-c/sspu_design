<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name id="name"></name>
    <%@include file="/wwpt/common/w_include_header.jsp"%>
   <script result="text/javascript" src="../js/my_scrollbar.js"></script>
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
        .eventContent{
            display: block;
            height: 35px;
            /* margin-left: 23px; */
            color: rgba(0, 0, 0, 0.65);
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 410px;
        }

    </style>
    <script result="text/javascript">
        $(function(){
            // 输入框控件调用
            vVsub();
            // 弹窗关闭
            $(".kuang i.close").click(function(){
                $(".tanBox").fadeOut();
            })
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

            // 政法类切换
            $(".statusList li").click(function () {
                $(this).addClass("active").siblings().removeClass("active");
            })



        })
        $(window).resize(function () {
            footerChangeDetail();
        })

        var noticeId=GetQueryString("noticeId");
        var noticeObjectId=GetQueryString("noticeObjectId");
        var noticeObjectType=GetQueryString("noticeObjectType");
        var unittag;
        var eventtag;
        var isZdryStr;
        $(function(){
            noticeMsg();
            initEventNotice('unit');
            initEventNotice('person');
            eventList(noticeId)
            if (noticeObjectType=='null'||noticeObjectId=='null'){
                $(".echart1").hide()
            }
        })
        function noticeMsg() {
            $.ajax({
                result: "POST",
                url: "/riskWarningController/findWarningBaseInfoById",
                dataType: "json",
                data:
                    {
                        id:noticeId
                    },
                success:function (result) {
                    if(result.message="success"){
                        var data= result.result;
                        console.log(data)
                        $("#noticeName").text(data.noticeName);
                        $("#noticeName").attr('name',data.noticeName);
                        $("#name").text(data.noticeName)
                        var tags =jQuery.parseJSON(data.warningTags);
                        var tagStr='';
                        for (var t =0;t<tags.length;t++) {
                            tagStr+='<span name="'+tags[t].description+'" style="background: '+tags[t].tagColorCode+'" class="green">'+tags[t].tagName+'</span>';
                        }
                        $("#tags").html(tagStr);
                        if (data.handleStatus=='1'){
                            $(".status").text("开启")
                            $(".status").css("color","#12ce66")
                        }else {
                            $(".status").text("关闭")
                        }
                        var noticeContent='无';
                        if (data.noticeContent&&data.noticeContent!='null'){
                            noticeContent=data.noticeContent;
                        }
                        $(".complaintText").text(noticeContent);
                        var noticeDate='';
                        if (data.noticeDate) {
                            formatDatebox(new Date(data.noticeDate),"-",true);
                        }else {
                            noticeDate='无'
                        }

                        $("#noticeDate").text(noticeDate)
                        $("#warningClassesFirst").text(data.warningClassesFirst)
                        if (data.noticeClasses!=null){
                            $("#noticeClasses").text(data.noticeClasses)
                        } else {
                            $("#noticeClasses").text("无")
                        }

                        $(".adress").text(data.noticeAddr);
                        if (data.noticeLevel=='1'){
                            $("#noticeLevel").text("严重")
                            $("#noticeLevel").css("color","#e18383")

                        }else if (data.noticeLevel=='2') {
                            $("#noticeLevel").text("中等")
                            $("#noticeLevel").css("color","#dfa23d")
                        }else {
                            $("#noticeLevel").text("一般")
                            $("#noticeLevel").css("color","#5fb383")
                        }
                    }
                }
            })
        }


        function initEventNotice(objectType) {
            $("#unitList").html("")
            $("#personList").html("")
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getObjectListByNoticeId",
                dataType:"json",
                data:{
                    noticeId:noticeId,
                    objectType:objectType,
                },
                success:function (result) {
                    console.log(result)
                    var warning=result;
                    if (objectType=='person'){
                        if (warning.length==0){
                            $("#persondiv").hide()
                            $("#a1").hide()
                        } else {
                            $("#a1").show()
                            $("#personTitle").text('关联人员('+warning.length+')')
                            $("#personTitle").append('<a onclick="toWarningPersonList()" style="display: inline-block;float: right">更多</a>')
                            $("#persondiv").show()
                            $("#muludiv").show();
                            if ($("#mulu").text().indexOf("关联人员")==-1)
                                $("#mulu").append('<a href="javascript:;">关联人员</a>')
                        }
                    }else {
                        if (warning.length==0){
                            $("#unitdiv").hide()
                            $("#a1").hide()
                        } else {
                            $("#a1").show()
                            $("#unitdiv").show()
                            $("#muludiv").show();
                            if ($("#mulu").text().indexOf("关联单位")==-1)
                                $("#mulu").append('<a href="javascript:;">关联单位</a>')
                        }

                    }
                    for (var i = 0; i < warning.length; i++) {
                        var str='';

                        if (objectType=='unit'){
                            getTags(warning[i].unitId,'unit');
                            if (!unittag){
                                unittag=''
                            }
                            str = '<div class="pubBlock">\n' +
                                '                        <div class="relatedUnits">'+judgeNull(warning[i].unitName)+'</div>\n' +
                                '                        <div class="label">\n' +unittag+

                                '                        </div>\n' +
                                '                        <div class="text">\n' +
                                '                            <strong>法定代表人：</strong>\n' +
                                '                            <span>'+judgeNull(warning[i].unitLegalPerson)+'</span>\n' +
                                '                        </div>\n' +
                                '                        <div class="text">\n' +
                                '                            <strong>所属行业：</strong>\n' +
                                '                            <span>'+judgeNull(warning[i].unitIndustry)+'</span>\n' +
                                '                        </div>\n' +
                                '                        <div class="text">\n' +
                                '                            <strong>统一社会信用代码：</strong>\n' +
                                '                            <span>'+judgeNull(warning[i].usccCode)+'</span>\n' +
                                '                        </div>\n' +
                                '                        <div class="text">\n' +
                                '                            <strong>注册地址：</strong>\n' +
                                '                            <span>'+judgeNull(warning[i].unitAddr)+'</span>\n' +
                                '                        </div>\n' +
                                '                    </div>';
                            $("#unitList").append(str)
                            if (i==1){//只显示两条
                                break;
                            }

                        } else {
                            isZdry(warning[i].personId);
                            str='<li>\n' +
                                '                                <div class="imgBox">\n' +
                                '                                    <img src="../images/people.png" alt="">\n' +
                                '                                    <p>'+judgeNull(warning[i].personName)+'</p>\n' +
                                '                                </div>\n' +
                                '                                <div class="maskBox">\n';
                            if (isZdryStr=='false'){
                                str+='                                    <a href="javascript:;" onclick="addWwk(\''+warning[i].personId+'\')" class="add">加入维稳库</a>\n';
                            }else {
                                str+='                                    <a href="javascript:;" style="margin-top: 46px">&nbsp;</a>\n';
                            }
                            str+='                                    <a href="javascript:;" style="margin-top: 0px" onclick="addWwk(\''+warning[i].personId+'\')" class="add">查看详情</a>\n'+
                                '                                </div>\n' +
                                '                            </li>';
                            $("#personList").append(str)
                            personStyle();
                        }


                    }
                    footerChangeDetail();
                }
            })
        }
        function personStyle() {
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

        function eventList(noticeId) {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getEvenListByNoticeId",
                dataType:"json",
                data:{
                    noticeId:noticeId,
                },
                success:function (result) {
                    console.log(result)
                    if (result&&result.length>0){//数据聚合为0隐藏
                        $("#sjjh").show()
                    } else {
                        $("#sjjh").hide()
                    }
                    var warning=result;
                    $("#eventTitle").text("数据聚合("+warning.length+")")
                    $("#eventList").html("")
                    var lengthNum=0;
                    if (warning.length>3) {
                        lengthNum=3
                    }else {
                        lengthNum=warning.length;
                    }
                    for (var i = 0; i < lengthNum; i++) {
                        getTags(warning[i].eventId,'event');
                        console.log(eventtag)

                        var str='<dl>\n' +
                            '                            <dd class="pubBlock">\n' +
                            '                                <p name="'+warning[i].eventName+'" class="con" style="height: 35px">'+warning[i].eventName+'</p>\n' +
                            '                                <span name="'+judgeNull(warning[i].eventContent)+'" class="eventContent">'+judgeNull(warning[i].eventContent)+'</span>\n' +
                            '                                <div class="sourceInfo">\n' +
                            '                                    <strong style="margin-left: 0px">\n' +
                            '                                        <b>来源</b>\n' +
                            '                                        <span>'+warning[i].eventSource+'</span>\n' +
                            '                                    </strong>\n' +
                            '                                </div>\n' +
                            '                                <div class="label">\n' +eventtag+
                            '                                </div>\n' +
                            '                            </dd>\n' +
                            '                        </dl>';
                        $("#eventList").append(str)
                    }
                    footerChangeDetail();
                }

            })
        }

        function quanping() {
            openNewWindow("/wwpt/riskwarning/warningRelationList.jsp?objectId="+noticeObjectId+"&&objectType="+noticeObjectType+"&&flag=show")
        }
        function isZdry(personId) {
            $.ajax({
                result:"POST",
                url:"/personManager/isZdry",
                dataType:"text",
                data:{
                    personId:personId,
                },
                async:false,
                success:function (result) {
                    isZdryStr=result;
                }
            });
        }

        function addWwk(id) {
            getPersonInfo(id)
        }

        function getPersonInfo(personId) {
            $("#personId").val(personId);
            getWwkById(personId);
            $.ajax({
                result:"POST",
                url:"/personManager/getPersonById",
                dataType:"json",
                data:{
                    personId:personId,
                },
                success:function (result) {
                    console.log(result)
                    var warning=result.personById;
                    $("#personName").val(warning.personName);
                    $("#gender").val(warning.gender);
                    $("#personDocuNumber").val(warning.personDocuNum);
                    $("#nationality").val(warning.nationality);
                    $("#nativePlace").val(warning.nativePlace);
                    $("#phoneNum").val(warning.phoneNum);
                    $("#liveStreet").val(warning.liveStreet);
                    $("#neighborhood").val(warning.neighborhood);
                    $("#livePlace").val(warning.livePlace);
                    getTags(warning.personId,'person');
                }
            })
        }

        function save() {
            console.log(document.body.scrollHeight)
            $.messager.confirm({
                width: 380,
                height: 160,
                name: '操作确认',
                msg: '是否加入维稳库？',
                ok: "是", cancel: "否",
                fn: function (r) {
                    if (r) {
                        var personId = $("#personId").val();
                        var putReason = $("#putReason").val();
                        var personName = $("#personName").val();

                        $.ajax({
                            result:"POST",
                            url:"/personManager/addWwk",
                            dataType:"text",
                            data:{
                                personId:personId,
                                putReason:putReason,
                                personName:personName,
                            },
                            success:function (result) {
                                if (result=='success'){
                                    $('.tanBox').fadeOut()
                                    initEventNotice('person');
                                }

                            }
                        });
                    }
                }
            });

        }
        function getWwkById(id) {
            $.ajax({
                result:"POST",
                url:"/personManager/getWwkById",
                dataType:"json",
                data:{
                    personId:id,
                },
                success:function (result) {
                    if (result.result){
                        $("#putReason").val(result.result.putReason);
                        $("#putReason").attr("disabled",true)
                        $("#saveBtn").hide()
                        $("#quxiao").css('margin-left','-40px')
                    }else {
                        $("#saveBtn").show()
                        $("#putReason").attr("disabled",false)
                        $("#quxiao").css('margin-left','10px')
                    }
                    $(".tanBox").show();

                }
            });
        }
        function toWarningUnitList() {
            openNewWindow("warningUnitList.jsp?noticeId="+noticeId)
        }
        function toWarningPersonList() {
            openNewWindow("warningPersonList.jsp?noticeId="+noticeId)
        }
        function towarningEventsPage(){
            openNewWindow('warningEventsList.jsp?noticeId='+noticeId);

        }
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
                            <p class="con line1" id="noticeName"></p>
                            <div class="label" id="tags">
                            </div>
                        </div>
                        <div class="pg-status v-fr">
                            <div>
                                <p class="status-text">状态</p>
                                <p class="status"></p>
                            </div>
                            <!-- 已评估图 -->
                            <i></i>
                        </div>
                    </div>
                    <p class="complaintText"></p>
                    <table border="0" class="tableSty">
                        <tr>
                            <td width="90" class="tdColor">预警时间</td>
                            <td width="350" id="noticeDate"></td>
                            <td width="90" class="tdColor" width="90">预警级别</td>
                            <td id="noticeLevel"></td>
                        </tr>
                        <tr>
                            <td width="90" class="tdColor">预警大类</td>
                            <td width="350" id="warningClassesFirst"></td>
                            <td  class="tdColor" width="90">预警小类</td>
                            <td  id="noticeClasses"></td>
                        </tr>
                        <tr>
                            <td width="90" class="tdColor">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点</td>
                            <td colspan="3" class="adress"></td>
                        </tr>


                    </table>
                    <div class="catalogue" id="muludiv" style="display: none">
                        <span class="v-fl">目录</span>
                        <div class="v-fl" id="mulu">
                            <%--<a href="javascript:;">1、关联单位</a>--%>
                            <%--<a href="javascript:;">2、关联人员</a>--%>
                        </div>
                    </div>
                </div>
                <div class="contentWrap">
                    <div class="bear-tit bear-tit2 point" id="a1">
                        <h5>关联信息</h5>
                    </div>

                    <div class="infoBox-l-item infoBox-l-item3" id="unitdiv">
                        <div class="sub-tit mt-24 point" id="a3">
                            <h4>关联单位<a onclick="toWarningUnitList()" style="display: inline-block;float: right">更多</a></h4>
                        </div>
                        <div id="unitList">

                        </div>

                    </div>
                    <div class="infoBox-l-item infoBox-l-item4" id="persondiv">
                        <div class="sub-tit mt-24 point" id="a4">
                            <h4 id="personTitle">关联人员（0）</h4>
                        </div>
                        <div class="peopleBox">
                            <ul id="personList">

                            </ul>
                        </div>
                        <div class="arrowBox">
                            <a href="javascript:;" class="next"></a>
                            <a href="javascript:;" class="prev"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="infoBox-r">
                <div class="pubBlock echart1">
                    <div class="checkBox">
                        <a onclick="quanping()" href="javascript:;" class="screenAll v-fr">全屏</a>
                    </div>
                    <div class="echartsBox1">
                        <iframe id="graphFrame" src="warningRelationList.jsp?objectId=${param.noticeObjectId}&&objectType=${param.noticeObjectType}" style="width: 100%;height: 230px;border: 0;overflow: hidden;"></iframe>
                    </div>
                </div>
                <div class="infoBox-r-item2">
                    <div class="bear-tit bear-tit2 m-25" id="sjjh">
                        <h5 id="eventTitle">数据聚合（0）</h5>
                        <a href="javascript:;" onclick="towarningEventsPage()">更多>></a>
                    </div>
                    <div class="r-item2-con">
                        <div class="dataList dataList2" id="eventList">

                        </div>
                    </div>
                </div>

                <!-- 隐藏模块 -->
                <div class="anchor fixed visi">
                    <div class="anchorTop">
                        <div class="anchorBox" id="scrollbar01">
                            <div class="listBox">
                                <dl class="anchorList">
                                    <dd class="dt" id="a1_id">
                                        <a href="#a1">1 关联信息</a>
                                    </dd>

                                    <dd class="dd" id="a3_id">
                                        <a href="#a3">1.1 关联单位</a>
                                    </dd>
                                    <dd class="dd" id="a4_id">
                                        <a href="#a4">1.2 关联人员</a>
                                    </dd>

                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="btnGroup">
                        <a href="javascript:;" class="listBtn"></a>
                        <a href="javascript:;" class="topBtn"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tanBox" style="display: none">
        <div class="pubBlock kuang" style="height: 450px">
            <i class="close">×</i>
            <div class="bear-tit">
                <h5>新增</h5>
            </div>
            <div class="titleCon">
                <div class="baseTable">
                    <table border="0">
                        <tr>
                            <td width="20%" class="center">姓名：</td>
                            <td width="30%">
                                <input disabled id="personName" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                            <td width="20%" class="center">性别：</td>
                            <td width="30%">
                                <input disabled id="gender" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="center">证件号：</td>
                            <td width="30%">
                                <input  disabled id="personDocuNumber"  class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                            <td width="20%" class="center">国籍：</td>
                            <td width="30%">
                                <input disabled id="nationality" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="center">籍贯：</td>
                            <td width="30%">
                                <input disabled id="nativePlace" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                            <td width="20%" class="center">手机：</td>
                            <td width="30%">
                                <input disabled id="phoneNum" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="center">数据来源：</td>
                            <td width="30%">
                                <input disabled id="dataSource" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                            <td width="20%" class="center">所属街道：</td>
                            <td width="30%">
                                <input disabled id="liveStreet" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" class="center">居委：</td>
                            <td width="30%">
                                <input disabled id="neighborhood" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                            <td width="20%" class="center">地址：</td>
                            <td width="30%">
                                <input  disabled id="livePlace" class="vV-ipt" result="text" value="">
                                <i class="clearBtn"></i>
                            </td>
                        </tr>
                        <tr>
                            <td class="center">加入维稳库原因：</td>
                            <td colspan="3">
                                <textarea id="putReason" class="vV-area w-400 m8"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="60" align="right">
                                <button id="saveBtn" style="margin-right: 10px" class="alertBtn" onclick="save()">保存</button>
                            </td>
                            <td colspan="2" height="60" align="letf">
                                <button id="quxiao" onclick="javascript:$('.tanBox').fadeOut();" class="alertBtn" onclick="save()" style="background-color: red;margin-left: 10px">取消</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div  class="footerBox" style="display: none"></div>
</body>
</html>