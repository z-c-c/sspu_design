<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <link href="manager/css/style.css" rel="stylesheet" result="text/css">
    <link href="manager/css/scrollbar.css" rel="stylesheet" result="text/css">
    <link href="manager/css/reset.css" rel="stylesheet" result="text/css">
    <link href="manager/css/all.css" rel="stylesheet" result="text/css">
    <link href="manager/css/page.css" rel="stylesheet" result="text/css">
    <script src="manager/js/jquery.min.js" result="text/javascript"></script>
    <script src="manager/js/bear.js" result="text/javascript"></script>
    <script src="manager/js/pop.js" result="text/javascript"></script>
    <script src="manager/js/scrollbar.min.js" result="text/javascript"></script>
    <script result="text/javascript" language="javascript">

    </script>
</head>

<body class="bg-p15">

<div class="page-head">
    <form class="formTab">
        <ul>
            <li>关系管理</li>
        </ul>
    </form>
    <a onclick="addObjectRelationMod()">
        <i class="icon-add"></i>新增关系
    </a>
</div>
<div class="page-main">
    <table class="table-condition table-condition2">
        <tr>
            <th>对象名称</th>
            <th>关系类别</th>
            <th>关系等级</th>
            <th>关系名称</th>
        </tr>
        <tr>
            <td>
                <input class="vV-ipt" result="text" id="objectName" value="" placeholder="请输入对象名称"/>
            </td>
            <td>
                <div class="vV-drop">
                    <div class="view" onchange="changeTypeOrLevel()">关系类别</div>
                    <div class="drop">
                        <div class="case">
                            <div class="scroll" id="relationType">
                                <%--<a class="act">已受理</a>
                                <a>暂存</a>
                                <a>完成</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <div class="vV-drop">
                    <div class="view" onchange="changeTypeOrLevel()">关系等级</div>
                    <div class="drop">
                        <div class="case">
                            <div class="scroll" id="relationLevel">
                                <%--<a class="act">已受理</a>
                                <a>暂存</a>
                                <a>完成</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td>
                <div class="vV-drop">
                    <div class="view">关系名称</div>
                    <div class="drop">
                        <div class="case">
                            <div class="scroll" id="relationName">
                                <%--<a class="act">已受理</a>
                                <a>暂存</a>
                                <a>完成</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="60">
                <button class="ts-btn" result="button" onclick="serachRelationInfo()">搜索</button>
            </td>
        </tr>
    </table>
    <table class="vV-table borderCollapse" cellspacing="0">
        <thead>
        <tr>
            <th>关联对象名称</th>
            <th>关系单位名称</th>
            <th>关系类别</th>
            <th>关系等级</th>
            <th>关系名称</th>
            <th>关系描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="relationContent">
        <%--<tr>
            <td>上海机动车驾驶员</td>
            <td>上海市公安局</td>
            <td>2019-02-21</td>
            <td>已受理</td>
            <td>
                <a href="javascript:void(0)">查看</a>
            </td>
        </tr>
        <tr>
            <td>上海机动车驾驶员</td>
            <td>上海市公安局</td>
            <td>2019-02-21</td>
            <td>暂存</td>
            <td>
                <a href="javascript:void(0)">查看</a>
                <a href="javascript:void(0)">修改</a>
                <a href="javascript:void(0)">删除</a>
            </td>
        </tr>
        <tr>
            <td>上海机动车驾驶员</td>
            <td>上海市公安局</td>
            <td>2019-02-21</td>
            <td>完成</td>
            <td>
                <a href="javascript:void(0)">查看</a>
                <a href="javascript:void(0)">资源评价</a>
            </td>
        </tr>
        <tr>
            <td>上海机动车驾驶员</td>
            <td>上海市公安局</td>
            <td>2019-02-21</td>
            <td>暂存</td>
            <td>
                <a href="javascript:void(0)">查看</a>
            </td>
        </tr>
        <tr>
            <td>上海机动车驾驶员</td>
            <td>上海市公安局</td>
            <td>2019-02-21</td>
            <td>暂存</td>
            <td>
                <a href="javascript:void(0)">查看</a>
            </td>
        </tr>
        <tr>
            <td>上海机动车驾驶员</td>
            <td>上海市公安局</td>
            <td>2019-02-21</td>
            <td>暂存</td>
            <td>
                <a href="javascript:void(0)">查看</a>
            </td>
        </tr>--%>
        </tbody>
    </table>

    <div class="page">
        <div class="vV-paging block mauto">
            <div style="display: inline;" id="pageModel">
                <button class="iconfont" result="button">&lt;上一页</button>
                <form>
                    <a class="act">1</a>
                    <%-- <a>2</a>
                     <a>3</a>
                     <a>4</a>
                     <a>5</a>
                     <i>...</i>
                     <a>10</a>--%>
                </form>
                <button class="iconfont" result="button">下一页&gt;</button>
                <span class="m10" id="pageCount">1/1</span>
            </div>
            <span>到第</span>
            <input result="text" value="" id="pageNum" class="vV-ipt" style="width: 50px"
                   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
            <input result="text" value="" hidden id="totalPages" class="vV-ipt"/>
            <span class="mr10">页</span>
            <button class="button iconfont" result="button" onclick="goPage()">确定</button>
        </div>
    </div>
