<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="html">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <%@include file="../common/w_include_header.jsp"%>

    <link rel="stylesheet" href="../css/ol.css">

    <script result="text/javascript" src="../js/echarts.min.js"></script>
    <script result="text/javascript" src="../js/scroll.js"></script>
    <script result="text/javascript" src="../js/ol.js"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript" src="../js/warningUtil.js" ></script>

    <style result="text/css">
        .zwsj{
            background: url('/wwpt/images/zwsj.png') no-repeat center;
        }

    </style>
    <script result="text/javascript">
        $(function () {
            // 全部时间切换
            $(".timeBox ul li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
            })
            // 跟踪预警点击下拉
            $(".tailAfter .item").click(function(){
                $(".y-ditu-sider_sty2").fadeIn();
                $(this).addClass("active").siblings().removeClass("active");
                $(this).find(".itemDown").slideDown();
                $(this).siblings().find(".itemDown").slideUp();
                $(this).find("i").addClass("active");
                $(this).siblings().find("i").removeClass("active");
                $(".itemDown a").click(function(){
                    $(this).addClass("active").siblings().removeClass("active");
                    zdrySearch($(this).attr("id"));
                })
            })

            // 线索洞察切换
            $(".cluesTab li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
                if($(this).index() == 1){
                    $(".cluesTabCon").animate({"left":"-360px"},300);
                    $(".clues .item").removeClass("active");
                    $(".y-ditu-sider").fadeOut();
                }else{
                    $(".cluesTabCon").animate({ "left": "0" }, 300);
                    $(".tailAfter .item").removeClass("active");
                    $(".tailAfter .item").find(".itemDown").slideUp();
                    $(".y-ditu-sider_sty2").fadeOut();


                }
            })


            // 地图侧边2点击样式
            $(".y-ditu-sider_sty2 dd").click(function(){
                $(this).addClass("active").siblings("dd").removeClass("active");
            })

            // 小导航
            $(".y-selectbox-item").hover(function() {
				$(this).children(".y-selectbox-item-name").show(200);
			}, function() {
				$(this).children(".y-selectbox-item-name").hide(200);
			})

        })
    </script>


