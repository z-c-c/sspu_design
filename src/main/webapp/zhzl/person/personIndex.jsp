<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/13
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page import="com.wonders.security.model.BaseUserInfo" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="apptag" uri="app_tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <name>特殊人群</name>
    <%@include file="../../wwpt/common/w_include_header.jsp"%>
</head>
<body>
<div><span style="font-size: 20px">七大人员</span>
<table id="showPersonNum" style="margin-bottom: 20px;margin-left: 10px;"></table>
</div>

<div><span style="font-size: 20px">街镇分布</span>
<table id="showStreetLocate" style="margin-bottom: 20px;margin-left: 10px;"><tr><td>点击人员类别以查看</td></tr></table>
</div>
<div><span style="font-size: 20px">年龄分布</span>
    <table id="showAgeInfo" style="margin-bottom: 20px;margin-left: 10px;"><tr><td>点击人员类别以查看</td></tr></table>
</div>

<div><span style="font-size: 20px">关联预警</span>
<table id="showWarningRelation" style="margin-bottom: 20px;margin-left: 10px;"></table>
</div>

<div><span style="font-size: 20px">最新预警</span>
    <table id="newestWarning" style="margin-bottom: 20px;margin-left: 10px;"><tr><td>点击人员类别以查看</td></tr></table>
</div>
<div><span style="font-size: 20px">预警趋势</span>
<table id="showMonthWarning" style="margin-bottom: 20px;margin-left: 10px;"><tr><td>点击人员类别以查看</td></tr></table>
</div>



<div><span style="font-size: 20px">事件动态</span>
    <table id="showEventInfo" style="margin-bottom: 20px;margin-left: 10px;"></table>
</div>
<div><span style="font-size: 20px">最新动态</span>
    <table id="newestInfo" style="margin-bottom: 20px;margin-left: 10px;"></table>
