<%@ taglib prefix="apptag" uri="app_tags" %>
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
    <link rel="stylesheet" href="../css/icon.css"><!--easyui-->
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
            background: url('/wwpt/images/noImage.png') no-repeat bottom center;
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
    </style>
</head>
<body>
<input result="hidden" id="toUpdateEventId">
<input result="hidden" id="toUpdateHandleLogId">
<input result="hidden" id="toUpdateAssessId">
<input result="hidden" id="editEventHandLogFlag">
<input result="hidden" id="editAssessFlag">
<input result="hidden" id="toUpdatehandleLogType">
<input result="hidden" id="searchHandle">
<input result="hidden" id="eventTagNames">
<input result="hidden" id="sort">
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
                            <input result="text" placeholder="请输入关键字" id="search">
                        </div>
                        <button class="btn1" onclick="search(1,'',true)">搜索</button>
                        <button class="btn2" onclick="reset()">重置</button>
                        <a id="advancedSearch" class="advancedSearch" onclick="advanceSearch()">高级搜索</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>事项类别：</span>

                            <apptag:dict result="select" clazz="vV-drop" style="width:250px;height:28px;"
                                         id="searchSXLB" name="wwJdName" dictId="FXFK_SXLB" />
                            <span>矛盾类别：</span>
                            <apptag:dict result="select" clazz="vV-drop" style="width:250px;height:28px;"
                                         id="searchMDLX" name="wwJdName" dictId="WTQD_MDLB"/>
                        </div>
                        <div>
                            <span>是否评估：</span>

                            <apptag:dict result="select" clazz="vV-drop" style="width:250px;height:28px;"
                                         id="searchSFPG" name="wwJdName" dictId="FXFK_SFPG"/>
                        </div>
                        <div>
                            <span>所属街道：</span>
                            <%--                            <select  class="easyui-combobox" style="width:250px;height:28px;" data-options="editable:false" id="searchSSJD">--%>
                            <%--                            </select>--%>
                            <apptag:dict result="select" clazz="vV-drop" style="width:250px;height:28px;"
                                         id="searchSSJD" name="wwJdName" dictId="XH_XZQY"/>
                            <span>居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委：</span>
                            <select class="vV-drop" style="width:250px;height:28px;" id="searchJw">
                                <option selected value="">请选择街道</option>
                            </select>
                        </div>
                        <div>
                            <span class="span">创建日期：</span>
                            <input id="searchCreatTime" class="vV-ipt date w-246" result="text" value=""
                                   style="width: 250px;" placeholder="请选择"
                                   readonly="readonly">
                            <span class="span">化解日期：</span>
                            <input id="searchHJRQ" class="vV-ipt date w-246" result="text" value="" style="width: 250px;"
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
                        <apptag:dict result="tagDiv" clazz="tabName" id="tag" name="tag" dictId="TAG_MODULE"
                                     defVal="TAG_LABLE_PEOPLE"/>
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
                    <a href="javascript:;" class="active" onclick="addShow()">新增</a>
                    <a onclick="exportEventToExcel()">下载</a>
                </div>
            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" id="handleResolve">
                    <li class="active" onclick="search(1,'-1',true)">全部</li>
                    <li onclick="search(1,'1',true)">已评估</li>
                    <li onclick="search(1,'0',true)">未评估</li>
                </ul>
                <div class="sortList v-fr">
                    <a href="javascript:;" class="sort sortMethod">排序方式</a>
                    <div class="sortDown sortText">
                        <p onclick="sortEvent('')">默认</p>
                        <p onclick="sortEvent('occuredTime')">按发生时间</p>
                        <p onclick="sortEvent('stCreateTime')">按入库时间</p>
                    </div>
                </div>
            </div>
            <div class="searchCon" style="position: relative">
                <div id="eventListLoading" style="position: absolute;z-index:5;top: 50%;left: 50%;margin-top: -100px;margin-left: -100px;height: 500px;">
                </div>
                <ul id="eventList">
                </ul>
            </div>
            <div id="pagination" class="pagination" style="margin-left: 100px;"></div>
        </div>
    </div>
    <div class="fx-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>评估情况</h5>
            </div>
            <div class="assessBox">
                <div class="item item1">
                    <i></i>
                    <p class="num" id="handling">0个</p>
                    <p class="name">未评估</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p class="num" id="handled">0个</p>
                    <p class="name">已评估</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>数据聚合（<span id="dataTogetherCount">0</span>）</h5>
                <a href="../event/dataTogether.jsp?Type=riskEvent" target="_blank">更多>></a>
            </div>
            <div class="dataBox">
                <div id="dataBoxLoading"></div>
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
                            <%-- <span class="span">录入日期：</span>--%>
                            <td width="20%" class="center">化解时间</td>
                            <td width="30%">
                                <input id="hjrq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div>
                            <%-- <span class="span">录入日期：</span>--%>
                            <td width="20%" class="center">存档时间</td>
                            <td width="30%">
                                <input id="cdrq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">
                            </td>
                        </div>
                    </tr>


                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveResolve()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="resUnit" style="display: none">
    <div class="pubBlock kuang" style="width: 800px;">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>责任单位</h5>
        </div>
        <div  style="height: 200px;">
            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="20%" class="center">主办单位</td>
                        <td width="30%">
                            <select id="zbdw" style="width:200px;height:28px;" class="vV-drop" >
                            </select>
                        </td>

                        <td width="20%" class="center">协办单位</td>
                        <td width="30%">
                            <select id="xbdw"  style="width:200px;height:28px;"  class="vV-drop">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">所属街道</td>
                        <td>
<%--                            <select id="" class="easyui-combobox" style="width:200px;height:28px;" data-options="editable:false">--%>
<%--                            </select>--%>
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="ssjd1" name="wwJdName" dictId="XH_XZQY"/>
                        </td>

                        <td width="20%" class="center">委托单位</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wtdwmc" style="width: 200px;">
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
                    &nbsp;&nbsp;共&nbsp;<span class="totalHandle">0</span>&nbsp;条数据
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
                        <td width="20%" class="center">委办局</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="handleCjdid" name="wwJdName" dictId="XH_WBJ"/>
                        </td>
                        <td width="20%" class="center">集访人数</td>
                        <td width="30%">
                            <input class="vV-ipt" result="number" value="" id="handleJfrs" style="width: 245px;">
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
                            <button class="alertBtn" onclick="saveEventHandle('0')" id="handleLogBut">保存</button>
                            <button class="alertBtn" onclick="saveEventHandle('1')" id="leaderBut">保存</button>
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
        <div class="titleCon" style="height: 500px;" id="titleCon">
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
                            <input id="occuredTime" class="vV-ipt date w-246 Time" result="text" value=""
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
                            <input class="vV-ipt" result="text" value="" id="occuredPlace" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">矛盾类别</td>
                        <td width="30%">
                                <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                        id="mdlx" name="wwJdName" dictId="WTQD_MDLB"/>

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
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="eventStatus" name="wwJdName" dictId="FXFK_SFPG"/>
                        </td>

                    </tr>
                    <tr>
                        <td class="center">标签联动</td>
                        <td colspan="3">
                            <div id="treeBox" style="z-index: 2000;">
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
                        <h5>风险评估</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">事项类别</td>
                        <td width="30%">

                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="sxlb" name="wwJdName" dictId="FXFK_SXLB"/>
                        </td>

                        <td width="20%" class="center">施工许可</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="sgxk" name="pgFj">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="sgxkFilepath"></p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">环评许可</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="hpxk" name="pgFj">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="hpxkFilepath"></p>
                            </div>
                        </td>
                        <td width="20%" class="center">政策依据</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="zcyj" name="pgFj">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="zcyjFilepath"></p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">总投资</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="ztz" style="width: 200px;">
                        </td>
                        <td class="center">下达级别：</td>
                        <td>
                            <ul class="vV-tabs" id="xdjb">
                                <li class="act" value="1">市级</li>
                                <li value="0">区级</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">处置状态</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="czzt" style="width: 200px;">
                        </td>
                        <td class="center">工作周期</td>
                        <td id="gzzq">
                            <label class="vV-radio ck" name="gzzq" style="padding: 0 4px 0 29px;">7天</label>
                            <label class="vV-radio" name="gzzq" style="padding: 0 4px 0 29px;">15天</label>
                            <label class="vV-radio" name="gzzq" style="padding: 0 4px 0 29px;">一个月</label>
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">涉及人数</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="sjrs" name="wwJdName" dictId="WTQD_SJRS"/>
                        </td>

                        <td width="20%" class="center">事项确立日期</td>
                        <td width="30%">
                            <input id="zdsxqlrq" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="请选择时间"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>

                    <tr>
                        <td class="center">所属街道</td>
                        <td>
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="ssjd" name="wwJdName" dictId="XH_XZQY"/>
                        </td>
                        <td class="center">居委名称</td>
                        <td>
                            <select id="Jw" name="city" class="vV-drop" style="width: 200px;">
                                <option selected value="">请选择街道</option>
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