</head>
<body>
<input result="hidden" id="firstClasses">
<input result="hidden" id="secondClasses">
<input result="hidden" id="noticeLevel">
<input result="hidden" id="starttime">
<input result="hidden" id="endtime">
<input result="hidden" id="zdryType">
<input result="hidden" id="zdry">
<input result="hidden" id="firstClassesCode">
    <div class="index-main">
        <div class="fxdc-left">
            <div class="timeBox">
                <ul>
                    <li onclick="timeSearch('all')" class="active">全部时间段</li>
                    <li onclick="timeSearch('month')">一月内</li>
                    <li onclick="timeSearch('week')">一周内</li>
                </ul>
            </div>
            <div class="bear-block">
                <div class="cluesTabBox">
                    <ul class="cluesTab">
                        <li style="cursor: pointer" onclick="xsdc()" class="active">线索洞察</li>
                        <li style="cursor: pointer" onclick="gzyj()">跟踪预警</li>
                    </ul>
                    <div class="allcluesWrap">
                        <div class="cluesTabCon clearfix">
                            <div class="clues cluesBase v-fl">

                            </div>
                            <div class="tailAfter cluesBase v-fl">
                                <div class="shinkLine">
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                    <em></em>
                                </div>

                                <div class="item item2" id="swzdry_0" onclick="zdrySearch('swzdry_0')">
                                    <span id="swzdry_0Num">0</span>
                                    <p>涉稳重点人员</p>                                  
                                </div>
                                <div class="item item3">
                                    <span id="tsrqNum">0</span>
                                    <p>特殊人群</p>
                                    <i></i>
                                    <div class="itemDown displayNone">
                                        <a href="javascript:;" class="active" id="tsrq">全部</a>
                                        <a href="javascript:;" id="tsrq_0" style="display: flex;">社区矫正对象 <div class="textNum" id="tsrq_0Num">0</div></a>
                                        <a href="javascript:;" id="tsrq_1" style="display: flex;">刑满释放人员 <div class="textNum" id="tsrq_1Num">0</div></a>
                                        <a href="javascript:;" id="tsrq_2" style="display: flex;">重点青少年 <div class="textNum" id="tsrq_2Num">0</div></a>
                                        <a href="javascript:;" id="tsrq_3" style="display: flex;">药物滥用人员 <div class="textNum" id="tsrq_3Num">0</div></a>
                                        <a href="javascript:;" id="tsrq_4" style="display: flex;">严重精神障碍人员 <div class="textNum" id="tsrq_4Num">0</div></a>
                                        <a href="javascript:;" id="tsrq_5" style="display: flex;">涉邪人员 <div class="textNum" id="tsrq_5Num">0</div></a>
                                    </div>
                                </div>
                                <div class="item item4" style="left: 0px">
                                    <span>0</span>
                                    <p>关怀对象</p>
                                    <i></i>
                                    <div class="itemDown displayNone">
                                        <a href="javascript:;">全部</a>
                                        <a href="javascript:;">支内回沪人员  </a>
                                        <a href="javascript:;">涉军人员</a>
                                        <a href="javascript:;">优抚对象</a>
                                        <a href="javascript:;">老年人</a>
                                        <a href="javascript:;">残疾人</a>
                                        <a href="javascript:;">救助人员</a>
                                        <a href="javascript:;">失业人员</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bear-block">
                <div class="bear-tit">
                    <h5>预警消息</h5>
                    <a href="javascript:;" onclick="showMore()">更多>></a>
                </div>
                <div class="warningMess">
                    <div class="warningMessBox">
                        <div class="view">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="fxdc-center">
            <div id="map" class="y-ditu">
				<dl class="y-ditu-sider y-ditu-sider_sty1" style="z-index: 999">

				</dl>

				<dl class="y-ditu-sider y-ditu-sider_sty2" style="z-index: 999;bottom: 0px">
					<dt style="height: ">预警等级</dt>
                    <dd onclick="levelSearch(0)">
                        <div class="y-ditu-slide2-line" style="margin-left: 33px">
                            <div>全部<span id="qb">807</span></div>
                        </div>
                    </dd>
					<dd onclick="levelSearch(1)">
						<div class="y-ditu-slide2-line">
							<img src="/wwpt/images/ditu-icon6.png" class="y-ditu-slide2-img" />
							<div>严重<span id="yz">0</span></div>
						</div>
					</dd>
					<dd onclick="levelSearch(2)">
						<div class="y-ditu-slide2-line">
							<img src="/wwpt/images/ditu-icon7.png" class="y-ditu-slide2-img" />
							<div>中等<span id="zd">0</span></div>
						</div>
					</dd>
					<dd onclick="levelSearch(3)">
						<div class="y-ditu-slide2-line">
							<img src="/wwpt/images/ditu-icon8.png" class="y-ditu-slide2-img" />
							<div>一般<span id="yb">0</span></div>
						</div>
					</dd>
				</dl>
                <div id="popup" style="display:block;z-index: 3000;height: 235px;width:416px;left:-200px;top: -255px" class="ditu-popup2">
                    <a href="#" id="popup-closer" class="mapclose" style="float: right">×</a>
                    <div id="popup-content" class="popup-content"></div>
                </div>
			</div>
        </div>
        <div class="fxdc-right">
            <div class="bear-block">
                <div class="bear-tit">
                    <h5>按街镇排名</h5>
                </div>
                <div class="streetBox" id="streetBox"></div>
            </div>
        </div>
    </div>

    <!-- 小导航 -->
    <div class="y-selectbox">
        <div onclick="topage('sjhj.jsp')" class="y-selectbox-item y-selectbox-item_sty1">
            <div class="y-selectbox-item-img1"></div>
            <div class="y-selectbox-item-name y-selectbox-item-name_pos1">数据汇聚</div>
        </div>
        <div class="y-selectbox-item y-selectbox-item_sty2">
            <div class="y-selectbox-item-img2"></div>
            <div class="y-selectbox-item-name y-selectbox-item-name_pos2">态势分析</div>
        </div>
        <div onclick="topage('warningList.jsp')" class="y-selectbox-item y-selectbox-item_sty3">
            <div class="y-selectbox-item-img3"></div>
            <div class="y-selectbox-item-name y-selectbox-item-name_pos3">预警列表</div>
        </div>
    </div>
</body>

