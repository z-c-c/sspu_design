<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en"  class="html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <%@include file="/wwpt/common/w_include_header.jsp"%>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript" src="../js/warningUtil.js"></script>
    <script result="text/javascript" src="../js/echarts.min.js"></script>
    <script result="text/javascript" src="../js/informatiionScript.js"></script>

    <style result="text/css">
        #tagbox {
            position: relative;
            margin: 2px auto 0px;
            width: 200px;
            height: 200px;
        }

        #tagbox a {
            position: absolute;
            padding: 3px 6px;
            font-family: 微软雅黑;
            color: #fff;
            TOP: 0px;
            font-weight: bold;
            text-decoration: none;
            left: 0px
        }

        #tagbox a:hover {
            border: #eee 1px solid;
            background: #1f7ec0;
        }

        #tagbox .color7 {
            color: #59c3e5
        }

        #tagbox .color8 {
            color: #edafda
        }

        #tagbox .color9 {
            color: #c4ebac
        }

        #tagbox .color10 {
            color: #ffa8a8;
        }

        #tagbox .color1 {
            color: #45dbf7
        }

        #tagbox .color2 {
            color: #f6d54a
        }

        #tagbox .color3 {
            color: #ff67f9
        }

        #tagbox .color4 {
            color: #ff7700
        }

        #tagbox .color5 {
            color: #edafda
        }

        #tagbox .color6 {
            color: #E0A6B3
        }
    </style>
