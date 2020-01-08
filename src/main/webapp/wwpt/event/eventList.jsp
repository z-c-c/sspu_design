<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-11-02
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>

    <%@include file="../common/w_include_header.jsp"%>
    <link rel="stylesheet" href="../../css/icon.css"><!--easyui-->
    <link rel="stylesheet" href="../../css/newreset.css">
    <link rel="stylesheet" href="../../css/newstyle.css">
    <script src="../../js/ajaxfileupload.js" result="text/javascript"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
     <style result="text/css">
        .tabCon > div.tabConSon2{
            height:180px;
            position:relative;
            overflow:hidden;
        }
        .backG{
            background: url('../images/noImage.png') no-repeat bottom center;
        }
        .topCot{
            position: relative;
            top: -50px;
        }
        .pageStyle ul li{
            width: 36px;
            height: 26px;
            line-height: 26px;
            background: #eaedf1;
            border: 1px solid #eaedf1;
            text-align: center;
            border-radius: 4px;
            cursor: pointer;
            float: left;
            margin: 0 4px;
            transition: .3s linear;
        }

        input:-webkit-autofill, textarea:-webkit-autofill, select:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px #ffffff inset
        }
    </style>
</head>
<body>
<div class="index-main">
    <div class="fx-left">
        <div class="searchBox">
            <div class="bear-tit">
                <h5>查询条件</h5>
            </div>
            <div class="searchWrap">
                <!-- 高级搜索 -->
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox">
                            <input result="text" placeholder="请输入关键字" id="SearchNameOrPlace">
                        </div>
                        <button class="btn1" onclick="findEvent('',true,1)">搜索</button>
                        <button class="btn2" onclick="reset()">重置</button>
                        <a id="advancedSearch" class="advancedSearch" onclick="advanceSearch()">高级搜索</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>是否清算：</span>
                            <select class="vV-drop" style="width:250px;height:28px;" id="SearchIsSettlement">
                                <option value="" selected>请选择</option>
                                <option value="1">已清算</option>
                                <option value="0">未清算</option>
                            </select>
                        </div>
                        <div>
                            <span class="span">发生日期：</span>
                            <input id="searchOccurredTime" class="vV-ipt date w-246" result="text" style="width: 250px;"
                                   value=""
                                   placeholder="请选择" readonly="readonly">
                            <span class="span">清算日期：</span>
                            <input id="SearchSettlementTime" class="vV-ipt date w-246" result="text"
                                   style="width: 250px;" value=""
                                   placeholder="请选择"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
                <div class="labelSearch">
                    <div class="clearfix">
                        <span class="labelText v-fl">标签</span>
                        <div class="labelAdd v-fl">
                            <!-- 所有标签 -->
                            <div class="labelAll">
                                <!-- input框 -->
                                <div class="fuzzyBox">
                                    <input class="vV-ipt w-200" id="txt1" result="text" value="" placeholder="请输入标签关键字"
                                           autocomplete="off">
                                    <div class="fuzzyData">
                                        <div id="allTags">
                                        </div>
                                    </div>
                                </div>
                                <!-- 加号 -->
                                <strong class="addBtn">+</strong>
                            </div>
                        </div>
                    </div>
                    <!-- 分类label -->
                    <div class="labelDown">
                        <i class="labelCloseBtn">×</i>
                        <%--                        <apptag:dict result="tagDiv" clazz="tabName" id="tag" name="tag" dictId="TAG_MODULE"--%>
                        <%--                                     defVal="TAG_LABLE_PEOPLE"/>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="searchReault">
            <div class="searchNum">
                    <span>
                        为您找到到相关结果
                        <strong id="totalEvent">0</strong>
                        项
                    </span>
                <div class="btnGroup">
                    <a class="active" onclick="addShow()">新增</a>
                    <a onclick="exportEventToExcel()">下载</a>
                </div>
            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" id="handleResolve">
                    <li class="active">全部</li>
                    <li>已处理</li>
                    <li>未处理</li>
                </ul>
                <div class="sortList v-fr">
                    <a href="javascript:;" class="sort sortMethod">排序方式</a>
                    <div class="sortDown sortText">
                        <p>默认</p>
                        <p>按发生时间</p>
                        <p>按更新时间</p>
                    </div>
                </div>
            </div>
            <div class="searchCon" style="position: relative">
                <div id="loading" style="position: absolute;z-index:5;top: 50%;left: 50%;margin-top: -100px;margin-left: -100px;height: 500px">
                </div>
                <ul id="eventList">
                </ul>
            </div>
            <div id="pagination" class="pagination" style="margin-left: 100px"></div>
        </div>
    </div>

    <div class="fx-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>处置情况</h5>
            </div>
            <div class="assessBox">
                <div id="handleLoading"></div>
                <div class="item item1">
                    <i></i>
                    <p class="num" id="handling">0个</p>
                    <p class="name">未处置</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p class="num" id="handled">0个</p>
                    <p class="name">已处置</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>数据聚合（<span id="dataTogetherCount">0</span>）</h5>
                <a href="dataTogether.jsp?Type=contradictionEvent" target="_blank">更多>></a>
            </div>
            <div class="dataBox">
                <div id="dataBoxLoading" ></div>
                <div class="dataList marquee1">
                    <div class="view" id="dataTogether">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tanBox"  id="resolve" style="display: none">
    <div class="pubBlock kuang">
        <i class="close"  onclick="javascript:$('#operate').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>化解存档</h5>
        </div>
        <div style="height: 200px">
            <div class="baseTable">
                <table border="0">

                    <tr>
                        <div>
                            <td width="20%" class="center">结案时间</td>
                            <td width="30%">
                                <input id="wwJarq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div>
                            <td width="20%" class="center">存档时间</td>
                            <td width="30%">
                                <input id="wwCdrq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">
                            </td>
                        </div>
                    </tr>


                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="maskBox" id="eventHandle" style="display: none;position: fixed;z-index: 1000;">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5 id="handleLogTitle">录入处置日志</h5>
            <h5 id="leaderTitle">录入领导批示</h5>
        </div>
        <div class="lr-Box">
            <table border="0" class="lrTable mt-20" id="handleList">
            </table>
            <div class="clearfix pageBox">
                <div class="v-fl">
                    &nbsp;&nbsp;共&nbsp;<span class="totalHandle">2</span>&nbsp;条数据
                </div>
                <div id="paginationHandle" class=" v-fr pageStyle"></div>
            </div>

            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="39%" class="center">处置内容</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 680px;height: 50px;" id="handleContent"></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td width="20%" class="center">处置时间</td>
                        <td width="30%">
                            <input id="handleDate" class="vV-ipt date w-246 Time" result="text" value="" placeholder="(默认为当前时间)" readonly="readonly" style="width: 245px;">
                        </td>
                        <td class="center">上传文件</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="czPath" name="czPath">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="handleFilepath"></p>
                            </div>
                        </td>
                    <tr>
                        <td width="20%" class="center">操作人</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="handleUser" style="width: 245px;">
                        </td>
                        <td width="20%" class="center">创建人</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="handleCuser" style="width: 245px;">
                        </td>

                    </tr>

                    <tr>
                        <td class="center">集访类型</td>
                        <td>
                            <ul class="vV-tabs" id="handleJflx" style="width: 260px">
                            </ul>
                        </td>
                        <td class="center">是否通过</td>
                        <td id="handleIsflag">
                            <label class="vV-radio" name="handleIsflag">是</label>
                            <label class="vV-radio ck" name="handleIsflag">否</label>
                        </td>
                    </tr>
                    <br>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" id="handleLogBut">保存</button>
                            <button class="alertBtn" id="leaderBut">保存</button>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</div>