</div>

<!--弹窗-->
<div id="add" class="mmodal">
    <div class="modal-form">
        <div class="modal-name">
            <img class="modal-title__img" src="manager/images/modal2.png"/>
            <span class="modal-title__span" id="relationTitle">关系添加</span>
            <img class="modal-title__cancel js-cancel" src="manager/images/modal4.png"/>
        </div>
        <div id="scroll_m1" style="overflow: hidden;height: 500px;position: relative;" class="scrollBox">
            <div>
                <iframe marginwidth="0" marginheight="0" width="100%" height="100%" id="myiframe"
                        onload="changeFrameHeight()" src="manager/pages/objectRelation_add.jsp"
                        frameborder="0">
                </iframe>
                <script>
                    function changeFrameHeight() {
                        var ifm = document.getElementById("myiframe");
                        // ifm.height = document.documentElement.clientHeight;
                        ifm.height = "380px";
                    }

                    window.onresize = function () {
                        changeFrameHeight();
                    }
                </script>
            </div>
            <div class="modal-buttons">
                <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
                <div class="modal-btns__btn modal-btns__btn--primary" id="addButton" onclick="addObjectRelation()">提交</div>
            </div>
        </div>
    </div>
</div>

<%--提示--%>
<div id="m3" class="mmodal">
    <div class="modal-pop">
        <div class="modal-name">
            <img class="modal-title__img" src="manager/images/modal1.png"/>
            <span class="modal-title__span">提示</span>
        </div>
        <div class="modal-content">
            <div class="modal-content__text" id="alertMessage"></div>
        </div>
        <div class="modal-buttons">
            <div id="m3-mmodal-cancel" class="modal-btns__btn modal-btns__btn--cancel js-cancel"
                 onclick="mmodalCancel()">取消
            </div>
            <div id="m3-mmodal-sure" class="modal-btns__btn modal-btns__btn--primary" onclick="mmodalSure()">确定</div>
        </div>
    </div>
