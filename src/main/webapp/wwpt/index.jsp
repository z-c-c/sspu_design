<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <name></name>
    <%@include file="common/w_include_header.jsp" %>
    <script result="text/javascript" src="./common/w_common_method.js"></script>
    <script result="text/javascript" src="./js/echarts.min.js"></script>
    <script result="text/javascript" src="./js/ecStat.min.js"></script>
    <script result="text/javascript" src="./js/dataTool.js"></script>
    <script result="text/javascript" src="./js/scroll.js"></script>
    <script result="text/javascript" src="./js/list_scroll.js"></script>
    <script result="text/javascript" src="./js/informatiionScript.js"></script>
    <style result="text/css">
        .warningScroll1 dl {
            height: 60px !important;
        }

        .warningScroll2 dl {
            height: 60px !important;
        }

        .warningScroll1 dl dt {
            height: 24px !important;
        }

        .warningScroll2 dl dt {
            height: 24px !important;
        }

        .conflictBox dl {
            height: 55px !important;
            margin-bottom: 2px !important;
        }

        .newActiveScroll .view ul li strong {
            /*float: right !important;*/
            /* display: inline-block !important; */
            position: absolute;
            bottom: 30px;
            right: 0;
            width: auto;
        }

        .newActiveScroll .view ul li .lateNews {
            /*display: inline-block !important;*/
            position: absolute;
            bottom: 10px;
            right: 0;
            width: auto;
        }

        .importPeople .itemBox .item {
            width: 100% !important;
            height: 30px;
            float: left;
            left: 15px;
            position: relative;
            text-indent: 14px;
            margin-bottom: 1px !important;
        }

        .importPeople .itemBox .item p {
            display: inline-block;
            margin-top: 5px !important;
        }

        .importPeople .itemBox .item span {
            display: inline-block;
            float: right;
            /*right: 20px;*/
            margin-right: 30px;
            font-size: 14px;
            margin-top: 6px !important;
        }

        .importPeople .itemBox .item::before {
            content: "";
            /*display: block;*/
            width: 8px;
            height: 8px;
            border-radius: 2px;
            position: absolute;
            top: 10px !important;
            left: 0;
        }

        .labelBox span {
            margin-top: 1px;
        }

        .index-echarts1 {
            height: 250px !important;
        }

        .conflictBox {
            height: 312px !important;
        }

        .conflictBox .view dl dd {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            word-break: break-all;
        }

        .conflictBox .view dl dt {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            word-break: break-all;
        }

        .noContent {
            background: url(./images/zwsj.png) no-repeat center;
        }

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

    <script result="text/javascript">

        function getKeyPerson() {
            // $.ajax({
            //     url: "/indexController/getKeyPerson",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         var countData = [];
            //         var typeData = [];
            //         if (res.code == '200') {
            //             var keyPersonType = res.data.data;
            //             var keyPersonCount = res.data.keyPersonCount == null ? 0 : res.data.keyPersonCount;
            //             $("#keyPersonCount").text(keyPersonCount + "人");
            //             var sum = 0;
            //             for (var i = 0; i < keyPersonType.length; i++) {
            //                 if (keyPersonType[i].result != undefined && keyPersonType[i].result != "") {
            //                     if (keyPersonType[i].result == "xf") {
            //                         var count = keyPersonType[i].count == null ? 0 : keyPersonType[i].count;
            //                         $("#xfCount").text(count);
            //                         sum += count;
            //                     } else if (keyPersonType[i].result == "finance") {
            //                         var count = keyPersonType[i].count == null ? 0 : keyPersonType[i].count;
            //                         $("#financeCount").text(count);
            //                         sum += count;
            //                     } else if (keyPersonType[i].result == "sj") {
            //                         var count = keyPersonType[i].count == null ? 0 : keyPersonType[i].count;
            //                         $("#sjCount").text(count);
            //                         sum += count;
            //                     } else if (keyPersonType[i].result == "other") {
            //                         var count = keyPersonType[i].count == null ? 0 : keyPersonType[i].count;
            //                         $("#otherCount").text(count);
            //                         sum += count;
            //                     }
            //                 }
            //             }
            //             $(".countAll strong").text(keyPersonCount);
            //         }
            //     }
            // });
        }

        //对象赋值  obj[name] = value / array 对象数组, "name" "属性"
        function array2obj(array, key) {
            var resObj = {};
            for (var i = 0; i < array.length; i++) {
                resObj[array[i][key]] = array[i];
            }
            return resObj;
        }

        //获取对象数组中指定属性数组   /(data, "name");
        function getArrayValue(array, key) {
            var key = key || "value";
            var res = [];
            if (array) {
                array.forEach(function (t) {
                    res.push(t[key]);
                });
            }
            return res;
        }

        function getConflictresolutionInfo() {
            // $.ajax({
            //     url: "/indexController/getStatusCount",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         var objData = {};
            //         var data = [];
            //         var legendData = [];
            //         var seriesObjs = [];
            //         if (res.code == '200') {
            //             var statusCountType = res.data.data;
            //             for (var i = 0; i < statusCountType.length; i++) {
            //                 if (statusCountType[i].result == '1') {
            //                     data.push({
            //                         name: "已化解",
            //                         value: statusCountType[i].count == null ? "0" : statusCountType[i].count
            //                     });
            //                     // objData["已化解"] = statusCountType[i].count == null ? "0" : statusCountType[i].count;
            //                 } else if (statusCountType[i].result == '0') {
            //                     data.push({
            //                         name: "未化解",
            //                         value: statusCountType[i].count == null ? "0" : statusCountType[i].count
            //                     });
            //                     // objData["未化解"] = statusCountType[i].count == null ? "0" : statusCountType[i].count;
            //                 }
            //             }
            //             /*for (var i = 0; i < ydata.length; i++) {
            //                 //            legendData.push(data[i].name)
            //                 var seriesObj = {
            //                     name: data[i].name,
            //                     result: 'pie',
            //                     clockWise: false,
            //                     radius: [r - 1 - i * 20, r - i * 20],
            //                     itemStyle: {
            //                         normal: {
            //                             label: {
            //                                 show: false,
            //                                 position: 'center'
            //                             },
            //                             labelLine: {
            //                                 show: false
            //                             },
            //                             borderWidth: 5,
            //                             shadowBlur: 50,
            //                             borderColor: color[i],
            //                             shadowColor: 'rgba(142,152,241, 0.6)'
            //                         }
            //                     },
            //                     hoverAnimation: false,
            //                     data: [{
            //                         value: data[i].value
            //                     }, {
            //                         value: data[0].value * 4 / 3 - data[i].value,
            //                         name: 'invisible',
            //                         itemStyle: placeHolderStyle
            //                     }]
            //                 };
            //                 seriesObjs.push(seriesObj)
            //             }*/
            //         }
            //         objData = array2obj(data, "name");
            //         legendData = getArrayValue(data, "name");
            //         var r = 40;
            //         // var color = ['linear-gradient(0deg,#0f9aff 0%,#0294ff 100%)', 'linear-gradient(46deg,#fc6e7a 0%,#ffcc00 4%,#fdc581 100%)', '#6DE0CF'];
            //         var color = ['#0f9aff', '#ffcc00'];
            //         var placeHolderStyle = {
            //             normal: {
            //                 label: {
            //                     show: false,
            //                     position: 'center'
            //                 },
            //                 labelLine: {
            //                     show: false
            //                 },
            //                 color: 'rgba(0, 0, 0, 0)',
            //                 borderColor: 'rgba(0, 0, 0, 0)',
            //                 borderWidth: 0
            //             }
            //         }
            //         for (var i = 0; i < data.length; i++) {
            //             //            legendData.push(data[i].name)
            //             var seriesObj = {
            //                 name: data[i].name,
            //                 result: 'pie',
            //                 clockWise: false,
            //                 radius: [r - 1 - i * 10, r - i * 10],
            //                 center: ['23%', '50%'],
            //                 itemStyle: {
            //                     normal: {
            //                         label: {
            //                             show: false,
            //                             position: 'center'
            //                         },
            //                         labelLine: {
            //                             show: false
            //                         },
            //                         borderWidth: 3,
            //                         shadowBlur: 3,
            //                         borderColor: color[i],
            //                         shadowColor: 'rgba(142,152,241, 0.6)'
            //                     }
            //                     //                    emphasis: {
            //                     //                      borderColor: 'rgb(142,152,241)',
            //                     //                      shadowColor: 'rgba(142,152,241, 0.6)'
            //                     //                    }
            //                 },
            //                 hoverAnimation: false,
            //                 data: [{
            //                     value: data[i].value
            //                 }, {
            //                     value: data[0].value * 4 / 3 - data[i].value,
            //                     name: 'invisible',
            //                     itemStyle: placeHolderStyle
            //                 }]
            //             };
            //             seriesObjs.push(seriesObj);
            //         }
            //         var option = {
            //             // color: ['#8F99F0', '#5FC5F5', '#6DE0CF'],
            //             color: ['#0f9aff', '#ffcc00'],
            //             // color: ['linear-gradient(0deg,#0f9aff 0%,#0294ff 100%)', 'linear-gradient(46deg,#fc6e7a 0%,#ffcc00 4%,#fdc581 100%)', '#6DE0CF'],
            //             tooltip: {
            //                 show: true,
            //                 formatter: '{a} :  {c} 件'
            //             },
            //             legend: {
            //                 show: true,
            //                 icon: "circle",
            //                 itemHeight: 7,
            //                 orient: 'vertical',
            //                 right: 5,
            //                 formatter: function (name) {
            //                     return "{name|" + name + "}   {value|" + (objData[name].value) + "}  {name|项}"
            //                 },
            //                 textStyle: {
            //                     rich: {
            //                         name: {
            //                             fontSize: 14,
            //                             // lineHeight: 15,
            //                             color: "rgba(0, 0, 0, 0.65)"
            //                         },
            //                         value: {
            //                             fontSize: 14,
            //                             // lineHeight: 20,
            //                             color: "rgba(0, 0, 0, 0.45)"
            //                         }
            //                     }
            //                 },
            //                 top: 'center',
            //                 // data: ['北京','上海','广州'],
            //                 data: legendData
            //             },
            //             toolbox: {
            //                 show: false
            //             },
            //             series: seriesObjs
            //         }
            //
            //         var myChart = echarts.init(document.getElementById('statusCount'));
            //         // 填入数据
            //         myChart.setOption(option);
            //     }
            // });
        }

        //重大矛盾
        function getImportantQuestions() {
            // $.ajax({
            //     url: "/indexController/getImportantQuestions",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         if (res.code == "200") {
            //             $(".conflictBox .view").empty();
            //             $("#importantQuestionsCount").empty();
            //             var importantQuestions = res.data.data;
            //             var len = importantQuestions.length > 5 ? 5 : importantQuestions.length;
            //             var html = "";
            //             var count = res.data.count.count == null ? 0 : res.data.count.count;
            //             if (importantQuestions.length > 0) {
            //                 $(".conflictBox .view").removeClass("noContent");
            //             }
            //             $("#importantQuestionsCount").html(count + "件");
            //             for (var i = 0; i < len; i++) {
            //
            //                 var ename = importantQuestions[i].EVENT_NAME;
            //                 var econtent = importantQuestions[i].EVENT_CONTENT;
            //                 var eid = importantQuestions[i].EVENT_ID;
            //                 var etime = importantQuestions[i].OCCURED_TIME == null ? "未知" : new Date(importantQuestions[i].OCCURED_TIME.time).Format("yyyy年MM月dd日");
            //                 // var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
            //                 html += "<dl onclick=\"goDetail('" + eid + "','event','" + eid + "','event','" + ename + "')\">\n" +
            //                     "                        <dt>" + ename + "</dt>\n" +
            //                     "                        <dd>\n" +
            //                     "                            <a href=\"javascript:;\">" + econtent + "</a>\n" +
            //                     "                        </dd>\n" +
            //                     "                    </dl>"
            //             }
            //             $(".conflictBox .view").html(html);
            //         }
            //     }
            // })
        }

        function getStreetsCount() {
            // $.ajax({
            //     url: "/indexController/getStreetsCount",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         // var sum = 0;
            //         var streets = [];
            //         var counts = [];
            //         if (res.code == "200") {
            //             var streetsCount = res.data.data;
            //             for (var i = 0; i < streetsCount.length; i++) {
            //                 var street = streetsCount[i].street;
            //                 streets.push(street);
            //                 var count = streetsCount[i].count;
            //                 counts.push(count);
            //                 // sum += count;
            //             }
            //         }
            //         var sum = getsum(counts);
            //         if (sum == 0) {
            //             sum = 1;
            //         }
            //         var myChart = echarts.init(document.getElementById("streetsCount"));
            //         var option = {
            //             backgroundColor: '#fff',
            //             tooltip: {
            //                 show: true,
            //                 formatter: function (chart) {
            //                     var seriesName = chart.seriesName,
            //                         name = chart.name,
            //                         value = chart.value;
            //                     if (seriesName.indexOf("值") > -1) {
            //                         var html = '<span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#276EAF;"></span>' + name + '：' + value;
            //                         return html;
            //                     }
            //                 }
            //             },
            //             grid: {
            //                 width: "80%",
            //                 left: '10%',
            //                 // height: '80%',
            //                 top: '3%',
            //                 right: '0',
            //                 bottom: '0'
            //             },
            //             xAxis: {
            //                 gridIndex: 0,
            //                 show: false
            //             },
            //             yAxis: [{//这里是企业的option定义
            //                 gridIndex: 0,
            //                 splitLine: 'none',
            //                 axisTick: 'none',
            //                 axisLine: 'none',
            //                 axisLabel: {
            //                     verticalAlign: 'bottom',
            //                     align: 'left',
            //                     padding: [0, 0, 10, 10],
            //                     textStyle: {
            //                         color: 'rgba(0, 0, 0, 0.65)',
            //                         fontSize: '12',
            //                     }
            //                 },
            //                 data: streets
            //             }, {//这里是数量的定义
            //                 gridIndex: 0,
            //                 splitLine: 'none',
            //                 axisTick: 'none',
            //                 axisLine: 'none',
            //                 data: counts,
            //                 axisLabel: {
            //                     show: true,
            //                     verticalAlign: 'bottom',
            //                     align: 'left',
            //                     //  padding: [0, 0, -7, -40],
            //                     padding: [0, 0, 10, -30],
            //                     textStyle: {
            //                         color: 'rgba(0, 0, 0, 0.85)',
            //                         fontSize: '12',
            //                     },
            //                     formatter: function (value) {
            //                         return value /*+ "件"*/
            //                     },
            //                     rich: {
            //                         y: {
            //                             color: '#fffa6f',
            //                             fontSize: 16
            //                         },
            //                         x: {
            //                             fontSize: 12
            //                         }
            //                     }
            //                 },
            //             }],
            //             series: [{
            //                 name: '值',
            //                 result: 'bar',
            //                 xAxisIndex: 0,
            //                 yAxisIndex: 0,
            //                 data: counts,
            //
            //                 barWidth: 6,
            //                 itemStyle: {
            //                     normal: {
            //                         color: '#457aff',
            //                         barBorderRadius: 5,
            //                     }
            //                 },
            //                 z: 2
            //             },
            //                 {
            //                     name: '外框',
            //                     result: 'bar',
            //                     xAxisIndex: 0,
            //                     yAxisIndex: 1,
            //                     barGap: '100%',
            //                     data: [sum, sum, sum, sum, sum, sum, sum, sum, sum, sum, sum, sum, sum, sum],
            //                     barWidth: 6,//定义整条进度条的粗细
            //                     itemStyle: {
            //                         normal: {
            //                             color: 'rgba(16, 96, 150, 0.8)',
            //                             opacity: .2,
            //                             barBorderRadius: 5,
            //                         }
            //                     },
            //                     z: 0
            //                 },
            //
            //             ]
            //         };
            //         myChart.setOption(option);
            //     }
            // });
        }

        function getsum(arr) {
            return arr.reduce(function (prev, curr, idx, arr) {
                return prev + curr;
            });
        }

        function getWaitRiskAssess() {
            // $.ajax({
            //     url: "/indexController/getWaitRiskAssess",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         if (res.code == "200") {
            //             $("#waitRiskAssessCount").empty();
            //             $("#waitRiskAssess").empty();
            //             var waitRiskAssess = res.data.contentList;
            //             var len = waitRiskAssess.length > 6 ? 6 : waitRiskAssess.length;
            //             var waitRiskAssessCount = res.data.count.count == null ? 0 : res.data.count.count;
            //             // var waitlen = waitRiskAssess.length != undefined && waitRiskAssess.length != null && waitRiskAssess.length > 4 ? 4 : waitRiskAssess.length;
            //             $("#waitRiskAssessCount").html(waitRiskAssessCount + "件");
            //             var html = "";
            //             if (waitRiskAssess.length > 0) {
            //                 $("#waitRiskAssess").removeClass("noContent");
            //             }
            //             // for (var i = 0; i < waitRiskAssess.length; i++) {
            //             for (var i = 0; i < len; i++) {
            //                 var ename = waitRiskAssess[i].EVENT_NAME;
            //                 var ecount = waitRiskAssess[i].EVENT_CONTENT;
            //                 var eid = waitRiskAssess[i].EVENT_ID;
            //                 var etime = waitRiskAssess[i].OCCURED_TIME == null ? "未知" : new Date(waitRiskAssess[i].OCCURED_TIME.time).Format("yyyy-MM-dd");
            //                 //"        <dd class=\"time\">" + etime + "</dd>\n" +
            //                 html += "<dl style=\"height: 40px !important;\" onclick=\"goDetail('" + eid + "','riskEvent','" + eid + "','event','" + ename + "')\">\n" +
            //                     "        <dt>\n" +
            //                     "            <a href=\"javascript:;\">" + ename + "</a>\n" +
            //                     "        </dt>\n" +
            //
            //                     "        <dd>\n" +
            //                     "            <i class=\"wait\"></i>\n" +
            //                     "        </dd>\n" +
            //                     "    </dl>"
            //             }
            //             $("#waitRiskAssess").html(html);
            //         }
            //
            //     }
            // })
        }

        function getWaitLogReport() {
            // $.ajax({
            //     url: "/indexController/getWaitLogReport",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         if (res.code == "200") {
            //             $("#waitLogReport").empty();
            //             var eventCount = res.data.eventCount;
            //             var fkCount = res.data.fkCount;
            //             var personCount = res.data.personCount;
            //             var eventContent = res.data.eventContent;
            //             var fkContent = res.data.fkContent;
            //             var personContent = res.data.personContent;
            //             var waitLogReportCount = eventCount + personCount + fkCount;
            //             var len = waitLogReportCount > 4 ? 4 : waitLogReportCount;
            //             var html = "";
            //             var contentLen = 0;
            //             if (len > 0) {
            //                 $("#waitLogReport").removeClass("noContent");
            //             }
            //             for (var i = 0; i < len; i++) {
            //                 if (contentLen > len) {
            //                     break;
            //                 }
            //                 if (contentLen < len && eventContent.length > 0 && eventContent[i] != undefined && eventContent[i] != null && eventContent[i] != "") {
            //                     var ename = eventContent[i].EVENT_NAME;
            //                     var econtent = eventContent[i].EVENT_CONTENT;
            //                     var eid = eventContent[i].EVENT_ID;
            //                     var etime = eventContent[i].OCCURED_TIME == null ? "未知" : new Date(eventContent[i].OCCURED_TIME.time).Format("yyyy年MM月dd日");
            //                     html = createHtml(html, eid, ename, etime, "event", "重大矛盾");
            //                     contentLen++;
            //                 }
            //                 if (contentLen < len && fkContent.length > 0 && fkContent[i] != undefined && fkContent[i] != null && fkContent[i] != "") {
            //                     var fname = fkContent[i].EVENT_NAME;
            //                     var fcontent = fkContent[i].EVENT_CONTENT;
            //                     var fid = fkContent[i].EVENT_ID;
            //                     var ftime = fkContent[i].OCCURED_TIME == null ? "未知" : new Date(fkContent[i].OCCURED_TIME.time).Format("yyyy年MM月dd日");
            //                     html = createHtml(html, fid, fname, ftime, "riskEvent", "风险评估");
            //                     contentLen++;
            //                 }
            //                 if (contentLen < len && personContent.length > 0 && personContent[i] != undefined && personContent[i] != null && personContent[i] != "") {
            //                     var pid = personContent[i].KEY_OBJECT_LIST_ID;
            //                     var pname = personContent[i].OBJECT_NAME;
            //                     var preason = personContent[i].PUT_REASON;
            //                     var ptime = personContent[i].PUT_DATE == null ? "未知" : new Date(personContent[i].PUT_DATE.time).Format("yyyy年MM月dd日");
            //                     html = createHtml(html, pid, pname, ptime, "person", "涉稳重点人员");
            //                     contentLen++;
            //                 }
            //             }
            //
            //             function createHtml(vhtml, id, name, time, result, source) {
            //
            //                 vhtml += "<dl onclick=\"goDetail('" + id + "','keyObject','" + id + "','" + result + "','" + name + "')\">\n" +
            //                     "        <dt>\n" +
            //                     "            <a href=\"javascript:;\">" + name + "</a>\n" +
            //                     "        </dt>\n" +
            //                     "<dd class=\"time\">\n" +
            //                     //"<span style=\"display: inline-block;width: 130px;\">" + time + "</span>\n" +
            //                     "<strong >\n" +
            //                     "<b class=\"gray\">来源：</b>\n" +
            //                     "<span class=\"blueText\">" + source + "</span>\n" +
            //                     "</strong>\n" +
            //                     "      </dd>" +
            //                     "        <dd>\n" +
            //                     "            <i class=\"wait\"></i>\n" +
            //                     "        </dd>\n" +
            //                     "    </dl>";
            //                 return vhtml;
            //             }
            //
            //             /* for (var i = 0; i < waitLogReports.length; i++) {
            //                  var ename = waitLogReports[i].EVENT_NAME;
            //                  var econtent = waitLogReports[i].EVENT_CONTENT;
            //                  var eid = waitLogReports[i].EVENT_ID;
            //                  var etime = waitLogReports[i].OCCURED_TIME == null ? "未知" : new Date(waitLogReports[i].OCCURED_TIME.time).Format("yyyy年MM月dd日");
            //                  // var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
            //                  html += "<dl onclick=\"goDetail('" + eid + "')\">\n" +
            //                      "        <dt>\n" +
            //                      "            <a href=\"javascript:;\">" + ename + "</a>\n" +
            //                      "        </dt>\n" +
            //                      "        <dd class=\"time\">" + etime + "</dd>\n" +
            //                      "        <dd>\n" +
            //                      "            <i class=\"wait\"></i>\n" +
            //                      "        </dd>\n" +
            //                      "    </dl>";
            //              }*/
            //             $("#waitLogReport").html(html);
            //         }
            //
            //     }
            // })
        }

        function getLatestNews() {
            // $.ajax({
            //     url: "/indexController/getLatestNews",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         if (res.code == "200") {
            //             $(".newActiveScroll .view ul").empty();
            //             var count = res.data.fkCount + res.data.zdCount + res.data.personCount;
            //
            //             var fkData = res.data.fkData;
            //             var zdData = res.data.zdData;
            //             var latestNews = res.data.personData;
            //             var html = "";
            //             $("#newCount a").html(">>共" + count + "条");
            //             if (count > 0) {
            //                 $(".newActiveScroll .view ul").removeClass("noContent");
            //             }
            //             for (var i = 0; i < fkData.length; i++) {
            //                 //风险评估事件
            //                 var fname = fkData[i].EVENT_NAME;
            //                 var fcontent = fkData[i].EVENT_CONTENT;
            //                 var fid = fkData[i].EVENT_ID;
            //                 var tags = fkData[i].tags;
            //                 html += "<li onclick=\"goDetail('" + fid + "','riskEvent','" + fid + "','" + "riskEvent" + "','" + fname + "')\">\n" +
            //                     "        <dl>\n" +
            //                     "            <dt class=\"clearfix\">\n" +
            //                     "                <a href=\"javascript:;\" class=\"name v-fl\">" + fname + "</a>\n" +
            //                     "                <div class=\"label v-fr\">\n" +
            //                     "                    <div class=\"labelBox\">\n";
            //                 if (tags != null && tags != undefined && tags != "") {
            //                     for (var j = 0; j < tags.length; j++) {
            //                         var tagName = tags[j].tagName;
            //                         var tagColor = tags[j].tagColorCode;
            //                         var tagExplain = tags[j].tagExplain;
            //                         html += " <span name='" + tagExplain + "' style='background:" + tagColor + "' class=\"green\">" + tagName + "</span>\n";
            //                     }
            //                 }
            //                 html +=
            //                     "                    </div>\n" +
            //                     "                </div>\n" +
            //                     "            </dt>\n" +
            //                     "            <dd class=\"clearfix\">\n" +
            //                     "                <a href=\"javascript:;\" class=\"newCon v-fl\">" + fcontent + "</a>\n";
            //                 // if (fkData[i].source != undefined && fkData[i].source != null && fkData[i].source != "") {
            //                     html += "<strong >" +
            //                         "    <b class=\"gray\">来源：</b>" +
            //                         "    <span class=\"blueText\">风险评估</span>\n" +
            //                         // "    <span class=\"blueText\">" + fkData[i].source + "</span>\n" +
            //                         "</strong>";
            //                 // }
            //                 if (fkData[i].OCCURED_TIME != undefined && fkData[i].OCCURED_TIME != null && fkData[i].OCCURED_TIME != "") {
            //                     var ftime = fkData[i].OCCURED_TIME == undefined || fkData[i].OCCURED_TIME == "" ? "未知" : new Date(fkData[i].OCCURED_TIME.time).Format("yyyy-MM-dd HH:mm:ss");
            //                     html += "<span class=\"time v-fr lateNews\">" + ftime + "</span>\n";
            //                 }
            //
            //                 html +=
            //                     "            </dd>\n" +
            //                     "        </dl>\n" +
            //                     "    </li>";
            //             }
            //             for (var i = 0; i < zdData.length; i++) {
            //                 //重大矛盾事件
            //                 var ename = zdData[i].EVENT_NAME;
            //                 var econtent = zdData[i].EVENT_CONTENT;
            //                 var eid = zdData[i].EVENT_ID;
            //                 var etime = zdData[i].OCCURED_TIME == undefined || zdData[i].OCCURED_TIME == "" ? "未知" : new Date(zdData[i].OCCURED_TIME.time).Format("yyyy-MM-dd HH:mm:ss");
            //                 var tags = zdData[i].tags;
            //                 html += "<li onclick=\"goDetail('" + eid + "','riskEvent','" + eid + "','" + "riskEvent" + "','" + fname + "')\">\n" +
            //                     "        <dl>\n" +
            //                     "            <dt class=\"clearfix\">\n" +
            //                     "                <a href=\"javascript:;\" class=\"name v-fl\">" + ename + "</a>\n" +
            //                     "                <div class=\"label v-fr\">\n" +
            //                     "                    <div class=\"labelBox\">\n";
            //                 if (tags != null && tags != undefined && tags != "") {
            //                     for (var j = 0; j < tags.length; j++) {
            //                         var tagName = tags[j].tagName;
            //                         var tagColor = tags[j].tagColorCode;
            //                         var tagExplain = tags[j].tagExplain;
            //                         html += " <span name='" + tagExplain + "' style='background:" + tagColor + "' class=\"green\">" + tagName + "</span>\n";
            //                     }
            //                 }
            //                 html +=
            //                     "                    </div>\n" +
            //                     "                </div>\n" +
            //                     "            </dt>\n" +
            //                     "            <dd class=\"clearfix\">\n" +
            //                     "                <a href=\"javascript:;\" class=\"newCon v-fl\">" + econtent + "</a>\n";
            //
            //                 // if (zdData[i].source != undefined && zdData[i].source != null && zdData[i].source != "") {
            //                     html += "<strong >" +
            //                         "    <b class=\"gray\">来源：</b>" +
            //                         "    <span class=\"blueText\">重大矛盾</span>\n" +
            //                         // "    <span class=\"blueText\">" + zdData[i].source + "</span>\n" +
            //                         "</strong>";
            //                 // }
            //                 if (zdData[i].OCCURED_TIME != undefined && zdData[i].OCCURED_TIME != null && zdData[i].OCCURED_TIME != "") {
            //                     var ftime = zdData[i].OCCURED_TIME == undefined || zdData[i].OCCURED_TIME == "" ? "未知" : new Date(zdData[i].OCCURED_TIME.time).Format("yyyy-MM-dd HH:mm:ss");
            //                     html += "<span class=\"time v-fr lateNews\">" + ftime + "</span>\n";
            //                 }
            //
            //                 html +=
            //                     /*"                <span class=\"time v-fr\">" + etime + "</span>\n" +*/
            //                     "            </dd>\n" +
            //                     "        </dl>\n" +
            //                     "    </li>";
            //             }
            //             for (var i = 0; i < latestNews.length; i++) {
            //                 //事件
            //                 var ename = latestNews[i].EVENT_NAME == null || latestNews[i].EVENT_NAME == undefined ? "未知" : latestNews[i].EVENT_NAME;
            //                 var econtent = latestNews[i].EVENT_CONTENT;
            //                 var eid = latestNews[i].EVENT_ID;
            //                 var etime = latestNews[i].OCCURED_TIME == undefined || latestNews[i].OCCURED_TIME == "" ? "未知" : new Date(latestNews[i].OCCURED_TIME.time).Format("yyyy-MM-dd HH:mm:ss");
            //                 //重点对象
            //                 var oid = latestNews[i].OBJECT_ID;
            //                 var oname = latestNews[i].OBJECT_NAME;
            //                 var otype = latestNews[i].OBJECT_TYPE;
            //                 //tags
            //                 var tags = latestNews[i].tags;
            //                 html += "<li onclick=\"goDetail('" + eid + "','keyObject','" + eid + "','" + otype + "','" + oname + "')\">\n" +
            //                     "        <dl>\n" +
            //                     "            <dt class=\"clearfix\">\n" +
            //                     "                <a href=\"javascript:;\" class=\"name v-fl\">" + oname + "</a>\n" +
            //                     "                <div class=\"label v-fr\">\n" +
            //                     "                    <div class=\"labelBox\">\n";
            //                 if (tags != null && tags != undefined && tags != "") {
            //                     for (var j = 0; j < tags.length; j++) {
            //                         var tagName = tags[j].tagName;
            //                         var tagColor = tags[j].tagColorCode;
            //                         var tagExplain = tags[j].tagExplain;
            //                         html += " <span name='" + tagExplain + "' style='background:" + tagColor + "' class=\"green\">" + tagName + "</span>\n";
            //                     }
            //                 }
            //                 html +=
            //                     "                    </div>\n" +
            //                     "                </div>\n" +
            //                     "            </dt>\n" +
            //                     "            <dd class=\"clearfix\">\n" +
            //                     "                <a href=\"javascript:;\" class=\"newCon v-fl\">" + econtent + "</a>\n";
            //                 // if (latestNews[i].source != undefined && latestNews[i].source != null && latestNews[i].source != "") {
            //                     html += "<strong >" +
            //                         "    <b class=\"gray\">来源：</b>" +
            //                         "    <span class=\"blueText\">重点对象</span>\n" +
            //                         // "    <span class=\"blueText\">" + latestNews[i].source + "</span>\n" +
            //                         "</strong>";
            //                 // }
            //                 if (latestNews[i].OCCURED_TIME != undefined && latestNews[i].OCCURED_TIME != null && latestNews[i].OCCURED_TIME != "") {
            //                     var ftime = latestNews[i].OCCURED_TIME == undefined || latestNews[i].OCCURED_TIME == "" ? "未知" : new Date(latestNews[i].OCCURED_TIME.time).Format("yyyy-MM-dd HH:mm:ss");
            //                     html += "<span class=\"time v-fr lateNews\">" + ftime + "</span>\n";
            //                 }
            //                 html +=
            //                     /* "                <span class=\"time v-fr\">" + etime + "</span>\n" +*/
            //                     "            </dd>\n" +
            //                     "        </dl>\n" +
            //                     "    </li>";
            //             }
            //             $(".newActiveScroll .view ul").html(html);
            //         }
            //
            //     }
            // })
        }

        var levelInfo = "";

        function getWarningLevel() {
            // $.ajax({
            //     url: "/indexController/getWarningLevel",
            //     result: "post",
            //     dataType: "json",
            //     async: false,
            //     success: function (res) {
            //         if (res.code == "200") {
            //             levelInfo = res.data;
            //         }
            //     }
            // });
        }

        function getEventWarning() {
            // $.ajax({
            //     url: "/indexController/getEventWarning",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         if (res.code == "200") {
            //             getWarningLevel();
            //             var warningEvents = res.data.data;
            //             var contents = warningEvents.content;
            //             var count = warningEvents.totalElements;
            //             $("#warningCount a").html(">>共" + count + "条");
            //             $("#warningSumCount").html(count + "件");
            //             $(".bigDataScroll .view ul").empty();
            //             var html = "";
            //             if (contents.length > 0) {
            //                 $(".bigDataScroll .view ul").removeClass("noContent");
            //             }
            //             for (var i = 0; i < contents.length; i++) {
            //                 var noticeName = contents[i].noticeName;
            //                 var noticeId = contents[i].noticeId;
            //                 var noticeDate = contents[i].noticeDate == null ? "未知" : new Date(contents[i].noticeDate.time).Format("yyyy-MM-dd");
            //                 var noticeContent = contents[i].noticeContent;
            //                 var noticeLevel = contents[i].noticeLevel;
            //                 var noticeObjectId = contents[i].noticeObjectId;
            //                 var noticeObjectType = contents[i].noticeObjectType;
            //                 var noticeLevelName = "未知";
            //                 var warningTags = contents[i].warningTags;
            //                 html += "<li onclick=\"goDetail('" + noticeId + "','warning','" + noticeObjectId + "','" + noticeObjectType + "','" + noticeName + "')\">\n" +
            //                     "        <div class=\"con\">\n" +
            //                     "            <a href=\"javascript:;\">" + noticeName + "</a>\n" +
            //                     "            <p class=\"time\">" + noticeDate + "</p>\n" +
            //                     "        </div>\n" +
            //                     "        <div class=\"warning-S\">\n";
            //                 if (levelInfo != null && levelInfo != undefined && levelInfo != "") {
            //                     for (var j = 0; j < levelInfo.length; j++) {
            //                         if (noticeLevel == levelInfo[j].code) {
            //                             noticeLevelName = levelInfo[j].name;
            //                         }
            //                     }
            //                 }
            //                 html += "            <p>" + noticeLevelName + "</p>\n";
            //                 if (noticeLevel == "1") {
            //                     html += "            <i class=\"icon-warning icon-warning1\"></i>\n";
            //                 } else if (noticeLevel == "2") {
            //                     html += "            <i class=\"icon-warning icon-warning2\"></i>\n";
            //                 } else {
            //                     html += "            <i class=\"icon-warning icon-warning3\"></i>\n";
            //                 }
            //                 html +=
            //                     "        </div>\n" +
            //                     "        <div class=\"warnignLable\">\n" +
            //                     "            <div class=\"labelBox\">\n";
            //                 if (warningTags != null && warningTags != undefined && warningTags != "") {
            //                     for (var k = 0; k < warningTags.length; k++) {
            //                         var tagName = warningTags[k].tagName;
            //                         var tagColorCode = warningTags[k].tagColorCode;
            //                         var tagExplain = warningTags[k].description;
            //                         html += " <span name='" + tagExplain + "' style='background:" + tagColorCode + "' class=\"green\">" + tagName + "</span>\n";
            //                     }
            //                 }
            //                 html +=
            //                     "            </div>\n" +
            //                     "        </div>\n" +
            //                     "     </li>";
            //             }
            //             $(".bigDataScroll .view ul").html(html);
            //         }
            //
            //     }
            // })
        }

        function getEventSource() {
            //
            // var myChart = echarts.init(document.getElementById('dataSource'));
            // var ydata = [];
            // var xdata = [];
            // var objData = {};
            // var option = {
            //     backgroundColor: "rgba(255,255,255,1)",
            //     color: ["#2870d8", "#4686e2", "#75a7f0", "#a4c8fc", "#8543e0", "#a16cea", "#d3b8f8"],
            //     legend: {
            //         result: 'scroll',
            //         orient: "vartical",
            //         pageIconColor: ['#0bdcfb'],
            //         pageIconInactiveColor: ['#007586'],
            //         pageButtonPosition: 'end',
            //         // x: "right",
            //         // top: "center",
            //         top: "47%",
            //         // left: "60%",
            //         // right: 10,
            //         bottom: 10,
            //         icon: "circle",
            //         data: [],
            //         itemWidth: 8,
            //         itemHeight: 8,
            //         itemGap: 16,
            //         /*formatter:function(name){
            //           var oa = option.series[0].data;
            //           var num = oa[0].value + oa[1].value + oa[2].value + oa[3].value+oa[4].value + oa[5].value + oa[6].value + oa[7].value+oa[8].value + oa[9].value ;
            //           for(var i = 0; i < option.series[0].data.length; i++){
            //               if(name==oa[i].name){
            //                   return ' '+name + '    |    ' + oa[i].value + '    |    ' + (oa[i].value/num * 100).toFixed(2) + '%';
            //               }
            //           }
            //         }*/
            //
            //         /*formatter: function (name) {
            //             return '' + name
            //         }*/
            //     },
            //     series: [{
            //         result: 'pie',
            //         clockwise: false, //饼图的扇区是否是顺时针排布
            //         minAngle: 5, //最小的扇区角度（0 ~ 360）
            //         radius: ["40%", "60%"],
            //         center: ["50%", "26%"],
            //         avoidLabelOverlap: false,
            //         itemStyle: { //图形样式
            //             normal: {
            //                 borderColor: '#ffffff',
            //                 borderWidth: 3
            //             }
            //         },
            //         label: {
            //             normal: {
            //                 show: false,
            //                 position: 'center',
            //                 formatter: '{text|{b}}\n{value|{c}} {value|({d}%)}',
            //                 rich: {
            //                     text: {
            //                         color: "#666",
            //                         fontSize: 14,
            //                         align: 'center',
            //                         verticalAlign: 'middle',
            //                         padding: 8
            //                     },
            //                     value: {
            //                         // color: "#8693F3",
            //                         fontSize: 14,
            //                         align: 'center',
            //                         verticalAlign: 'middle'
            //                     }
            //                 }
            //             },
            //             emphasis: {
            //                 show: true,
            //                 textStyle: {
            //                     fontSize: 24
            //                 }
            //             }
            //         },
            //         data: []
            //     }]
            // };
            // myChart.setOption(option);
            //
            // $.ajax({
            //     url: "/indexController/getEventSource",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         if (res.code == "200") {
            //             var eventSources = res.data.data;
            //             for (var i = 0; i < eventSources.length; i++) {
            //                 var source = eventSources[i].source;
            //                 var count = eventSources[i].count == null ? "0" : eventSources[i].count;
            //                 if (source == null || source == "" || source == " ") {
            //                     source = "其他";
            //                     if (objData[source] > 0) {
            //                         objData[source] += count;
            //                     } else {
            //                         objData[source] = count;
            //                     }
            //                     continue;
            //                 }
            //                 objData[source] = count;
            //                 ydata.push({
            //                     name: source,
            //                     value: count
            //                 });
            //                 xdata.push(source);
            //             }
            //             if (objData['其他'] > 0) {
            //                 ydata.push({
            //                     name: '其他',
            //                     value: objData['其他']
            //                 });
            //                 xdata.push('其他');
            //             }
            //         }
            //         myChart.setOption({
            //             legend: {
            //                 data: xdata,
            //                 formatter: function (name) {
            //                     return " {name|" + name + "}  \t\t  | {value|" + (objData[name]) + "件}";
            //                 },
            //                 textStyle: {
            //                     rich: {
            //                         name: {
            //                             fontSize: 14,
            //                             lineHeight: 5,
            //                             verticalAlign: 'bottom',
            //                             align: 'left',
            //                             color: "rgba(0, 0, 0, 0.65)"
            //                         },
            //                         value: {
            //                             fontSize: 14,
            //                             lineHeight: 5,
            //                             verticalAlign: 'bottom',
            //                             align: 'right',
            //                             color: "rgba(0, 0, 0, 0.45)"
            //                         }
            //                     }
            //                 }
            //             },
            //             series: [{
            //                 // 根据名字对应到相应的系列
            //                 data: ydata
            //             }]
            //         });
            //
            //     }
            // });

        }

        function getWarningWordCloud() {
            // $.ajax({
            //     url: "/indexController/getWarningWordCloud",
            //     result: "post",
            //     dataType: "json",
            //     async: false,
            //     success: function (res) {
            //         // debugger;
            //         if (res.code == "200") {
            //             var warningWordCloud = res.data.data;
            //             var html = "";
            //             $("#tagbox").empty();
            //             var fontSize = 12;
            //             for (var i = 0; i < warningWordCloud.length; i++) {
            //                 var objectName = warningWordCloud[i].NOTICE_OBJECT_NAME;
            //                 var objectId = warningWordCloud[i].NOTICE_OBJECT_ID;
            //                 //onclick=\"details('" + objectId + "')\"
            //                 var a = i % 10 + 1;
            //                 if (i < 3) {
            //                     fontSize += i;
            //                 }
            //                 html += "<a class=\"color" + a + "\" style=\"font-size: " + fontSize + "px;\" >" + objectName + "</a>";
            //             }
            //             $("#tagbox").html(html);
            //
            //         }
            //
            //     }
            // })
        }

        function getWarningTrend() {

            // $.ajax({
            //     url: "/indexController/getWarningTrend",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         // debugger;
            //         if (res.code == "200") {
            //             var warningTrends = res.data.data;
            //             $(".warning .view ul").empty();
            //             $(".echartBox").empty();
            //
            //             for (var i = 0; i < warningTrends.length; i++) {
            //                 var warningTrendDoc = 'warningTrend' + (i + 1);
            //                 $(".echartBox").append("<div class=\"warningEchart warningEchart" + (i + 1) + " opacity1\" id=\"warningTrend" + (i + 1) + "\"></div>");
            //                 var myChart = echarts.init(document.getElementById(warningTrendDoc));
            //                 var xData = [];
            //                 var data = [];
            //                 var classes = warningTrends[i].classes;
            //                 var sum = warningTrends[i].count;
            //                 var max = warningTrends[i].max;
            //                 var html = "";
            //                 if (i == 0) {
            //                     html = "<li onclick=\"changWarningTrend(this)\">\n" +
            //                         "           <a href=\"javascript:;\" class=\"active\">" + classes + "</a>\n" +
            //                         "       </li>";
            //                 } else {
            //                     html = "<li onclick=\"changWarningTrend(this)\">\n" +
            //                         "           <a href=\"javascript:;\">" + classes + "</a>\n" +
            //                         "       </li>";
            //                 }
            //                 $(".warning .view ul").append(html);
            //                 var warningTrend = warningTrends[i].data;
            //                 if (warningTrend != null && warningTrend != undefined) {
            //                     for (var j = 0; j < warningTrend.length; j++) {
            //                         var count = warningTrend[j].count;
            //                         var month = warningTrend[j].month;
            //                         xData.push(month);
            //                         data.push(count);
            //                     }
            //                 }
            //                 if (max < 5) {
            //                     max = 5;
            //                 }
            //                 myChart.setOption({
            //                     backgroundColor: '#fff',
            //                     tooltip: {
            //                         trigger: 'axis',
            //                         axisPointer: {
            //                             lineStyle: {
            //                                 color: '#b9c2d1',
            //                                 result: "dotted"
            //                             }
            //                         }
            //                     },
            //                     grid: {
            //                         left: '3%',
            //                         right: '4%',
            //                         bottom: '3%',
            //                         containLabel: true
            //                     },
            //                     xAxis: [{
            //                         result: 'category',
            //                         boundaryGap: false,
            //                         axisLine: {
            //                             lineStyle: {
            //                                 color: '#cdd6e5',
            //                             }
            //                         },
            //                         axisLabel: {
            //                             textStyle: {
            //                                 color: "#b5b5b5"
            //                             }
            //                         },
            //                         data: []
            //                     }],
            //                     yAxis: [{
            //                         result: 'value',
            //                         axisTick: {
            //                             show: false
            //                         },
            //                         //控制不以小数分割
            //                         minInterval: 1,
            //                         scale: true,
            //                         max: max,
            //                         axisLine: {
            //                             show: false
            //                         },
            //                         axisLabel: {
            //                             margin: 10,
            //                             textStyle: {
            //                                 fontSize: 14,
            //                                 color: "#9d9d9d"
            //                             }
            //                         },
            //                         splitLine: {
            //                             show: true,
            //                             lineStyle: {
            //                                 color: '#f4f5f6'
            //                             }
            //                         }
            //                     }],
            //                     series: [{
            //                         name: '增长数',
            //                         result: 'line',
            //                         smooth: true,
            //                         symbol: 'circle',
            //                         symbolSize: 5,
            //                         showSymbol: false,
            //                         lineStyle: {
            //                             normal: {
            //                                 width: 2,
            //                                 color: "#2173ed"
            //                             }
            //                         },
            //                         areaStyle: {
            //                             normal: {
            //                                 color: "#e6effe",
            //                             }
            //                         },
            //                         itemStyle: {
            //                             normal: {
            //                                 color: '#2173ed',
            //                                 borderColor: '#fff',
            //                                 borderWidth: 3
            //
            //                             }
            //                         },
            //                         data: []
            //                     }]
            //                 });
            //                 myChart.setOption({
            //                     xAxis: {
            //                         data: xData
            //                     },
            //                     series: [{
            //                         data: data
            //                     }]
            //                 });
            //             }
            //         }
            //
            //     }
            // })
        }

        function getWarningLevelInfo() {
            // var myChart = echarts.init(document.getElementById('warningLevel'));
            // var option = {
            //     tooltip: {
            //         trigger: 'axis',
            //         axisPointer: {
            //             result: 'shadow'
            //         }
            //     },
            //     grid: {
            //         top: '20%',
            //         right: '10%',
            //         left: '15%',
            //         bottom: '20%'
            //     },
            //     xAxis: [{
            //         result: 'category',
            //         data: [],
            //         axisLine: {
            //             lineStyle: {
            //                 color: 'rgba(255,255,255,0.12)'
            //             }
            //         },
            //         axisLabel: {
            //             margin: 10,
            //             color: 'rgba(0, 0, 0, 0.65)',
            //             fontSize: 12,
            //             textStyle: {
            //                 fontSize: 12
            //             },
            //         },
            //     }],
            //     yAxis: [{
            //         result: 'value',
            //         axisLabel: {
            //             formatter: '{value}',
            //             fontSize: 12,
            //             color: '#000'
            //         },
            //         axisTick: {
            //             show: false
            //         },
            //         axisLine: {
            //             show: false
            //         },
            //         splitLine: {
            //             lineStyle: {
            //                 color: '#f4f5f6'
            //             }
            //         }
            //     }],
            //     series: [{
            //         result: 'bar',
            //         data: [],
            //         barWidth: '20px',
            //         itemStyle: {
            //             normal: {
            //                 color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
            //                     offset: 0,
            //                     color: '#9dc2dd' // 0% 处的颜色
            //                 }, {
            //                     offset: 1,
            //                     color: '#2c9beb' // 100% 处的颜色
            //                 }], false),
            //                 barBorderRadius: [30, 30, 30, 30],
            //                 // shadowColor: 'rgba(0,160,221,1)',
            //                 // shadowBlur: 4,
            //             }
            //         },
            //         label: {
            //             normal: {
            //                 show: false,
            //             }
            //         }
            //     }]
            // };
            // myChart.setOption(option);
            // $.ajax({
            //     url: "/indexController/getWarningLevelInfo",
            //     result: "post",
            //     dataType: "json",
            //     async: true,
            //     success: function (res) {
            //         if (res.code == "200") {
            //             var xData = [];
            //             var data = [];
            //             var warningLevels = res.data.data;
            //             for (var i = 0; i < warningLevels.length; i++) {
            //                 xData.push(warningLevels[i].result);
            //                 data.push(warningLevels[i].count);
            //             }
            //             /*for (var i = 0; i < levelInfo.length; i++) {
            //                 var levelCode = levelInfo[i].code;
            //                 var levelName = levelInfo[i].name;
            //                 var levelCount = 0;
            //                 for (var j = 0; j < warningLevels.length; j++) {
            //                     if (levelCode == warningLevels[j].result) {
            //                         levelCount = warningLevels[j].count;
            //                     }
            //                 }
            //                 xData.push(levelName);
            //                 data.push(levelCount);
            //             }*/
            //             myChart.setOption({
            //                 xAxis: {
            //                     data: xData
            //                 },
            //                 series: [{
            //                     data: data
            //                 }]
            //             });
            //         }
            //     }
            // });
        }

        var index = 0;
        $(function () {
            //window.parent.$('body').mLoading("show");
            //涉稳重点人员
            getKeyPerson();
            //重大矛盾化解情况
            getConflictresolutionInfo();
            //重大矛盾
            getImportantQuestions();
            //重大矛盾分布
            getStreetsCount();
            //获取待风险评估情况
            getWaitRiskAssess();
            //加载待日志上报情况
            getWaitLogReport();
            //加载最新动态
            getLatestNews();
            //加载预警信息
            getEventWarning();
            //加载事件数据来源
            getEventSource();
            //加载预警高频词云
            getWarningWordCloud();
            //加载预警趋势
            getWarningTrend();
            //加载预警等级分布
            getWarningLevelInfo();
            // window.parent.$('body').mLoading("hide");
            // $('body').mLoading("hide");

            // 重大矛盾滚动
            /*$('.conflictBox').myScroll({
                speed: 40, //数值越大，速度越慢
                rowHeight: 81 //li的高度
            });*/
            // 风险评估滚动
            /*$('.warningScroll1').myScroll({
                speed: 100, //数值越大，速度越慢
                rowHeight: 106 //li的高度
            });*/
            // 日志上报滚动
            /* $('.warningScroll2').myScroll({
                 speed: 100, //数值越大，速度越慢
                 rowHeight: 106 //li的高度
             });*/
            // 最新动态滚动
            /*$(".newActiveScroll").Scroll({
                line: 1,
                speed: 500,
                timer: 3000,
            });*/

            // 大数据预警滚动
            /* $(".bigDataScroll").Scroll({
                 line: 1,
                 speed: 1000,
                 timer: 4000,
             });*/

            // 预警趋势切换
            index = 0;
            $(".tabBtn .next").click(function () {
                index++;
                if (index >= $(".warning .view ul li").length - 1) {
                    index = $(".warning .view ul li").length - 1;
                }
                clickFn();
            });
            $(".tabBtn .prev").click(function () {
                index--;
                if (index <= 0) {
                    index = 0;
                }
                clickFn();
            });
        });

        function clickFn() {
            $(".warning .view ul li").eq(index).find("a").addClass("active").siblings();
            $(".warning .view ul li").eq(index).siblings().find("a").removeClass("active")
            $(".warning .view ul").animate({"left": -index * 96}, 100);
            $(".echartBox .warningEchart").eq(index).fadeIn().siblings().fadeOut();
        }

        function changWarningTrend(e) {
            for (var i = 0; i < $(".warning .view ul li").length; i++) {
                if ($(".warning .view ul li").eq(i).find("a").text() == $(e).find("a").text()) {
                    index = i;
                    clickFn()
                }
            }
        }

        function goDetail(id, result, objId, objType, objName) {
            var url = "";
            if ('warning' == result) {
                url = 'riskwarning/warningDetail.jsp?noticeId=' + id + "&&noticeObjectType=" + objType + "&&noticeObjectId=" + objId;
            } else if ('keyObject' == result) {
                if ('person' == objType) {
                    url = 'person/personDetail.jsp?paId=' + objId;
                } else if ('riskEvent' == objType) {
                    url = "riskAssess/riskAssessDetail.jsp?eventId=" + id + "&eventName=" + objName;
                } else if ('event' == objType) {
                    url = "event/eventDetail.jsp?eventId=" + id + "&eventName=" + objName;
                }
            } else if ('event' == result) {
                url = "event/eventDetail.jsp?eventId=" + id + "&eventName=" + objName;
            } else if ('riskEvent' == result) {
                url = "riskAssess/riskAssessDetail.jsp?eventId=" + id + "&&eventName=" + objName;
            }
            if (url != null && url != undefined && url != "") {
                openNewWindow(url, "_target");
            }
        }

        function searchClick() {
            //$(location).attr("href","result.html");
            var searchKey = $("#searchKey").val();
            if (searchKey == null || searchKey == "") {
                //alert("搜索不能为空");
                return;
            }
            searchKey = encodeURI(searchKey);
            var url = 'indexInfo/searchList.jsp?searchKey=' + searchKey;
            // window.location = url;
            openNewWindow(url);
        }

        function titleClick(name) {
            var parent_a = $(".header-nav a", parent.document);
            for (var i = 0; i < parent_a.length; i++) {
                if ($(".header-nav a", parent.document).eq(i).text() == name) {
                    $(".header-nav .active", parent.document).removeClass("active");
                    $(".header-nav a", parent.document).eq(i).addClass("active");
                    $(".header-nav a", parent.document).eq(i).click();
                    break;
                }
            }
        }

        function goInfoPage(result) {
            var name = "";
            if (result == "waitLog") {
                name = encodeURI("待日志上报");
            } else if (result == "newInfo") {
                name = encodeURI("最新动态");
            } else {
                return;
            }
            var url = "indexInfo/indexInfoList.jsp?name=" + name + "&result=" + result;
            openNewWindow(url, "_target");
        }
    </script>