<div class="tanBox" id="addfxpg" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>风险评估</h5>
        </div>
        <div class="titleCon" id="titleCon1" style="height: 500px;vertical-align: top;">
            <div class="baseTable" style="vertical-align: top;">
                <table border="0" class="lrTable mt-20" id="assessList" style="vertical-align: top;">
                </table>
                <div class="clearfix pageBox" style="vertical-align: top;">
                    <div class="v-fl" style="vertical-align: top;">
                        &nbsp;&nbsp;共&nbsp;<span class="assessTotal">0</span>&nbsp;条数据
                    </div>
                    <div id="paginationAssess" class=" v-fr pageStyle" style="vertical-align: top;"></div>
                </div>
                <table border="0" style="vertical-align: top;" id="pgTable">
                    <tr>
                        <td width="20%" class="center">评估类型</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="pglx" name="wwJdName" dictId="FXFK_FXPG"/>
                        </td>
                        <td width="20%" class="center">评估日期</td>
                        <td width="30%">
                            <input id="pgrq" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="请选择时间"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">矛盾大类</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="mddl" name="wwJdName" dictId="WTQD_MDLB"/>
                        </td>
                        <td width="20%" class="center">矛盾小类</td>
                        <td width="30%">
                            <select class="vV-drop" style="width:200px;height:28px;" id="mdxl"></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">评估报告</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="psbg"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">风险概述</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="fxgs"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">风险等级</td>
                        <td>
                            <apptag:dict result="select" clazz="vV-drop" style="width:200px;height:28px;"
                                         id="fxdj" name="wwJdName" dictId="FXFK_FXDJ"/>
                        </td>
                        <td class="center">附件：</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="pgpath" name="pgpath">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="handleFilepathPG"></p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">措施建议</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="csjy"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">报告编制单位</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="bgbzdw" style="width: 200px;">
                        </td>
                        <td width="20%" class="center">矛盾级别</td>
                        <td width="30%">
                            <ul class="vV-tabs" id="mdjb">
                                <li class="act" value="1">一级</li>
                                <li value="2">二级</li>
                                <li value="3">三级</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">创建人</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="cuser" style="width: 200px;">
                        </td>
                    </tr>
                    <tr >
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="addFxpg()">保存</button>
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

    var initpersontagflag=false;
    var initunittagflag=false;
    var initeventtagflag=false;

    // 高级搜索标示
    var searchonOff = true;
    function initSelect(){
        if(initpersontagflag&&initeventtagflag&&initunittagflag){

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
                search(1,"-1",true);
                // findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
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
                search(1,"-1",true);
                // findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                clickHandle();
            })

            // 标签删除
            $('.labelAll').on("click", ".labelClose", function () {
                var removeStr = $(this).parent().find("strong").text();
                removeByValue(labelArr, removeStr);
                $(this).parent().remove();
                search(1,"-1",true);
                // findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                $(".labelCloseBtn").trigger('click');
                clickHandle();
            })




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
        handleCount();
        findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
        initTags();
        initObjectTag();
        dataTogether();
        initDic();
        tagfind();
        $("#searchSSJD").change(function () {
            initJw($(this).val())
        })
        $("#ssjd").change(function () {
            initJw($(this).val())
        })

        // 关闭弹窗
        $(".close").click(function(){
            $(".maskBox").fadeOut(200);
        })

        $(".tabConSon2").perfectScrollbar();

        $(".js-cancel").click(function () {
            $(this).parents(".mmodal").hide();
        })

        $(".tabConSon2").perfectScrollbar();
        $(".js-cancel").click(function () {
            $(this).parents(".mmodal").hide();
        });

        $('#mddl').on('change', function () {
            initMdxl($("#mddl").val())
        });

        // 输入框控件调用
        vVsub();

        jeDate("#searchCreatTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: " 至 "
        });
        jeDate("#searchHJRQ", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: " 至 "
        });

        jeDate("#occuredTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#zdsxqlrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#pgrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#handleDate", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#hjrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#cdrq", {
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
        $("#titleCon").perfectScrollbar();
        $("#titleCon1").perfectScrollbar();

        // footerChange();

    });
    $(window).resize(function () {
        footerChange();
    })

    function footerChange() {
        // .index-main高度
        var indexMainH = $(".fx-left").outerHeight(true);
        $(".footerBox").css("top", indexMainH + 50);
    }





    function selectFile(thisdom) {
        thisdom.prev().trigger('click')
        thisdom.prev().on('change', function (event) {
            var fileName = event.target.files[0].name
            thisdom.next().text(fileName)
        })

    }

    function toEventDataTogether(eventId) {
        openNewWindow("../event/dataTogether.jsp?Type="+eventId+"");
    }
    //数据聚合汇总
    function dataTogether() {
        $("#dataBoxLoading").mLoading("show");
        var beginDate=new Date();
        var dataTimer=window.setTimeout(function () {
            $.ajax({
                result: "post",
                url: "/eventManager/dataTogetherWithPage",
                dataType: "json",
                data: {
                    eventId: "",
                    eventType: "riskEvent",
                    page:1,
                    pageSize:5
                },
                success: function (result) {
                    var list = result.dataTogether;
                    var count = result.count;
                    // var count = 0;
                    $("#dataTogetherCount").text(count);
                    $("#dataTogether").empty();
                    if(count==0){
                        var str='<li style="height: 250px" class="backG"></li>';
                        $("#dataTogether").append(str);
                    }
                    for (var i = 0; i <list.length; i++) {
                        var event = list[i];
                        var eventName=event.EVENT_NAME;
                        if(eventName==null||eventName.trim().length==0){
                            eventName="无";
                        }
                        var eventContent=event.EVENT_CONTENT;
                        if(eventContent==null||eventContent.trim().length==0){
                            eventContent="无";
                        }
                        var eventSource=event.EVENT_SOURCE;
                        if(eventSource==null||eventSource.trim().length==0){
                            eventSource="无";
                        }
                        var stCreateTime=new Date(event.ST_CREATE_TIME).format("yyyy-MM-dd hh:mm:ss")
                        if(event.stCreateTime==null){
                            stCreateTime="无";
                        }
                        $("#dataTogether").append('<dl>\n' +
                            '                              <dt>\n' +
                            '                              <span style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden; font-weight: bold">' + eventName + '</span>\n' +
                            '                              <i class="new"></i>\n' +
                            '                                </dt>\n' +
                            '                                <dd>\n' +
                            '                                <p class="con" style=" white-space:nowrap;\n' +
                            '            text-overflow:ellipsis;\n' +
                            '            overflow: hidden;">' + eventContent + '' +
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
            window.clearTimeout(dataTimer);
            $("#dataBoxLoading").mLoading("hide");
        },new Date()-beginDate+200);

    }

    //单个事件数据聚合信息
    function eventDataTogether(eventId) {
        $.ajax({
            result: "post",
            url: "/eventManager/dataTogetherWithPage",
            dataType: "json",
            async: false,
            data: {
                eventId: eventId,
                eventType: "",
                page:1,
                pageSize:1
            },
            success: function (result) {
                var list = result.event;
                var count = result.count;
                eventDateTogetherCount = count;
            }
        })
    }

    //事件标签
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
                    var tagCount = 10;
                    if (tags.length <= tagCount) {
                        tagCount = tags.length;
                    }
                    for (var i = 0; i < tagCount; i++) {
                        str += '<span style="background: ' + JSON.parse(tags[i].tagCssCode).color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag = str;
            }
        });
    }

    function reset() {
        $("#search").val("");
        $("#searchEventName").val("");
        $("#searchSXLB").val("");
        $("#searchMDLX").val("");
        $("#searchSFPG").val("");
        $("#searchSSJD").val("");
        $("#searchJw").val("");
        $("#searchCreatTime").val("");
        $("#searchHJRQ").val("");

        $(".labelAll span strong").each(function() {
            // var removeStr = $(this).text();
            // alert(removeStr)
            $(this).parent().remove();

        })
        search(1,'-1',true);
    }
    //事件列表
    function findContradiction(eventName, SXLB, MDLX, SFPG, SSJD, Jw, creatTime, HJRQ, page, pageSize, exportFlag, flag) {
        if (SFPG == "") {
            $("#handleResolve").children('.active').removeClass('active')
            $("#handleResolve").find("li:eq(0)").addClass("active");
            $("#searchSFPG").val("");
        }
        if (SFPG == "1") {
            $("#handleResolve").children('.active').removeClass('active')
            $("#handleResolve").find("li:eq(1)").addClass("active");
            $("#searchSFPG").val("1");
        }
        if (SFPG == "0") {
            $("#handleResolve").children('.active').removeClass('active')
            $("#handleResolve").find("li:eq(2)").addClass("active");
            $("#searchSFPG").val("0");
        }

        var tags = '';
        $(".labelAll span strong").each(function () {
            tags += "" + $(this).text() + "" + ','
        })
        if (tags) {
            tags = tags.substring(0, tags.length - 1);
        }
        $("#eventListLoading").mLoading("show");
        var beginDate=new Date();
        var eventTimer=window.setTimeout(function () {

            $.ajax({
                result: "post",
                // url: "/eventManager/findriskEvent",
                url: "/esSearch/searchKey",
                dataType: "json",
                data: {
                    objectType:"riskAssess",
                    searchKey: eventName,
                    sxlb:SXLB,
                    mdlx: MDLX,
                    sfpg: SFPG,
                    ssjd: SSJD,
                    jw: Jw,
                    WW_ST_CREATE_TIME: creatTime,
                    hjrq: HJRQ,
                    page: page,
                    pageSize: pageSize,
                    sortField:$("#sort").val(),
                    //现在导出有了单独的接口，不需要exportFlag了
                    // exportFlag: exportFlag,
                    tags: tags
                },
                success: function (result) {
                    if (result.message != "error") {
                        var rows = result.data.content;
                        $("#totalEvent").text("");
                        $("#totalEvent").text(result.data.totalElements);
                        $("#eventList").empty();

                        $("#eventListLoading").css("height","0px");
                        if (flag) {
                            // 分页
                            var pageTotal;
                            if (result.data.totalElements <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.data.totalElements / 5);
                            }
                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //必填,总页数
                                pageAmount: 5,  //每页多少条
                                dataTotal: result.data.totalElements, //总共多少条数据
                                curPage: 1, //初始页码,不填默认为1
                                pageSize: 5, //分页个数,不填默认为5
                                showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                                showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                                getPage: function (page) {
                                    var hjqk = $("#searchHandle").val();
                                    search(page, hjqk, false);
                                    //获取当前页数

                                }
                            });
                        }
                        if(rows.length==0){
                            var strs='<li class="backG topCot" style="height: 250px;">' +
                                '</li>';
                            $("#eventList").append(strs);
                        }
                        for (var i = 0; i < rows.length; i++) {

                            var hanled = "未评估";
                            var iconImg = '';
                            if (rows[i].sfpg == "1") {
                                iconImg = '<i class="icon" style="background:url(../images/icon-green.png) no-repeat ">'
                                hanled = "已评估";
                            } else {
                                iconImg = '<i class="icon">';
                            }

                            //background: url(../images/icon-green.png) no-repeat;
                            eventDataTogether(rows[i].id);
                            if (!eventDateTogetherCount) {
                                eventDateTogetherCount = 0;
                            }
                            getTags(rows[i].id);
                            if (!unittag) {
                                unittag = ''
                            }
                            var eventName= rows[i].eventName;
                            if(eventName==null||eventName.trim().length==0){
                                eventName="无";
                            }
                            var eventContent=rows[i].eventContent;
                            if(eventContent==null||eventContent.trim().length==0){
                                eventContent="无";
                            }

                            var creatTime = rows[i].stCreateTime;
                            var str = ' <li>\n' +
                                '                        <div class="pubBox waitPG">\n' +
                                iconImg +
                                '                                <span>' + hanled + '</span>\n' +
                                '                            </i>\n' +
                                '                            <p class="proName"  onclick="baseInfo(\'' + rows[i].id + '\',\'' + eventName + '\')" style="cursor: pointer" ">' + eventName + '</p>\n' +
                                '                            <p class="proInfo" style=" white-space:nowrap;\n' +
                                '            text-overflow:ellipsis;\n' +
                                '            overflow: hidden;">' + eventContent + '</p>\n' +
                                '                            <div class="infoBox">\n' +
                                '                                <div class="item" name="创建时间">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span>' + creatTime + '</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="item">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span onclick="toEventDataTogether(\'' + rows[i].id + '\')" style="cursor: pointer">数据聚合（' + eventDateTogetherCount + '）</span>\n' +
                                '                                </div>\n' +
                                // '                                <div class="item">\n' +
                                // '                                    <i></i>\n' +
                                // '                                    <a href="javascript:;">工作动态（3）</a>\n' +
                                // '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="labelBox" id="eventLabels">\n' + unittag +
                                '                            </div>\n' +
                                '                            <div class="btnGroup">\n' +
                                '<a onclick="fxpgShow(\'' + rows[i].id+ '\')" class="btnSty">风险评估</a>'+
                                '                                <div class="sortList sortList2 v-fr">\n' +
                                '                                    <a href="javascript:;" class="sort">操作</a>\n' +
                                '                                    <div class="sortDown sortDown2">\n' +
                                '                                        <p onclick="baseInfo(\'' + rows[i].id + '\')">详情</p>\n' +
                                '                                        <p onclick="showUpdate(\'' +rows[i].id + '\')"> 修改</p>\n' +
                                '                                        <p onclick="showDel(\'' + rows[i].id + '\')">删除</p>\n' +
                                '                                        <p onclick="resUnitShow(\'' + rows[i].id + '\')">责任单位</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + rows[i].id + '\',\'handlelog\')">处置日志</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + rows[i].id + '\',\'leader\')">领导批示</p>\n' +
                                '                                        <p onclick="showResolve(\'' + rows[i].id + '\')">化解存档</p>\n' +
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
                                $(this).next().fadeIn(200);
                            } else {
                                $(this).next().fadeOut(200);
                            }
                            dropSort = !dropSort;
                        })
                        $(".sortDown").mouseleave(function(){
                            $(this).fadeOut(200);
                        });
                        // footerChange();
                    }
                }
            });
            $("#eventListLoading").mLoading("hide");
            window.clearTimeout(eventTimer);
        }, new Date() - beginDate + 200);
    }

    function fxpgShow(eventId) {
        reShowAssess(eventId, 1, true);
        debugger;
        $("#pgTable").find("input").val("");
        $("#pgTable").find("textarea").val("");
        $("#pgTable").find("select").val("");
        $("#pgTable").find("p").text("");
        $("#toUpdateEventId").val(eventId);
        $("#addfxpg").show();

    }

    //详细信息
    function baseInfo(eventId, eventName) {
        // alert(eventId)
        // location.href=;
        openNewWindow("riskAssessDetail.jsp?eventId=" + eventId);
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

    function showDel(eventId){
        $("#toUpdateEventId").val(eventId);
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
                            eventType: "riskEvent",
                            eventId: eventId
                        },
                        success: function (result) {
                            if (result == "success") {
                                findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
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
        $.messager.alert("操作提示","操作成功!");
    }

    //搜索
    function search(page, sfpg, flag) {
        var eventName;
        var SXLB;
        var MDLX;
        var SFPG;
        var SSJD;
        var Jw;
        var creatTime;
        var HJRQ;
        SXLB = $("#searchSXLB").val();
        MDLX=$("#searchMDLX").val();
        SFPG = $("#searchSFPG").val();
        SSJD = $("#searchSSJD").val();
        Jw = $("#searchJw").val();
        creatTime = $("#searchCreatTime").val();
        HJRQ = $("#searchHJRQ").val();
        var advanceBoxClass = $(".advanceBox").attr("class");
        if (advanceBoxClass.indexOf("active") == -1) {//不是高级搜索
            eventName = $("#search").val();
            searchonOff=false;
        } else {//高级搜索
            eventName = $("#search").val();
        }
        if (sfpg != "") {
            if(sfpg=='-1'){
                SFPG = "";
                $("#searchHandle").val("")
            }else {
                SFPG = sfpg;
                $("#searchHandle").val(sfpg)
            }
        } else {
            $("#searchHandle").val("")
        }
        if(SXLB=="-1"){
            SXLB="";
        }
        if(MDLX=="-1"){
            MDLX="";
        }
        if(SFPG=="-1"){
            SFPG="";
        }
        if(SSJD=="-1"){
            SSJD="";
        }
        if(Jw=="-1"){
            Jw="";
        }
        advanceSearch();
        findContradiction(eventName, SXLB, MDLX, SFPG, SSJD, Jw, creatTime, HJRQ, page, 5, "0", flag);
    }
    // 高级搜索
    function advanceSearch(){
        if (searchonOff) {
            $("#advancedSearch").html("收起工具");
            $("#advancedSearch").addClass("active");
            $(".advanceBox").addClass("active");
            $(".advanceBox").animate({"height": "335px"}, 100);
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
        $("#add").show();
        $("#addEventTitle").show();
        $("#updateEventTitle").hide();
        $("#addEvent").show();
    }

    //导出事件
    function exportEventToExcel() {
        $('<form id="exportEvent" method="post" action="/eventManager/downloadAllRisk/"></form>').appendTo('body').submit().remove();
    }

    //已处理、未处理统计
    function handleCount() {
        $.ajax({
            result: "POST",
            url: "/eventManager/riskEventIsHandle",
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
            // async: false,//异步改为同步
            data: {
                tagLabelType: "person",
            },
            success: function (result) {
                if (result.message != "error") {
                    var persons = {"level": 1, "name": "人","id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                    var personClasses = [];
                    var tagList = result.list;
                    $("#personTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        $("#personTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
                        var classes = {"level": 2, "name": tag[0].tagClassesFirstName,"id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var persontag = {"level": 3, "name": tagName,"id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                            tags.push(persontag);

                        }
                        classes.children = tags;
                        personClasses.push(classes);
                    }
                    persons.children = personClasses;
                    tagsJson.push(persons);
                    initpersontagflag=true;
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
            // async: false,//异步改为同步
            data: {
                tagLabelType: "unit",
            },
            success: function (result) {
                if (result.message != "error") {
                    var units = {"level": 1, "name": "单位","id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                    var unitClasses = [];
                    var tagList = result.list;
                    $("#unitTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        $("#unitTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
                        var classes = {"level": 2, "name": tag[0].tagClassesFirstName,"id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var unittag = {"level": 3, "name": tagName,"id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                            tags.push(unittag);
                        }
                        classes.children = tags;
                        unitClasses.push(classes);
                    }
                    units.children = unitClasses;
                    tagsJson.push(units);
                    initunittagflag=true;
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
            // async: false,//异步改为同步
            data: {
                tagLabelType: "event",
            },
            success: function (result) {
                if (result.message != "error") {
                    var events = {"level": 1, "name": "事件","id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                    var eventClasses = [];
                    var tagList = result.list;
                    $("#eventTags").empty();
                    for (var i = 0; i < tagList.length; i++) {

                        var tag = tagList[i];//某一类的list
                        $("#eventTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
                        var classes = {"level": 2, "name": tag[0].tagClassesFirstName,"id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var eventtag = {"level": 3, "name": tagName,"id":getuuid(),"uid":getuuid(),"pid":getuuid()};
                            tags.push(eventtag);
                        }
                        classes.children = tags;
                        eventClasses.push(classes);
                    }
                    events.children = eventClasses;
                    tagsJson.push(events);
                    initeventtagflag=true;
                    initSelect();
                }
            }
        })
    }

    //责任单位显示
    function resUnitShow(eventId) {
        $("#toUpdateEventId").val("");
        $("#toUpdateEventId").val(eventId);
        $("#zbdw").find("option:eq(0)").attr("selected","selected");
        $("#xbdw").find("option:eq(0)").attr("selected","selected");
        $("#wtdwmc").find("option:eq(0)").attr("selected","selected");
        $("#resUnit").show();
    }

    //保存责任单位
    function saveResUnit() {
        var eventid = $("#toUpdateEventId").val();
        var data = {};
        data.eventType = "riskEvent";
        data.eventId = eventid;
        data.zbdw = $("#zbdw").val();
        data.zbdwmc = $("#zbdw option:selected").text();
        data.xbdw = $("#xbdw").val();
        data.xbdwmc = $("#xbdw option:selected").text();
        data.ssjd = $("#ssjd1").val();
        data.ssjdmc=$("#ssjd1 option:selected").text();
        data.wtdwmc = $("#wtdwmc").val();
        $.ajax({
            result: "POST",
            url: "/eventManager/alterEventBaseInfo",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.message=== "success") {
                    $("#resUnit").hide();
                    findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                    // $("#m2").show();
                    successOperator();
                }
            }
        });
    }

    //处置日志显示
    function showEventHandle(eventId,result) {
        $("#editEventHandLogFlag").val("0");
        var showType;

        if(result=="handlelog"){
            $("#handleLogTitle").show();
            $("#leaderTitle").hide();
            $("#handleLogBut").show();
            $("#leaderBut").hide();
            showType=0;
        }
        if(result=="leader"){
            $("#handleLogTitle").hide();
            $("#leaderTitle").show();
            $("#handleLogBut").hide();
            $("#leaderBut").show();
            showType=1;
        }
        reShowHandleLog(eventId,showType,1,true);
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
        var editFlag=$("#editEventHandLogFlag").val();
        if(editFlag=="1"){
            data.handleLogId=$("#toUpdateHandleLogId").val();
        }
        data.handleType=handleType;//代表处置日志,1为领导批示
        data.handleEventId = eventId;
        data.handleContent = $("#handleContent").val();
        data.handleDate = parserDate($("#handleDate").val());
        data.handleUser = $("#handleUser").val();
        data.handleCuser = $("#handleCuser").val();
        var handleCjdid=$("#handleCjdid option:selected").text();
        if(handleCjdid=="请选择"){
            handleCjdid="";
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
                if (result.message!= "error") {
                    $("#eventHandle").hide();
                    uploadHanlelogFj(result.handleLogId)
                    findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
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
            // success:function (result) {
            //     if(result=="success"){
            //         $("#addfxpg").hide();
            //         findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
            //         // $("#m2").show();
            //         successOperator();
            //     }
            // }
        });
    }

    //上传施工许可
    function uploadSgxk(eventId) {
        var fileEleId = "sgxk";
        var attrName = "pgFj"
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/eventManager/uploadSgxk",
            fileElementId: fileEleId,
            dataType: "text",
            data: {
                attrName: attrName,
                eventId: eventId,
                fileType:fileEleId
            },
        });
    }
    //上传环评许可
    function uploadHpxk(eventId) {
        var fileEleId="hpxk";
        var attrName="pgFj"
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/eventManager/uploadSgxk",
            fileElementId: fileEleId,
            dataType: "text",
            data: {
                attrName: attrName,
                eventId: eventId,
                fileType:fileEleId
            },
        });
    }
    //上传政策依据
    function uploadZcyj(eventId) {

        var fileEleId="zcyj";
        var attrName="pgFj";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/eventManager/uploadSgxk",
            fileElementId: fileEleId,
            dataType: "text",
            data: {
                attrName: attrName,
                eventId: eventId,
                fileType:fileEleId
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
        $("#hjrq").val("");
        $("#cdrq").val("");
        $("#resolve").show();
    }

    //保存化解存档
    function saveResolve() {
        var eventId = $("#toUpdateEventId").val();
        var hjrq = parserDate($("#hjrq").val())
        var cdrq=parserDate($("#cdrq").val())
        var data = {};
        data.eventId = eventId;
        data.hjrq = hjrq;
        data.cdrq = cdrq;
        data.wwSfhj = "1";
        data.eventType = "riskEvent";
        $.ajax({
            result: "POST",
            url: "/eventManager/alterEventBaseInfo",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.message == "success") {
                    $("#resolve").hide();
                    findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                    // $("#m2").show();
                    successOperator();
                }
            }
        });
    }
    function sortEvent(sortField) {
        $("#sort").val(sortField);
        search(1,"",true);
    }
    function getuuid() {
        var s = [];
        var hexDigits = "0123456789abcdef";
        for (var i = 0; i < 36; i++) {
            s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
        }
        s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
        s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
        s[8] = s[13] = s[18] = s[23] = "-";

        var uuid = s.join("");
        return uuid;
    }
    function addFxpg() {

        var data={};
        var editFlag=$("#editAssessFlag").val();
        //此时为编辑状态
        if(editFlag=="1"){
            data.tid=$("#toUpdateAssessId").val();
        }
        data.eventId=$("#toUpdateEventId").val();
        data.pglx=$("#pglx").val();
        var pglxmc=$("#pglx option:selected").text();
        if(pglxmc=="请选择"){
            pglxmc="";
        }
        data.pglxmc=pglxmc;
        data.pgrq=parserDate($("#pgrq").val());
        data.mddl=$("#mddl").val();
        var mddlmc=$("#mddl option:selected").text();
        if(mddlmc=="请选择"){
            mddlmc="";
        }
        data.mddlmc=mddlmc;
        data.mdxl=$("#mdxl").val();
        var mdxlmc=$("#mdxl option:selected").text();
        if(mdxlmc=="请选择"){
            mdxlmc="";
        }
        data.mdxlmc=mdxlmc;
        data.psbg=$("#psbg").val();
        data.fxgs=$("#fxgs").val();
        data.fxdj=$("#fxdj").val();
        var fxdjmc=$("#fxdj option:selected").text();
        if(fxdjmc=="请选择"){
            fxdjmc="";
        }
        data.fxdjmc=fxdjmc;
        data.csjy=$("#csjy").val();
        data.bgbzdw=$("#bgbzdw").val();
        data.mdjb=$("#mdjb").find(".act").val();
        data.cuser=$("#cuser").val();
        console.log(data);
        $.ajax({
            result: "POST",
            url: "/eventAssessmentController/addEventAssessment",
            dataType: "json",
            async: false,
            data: data,
            success: function (result) {
                if (result.message == "success") {
                    uploadFxpgFj(result.assessmentId)
                    // $("#addfxpg").hide();
                    // reShowAssess($("#toUpdateEventId").val(),1,true)
                    fxpgShow($("#toUpdateEventId").val());
                    findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                    // $("#m2").show();
                    successOperator();
                }
            }
        })

    }

    function uploadFxpgFj(assessmentId) {
        var fileEleId="pgpath";
        var attrName="pgpath";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result:"POST",
            url:"/eventAssessmentController/uploadAssessmentFj",
            fileElementId:fileEleId,
            dataType:"text",
            data:{
                attrName:attrName,
                tid:assessmentId
            },
        });
    }

    function initjflx() {
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionaries",
            dataType:'json',
            data:{
                dictId:"WTQD_JFLX"
            },
            success:function (result) {
                $("#handleJflx").empty();

                for (var i = 0; i < result.length; i++) {
                    $("#handleJflx").append('<li value="'+result[i].code+'">'+result[i].name+'</li>')
                }
                $("#handleJflx").find("li:eq(0)").addClass("act");

                $(".vV-tabs").children().click(function(){
                    $(this).addClass("act")
                        .siblings().removeClass("act");
                });
            }
        })
    }
    function initmdjb() {
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionaries",
            dataType:'json',
            data:{
                dictId:"WTQD_MDJB"
            },
            success:function (result) {
                $("#mdjb").empty();
                var data=[];
                data.push({"text":"无","value":"-1"});
                for (var i = 0; i < result.length; i++) {
                    data.push({"text":result[i].name,"value":result[i].dictPK.id});
                    $("#mdjb").append('<li value="'+result[i].code+'">'+result[i].name+'</li>')
                }
                $("#mdjb").find("li:eq(0)").addClass("act");
                //初始化选择
                $(".vV-tabs").children().click(function(){
                    $(this).addClass("act")
                        .siblings().removeClass("act");
                });
            }
        })
    }
    function initResponsibility() {
        var data=[];
        var params='XH_XZQY,XH_WBJ';
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionariesWithManyParams",
            dataType:'json',
            data:{
                dictIds:params
            },
            success:function (result) {
                $("#zbdw").append('<option value="-1"></option>');
                $("#xbdw").append('<option value="-1"></option>');
                for (var i = 0; i < result.length; i++) {
                    $("#zbdw").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
                    $("#xbdw").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
                }
            }
        })
    }
    function initDic() {
        initmdjb();
        initjflx();
        initResponsibility();
    }

    function initMdxl(mddlCode) {
        $.ajax({
            result:"POST",
            url:"/TagBaseInfoManager/getDictionaries",
            dataType:'json',
            async:false,
            data:{
                dictId:mddlCode
            },
            success:function (result) {
                $("#mdxl").empty();
                var data=[];
                $("#mdxl").append('<option value="">请选择</option>');
                for (var i = 0; i < result.length; i++) {
                    $("#mdxl").append('<option value="'+result[i].code+'">'+result[i].name+'</option>');
                }

            }
        });
    }

    function reShowHandleLog(eventId,result,page,pageFlag) {
        $("#toUpdateEventId").val(eventId);
        $("#toUpdatehandleLogType").val(result);
        $.ajax({
            result:"POST",
            url:"/eventHandleLogController/listEventHandleLogWithPage",
            dataType:"json",
            data:{
                eventId:eventId,
                result:result,
                page:page,
                pageSize:3
            },
            success:function (result) {
                var total=result.total;
                $(".totalHandle").text(total)
                var rows=result.rows;


                var pageTotal;
                if (total<= 3) {
                    pageTotal = 1;
                } else {
                    pageTotal = Math.ceil(total / 3);
                }

                if(pageFlag){
                    new Page({
                        id: 'paginationHandle',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 3,  //每页多少条
                        dataTotal: total, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 3, //分页个数,不填默认为5
                        getPage: function (page) {
                            reShowHandleLog(eventId,result,page,false);
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
                for (var i = 0; i < rows.length ;i++) {
                    var handleCtime=new Date(rows[i].handleCtime).format("yyyy-MM-dd");
                    if(rows[i].handleCtime==null){
                        handleCtime="无"
                    }
                    var handleJflx=rows[i].handleJflx;
                    if(handleJflx=="1"){
                        handleJflx="人员聚集"
                    }else if(handleJflx=="2"){
                        handleJflx="日常处置"
                    }else if(handleJflx=="3"){
                        handleJflx="召开会议"
                    }else{
                        handleJflx="无"
                    }
                    var handleJfrs=rows[i].handleJfrs;
                    if(handleJfrs==null||handleJfrs.trim().length==0){
                        handleJfrs="0"
                    }
                    var handleContent=rows[i].handleContent;
                    if(handleContent==null||handleContent.trim().length==0){
                        handleContent="无"
                    }
                    var handleFilepath=rows[i].handleFilepath;
                    if(handleFilepath==null||handleFilepath.trim().length==0){
                        handleFilepath="无"
                    }else {
                        handleFilepath=getCaption(handleFilepath);
                    }
                    var handleCjdid=rows[i].handleCjdid;
                    if(handleCjdid==null||handleCjdid.trim().length==0){
                        handleCjdid="无"
                    }
                    $("#handleList").append(' <tr>\n' +
                        '                    <td>'+handleCtime+'</td>\n' +
                        '                    <td>'+handleJflx+'</td>\n' +
                        '                    <td>'+handleJfrs+'</td>\n' +
                        '                    <td >'+handleContent+'</td>\n' +
                        '                    <td>'+handleFilepath+'</td>\n' +
                        '                    <td>'+handleCjdid+'</td>\n' +
                        '                    <td>\n' +
                        '                        <a onclick="editHandleLog(\''+rows[i].handleLogId+'\')" style="color: #409dff">编辑</a>\n' +
                        '                        <a onclick="delHandleLog(\''+rows[i].handleLogId+'\')" style="color: #409dff">删除</a>\n' +
                        '                    </td>\n' +
                        '                </tr>')
                }
            }
        });
    }
    function reShowAssess(eventId,page,pageFlag) {
        $("#toUpdateEventId").val(eventId);
        // $("#toUpdatehandleLogType").val(result);
        $.ajax({
            result:"POST",
            url:"/eventAssessmentController/listAssessWithPage",
            dataType:"json",
            data:{
                eventId:eventId,
                page:page,
                pageSize:3
            },
            success:function (result) {
                var total=result.total;
                $(".assessTotal").text(total)
                var rows=result.rows;
                var pageTotal;
                if (total<= 3) {
                    pageTotal = 1;
                } else {
                    pageTotal = Math.ceil(total / 3);
                }
                if(pageFlag){
                    new Page({
                        id: 'paginationAssess',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 3,  //每页多少条
                        dataTotal: total, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 3, //分页个数,不填默认为5
                        getPage: function (page) {
                            reShowAssess(eventId,page,false);
                        }
                    });
                }
                $("#assessList").empty();
                $("#assessList").append('<tr>\n' +
                    '                    <th width="10%">评估日期</th>\n' +
                    '                    <th width="10%">评估类型</th>\n' +
                    '                    <th width="10%">风险等级</th>\n' +
                    '                    <th width="20%">评估报告</th>\n' +
                    '                    <th width="10%">附件</th>\n' +
                    '                    <th width="20%">创建人</th>\n' +
                    '                    <th width="10%">操作</th>\n' +
                    '                </tr>')
                for (var i = 0; i < rows.length ;i++) {
                    var pgrq=new Date(rows[i].pgrq).format("yyyy-MM-dd");
                    if(rows[i].pgrq==null){
                        pgrq="无"
                    }
                    var pglxmc=rows[i].pglxmc;
                    if(pglxmc==null||pglxmc.trim().length==0){
                        pglxmc="无"
                    }
                    var fxdjmc=rows[i].fxdjmc;
                    if(fxdjmc==null||fxdjmc.trim().length==0){
                        fxdjmc="无"
                    }
                    var psbg=rows[i].psbg;
                    if(psbg==null||psbg.trim().length==0){
                        psbg="无"
                    }
                    var pgpath=rows[i].pgpath;
                    if(pgpath==null||pgpath.trim().length==0){
                        pgpath="无"
                    }else {
                        pgpath=getCaption(pgpath)
                    }
                    var cuser=rows[i].cuser;
                    if(cuser==null||cuser.trim().length==0){
                        cuser="无"
                    }
                    $("#assessList").append(' <tr>\n' +
                        '                    <td>'+pgrq+'</td>\n' +
                        '                    <td>'+pglxmc+'</td>\n' +
                        '                    <td>'+fxdjmc+'</td>\n' +
                        '                    <td >'+psbg+'</td>\n' +
                        '                    <td>'+pgpath+'</td>\n' +
                        '                    <td>'+cuser+'</td>\n' +
                        '                    <td>\n' +
                        '                        <a onclick="editAssess(\''+rows[i].tid+'\')" style="color: #409dff">编辑</a>\n' +
                        '                        <a onclick="delAssess(\''+rows[i].tid+'\')" style="color: #409dff">删除</a>\n' +
                        '                    </td>\n' +
                        '                </tr>')
                }
            }
        });
    }

    function editAssess(assessId) {
        $("#editAssessFlag").val("1");
        $("#toUpdateAssessId").val(assessId);
        $.ajax({
            result:"POST",
            url:"/eventAssessmentController/findAssessById",
            dataType:"json",
            data: {
                tid: assessId,
            },
            success:function (result) {
                var pglx=result.pglx;
                if(pglx==null||pglx.trim().length==0||pglx=="null"){
                    pglx="";
                }
                $("#pglx").val(pglx);
                var pgrq=result.pgrq;
                if(result.pgrq==null){
                    pgrq="";
                }else {
                    pgrq=new Date(result.pgrq).format("yyyy-MM-dd hh:ss:mm");
                }
                $("#pgrq").val(pgrq);
                var mddl=result.mddl;
                if(mddl==null||mddl.trim().length==0||mddl=="null"){
                    mddl="";
                }
                initMdxl(mddl)
                $("#mddl").val(mddl);
                var mdxl=result.mdxl;
                if(mdxl==null||mdxl.trim().length==0||mdxl=="null"){
                    mdxl="";
                }
                $("#mdxl").val(mdxl);
                var psbg=result.psbg;
                if(psbg==null||psbg.trim().length==0||psbg=="null"){
                    psbg="无";
                }
                $("#psbg").val(psbg);
                var fxgs=result.fxgs;
                if(fxgs==null||fxgs.trim().length==0||fxgs=="null"){
                    fxgs="无";
                }
                $("#fxgs").val(fxgs);
                var fxdj=result.fxdj;
                if(fxdj==null||fxdj.trim().length==0||fxdj=="null"){
                    fxdj="";
                }
                $("#fxdj").val(fxdj);
                var pgpath=result.pgpath;
                if(pgpath==null||pgpath.trim().length==0||pgpath=="null"){
                    pgpath="无";
                }else{
                    pgpath=getCaption(result.pgpath)
                }
                $("#handleFilepathPG").text(pgpath);
                var csjy=result.csjy;
                if(csjy==null||csjy.trim().length==0||csjy=="null"){
                    csjy="无";
                }
                $("#csjy").val(csjy);
                var bgbzdw=result.bgbzdw;
                if(bgbzdw==null||bgbzdw.trim().length==0||bgbzdw=="null"){
                    bgbzdw="无";
                }
                $("#bgbzdw").val(bgbzdw);
                $("#mdjb").find("li").removeClass("act");
                if(result.mdjb=="1"){
                    $("#mdjb").find("li:eq(0)").addClass("act");
                }
                if(result.mdjb=="2"){
                    $("#mdjb").find("li:eq(1)").addClass("act");
                }
                if(result.mdjb=="3"){
                    $("#mdjb").find("li:eq(2)").addClass("act");
                }
                var cuser=result.cuser;
                if(cuser==null||cuser.trim().length==0||cuser=="null"){
                    cuser="无";
                }
                $("#cuser").val(cuser);
            }
        })
    }
    function editHandleLog(handleLogId) {
        $("#editEventHandLogFlag").val("1");
        $("#toUpdateHandleLogId").val(handleLogId)
        $.ajax({
            result:"POST",
            url:"/eventHandleLogController/findEventHandleLogById",
            dataType:"json",
            data: {
                handleLogId: handleLogId,
            },
            success:function (result) {
                $("#handleContent").val(result.handleContent);
                $("#handleDate").val(new Date(result.handleDate).format("yyyy-MM-dd hh:ss:mm"));
                // $("#handleFilepath").text(getCaption(result.handleFilepath));
                $("#handleUser").val(result.handleUser);
                $("#handleCuser").val(result.handleCuser);
                var handleCjdid=result.handleCjdid;
                debugger
                if(handleCjdid==null||handleCjdid.trim().length==0||handleCjdid==""){
                    $("#handleCjdid").val("")
                }else {
                    // $("#handleCjdid option:contains("+handleCjdid+")").attr("selected","selected");
                    $("#handleCjdid").val($("#handleCjdid").find("option:contains('"+handleCjdid+"')").val())
                }
                $("#handleJfrs").val(result.handleJfrs);
                var handleJflx=result.handleJflx;
                $("#handleJflx").find("li").removeClass("act");
                if(handleJflx=="1"){
                    $("#handleJflx").find("li:eq(0)").addClass("act");
                }
                if(handleJflx=="2"){
                    $("#handleJflx").find("li:eq(1)").addClass("act");
                }
                if(handleJflx=="3"){
                    $("#handleJflx").find("li:eq(2)").addClass("act");
                }
                $("#handleIsflag").find("label").removeClass("ck");
                if(result.handleIsflag=="1"){
                    $("#handleIsflag").find("label:eq(0)").addClass("ck");
                }
                if(result.handleIsflag=="0"){
                    $("#handleIsflag").find("label:eq(1)").addClass("ck");
                }
            }
        })
    }
    function delAssess(assessId) {
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    $.ajax({
                        result:"POST",
                        url:"eventAssessmentController/delAssessment",
                        dataType:"text",
                        data:{
                            tId:assessId,
                        },
                        success:function (result) {
                            if(result=="success"){
                                var toUploadEventId=$("#toUpdateEventId").val();
                                reShowAssess(toUploadEventId,1,true);
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
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
                        result:"POST",
                        url:"/eventHandleLogController/delEventHandleLog",
                        dataType:"text",
                        data:{
                            handleLogId:handleLogId,
                        },
                        success:function (result) {
                            if(result=="success"){
                                var toUploadEventId=$("#toUpdateEventId").val();
                                var eventHandleLogType=$("#toUpdatehandleLogType").val();
                                debugger
                                reShowHandleLog(toUploadEventId,eventHandleLogType,1,true);
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
    }

    function initJw(jdCode) {
        $.ajax({
            result:"POST",
            url: "/xqinfoController/findJwByJdCode",
            dataType: "json",
            async: false,
            data: {
                jdCode: jdCode
            },
            success: function (result) {

                $("#searchJw").empty();
                $("#Jw").empty();
                if (jdCode == "") {
                    $("#searchJw").append('<option value="">请选择街道</option>')
                    $("#Jw").append('<option value="">请选择街道</option>')
                } else {
                    $("#searchJw").append('<option value="">请选择</option>')
                    $("#Jw").append('<option value="">请选择</option>')
                }
                for (var i = 0; i < result.length; i++) {
                    $("#searchJw").append('<option value="' + result[i].jwCode + '">' + result[i].jw + '</option>')
                    $("#Jw").append('<option value="' + result[i].jwCode + '">' + result[i].jw + '</option>')
                }
            }
        })
    }

    //截取字符串
    function getCaption(obj) {
        return obj.split("@@@@")[1]
    }

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
                eventType: "riskEvent",
                eventId: eventId
            },
            success: function (result) {
                if (result.message == "success") {
                    var eventBase = result.eventById;
                    var riskEvent = result.riskEventById;
                    $("#addeventName").val(eventBase.eventName);
                    $("#occuredTime").val(new Date(eventBase.occuredTime).format("yyyy-MM-dd hh:mm:ss"));
                    $("#eventContent").val(eventBase.eventContent);
                    $("#occuredPlace").val(eventBase.occuredPlace);
                    // $("#mdlx").combobox('select',riskEvent.mdlx);
                    $("#mdlx").find("option[value='"+riskEvent.mdlx+"']").attr("selected","selected");
                    $("#eventLongti").val(eventBase.eventLongti);
                    $("#eventLati").val(eventBase.eventLongti);
                    $("#eventStatus").find("option[value='"+eventBase.sfpg+"']").attr("selected", "selected");
                    // $("#stUpdateTime").val(new Date(eventBase.stUpdateTime).format("yyyy-MM-dd hh:mm:ss"));
                    $("#sxlb").find("option[value='"+ riskEvent.sxlb+"']").attr("selected","selected");

                    var sgxk=riskEvent.sgxk;
                    if(sgxk==null||sgxk.trim().length==0||sgxk==""||sgxk=="null"){
                        sgxk="无";
                    }else {
                        sgxk=getCaption(sgxk)
                    }
                    $("#sgxkFilepath").text(sgxk)
                    var hpxk=riskEvent.hpxk;
                    if(hpxk==null||hpxk.trim().length==0||hpxk==""||hpxk=="null"){
                        hpxk="无";
                    }else {
                        hpxk=getCaption(hpxk)
                    }
                    $("#hpxkFilepath").text(hpxk)
                    var zcyj=riskEvent.zcyj;
                    if(zcyj==null||zcyj.trim().length==0||zcyj==""||zcyj=="null"){
                        zcyj="无";
                    }else {
                        zcyj=getCaption(zcyj)
                    }
                    $("#zcyjFilepath").text(zcyj)
                    $("#ztz").val(riskEvent.ztz);
                    $("#xdjb").find("li").removeClass("act");
                    if(riskEvent.xdjb=="1"){
                        $("#xdjb").find("li:eq(0)").addClass("act");
                    }
                    if(riskEvent.xdjb=="0"){
                        $("#xdjb").find("li:eq(1)").addClass("act");
                    }
                    $("#czzt").val(riskEvent.czzt);

                    var gzzq=riskEvent.gzzq;
                    $("#gzzq").find("label").removeClass("ck ");
                    if(gzzq=="7"){
                        $("#gzzq").find("label:eq(0)").addClass("vV-radio ck")
                    }if(gzzq=="15"){
                        $("#gzzq").find("label:eq(1)").addClass("vV-radio ck")
                    }if(gzzq=="30"){
                        $("#gzzq").find("label:eq(2)").addClass("vV-radio ck")
                    }
                    $("#sjrs").find("option:contains("+riskEvent.sjrs+")").attr("selected", "selected");
                    // $("#ssjd").combobox('select',riskEvent.ssjd);
                    $("#zdsxqlrq").val(new Date(riskEvent.zdsxqlrq).format("yyyy-MM-ss hh:mm:ss"));
                    $("#ssjd").find("option[value='"+riskEvent.ssjd+"']").attr("selected", "selected");
                    console.log(riskEvent.jw)
                    initJw(riskEvent.ssjd)
                    $("#Jw").find("option[value='"+riskEvent.jw+"']").attr("selected", "selected");
                    $("#addEvent").show();
                }
            }
        });
    }

    function save(flag) {
        var data = {};
        data.eventType = "riskEvent";
        data.eventName = $("#addeventName").val();
        data.occuredTime = parserDate($("#occuredTime").val());
        data.eventContent = $("#eventContent").val();
        data.occuredPlace = $("#occuredPlace").val();
        data.mdlx = $("#mdlx").val();
        let mdlxmc= $("#mdlx option:selected").text();
        if(mdlxmc==="请选择"){
            mdlxmc="";
        }
        data.mdlxmc=mdlxmc;
        data.eventLongti = $("#eventLongti").val();
        data.eventLati = $("#eventLati").val();
        data.sfpg = $("#eventStatus").val();
        // data.stUpdateTime = parserDate($("#stUpdateTime").val());
        data.sxlb=$("#sxlb").val();
        var sxlbmc=$("#sxlb option:selected").text();
        if(sxlbmc==="请选择"){
            sxlbmc="";
        }
        data.sxlbmc = sxlbmc;
        // data.sgxk = $("#sgxk").val();
        // data.hpxk = $("#hpxk").val();
        // data.zcyj = $("#zcyj").val();
        data.ztz = $("#ztz").val();
        data.xdjb=$("#xdjb").find(".act").val();
        data.czzt = $("#czzt").val();
        var gzzq;
        if($("#gzzq").find("label:eq(0)").hasClass("vV-radio ck")==true){
            gzzq="7";
        }
        if($("#gzzq").find("label:eq(1)").hasClass("vV-radio ck")==true){
            gzzq="15";
        }
        if($("#gzzq").find("label:eq(2)").hasClass("vV-radio ck")==true){
            gzzq="30";
        }
        data.gzzq = gzzq;
        var sjrs = $("#sjrs option:selected").text();
        if(sjrs=="请选择"){
            sjrs="";
        }
        data.sjrs=sjrs;
        var ssjdmc = $("#ssjd option:selected").text();
        if(ssjdmc=="请选择"){
            ssjdmc="";
        }


        data.zdsxqlrq = parserDate($("#zdsxqlrq").val());
        data.ssjdmc=ssjdmc;
        data.ssjd = $("#ssjd").val();
        var jwmc = $("#Jw option:selected").text();
        if("请选择"==jwmc){
            jwmc="";
        }
        data.jwmc=jwmc;
        data.Jw = $("#Jw").val();
        data.tagNames = $("#tagNames").val();
        if (flag == "add") {
            $.ajax({
                result: "POST",
                url: "/eventManager/addEventBaseInfo",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.message == "success") {
                        uploadSgxk(result.eventId);
                        uploadHpxk(result.eventId);
                        uploadZcyj(result.eventId);
                        $("#addEvent").hide();
                        findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                        // $("#m2").show();
                        successOperator();
                        handleCount();
                        dataTogether();
                    }
                }
            });
        }
        if (flag == "update") {
            data.eventId = $("#toUpdateEventId").val();
            $.ajax({
                result: "POST",
                url: "/eventManager/alterEventBaseInfo",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.message == "success") {
                        uploadSgxk($("#toUpdateEventId").val())
                        uploadHpxk($("#toUpdateEventId").val())
                        uploadZcyj($("#toUpdateEventId").val())
                        $("#addEvent").hide();
                        findContradiction("", "", "", "", "", "", "", "", 1, 5, "0", true);
                        // $("#m2").show();
                        successOperator();
                    }
                }
            });
        }

    }
</script>
</html>