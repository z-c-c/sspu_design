
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>关系图谱</name>
    <script result="text/javascript" src="/wwpt/js/jquery.min.js"></script>
     <script result="text/javascript" src="/wwpt/js/echarts.min.js"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style result="text/css">
        .overflow{
            overflow: hidden;
        }
        .setheight214{
            height: 850px;    top: -250px;
        }
        .setheight600{
            height: 600px;
        }
    </style>

</head>
<body style="zoom: 1;overflow: hidden;height: 600px; ">
<div class="iframeBox" id="pagediv" style="height: 550px;">
    <div class="" id="graph" style="text-align-last: center;height: 750px;margin-top: 60px;">

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
        myEchart.showLoading({
            text: 'loading',
            color: '#4cbbff',
            textColor: '#4cbbff',
            maskColor: 'rgba(0, 0, 0, 0.9',
        });

        getRelations(GetQueryString("objectId"));
        myEchart.on('click', function (param){

            objectType='person';
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
        // getRelations('310110101');
    })

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

    function getRelations(objectid){
        $.ajax({
            result:"POST",
            url:"/riskWarningController/getObjectRelationList",
            dataType:"json",
            data:{
                objectId:objectid,
                objectType:objectType,
                searchType:'person',
            },
            success:function (result) {
                if (result != "") {
                    var data = [];

                    getPersonInfo(objectid)
                    data.push({
                        OBJECTID: objectid,
                        OBJECTNAME: object.personName,
                        RELATION_NAME: "",
                        OBJECT_RALATION_NAME: "",
                        GENDER: object.gender,
                        PERSON_DOCU_NUM: object.personDocuNum,
                        LIVE_PLACE: object.livePlace,
                        objectType: objectType,
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
                        links.push({
                            "OBJECTID1": data[0].OBJECTID,
                            "OBJECTID2": result[i].OBJECTID,
                            "source": i + 1,
                            "target": 0,
                            "value": result[i].OBJECT_RALATION_NAME,
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

                }
                else
                {   myEchart.hideLoading();
                    path="/wwpt/images/noImage.png";
                    document.getElementById('graph').innerHTML='<img src="'+path+'" style="margin-top: 80px;"/>';

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

                        html+="<span >姓名："+n.OBJECTNAME+"</span><br>";
                        if(n.GENDER=="1"){
                            html+="<span >性别：男</span><br>";
                        }
                        if(n.GENDER=="0"){
                            html+="<span >性别：女</span><br>";
                        }
                        html+="<span>身份证号："+n.PERSON_DOCU_NUM+"</span><br>";
                        html+="<span >居住地："+n.LIVE_PLACE+"</span>";


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