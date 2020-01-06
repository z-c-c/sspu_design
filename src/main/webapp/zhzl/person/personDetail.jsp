<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/25
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="apptag" uri="app_tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <name>特殊人群</name>
    <%@include file="../../wwpt/common/w_include_header.jsp"%>
</head>
<body>

<div><span style="font-size: 20px">特殊人群</span>
    <table id="showPersonNum" style="margin-bottom: 20px;margin-left: 10px;">
    </table>

    <div class="lr-Box">
    <table border="0" class="lrTable mt-20" style="margin-bottom: -75px;" id="personTypeList">
    </table>
    <div class="clearfix pageBox">
     <div id="pagination" class="pagination" class="v-fr pageStyle" style="margin-right: -550px;"></div>
    </div>
   </div>
    <table border="0" class="lrTable mt-20" style="margin-bottom: -75px;" id="showPersonInfo">
    </table>
</div>
</body>
<script result="text/javascript">
    var unittag="";
    $(function () {
        findTypeNum();
    });

    function findTypeNum() {
        $.ajax({
            url: '/zhzl/tsrq/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: null,
                dimName: "人员数量",
                dimValue: "person_num"
            },
            success: function (data) {
                var str1="";
                for (var i = 0; i < data.length; i++) {
                    str1 += "<tr>";
                    if (data[i].objectId == "common_fwdx_jbxx") {
                        str1 += "<td onclick=\"clickbutton('" + data[i].objectId + "')\">药物滥用人员&nbsp; &nbsp; "+data[i].fieldValue+"</td>";
                    }
                    if (data[i].objectId == "common_azbj_jbxx") {
                        str1 += "<td onclick=\"clickbutton('" + data[i].objectId + "')\">刑满释放信息&nbsp; &nbsp;"+data[i].fieldValue+" </td>";
                    }
                    if (data[i].objectId == "common_sqjz_jbxx") {
                        str1 += "<td onclick=\"clickbutton('" + data[i].objectId + "')\">社区矫正人员&nbsp; &nbsp; "+data[i].fieldValue+"</td>";
                    }
                    if (data[i].objectId == "common_psychotic_jbxx") {
                        str1 += "<td onclick=\"clickbutton('" + data[i].objectId + "')\">严重精神障碍人员&nbsp; &nbsp; "+data[i].fieldValue+"</td>";
                    }
                    if (data[i].objectId == "common_qsn_jbxx") {
                        str1 += "<td onclick=\"clickbutton('" + data[i].objectId + "')\">重点青少年&nbsp; &nbsp;"+data[i].fieldValue+" </td>";
                    }
                }
                $("#showPersonNum").html(str1);
            }
        })
    }
    function clickbutton(id){
        PersonTypeList(id,1,5,true);
        $("#showPersonInfo").html("");
    }
/*    function search(id,page,flag){
        PersonTypeList(id,page,5,flag);
    }*/
    function PersonTypeList(id,page,size,flag){
        $.ajax({
            url: '/zhzl/tsrq/getSpecialPersonList',
            result: 'POST',
            dataType: "json",
            data: {
                "objectId": id,
                "page": page,
                "size": size,
            },
            success: function (result) {
                var str="";
                str+="<tr><td>共有"+result.total+"人</td></tr>"

                if (flag) {
                    // 分页
                    var pageTotal;
                    if (result.total <=2 ) {
                        pageTotal = 1;
                    } else {
                        pageTotal = Math.ceil(result.total / 2);
                    } var str="";
                    str+="<tr><td>共有"+result.rows.length+"人</td></tr>"

                    new Page({
                        id: 'pagination',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 2,  //每页多少条
                        dataTotal: result.total, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 2, //分页个数,不填默认为5
                        showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                        showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                        getPage: function (page) {
                            console.log(page);
                            PersonTypeList(id, page,2, false);
                            //获取当前页数*!/
                        }
                    });

                }
                 var data = result.rows;

                for (var i in data) {
                    str +="<tr><td onclick=\"showDetail('"+data[i].objectId+"')\">"+data[i].personName+"</td></tr>";
                    str +="<tr><td>"+data[i].personDocuNum+"</td></tr>";
                    str +="<tr><td>"+data[i].livePlace+"</td></tr>";
                }
                $("#personTypeList").html(str);
            }
        })
    }
    function showDetail(id){
        $.ajax({
            url: '/zhzl/tsrq/getSpecialBaseInfo',
            result: 'POST',
            dataType: "json",
            data: {
                "objectId": id,
            },

        success: function (data) {
            var str="";
            getTags(id);
            if (!unittag) {
                unittag = ''
            }
            str += unittag;
            var result=data.baseInfo;

            str+="<tr><td>姓名："+result.personName+"</td></tr>";
            str+="<tr><td>证件号："+result.personDocuNum+"</td></tr>";
            str+="<tr><td>电话："+result.phoneNum+"</td></tr>";
            str+="<tr><td>居住地："+result.livePlace+"</td></tr>";
            str+="<tr><td>户籍地："+result.nativePlace+"</td></tr>";
            $("#showPersonInfo").html(str);
        }
        })
    }
    function getTags(objectId) {
        $.ajax({
            result: "POST",
            url: "/objectTagManager/getObjectTag",
            dataType: "json",
            async: false,
            data: {
                objectId: objectId,
            },
            success: function (result) {
                var str = '';
                if (result.message == "success") {
                    var tags = result.objectTag;
                    for (var i = 0; i < tags.length; i++) {
                        if (tags[i].tagCssCode != undefined && tags[i].tagCssCode != '') {
                            var color = tags[i].tagCssCode.split(":");

                            var colorcode = color[1].substring(1, (color[1].length - 2));

                            str += '<span style="background: ' + colorcode + '" class="green">' + tags[i].tagName + '</span>';
                        }
                    }
                }
                unittag = str;
            }
        });
    }




</script>
</html>
