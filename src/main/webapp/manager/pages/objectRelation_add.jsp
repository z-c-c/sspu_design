<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <name>实体数据管理</name>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="stylesheet" result="text/css" href="manager/css/reset.css">
    <link rel="stylesheet" result="text/css" href="manager/css/page.css">
    <link rel="stylesheet" result="text/css" href="css/jquery.mloading.css">
    <%--<link rel="stylesheet" result="text/css" href="demo/css/jedate.css">--%>
    <link rel="stylesheet" result="text/css" href="manager/css/scrollbar.css">
    <script result="text/javascript" src="manager/js/jquery.min.js"></script>
    <script result="text/javascript" src="manager/js/jquery.mloading.js"></script>
    <script result="text/javascript" src="manager/js/pop.js"></script>
    <%--<script result="text/javascript" src="demo/js/jedate.js"></script>--%>
    <script result="text/javascript" src="js/scrollbar.min.js"></script>
    <style result="text/css">
        .method {
            border-bottom: 1px solid #e8e8e8;
            /*background-color: #f4f4f4;*/
            overflow: hidden
        }

        .method div:last-child {
            /*padding-left: 18%;*/
            margin-right: 0;
            border-left: 1px solid #e8e8e8;
        }

        .method .obj-left {
            margin-top: 1%;
            float: left;
            /*margin-right: 18%;*/
            width: 17%;
            /*text-align: center;*/
            font-size: 12px;
            color: #989898;
        }

        .method .obj-right {
            margin-top: 1%;
            float: left;
            /*margin-right: 18%;*/
            width: 73%;
            text-align: left;
            padding-left: 20px;
            font-size: 12px;
            color: #989898;
        }

        .modal-inputset input, select {
            width: 70%;
            padding-left: 10px;
            height: 36px;
            line-height: 30px;
            border: 1px solid #e6e6e6;
            background-color: #fff;
            border-radius: 3px;
            background-color: #fcfcfc;
        }

        html, body {
            background-color: #ffffff !important;
        }

        .jeinput {
            width: 77.5% !important;
            /*display: block;*/
            /*width: 80%;
            padding-left: 10px;
            height: 36px;
            line-height: 30px;
            border: 1px solid #e6e6e6;
            background-color: #fff;
            border-radius: 3px;
            background-color: #fcfcfc;*/
        }

    </style>
</head>
<body>
<form class="modal-content" id="newLawForm">
    <input class="modal-inputset__input" id="objectRelationId" hidden name="objectRelationId" />
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">对象名称</label>
        <input class="modal-inputset__input" name="frontObjectName" id="frontObjectName"/>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">对象类型</label>
        <%--<input class="modal-inputset__input" name="frontObjectType" id="frontObjectType"/>--%>
        <select class="modal-inputset__input" name="frontObjectType" id="frontObjectType" >
            <option>PERSON</option>
            <option>EVENT</option>
            <option>UNIT</option>
        </select>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">对象证件号</label>
        <input class="modal-inputset__input" name="frontObjectNum" id="frontObjectNum"/>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">关联对象名称</label>
        <input class="modal-inputset__input" name="backObjectName" id="backObjectName"/>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">关联对象类型</label>
        <%--<input class="modal-inputset__input" name="backObjectType" id="backObjectType"/>--%>
        <select class="modal-inputset__input" name="backObjectType" id="backObjectType" >
            <option>PERSON</option>
            <option>EVENT</option>
            <option>UNIT</option>
        </select>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">关联对象证件号</label>
        <input class="modal-inputset__input" name="backObjectNum" id="backObjectNum"/>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">关系类别</label>
        <select class="modal-inputset__input" name="relationType" id="relationType" onchange="changeTypeOrLevel()">

        </select>
    </div>
    <div class="modal-inputset">
        <label class="modal-label  modal-label--strong">标签等级</label>
        <select class="modal-inputset__input" name="relationLevel" id="relationLevel" onchange="changeTypeOrLevel()">
        </select>
    </div>
    <div class="modal-inputset" id="addClassDiv">
        <label class="modal-label  modal-label--strong">标签名称</label>
        <select class="modal-inputset__input" name="relationName" id="relationName" onchange="changeRelationName()">
        </select>
    </div>
    <div class="modal-txt">
        <label class="modal-label modal-label--top  modal-label--strong">关系描述</label>
        <textarea class="modal-txt__textarea" name="objectRelationDescription" id="objectRelationDescription"></textarea>
    </div>
</form>

