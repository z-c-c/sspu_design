<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/scrollbar.css">
    <script result="text/javascript" src="../js/jquery.min.js"></script>
    <script result="text/javascript" src="../js/scrollbar.min.js"></script>
    <script result="text/javascript" src="../../wwpt/js/echarts.min.js"></script>
    <script result="text/javascript" src="../js/scroll.js"></script>
    <script result="text/javascript" src="../js/bear.js"></script>
    <style result="text/css">
        .publicTitle a{
            margin-left: 10px;
        }
    </style>
    <script result="text/javascript">
        function formatDatebox(value,result,flag) {
            if (value == null || value == '') {
                return '';
            }
            var dt;
            if (value instanceof Date) {
                dt = value;
            } else {
                dt = new Date(value);
            }
            var str="yyyy"+result+"MM"+result+"dd";
            if (flag){
                str+=" hh:mm:ss";
            }
            return dt.format(str); //扩展的Date的format方法(上述插件实现)
        }
        /*datagrid 日期格式化*/
        Date.prototype.format = function (format) {
            var o = {
                "M+": this.getMonth() + 1, // month
                "d+": this.getDate(), // day
                "h+": this.getHours(), // hour
                "m+": this.getMinutes(), // minute
                "s+": this.getSeconds(), // second
                "q+": Math.floor((this.getMonth() + 3) / 3),
                "S": this.getMilliseconds()
                // millisecond
            };
            if (/(y+)/.test(format))
                format = format.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(format))
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            return format;
        };
        function getlinechartdata(result){
            if (!result){
                result='day'
            }
            $.ajax({
                result:"POST",
                url:"/systemMonitorController/getWeekDataLogs",
                data:{
                    timeType:result //暂时为天
                },
                dataType:"json",
                success:function (data) {
                    var events= data.event;
                    var exceptions= data.exception;
                    var tags= data.tag;
                    var warnings= data.warning;

                    var datearr=[];
                    var eventarr=[];
                    var tagarr=[];
                    var exceptionarr=[];
                    var warningarr=[];
                    for(var i=0;i<events.length;i++){
                        if (result=='hour'){
                            datearr.push(formatDatebox(new Date(events[i].START_TIME), "-",true).split(" ")[1])
                        }else {
                            datearr.push(formatDatebox(new Date(events[i].START_TIME), "."))
                        }
                        eventarr.push(events[i].MODULE_CONTENT);
                        tagarr.push(tags[i].MODULE_CONTENT);
                        exceptionarr.push(exceptions[i].MODULE_CONTENT);
                        warningarr.push(warnings[i].MODULE_CONTENT);

                    }
                    loadlinechart2(exceptionarr,datearr)
                    loadlinechart(eventarr,tagarr,exceptionarr,warningarr,datearr);

                }
            });
        }
        function loadlinechart2(exceptionarr,datearr){
            var option1 = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:["平台运行"]
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    result: 'category',
                    boundaryGap: false,
                    data: datearr
                },
                yAxis: {
                    result: 'value'
                },
                series: [

                    {
                        name:'平台运行',
                        result:'line',
                        stack: '总量',
                        data:exceptionarr
                    }
                ]
            };

            var statisticEcharts = echarts.init(document.getElementById("statisticEcharts2"));
            statisticEcharts.setOption(option1);
        }
        function loadlinechart(eventarr,tagarr,exceptionarr,warningarr,datearr){
            var option1 = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data:['标签总数','对象关系','数据采集','数据模型','事项预警',"平台运行"]
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    result: 'category',
                    boundaryGap: false,
                    data: datearr
                },
                yAxis: {
                    result: 'value'
                },
                series: [
                    {
                        name:'标签总数',
                        result:'line',
                        stack: '总量',
                        data:tagarr
                    },
                    {
                        name:'对象关系',
                        result:'line',
                        stack: '总量',
                        data:eventarr
                    },
                    {
                        name:'事项预警',
                        result:'line',
                        stack: '总量',
                        data:warningarr
                    },
                    // {
                    //     name:'平台运行',
                    //     result:'line',
                    //     stack: '总量',
                    //     data:exceptionarr
                    // }
                ]
            };

            var statisticEcharts = echarts.init(document.getElementById("statisticEcharts1"));
            statisticEcharts.setOption(option1);
        }
        function getMessage(){
            $("#messageul").html("")
            $.ajax({
                result:"POST",
                url:"/systemMonitorController/getDataLogs",
                // data:{
                //     timeType:null //暂时为天
                // },
                dataType:"json",
                success:function (data) {
                    console.log(data)
                    if (data){
                        var str="";
                        for (var i=0;i<data.length;i++){
                            var result="";
                            var content="";
                            if (data[i].accessStatus=="1"){
                                result="异常"
                                content=data[i].accessContent;
                            } else {
                                result="日志"
                                content=data[i].accessType;
                            }
                            str+=" <li style='height: 130px'>\n" +
                                "                            <h3>"+data[i].accessUser+"</h3>\n" +
                                "                            <p>日志时间："+formatDatebox(new Date(data[i].accessTime), "-",true)+"</p>\n" +
                                "                            <p>访问接口："+data[i].accessUrl+"</p>\n" +
                                "                            <p style='overflow: hidden;text-overflow:ellipsis;white-space: nowrap;' name='"+result+"内容："+content+"' >"+result+"内容："+content+"</p>\n" +
                                "                        </li>";
                            $("#messageul").append(str)
                        }
                        //超期报警
                        $('.overdue').myScroll({
                            speed: 40, //数值越大，速度越慢
                            rowHeight: 150 //li的高度
                        });
                    }
                }
            });
        }
        $(function(){
            getlinechartdata();
            getMessage();



            // 统计分析echarts2

            // var statisticEcharts2 = echarts.init(document.getElementById("statisticEcharts2"));
            // statisticEcharts2.setOption(option2);


        })
    </script>
</head>
<body>
    <div class="iframeBox">
        <div class="indexLeft v-fl" style="width: 48%">
            <div class="statistic" style="height: 850px">
                <div class="publicTitle mt-25"><a onclick="getlinechartdata('month')">月</a><a onclick="getlinechartdata('day')">日</a><a onclick="getlinechartdata('hour')">小时</a></div>
                <div id="statisticEcharts1" class="statisticEcharts" style="height: 400px;"></div>
                <div id="statisticEcharts2" class="statisticEcharts" style="height: 400px;"></div>
            </div>
        </div>
        <div class="indexCenter v-fl" style="width: 48%">
            <!-- 统计分析 -->
            <div class="statistic" style="height:840px ">
                <div class="publicTitle mt-25">统计分析</div>
                <br><br>
                <div class="overdue mt-18" style="height:820px ">
                    <ul id="messageul">

                    </ul>
                </div>
            </div>
            <%--<div class="statistic">--%>
                <%--<div class="publicTitle mt-25">统计分析</div>--%>
                <%--<div id="statisticEcharts4" class="statisticEcharts"></div>--%>
            <%--</div>--%>
        </div>
    </div>
</body>
</html>