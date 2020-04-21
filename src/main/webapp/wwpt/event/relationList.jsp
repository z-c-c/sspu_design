<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-04-01
  Time: 23:38
  To change this template use File | Settings | File Templates.
  调用方式：
  一共三个参数：objectId ：事件id或者对象id
  flag：外层调用时，flag=false，全屏时，flag=show
  objectType：当查单位或者人员的关系图时，为unit或者person，当查事件的关系图时，不需要该参数
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>

    <script type="text/javascript" src="../common/w_common_method.js"></script>
    <script type="text/javascript" src="/wwpt/js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/echarts.min.js"></script>
    <script type="text/javascript" src="../js/warningUtil.js"></script>

    <style type="text/css">
        .overflow {
            overflow: hidden;
        }

        .setheight214 {
            height: 214px;
        }

        .setheight600 {
            height: 900px;
        }

        .zwsj {
            background: url('/wwpt/images/zwsj.png') no-repeat center;
        }
    </style>
    <script type="text/javascript">
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }

        var object;
        var objectType;
        var nodeMap = new Map();
        var relationMap = new Map();
        var nodeData = new Array();
        var relationData = new Array();
        var myEchart = null;
        objectType = GetQueryString("objectType");

        function initGraph(flag, firstFlag) {
            myEchart = echarts.init(document.getElementById("graph"));
            // myEchart.showLoading({
            //     text: 'loading',
            //     color: '#4cbbff',
            //     textColor: '#4cbbff',
            //     maskColor: 'rgba(0, 0, 0, 0.9',
            // });

            getRelations(GetQueryString("objectId"), flag, firstFlag);
            myEchart.on('click', function (param) {
                var arrayIndex = param.dataIndex;
                if (param.dataType == 'node') {
                    objectType = param.data.objectType;
                    var objectid = param.data.OBJECTID;
                    getRelations(objectid)
                }
            });
            myEchart.on('contextmenu', function (param) {
                param.event.event.preventDefault();
                if (param.data.objectType == "person") {
                    var url = '../person/personDetail?paId=' + param.data.OBJECTID + '';
                    openNewWindow(url);
                } else if (param.data.objectType == "unit") {
                    var url = '../common/unitDetail?unitId=' + param.data.OBJECTID + '';
                    openNewWindow(url);
                }
            });
        }

        $(function () {
            var flag = GetQueryString("flag");
            if (flag != 'show') {
                $("#pagediv").addClass("overflow")
                $("#graph").addClass("setheight214")
            } else {
                $("#graph").addClass("setheight600")
            }


            initGraph(true, true)
        });

        function getPersonInfo(personId) {
            $.ajax({
                type: "get",
                url: "/persons/" + personId,
                dataType: "json",
                async: false,
                success: function (result) {
                    object = result.data;
                    if (!object.gender) {
                        object.gender = '未知';
                    }
                    if (!object.liveAddr) {
                        object.liveAddr = '未知';
                    }
                    if (!object.phoneNo) {
                        object.phoneNo = '未知';
                    }
                    if (!object.personIdentityNo) {
                        object.personIdentityNo = '未知';
                    }
                }
            });
        }

        function getUnitInfo(objectId) {
            $.ajax({
                type: "GET",
                url: "/units/" + objectId,
                dataType: "json",
                async: false,
                success: function (result) {
                    object = result.data;
                }
            });
        }

        function getEventInfo(eventId) {
            $.ajax({
                type: "POST",
                url: "/eventInfo/findById",
                dataType: "json",
                data: {
                    eventId: eventId
                },
                async: false,
                success: function (result) {
                    object = result.data;
                }
            });
        }

        function getRelations(objectid, flag, firstFlag) {
            var data = {};
            if (objectType == 'person' || objectType == 'unit') {
                data.id = objectid;
                data.objectType = 'event';
                data.type = objectType;
            } else if (objectType == 'event') {
                data.id = objectid;
                objectType = null;
            } else {
                data.id = objectid;
                data.objectType = objectType;
            }

            $.ajax({
                type: "GET",
                url: "/eventInfo/findEventRelationObject",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (flag) {
                        if (result.data.length == 0) {
                            $("#pagediv").addClass("zwsj");
                            myEchart.hideLoading();
                            return
                        } else {
                            $("#pagediv").removeClass("zwsj");
                        }
                    }
                    var data = [];

                    if (objectType == '' || objectType == null) {
                        getEventInfo(objectid);
                        if (firstFlag) {
                            data.push({
                                OBJECTID: objectid,
                                OBJECTNAME: object.eventName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                OCCURRED_TIME: object.occurredTime,
                                OCCURRED_PLACE: object.occurredPlace,
                                objectType: 'event',
                                label: {
                                    color: '#fff'
                                },
                                itemStyle: {
                                    normal: {
                                        color: "#5ca4ff"
                                    },
                                }
                            });
                        } else {
                            data.push({
                                OBJECTID: objectid,
                                OBJECTNAME: object.eventName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                OCCURRED_TIME: object.occurredTime,
                                OCCURRED_PLACE: object.occurredPlace,
                                objectType: 'event',
                                label: {
                                    color: '#F0AC3A'
                                },
                                itemStyle: {
                                    normal: {
                                        borderWidth: 1,
                                        borderColor: '#F0AC3A',
                                        color: "#FFEED2"
                                    },
                                }
                            });
                        }

                    } else if (objectType == 'unit') {
                        getUnitInfo(objectid);
                        if (firstFlag) {
                            data.push({
                                OBJECTID: objectid,
                                OBJECTNAME: object.unitName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                UNIT_ADDR: object.unitAddr,
                                objectType: 'unit',
                                label: {
                                    color: '#fff'
                                },
                                itemStyle: {
                                    normal: {
                                        // borderWidth: 1,
                                        // borderColor: '#F0AC3A',
                                        color: "#5ca4ff"
                                    },
                                }
                            });
                        } else {
                            data.push({
                                OBJECTID: objectid,
                                OBJECTNAME: object.unitName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                UNIT_ADDR: object.unitAddr,
                                objectType: 'unit',
                                label: {
                                    color: '#F0AC3A'
                                },
                                itemStyle: {
                                    normal: {
                                        borderWidth: 1,
                                        borderColor: '#F0AC3A',
                                        color: "#FFEED2"
                                    },
                                }
                            });
                        }

                    } else if (objectType == 'person') {
                        getPersonInfo(objectid);
                        if (firstFlag) {
                            data.push({
                                OBJECTID: objectid,
                                OBJECTNAME: object.personName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                PERSON_NO: object.personNo,
                                PERSON_PHONE_NO: object.personPhoneNo,
                                PERSON_AGE: object.personAge,
                                objectType: 'person',
                                label: {
                                    color: '#fff'
                                },
                                itemStyle: {
                                    normal: {
                                        // borderWidth: 1,
                                        // borderColor: '#F0AC3A',
                                        color: "#5ca4ff"
                                    },
                                }
                            });
                        } else {
                            data.push({
                                OBJECTID: objectid,
                                OBJECTNAME: object.personName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                PERSON_NO: object.personNo,
                                PERSON_PHONE_NO: object.personPhoneNo,
                                PERSON_AGE: object.personAge,
                                objectType: 'person',
                                label: {
                                    color: '#F0AC3A'
                                },
                                itemStyle: {
                                    normal: {
                                        borderWidth: 1,
                                        borderColor: '#F0AC3A',
                                        color: "#FFEED2"
                                    },
                                }
                            });
                        }
                    }
                    var links = [];
                    for (var i = 0; i < result.data.length; i++) {
                        if (result.data[i].objectType == 'person') {
                            data.push({
                                OBJECTID: result.data[i].personId,
                                OBJECTNAME: result.data[i].personName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                PERSON_NO: result.data[i].personNo,
                                PERSON_PHONE_NO: result.data[i].personPhoneNo,
                                PERSON_AGE: result.data[i].personAge,
                                objectType: 'person',
                                label: {
                                    color: '#2C9BEB'
                                },
                                itemStyle: {
                                    normal: {
                                        borderWidth: 1,
                                        borderColor: '#2C9BEB',
                                        color: "#C8E6FF"
                                    },
                                }
                            });
                        } else if (result.data[i].objectType == 'unit') {
                            data.push({
                                OBJECTID: result.data[i].unitId,
                                OBJECTNAME: result.data[i].unitName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                UNIT_ADDR: result.data[i].unitAddr,
                                objectType: 'unit',
                                label: {
                                    color: '#2C9BEB'
                                },
                                itemStyle: {
                                    normal: {
                                        borderWidth: 1,
                                        borderColor: '#2C9BEB',
                                        color: "#C8E6FF"
                                    },
                                }
                            });
                        }
                        //事件
                        else {
                            data.push({
                                OBJECTID: result.data[i].eventId,
                                OBJECTNAME: result.data[i].eventName,
                                RELATION_NAME: "",
                                OBJECT_RELATION_NAME: "",
                                OCCURRED_TIME: result.data[i].occurredTime,
                                OCCURRED_PLACE: result.data[i].occurredPlace,
                                objectType: 'event',
                                label: {
                                    color: '#2C9BEB'
                                },
                                itemStyle: {
                                    normal: {
                                        borderWidth: 1,
                                        borderColor: '#2C9BEB',
                                        color: "#C8E6FF"
                                    },
                                }
                            });
                        }
                        links.push({
                            "OBJECTID1": data[0].OBJECTID,
                            "OBJECTID2": data[i + 1].OBJECTID,
                            "source": i + 1,
                            "target": 0,
                            "value": '',
                        });
                    }
                    mergeData('node', data);
                    mergeData('relation', links);
                    var option = myEchart.getOption();
                    if (option == null || option == undefined) {
                        option = getOption(nodeData, relationData);
                    } else {
                        option.series[0].data = nodeData;
                        option.series[0].links = relationData;
                    }
                    myEchart.hideLoading();
                    myEchart.setOption(option);
                }, error: function (e) {
                    $("#pagediv").addClass("zwsj");
                    myEchart.hideLoading();
                }

            });
        }

        function getOption(nodeData, relationData) {
            var option = {
                "title": {"text": ""},
                tooltip: {
                    trigger: 'item',
                    position: 'bottom',
                    textStyle: {
                        fontSize: 10
                    },
                    formatter: function (e) {
                        var n = e.data;
                        var html = "";
                        if (e.value) {
                            html = n.value;
                        } else {
                            if (n.objectType == 'person') {
                                html += "姓名：" + isValidStr(n.OBJECTNAME) + "<br>";
                                html += "身份证号：" + isValidStr(n.PERSON_NO) + "<br>";
                                html += "手机号：" + isValidStr(n.PERSON_PHONE_NUM) + "<br>";
                                html += "年龄：" + isValidStr(n.PERSON_AGE) + "<br>";
                            } else if (n.objectType == 'unit') {
                                html += "单位名称：" + isValidStr(n.OBJECTNAME) + "<br>";
                                html += "单位地址：" + isValidStr(n.UNIT_ADDR) + "<br>";

                            } else if (n.objectType == 'event') {

                                var time = n.OCCURRED_TIME;
                                if (time == null || time == 0) {
                                    time = '无';
                                } else {
                                    time = formatDatebox(new Date(n.OCCURRED_TIME), '-', true)
                                }
                                html += "事件名称：" + isValidStr(n.OBJECTNAME) + "<br>";
                                html += "发生时间：" + time + "<br>";
                                html += "发生地点：" + isValidStr(n.OCCURRED_PLACE) + "<br>";
                            }

                        }


                        return html;
                    }
                },
                "animationDurationUpdate": 1500,
                "animationEasingUpdate": "quinticInOut",
                "label": {"normal": {"show": true, "textStyle": {"fontSize": 12}}},
                "series": [{
                    "type": "graph",
                    "layout": "force",
                    "symbolSize": 60,
                    "focusNodeAdjacency": true,
                    "roam": true,

                    "label": {
                        "normal": {
                            "show": true, "textStyle": {"fontSize": 12}, formatter: function (e) {

                                return lineFeed(e.data.OBJECTNAME)
                            }
                        }
                    },
                    "force": {"edgeLength": [50, 60], "repulsion": 1000},
                    "edgeSymbol": ["circle", "arrow"],
                    "edgeSymbolSize": [3, 6],
                    "edgeLabel": {
                        "normal": {
                            "show": true,
                            "color": "#000000",
                            "textStyle": {"fontSize": 10},
                            "formatter": function (e) {
                                return e.data.value;
                            }
                        }
                    },
                    "data": nodeData,
                    "links": relationData,
                    "lineStyle": {"normal": {"opacity": 0.9, "width": 1, "curveness": 0}}

                }]
            };
            return option;
        }

        function mergeData(type, newData) {
            if (newData == null || newData == undefined) {
                return;
            }
            if (type == 'node') {
                if (nodeData.length == 0) {
                    nodeData = newData;
                    for (var i = 0; i < nodeData.length; i++) {
                        nodeMap.set(nodeData[i].OBJECTID, i);
                    }
                } else {
                    for (var i = 0; i < newData.length; i++) {
                        var newVar = nodeMap.get(newData[i].OBJECTID);
                        if (newVar == null || newVar == undefined) {
                            nodeData.push(newData[i]);
                            nodeMap.set(newData[i].OBJECTID, nodeData.length - 1);
                        } else {
                            if (nodeData[newVar].label.color != '#fff') {
                                nodeData[newVar] = newData[i];
                            }

                            //nodeData[i].category=newData[i].category;
                        }
                    }
                }
            } else if (type == 'relation') {
                if (relationData.length == 0) {
                    relationData = newData;
                    for (var i = 0; i < relationData.length; i++) {
                        relationMap.set(relationData[i].OBJECTID1 + "->" + relationData[i].OBJECTID2, i);
                    }
                } else {
                    for (var i = 0; i < newData.length; i++) {
                        var newVar = relationMap.get(newData[i].OBJECTID1 + "->" + newData[i].OBJECTID2);
                        if (newVar == null || newVar == undefined) {
                            var source = nodeMap.get(newData[i].OBJECTID1);
                            var target = nodeMap.get(newData[i].OBJECTID2);
                            newData[i].source = source;
                            newData[i].target = target;
                            relationData.push(newData[i]);
                            relationMap.set(newData[i].OBJECTID1 + "->" + newData[i].OBJECTID2, relationData.length - 1);
                        }
                    }
                }
            }
        }

        function lineFeed(val) {
            var strs = val.split(''); //字符串数组
            var str = '';
            var lines = 0;
            for (var i = 0, s; s = strs[i++];) { //遍历字符串数组
                if (lines > 2) {
                    str += '...';
                    break;
                }
                str += s;
                if (!(i % 4)) {
                    str += '\n';
                    lines++;
                }
            }
            return str;
        }
    </script>

</head>
<body>
<div class="iframeBox" id="pagediv">
    <div class="" id="graph">

    </div>
</div>
</body>
</html>