<div class="tanBox" id="resUnit" style="display: none">
    <div class="pubBlock kuang" style="width: 750px;">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>责任单位</h5>
        </div>
        <div  style="height: 250px;">
            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="20%" class="center">主办单位</td>
                        <td width="30%">
                            <select id="wwZrbmZb" class="vV-drop" style="width:200px;height:28px;" data-options="editable:false">
                            </select>
                        </td>

                        <td width="20%" class="center">协办单位</td>
                        <td width="30%">
                            <select id="wwZrbmXb" class="vV-drop" style="width:200px;height:28px;" data-options="editable:false">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">委托单位</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrbmWt" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">责任部门(街道)</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrbmJd" style="width: 200px;">
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">督办单位</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrbmDb" style="width: 200px;">
                        </td>

                        <td class="center">工作周期</td>
                        <td id="wwGzzq1">
                            <label class="vV-radio ck" name="wwGzzq1" style="padding: 0 4px 0 29px;">7天</label>
                            <label class="vV-radio" name="wwGzzq1" style="padding: 0 4px 0 29px;">15天</label>
                            <label class="vV-radio" name="wwGzzq1" style="padding: 0 4px 0 29px;">一个月</label>
                        </td>

                    </tr>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveResUnit()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>


<div class="tanBox" id="addEvent" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5 id="addEventTitle" >新增事件</h5>
            <h5 id="updateEventTitle">修改事件</h5>
        </div>
        <div class="titleCon"  style="height: 500px;">
            <div class="baseTable">
                <table border="0" style="width: 700px;">
                        <div class="bear-tit bear-tit2 point">
                            <h5>基本信息</h5>
                        </div>
                    <tr>
                        <td width="20%" class="center">事件名称</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="addeventName" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">发生时间</td>
                        <td width="30%">
                            <input id="occurredTime" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="请选择时间"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">简要情况</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="eventContent"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">发生地址</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="occurredPlace" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">矛盾类别</td>
                        <td width="30%">
<%--                            <select  class="easyui-combobox" style="width:200px;height:28px;" data-options="editable:false,valueField:'value',textField:'text'" id="wwMdlb">--%>
<%--                            </select>--%>
                            <%--                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"--%>
                            <%--                                         id="wwMdlb" name="wwJdName" dictId="WTQD_MDLB"/>--%>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">事件经度</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="eventLongti" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">事件纬度</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="eventLati" style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">事件状态</td>
                        <td width="30%">
                            <%--                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"--%>
                            <%--                                         id="eventStatus" name="wwJdName" dictId="FXFK_SFHJ"/>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">标签联动</td>
                        <td colspan="3">
                            <div id="treeBox">
                                <!--id必须是treeBox  -->
                                <input class="focusEl" result="text" placeholder="请选择" id="tagNames" style="width: 200px;">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                            </div>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <div class="bear-tit bear-tit2 point">
                        <h5>重大矛盾</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">甲方</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwDsrA" style="width: 200px;">
                        </td>
                        <td width="20%" class="center">乙方</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwDsrB" style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">地区类型</td>
                        <td>
                            <ul class="vV-tabs" id="wwDqlx">
                            </ul>
                        </td>
                        <td class="center">矛盾类型</td>
                        <td>
                            <ul class="vV-tabs" id="wwMdlx">
                                <li class="act" value="0">群体</li>
                                <li value="1">个体</li>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td class="center">矛盾级别</td>
                        <td>
                            <%--                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;z-index: 0"--%>
                            <%--                                         id="wwMdjb" name="wwJdName" dictId="WTQD_MDJB"/>--%>
                        </td>
                        <td class="center">是否信访</td>
                        <td id="wwCfqkXf">
                            <label class="vV-radio ck" name="wwCfqkXf">否</label>
                            <label class="vV-radio " name="wwCfqkXf">是</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">12345</td>
                        <td id="wwCfqk12345">
                            <label class="vV-radio ck" name="wwCfqk12345">无</label>
                            <label class="vV-radio " name="wwCfqk12345">有</label>
                        </td>
                        <td class="center">非访</td>
                        <td id="wwCfqkFf">
                            <label class="vV-radio ck" name="wwCfqkFf">无</label>
                            <label class="vV-radio " name="wwCfqkFf">有</label>
                        </td>
                    </tr>

                    <tr>
                        <td class="center">越级访</td>
                        <td id="wwCfqkYjf">
                            <label class="vV-radio ck" name="wwCfqkYjf">无</label>
                            <label class="vV-radio " name="wwCfqkYjf">有</label>
                        </td>
                        <td class="center">大调解</td>
                        <td id="wwCfqkDtj">
                            <label class="vV-radio ck" name="wwCfqkDtj">无</label>
                            <label class="vV-radio " name="wwCfqkDtj">有</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">诉讼</td>
                        <td id="wwCfqkSs">
                            <label class="vV-radio ck" name="wwCfqkSs">无</label>
                            <label class="vV-radio " name="wwCfqkSs">有</label>
                        </td>
                        <td class="center">仲裁</td>
                        <td id="wwCfqkZc">
                            <label class="vV-radio ck" name="wwCfqkZc">无</label>
                            <label class="vV-radio " name="wwCfqkZc">有</label>
                        </td>
                    </tr>

                    <tr>
                        <td class="center">重复情况</td>
                        <td id="wwCfqkW">
                            <label class="vV-radio ck" name="wwCfqkW">无</label>
                            <label class="vV-radio " name="wwCfqkW">有</label>
                        </td>
                        <td class="center">是否重大不稳定事件</td>
                        <td id="wwIsZdbwdsj">
                            <label class="vV-radio ck" name="wwIsZdbwdsj">否</label>
                            <label class="vV-radio " name="wwIsZdbwdsj">是</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">是否跨省市事件</td>
                        <td id="wwIsKsssj">
                            <label class="vV-radio ck" name="wwIsKsssj">否</label>
                            <label class="vV-radio" name="wwIsKsssj">是</label>
                        </td>
                        <td class="center">是否遗留事件</td>
                        <td id="wwIsYlsj">
                            <label class="vV-radio ck" name="wwIsYlsj">否</label>
                            <label class="vV-radio" name="wwIsYlsj">是</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">是否落实化解事件</td>
                        <td id="wwIsLshjsj">
                            <label class="vV-radio ck" name="wwIsLshjsj">否</label>
                            <label class="vV-radio" name="wwIsLshjsj">是</label>
                        </td>
                        <td class="center">是否落实化解措施事件</td>
                        <td id="wwIsLswhjcssj">
                            <label class="vV-radio ck" name="wwIsLswhjcssj">否</label>
                            <label class="vV-radio" name="wwIsLswhjcssj">是</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">是否涉法涉诉</td>
                        <td id="wwIsSfsu">
                            <label class="vV-radio ck" name="wwIsSfsu">否</label>
                            <label class="vV-radio" name="wwIsSfsu">是</label>
                        </td>
                        <td class="center">是否重复信访</td>
                        <td id="wwIsCxcf">
                            <label class="vV-radio ck" name="wwIsCxcf">否</label>
                            <label class="vV-radio" name="wwIsCxcf">是</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">是否领导包案</td>
                        <td id="wwIsLdba">
                            <label class="vV-radio ck" name="wwIsLdba">否</label>
                            <label class="vV-radio" name="wwIsLdba">是</label>
                        </td>
                        <td class="center" id="wwSFHHtitle">是否缓和</td>
                        <td id="wwSFHH">
                            <label class="vV-radio ck" name="wwSFHH">已缓和</label>
                            <label class="vV-radio" name="wwSFHH">未缓和</label>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">涉及人数</td>
                        <td width="30%">
                            <%--                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"--%>
                            <%--                                         id="wwSjrs" name="wwJdName" dictId="WTQD_SJRS"/>--%>
                        </td>
                        <td width="20%" class="center">责任人</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrr" style="width: 200px;">
                        </td>
                    <tr>
                        <td class="center">备注</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="wwBz"></textarea>
                        </td>
                    </tr>
                    </tr>

                    <tr>
                        <td width="20%" class="center">涉及领域</td>
                        <td width="30%">
                            <%--                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"--%>
                            <%--                                         id="wwSjly" name="wwJdName" dictId="WTQD_SJLY"/>--%>
                        </td>
                        <td width="20%" class="center">工作周期</td>
                        <td id="wwGzzq">
                            <label class="vV-radio ck" name="wwGzzq" style="padding: 0 4px 0 29px;">7天</label>
                            <label class="vV-radio" name="wwGzzq" style="padding: 0 4px 0 29px;">15天</label>
                            <label class="vV-radio" name="wwGzzq" style="padding: 0 4px 0 29px;">一个月</label>
                        </td>
                    </tr>

                    <tr>
                        <td class="center">所属街道</td>
                        <td>
                            <%--                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"--%>
                            <%--                                         id="wwJdName" name="wwJdName" dictId="XH_XZQY"/>--%>
                        </td>
                        <td class="center">居委名称</td>
                        <td>
                            <select id="wwJw" class="vV-drop" style="width:200px;height:28px;">
                                <option value="" selected>请选择街道</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="add">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save('add')">保存</button>
                        </td>
                    </tr>
                    <tr id="update">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save('update')">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<input result="hidden" id="addedTagNames">