</div>
</body>
<script result="text/javascript">
    $(function () {
        findPersonTypeNum();
        warningRelation();
        eventInfo();
        newestEventInfo();
    });
    function clickbutton(id){
        streetLocation(id);
        monthWarning(id);
        ageInfo(id);
        newestWarning(id);
    }
    function findPersonTypeNum() {
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: null,
                dimName: "人员数量",
                dimValue:"person_num"
            },
            success: function (data) {
             var str1="";
            for (var i=0;i<data.length;i++){
             str1+="<tr>";
                if(data[i].objectId=="xhzz_special_people"){
                    str1+="<tr><td onclick=\"clickbutton('xhzz_special_people')\">全部&nbsp; &nbsp;</td>"

                }
             else if(data[i].objectId=="common_sqjz_jbxx"){
                  str1+="<tr><td onclick=\"clickbutton('common_sqjz_jbxx')\">社区矫正&nbsp; &nbsp;</td>"

              }
          /*    else if(data[i].objectId=="xfry"){
                 str1+="<td onclick=\"clickbutton('"+data[i].objectId+"')\">信访人员&nbsp; &nbsp; </td>";
             }*/
              else if(data[i].objectId=="common_azbj_jbxx"){
                     str1+="<td onclick=\"clickbutton('"+data[i].objectId+"');\">刑满释放&nbsp; &nbsp; </td>";
                 }
              else if(data[i].objectId=="common_fwdx_jbxx"){
                     str1+="<td onclick=\"clickbutton('"+data[i].objectId+"');\">药物滥用人员&nbsp; &nbsp; </td>";
             }
              else if(data[i].objectId=="common_psychotic_jbxx"){
                    str1+="<td onclick=\"clickbutton('"+data[i].objectId+"');\">严重精神病患者人员&nbsp; &nbsp; </td>";
                }
              else if(data[i].objectId=="common_qsn_jbxx"){
                    str1+="<td onclick=\"clickbutton('"+data[i].objectId+"');\">重点青少年&nbsp; &nbsp; </td>";
                }
             if(data[i].fieldValue!=null){
             str1+="<td>"+data[i].fieldValue+"</td>";
             }
             str1+="</tr>";
             }
                $("#showPersonNum").html(str1);
            }
        })
    }
    function streetLocation(id){
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: id,
                dimName: "街镇分布",
                dimValue:null
            },
            success: function (data) {
                var str1="";
                if (data.length!=0) {
                    for (var i = 0; i < data.length; i++) {
                        str1 += "<tr>";
                        if (data[i].dimValue != null) {
                            str1 += "<td>" + data[i].dimValue + "&nbsp; &nbsp;</td>";
                        }
                        if (data[i].fieldValue != null) {
                            str1 += "<td>" + data[i].fieldValue + "</td>";
                        }
                        str1 += "</tr>";
                    }
                }else{
                    str1+="<tr><td>无</td></tr>"
                }
                $("#showStreetLocate").html(str1);
               }

            })
    }

    function warningRelation(){
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: null,
                dimName: "关联预警",
                dimValue:"alarm_num"
            },
            success: function (data) {
                var str1="";
                for(var i=0;i<data.length;i++){
                    str1+="<tr>";


                    if(data[i].objectId=="xhzz_special_people"){
                        str1+="<tr><td>全部&nbsp; &nbsp;</td>"

                    }
                    else if(data[i].objectId=="common_sqjz_jbxx"){
                        str1+="<tr><td>社区矫正&nbsp; &nbsp;</td>"

                    }
                    /*    else if(data[i].objectId=="xfry"){
                           str1+="<td onclick=\"clickbutton('"+data[i].objectId+"')\">信访人员&nbsp; &nbsp; </td>";
                       }*/
                    else if(data[i].objectId=="common_azbj_jbxx"){
                        str1+="<td>刑满释放&nbsp; &nbsp; </td>";
                    }
                    else if(data[i].objectId=="common_fwdx_jbxx"){
                        str1+="<td>药物滥用人员&nbsp; &nbsp; </td>";
                    }
                    else if(data[i].objectId=="common_psychotic_jbxx"){
                        str1+="<td>严重精神病患者人员&nbsp; &nbsp; </td>";
                    }
                    else if(data[i].objectId=="common_qsn_jbxx"){
                        str1+="<td>重点青少年&nbsp; &nbsp; </td>";
                    }



                    if(data[i].fieldValue!=null){
                        str1+="<td>"+data[i].fieldValue+"</td>";
                    }
                    str1+="</tr>";
                }
                $("#showWarningRelation").html(str1);
            }

        })
    }

    function monthWarning(id){

        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: id,
                dimName: "月份预警",
                dimValue:null
            },
            success: function (data) {
                var str1="";
                if(data.length!=0) {
                    for (var i = 0; i < data.length; i++) {
                        str1 += "<tr>";

                        if(data[i].objectId=="xhzz_special_people"){
                            str1+="<tr><td>全部&nbsp; &nbsp;</td>"

                        }
                        else if(data[i].objectId=="common_sqjz_jbxx"){
                            str1+="<tr><td>社区矫正&nbsp; &nbsp;</td>"

                        }
                        /*    else if(data[i].objectId=="xfry"){
                               str1+="<td onclick=\"clickbutton('"+data[i].objectId+"')\">信访人员&nbsp; &nbsp; </td>";
                           }*/
                        else if(data[i].objectId=="common_azbj_jbxx"){
                            str1+="<td>刑满释放&nbsp; &nbsp; </td>";
                        }
                        else if(data[i].objectId=="common_fwdx_jbxx"){
                            str1+="<td>药物滥用人员&nbsp; &nbsp; </td>";
                        }
                        else if(data[i].objectId=="common_psychotic_jbxx"){
                            str1+="<td>严重精神病患者人员&nbsp; &nbsp; </td>";
                        }
                        else if(data[i].objectId=="common_qsn_jbxx"){
                            str1+="<td>重点青少年&nbsp; &nbsp; </td>";
                        }
                        if (data[i].dimValue != null) {
                            str1 += "<td>" + data[i].dimValue + "&nbsp; &nbsp;</td>";
                        }
                        if (data[i].fieldValue != null) {
                            str1 += "<td>" + data[i].fieldValue + "</td>";
                        }
                        str1 += "</tr>";
                    }
                }
                else{
                    str1+="<tr><td>无</td></tr>"
                }
                $("#showMonthWarning").html(str1);
            }

        })
    }

    function ageInfo(id){
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: id,
                dimName: "年龄分布",
                dimValue:null
            },
            success: function (data) {
                var str1="";
                if(data.length!=0){
                for(var i=0;i<data.length;i++){
                    str1+="<tr>";
                    if(data[i].dimValue!=null){
                        str1+="<td>"+data[i].dimValue+"&nbsp; &nbsp;</td>";
                    }
                    if(data[i].fieldValue!=null){
                        str1+="<td>"+data[i].fieldValue+"</td>";
                    }
                    str1+="</tr>";
                }
                }
                else{
                    str1+="<tr><td>无</td></tr>"
                }
                $("#showAgeInfo").html(str1);
            }

        })
    }

    function newestWarning(id){
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: id,
                dimName: "最新预警",
                dimValue:null
            },
            success: function (data) {
                var str1="";
                if(data.length!=0){
                for(var i=0;i<data.length;i++){
                    str1+="<tr>";

                    if(data[i].fieldValue!=null){
                        str1+="<td>"+data[i].fieldValue+"</td>";
                    }
                    str1+="</tr>";
                }
                }
                else{
                    str1+="<tr><td>无</td></tr>"
                }
                $("#newestWarning").html(str1);
            }

        })
    }
    function eventInfo(){
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: null,
                dimName: "事件动态",
                dimValue:"event_num"
            },
            success: function (data) {
                var str1="";
                for(var i=0;i<data.length;i++){
                    str1+="<tr>";
                    if(data[i].objectId=="xhzz_special_people"){
                        str1+="<tr><td>全部&nbsp; &nbsp;</td>"

                    }
                    else if(data[i].objectId=="common_sqjz_jbxx"){
                        str1+="<tr><td>社区矫正&nbsp; &nbsp;</td>"

                    }
                    /*    else if(data[i].objectId=="xfry"){
                           str1+="<td onclick=\"clickbutton('"+data[i].objectId+"')\">信访人员&nbsp; &nbsp; </td>";
                       }*/
                    else if(data[i].objectId=="common_azbj_jbxx"){
                        str1+="<td>刑满释放&nbsp; &nbsp; </td>";
                    }
                    else if(data[i].objectId=="common_fwdx_jbxx"){
                        str1+="<td>药物滥用人员&nbsp; &nbsp; </td>";
                    }
                    else if(data[i].objectId=="common_psychotic_jbxx"){
                        str1+="<td>严重精神病患者人员&nbsp; &nbsp; </td>";
                    }
                    else if(data[i].objectId=="common_qsn_jbxx"){
                        str1+="<td>重点青少年&nbsp; &nbsp; </td>";
                    }

                    if(data[i].fieldValue!=null){
                        str1+="<td>"+data[i].fieldValue+"</td>";
                    }
                    str1+="</tr>";
                }
                $("#showEventInfo").html(str1);
            }

        })
    }
    function newestEventInfo(){
        $.ajax({
            url: '/zhzl/home/getPersonTypeList',
            result: 'POST',
            dataType: "json",
            data: {
                objectId: "all",
                dimName: "最新动态",
                dimValue:null
            },
            success: function (data) {
                var str1 = "";
                for (var i = 0; i < data.length; i++) {
                    str1 += "<tr>";

                    if (data[i].dimValue != null) {
                        str1 += "<td>" + data[i].dimValue + "</td>";

                        if (data[i].fieldValue != null) {
                            str1 += "<td>" + data[i].fieldValue + "</td>";
                        }
                        str1 += "</tr>";
                    }
                    $("#newestInfo").html(str1);
                }
            }
        })
    }
</script>
</html>