</head>
<body>
<div class="index-main">
    <!-- 左 -->
    <div class="index-main-left">
        <%--<div class="bear-block">
            <div class="bear-tit">
                <h5>特殊人群</h5>
            </div>
            <div class="index-echarts1" id="keyPersonTypeInfo"></div>
        </div>--%>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>人员情况</h5>
            </div>
            <div class="index-echarts1">
                <div class="importPeople">
                    <div class="countAll">
                        <div class="img"></div>
                        <p>人员总数</p>
                        <strong>0</strong>
                    </div>
                    <div class="itemBox clearfix">
                        <div class="item">
                            <%--<span id="xfCount">0</span>--%>
                            <p>信访老户</p>
                            <span id="xfCount">0</span>
                        </div>
                        <div class="item">

                            <p>涉金融类投资受损人员</p>
                            <span id="financeCount">0</span>
                        </div>
                        <div class="item">

                            <p>涉军重点人员</p>
                            <span id="sjCount">0</span>
                        </div>
                        <div class="item">

                            <p>其他</p>
                            <span id="otherCount">0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>重大矛盾化解情况</h5>
            </div>
            <div class="index-echarts2" id="statusCount"></div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>重大矛盾</h5>
            </div>
            <div class="conflictBox">
                <div class="view noContent">

                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>重大矛盾分布</h5>
            </div>
            <div class="index-echarts3" id="streetsCount"></div>
        </div>
    </div>

    <!-- 中 -->
    <div class="index-main-mid center-min-w">
        <div class="bear-block">
            <ul class="case-record">
                <li onclick="titleClick('风险评估')">
                    <img src="./images/case-record1.png">
                    <span id="waitRiskAssessCount">0件</span>
                    <h5>待风险评估</h5>
                </li>
                <li onclick="titleClick('涉稳重点人员')">
                    <img src="./images/case-record2.png">
                    <span id="keyPersonCount">0人</span>
                    <h5>涉稳重点人员</h5>
                </li>
                <li onclick="titleClick('重大矛盾')">
                    <img src="./images/case-record3.png">
                    <span id="importantQuestionsCount">0件</span>
                    <h5>重大矛盾</h5>
                </li>
                <li onclick="titleClick('风险洞察')">
                    <img src="./images/case-record4.png">
                    <span id="warningSumCount">0件</span>
                    <h5>预警</h5>
                </li>
            </ul>
        </div>
        <div class="warningMsg clearfix">
            <div class="bear-block warning-L v-fl">
                <div class="bear-tit">
                    <h5>待风险评估</h5>
                    <a href="javascript:void(0);"
                       onclick="titleClick('风险评估')" <%--href="wwpt/riskAssess/riskAssessList.jsp"--%>>更多>></a>
                </div>
                <div class="warningBase">
                    <div class="warningScroll warningScroll1">
                        <div class="view noContent" id="waitRiskAssess">
                            <%--<center>暂无数据</center>--%>

                        </div>
                    </div>
                </div>
            </div>
            <div class="bear-block warning-R v-fr">
                <div class="bear-tit">
                    <h5>待日志上报</h5>
                    <a href="javascript:void(0);" onclick="goInfoPage('waitLog')">更多>></a>
                </div>
                <div class="warningBase">
                    <div class="warningScroll warningScroll2">
                        <div class="view noContent" id="waitLogReport">
                            <%--<center>暂无数据</center>--%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit" id="newCount">
                <h5>最新动态</h5>
                <a href="javascript:void(0);" onclick="goInfoPage('newInfo')">>>共0条</a>
            </div>
            <div class="newActive">
                <div class="newActiveScroll">
                    <div class="view ">
                        <ul class="noContent">
                            <%--<center>暂无数据</center>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit" id="warningCount">
                <h5>大数据预警</h5>
                <a href="javascript:void(0);" onclick="titleClick('风险洞察')">>>共0条</a>
            </div>
            <div class="bigData">
                <div class="bigDataScroll">
                    <div class="view">
                        <ul class="noContent">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 右 -->
    <div class="index-main-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>预警趋势</h5>
            </div>
            <div class="warning">
                <div class="view">
                    <ul>

                    </ul>
                </div>
                <div class="tabBtn">
                    <a href="javascript:;" class="prev"></a>
                    <a href="javascript:;" class="next"></a>
                </div>
                <div class="echartBox">

                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>预警高频词云</h5>
            </div>
            <div class="warningCloud" id="warningCloud">
                <div class="mb-right04">
                    <div class="flbox titbox">
                        <div id="" class="camera-view">
                            <div id="tagbox">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>预警等级分布</h5>
            </div>
            <div class="warningLevel" id="warningLevel"></div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>一键搜索</h5>
            </div>
            <div class="aKeySearch">
                <div class="aKeyBox clearfix">
                    <input class="vV-ipt w-162 v-fl" id="searchKey"
                           onkeypress="if(event.keyCode==13){searchClick();return false;}" autocomplete="off"
                           result="text"/>

                    <button class="v-fl" style="cursor:pointer" name="search" onclick="searchClick()">搜 索</button>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>数据来源</h5>
            </div>
            <div class="dataSource" id="dataSource"></div>
        </div>
    </div>

</div>
</body>
</html>