<script result="text/javascript">
    function topage(jsp) {
        location_href("/wwpt/riskwarning/"+jsp);
    }

    $(function () {
        getWarningClasses();

    });

    var points=[];
    function timeSearch(result) {
        if (result=='all'){
            $("#starttime").val("")
            $("#endtime").val("")
        } else if (result=='month'){
            $("#starttime").val(getDate(30))
            $("#endtime").val(formatDatebox(new Date(),"-",true))
        } else {
            $("#starttime").val(getDate(7))
            $("#endtime").val(formatDatebox(new Date(),"-",true))
        }
        getWarningClassesNum();
        getWarningLevelNum();
        getList();
        road()
    }

    function getDate(num) {
        var lw = new Date(new Date() - 1000 * 60 * 60 * 24 * num);//最后一个数字30可改，30天的意思
        var lastY = lw.getFullYear();
        var lastM = lw.getMonth()+1;
        var lastD = lw.getDate();
        var startdate=lastY+"-"+(lastM<10 ? "0" + lastM : lastM)+"-"+(lastD<10 ? "0"+ lastD : lastD);//三十天之前日期
        return startdate+" 00:00:00";
    }
    function getWarningClassesNum() {
        $(".clues .item").each(function () {
            $(this).find("span").text("0")
        })
        var data={
            starttime:$("#starttime").val(),
            endtime:$("#endtime").val(),
        }
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getWarningClassesNum",
            dataType:"json",
            data:data,
            success:function (result) {
                console.log("getWarningClassesNum")
                var sum=0;
                $(".clues .item").each(function () {
                    for (var i=0;i<result.length;i++){
                        if ($(this).find("p").text()==result[i].WARNING_CLASSES_FIRST){
                            $(this).find("span").text(result[i].NUM)
                            sum+=parseInt(result[i].NUM);
                        }
                    }

                })
                $("#all").html(sum)
            }
        });
    }

    function getWarningLevelNum() {
        $("#yz").text("0");
        $("#zd").text("0");
        $("#yb").text("0");
        $("#qb").text("0");
        var data={
            starttime:$("#starttime").val(),
            endtime:$("#endtime").val(),
            noticeClass:$("#secondClasses").val(),
            warningClassesFirst:$("#firstClasses").val(),
            zdryType:$("#zdryType").val(),
            zdry:$("#zdry").val(),
        }
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getWarningLevelNum",
            dataType:"json",
            data:data,
            success:function (result) {
                console.log("getWarningLevelNum")
                var all=0;
                for (var i=0;i<result.length;i++){
                    if (result[i].NOTICE_LEVEL=='1'){
                        $("#yz").text(result[i].NUM);
                    }else if (result[i].NOTICE_LEVEL=='2'){
                        $("#zd").text(result[i].NUM);
                    } else {
                        $("#yb").text(result[i].NUM);
                    }
                    all+=result[i].NUM;
                }
                $("#qb").text(all);
            }
        });
    }

    function getWarningClasses() {
        $(".clues").html("");
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionaries",
            dataType:"json",
            data:{
                dictId:"WTQD_MDLB"
            },
            success:function (result) {
                console.log("getWarningClasses")
                var str='';
                for (var i=0;i<result.length;i++){
                    str += '<div onclick="showSecondClasses(\''+result[i].id+'\',\''+result[i].name+'\')" class="item" id="'+result[i].id+'">\n' +
                        '                                    <span>0</span>\n' +
                        '                                    <p>'+result[i].name+'</p>\n' +
                        '                                </div>';
                }
                str+='<div onclick="allData()" class="item" style="padding-top: 8px">\n' +
                    '                                    <strong id="all">0</strong>\n' +
                    '                                    <strong >全部分类</strong>\n' +
                    '                                </div>';
                $(".clues").html(str);
                getWarningClassesNum();
                getWarningLevelNum();
                getList();
                road()
                // 线索洞察点击子项，地图上显示二级菜单
                $(".clues .item").click(function(){
                    $(this).addClass("active").siblings().removeClass("active");
                })
            }
        });
    }

    function showMore() {
        openNewWindow('warningDataTogether.jsp?firstClassesCode='+$("#firstClassesCode").val());
    }
    function showSecondClasses(id,name) {
        $("#secondClasses").val("");
        $("#firstClasses").val(name);
        $("#firstClassesCode").val(id);
        $(".y-ditu-sider_sty1").html("");
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getSecondClaeeseNum",
            dataType:"json",
            data:{
                firstClassesCode:id
            },
            success:function (result) {
                if (result.length!=0){
                    $(".y-ditu-sider_sty1").fadeIn();
                    var str='<dt>'+name+'</dt>';
                    str+='<dd onclick="searchSecondClasses(\'\')">全部</dd>'
                    for (var i =0;i<result.length;i++){
                        str+='<dd onclick="searchSecondClasses(\''+result[i].name+'\')">'+result[i].name+'<span style="margin-left: 10px;float: right">'+result[i].desc+'</span></dd>'

                    }
                    $(".y-ditu-sider_sty1").html(str);
                    // 地图侧边1点击样式
                    $(".y-ditu-sider_sty1 dd").click(function(){
                        $(this).addClass("js-cur").siblings("dd").removeClass("js-cur")
                    })
                }

            }
        });
        getWarningLevelNum();
        getList()
        road()
    }



    function searchSecondClasses(name) {
        $("#secondClasses").val(name);
        getWarningLevelNum();
        getList();
        road()
    }


    function getZdryNum(zdryType) {
        var data={};
        if (zdryType){
            data.zdryType=zdryType;
        }
        data.zdry='1';
        data.page=1;
        data.rows=5;
        data.handleStatus='1';
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getRiskWarningList",
            dataType:"json",
            data:data,
            success:function (result) {
                var data=result.nopage;
                var num =data.length;
                $("#"+zdryType+"Num").text(num)
            }
        })
    }
    function getList(fitstClassFlag) {
        $("#popup-closer").click();
        $(".view").html("")
        var data={};
        data.noticeClass=$("#secondClasses").val();
        data.warningClassesFirst=$("#firstClasses").val();
        data.noticeLevel=$("#noticeLevel").val();
        if ($("#endtime").val()!=''){
            data.endTime=$("#endtime").val();
        }
        if ($("#starttime").val()!=''){
            data.startTime=$("#starttime").val();
        }
        if ($("#zdryType").val()){
            data.zdryType=$("#zdryType").val();
        }
        if ($("#zdry").val()){
            data.zdry=$("#zdry").val();
        }
        data.page=1;
        data.rows=5;
        data.handleStatus='1';
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getRiskWarningList",
            dataType:"json",
            data:data,
            success:function (result) {

                console.log(result)
                var data=result.nopage;
                var rows = result.nopage;
                if ( data.length==0){
                    $(".warningMessBox").addClass("zwsj");
                }else {
                    $(".warningMessBox").removeClass("zwsj");
                }
                addpoints(rows);
                var datalength =  data.length;
                if (datalength>=5){
                    datalength=5
                }
                var noticeIds='';

                for (var i=0;i<datalength;i++){
                    if (i==datalength-1){
                        noticeIds+=data[i].noticeId;
                    }else {
                        noticeIds+=data[i].noticeId+",";
                    }
                    var noticeLevel='';
                    if (data[i].noticeLevel=='1'){
                        noticeLevel='严重'
                    } else if (data[i].noticeLevel=='2'){
                        noticeLevel='中等'
                    }else {
                        noticeLevel='一般'
                    }
                    var tags =jQuery.parseJSON(data[i].warningTags);
                    var noticeContent='无';
                    if(data[i].noticeContent&&data[i].noticeContent!='null'){
                        noticeContent=data[i].noticeContent;
                    }
                    var tagStr='';
                    if (tags) {
                        for (var t =0;t<tags.length;t++) {
                            tagStr+='<span name="'+tags[t].description+'" style="background: '+tags[t].tagColorCode+'" class="green">'+tags[t].tagName+'</span>';
                        }
                    }
                    var date='';
                    if (judgeNull(data[i].noticeDate!='无')){
                        date=formatDatebox(new Date(data[i].noticeDate),"-",true)
                    }
                    var str='';
                    str+='<dl>\n' +
                        '                                <dt style="height: 25px">\n' +
                        '                                    <a name="'+judgeNull(data[i].noticeName)+'" style="overflow: hidden;display:block;text-overflow:ellipsis;white-space: nowrap;width: 280px" href="javascript:;">'+ judgeNull(data[i].noticeName)+'</a>\n' +
                        '                                    <div class="icon">\n' +
                        '                                        <p>'+noticeLevel+'</p>\n' +
                        '                                        <i class="warning'+data[i].noticeLevel+'"></i>\n' +
                        '                                    </div>\n' +
                        '                                </dt>\n' +
                        '                                <dt name="'+judgeNull(data[i].noticeContent)+'" style="height: 25px;color: rgba(0, 0, 0, 0.65);">'+judgeNull(data[i].noticeContent)+'</dt>\n' +
                        '                                <dd class="time">'+date+'</dd>\n' +
                        '                                <dd>\n' +
                        '                                    <div class="labelBox" style="height: 26px;overflow: hidden;word-break: break-all;width: 300px;">\n' +tagStr+
                        '                                    </div>\n' +
                        '                                </dd>\n' +
                        '                            </dl>';
                    $(".view").append(str)
                }
                if (fitstClassFlag){
                    $("#noticeIds").val(noticeIds);
                }

            }
        });
    }
    function addpoints(rows){
        console.log("addpoints")
        for (var i=0;i<points.length;i++){
            map.removeLayer(points[i])
        }
        var pointfeatures = new Array();
        for (var i=0;i<rows.length;i++){
            var x=rows[i].longi;var y=rows[i].lati;
            var point =  [parseFloat(x),parseFloat(y)];
            var data={

            }
            var locationPointfeature;
            if (rows[i].noticeObjectType=='person'){
                $.ajax({
                    result:"POST",
                    url:"/personManager/getPersonById",
                    dataType:"json",
                    data:{
                        personId:rows[i].noticeObjectId
                    },
                    async:false,
                    success:function (result) {
                        var person = result.personById;
                        locationPointfeature = new ol.Feature({
                            geometry: new ol.geom.Point(point),
                            noticeAddr:rows[i].noticeAddr,
                            noticeContent:rows[i].noticeContent,
                            noticeDate:rows[i].noticeDate,
                            noticeName:rows[i].noticeName,
                            warningTags:rows[i].warningTags,
                            warningClassesFirst:rows[i].warningClassesFirst,
                            noticeClasses:rows[i].noticeClasses,
                            tags:rows[i].warningTags,
                            noticeLevel:noticeLevel,
                            personName:person.personName,
                            gender:person.gender,
                            personDocuNum:person.personDocuNum,
                            nativePlace:person.nativePlace,
                            livePlace:person.livePlace,
                            noticeObjectType:rows[i].noticeObjectType,
                            noticeObjectId:rows[i].noticeObjectId,
                            noticeId:rows[i].noticeId,
                            x:x,
                            y:y,});
                    }
                })
            }else {
                locationPointfeature = new ol.Feature({
                    geometry: new ol.geom.Point(point),
                    noticeAddr:rows[i].noticeAddr,
                    noticeContent:rows[i].noticeContent,
                    noticeId:rows[i].noticeId,
                    noticeDate:rows[i].noticeDate,
                    noticeName:rows[i].noticeName,
                    warningTags:rows[i].warningTags,
                    warningClassesFirst:rows[i].warningClassesFirst,
                    noticeClasses:rows[i].noticeClasses,
                    tags:rows[i].warningTags,
                    noticeLevel:noticeLevel,
                    noticeObjectType:rows[i].noticeObjectType,
                    noticeObjectId:rows[i].noticeObjectId,
                    x:x,
                    y:y,});
            }
            var noticeLevel=rows[i].noticeLevel
            var img ='location_pointR.png';//默认
            if (noticeLevel=='1'){
                img='yzpoint.png'
            } else if (noticeLevel=='2'){
                img='zdpoint.png'
            } else {
                img='ybpoint.png';
            }
            locationPointfeature.setStyle(new ol.style.Style({
                    fill:new ol.style.Fill({
                        color:'rgba(255,255,255,0.2)'
                    }),
                    stroke:new ol.style.Stroke({
                        color:'#ffffff',
                        width:2
                    }),
                    image : new ol.style.Icon({
                        src : '../images/'+img, // 设置Image对象
                        imgSize : [ 30, 40 ], // 及图标大小
                        anchor : [ 0.5, 1 ]
                    }),
                })
            )
            setMapCenter(121.438319,31.135656);
            pointfeatures.push(locationPointfeature);
        }
        locationPointMarker = new ol.layer.Vector({
            source: new ol.source.Vector({
                features:pointfeatures
            })
        });
        points.push(locationPointMarker);
        map.addLayer(locationPointMarker);
        mapClick()
    }
    function todetail(id,result,objectId) {
        openNewWindow('warningDetail.jsp?noticeId='+id+"&&noticeObjectType="+result+"&&noticeObjectId="+objectId);
    }
    function mapClick(){
        map.on('click', function(e) {
            var pixel = map.getEventPixel(e.originalEvent);
            map.forEachFeatureAtPixel(pixel, function(feature, layer) {
                // var coodinate = e.coordinate;

                var property = feature.getProperties();
                var noticeAddr = feature.get('noticeAddr');
                var noticeContent = feature.get('noticeContent');
                if (!noticeContent||noticeContent=='null'){
                    noticeContent='无';
                }

                var noticeDate = feature.get('noticeDate');
                var noticeId = feature.get('noticeId');
                var noticeName = feature.get('noticeName');
                var warningTags = feature.get('warningTags');
                var warningClassesFirst = feature.get('warningClassesFirst');
                var noticeClasses = feature.get('noticeClasses');
                var noticeObjectType = feature.get('noticeObjectType');
                var noticeObjectId = feature.get('noticeObjectId');
                if (!noticeClasses||noticeClasses=='null'){
                    noticeClasses='无';
                }
                var noticeLevel = feature.get('noticeLevel');
                var x = feature.get('x');
                var y = feature.get('y');
                var personName=feature.get("personName")
                console.log(personName)
                var coodinate = [];
                coodinate[0]=x;
                coodinate[1]=y;
                var tags = feature.get('tags');
                tags =jQuery.parseJSON(tags);
                var tagStr='';
                if (tags) {
                    for (var t =0;t<tags.length;t++) {
                        tagStr+='<span name="'+tags[t].description+'" style="background: '+tags[t].tagColorCode+'" class="green">'+tags[t].tagName+'</span>';
                    }
                }

                console.log(coodinate)
                // if(result == typeName){
                var showStr = '<div class="ditu-popup2-arrow"></div>\n' +
                    '    <div class="ditu-popup2-line1" style="width: 348px;\n' +
                    '    overflow: hidden;\n' +
                    '    text-overflow: ellipsis;\n' +
                    '    white-space: nowrap;cursor: pointer" onclick="todetail(\''+noticeId+'\',\''+noticeObjectType+'\',\''+noticeObjectId+'\')"><img class="ditu-popup2-icon" src="../images/ditu-icon2.png" style="clear:both"/>'+noticeName+'</div>\n' +

                    '    <div class="ditu-popup2-line1">\n' +
                    '                                    <div class="labelBox" style="top: 0px;width: 348px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;height: 30px;">\n' +tagStr+
                    '                                    </div>\n' +
                    '    </div>\n' +
                    '    <div class="ditu-popup2-line1">\n' +
                    '        <img class="ditu-popup2-icon" src="../images/ditu-icon3.png" style="float: left;margin-right: 6px;"/>\n' +
                    '        <div class="ditu-popup2-line1-inner1">大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:<span>'+warningClassesFirst+'</span></div>\n' +
                    '        <div class="ditu-popup2-line1-inner1">小&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:<span>'+noticeClasses+'</span></div>\n' +
                    '    </div>\n' +
                    '    <div class="ditu-popup2-line2" style="height: auto;max-height: 50px">\n' +
                    '        <img class="ditu-popup2-icon" src="../images/ditu-icon4.png" style="float: left;margin-right: 6px;"/>\n' +
                    '        <div class=\'ditu-popup2-line2-inner1\'>预警内容:</div>\n' +
                    '        <div class="ditu-popup2-line2-inner2" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">'+noticeContent+'\t</div>\n' +
                    '    </div>\n' +
                    '    <div class="ditu-popup2-line1">\n' +
                    '        <img class="ditu-popup2-icon" src="../images/ditu-icon5.png" style="float: left;margin-right: 6px;"/>\n' +
                    '        <div class=\'ditu-popup2-line1-inner\'>预警时间:<span>'+formatDatebox(new Date(noticeDate),'-')+'</span></div>\n' +
                    '    </div>\n' +
                    '    <div class="ditu-popup2-line1">\n' +
                    '        <img class="ditu-popup2-icon" src="../images/ditu-icon1.png" style="float: left;margin-right: 6px;"/>\n' +
                    '        <div class=\'ditu-popup2-line1-inner\'>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点:<span>'+noticeAddr+'</span><a href="javascript:;" style="bottom: 0px" class="jumpBtn"  onclick="tomore(\''+noticeId+'\')">关联事件</a></div>\n' +
                    '    </div>\n';

                overlay.setPosition(coodinate);
                map.addOverlay(overlay);
                $("#popup-content").html(showStr);
                // }
            });
        });
    }
    //设置地图中心点
    function setMapCenter(x,y){
        var xy = [parseFloat(x),parseFloat(y)];
        map.getView().setCenter(xy);
    }
    function allData() {
        $("#secondClasses").val("");
        $("#firstClasses").val("");
        $(".y-ditu-sider_sty1").fadeOut();
        getWarningLevelNum();
        getList();
        road()
    }

    function levelSearch(result) {
        if (result==0){
            $("#noticeLevel").val("");
        } else {
            $("#noticeLevel").val(result);
        }
        getList()
        road()

    }

    var overlay;
    var locationPointMarker;
    var mapUrl = "t{0-6}.tianditu.gov.cn";
    //初始化地图
    function initMap(){

        $(".map").css("height", document.body.clientHeight);
        var projection = ol.proj.get('EPSG:4326');
        var projectionExtent = projection.getExtent();
        var size = ol.extent.getWidth(projectionExtent) / 256;
        var resolutions = new Array(20);
        var matrixIds = new Array(20);


        for (var z = 0; z <=20; ++z) {
            resolutions[z] = size / Math.pow(2, z);
            matrixIds[z] = z;   }

        var baseLayer =  new ol.layer.Tile({name:"baseVec",
            source: new ol.source.WMTS({
                url: 'http://'+mapUrl+'/vec_c/wmts?tk=30812b5aef18377d83bc80ba6f257cf5',
                layer: 'vec',
                format: 'tiles',
                tileGrid: new ol.tilegrid.WMTS({
                    origin: ol.extent.getTopLeft(projectionExtent),
                    resolutions: resolutions,
                    matrixIds: matrixIds,
                }),
                matrixSet:"c",
                style: 'default'
            })
        });
        var baseVec = new ol.layer.Tile({  name:"Vec",
            source: new ol.source.WMTS({
                url: 'http://'+mapUrl+'/cva_c/wmts?tk=30812b5aef18377d83bc80ba6f257cf5',
                layer: 'cva',
                format: 'tiles',
                tileGrid: new ol.tilegrid.WMTS({
                    origin: ol.extent.getTopLeft(projectionExtent),
                    resolutions: resolutions,
                    matrixIds: matrixIds,
                }),
                matrixSet:"c",
                style: 'default'
            })
        });

        var map = new ol.Map({
            logo:false,
            layers: [ baseLayer,baseVec],
            target: 'map',
            view: new ol.View({
                center:[121.438319,31.105656] ,
                projection:ol.proj.get("EPSG:4326"),
                zoom: 13,
                maxZoom:18,
                minZoom:1
            }) ,
            interactions:ol.interaction.defaults({
                doubleClickZoom:false
            }),
            loadTilesWhileAnimating: true
        });


        var container = document.getElementById("popup");
        var closer = document.getElementById("popup-closer");
        overlay = new ol.Overlay({
            element: container,
            positioning: 'center-center',
            autoPan: true,
            offset:[0,-10],
            autoPanAnimation: {
                duration: 250   //当Popup超出地图边界时，为了Popup全部可见，地图移动的速度.
            }
        });

        closer.onclick = function() {
            overlay.setPosition(undefined);
            closer.blur();
            return false;
        };
        map.addOverlay(overlay);
        return map;
    }

    function road() {
        var data={};
        data.noticeClass=$("#secondClasses").val();
        data.warningClassesFirst=$("#firstClasses").val();
        data.noticeLevel=$("#noticeLevel").val();
        data.handleStatus='1';
        if ($("#endtime").val()!=''){
            data.endTime=$("#endtime").val();
        }
        if ($("#starttime").val()!=''){
            data.startTime=$("#starttime").val();
        }
        if ($("#zdryType").val()){
            data.zdryType=$("#zdryType").val();
        }
        if ($("#zdry").val()){
            data.zdry=$("#zdry").val();
        }
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getJdNum",
            dataType:"json",
            data:data,
            success:function (result) {
                console.log("road")
                console.log(result);
                var jiedao=[];
                var datas11=[];
                for (var i=0;i<result.length;i++){
                    jiedao[i]=result[i].road;
                    datas11[i]=parseInt(result[i].num);
                }
                var myChart = echarts.init(document.getElementById("streetBox"));
                var myColor = [ new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false), new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false), new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false), new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false), new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#9dc2dd' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#2c9beb' // 100% 处的颜色
                }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#e68a95' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#e65c6d' // 100% 处的颜色
                }], false), new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: '#ff8d48' // 0% 处的颜色
                }, {
                    offset: 1,
                    color: '#ffda2e' // 100% 处的颜色
                }], false)];
                function getsum(arr) {
                    return arr.reduce(function(prev, curr, idx, arr) {
                        return prev + curr;
                    });
                }

                var sum = getsum(datas11);
                if (sum==0){
                    sum=1
                }
                var option = {
                    backgroundColor: '#fff',
                    tooltip: {
                        show: true,
                        formatter: function(chart) {
                            var seriesName = chart.seriesName,
                                name = chart.name,
                                value = chart.value;
                            if (seriesName.indexOf("值") > -1) {
                                var html = '<span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#276EAF;"></span>' + name + '：' + value ;
                                return html;
                            }
                        }
                    },
                    grid: {
                        width: "80%",
                        left: '10%',
                        height: '95%',
                        top: '3%',
                        right: '0',
                        bottom: '0'
                    },
                    xAxis: {
                        gridIndex: 0,
                        show: false
                    },
                    yAxis: [{//这里是企业的option定义
                        gridIndex: 0,
                        splitLine: 'none',
                        axisTick: 'none',
                        axisLine: 'none',
                        axisLabel: {
                            verticalAlign: 'bottom',
                            align: 'left',
                            padding: [0, 0, 10, 10],
                            textStyle: {
                                color: '#000',
                                fontSize: '12',
                            }
                        },
                        data: jiedao
                    },
                        {
                            gridIndex: 0,
                            splitLine: 'none',
                            axisTick: 'none',
                            axisLine: 'none',
                            data: []
                        }
                    ],
                    series: [{
                        name: '值',
                        result: 'bar',
                        xAxisIndex: 0,
                        yAxisIndex: 0,
                        data: datas11,
                        label: {
                            normal: {
                                show: true,
                                position: [180,0,0,0],
                                verticalAlign: 'bottom',
                                offset: [0, 0],
                                color: 'rgba(0, 0, 0, 0.85)',
                                fontSize: 12,
                                fontFamily: 'arial',
                                formatter: function(item) {
                                    return item.value
                                }
                            }
                        },
                        barWidth: 10,
                        itemStyle: {
                            normal: {
                                color: function(params){
                                    return myColor[params.dataIndex]
                                },

                                barBorderRadius: 5,
                                shadowBlur: 0,
                            }
                        },
                        z: 2
                    },
                        {
                            name: '外框',
                            result: 'bar',
                            xAxisIndex: 0,
                            yAxisIndex: 1,
                            barGap: '100%',
                            data: [sum, sum, sum, sum, sum, sum, sum,sum,sum,sum,sum,sum,sum,sum],
                            barWidth: 10,//定义整条进度条的粗细
                            itemStyle: {
                                normal: {
                                    color: 'rgba(16, 96, 150, 0.8)',
                                    opacity: .2,
                                    barBorderRadius: 5,
                                }
                            },
                            z: 0
                        },

                    ]
                };
                myChart.setOption(option);

            }
        });
    }

    function xsdc() {
        $("#zdryType").val("");
        $("#firstClasses").val("");
        $("#secondClasses").val("");
        $("#noticeLevel").val("");
        $("#starttime").val("");
        $("#endtime").val("");
        $("#zdry").val("")
        getWarningClasses();
    }

    function gzyj() {

        $("#zdryType").val("");
        $("#firstClasses").val("");
        $("#secondClasses").val("");
        $("#noticeLevel").val("");
        $("#starttime").val("");
        $("#endtime").val("");
        $("#zdry").val("1")
        getZdryNum('tsrq');
        getZdryNum('swzdry_0')
        $(".itemDown a").each(function () {
            getZdryNum($(this).attr("id"))
        })
        getWarningLevelNum();
        getList();
        road()
    }
    function zdrySearch(result) {
        $("#zdryType").val(result);
        getWarningLevelNum();
        getList();
        road()
    }
    function tomore(id) {
        openNewWindow('warningEventsList.jsp?noticeId='+id);
    }
</script>
<script result="text/javascript">

    var map = initMap();

    function clearpoints() {
        console.log(111)
        map.getOverlays().clear();
    }
</script>
</html>