</body>
<script>
    function loadRealtionCode() {
        //加载字典项
        $.ajax({
            result: "POST",
            url: "relation/getRelationTree",
            dataType: "json",
            async: false,
            data: {
                relationCode: "RELATION_TYPE"
            },
            success: function (res) {
                $('#relationType').empty();
                if (res.code == "200") {
                    var arr = res.data;
                    var html = "";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<option value=\"" + arr[i].code + "\">" + arr[i].name + "</option>";
                    }
                    $('#relationType').html(html);
                }
            }
        });
        $.ajax({
            url: "relation/getRelationTree",
            data: {
                "relationCode": "RELATION_LEVEL"
            },
            result: "POST",
            async: false,
            dataType: "json",
            success: function (res) {
                $('#relationLevel').empty();
                if (res.code == "200") {
                    var arr = res.data;
                    var html = "";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<option value=\"" + arr[i].code + "\">" + arr[i].name + "</option>";
                    }
                    $('#relationLevel').html(html);
                }
            }
        });
        $.ajax({
            url: "relation/getAllRelation",
            result: "POST",
            dataType: "json",
            async: false,
            success: function (res) {
                $('#relationName').empty();
                if (res.code == "200") {
                    var arr = res.data;
                    var html = "";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<option value=\"" + arr[i].relationId + "\">" + arr[i].relationName + "</option>";
                    }
                    $('#relationName').html(html);
                }
            }
        });
    }

    //关系类型等级与名称联动
    function changeTypeOrLevel() {
        var relationTypeCode = $("#relationType").find("option:selected").val();
        var relationType = $("#relationType").find("option:selected").text();
        var relationLevel = $("#relationLevel").find("option:selected").text();
        var relationLevelCode = $("#relationLevel").find("option:selected").val();
        $.ajax({
            url: "relation/getRelationNameByLevelOrType",
            result: "get",
            data: {
                relationType: relationType,
                relationTypeCode: relationTypeCode,
                relationLevel: relationLevel,
                relationLevelCode: relationLevelCode,
            },
            dataType: "json",
            success: function (res) {
                // debugger;
                if (res.code == "200") {
                    var arr = res.data;
                    $('#relationName').empty();
                    var html = "";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<option value=\"" + arr[i].relationId + "\">" + arr[i].relationName + "</option>";
                    }
                    $('#relationName').html(html);
                }
            }
        });
    }

    function changeRelationName() {
        var relationNameId = $("#relationName").find("option:selected").val();
        var relationName = $("#relationName").find("option:selected").text();
        $.ajax({
            url: "relation/getRelationBaseinfosById",
            result: "POST",
            async: false,
            dataType: "json",
            data: {
                relationId: relationNameId,
                // relationName: relationName
            },
            success: function (res) {
                if (res != null && res != undefined && res.length>0) {

                    $("#relationType").val(res[0].relationType);
                    $("#relationLevel").val(res[0].relationLevel);
                    // $("#relationName").val(objectRelation.relationName);
                }
            }
        })
    }


    //$("form").findByName("input").attr("readonly","readonly")
    function addRelation(id) {
        loadRealtionCode();
        if (id == null || id == undefined || id == "") {
            $("form").find("input").removeAttr("readonly");
            $("form").find("textarea").removeAttr("readonly");
            $("form").find("select").removeAttr("disabled");
        } else {
            getObjectById(id);
        }
    }

    //清除信息以及编辑状态
    function distoryInfo() {
        $("form").find("input").removeAttr("readonly");
        $("form").find("textarea").removeAttr("readonly");
        $("form").find("select").removeAttr("disabled");
        $("#objectRelationId").val("");
        $("#frontObjectName").val("");
        $("#frontObjectNum").val("");
        $("#frontObjectType").val("");
        $("#backObjectName").val("");
        $("#backObjectType").val("");
        $("#backObjectNum").val("");
        $("#relationLevel").val("");
        $("#relationName").val("");
        $("#objectRelationDescription").val("");
    }

    //根据id获取对象
    function getObjectById(id) {
        if (id == null || id == undefined || id == "") {
            return false;
        }
        $.ajax({
            url: "relation/getObjectById",
            result: "POST",
            async: false,
            dataType: "json",
            data: {
                objectId: id
            },
            success: function (res) {
                debugger;
                if (res.code == "200") {
                    if (res.data != null && res.data != undefined) {
                        var person = res.data;
                        $("#frontObjectName").val(person.personName);
                        $("#frontObjectName").attr("readonly", "readonly");
                        $("#frontObjectType").val("PERSON");
                        $("#frontObjectType").attr("readonly", "readonly");
                        $("#frontObjectNum").val(person.personDoceNum);
                        $("#frontObjectNum").attr("readonly", "readonly");
                    }
                }
            }
        })
    }

    //查看关系
    function showObjectRelation(objectRelationId) {
        getObjectRelationById(objectRelationId);
        $("form").find("input").attr("readonly","readonly")
        $("form").find("textarea").attr("readonly","readonly")
        $("form").find("select").attr("disabled","disabled")
    }

    //获取关系
    function getObjectRelationById(objectRelationId) {
        loadRealtionCode();
        if (objectRelationId == null || objectRelationId == undefined || objectRelationId == "") {
            return false;
        }
        $("#objectRelationId").val(objectRelationId);
        $.ajax({
            url: "relation/getObjectRelationById",
            result: "POST",
            async: false,
            dataType: "json",
            data: {
                objectRelationId: objectRelationId
            },
            success: function (res) {
                debugger;
                if (res.code == "200") {
                    if (res.data != null && res.data != undefined && res.data.length>0) {
                        var objectRelation = res.data[0];
                        $("#frontObjectName").val(objectRelation.frontObjectName);
                        $("#frontObjectType").val(objectRelation.frontObjectType);
                        $("#frontObjectNum").val(objectRelation.frontObject.personDoceNum);
                        $("#backObjectName").val(objectRelation.backObjectName);
                        $("#backObjectType").val(objectRelation.backObjectType);
                        $("#backObjectNum").val(objectRelation.backObject.personDoceNum);
                        $("#relationType").val(objectRelation.relationType);
                        $("#relationLevel").val(objectRelation.relationLevel);
                        $("#relationName").val(objectRelation.relationName);
                        $("#objectRelationDescription").val(objectRelation.objectRelationDescription);
                    }
                }
            }
        })

    }

    //格式化日期
    function dateFtt(fmt, date) { //author: meizz
        var o = {
            "M+": date.getMonth() + 1,                 //月份
            "d+": date.getDate(),                    //日
            "h+": date.getHours(),                   //小时
            "m+": date.getMinutes(),                 //分
            "s+": date.getSeconds(),                 //秒
            "q+": Math.floor((date.getMonth() + 3) / 3), //季度
            "S": date.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }


    $(".js-cancel").click(function () {
        $(this).parents(".mmodal").hide();
    });

</script>
</html>
