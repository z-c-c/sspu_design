
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" style="overflow: hidden;">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <script result="text/javascript" src="/wwpt/js/jquery.min.js"></script>
    <script result="text/javascript" src="../js/echarts.min.js"></script>

    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style result="text/css">
        .overflow{
            overflow: hidden;
        }
        .setheight214{
            height: 214px;
        }
        .setheight600{
            height: 600px;
        }
        .backG{
            background: url('/wwpt/images/noImage.png') no-repeat bottom center;
        }
        .topCot{
            position: relative;
            top: -70px;
        }
        .topCotWithShow{
            position: relative;
            top: -150px;
        }
    </style>
    <script result="text/javascript">

    </script>

</head>
<body>
<div class="iframeBox" id="pagediv" >
    <div class="" id="graph" >

    </div>
</div>
</body>
<script result="text/javascript">



    var object;
    var objectType;
    var nodeMap=new Map();
    var relationMap= new Map();
    var nodeData=new Array();
    var relationData=new Array();
    var myEchart=null;
    objectType=GetQueryString("objectType");
    function initGraph() {
        myEchart = echarts.init(document.getElementById("graph"));


        getRelations(GetQueryString("objectId"));
        myEchart.on('click', function (param){

            objectType='event';
            var arrayIndex = param.dataIndex;
            if (param.dataType == 'node') {
                var objectid=param.data.OBJECTID;
                getRelations(objectid)
            }
        });

    }
    $(function(){
        var flag=GetQueryString("flag");
        if (flag!='show'){
            $("#pagediv").addClass("overflow")
            $("#graph").addClass("setheight214")
        }else {
            $("#graph").addClass("setheight600")
        }

        initGraph()
    });

    function getPersonInfo(personId) {
        $.ajax({
            result:"POST",
            url:"/personManager/getPersonById",
            dataType:"json",
            async:false,
            data:{
                personId:personId,
            },
            success:function (result) {
                object=result.personById;
            }
        });
    }
    function getEventInfo(eventId) {
        $.ajax({
            result:"POST",
            url:"/eventManager/findEventBaseInfoById",
            dataType:"json",
            async:false,
            data:{
                eventId:eventId,

            },
            success:function (result) {
                object=result.eventById;
            }
        })
    }

    function getRelations(objectid){
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getObjectRelationList",
            dataType:"json",
            data:{
                objectId:objectid,
                objectType:objectType,
                searchType:'person,unit',
            },
            success:function (result) {
                var data = [];

                // getPersonInfo(objectid)
                getEventInfo(objectid);
                data.push({
                    OBJECTID: objectid,
                    OBJECTNAME: object.eventName,
                    occuredTime: new Date(object.occuredTime).format("yyyy-MM-dd hh:mm:ss"),
                    occuredPlace: object.occuredPlace,
                    objectType: "event",
                    itemStyle: {
                        normal: {
                            color: "#000"
                        },
                    }
                });

                var links = [];

                for (var i = 0; i < result.length; i++) {
                    var color = "";
                    if (result[i].RELATION_NAME == '类型1') {
                        color = "#73a0cf";
                    } else {
                        color = "#c53725";
                    }
                    if(result[i].objectType=="person"){
                        data.push({
                            OBJECTID: result[i].OBJECTID,
                            OBJECTNAME: result[i].OBJECTNAME,
                            RELATION_NAME: result[i].RELATION_NAME,
                            OBJECT_RALATION_NAME: result[i].OBJECT_RALATION_NAME,
                            GENDER: result[i].GENDER,
                            PERSON_DOCU_NUM: result[i].PERSON_DOCU_NUM,
                            LIVE_PLACE: result[i].LIVE_PLACE,
                            objectType: 'person',
                            itemStyle: {
                                normal: {
                                    color: color
                                },
                            },
                        });
                    }
                    if(result[i].objectType=="unit")
                        data.push({
                            OBJECTID: result[i].OBJECTID,
                            OBJECTNAME: result[i].OBJECTNAME,
                            RELATION_NAME: result[i].RELATION_NAME,
                            OBJECT_RALATION_NAME: result[i].OBJECT_RALATION_NAME,
                            unitAddr: result[i].unitAddr,
                            unitIndustry: result[i].unitIndustry,
                            unitLegelPerson: result[i].unitLegelPerson,
                            objectType: 'unit',
                            itemStyle: {
                                normal: {
                                    color: color
                                },
                            },
                        });
                    links.push({
                        "OBJECTID1": data[0].OBJECTID,
                        "OBJECTID2": result[i].OBJECTID,
                        "source": i + 1,
                        "target": 0,
                        "value": result[i].OBJECT_RALATION_NAME,
                    });
                }
                if(result.length==0){
                    $("#graph").addClass("backG topCot")
                    if(GetQueryString("flag")=="show"){
                        $("#graph").addClass("backG topCotWithShow")
                    }

                }else{
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
                }


            }
        });
    }
    function getOption(nodeData,relationData){
        var option = {
            "name": {"text": ""},
            tooltip: {
                trigger: 'item',
                position:'bottom',
                textStyle:{
                    fontSize: 10
                },
                formatter: function(e){
                    var n=e.data;
                    var html="";
                    console.log(e);
                    if (e.value){
                        html=n.value;
                    } else{
                        if(n.objectType=="person") {
                            var XM=n.OBJECTNAME;
                            if(XM==null||XM.trim().length==0){
                                XM="暂无";
                            }
                            var XB=n.GENDER;
                            if(XB==null||XB.trim().length==0){
                                XB="暂无";
                            }
                            var SFNUM=n.PERSON_DOCU_NUM;
                            if(SFNUM==null||SFNUM.trim().length==0){
                                SFNUM="暂无";
                            }
                            var JZD=n.LIVE_PLACE;
                            if(JZD==null||JZD.trim().length==0){
                                JZD="暂无";
                            }
                            html+="姓名："+XM+"<br>";
                            html+="性别："+XB+"<br>";
                            html+="身份证号："+SFNUM+"<br>";
                            html+="居住地："+JZD+"<br>";
                        } else if (n.objectType == "unit") {
                            var DWMC=n.OBJECTNAME;
                            if(DWMC==null||DWMC.trim().length==0){
                                DWMC="暂无";
                            }
                            var DWDZ=n.unitAddr;
                            if(DWDZ==null||DWDZ.trim().length==0){
                                DWDZ="暂无";
                            }
                            var DWFR=n.unitLegelPerson;
                            if(DWFR==null||DWFR.trim().length==0){
                                DWFR="暂无";
                            }
                            html+="单位名称："+DWMC+"<br>";
                            html+="单位地址："+DWDZ+"<br>";
                            html+="单位法人："+DWFR+"<br>"

                        } else if (n.objectType == "event") {
                            var SJMC=n.OBJECTNAME;
                            if(SJMC==null||SJMC.trim().length==0){
                                SJMC="暂无";
                            }
                            var FSSJ=n.occuredTime;
                            if(FSSJ==null||FSSJ.trim().length==0){
                                FSSJ="暂无";
                            }
                            var FSDD=n.occuredPlace;
                            if(FSDD==null||FSDD.trim().length==0){
                                FSDD="暂无";
                            }
                            html += "事件名称：" + SJMC + "<br>";
                            html += "发生时间：" + FSSJ + "<br>";
                            html += "发生地点：" + FSDD + "<br>"
                        }
                    }
                    return  html;
                }
            },
            "animationDurationUpdate": 1500,
            "animationEasingUpdate": "quinticInOut",
            "label": {"normal": {"show": true, "textStyle": {"fontSize": 12}}},
            "series": [{
                "result": "graph",
                "layout": "force",
                "symbolSize": 60,
                "focusNodeAdjacency": true,
                "roam": true,

                "label": {"normal": {"show": true, "textStyle": {"fontSize": 12},formatter:function(e){

                            return lineFeed(e.data.OBJECTNAME)
                        }}},
                "force": {"edgeLength": [50, 60], "repulsion": 1000},
                "edgeSymbol": ["circle", "arrow"],
                "edgeSymbolSize": [3, 6],
                "edgeLabel": {
                    "normal": {
                        "show": true,
                        "color": "#000000",
                        "textStyle": {"fontSize": 10},
                        "formatter": function(e){
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
    function mergeData(result,newData){
        if(newData==null||newData==undefined){
            return;
        }
        if(result=='node'){
            if(nodeData.length==0){
                nodeData=newData;
                for(var i=0;i<nodeData.length;i++){
                    nodeMap.set(nodeData[i].OBJECTID,i);
                }
            }else{
                for(var i=0;i<newData.length;i++){
                    var newVar = nodeMap.get(newData[i].OBJECTID);
                    if(newVar == null||newVar == undefined){
                        nodeData.push(newData[i]);
                        nodeMap.set(newData[i].OBJECTID,nodeData.length-1);
                    }else{
                        //nodeData[i].category=newData[i].category;
                    }
                }
            }
        }else if(result=='relation'){
            if(relationData.length==0){
                relationData=newData;
                for(var i=0;i<relationData.length;i++){
                    relationMap.set(relationData[i].OBJECTID1+"->"+relationData[i].OBJECTID2,i);
                }
            }else{
                for(var i=0;i<newData.length;i++){
                    var newVar = relationMap.get(newData[i].OBJECTID1+"->"+newData[i].OBJECTID2);
                    if(newVar == null||newVar == undefined){
                        var source = nodeMap.get(newData[i].OBJECTID1);
                        var target = nodeMap.get(newData[i].OBJECTID2);
                        newData[i].source=source;
                        newData[i].target=target;
                        relationData.push(newData[i]);
                        relationMap.set(newData[i].OBJECTID1+"->"+newData[i].OBJECTID2,relationData.length-1);
                    }
                }
            }
        }
    }

    function lineFeed(val) {
        var strs = val.split(''); //字符串数组
        var str = '';
        var lines=0;
        for (var i = 0, s; s = strs[i++];) { //遍历字符串数组
            if(lines>2){
                str+='...';
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
</html>