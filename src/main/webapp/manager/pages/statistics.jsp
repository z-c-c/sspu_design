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

        function loadlinechart() {

            $.ajax({
                type: 'get',
                url: '/logs/count',
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    var data = result.data;
                    var date = [];
                    var count = [];
                    for (var key in data) {
                        date.push(key);
                        count.push(data[key])
                    }

                    var myEcharts = echarts.init(document.getElementById("statisticEcharts1"));
                    var option = {
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                lineStyle: {
                                    color: 'rgba(0, 0, 0, 0.45)',
                                    type: 'dashed'
                                },
                            },
                        },
                        grid: {
                            top: '15%',
                            left: '15%',
                            right: '5%',
                            bottom: '15%',
                            // containLabel: true
                        },
                        xAxis: [{
                            type: 'category',
                            axisLine: {
                                show: false
                            },
                            axisLabel: {
                                color: 'rgba(0, 0, 0, 0.45)',
                                interval: 0,
                                fontSize: '14',
                                rotate: 30

                            },
                            splitLine: {
                                show: false
                            },
                            axisTick: {
                                show: false,
                            },
                            boundaryGap: true,
                            data: date,

                        }],

                        yAxis: [{
                            type: 'value',
                            min: 0,
                            splitNumber: 6,
                            splitLine: {
                                show: true,
                                lineStyle: {
                                    color: 'rgba(0,0,0,0.10)',
                                    width: 1
                                }
                            },
                            axisLine: {
                                show: false,
                            },
                            axisLabel: {
                                color: 'rgba(0, 0, 0, 0.45)',
                                interval: 'auto',
                                fontSize: '14'
                            },
                            axisTick: {
                                show: false,
                            },
                        }],
                        series: [{
                            name: '接口访问量',
                            type: 'line',
                            showAllSymbol: true,
                            symbol: 'circle',
                            symbolSize: 10,
                            lineStyle: {
                                normal: {
                                    color: "#2173ED",
                                },
                            },
                            label: {
                                show: true,
                                position: 'top',
                                textStyle: {
                                    color: '#2173ED',
                                }
                            },
                            itemStyle: {
                                color: "#2173ED",
                                borderColor: "#fff",
                                borderWidth: 3,
                                shadowColor: 'rgba(0, 0, 0, .3)',
                                shadowBlur: 3,
                                shadowOffsetY: 2,
                                shadowOffsetX: 2,
                            },
                            tooltip: {
                                show: true
                            },
                            data: count
                        }
                        ]
                    };
                    myEcharts.setOption(option);
                }
            })

        }
        function getMessage(){
            $("#messageul").html("")
            $.ajax({
                type: "get",
                url: "/logs/log",
                dataType:"json",
                success: function (result) {
                    var data = result.data;
                    if (data){
                        var str="";
                        for (var i=0;i<data.length;i++){
                            var result="";
                            if (data[i].exception != null) {
                                result="异常"
                            } else {
                                result="日志"
                            }
                            str+=" <li style='height: 130px'>\n" +
                                "                            <h3>" + data[i].userId + "</h3>\n" +
                                "                            <p>日志时间：" + formatDatebox(new Date(data[i].operateTime), "-", true) + "</p>\n" +
                                "                            <p>访问接口：" + data[i].requestUri + "</p>\n" +
                                "                            <p style='overflow: hidden;text-overflow:ellipsis;white-space: nowrap;'>" + result + "内容：" + data[i].name + "</p>\n" +
                                "                        </li>";
                            $("#messageul").append(str)
                        }
                        //超期报警
                        $('.overdue').myScroll({
                            speed: 1, //数值越大，速度越慢
                            rowHeight: 150 //li的高度
                        });
                    }
                }
            });
        }
        $(function(){
            loadlinechart();
            getMessage();
        })
    </script>
</head>
<body>
    <div class="iframeBox">
        <div class="indexLeft v-fl" style="width: 42%">
            <div class="statistic" style="height: 850px">
                <div class="publicTitle mt-25"><span>接口访问量</span></div>
                <div id="statisticEcharts1" class="statisticEcharts" style="height: 500px;"></div>
            </div>
        </div>
        <div class="indexCenter v-fl" style="width: 54%;margin-right: 0px">
            <!-- 统计分析 -->
            <div class="statistic" style="height:840px ">
                <div class="publicTitle mt-25">统计分析</div>
                <br><br>
                <div class="overdue mt-18" style="height:600px ">
                    <ul id="messageul">

                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>