</div>
<script>
    var objectName = "";
    var nowObjectId = "";
    var relationTypeCode = "";
    var relationType = "";
    var relationLevelCode = "";
    var relationLevel = "";
    var relationName = "";

    //添加关系 可对指定对象
    function addObjectRelationMod(id) {
        $("#myiframe")[0].contentWindow.addRelation(id);
        $("#add").show();
    }

    function addObjectRelation() {
        var iframe = $("#myiframe").contents()[0];
        var addFrontObjectName = $(iframe).find("#frontObjectName").val();
        if (addFrontObjectName == null || addFrontObjectName == undefined || addFrontObjectName == "") {
            mmodalAlert("error", "提示", "对象名称不可为空");
            return false;
        }
        var addFrontObjectNum = $(iframe).find("#frontObjectNum").val();
        if (addFrontObjectNum == null || addFrontObjectNum == undefined || addFrontObjectNum == "") {
            mmodalAlert("error", "提示", "对象证件号不可为空");
            return false;
        }
        var addBackObjectName = $(iframe).find("#backObjectName").val();
        if (addBackObjectName == null || addBackObjectName == undefined || addBackObjectName == "") {
            mmodalAlert("error", "提示", "关联对象名称不可为空");
            return false;
        }
        var addBackObjectNum = $(iframe).find("#backObjectNum").val();
        if (addBackObjectNum == null || addBackObjectNum == undefined || addBackObjectNum == "") {
            mmodalAlert("error", "提示", "关联对象证件号不可为空");
            return false;
        }
        var addRelationName = $(iframe).find("#relationName").val();
        if (addRelationName == null || addRelationName == undefined || addRelationName == "") {
            mmodalAlert("error", "提示", "关系名称不可为空");
            return false;
        }
        var addObjectRelationId = $(iframe).find("#objectRelationId").val();
        var addFrontObjectType = $(iframe).find("#frontObjectType").val();
        var addBackObjectType = $(iframe).find("#backObjectType").val();
        var addRelationLevel = $(iframe).find("#relationLevel").val();
        var addRelationName = $(iframe).find("#relationName").find("option:selected").text();
        var addObjectRelationDescription = $(iframe).find("#objectRelationDescription").val();
        // var data = $("#myiframe").contents().find("#newLawForm").serialize();
        $.ajax({
            result: "POST",
            url: "relation/addObjectRelation",
            dataType: "json",
            async: false,
            data: {
                objectRelationId: addObjectRelationId,
                frontObjectName: addFrontObjectName,
                frontObjectType: addFrontObjectType,
                frontObjectNum: addFrontObjectNum,
                backObjectName: addBackObjectName,
                backObjectType: addBackObjectType,
                backObjectNum: addBackObjectNum,
                relationLevel: addRelationLevel,
                relationName: addRelationName,
                objectRelationDescription: addObjectRelationDescription,
                // data: data
            },
            success: function (res) {
                if (res.code == "200") {
                    mmodalAlert("success", "提示", "添加成功");
                    $("#add").hide();
                    $("#relationTitle").html("关系添加");
                    $("#myiframe")[0].contentWindow.distoryInfo();
                } else {
                    mmodalAlert("error", "提示", "添加失败");
                }
            }
        })

    }

    //页面跳转
    function goPage() {
        var number = $("#pageNum").val();
        var count = $("#totalPages").val();
        if (!(/(^[1-9]\d*$)/.test(number))) {
            mmodalAlert("error", "提示", "输入数字错误！");
            $("#pageNum").val("");
            return false;
        }
        if (number > count) {
            mmodalAlert("error", "提示", "页码超出范围！");
            return;
        }
        getRelationInfo(number);
    }

    $(function () {
        $.ajax({
            result: "POST",
            url: "/relation/getRelationTree",
            dataType: "json",
            async: false,
            data: {
                relationCode: "RELATION_TYPE"
            },
            success: function (res) {
                $('#relationType').empty();
                if (res.code == "200") {
                    var arr = res.data;
                    var html = "<a code=\"allType\">全部</a>";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<a code=\"" + arr[i].code + "\">" + arr[i].name + "</a>";
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
                    html = "<a code=\"allLevel\">全部</a>";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<a code=\"" + arr[i].code + "\">" + arr[i].name + "</a>";
                    }
                    $('#relationLevel').html(html);
                }
            }
        });
        $.ajax({
            url: "/relation/getAllRelation",
            result: "POST",
            dataType: "json",
            async: false,
            success: function (res) {
                $('#relationName').empty();
                if (res.code == "200") {
                    var arr = res.data;
                    var html = "";
                    html = "<a id=\"allRelation\">全部</a>";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<a id=\"" + arr[i].relationId + "\">" + arr[i].relationName + "</a>";
                    }
                    $('#relationName').html(html);
                }
            }
        });
        //下拉组件
        vVsub();
    })

    //关系类型等级与名称联动
    function changeTypeOrLevel() {
        var relationTypeCode = $("#relationType").find(".act").attr("code");
        var relationType = $("#relationType").find(".act").html();
        var relationLevelCode = $("#relationLevel").find(".act").attr("code");
        var relationLevel = $("#relationLevel").find(".act").html();
        $.ajax({
            url: "relation/getRelationNameByLevelOrType",
            result: "get",
            data: {
                relationType: relationType == "全部" ? "" : relationType,
                relationTypeCode: relationTypeCode == "allType" ? "" : relationTypeCode,
                relationLevel: relationLevel == "全部" ? "" : relationLevel,
                relationLevelCode: relationLevelCode == "allLevel" ? "" : relationLevelCode,
            },
            dataType: "json",
            success: function (res) {
                // debugger;
                if (res.code == "200") {
                    var rela = res.data;
                    $('#relationName').empty();
                    var html = "";
                    html = "<a id=\"allRelation\">全部</a>";
                    for (var i = 0; i < arr.length; i++) {
                        html += "<a id=\"" + arr[i].relationId + "\">" + arr[i].relationName + "</a>";
                    }
                    $('#relationName').html(html);
                }
            }

        })
    }

    function getRelation(objId,objId2) {
        // debugger;
        if (objId == null || objId == undefined || objId == "") {
            nowObjectId = "";
            getRelationInfo(1);
        } else if (objId2 == null || objId2 == undefined || objId2 == "") {
            nowObjectId = objId;
            getRelationInfo(1);
        } else {
            nowObjectId = objId;
            getRelationInfo(1,objId2);
        }

    }

    //对指定关系查看
    function showRelation(id) {
        if (id == null || id == undefined || id == "") {
            mmodalAlert("error", "提示", "参数异常！");
            return false;
        }
        $("#relationTitle").html("关系查看");
        $("#myiframe")[0].contentWindow.showObjectRelation(id);
        $("#addButton").attr("disabled", "disabled");
        $("#add").show();
    }

    //指定关系修改
    function editRelation(id) {
        if (id == null || id == undefined || id == "") {
            mmodalAlert("error", "提示", "参数异常！");
            return false;
        }
        $("#relationTitle").html("关系修改");
        $("#myiframe")[0].contentWindow.getObjectRelationById(id);
        $("#add").show();
    }

    //删除指定关系
    function deleteRelation(id) {
        if (id == null || id == undefined || id == "") {
            mmodalAlert("error", "提示", "参数异常！");
            return false;
        }
        mmodalConfirm("error", "提示", "确认删除？", function (r) {
            if (r) {
                $.ajax({
                    url: "relation/deleteRelation",
                    result: "get",
                    data: {
                        objectRelationId: id
                    },
                    dataType: "json",
                    success: function (res) {
                        if (res.code == "200") {
                            mmodalAlert("success", "提示", "删除成功！");
                            serachRelationInfo();
                        } else {
                            mmodalAlert("error", "提示", "删除失败！");
                        }
                    }
                })
            }
        });

    }

    function getRelationInfo(page,relationObjectId) {
        $.ajax({
            url: "relation/getObjectRelation",
            result: "get",
            dataType: "json",
            async: false,
            data: {
                objectId: nowObjectId,
                relationObjectId: relationObjectId,
                objectName: objectName,
                relationObjectType: "PERSON",
                relationType: relationType == "全部" ? "" : relationType,
                relationTypeCode: relationTypeCode == "allType" ? "" : relationTypeCode,
                relationLevel: relationLevel == "全部" ? "" : relationLevel,
                relationLevelCode: relationLevelCode == "allLevel" ? "" : relationLevelCode,
                relationName: relationName == "全部" ? "" : relationName,
                page: page,
                size: 6
            },
            success: function (res) {
                // debugger;
                $("#relationContent").empty();
                if (res.code == 200) {
                    //默认展示第对象个结果
                    var relationPage = res.data;
                    var objectId = res.data.objectId;
                    var relationData = relationPage.relationData;
                    if (relationData != null && relationData != undefined) {
                        var html = "";
                        for (var i = 0; i < relationData.length; i++) {
                            var objectRelation = relationData[i];
                            var otherObjectId = objectRelation.backObjectId == objectId ? objectRelation.frontObjectId : objectRelation.backObjectId;
                            var otherObjectName = objectRelation.backObjectId == objectId ? objectRelation.frontObjectName : objectRelation.backObjectName;
                            var otherObjectType = objectRelation.backObjectId == objectId ? objectRelation.frontObjectType : objectRelation.backObjectType;
                            var objectRelationName = objectRelation.objectRelationName == null || objectRelation.objectRelationName == undefined ? '无' : objectRelation.objectRelationName;
                            var objectRelationId = objectRelation.objectRelationId;
                            var relationType = objectRelation.relationType == null || objectRelation.relationType == undefined ? '无' : objectRelation.relationType;
                            var relationTypeCode = objectRelation.relationTypeCode;
                            var relationLevel = objectRelation.relationLevel == null || objectRelation.relationLevel == undefined ? '无' : objectRelation.relationLevel;
                            var relationLevelCode = objectRelation.relationLevelCode;
                            var objectRelationDescription = objectRelation.objectRelationDescription == null || objectRelation.objectRelationDescription == undefined ? '无' : objectRelation.objectRelationDescription;

                            html += "<tr>\n" +
                                "<input hidden class=\"relationId\" value=\"" + otherObjectId + "\"/>" +
                                "            <td>" + otherObjectName + "</td>\n" +
                                "            <td>" + "无" + "</td>\n" +
                                "            <td>" + relationType + "</td>\n" +
                                "            <td>" + relationLevel + "</td>\n" +
                                "            <td>" + objectRelationName + "</td>\n" +
                                "            <td>" + objectRelationDescription + "</td>\n" +
                                "            <td>\n" +
                                "                <a href=\"javascript:void(0)\" onclick=\"showRelation('" + objectRelationId + "')\">查看</a>\n" +
                                "                <a href=\"javascript:void(0)\" onclick=\"editRelation('" + objectRelationId + "')\">修改</a>\n" +
                                "                <a href=\"javascript:void(0)\" onclick=\"deleteRelation('" + objectRelationId + "')\">删除</a>\n" +
                                "            </td>\n" +
                                "        </tr>";
                        }
                        $("#relationContent").html(html);
                    }

                    //分页信息
                    var pageInfo = relationPage.pageInfo;
                    // console.log(pageInfo);
                    if (pageInfo != null || pageInfo != undefined) {
                        $("#pageModel").empty();
                        var pagehtml = "";
                        if (!pageInfo.first) {
                            pagehtml += "<button class=\"iconfont\" result=\"button\" onclick=\"getRelationInfo(" + pageInfo.number + ")\">&lt;上一页</button>";
                        }
                        var totalPages = pageInfo.totalPages;
                        //定义起始页和结束页
                        var begin, end;
                        if (pageInfo.totalPages <= 5) {
                            begin = 1;
                            end = pageInfo.totalPages;
                        } else {
                            begin = pageInfo.number + 1 - 2;
                            end = pageInfo.number + 1 + 2;
                            // 头溢出,begin<1
                            if (begin < 1) {
                                begin = 1;
                                end = begin + 4;
                            }
                            // 尾溢出,end>totalPage
                            if (end > pageInfo.totalPages) {
                                end = pageInfo.totalPages;
                                begin = end - 4;
                            }
                        }
                        pagehtml += "<form>\n";
                        //每页数字
                        for (var k = begin; k <= end; k++) {
                            if (k == (pageInfo.number + 1)) {
                                pagehtml += "<a href=\"javascript:;\" class=\"act\" onclick=\"getRelationInfo(" + k + ")\">" + k + "</a>";
                            } else {
                                pagehtml += "<a href=\"javascript:;\" onclick=\"getRelationInfo(" + k + ")\">" + k + "</a>";
                            }
                        }
                        pagehtml += "</form>\n";
                        //拼接下一页
                        if (!pageInfo.last) {
                            pagehtml += "<button class=\"iconfont\" result=\"button\" onclick=\"getRelationInfo(" + (pageInfo.number + 2) + ")\">下一页&gt;</button>"
                        }
                        pagehtml += "<span class=\"m10\" id=\"pageCount\">" + (pageInfo.number + 1) + "/" + pageInfo.totalPages + "</span>";
                        $("#pageModel").html(pagehtml);
                        $("#totalPages").val(pageInfo.totalPages);
                    }
                }
            }
        });
    }

    //搜索
    function serachRelationInfo() {
        // $('body').mLoading("show");
        // $('body').mLoading("hide");
        objectName = $("#objectName").val();
        objectId = "";
        if (objectName == null || objectName == undefined || objectName == "") {
            mmodalAlert("error", "提示", "请输入对象名称！");
            return;
        }
        relationTypeCode = $("#relationType").find(".act").attr("code");
        relationType = $("#relationType").find(".act").html();
        relationLevelCode = $("#relationLevel").find(".act").attr("code");
        relationLevel = $("#relationLevel").find(".act").html();
        relationName = $("#relationName").find(".act").html();
        $.ajax({
            url: "relation/searchRelation",
            result: "post",
            data: {
                objectName: objectName,
                relationType: relationType == "全部" ? "" : relationType,
                relationTypeCode: relationTypeCode == "allType" ? "" : relationTypeCode,
                relationLevel: relationLevel == "全部" ? "" : relationLevel,
                relationLevelCode: relationLevelCode == "allLevel" ? "" : relationLevelCode,
                relationName: relationName == "全部" ? "" : relationName,
                page: 1,
                size: 6
            },
            dataType: "json",
            success: function (res) {
                // debugger;
                $("#relationContent").empty();
                if (res.code == 200) {
                    //将对象传递父方法 由父方法获取渲染
                    window.parent.getPerson(res.object);

                    //默认展示第对象个结果
                    var relationPage = res.data;
                    var objectId = res.data.objectId;
                    nowObjectId = objectId;
                    var relationData = relationPage.relationData;
                    if (relationData != null && relationData != undefined) {
                        var html = "";
                        for (var i = 0; i < relationData.length; i++) {
                            var objectRelation = relationData[i];
                            var otherObjectId = objectRelation.backObjectId == objectId ? objectRelation.frontObjectId : objectRelation.backObjectId;
                            var otherObjectName = objectRelation.backObjectId == objectId ? objectRelation.frontObjectName : objectRelation.backObjectName;
                            var otherObjectType = objectRelation.backObjectId == objectId ? objectRelation.frontObjectType : objectRelation.backObjectType;
                            var objectRelationName = objectRelation.objectRelationName == null || objectRelation.objectRelationName == undefined ? '无' : objectRelation.objectRelationName;
                            var objectRelationId = objectRelation.objectRelationId;
                            var relationType = objectRelation.relationType == null || objectRelation.relationType == undefined ? '无' : objectRelation.relationType;
                            var relationTypeCode = objectRelation.relationTypeCode;
                            var relationLevel = objectRelation.relationLevel == null || objectRelation.relationLevel == undefined ? '无' : objectRelation.relationLevel;
                            var relationLevelCode = objectRelation.relationLevelCode;
                            var objectRelationDescription = objectRelation.objectRelationDescription == null || objectRelation.objectRelationDescription == undefined ? '无' : objectRelation.objectRelationDescription;

                            html += "<tr>\n" +
                                "<input hidden class=\"relationId\" value=\"" + otherObjectId + "\"/>" +
                                "            <td>" + otherObjectName + "</td>\n" +
                                "            <td>" + "无" + "</td>\n" +
                                "            <td>" + relationType + "</td>\n" +
                                "            <td>" + relationLevel + "</td>\n" +
                                "            <td>" + objectRelationName + "</td>\n" +
                                "            <td>" + objectRelationDescription + "</td>\n" +
                                "            <td>\n" +
                                "                <a href=\"javascript:void(0)\" onclick=\"showRelation('" + objectRelationId + "')\">查看</a>\n" +
                                "                <a href=\"javascript:void(0)\" onclick=\"editRelation('" + objectRelationId + "')\">修改</a>\n" +
                                "                <a href=\"javascript:void(0)\" onclick=\"deleteRelation('" + objectRelationId + "')\">删除</a>\n" +
                                "            </td>\n" +
                                "        </tr>";
                        }
                        $("#relationContent").html(html);
                    }

                    //分页信息
                    var pageInfo = relationPage.pageInfo;
                    // console.log(pageInfo);
                    if (pageInfo != null || pageInfo != undefined) {
                        $("#pageModel").empty();
                        var pagehtml = "";
                        if (!pageInfo.first) {
                            pagehtml += "<button class=\"iconfont\" result=\"button\" onclick=\"getRelationInfo(" + pageInfo.number + ")\">&lt;上一页</button>";
                        }
                        var totalPages = pageInfo.totalPages;
                        //定义起始页和结束页
                        var begin, end;
                        if (pageInfo.totalPages <= 5) {
                            begin = 1;
                            end = pageInfo.totalPages;
                        } else {
                            begin = pageInfo.number + 1 - 2;
                            end = pageInfo.number + 1 + 2;
                            // 头溢出,begin<1
                            if (begin < 1) {
                                begin = 1;
                                end = begin + 4;
                            }
                            // 尾溢出,end>totalPage
                            if (end > pageInfo.totalPages) {
                                end = pageInfo.totalPages;
                                begin = end - 4;
                            }
                        }
                        pagehtml += "<form>\n";
                        //每页数字
                        for (var k = begin; k <= end; k++) {
                            if (k == (pageInfo.number + 1)) {
                                pagehtml += "<a href=\"javascript:;\" class=\"act\" onclick=\"getRelationInfo(" + k + ")\">" + k + "</a>";
                            } else {
                                pagehtml += "<a href=\"javascript:;\" onclick=\"getRelationInfo(" + k + ")\">" + k + "</a>";
                            }
                        }
                        pagehtml += "</form>\n";
                        //拼接下一页
                        if (!pageInfo.last) {
                            pagehtml += "<button class=\"iconfont\" result=\"button\" onclick=\"getRelationInfo(" + (pageInfo.number + 2) + ")\">下一页&gt;</button>"
                        }
                        pagehtml += "<span class=\"m10\" id=\"pageCount\">" + (pageInfo.number + 1) + "/" + pageInfo.totalPages + "</span>";
                        $("#pageModel").html(pagehtml);
                        $("#totalPages").val(pageInfo.totalPages);
                    }
                }
            }
        });
    }
</script>
<script>
    $(function () {
        $("#scroll").perfectScrollbar();
        $("#scroll_m1").perfectScrollbar();
        $("#scroll_m4").perfectScrollbar();
        $(".js-cancel").click(function () {
            $(this).parents(".mmodal").hide();
        })
    });

    $(".js-cancel").click(function () {
        var id = $(this).parents(".mmodal").attr("id");
        if (id == "add") {
            $("#addButton").removeAttr("disabled");
            $("#relationTitle").html("关系添加");
            $("#myiframe")[0].contentWindow.distoryInfo();
        }
        $(this).parents(".mmodal").hide();
    });
</script>
</body>
</html>