</head>
<body>
    <div class="index-main">
        <div class="sw-left">
            <div class="y-frame-l-block1 y-flexbox2">
                <div class="y-flex2-item y-flex2-item_sty1">
                    <div class="y-flex2-item-line1" id="num1">0</div>
                    <div class="y-flex2-item-line2">数据总量</div>
                </div>
                <div class="y-flex2-item y-flex2-item_sty2">
                    <div class="y-flex2-item-line1" id="num2">0</div>
                    <div class="y-flex2-item-line2">近一周增量</div>
                </div>
                <div class="y-flex2-item y-flex2-item_sty3">
                    <div class="y-flex2-item-line1" id="num3">0</div>
                    <div class="y-flex2-item-line2">数据种类</div>
                </div>
            </div>
            <div class="y-frame-l-block2">
                <div class="bear-tit">
                    <h5>近一周热门词云</h5>
                </div>
                <div id="tagbox" style="margin:20px auto 0;width: 90%;height:242px;">
                </div>
            </div>
            <div class="y-frame-l-block3">
                <div class="bear-tit">
                    <h5>最新采集数据</h5>
                    <a target="_blank">更多&gt;&gt;</a>
                </div>
                <div class="dataList" style="height: 240px;">
                    <div class="view">

                    </div>
                </div>
            </div>
        </div>

        <div class="sw-center">
            <div class="y-frame-c-block1">

                <div class="y-frame-photo">
                    <div class='y-frame-line'>
                        <embed src="/wwpt/riskwarning/svg/line.svg" width="70%" height="70%" result="image/svg+xml" pluginspage="http://www.adobe.com/svg/viewer/install/" />
                    </div>
                    <div class="y-dataText">大数据分析中心</div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos1">
                        <div class="y-frame-photo-item-line1" id="ly_0">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY0"></div>
                    </div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos2">
                        <div class="y-frame-photo-item-line1" id="ly_1">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY1"></div>
                    </div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos3">
                        <div class="y-frame-photo-item-line1" id="ly_2">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY2"></div>
                    </div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos4">
                        <div class="y-frame-photo-item-line1" id="ly_3">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY3"></div>
                    </div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos5">
                        <div class="y-frame-photo-item-line1" id="ly_4">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY4"></div>
                    </div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos6">
                        <div class="y-frame-photo-item-line1" id="ly_5">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY5"></div>
                    </div>
                    <div class="y-frame-photo-item y-frame-photo-item_pos7">
                        <div class="y-frame-photo-item-line1" id="ly_6">0</div>
                        <div class="y-frame-photo-item-line2" id="SJLY6"></div>
                    </div>
                </div>
            </div>
            <div class="y-frame-c-block2">
                <div class="bear-tit">
                    <h5>采集数据街道分布</h5>
                </div>
                <div id="bar1" style="margin:20px auto 0;width: 95%;height: 255px"></div>
            </div>
        </div>

        <div class="sw-right">
            <div class="y-frame-r-block1">
                <div class="bear-tit">
                    <h5>动态跟随</h5>
                </div>
                <div class="y-frame-r-block1-inner">
                    <div class="y-frame-r-block1-inner-l clearfix">
                        <div class="v-fl y-copy-img y-copy-img_sty1"></div>
                        <div class="v-fr y-copy-txts">
                            <div class="y-copy-txts-line1"  id="zdryNum">0</div>
                            <div class="y-copy-txts-line2">涉稳重点人员</div>
                        </div>
                    </div>
                    <div class="y-frame-r-block1-inner-r">
                        <div id="halfroundchart1" style="margin:8px auto 0;width: 90%;height: 82px;"></div>
                    </div>
                    <div style="float:left;width: 100%; height: 1px; background: #e8e8e8;"></div>
                </div>
                <div class="y-frame-r-block1-inner">
                    <div class="y-frame-r-block1-inner-l clearfix">
                        <div class="v-fl y-copy-img y-copy-img_sty2"></div>
                        <div class="v-fr y-copy-txts">
                            <div class="y-copy-txts-line1" id="zdmdNum">900</div>
                            <div class="y-copy-txts-line2">重大矛盾</div>
                        </div>
                    </div>
                    <div class="y-frame-r-block1-inner-r">
                        <div id="halfroundchart2" style="margin:8px auto 0;width: 90%;height: 82px;background: url(/wwpt/images/demohalfchart2.png) round;"></div>
                    </div>
                </div>
            </div>
            <div class="y-frame-r-block2">
                <div class="bear-tit">
                    <h5>预警类别分布</h5>
                </div>
                <div id="bar2" style="margin-left: 35px;width: 90%;height: 438px;"></div>
            </div>
        </div>
    </div>

    <!-- 小导航 -->
    <div class="y-selectbox">
        <div class="y-selectbox-item y-selectbox-item_sty1">
            <div class="y-selectbox-item-img1"></div>
            <div class="y-selectbox-item-name y-selectbox-item-name_pos1">数据汇聚</div>
        </div>
        <div onclick="topage('warningMap.jsp')" class="y-selectbox-item y-selectbox-item_sty2">
            <div class="y-selectbox-item-img2"></div>
            <div class="y-selectbox-item-name y-selectbox-item-name_pos2">态势分析</div>
        </div>
        <div onclick="topage('warningList.jsp')" class="y-selectbox-item y-selectbox-item_sty3">
            <div class="y-selectbox-item-img3"></div>
            <div class="y-selectbox-item-name y-selectbox-item-name_pos3">预警列表</div>
        </div>
    </div>


    <script>
		$(function() {
            // 小导航
			$(".y-selectbox-item").hover(function() {
				$(this).children(".y-selectbox-item-name").show(200);
			}, function() {
				$(this).children(".y-selectbox-item-name").hide(200);
			})
		})
        function topage(jsp) {
            window.location.href="/wwpt/riskwarning/"+jsp;
        }

        var classes=[];
        $(function () {
            getClassesArr();
            getAllNum();
            leftTopNum();
            leftButtom();
            getCenterEchar();
            getZdmdNum();
            getAllWarningClassesNum();
            getKeyObj();
            getWarningWordCloud();
            getSJLY();

        });

        function getSJLY(){
            $.ajax({
                result:"POST",
                url:"/TagBaseInfoManager/getDictionaries",
                dataType:'json',
                data:{
                    dictId:'SJLYBM'
                },
                success:function (result) {
                    for (var i=0;i<result.length;i++){
                        $("#SJLY"+i).text(result[i].name)
                    }
                }
            });
        }
        function getAllNum() {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getAllEventTypeNum",
                dataType:"json",
                success:function (result) {
                    $("#num3").text(result.length)
                    for (var i=0;i<result.length;i++){
                        if (result[i].EVENT_SOURCE_CODE=='ly_0')$("#ly_0").text(result[i].NUM)
                        if (result[i].EVENT_SOURCE_CODE=='ly_1')$("#ly_1").text(result[i].NUM)
                        if (result[i].EVENT_SOURCE_CODE=='ly_2')$("#ly_2").text(result[i].NUM)
                        if (result[i].EVENT_SOURCE_CODE=='ly_3')$("#ly_3").text(result[i].NUM)
                        if (result[i].EVENT_SOURCE_CODE=='ly_4')$("#ly_4").text(result[i].NUM)
                        if (result[i].EVENT_SOURCE_CODE=='ly_5')$("#ly_5").text(result[i].NUM)
                        if (result[i].EVENT_SOURCE_CODE=='ly_6')$("#ly_6").text(result[i].NUM)
                    }
                }
            })
        }

        function leftTopNum() {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getEventNum",
                dataType:"json",
                success:function (result) {
                    $("#num1").text(result.allNum[0].NUM)
                    $("#num2").text(result.weekNum[0].NUM)
                }
            })
        }
        function leftButtom() {
            $(".view").html("")
            var starDate = new Date()
            var timerl=window.setTimeout(function () {
                $.ajax({
                    result:"POST",
                    url:"/riskWarningController/getEvents",
                    dataType:"json",
                    success:function (result) {
                        for (var i=0;i<result.length;i++){
                            var eventSource='未知';
                            if (result[i].eventSource&&result[i].eventSource!='null'){
                                eventSource=result[i].eventSource;
                            }
                            var eventContent='无';
                            if (result[i].eventContent&&result[i].eventContent!='null'){
                                eventContent=result[i].eventContent;
                            }
                            var date='';
                            if (result[i].stUpdateTime){
                                date=formatDatebox(new Date(result[i].stUpdateTime),"-",true)
                            } else {
                                date='无'
                            }
                            str='<dl style="padding: 12px 0;">\n' +
                                '                        <dt>\n' +
                                '                            <span name="'+judgeNull(result[i].eventName)+'" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">'+judgeNull(result[i].eventName)+'</span>\n' +
                                '                            <i class="new"></i>\n' +
                                '                        </dt>\n' +
                                '                        <dd>\n' +
                                '                            <p name="'+judgeNull(result[i].eventContent)+'" class="con" style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">'+judgeNull(result[i].eventContent)+'</p>\n' +
                                '                            <div class="sourceInfo">\n' +
                                '                                <strong style="margin-left:0px">\n' +
                                '                                    <b>来源</b>\n' +
                                '                                    <span>'+eventSource+'</span>\n' +
                                '                                </strong>\n' +
                                '                                <em>'+date+'</em>\n' +
                                '                            </div>\n' +
                                '                        </dd>\n' +
                                '                    </dl>';
                            $(".view").append(str);
                        }

                    }
                })
                $("#dataList").mLoading("hide");
                window.clearTimeout(timerl)
            },new Date()-starDate)
        }
        function getdata(data,town) {
            var name =town.EVENT_TOWN.substring(0,2);
            if (name=='湖南'){
                data[0]=parseInt(town.NUM)
            }else if (name=='田林'){
                data[1]=parseInt(town.NUM)
            }else if (name=='康健'){
                data[2]=parseInt(town.NUM)
            }else if (name=='龙华'){
                data[3]=parseInt(town.NUM)
            }else if (name=='斜土'){
                data[4]=parseInt(town.NUM)
            }else if (name=='凌云'){
                data[5]=parseInt(town.NUM)
            }else if (name=='虹梅'){
                data[6]=parseInt(town.NUM)
            }else if (name=='天平'){
                data[7]=parseInt(town.NUM)
            }else if (name=='漕河'){
                data[8]=parseInt(town.NUM)
            }else if (name=='长桥'){
                data[9]=parseInt(town.NUM)
            }else if (name=='华泾'){
                data[10]=parseInt(town.NUM)
            }else if (name=='枫林'){
                data[11]=parseInt(town.NUM)
            }else if (name=='徐家'){
                data[12]=parseInt(town.NUM)
            }
            return data;

        }
        function getCenterEchar() {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getAllEventJdNum",
                dataType:"json",
                success:function (result) {
                    var data=[];
                    for (var i=0;i<result.length;i++){
                        if (result[i].EVENT_TOWN.length>1){
                            data=getdata(data,result[i]);
                        }
                    }
                    for (var i=0;i<data.length;i++){
                        if (!data[i]){
                            data[i]=0;
                        }
                    }
                    var myChart = echarts.init(document.getElementById("bar1"));
                    var option = {
                        backgroundColor: '#fff',
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                result: 'shadow'
                            }
                        },
                        grid: {
                            top: '15%',
                            right: '0%',
                            left: '5%',
                            bottom: '12%'
                        },
                        xAxis: [{
                            result: 'category',
                            data: ['湖南路', '田林', '康健新村', '龙华', '斜土路', '凌云路', '虹梅路', '天平路', '漕河泾', '长桥', '华泾', '枫林', '徐家汇'],
                            axisLine: {
                                lineStyle: {
                                    color: '#7f7f7f'
                                }
                            },
                            axisLabel: {
                                margin: 5,
                                color: '#000',
                                interval: 0,
                                rotate:25,
                                align:'center',
                                padding: [30, 0, 0, 0],
                                textStyle: {
                                    fontSize: 12
                                },

                            },
                        }],
                        yAxis: [{
                            axisLabel: {
                                formatter: '{value}',
                                color: '#000',
                            },
                            axisLine: {
                                show: false
                            },
                            splitLine: {
                                lineStyle: {
                                    color: 'rgba(255,255,255,0.12)'
                                }
                            }
                        }],
                        series: [{
                            result: 'bar',
                            data: data,
                            barWidth: '13px',
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                        offset: 0,
                                        color: '#9dc2dd' // 0% 处的颜色
                                    }, {
                                        offset: 1,
                                        color: '#2c9beb' // 100% 处的颜色
                                    }], false),
                                    barBorderRadius: [30, 30, 0, 0],

                                }
                            },
                        }]
                    };
                    myChart.setOption(option);
                }
            })
        }

        function getKeyObj() {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getKeyObj",
                dataType:"json",
                success:function (result) {
                    var all=result.allNum[0].NUM;
                    var month=result.monthNum[0].NUM
                    $("#zdryNum").text(all)
                    var myChart = echarts.init(document.getElementById("halfroundchart1"));
                    var option = {
                        backgroundColor: "#fff",
                        series: [
                            {
                                result: "pie",
                                radius: ["120%", "160%"],
                                hoverAnimation: false,
                                center: ['50%', '100%'],
                                startAngle:180,
                                animation: false,
                                label: {
                                    show:false
                                },
                                labelLine: {
                                    show: false
                                },
                                data: [
                                    {
                                        value: 2,
                                        itemStyle:{
                                            color:'#e8e8e8'
                                        }
                                    },{
                                        value: 2,
                                        itemStyle: {
                                            opacity:0
                                        },
                                    }
                                ]

                            },

                            {
                                result: "pie",
                                radius: ["0%", "0%"],
                                hoverAnimation: false,
                                center: ['50%', '80%'],
                                animation: false,
                                startAngle:180,
                                label: {
                                    show:true,
                                    position:"center",
                                    formatter: function(params){
                                        return ["{a|"+params.value+"人}","{b|数据月活}"].join("\n")
                                    },
                                    rich: {
                                        a: {
                                            color: "#000000",
                                            fontWeight: 1000,
                                            fontSize: 15,
                                            lineHeight: 20
                                        },
                                        b: {
                                            color: "#000000",
                                            fontWeight: 1000,
                                            fontSize: 12,
                                            lineHeight: 10
                                        },
                                        d: {
                                            color: "#9b9b9b",
                                            fontSize: 5,
                                            lineHeight: 5
                                        }
                                    }
                                },
                                labelLine: {
                                    show: false
                                },
                                data: [{
                                    value: month,
                                    itemStyle: {
                                        color:"#fff"
                                    },
                                }
                                ]

                            },
                            {
                                result: "pie",
                                radius: ["120%", "160%"],
                                hoverAnimation: false,
                                center: ['50%', '100%'],
                                startAngle:180,
                                label: {
                                    show:false
                                },
                                labelLine: {
                                    show: false
                                },
                                data: [
                                    {
                                        name:"你的得分",
                                        value: month,
                                        itemStyle:{
                                            color: new echarts.graphic.LinearGradient(
                                                0, 0, 1, 0, [{
                                                    offset: 0,
                                                    color: '#ace5c4'
                                                },
                                                    {
                                                        offset: 1,
                                                        color: '#0ba74e'
                                                    }
                                                ]
                                            )
                                        }
                                    }, {
                                        value: parseInt(all)*2-parseInt(month),
                                        itemStyle: {
                                            opacity:0
                                        },
                                    }
                                ]

                            },
                        ]
                    };
                    myChart.setOption(option);

                }
            })
        }

        function getAllWarningClassesNum() {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getAllWarningClassesNum",
                dataType:"json",
                success:function (result) {
                    var num=[];
                    var list=[];
                    for (var t=0;t<classes.length;t++){
                        var flag=true;
                        for (var i=0;i<result.length;i++){
                            var name=result[i].WARNING_CLASSES_FIRST;
                            if (name==classes[t]) {
                                num[t]=result[i].NUM
                                flag=false;
                            }
                        }
                        if (flag){
                            num[t]=0;
                        }
                        var data={};
                        data.name=classes[t];
                        data.num=num[t]
                        list.push(data);
                    }
                    list.sort((a,b)=>{return a.num-b.num});
                    var numarr=[];
                    var dataarr=[];
                    for (var i=0;i<list.length;i++){
                        numarr[i]=list[i].num
                        dataarr[i]=list[i].name
                    }
                    var myChart = echarts.init(document.getElementById("bar2"));
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
                        color: '#ff8d48' // 0% 处的颜色
                    }, {
                        offset: 1,
                        color: '#ffda2e' // 100% 处的颜色
                    }], false),new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: '#e68a95' // 0% 处的颜色
                    }, {
                        offset: 1,
                        color: '#e65c6d' // 100% 处的颜色
                    }], false)];
                    function getsum(arr) {
                        return arr.reduce(function(prev, curr, idx, arr) {
                            return prev + curr;
                        });
                    }
                    var sum = getsum(num);

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
                            width: "85%",
                            left: '5%',
                            height: '95%',
                            top: '6%',
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
                            data: dataarr
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
                            data: numarr,
                            label: {
                                normal: {
                                    show: true,
                                    position: [250,-7,0,0],
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
                                data: [sum, sum, sum, sum, sum, sum, sum,sum,sum,sum,sum],
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
            })
        }
        function getClassesArr() {
            $.ajax({
                result:"POST",
                url:"/TagBaseInfoManager/getDictionaries",
                dataType:"json",
                data:{
                    dictId:'WTQD_MDLB',
                    order:'desc'
                },
                async:false,
                success:function (result) {
                    for (var i=0;i<result.length;i++){
                        classes[i]=result[i].name
                    }

                }
            })
        }
        function getZdmdNum() {
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getZdmdNum",
                dataType:"json",

                success:function (result) {
                    $("#zdmdNum").text(result.allNum[0].NUM)
                    var myChart = echarts.init(document.getElementById("halfroundchart2"));
                    var option = {
                        backgroundColor: "#fff",
                        series: [
                            {
                                result: "pie",
                                radius: ["120%", "160%"],
                                hoverAnimation: false,
                                center: ['50%', '100%'],
                                startAngle:180,
                                animation: false,
                                label: {
                                    show:false
                                },
                                labelLine: {
                                    show: false
                                },
                                data: [
                                    {
                                        value: 2,
                                        itemStyle:{
                                            color:'#e8e8e8'
                                        }
                                    },{
                                        value: 2,
                                        itemStyle: {
                                            opacity:0
                                        },
                                    }
                                ]

                            },

                            {
                                result: "pie",
                                radius: ["0%", "0%"],
                                hoverAnimation: false,
                                center: ['50%', '80%'],
                                animation: false,
                                startAngle:180,
                                label: {
                                    show:true,
                                    position:"center",
                                    formatter: function(params){
                                        return ["{a|"+params.value+"件}","{b|数据月活}"].join("\n")
                                    },
                                    rich: {
                                        a: {
                                            color: "#000000",
                                            fontWeight: 1000,
                                            fontSize: 15,
                                            lineHeight: 20
                                        },
                                        b: {
                                            color: "#000000",
                                            fontWeight: 1000,
                                            fontSize: 12,
                                            lineHeight: 10
                                        },
                                        d: {
                                            color: "#9b9b9b",
                                            fontSize: 5,
                                            lineHeight: 5
                                        }
                                    }
                                },
                                labelLine: {
                                    show: false
                                },
                                data: [{
                                    value: result.monthNum[0].NUM,
                                    itemStyle: {
                                        color:"#fff"
                                    },
                                }
                                ]

                            },
                            {
                                result: "pie",
                                radius: ["120%", "160%"],
                                hoverAnimation: false,
                                center: ['50%', '100%'],
                                startAngle:180,
                                label: {
                                    show:false
                                },
                                labelLine: {
                                    show: false
                                },
                                data: [
                                    {
                                        name:"你的得分",
                                        value: result.monthNum[0].NUM,
                                        itemStyle:{
                                            color: new echarts.graphic.LinearGradient(
                                                0, 0, 1, 0, [{
                                                    offset: 0,
                                                    color: '#7073a8'
                                                },
                                                    {
                                                        offset: 1,
                                                        color: '#515381'
                                                    }
                                                ]
                                            )
                                        }
                                    }, {
                                        value: parseInt(result.allNum[0].NUM)*2-parseInt(result.monthNum[0].NUM),
                                        itemStyle: {
                                            opacity:0
                                        },
                                    }
                                ]

                            },
                        ]
                    };
                    myChart.setOption(option);
                }
            })
        }

        function getWarningWordCloud() {
            $.ajax({
                url: "/indexController/getWarningWordCloud",
                result: "post",
                dataType: "json",
                async: false,
                success: function (res) {
                    // debugger;
                    if (res.code == "200") {
                        var warningWordCloud = res.data.data;
                        var html = "";
                        $("#tagbox").empty();
                        var fontSize = 12;
                        for (var i = 0; i < warningWordCloud.length; i++) {
                            var objectName = warningWordCloud[i].NOTICE_OBJECT_NAME;
                            var a = i % 10 + 1;
                            if (i < 4) {
                                fontSize += i;
                            }
                            html += "<a class=\"color" + a + "\" style=\"font-size: " + fontSize + "px;\" >" + objectName + "</a>";
                        }
                        $("#tagbox").html(html);

                    }

                }
            })
        }
	</script>
</body>
</html>