</body>

<script result="text/javascript">
    var eventDateTogetherCount = 0;
    var unittag;
    var tagsJson = [];

    var initpersontagflag = false;
    var initunittagflag = false;
    var initeventtagflag = false;
    //高级搜索标识
    var searchonOff = true;

    function initSelect() {
        if (initpersontagflag && initeventtagflag && initunittagflag) {

            //隐藏列表框
            $("body").click(function () {
                $(".fuzzyData").fadeOut();
            });

            //移入移出效果
            $(".spanItem").hover(function () {
                $(this).css('background-color', '#dbf1fc');
            }, function () {
                $(this).css('background-color', 'white');
            });


            //项点击
            var labelArr = [];
            var labelAllH = 0;
            var labelTop = 0;
            $(".spanItem").on("click", function () {
                var textCon = $(this).text();
                if (labelArr.indexOf(textCon) != -1) {
                    return
                }
                labelArr.push(textCon);
                // 隐藏输入框
                $(".fuzzyBox").css("display", "none");
                $(".labelAll").prepend('<span>\n' +
                    '                <strong>' + textCon + '</strong>\n' +
                    '                <i class="labelClose">×</i>\n' +
                    '            </span>');
                search(1, "-1", true);
                $(".labelCloseBtn").trigger('click');
                clickHandle();
            });
            $(".tabCon .span").on("click", function () {
                var textHtml = $(this).html();
                if (labelArr.indexOf(textHtml) != -1) {
                    return
                }
                labelArr.push(textHtml);
                $(".fuzzyBox").css("display", "none");
                //清空输入框
                $("#txt1").val("");
                $("#txt1").keyup();

                $(".labelAll").prepend('<span>\n' +
                    '                        <strong>' + textHtml + '</strong>\n' +
                    '                        <i class="labelClose">×</i>\n' +
                    '                    </span>');
                $(".labelCloseBtn").trigger('click');
                search(1, "-1", true);
                clickHandle();
            });

            // 标签删除
            $('.labelAll').on("click", ".labelClose", function () {
                var removeStr = $(this).parent().find("strong").text();
                removeByValue(labelArr, removeStr);
                $(this).parent().remove();
                $(".labelCloseBtn").trigger('click');
                search(1, "-1", true);
                clickHandle();
            });



            // 标签联动
            treeBox({
                el: '$(".focusEl")', //焦点事件DOM 必传
                width: { // 各级列表宽度 可选 不传默认值就为 160，160，160，200
                    lv1: 80,
                    lv2: 100,
                    lv3: 160,
                    selected: 200
                },
                // selectedNum:3,// 设置可以选择多少个复选框 可选 不传默认3
                height: 260, //高度 不传默认值 280

                selectedNum: 20,
                // data: jobs.info, //数据 必传
                data: tagsJson,
                confirm: function (res) { //回调函数 必传 会以json的格式返回所选中的数据
                    for (var k in res) {
                        $(".jobType").eq(k).val(res[k].value);
                        $(".jobType").eq(k).attr('name', 'jobType[' + res[k].uid + ']');
                    }
                }
            });
        }
    }

    $(function () {
        // handleCount();
        findEvent("", true, 1);
        // initTags();
        // initObjectTag();
        // dataTogether();
        // tagfind();

        // 关闭弹窗
        $(".close").click(function () {
            $(".maskBox").fadeOut(200);
        });

        $(".tabConSon2").perfectScrollbar();

        $(".js-cancel").click(function () {
            $(this).parents(".mmodal").hide();
        });

        // 输入框控件调用
        vVsub();

        jeDate("#searchOccurredTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: "至"
        });
        jeDate("#SearchSettlementTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: "至"
        });

        jeDate("#occurredTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#handleDate", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });

        jeDate("#wwJarq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#wwCdrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });




        // 排序方式
        $(".statusList li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        })
        var sortHtml = "";
        var sortMOnOff = true;
        $(".sortMethod").click(function () {
            if (sortMOnOff) {
                $(this).next().slideDown();
            } else {
                $(this).next().slideUp();
            }
            sortMOnOff = !sortMOnOff;
        });
        $(".sortText p").click(function () {
            sortMOnOff = !sortMOnOff;
            $(this).parent().slideUp();
            sortHtml = $(this).html();
            $(".sortMethod").html(sortHtml);
        });


        // 弹窗关闭
        $(".kuang i.close").click(function () {
            $(".tanBox").fadeOut();
        })
        $(".clearBtn").click(function () {
            $(this).prev().val("");
        })

        function newAdduploadImg() {
            var img = '';

            //获取图片路径的方法，兼容多种浏览器，通過createObjectURL实现
            function getObjectURL(file) {
                var url = null;
                if (window.createObjectURL != undefined) {
                    url = window.createObjectURL(file); //basic
                } else if (window.URL != undefined) {
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) {
                    url = window.webkitURL.createObjectURL(file);
                }

                return url;
            }

            //实现上上传图片功能代码
            $(function () {
                $("#browerfile").change(function (e) {
                    var path = browerfile.value;
                    var objUrl = getObjectURL(this.files[0]);
                    if (objUrl) {
                        $('#QRCode').attr("src", objUrl);
                    }
                    var file = e.target.files[0];
                    var reader = new FileReader();
                    reader.readAsDataURL(file); // 读出 base64
                    reader.onloadend = function () {
                        // 图片的 base64 格式, 可以直接当成 img 的 src 属性值
                        img = reader.result;
                        // 下面逻辑处理

                    };
                })
            })
        }

        newAdduploadImg();
        // 弹框滚动条
        $(".titleCon").perfectScrollbar();


    });


    function footerChange() {
        // .index-main高度
        var indexMainH = $(".fx-left").outerHeight(true);
        $(".footerBox").css("top", indexMainH + 50);
    }


    //数据聚合汇总
    function dataTogether() {
        $("#dataBoxLoading").mLoading("show");
        var beginDate = new Date();
        var timer1 = window.setTimeout(function () {
            $.ajax({
                result: "post",
                url: "/eventManager/dataTogetherWithPage",
                dataType: "json",
                data: {
                    eventId: "",
                    eventType: "contradictionEvent",
                    page: 1,
                    pageSize: 5
                },
                success: function (result) {
                    var list = result.dataTogether;
                    var count = result.count;
                    // var count = 0;
                    $("#dataTogetherCount").text(count);
                    $("#dataTogether").empty();
                    if (count == 0) {
                        var str = '<li style="height: 250px" class="backG"></li>';
                        $("#dataTogether").append(str);
                    }
                    for (var i = 0; i < list.length; i++) {
                        var event = list[i];
                        var eventName = event.EVENT_NAME;
                        if (eventName == null || eventName.trim().length == 0) {
                            eventName = '无';
                        }
                        var eventContent = event.EVENT_CONTENT;
                        if (eventContent == null || eventContent.trim().length == 0) {
                            eventContent = '无';
                        }
                        var eventSource = event.EVENT_SOURCE;
                        if (eventSource == null || eventSource.trim().length == 0) {
                            eventSource = '无';
                        }
                        var stCreateTime = new Date(event.ST_CREATE_TIME).format("yyyy-MM-dd hh:mm:ss");
                        if (event.ST_CREATE_TIME == null) {
                            stCreateTime = '无';
                        }
                        $("#dataTogether").append('<dl>\n' +
                            '                              <dt>\n' +
                            '                              <span style="font-weight: bold;white-space: nowrap; text-overflow:ellipsis; overflow: hidden; ">' + eventName + '</span>\n' +
                            '                              <i class="new"></i>\n' +
                            '                                </dt>\n' +
                            '                                <dd>\n' +
                            '                                <p class="con" style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">' + eventContent + '' +
                            '                                </p>\n' +
                            '                            <div class="sourceInfo">\n' +
                            // '                                <span class="name">小林</span>\n' +
                            '                                <strong style="margin-left: 0px;">\n' +
                            '                                <b>来源</b>\n' +
                            '                                <span>' + eventSource + '</span>\n' +
                            '                                </strong>\n' +
                            '                                <em>' + stCreateTime + '</em>\n' +
                            '                            </div>\n' +
                            '                            </dd>\n' +
                            '                            </dl>');

                    }
                }
            })
            $("#dataBoxLoading").hide();
            window.clearTimeout(timer1);
        }, new Date() - beginDate + 200)
    }

    //单个事件数据聚合信息
    function eventDataTogether(eventId) {
        $.ajax({
            type: "post",
            url: "/eventInfo/findDataTogether",
            dataType: "json",
            async: false,
            data: {
                eventId: eventId,
                page: 1,
                pageSize: 1
            },
            success: function (result) {
                if (result.code == 'success') {
                    eventDateTogetherCount = result.data.count;
                }

            }
        })
    }

    //事件标签
    function getTags(objectId) {
        $.ajax({
            type: "POST",
            url: "/tagBaseInfo/findByObjectId",
            dataType: "json",
            async: false,
            data: {
                objectId: objectId
            },
            success: function (result) {
                var str = '';
                if (result.code === "success") {
                    var tags = result.data;
                    var tagCount = 10;
                    if (tags.length >= tagCount) {
                        tags.length = tagCount;
                    }
                    for (var i = 0; i < tags.length; i++) {
                        str += '<span style="background: ' + JSON.parse(tags[i].tagCssCode).color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag = str;

            }
        });
    }

    //事件列表
    function findEvent(handleFlag, flag, page) {

        var tags = '';
        $(".labelAll span strong").each(function () {
            tags += "" + $(this).text() + "" + ','
        });
        if (tags) {
            tags = tags.substring(0, tags.length - 1);
        }

        $("#loading").mLoading("show");
        $("#eventList").empty();
        var begingDate = new Date();
        var time1 = window.setTimeout(function () {

            var data = {};
            data.nameOrPlace = $("#SearchNameOrPlace").val();
            data.isSettlement = $("#SearchIsSettlement").val();
            data.occurredTime = $("#searchOccurredTime").val();
            data.settlementTime = $("#SearchSettlementTime").val();
            data.isHandle = handleFlag;
            data.page = page;
            data.pageSize = 5;
            $.ajax({
                type: "post",
                url: "/eventInfo/findByParam",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.code === "success") {
                        var events = result.data.events;
                        //下载本页时使用，用于暂存本页数据
                        // $("#eventInfo").val(JSON.stringify(rows))
                        $("#totalEvent").text("");
                        $("#totalEvent").text(result.data.count);
                        $("#eventList").empty();

                        $("#loading").css("height", "0");
                        if (flag) {
                            // 分页
                            var pageTotal;
                            if (result.data.count <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.data.count / 5);
                            }
                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //必填,总页数
                                pageAmount: 5,  //每页多少条
                                dataTotal: result.data.count, //总共多少条数据
                                curPage: 1, //初始页码,不填默认为1
                                pageSize: 5, //分页个数,不填默认为5
                                showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                                showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                                getPage: function (page) {

                                    // search(page, hjqk, false);
                                    //获取当前页数

                                }
                            });
                        }
                        if (events.length == 0) {
                            var strs = '<li class="backG topCot" style="height: 250px;">' +
                                '</li>';
                            $("#eventList").append(strs);
                        }
                        for (var i = 0; i < events.length; i++) {

                            var hanled = "未处理";
                            var iconImg = '';
                            if (events[i].isHandle == "1") {
                                iconImg = '<i class="icon" style="background:url(../images/icon-green.png) no-repeat ">'
                                hanled = "已处理";
                            } else {
                                iconImg = '<i class="icon">';
                            }


                            eventDataTogether(events[i].eventId);
                            // if (!eventDateTogetherCount) {
                            //     eventDateTogetherCount = 0;
                            // }
                            getTags(events[i].eventId);
                            if (!unittag) {
                                unittag = ''
                            }

                            var occurredTime = "无";
                            if (events[i].occurredTime != null) {
                                occurredTime = new Date(events[i].occurredTime).format("yyyy-MM-dd  hh:mm:ss")
                            }
                            var str = ' <li>\n' +
                                '                        <div class="pubBox waitPG">\n' +
                                iconImg +
                                '                                <span>' + hanled + '</span>\n' +
                                '                            </i>\n' +
                                '                            <p class="proName"  onclick="baseInfo(\'' + events[i].eventId + '\',\'' + isValidStr(events[i].eventName) + '\')" style="cursor: pointer" >' + isValidStr(events[i].eventName) + '</p>\n' +
                                '                            <p class="proInfo" style=" white-space:nowrap;\n' +
                                '            text-overflow:ellipsis;\n' +
                                '            overflow: hidden;">' + isValidStr(events[i].eventContent) + '</p>\n' +
                                '                            <div class="infoBox">\n' +
                                '                                <div class="item" name="发生时间">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span>' + occurredTime + '</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="item">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span onclick="toEventDataTogether(\'' + events[i].eventId + '\',\'' + eventDateTogetherCount + '\')" style="cursor: pointer">数据聚合（' + eventDateTogetherCount + '）</span>\n' +
                                '                                </div>\n' +
                                // '                                <div class="item">\n' +
                                // '                                    <i></i>\n' +
                                // '                                    <a href="javascript:;">工作动态（3）</a>\n' +
                                // '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="labelBox" id="eventLabels" style="height:24px;">\n' + unittag +
                                '                            </div>\n' +
                                '                            <div class="btnGroup">\n' +
                                '                                <div class="sortList sortList2 v-fr">\n' +
                                '                                    <a href="javascript:;" class="sort">操作</a>\n' +
                                '                                    <div class="sortDown sortDown2">\n' +
                                '                                        <p onclick="baseInfo(\'' + events[i].eventId + '\')">详情</p>\n' +
                                '                                        <p onclick="showUpdate(\'' + events[i].eventId + '\')"> 修改</p>\n' +
                                '                                        <p onclick="showDel(\'' + events[i].eventId + '\')">删除</p>\n' +
                                '                                        <p onclick="resUnitShow(\'' + events[i].eventId + '\')">责任单位</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + events[i].eventId + '\',\'handlelog\')">处置日志</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + events[i].eventId + '\',\'leader\')">领导批示</p>\n' +
                                '                                        <p onclick="showResolve(\'' + events[i].eventId + '\')">化解存档</p>\n' +
                                '                                    </div>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                    </li>';
                            $("#eventList").append(str)


                        }
                        // 操作下拉
                        var dropSort = true;
                        $(".searchCon ul li .sort").click(function () {
                            if (dropSort) {
                                $(this).next().fadeIn();
                            } else {
                                $(this).next().fadeOut();
                            }
                            dropSort = !dropSort;
                        })
                        $(".sortDown").mouseleave(function () {
                            $(this).fadeOut(200);
                        });
                        // footerChange();
                    }
                }
            });
            $("#loading").mLoading("hide");
            window.clearTimeout(time1)
        }, new Date() - begingDate + 200)

    }

    function toEventDataTogether(eventId, eventDateTogetherCount) {
        if (eventDateTogetherCount == 0) {
            noDataTogether();
        } else {
            openNewWindow("dataTogether.jsp?Type=" + eventId + "");
        }
    }

    //详细信息
    function baseInfo(eventId, eventName) {
        var url = encodeURI("eventDetail.jsp?eventId=" + eventId);
        openNewWindow(url);
    }

    //保存标签
    function savetagNames(tagnames) {
        $("#eventTagNames").val("")
        var tags = [];
        for (var i = 0; i < tagnames.length; i++) {
            var tagname = tagnames[i].tagName;
            tags.push(tagname);
        }
        $("#eventTagNames").val(tags)
    }

    function showDel(eventId) {
        $("#toUpdateEventId").val(eventId)
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    var eventId = $("#toUpdateEventId").val();
                    $.ajax({
                        result: "POST",
                        url: "/eventManager/delEventBaseInfo",
                        dataType: "text",
                        data: {
                            eventType: "contradictionEvent",
                            eventId: eventId
                        },
                        success: function (result) {
                            if (result == "success") {
                                $("#m1").hide();
                                findEvent("", "", "", "", "", "", "", "", 1, 5, "0", true);
                                handleCount();
                                dataTogether();
                                // $("#m2").show();
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
    }

    function successOperator() {
        $.messager.alert("操作提示", "操作成功!");
    }

    function noDataTogether() {
        $.messager.alert("操作提示", "无数据聚合!");
    }

    // 高级搜索
    function advanceSearch(){
        if (searchonOff) {
            $("#advancedSearch").html("收起工具");
            $("#advancedSearch").addClass("active");
            $(".advanceBox").addClass("active");
            $(".advanceBox").animate({"height": "178px"}, 100);
        } else {
            $("#advancedSearch").html("高级搜索");
            $("#advancedSearch").removeClass("active");
            $(".advanceBox").removeClass("active");
            $(".advanceBox").animate({"height": "70px"}, 100);
        }
        searchonOff = !searchonOff;
    }

    //添加显示
    function addShow() {
        $("input").val("");
        $("#eventContent").val("");
        $("#eventStatus").val("");
        $("#update").hide();
        $("#addEventTitle").show();
        $("#updateEventTitle").hide();
        $("#add").show();
        $("#addEvent").show();
    }

    //导出事件
    function exportEventToExcel() {
        $('<form id="exportEvent" method="post" action="/eventManager/downloadAllContradictionEvent/"></form>').appendTo('body').submit().remove();
    }

    //已处理、未处理统计
    function handleCount() {
        $.ajax({
            result: "POST",
            url: "/eventManager/contradictionIsHandle",
            dataType: "json",
            success: function (result) {
                var handled = result.handled;
                var handling = result.handling;
                $("#handled").text(handled + "个")
                $("#handling").text(handling + "个")
            }
        })
    }

    //初始化选择标签
    function initTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findAllTag",
            dataType: "json",
            // async: false,//异步改为同步
            data: {
                field: "tagName",
                method: "asc"
            },
            success: function (result) {
                if (result.message == "success") {
                    var tags = result.allTag;
                    $("#allTags").empty();
                    for (var i = 0; i < tags.length; i++) {
                        $("#allTags").append('<span class="spanItem">' + tags[i].tagName + '</span>');
                        $("#addEventTags").append('<option>' + tags[i].tagName + '</option>');
                    }
                }
            }
        });
    }

    function initObjectTag() {
        initUnitTags();
        initPersonTags();
        initEventTags();
    }


    //初始化人员标签
    function initPersonTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findTagByType",
            dataType: "json",
            data: {
                tagLabelType: "person",
            },
            success: function (result) {
                if (result.message != "error") {
                    var persons = {"level": 1, "name": "人", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var personClasses = [];
                    var tagList = result.list;
                    // $("#personTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        var classes = {
                            "level": 2,
                            "name": tag[0].tagClassesFirstName,
                            "id": uuid(),
                            "uid": uuid(),
                            "pid": uuid()
                        };
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var persontag = {"level": 3, "name": tagName, "id": uuid(), "uid": uuid(), "pid": uuid()};
                            tags.push(persontag);

                        }
                        classes.children = tags;
                        personClasses.push(classes);
                    }
                    persons.children = personClasses;
                    tagsJson.push(persons);
                    initpersontagflag = true;
                    initSelect();
                }
            }
        });
    }

    //初始化单位标签
    function initUnitTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findTagByType",
            dataType: "json",
            data: {
                tagLabelType: "unit"
            },
            success: function (result) {
                if (result.message != "error") {
                    var units = {"level": 1, "name": "单位", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var unitClasses = [];
                    var tagList = result.list;
                    // $("#unitTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        var classes = {
                            "level": 2,
                            "name": tag[0].tagClassesFirstName,
                            "id": uuid(),
                            "uid": uuid(),
                            "pid": uuid()
                        };
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var unittag = {"level": 3, "name": tagName, "id": uuid(), "uid": uuid(), "pid": uuid()};
                            tags.push(unittag);
                        }
                        classes.children = tags;
                        unitClasses.push(classes);
                    }
                    units.children = unitClasses;
                    tagsJson.push(units);
                    initunittagflag = true;
                    initSelect();
                }
            }
        });
    }

    //初始化事件标签
    function initEventTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findTagByType",
            dataType: "json",
            data: {
                tagLabelType: "event",
            },
            success: function (result) {
                if (result.message != "error") {
                    var events = {"level": 1, "name": "事件", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var eventClasses = [];
                    var tagList = result.list;
                    // $("#eventTags").empty();
                    for (var i = 0; i < tagList.length; i++) {

                        var tag = tagList[i];//某一类的list
                        var classes = {
                            "level": 2,
                            "name": tag[0].tagClassesFirstName,
                            "id": uuid(),
                            "uid": uuid(),
                            "pid": uuid()
                        };
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var eventtag = {"level": 3, "name": tagName, "id": uuid(), "uid": uuid(), "pid": uuid()};
                            tags.push(eventtag);
                        }
                        classes.children = tags;
                        eventClasses.push(classes);
                    }
                    events.children = eventClasses;
                    tagsJson.push(events);
                    initeventtagflag = true;
                    initSelect();
                }
            }
        })
    }



    //处置日志显示
    function showEventHandle(eventId, result) {
        $("#editEventHandLogFlag").val("0");
        var showType;

        if (result == "handlelog") {
            $("#handleLogTitle").show();
            $("#leaderTitle").hide();
            $("#handleLogBut").show();
            $("#leaderBut").hide();
            showType = 0;
        }
        if (result == "leader") {
            $("#handleLogTitle").hide();
            $("#leaderTitle").show();
            $("#handleLogBut").hide();
            $("#leaderBut").show();
            showType = 1;
        }
        reShowHandleLog(eventId, showType, 1, true);
        $("#toUpdateEventId").val(eventId)
        $("#handleContent").val("");
        $("#czPath").val("");
        $("#handleFilepath").text("");
        $("#handleDate").val("");
        $("#handleUser").val("");
        $("#handleFilepath").val("");
        $("#handleCuser").val("");
        $("#handleCjdid").val("");
        $("#handleJfrs").val("");
        $("#eventHandle").show();

    }

    //保存处置日志
    function saveEventHandle(handleType) {

        var eventId = $("#toUpdateEventId").val();
        var data = {};
        var editFlag = $("#editEventHandLogFlag").val();
        if (editFlag == "1") {
            data.handleLogId = $("#toUpdateHandleLogId").val();
        }
        data.handleType = handleType;//代表处置日志,1为领导批示
        data.handleEventId = eventId;
        data.handleContent = $("#handleContent").val();
        data.handleDate = parserDate($("#handleDate").val());
        data.handleUser = $("#handleUser").val();
        data.handleCuser = $("#handleCuser").val();
        var handleCjdid = $("#handleCjdid option:selected").text();
        if (handleCjdid == "请选择") {
            handleCjdid = "";
        }
        data.handleCjdid = handleCjdid;
        data.handleJfrs = $("#handleJfrs").val();
        var handleIsflag = "";
        if ($("#handleIsflag").find("label:eq(0)").hasClass("vV-radio ck")) {
            handleIsflag = "1";
        }
        if ($("#handleIsflag").find("label:eq(1)").hasClass("vV-radio ck")) {
            handleIsflag = "0";
        }
        data.handleIsflag = handleIsflag;
        var handleJflx = $("#handleJflx").find("li[class='act']").attr('value');
        data.handleJflx = handleJflx;
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/addEventHandleLog",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.message != "error") {
                    $("#eventHandle").hide();
                    uploadHanlelogFj(result.handleLogId);
                    findEvent();
                    // $("#m2").show();
                    successOperator();
                }
            }
        });
    }

    function uploadHanlelogFj(handleLogId) {
        var fileEleId = "czPath";
        var attrName = "czPath";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/eventHandleLogController/uploadHandleLogFj",
            fileElementId: fileEleId,
            dataType: "text",
            data: {
                attrName: attrName,
                eventHandlogId: handleLogId
            },
        });
    }

    var parserDate = function (date) {
        var t = Date.parse(date);
        if (!isNaN(t)) {
            return new Date(Date.parse(date.replace(/-/g, "/")));
        } else {
            return new Date();
        }
    };

    //化解存档显示
    function showResolve(eventId) {
        $("#toUpdateEventId").val(eventId)
        $("#wwJarq").val("");
        $("#wwCdrq").val("");
        $("#resolve").show();
    }


    function sortEvent(sortField) {
        $("#sort").val(sortField);
        search(1, "", true);
    }

    function selectFile(thisdom) {
        thisdom.prev().trigger('click');
        thisdom.prev().on('change', function (event) {
            var fileName = event.target.files[0].name
            thisdom.next().text(fileName)
        })
    }


    function reset() {
        $("#SearchNameOrPlace").val("");
        $("#searchOccurredTime").val("");
        $("#SearchIsSettlement").val("");
        $("#SearchSettlementTime").val("");
        $(".labelAll span strong").each(function () {
            // var removeStr = $(this).text();
            $(this).parent().remove();
        });

    }

    function reShowHandleLog(eventId, result, page, pageFlag) {
        $("#toUpdateEventId").val(eventId);
        $("#toUpdatehandleLogType").val(result);
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/listEventHandleLogWithPage",
            dataType: "json",
            data: {
                eventId: eventId,
                result: result,
                page: page,
                pageSize: 3
            },
            success: function (result) {
                var total = result.total;
                $(".totalHandle").text(total)
                var rows = result.rows;


                var pageTotal;
                if (total <= 3) {
                    pageTotal = 1;
                } else {
                    pageTotal = Math.ceil(total / 3);
                }

                if (pageFlag) {
                    new Page({
                        id: 'paginationHandle',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 3,  //每页多少条
                        dataTotal: total, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 3, //分页个数,不填默认为5
                        getPage: function (page) {
                            reShowHandleLog(eventId, result, page, false);
                        }
                    });
                }
                $("#handleList").empty();
                $("#handleList").append('<tr>\n' +
                    '                    <th width="10%">处置日期</th>\n' +
                    '                    <th width="10%">集访类型</th>\n' +
                    '                    <th width="10%">集访人数</th>\n' +
                    '                    <th width="20%">处置情况</th>\n' +
                    '                    <th width="10%">处置附件</th>\n' +
                    '                    <th width="20%">录入单位</th>\n' +
                    '                    <th width="10%">操作</th>\n' +
                    '                </tr>')
                for (var i = 0; i < rows.length; i++) {
                    var handleCtime = new Date(rows[i].handleCtime).format("yyyy-MM-dd");
                    if (rows[i].handleCtime == null) {
                        handleCtime = "无"
                    }
                    var handleJflx = rows[i].handleJflx;
                    if (handleJflx == "1") {
                        handleJflx = "人员聚集"
                    } else if (handleJflx == "2") {
                        handleJflx = "日常处置"
                    } else if (handleJflx == "3") {
                        handleJflx = "召开会议"
                    } else {
                        handleJflx = "无"
                    }
                    var handleJfrs = rows[i].handleJfrs;
                    if (handleJfrs == null || handleJfrs.trim().length == 0) {
                        handleJfrs = "0"
                    }
                    var handleContent = rows[i].handleContent;
                    if (handleContent == null || handleContent.trim().length == 0) {
                        handleContent = "无"
                    }
                    var handleFilepath = rows[i].handleFilepath;
                    if (handleFilepath == null || handleFilepath.trim().length == 0) {
                        handleFilepath = "无"
                    } else {
                        handleFilepath = getCaption(handleFilepath);
                    }

                    var handleCjdid = rows[i].handleCjdid;
                    if (handleCjdid == null || handleCjdid.trim().length == 0) {
                        handleCjdid = "无"
                    }
                    $("#handleList").append(' <tr>\n' +
                        '                    <td>' + handleCtime + '</td>\n' +
                        '                    <td>' + handleJflx + '</td>\n' +
                        '                    <td>' + handleJfrs + '</td>\n' +
                        '                    <td >' + handleContent + '</td>\n' +
                        '                    <td>' + handleFilepath + '</td>\n' +
                        '                    <td>' + handleCjdid + '</td>\n' +
                        '                    <td>\n' +
                        '                        <a onclick="editHandleLog(\'' + rows[i].handleLogId + '\')" style="color: #409dff">编辑</a>\n' +
                        '                        <a onclick="delHandleLog(\'' + rows[i].handleLogId + '\')" style="color: #409dff">删除</a>\n' +
                        '                    </td>\n' +
                        '                </tr>')
                }
            }
        });
    }

    function editHandleLog(handleLogId) {
        $("#editEventHandLogFlag").val("1");
        $("#toUpdateHandleLogId").val(handleLogId)
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/findEventHandleLogById",
            dataType: "json",
            data: {
                handleLogId: handleLogId,
            },
            success: function (result) {
                $("#handleContent").val(result.handleContent);
                $("#handleDate").val(new Date(result.handleDate).format("yyyy-MM-dd hh:ss:mm"));
                // $("#handleFilepath").text(getCaption(result.handleFilepath));
                $("#handleUser").val(result.handleUser);
                $("#handleCuser").val(result.handleCuser);
                var handleCjdid = result.handleCjdid;
                debugger
                if (handleCjdid == null || handleCjdid.trim().length == 0 || handleCjdid == "") {
                    $("#handleCjdid").val("")
                } else {
                    $("#handleCjdid").val($("#handleCjdid").find("option:contains('" + handleCjdid + "')").val())
                }
                $("#handleJfrs").val(result.handleJfrs);
                var handleJflx = result.handleJflx;
                $("#handleJflx").find("li").removeClass("act");
                if (handleJflx == "1") {
                    $("#handleJflx").find("li:eq(0)").addClass("act");
                }
                if (handleJflx == "2") {
                    $("#handleJflx").find("li:eq(1)").addClass("act");
                }
                if (handleJflx == "3") {
                    $("#handleJflx").find("li:eq(2)").addClass("act");
                }
                $("#handleIsflag").find("label").removeClass("ck");
                if (result.handleIsflag == "1") {
                    $("#handleIsflag").find("label:eq(0)").addClass("ck");
                }
                if (result.handleIsflag == "0") {
                    $("#handleIsflag").find("label:eq(1)").addClass("ck");
                }
            }
        })
    }

    function delHandleLog(handleLogId) {
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    $.ajax({
                        result: "POST",
                        url: "/eventHandleLogController/delEventHandleLog",
                        dataType: "text",
                        data: {
                            handleLogId: handleLogId,
                        },
                        success: function (result) {
                            if (result == "success") {
                                var toUploadEventId = $("#toUpdateEventId").val();
                                var eventHandleLogType = $("#toUpdatehandleLogType").val();
                                debugger
                                reShowHandleLog(toUploadEventId, eventHandleLogType, 1, true);
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
    }

    //截取字符串
    function getCaption(obj) {
        return obj.split("@@@@")[1]
    }

    var IsHj;

    function showUpdate(eventId) {
        $("#toUpdateEventId").val(eventId);
        $("#add").hide();
        $("#addEventTitle").hide();
        $("#updateEventTitle").show();
        $("#update").show();
        $.ajax({
            result: "POST",
            url: "/eventManager/findEventBaseInfoById",
            dataType: "json",
            data: {
                eventType: "contradictionEvent",
                eventId: eventId
            },
            success: function (result) {
                if (result.message == "success") {
                    var eventBase = result.eventById;
                    var contradictionEvent = result.contradictionEventById;
                    $("#addeventName").val(eventBase.eventName);
                    $("#occurredTime").val(new Date(eventBase.occurredTime).format("yyyy-MM-dd hh:mm:ss"));
                    $("#eventContent").val(eventBase.eventContent);
                    $("#occurredPlace").val(eventBase.occurredPlace);
                    $("#wwMdlb").find("option[text='" + contradictionEvent.wwMdlb + "']").attr("selected", "selected");
                    $("#eventLongti").val(eventBase.eventLongti);
                    $("#eventLati").val(eventBase.eventLongti);
                    $("#eventStatus").val(contradictionEvent.wwSfhj);
                    // $("#stUpdateTime").val(new Date(eventBase.stUpdateTime).format("yyyy-MM-dd hh:mm:ss"));
                    $("#wwDsrA").val(contradictionEvent.wwDsrA);
                    $("#wwDsrB").val(contradictionEvent.wwDsrB);
                    $("#wwDqlx").find("li").removeClass("act");
                    $("#wwDqlx").find("li[value='" + contradictionEvent.wwDqlx + "']").addClass("act");
                    $("#wwMdlx").find("li").removeClass("act");
                    $("#wwMdlx").find("li[value='" + contradictionEvent.wwMdlx + "']").addClass("act");
                    $("#wwMdjb").find("option:contains(" + contradictionEvent.wwMdJbName + ")").attr("selected", "selected");
                    $("#wwCfqkXf").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkXf == "0") {
                        $("#wwCfqkXf").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkXf").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwCfqk12345").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqk12345 == "0") {
                        $("#wwCfqk12345").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqk12345").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwCfqkFf").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkFf == "0") {
                        $("#wwCfqkFf").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkFf").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwCfqkYjf").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkYjf == "0") {
                        $("#wwCfqkYjf").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkYjf").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwCfqkDtj").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkDtj == "0") {
                        $("#wwCfqkDtj").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkDtj").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwCfqkSs").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkSs == "0") {
                        $("#wwCfqkSs").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkSs").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwCfqkZc").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkZc == "0") {
                        $("#wwCfqkZc").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkZc").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwCfqkW").find("label").removeClass("ck");
                    if (contradictionEvent.wwCfqkW == "0") {
                        $("#wwCfqkW").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwCfqkW").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsZdbwdsj").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsZdbwdsj == "0") {
                        $("#wwIsZdbwdsj").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsZdbwdsj").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsKsssj").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsKsssj == "0") {
                        $("#wwIsKsssj").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsKsssj").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsYlsj").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsYlsj == "0") {
                        $("#wwIsYlsj").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsYlsj").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsLshjsj").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsLshjsj == "0") {
                        $("#wwIsLshjsj").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsLshjsj").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwIsLswhjcssj").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsLswhjcssj == "0") {
                        $("#wwIsLswhjcssj").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsLswhjcssj").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsSfsu").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsSfsu == "0") {
                        $("#wwIsSfsu").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsSfsu").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsCxcf").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsCxcf == "0") {
                        $("#wwIsCxcf").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsCxcf").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwIsLdba").find("label").removeClass("ck");
                    if (contradictionEvent.wwIsLdba == "0") {
                        $("#wwIsLdba").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwIsLdba").find("label:eq(1)").addClass("ck");
                    }
                    $("#wwSFHH").find("label").removeClass("ck");
                    if (contradictionEvent.wwSFHH == "0") {
                        $("#wwSFHH").find("label:eq(0)").addClass("ck");
                    } else {
                        $("#wwSFHH").find("label:eq(1)").addClass("ck");
                    }

                    $("#wwZrr").val(contradictionEvent.wwZrr);
                    $("#wwSjrs").find("option:contains(" + contradictionEvent.wwSjrs + ")").attr("selected", "selected");
                    $("#wwBz").val(contradictionEvent.wwBz);
                    if (contradictionEvent.wwSjly == "") {
                        $("#wwSjly").val("");
                    } else {
                        $("#wwSjly").find("option:contains('" + contradictionEvent.wwSjly + "')").attr("selected", "selected");
                    }
                    $("#wwGzzq").val(contradictionEvent.wwGzzq);
                    $("#wwGzzq").find("lable").removeClass("ck");
                    if (contradictionEvent.wwGzzq == "7") {
                        $("#wwGzzq").find("lable option:eq(0)").addClass("ck");
                    }
                    if (contradictionEvent.wwGzzq == "15") {
                        $("#wwGzzq").find("lable option:eq(1)").addClass("ck");
                    }
                    if (contradictionEvent.wwGzzq == "30") {
                        $("#wwGzzq").find("lable option:eq(2)").addClass("ck");
                    }
                    $("#wwJdName").val(contradictionEvent.wwJdCode);
                    initJw(contradictionEvent.wwJdCode)
                    $("#wwJw").val(contradictionEvent.wwJw)
                    var wwSfhj = contradictionEvent.wwSfhj;
                    if (wwSfhj == "0") {
                        $("#wwSFHH").show();
                        $("#wwSFHHtitle").show();
                    } else {
                        $("#wwSFHH").hide();
                        $("#wwSFHHtitle").hide();
                    }
                    IsHj = wwSfhj;
                    $("#addEvent").show();
                }
            }
        });
    }

    function save(flag) {
        var data = {};
        data.eventType = "contradictionEvent";
        data.eventName = $("#addeventName").val();
        data.occurredTime = parserDate($("#occurredTime").val());
        data.eventContent = $("#eventContent").val();
        data.occurredPlace = $("#occurredPlace").val();
        var wwMdlb = $("#wwMdlb option:selected").text();
        if (wwMdlb == "请选择") {
            wwMdlb = "";
        }
        data.wwMdlb = wwMdlb;
        data.eventLongti = $("#eventLongti").val();
        data.eventLati = $("#eventLati").val();
        data.wwSfhj = $("#eventStatus").val();
        // data.stUpdateTime = parserDate($("#stUpdateTime").val());
        data.wwDsrA = $("#wwDsrA").val();
        data.wwDsrB = $("#wwDsrB").val();
        data.wwDqlx = $("#wwDqlx").find("li[class='act']").attr('value')
        data.wwMdlx = $("#wwMdlx").find("li[class='act']").attr('value')
        data.wwMdjb = $("#wwMdjb option:selected").val();
        var wwMdJbName = $("#wwMdjb option:selected").text();
        if (wwMdJbName == "请选择") {
            wwMdJbName = "";
        }
        data.wwMdJbName = wwMdJbName;
        var wwCfqkXf;
        if ($("#wwCfqkXf").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkXf = "0";
        }
        if ($("#wwCfqkXf").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkXf = "1";
        }
        data.wwCfqkXf = wwCfqkXf;

        var wwCfqk12345;
        if ($("#wwCfqk12345").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqk12345 = "0";
        }
        if ($("#wwCfqk12345").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqk12345 = "1";
        }
        data.wwCfqk12345 = wwCfqk12345;

        var wwCfqkFf;
        if ($("#wwCfqkFf").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkFf = "0";
        }
        if ($("#wwCfqkFf").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkFf = "1";
        }
        data.wwCfqkFf = wwCfqkFf;

        var wwCfqkYjf;
        if ($("#wwCfqkYjf").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkYjf = "0";
        }
        if ($("#wwCfqkYjf").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkYjf = "1";
        }
        data.wwCfqkYjf = wwCfqkYjf;

        var wwCfqkDtj;
        if ($("#wwCfqkDtj").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkDtj = "0";
        }
        if ($("#wwCfqkDtj").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkDtj = "1";
        }
        data.wwCfqkDtj = wwCfqkDtj;

        var wwCfqkSs;
        if ($("#wwCfqkSs").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkSs = "0";
        }
        if ($("#wwCfqkSs").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkSs = "1";
        }
        data.wwCfqkSs = wwCfqkSs;

        var wwCfqkZc;
        if ($("#wwCfqkZc").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkZc = "0";
        }
        if ($("#wwCfqkZc").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkZc = "1";
        }
        data.wwCfqkZc = wwCfqkZc;

        var wwCfqkW;
        if ($("#wwCfqkW").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwCfqkW = "0";
        }
        if ($("#wwCfqkW").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwCfqkW = "1";
        }
        data.wwCfqkW = wwCfqkW;

        var wwIsZdbwdsj;
        if ($("#wwIsZdbwdsj").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsZdbwdsj = "0";
        }
        if ($("#wwIsZdbwdsj").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsZdbwdsj = "1";
        }
        data.wwIsZdbwdsj = wwIsZdbwdsj;

        var wwIsKsssj;
        if ($("#wwIsKsssj").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsKsssj = "0";
        }
        if ($("#wwIsKsssj").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsKsssj = "1";
        }
        data.wwIsKsssj = wwIsKsssj;
        var wwIsYlsj;
        if ($("#wwIsYlsj").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsYlsj = "1";
        }
        if ($("#wwIsYlsj").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsYlsj = "0";
        }
        data.wwIsYlsj = wwIsYlsj;

        var wwIsLshjsj;
        if ($("#wwIsLshjsj").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsLshjsj = "1";
        }
        if ($("#wwIsLshjsj").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsLshjsj = "0";
        }
        data.wwIsLshjsj = wwIsLshjsj;

        var wwIsLswhjcssj;
        if ($("#wwIsLswhjcssj").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsLswhjcssj = "1";
        }
        if ($("#wwIsLswhjcssj").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsLswhjcssj = "0";
        }
        data.wwIsLswhjcssj = wwIsLswhjcssj;

        var wwIsSfsu;
        if ($("#wwIsSfsu").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsSfsu = "1";
        }
        if ($("#wwIsSfsu").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsSfsu = "0";
        }
        data.wwIsSfsu = wwIsSfsu;

        var wwIsCxcf;
        if ($("#wwIsCxcf").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsCxcf = "1";
        }
        if ($("#wwIsCxcf").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsCxcf = "0";
        }
        data.wwIsCxcf = wwIsCxcf;

        var wwIsLdba;
        if ($("#wwIsLdba").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwIsLdba = "1";
        }
        if ($("#wwIsLdba").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwIsLdba = "0";
        }
        data.wwIsLdba = wwIsLdba;
        data.wwZrr = $("#wwZrr").val();
        var wwSjrs = $("#wwSjrs option:selected").text();
        if (wwSjrs == "请选择") {
            wwSjrs = "";
        }
        data.wwSjrs = wwSjrs;
        data.wwBz = $("#wwBz").val();
        var wwSjly = $("#wwSjly option:selected").text();
        if (wwSjly == "请选择") {
            wwSjly = "";
        }
        data.wwSjly = wwSjly;
        var wwGzzq;
        if ($("#wwGzzq").find("label:eq(0)").hasClass("vV-radio ck")) {
            wwGzzq = "7";
        }
        if ($("#wwGzzq").find("label:eq(1)").hasClass("vV-radio ck")) {
            wwGzzq = "15";
        }
        if ($("#wwGzzq").find("label:eq(2)").hasClass("vV-radio ck")) {
            wwGzzq = "30";
        }
        data.wwGzzq = wwGzzq;
        var wwJdName = $("#wwJdName option:selected").text();
        if (wwJdName == "请选择") {
            wwJdName = "";
        }
        data.wwJdName = wwJdName;
        data.wwJdCode = $("#wwJdName").val();
        data.wwJw = $("#wwJw").val();
        var wwJwmc = $("#wwJwmc option:selected").text();
        if (wwJwmc == "请选择") {
            wwJwmc = "";
        }
        data.wwJwmc = wwJwmc;
        data.tagNames = $("#tagNames").val();
        if (flag == "add") {
            var wwSFHH;
            if ($("#wwSFHH").find("label:eq(0)").hasClass("vV-radio ck")) {
                wwSFHH = "1";
            }
            if ($("#wwSFHH").find("label:eq(1)").hasClass("vV-radio ck")) {
                wwSFHH = "0";
            }
            data.wwSFHH = wwSFHH;
            $.ajax({
                result: "POST",
                url: "/eventManager/addEventBaseInfo",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.message == "success") {
                        $("#addEvent").hide();
                        findEvent("", "", "", "", "", "", "", "", 1, 5, "0", true);
                        successOperator();
                        handleCount();
                        dataTogether();
                    }
                }
            });
        }
        if (flag == "update") {
            //未化解才添加是否缓和信息
            if (IsHj == 0) {
                var wwSFHH;
                if ($("#wwSFHH").find("label:eq(0)").hasClass("vV-radio ck")) {
                    wwSFHH = "1";
                }
                if ($("#wwSFHH").find("label:eq(1)").hasClass("vV-radio ck")) {
                    wwSFHH = "0";
                }
                data.wwSFHH = wwSFHH;
            }
            data.eventId = $("#toUpdateEventId").val();
            $.ajax({
                result: "POST",
                url: "/eventManager/alterEventBaseInfo",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.message == "success") {
                        $("#addEvent").hide();
                        findEvent("", "", "", "", "", "", "", "", 1, 5, "0", true);
                        successOperator();
                    }
                }
            });
        }

    }
</script>
</html>