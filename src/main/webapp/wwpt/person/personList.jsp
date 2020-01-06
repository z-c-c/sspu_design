<%--<%@ page import="com.wonders.security.model.BaseUserInfo" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="apptag" uri="app_tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/w_include_header.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>涉稳重点人员</name>

    <link rel="stylesheet" href="../css/icon.css"><!--easyui-->
    <script src="../../js/ajaxfileupload.js" result="text/javascript"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style result="text/css">
        .maskBox {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            height: 100%;
            background: rgba(0, 0, 0, .3);
        }

        .lrTable {
            width: 100%;
            height: auto;
        }

        .lrTable tr {
            height: 36px;
            line-height: 36px;
        }

        .lrTable tr th {
            font-size: 14px;
            height: 40px;
            line-height: 40px;
            background: #fafafa;
            color: #656565;
            font-weight: 700;
            border-bottom: 1px solid #f9f9f9;
        }

        .lrTable tr td {
            text-align: center;
            color: #999;
            border-bottom: 1px solid #ededed;
        }

        .insertBtn {
            color: #409dff;
        }

        .insertBtn::before {
            content: "";
            display: inline-block;
            width: 12px;
            height: 15px;
            /* background: url("../images/icon-add2.png") no-repeat;*/
            position: relative;
            top: 3px;
            margin-right: 4px;
        }

        .pageBox {
            width: 100%;
            height: 26px;
            line-height: 26px;
            padding: 0 40px;
            box-sizing: border-box;
            color: #7a7a7a;
            margin: 30px auto;
        }

        .pageStyle a {
            width: 60px;
            height: 26px;
            line-height: 26px;
            display: inline-block;
            border: 1px solid #ededed;
            color: #999;
            text-align: center;
            border-radius: 4px;
            vertical-align: top;
        }

        .pageStyle ul {
            display: inline-block;
        }

        .pageStyle ul li {
            width: 26px;
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

        .pageStyle ul li.active {
            background: #409dff;
            border: 1px solid #409dff;
            color: #fff;
        }

        .tanTable2 .center {
            text-align: right;
        }

        .tanTable2 .alertBtn {
            padding: 0 20px;
            line-height: 32px;
        }

        .ml-80 {
            margin-left: 80px;
        }

        .gray {
            color: rgba(0, 0, 0, .45);
        }

        .blueText {
            color: #2c9beb;
            display: inline-block;
            padding: 0 4px;
            box-sizing: border-box;
            border: 1px solid #2c9beb;
            border-radius: 4px;
            font-size: 12px;
        }

        /* 女 */
        .proName1::after {
            content: "";
            display: inline-block;
            width: 20px;
            height: 20px;
            background: url(../images/women.png) no-repeat;
            background-size: 20px;
            position: relative;
            top: 3px;
            margin-left: 3px;
        }

        /* 男 */
        .proName2::after {
            content: "";
            display: inline-block;
            width: 20px;
            height: 20px;
            background: url(../images/men.png) no-repeat;
            background-size: 20px;
            position: relative;
            top: 3px;
            margin-left: 3px;
        }

        .upload-btnn {
            display: none;
        }

        /*美化自定义按钮*/
        .file-input-triggerr {
            width: 70px;
            height: 30px;
            display: inline-block;
            line-height: 30px;
            text-align: center;
            border-radius: 4px;
            background-color: #409dff;
            outline: none;
            color: #fff;
            cursor: pointer;
        }

        .file-namee {
            font-size: 12px;
            color: #999;
            display: inline-block;
        }

        img {
            border: none;
            width: 80px;
            position: relative;
            top: -8px;
        }

        .tabCon > div.tabConSon2 {
            height: 180px;
            position: relative;
            overflow: hidden;
        }

        .main td {
            height: 30px;
        }

        .searchCon {
            width: 100%;
            height: auto;
            padding: 20px;
            box-sizing: border-box;
        }

        .pagination {
            user-select: none;
            float: right;
        }

        .pubBlock {
            width: 900px;
            background: #fff;
            box-shadow: 0px 5px 20px 0px rgba(78, 129, 206, 0.15);
            border-radius: 8px;
            padding: 20px 26px;
            box-sizing: border-box;
            position: relative;
        }

        .select {
            width: 200px;
            color: rgba(0, 0, 0, 0.85);
        }

        .searchCon ul li .proInfo, .peoSty .proInfo {
            width: 20%;
        }

        .fuzzyBox1 {
            width: 200px;
            height: 30px;
            display: none;
            /* display: inline-block; */
            position: relative;
            top: -2px;
            transition: .3s linear;
        }

        .fuzzyBox1 input {
            color: rgba(0, 0, 0, 0.65);
        }

        /*定义滚动条样式（高宽及背景）*/
        ::-webkit-scrollbar {
            width: 6px; /* 滚动条宽度， width：对应竖滚动条的宽度  height：对应横滚动条的高度*/
        }

        /*定义滑块 样式*/
        ::-webkit-scrollbar-thumb {
            background-color: #ccc;
            position: absolute;
            right: 3px;
            width: 4px;
            border-radius: 4px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            opacity: 0;
            filter: alpha(opacity=0);
            -webkit-transition: opacity .2s linear;
            -moz-transition: opacity .2s linear;
            transition: opacity .2s linear;
        }


        .fuzzyData1 {
            background-color: #ffffff;
            box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.12);
            border-radius: 4px;
            border: solid 1px #d2d5db;
            position: absolute;
            min-height: 20px;
            max-height: 200px;
            min-width: 195px;
            z-index: 20;

            display: none;
        }

        .fuzzyData1 > div {
            width: 100%;
            height: auto;
            padding: 10px 0;
            box-sizing: border-box;
        }

        .fuzzyData1 span {
            display: block;
            width: 100%;
            height: 26px;
            line-height: 26px;
            font-size: 14px;
            color: rgba(0, 0, 0, 0.65);
            cursor: pointer;
            padding: 0 20px;
            box-sizing: border-box;
        }

        .searchCon .peoImg {
            width: 116px;
            height: 134px;
            display: inline-block;
            overflow: hidden;
            border-radius: 4px;
            border: solid 1px rgba(0, 0, 0, 0.15);
            box-sizing: border-box;
            background: #fff;
        }

        input[result=file] {
            display: none;
        }

        .pubBox waitPG {
            display: inline-block;
            min-width: 84%;
            vertical-align: top;
            margin-left: 30px;
            font-size: 14px;
            line-height: 30px;
            color: rgba(0, 0, 0, 0.85);
        }
    </style>

</head>
<body>
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
                        <button class="btn1" onclick=" usesearch();">搜索</button>
                        <button class="btn2" onclick="chongzhi()">重置</button>
                        <a href="javascript:;" class="advancedSearch">高级搜索</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
                            <input id="gaojipersonName" name="personName" class="vV-ipt w-246" result="text" value="">

                            <span>证&nbsp;&nbsp;件&nbsp;&nbsp;号：</span>
                            <input name="personDocuNum" class="vV-ipt w-246" result="text" value="">
                        </div>
                        <div>
                            <span class="span">创建日期：</span>
                            <input id="createDate" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间"
                                   readonly="readonly">
                        </div>
                        <div>
                            <span>所属街道：</span>
                            <select id="province1" onchange="childchange1()" name="province1" class="vV-drop w-246">
                                <option value="none">--请选择街道--</option>
                            </select>

                            <span>居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委：</span>
                            <select id="city1" name="city1" class="vV-drop w-246">
                                <option value="none">--请选择居委会--</option>
                            </select>
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
                <span>为您找到相关结果共<strong id="searchNum">0</strong>项</span>
                <div class="btnGroup">
                    <a onclick="addnew()" id="add" class="active" style="float: right;">新增</a>
                </div>
            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" id="ifhuajie">
                    <li class="active" onclick="search(1,'-1',true)">全部</li>
                    <li onclick="search(1,'1',true)">已化解</li>
                    <li onclick="search(1,'0',true)">未化解</li>
                </ul>
                <div class="sortList v-fr">
                    <a href="javascript:;" class="sort sortMethod">排序方式</a>
                    <div class="sortDown sortText">
                        <p onclick="sortPerson('')">按默认方式排序</p>
                        <p onclick="sortPerson('personNameFilter')">按姓名排序</p>

                    </div>

                </div>


            </div>
            <div class="searchCon" id="searchCon">

            </div>

            <div id="pagination" class="pagination"></div>
            <div id="eventpage" hidden="hidden" class="pagination"></div>
        </div>
    </div>

    <div class="fx-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>化解情况</h5>
            </div>
            <div class="assessBox">
                <div class="item item1">
                    <i></i>
                    <p class="num" id="notAccess">0</p>
                    <p class="name">未化解</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p class="num" id="alreadyAccess">0</p>
                    <p class="name">已化解</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>数据聚合<%--（<span id="eventdataNum">0</span>）--%></h5>
                <a target="_blank" onclick="findMore()">更多&gt;&gt;</a>
            </div>
            <div class="dataBox">
                <div class="dataList marquee1">
                    <div class="view" id="dataList">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="addnew" style="display: none">
    <div class="pubBlock kuang">
        <i class="close" onclick="javascript:$('#addnew').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>人员信息</h5>
        </div>
        <div class="titleCon" id="insertnew">
            <div class="baseTable">
                <table border="0">

                    <tr id="alwayshide">
                        <td width="20%" class="center">人员：</td>
                        <td colspan="3">
                            <input class="vV-ipt" result="text" id="findpersonId" value="">

                        </td>
                    </tr>

                    <tr>
                        <td class="center">人员照片：</td>
                        <td colspan="3">
                            <div class="uploadBox">
                                <div class="uploadSty">
                                    <img src="../images/imgIcon.png" onclick="browerfile.click()" id="QRCode"/>
                                    <input result="file" id="browerfile" name="browerfile" style="display:none"
                                           class="fileBtn">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">姓名：</td>
                        <td width="30%" id="addshowname">
                            <input class="vV-ipt" result="text" id="addPersonName" oninput="choosePerson()" value=""
                                   placeholder="请输入人员关键字" autocomplete="off">
                            <div class=" fuzzyData1" id="showdata" style="overflow: hidden;display:block;">
                                <div id="choosePerson">
                                    <span class="spanItem1">键入姓名以查询</span>
                                </div>

                            </div>
                        </td>
                        <td width="30%" id="editshowname">
                            <input class="vV-ipt" result="text" id="editPersonName" value="" placeholder="请输入人员关键字"
                                   autocomplete="off">
                        </td>

                        <td width="20%" class="center">性别：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width: 200px;" id="gender" name="gender"
                                         dictId="ZDRY_GENDER"
                                         textName="mdjb" defText="all"/>
                        </td>

                    </tr>

                    <tr>
                        <td width="20%" class="center">曾用名：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" id="addPersonUsedName" value="">
                        </td>
                        <td width="20%" class="center">证件号：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" id="addPeronDocuNum" value="">
                        </td>


                    </tr>
                    <tr>
                        <td width="20%" class="center">国籍：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" id="addNationality" value="">
                        </td>

                        <td width="20%" class="center">籍贯：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" id="addNativePlace" value="">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">手机号：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" id="addPhoneNum" value="">
                        </td>

                        <td width="20%" class="center">数据来源：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" id="addDataSource" value="">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">所属街道：</td>
                        <td>
                            <select id="province" onchange="childchange()" name="province" class="select">
                                <option value="none">--请选择街道--</option>
                            </select>
                        </td>
                        <td class="center">居委名称：</td>
                        <td>
                            <select id="city" name="city" class="select ">
                                <option value="none">--请选择居委会--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">标签联动：</td>
                        <td colspan="3">
                            <div id="treeBox">
                                <!--id必须是treeBox  -->
                                <input class="focusEl" result="text" id="addLabel" placeholder="请选择">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                                <input class="jobType" result="hidden" name="jobType[]" value="">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">地址：</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" id="addLivePlace"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">录入原因：</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" id="addPutReason"></textarea>
                        </td>
                    </tr>
                    <%--
                                        <tr>
                                            <td width="20%" class="center">入库时间：</td>
                                            <td width="30%">
                                                &lt;%&ndash;  <span class="span">入库时间：</span>&ndash;%&gt;
                                                <input id="putDate" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">

                                            </td>
                                        </tr>--%>

                    <tr>
                        <td width="20%" class="center">操作人：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" value="" id="addPutUserId">
                        </td>

                        <td width="20%" class="center">责任诉求：</td>
                        <td width="30%">

                            <input class="vV-ipt " style="width: 300px;" result="text" value="" id="zrsq">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">稳控责任单位：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" value="" id="wkunit">
                        </td>

                        <td width="20%" class="center">化解责任单位：</td>
                        <td width="30%">
                            <input class="vV-ipt w-200" result="text" value="" id="hjunit">
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">矛盾类型：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width: 200px;" id="conflictType"
                                         name="conflictType" dictId="WTQD_MDLB"
                                         textName="mdlx" defText="all"/>
                        </td>

                        <td width="20%" class="center">矛盾级别：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop" style="width: 200px;" id="conflictRank"
                                         name="conflictRank" dictId="WTQD_MDJB"
                                         textName="mdjb" defText="all"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveInfluentPerson()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>


<div class="tanBox" id="xinfang" style="display: none">
    <div class="pubBlock kuang" style="width: 700px;height: 450px;">
        <i class="close" onclick="javascript:$('#xinfang').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>上访记录录入</h5>
        </div>
        <div class="titleCon" id="shangfang">
            <div class="baseTable">
                <table border="0">
                    <tr hidden="hidden">
                        <td width="20%" class="center">人员：</td>
                        <td width="30%">
                            <input class="vV-ipt  w-200" result="text" value="" id="pid">
                        </td>

                    </tr>
                    <tr>
                        <td width="20%" class="center">信访类型：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:245px;height:28px;"
                                         id="sftype" name="sftype" dictId="ZDRY_SFLX"/>
                        </td>
                    <tr>
                        <div>

                            <td width="20%" class="center">上访日期：</td>
                            <td width="30%">
                                <input id="rq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间"
                                       readonly="readonly">
                            </td>
                        </div>
                    </tr>

                    </tr>

                    <tr>
                        <td width="20%" class="center">录入人员：</td>
                        <td width="30%">
                            <input class="vV-ipt w-246" result="text" value="" id="lrry">
                        </td>

                    </tr>
                    <tr>
                        <td width="20%" class="center">简要情况：</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" id="jyqk"></textarea>
                        </td>

                    </tr>
                    <tr>
                        <td class="center">上传文件：</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btnn" id="sfPath" name="sfPath">
                                <span result="text" class="file-input-triggerr" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-namee" id="filepath"></p>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="addxf()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="huajie" style="display: none">
    <div class="pubBlock kuang" style="width: 700px;height: 250px;">
        <i class="close" onclick="javascript:$('#huajie').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>化解存档</h5>
        </div>
        <div class="titleCon" id="hjcd">
            <div class="baseTable">
                <table border="0">
                    <tr hidden="hidden">
                        <td width="20%" class="center">人员：</td>
                        <td width="30%">
                            <input class="vV-ipt  w-200" result="text" value="" id="hjdxid">
                        </td>

                    </tr>
                    <tr>
                        <div>

                            <td width="20%" class="center">化解日期：</td>
                            <td width="30%">
                                <input id="hjrq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间"
                                       readonly="readonly">
                            </td>
                        </div>


                    </tr>

                    <tr>
                        <div>

                            <td width="20%" class="center">存档日期：</td>
                            <td width="30%">
                                <input id="cdrq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间"
                                       readonly="readonly">
                            </td>
                        </div>


                    </tr>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="addhj()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="maskBox" id="operate" style="display: none;z-index: 1000;">
    <div class="pubBlock kuang" style="width: 800px;height: auto;">
        <i class="close" onclick="javascript:$('#operate').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>录入处置日志</h5>
        </div>
        <div class="lr-Box">
            <table border="0" class="lrTable mt-20" style="margin-bottom: -75px;" id="personHandlelog">

            </table>
            <div class="clearfix pageBox">
                <div class="v-fl" style="position: relative;margin-top: 60px;">共<span id="counteventnum">0</span>条数据
                </div>
                <div id="handlelogpage" class="pagination" class="v-fr pageStyle" style="margin-right: -550px;"></div>
            </div>


            <div class="baseTable">
                <table border="0" width="100%" class="tanTable2">
                    <tr hidden="hidden">
                        <td width="20%" class="center">人员：</td>
                        <td width="30%">
                            <input class="vV-ipt  w-200" result="text" value="" id="keyPersonId">
                        </td>

                    </tr>
                    <tr hidden="hidden">
                        <td width="20%" class="center">事件id：</td>
                        <td width="30%">
                            <input class="vV-ipt  w-200" result="text" value="" id="handlelogeventId">
                        </td>

                    </tr>
                    <tr>
                        <td width="20%" class="center">日志类型：</td>
                        <td width="30%">
                            <apptag:dict result="select" clazz="vV-drop w-246" style="width:245px;height:28px;"
                                         id="handleType" name="handleType" dictId="ZDRY_CZRZ"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">处置日期：</td>
                        <td width="30%">
                            <input id="handleDate" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间"
                                   readonly="readonly">
                        </td>
                        <td width="20%" class="center">录入人员：</td>
                        <td width="30%">
                            <input class="vV-ipt w-246" result="text" value="" id="writerId">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">简要情况：</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" id="briefInfo"></textarea>
                        </td>

                    </tr>
                    <tr>
                        <td class="center">上传文件：</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="czPath" name="czPath">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="fileName"></p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="addHandle()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<script result="text/javascript">
    //进入页面显示默认内容
    var tagsJson = [];
    var nowpage = 1;
    $(function () {

        findAlreadyAccessNum();
        findNotAccessNum();
        findPerson("", "", "", "", "", "", "", "", "", 1, 5, "0", true);
        AllKeyEventList();
        initPersonTags();
        event.stopPropagation();
        findStreetInfo1();
        findStreetInfo();
        $("#alwayshide").hide();
        tagfind();
    });
    $(function () {
        var pageI = 0
        $(".pageStyle ul li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
            pageI = $(this).index();
        })
        $(".prevPage").click(function () {
            pageI--;
            if (pageI <= 0) {
                pageI = 0;
            }
            $(".pageStyle ul li").eq(pageI).addClass("active").siblings().removeClass("active");
        })
        $(".nextPage").click(function () {
            pageI++;
            if (pageI >= $(".pageStyle ul li").length) {
                pageI = $(".pageStyle ul li").length - 1;
            }
            $(".pageStyle ul li").eq(pageI).addClass("active").siblings().removeClass("active");
        })

        vVsub();

        // 关闭弹窗
        $(".close").click(function () {
            $(".maskBox").fadeOut(200);
        })
    })

    function selectFile(thisdom) {
        thisdom.prev().trigger('click')
        thisdom.prev().on('change', function (event) {
            var fileName = event.target.files[0].name
            thisdom.next().text(fileName)
        })
    }

    var province = null;
    var cities;

    function findStreetInfo() {
        $.ajax({
            url: '/personaffair/findStreetInfo',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {
                //获得省级下拉框对象
                province = document.getElementById("province");
                //遍历省市数据,并把里面省的数据追加到option选项中
                for (var i in data) {
                    var option = document.createElement("option");
                    option.value = data[i]["jd"].jd_code;
                    option.innerHTML = data[i]["jd"].jd;
                    province.appendChild(option);
                }
            }
        })
    }

    function childchange() {
        //获取当前点击对象的值
        var proid = null;
        proid = $('#province option:selected').val();
        var cities = new Array();
        $.ajax({
            url: '/personaffair/findStreetInfo',
            async: false,
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {

                //遍历省市数据,把省级下点击的那一个选项的值和省市数据中的
                //省级数据对比,如果相等,取出当前的市的数
                var num = 0;
                for (var p in data) {

                    if (proid == data[p]["jd"].jd_code) {
                        for (var m in data[p]["list"]) {
                            neigh = "{" + data[p]["list"][m].jw + "," + data[p]["list"][m].jw_code + "}";
                            cities[num] = neigh;
                            num = num + 1;
                        }
                        //获得市级下拉框对象
                        var city = document.getElementById("city");

                        //每次点击省级后,市级初始化,避免高级重复追加
                        city.innerHTML = "<option value='none'>--请选择居委会--</option>";

                        for (var i = 0; i < cities.length; i++) {
                            var option = document.createElement("option");
                            var splitinfo = cities[i].split(",");
                            option.innerHTML = splitinfo[0].substring(1);
                            option.value = splitinfo[1].substring(0, (splitinfo[1].length - 1));
                            city.appendChild(option);
                        }

                    }
                }
                $("#city option").each(function () {
                })
            }
        })
    }


    // 高级搜索的标签联动
    var province1 = null;
    var cities;

    function findStreetInfo1() {
        $.ajax({
            url: '/personaffair/findStreetInfo',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {
                //获得省级下拉框对象
                province1 = document.getElementById("province1");
                //遍历省市数据,并把里面省的数据追加到option选项中
                for (var i in data) {
                    var option = document.createElement("option");
                    option.value = data[i]["jd"].jd_code;
                    option.innerHTML = data[i]["jd"].jd;
                    province1.appendChild(option);
                }
            }
        })
    }

    function childchange1() {
        //获取当前点击对象的值

        var proid1 = null;
        proid1 = $('#province1 option:selected').val();
        var cities = new Array();
        $.ajax({
            url: '/personaffair/findStreetInfo',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {

                //遍历省市数据,把省级下点击的那一个选项的值和省市数据中的
                //省级数据对比,如果相等,取出当前的市的数
                var num = 0;
                for (var p in data) {
                    if (proid1 == data[p]["jd"].jd_code) {
                        for (var m in data[p]["list"]) {
                            neigh = "{" + data[p]["list"][m].jw + "," + data[p]["list"][m].jw_code + "}";
                            cities[num] = neigh;
                            num = num + 1;
                        }
                    }
                }
                //获得市级下拉框对象
                var city1 = document.getElementById("city1");
                //每次点击省级后,市级初始化,避免高级重复追加
                city1.innerHTML = "<option value='none'>--请选择居委会--</option>";
                //遍历市级数据,并取出市级数据,追加到市级对象中
                for (var i = 0; i < cities.length; i++) {
                    var option = document.createElement("option");
                    var splitinfo = cities[i].split(",");
                    option.innerHTML = splitinfo[0].substring(1);
                    option.value = splitinfo[1].substring(0, splitinfo[1].length);
                    city1.appendChild(option);
                }
                $("#city option").each(function () {
                })
            }

        })
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
                    $("#personTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
                        $("#personTags").append('' +
                            '<div class="tabConItem" > ' +
                            '<strong class="">' + tag[0].tagClassesFirstName + '</strong>' +
                            '<div class="everyTab" id="' + tag[0].tagClassesFirst + '"> ' +
                            '</div>' +
                            '</div>');
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


    function initSelect() {
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


    //重置
    function chongzhi() {
        $("#search").val("");
        $("input[name='personName']").val("");
        /*     $("#personType").val("");*/

        $("input[name='personDocuNum']").val("");
        $("#city1").val("none");

        $("#province1").val("none");

        $("#createDate").val("");
        $(".labelAll span strong").each(function () {
            var removeStr = $(this).text();
            $(this).parent().remove();

        })
        $(".labelDown").fadeOut();
        findPerson("", "", "", "", "", "", "", "", "", 1, 5, "0", true);
    }

    function formatterdate(val, row) {
        if (val == null)
            return '';
        var format = 'yyyy-MM-dd hh:mm:ss';
        var d = new Date(val.time);
        return d.format(format);
    }

    function addHandle() {
        var keyPersonId = $("#keyPersonId").val();
        var handleLogId = $("#handlelogeventId").val();
        var handleType = $("#handleType").val();
        var handleDate = $("#handleDate").val();
        if (handleDate == '') {
            handleDate = null;
        }
        var writerId = $("#writerId").val();
        var briefInfo = $("#briefInfo").val();

        $.ajax({
            url: '/personaffair/addHandle',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": keyPersonId,
                "handleLogId": handleLogId,
                "handleLogType": handleType,
                "handleDate": handleDate,
                "handleUser": writerId,
                "handleContent": briefInfo,
                "handleFilePath": null
            },
            success: function (result) {
                if (result.message != "error") {
                    uploadHanlelogFj(result.handleLogId, keyPersonId);
                    $.messager.alert('操作提示', "操作成功");

                    $("#handlelogeventId").val("");

                    $("#handleType").val("");

                    $("#handleDate").val("");

                    $("#writerId").val("");
                    $("#briefInfo").val("");
                    $("#fileName").text("");
                    $("#fileName").val("");
                    $("#czPath").val("");

                    findHandlelogById(keyPersonId, 1, true);
                } else {
                    $.messager.alert('操作提示', "操作失败");

                    $("#handlelogeventId").val("");

                    $("#handleType").val("");

                    $("#handleDate").val("");

                    $("#writerId").val("");
                    $("#briefInfo").val("");
                    $("#fileName").text("");
                    $("#fileName").val("");
                    $("#czPath").val("");
                    findHandlelogById(keyPersonId, 1, true);
                }
            }
        })
    }

    function addxf() {
        var pid = $("#pid").val();

        var rq = $("#rq").val();
        if (rq == '') {
            rq = null;
        }
        var lrry = $("#lrry").val();
        var jyqk = $("#jyqk").val();

        var sftype = $("#sftype").val();
        var filepath = "";
        $.ajax({
            url: '/personaffair/addxf',
            result: 'POST',
            dataType: "json",
            data: {

                "pid": pid,
                "rq": rq,
                "lrry": lrry,
                "jyqk": jyqk,
                "filepath": filepath,
                "sftype": sftype
            },
            success: function (result) {
                // console.log(result);
                if (result.message != "error") {
                    // console.log(result);
                    $.messager.alert('操作提示', "操作成功");
                    uploadsfFj(result.xfId);
                    $("#xinfang").fadeOut();

                } else {
                    $.messager.alert('操作提示', "操作失败");
                    $("#xinfang").fadeOut();
                }
            }
        })
    }

    function addhj() {
        var sfhj;
        if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
            sfhj = "-1";
        }
        if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
            sfhj = "1";
        }
        if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
            sfhj = "0";
        }
        var hjdxid = $("#hjdxid").val();
        var hjrq = $("#hjrq").val();
        if (hjrq == '') {
            hjrq = null;
        }
        var cdrq = $("#cdrq").val();
        if (cdrq == '') {
            cdrq = null;
        }

        $.ajax({
            url: '/personaffair/addhj',
            result: 'POST',
            dataType: "json",
            data: {
                "hjdxid": hjdxid,
                "hjrq": hjrq,
                "cdrq": cdrq,
            },
            success: function (data) {
                if (data == true) {
                    $.messager.alert('操作提示', "操作成功");
                    $("#huajie").fadeOut();
                    findPerson("", "", "", "", "", "", "", "", "", nowpage, 5, "0", true);
                } else {
                    $.messager.alert('操作提示', "操作失败");
                    $("#huajie").fadeOut();
                    findPerson(sfhj, "", "", "", "", "", "", "", "", nowpage, 5, "0", true);
                }
            }
        })
    }


    function choosePerson() {
        var content;
        content = $("#addPersonName").val();
        $("#showdata").perfectScrollbar();
        $("#showdata").perfectScrollbar('update');
        if (content != "" && content != null) {
            var content1 = encodeURI(encodeURI(content));
            $.ajax({
                url: '/personaffair/chooseperson',    //后台controller中的请求路径
                result: 'GET',
                async: false,
                datatype: 'json',
                data: {
                    "content": content1,

                },
                success: function (data) {
                    var str2 = "";
                    var docuNum;
                    var phoneNum;
                    if (data.length != 0) {
                        for (var i = 0, len = data.length; i < len; i++) {
                            if (data[i].person_docu_num != null && data[i].person_docu_num != "" && data[i].person_docu_num != "null") {
                                docuNum = data[i].person_docu_num;
                            } else {
                                docuNum = "无身份证号";
                            }
                            if (data[i].phone_num != null && data[i].phone_num != "" && data[i].phone_num != "null") {
                                phoneNum = data[i].phone_num;
                            } else {
                                phoneNum = "无手机号";
                            }
                            str2 += "<span class=\"spanItem1\" onclick=\"addInsert('" + data[i].person_id + "')\">" + data[i].person_name + "  " + docuNum + "  " + phoneNum + "</span>";
                        }
                    } else {
                        $("#showdata").perfectScrollbar('destroy');
                        str2 += "<span class=\"spanItem1\">未找到相关人员</span>";

                    }
                    $("#choosePerson").html(str2);    //根据ID填充到select标签中
                }
            });
        } else {
            var str2 = "";
            $("#showdata").perfectScrollbar('destroy');
            str2 += "<span class=\"spanItem1\">键入姓名以查询</span>";
            $("#choosePerson").html(str2);    //根据ID填充到select标签中


        }
    }

    function wuOperator() {
        $.messager.alert("操作提示", "无附件!");
    }

    //下载
    function downLoadFj(pgPath) {
        if (pgPath == "") {
            wuOperator();
        } else {
            $('<form id="exportEvent" method="post" action="/eventManager/downloadFj?fileName=' + pgPath + '"></form>').appendTo('body').submit().remove();
        }
    }

    //增加时，选择选项可以进行回显
    function addInsert(id) {
        $("#addPersonName").val("");
        $("#editPersonName").val("");
        $('#addPersonUsedName').val("");
        $('#gender').val("");
        //移出disabled属性
        $('#addPeronDocuNum').removeAttr("readOnly");
        $('#addPeronDocuNum').val("");
        $('#addNationality').val("");
        $('#addPhoneNum').val("");
        $('#addNativePlace').val("");
        $('#addDataSource').val("");
        $('#addLivePlace').val("");
        $("#province option").removeAttr("selected"); //移除属性selected
        $("#city option").removeAttr("selected");
        $('#addPutReason').val("");
        $('#addPutUserId').val("");
        // $('#putDate').val("");
        $('#wkunit').val("");
        $('#hjunit').val("");
        $('#zrsq').val("");
        $("#conflictType").val("");
        $("#conflictRank").val("");

        $.ajax({
            url: '/personaffair/personBaseInfo',
            result: 'POST',
            dataType: "json",
            data: {
                "personId": id
            },
            success: function (data) {

                $("#findpersonId").val(id);
                $("#addPersonName").val(data[0].personName);
                $('#addPersonUsedName').val(data[0].personUsedName);
                $('#gender').val(data[0].gender);
                $('#addPeronDocuNum').val(data[0].personDocuNum);
                $('#addPeronDocuNum').attr("readOnly", "false");
                $('#addNationality').val(data[0].nationality);
                $('#addPhoneNum').val(data[0].phoneNum);
                $('#addNativePlace').val(data[0].nativePlace);
                $('#addDataSource').val(data[0].dataSource);
                $("#province").find("option:contains('" + data[0].liveStreet + "')").prop("selected", true);
                if (data[0].personImage != null && data[0].personImage != "" && data[0].personImage != "null") {

                    $("#QRCode").attr("src", "/uploads/" + data[0].personImage);
                } else {
                    $("#QRCode").attr("src", "../images/imgIcon.png");


                }
                var str = $("#province  option:selected").text();
                if (str == "--请选择街道--") {
                    $("#city").find("option:contains('--请选择居委会--')").prop("selected", true);
                } else {
                    childchange();//根据街道输出所有居委选项
                    $("#city").find("option:contains('" + data[0].neighborhood + "')").prop("selected", true);
                }
                $('#addLivePlace').val(data[0].livePlace);


            }

        })
        $("#city option").each(function () {
        })
    }

    //删除
    function delPerson(id) {
        var paId = id;
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    var personId = paId;
                    // console.log("pa"+paId);
                    $.ajax({
                        url: '/personaffair/deletePerson',
                        result: 'post',
                        async: false,
                        dataType: "json",
                        data: {"paId": personId},
                        success: function (result) {
                            $.messager.alert("操作提示", "操作成功!");
                            findPerson("", "", "", "", "", "", "", "", "", 1, 5, "0", true);
                            findAlreadyAccessNum();
                            findNotAccessNum();
                            //window.location.reload();
                        },
                        error: function (error) {
                            $.messager.alert("操作提示", "操作失败!");
                            // window.location.reload();
                            findPerson("", "", "", "", "", "", "", "", "", 1, 5, "0", true);
                        }
                    })

                }
            }
        })
    }

    //修改
    function updatePerson(id) {
        window.parent.$("#toUpdateEvent").val(id);
        // console.log("11"+(window.parent.$("#toUpdateEvent").val(id)));
        $(".add", window.parent.document).fadeIn(500);
        $(".add .pop-box", window.parent.document).stop(true, true).animate({top: 20, opacity: "1"}, 500);
        $(".add .pop-box iframe", window.parent.document).remove();
        $(".add .pop-box", window.parent.document).append("<iframe src='updateInfluentPerson.jsp' id='update-iframe' name='update-frame' frameborder='0' width='100%' height='600'></iframe>");
    }

    function findNotAccessNum(id) {
        $.ajax({
            url: '/personaffair/findNotAccess',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {
                $("#notAccess").html(data.length);
            }
        })
    }

    function findAlreadyAccessNum(id) {
        $.ajax({
            url: '/personaffair/findAlreadyAccess',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {
                $("#alreadyAccess").html(data.length);
            }
        })
    }


    function findNotAccess(id) {
        $.ajax({
            url: '/personaffair/findNotAccess',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {

            }
        })
    }

    function findAlreadyAccess(id) {
        $.ajax({
            url: '/personaffair/findAlreadyAccess',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {

            }
        })
    }


    //个人主页
    function personIndex(id) {
        var url = 'personDetail.jsp?paId=' + id + '';
        openNewWindow(url);
    }

    function saveInfluentPerson() {
        var sfhj = "-1";
        if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
            sfhj = "1";
        }
        if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
            sfhj = "0";
        }
        var personId = $("#findpersonId").val();
        var personName = $("#addPersonName").val();
        if (personName == "") {
            personName = $("#editPersonName").val();
        }
        var personUsedName = $('#addPersonUsedName').val();
        var gender = $("#gender option:selected").val();
        var personDocuNum = $('#addPeronDocuNum').val();
        var nationality = $('#addNationality').val();
        var phoneNum = $('#addPhoneNum').val();
        var nativePlace = $('#addNativePlace').val();
        var dataSource = $('#addDataSource').val();
        var liveStreet = $("#province").find("option:selected").text();
        if (liveStreet == "--请选择街道--") {
            liveStreet = "无";
        }
        var neighborhood = $('#city').find("option:selected").text();
        if (neighborhood == "--请选择居委会--") {
            neighborhood = "无";
        }
        var livePlace = $("#addLivePlace").val();
        var putReason = $('#addPutReason').val();
        var putUserId = $('#addPutUserId').val();
        // var putDate= $('#putDate').val();
        var label = $('#addLabel').val();
        if (label == "") {
            label = "null";
        }
        var personImage = null;
        var wkunit = $('#wkunit').val();
        var hjunit = $('#hjunit').val();
        var zrsq = $('#zrsq').val();
        var conflictType = $("#conflictType").val();
        var conflictRank = $("#conflictRank").val();
        var pid;
        if (personId != "") {
            $.ajax({
                url: '/personaffair/addInfluentPersonHaveId',
                result: 'POST',
                dataType: "json",
                data: {
                    "personId": personId,
                    "personName": personName,
                    "personUsedName": personUsedName,
                    "gender": gender,
                    "personDocuNum": personDocuNum,
                    "nationality": nationality,
                    "phoneNum": phoneNum,
                    "nativePlace": nativePlace,
                    "dataSource": dataSource,
                    "liveStreet": liveStreet,
                    "neighborhood": neighborhood,
                    "livePlace": livePlace,
                    "putReason": putReason,
                    "putUserId": putUserId,
                    /* "putDate": putDate,*/
                    "label": label,
                    "wkunit": wkunit,
                    "hjunit": hjunit,
                    "zrsq": zrsq,
                    "conflictType": conflictType,
                    "conflictRank": conflictRank,
                    "personImage": personImage
                },
                success: function (data) {
                    if (data == true) {
                        uploadImg(personId, sfhj);
                        $.messager.alert("操作提示", "操作成功!", "info", function () {
                            $("#addnew").fadeOut();
                            //window.location.reload();

                        });


                    } else {
                        $.messager.alert("操作提示", "操作失败!", "info", function () {
                            $("#addnew").fadeOut();
                            //window.location.reload();
                            findPerson("", "", "", "", "", "", "", "", "", nowpage, 5, "0", true);
                        });
                    }
                }
            })
        } else if (personId == "") {
            $.ajax({
                url: '/personaffair/addInfluentPerson',
                result: 'POST',
                dataType: "json",
                data: {
                    "personName": personName,
                    "personUsedName": personUsedName,
                    "gender": gender,
                    "personDocuNum": personDocuNum,
                    "nationality": nationality,
                    "phoneNum": phoneNum,
                    "nativePlace": nativePlace,
                    "dataSource": dataSource,
                    "liveStreet": liveStreet,
                    "neighborhood": neighborhood,
                    "livePlace": livePlace,
                    "putReason": putReason,
                    "putUserId": putUserId,
                    /* "putDate": putDate,*/
                    "label": label,
                    "wkunit": wkunit,
                    "hjunit": hjunit,
                    "zrsq": zrsq,
                    "conflictType": conflictType,
                    "conflictRank": conflictRank,
                    "personImage": personImage
                },
                success: function (result) {
                    if (result.message != "error") {
                        nowpage = 1;
                        $.messager.alert("操作提示", "操作成功!", "info", function () {

                            uploadImg(result.personId, sfhj);

                            $("#addnew").fadeOut();
                            // window.location.reload();
                        });
                    } else {
                        $.messager.alert("操作提示", "操作失败!", "info", function () {
                            $("#addnew").fadeOut();
                            findPerson("", "", "", "", "", "", "", "", "", 1, 5, "0", true);
                            //     window.location.reload();
                        });
                    }
                }
            })
        }

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

    var searchonOff = true;

    function closegaoji() {
        searchonOff = false;
        if (searchonOff) {
            $(".advancedSearch").html("收起工具");
            $(".advancedSearch").addClass("active");
            $(".advanceBox").addClass("active");
            $(".advanceBox").animate({"height": "235px"}, 100);
        } else {
            $(".advancedSearch").html("高级搜索");
            $(".advancedSearch").removeClass("active");
            $(".advanceBox").removeClass("active");
            $(".advanceBox").animate({"height": "70px"}, 100);
        }
        searchonOff = !searchonOff;


    }

    function search(page, sfhj, flag) {
        nowpage = page;
        var objectName;
        var personDocuNum;
        var liveStreet;
        var neighborhood;
        var createDate;
        var num;
        var label;
        var searchKey = $("#search").val();
        var advanceBoxClass = $(".advanceBox").attr("class");
        if (searchKey == "") {
            searchKey = null;
        }

        if (advanceBoxClass.indexOf("active") == -1) {//不是高级搜索
            objectName = $("#gaojipersonName").val();
            personDocuNum = "";
            liveStreet = "";
            neighborhood = "";
            createDate = "";

            num = $("#labelAll").find("span").find("strong").length;
            label = "";
            for (var a = 0; a < num; a++) {
                var strong = $("#labelAll").find("span").find("strong")[a];
                var text = strong.textContent;
                if (a != num - 1) {
                    label += text + ",";
                } else
                    label += text;
            }

        } else {//高级搜索
            objectName = $("#gaojipersonName").val();
            personDocuNum = $("input[name='personDocuNum']").val();

            liveStreet1 = $("#province1 option:selected").val();
            if (liveStreet1 == "none") {
                liveStreet = "";
            } else {
                liveStreet = $("#province1 option:selected").text();
            }

            neighborhood1 = $("#city1 option:selected").val();
            if (neighborhood1 == "none") {
                neighborhood = "";
            } else {
                neighborhood = $("#city1 option:selected").text();
            }

            createDate = $("#createDate").val();

            num = $("#labelAll").find("span").find("strong").length;
            label = "";
            for (var a = 0; a < num; a++) {
                var strong = $("#labelAll").find("span").find("strong")[a];
                var text = strong.textContent;
                if (a != num - 1) {
                    label += text + ",";
                } else
                    label += text;

            }
        }
        findPerson(sfhj, searchKey, objectName, personDocuNum, liveStreet, neighborhood, createDate, num, label, page, 5, "0", flag);
    }

    function findPerson(sfhj, searchKey, objectName, personDocuNum, liveStreet, neighborhood, createDate, num, label, page, pageSize, exportFlag, flag) {

        if (sfhj == "" || sfhj == "-1") {
            sfhj = "";
            $("#ifhuajie").children('.active').removeClass('active')
            $("#ifhuajie").find("li:eq(0)").addClass("active");

        }
        if (sfhj == "1") {
            $("#ifhuajie").children('.active').removeClass('active')
            $("#ifhuajie").find("li:eq(1)").addClass("active");

        }
        if (sfhj == "0") {
            $("#ifhuajie").children('.active').removeClass('active')
            $("#ifhuajie").find("li:eq(2)").addClass("active");


        }

        $("#searchCon").mLoading("show");
        $("#searchCon").empty;
        var pid;

        var tags = '';
        $(".labelAll span strong").each(function () {
            tags += $(this).text() + ','
        })
        if (tags) {
            tags = tags.substring(0, tags.length - 1);
        }
        var beginDate = new Date();
        var timer1 = window.setTimeout(function () {
            $.ajax({
                url: "/esSearch/searchKey",
                result: 'POST',
                dataType: "json",
                data: {

                    objectType: 'person',
                    "sfhj": sfhj,
                    "page": page,
                    "pageSize": pageSize,
                    "searchKey": searchKey,
                    "personName": objectName,
                    "personType": "swzdry",
                    "personDocuNum": personDocuNum,
                    "liveStreet": liveStreet,
                    "neighborhood": neighborhood,
                    "putDate": createDate,
                    "tags": tags,
                    "sortField": $("#sort").val(),
                    /*"sortType":"ASC"*/
                },
                success: function (result) {
                    var num = 0;
                    var totalnum = 0;

                    if (flag) {
                        // 分页
                        var pageTotal;

                        totalnum = result["data"].totalElements;

                        if(totalnum==0){
                            pageTotal=1;
                        }
                        else{
                        pageTotal = result["data"].totalPages;
                        }
                        // $("#totle").text(result.total)
                        new Page({
                            id: 'pagination',
                            pageTotal: pageTotal, //必填,总页数
                            pageAmount: 5,  //每页多少条
                            dataTotal: totalnum, //总共多少条数据
                            curPage: nowpage, //初始页码,不填默认为1
                            pageSize: 5, //分页个数,不填默认为5
                            showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                            showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                            getPage: function (page) {
                                //  console.log(page);
                                if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
                                    sfhj = "-1";
                                }
                                if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
                                    sfhj = "1";
                                }
                                if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
                                    sfhj = "0";
                                }
                                nowpage = page;

                                search(page, sfhj, false);
                                //获取当前页数

                            }
                        });
                        $("#searchNum").html(totalnum);
                    }

                    var str1 = "";


                    for (var i in result["data"]["content"]) {


                        getTags(result["data"]["content"][i].id);
                        if (!unittag) {
                            unittag = ''
                        }
                        pid = result["data"]["content"][i].id;
                        str1 += "<ul >";
                        str1 += "<li>";
                        str1 += "<div class=\"pubBox \" id=\"info\">";

                        if (result["data"]["content"][i].sfhj == "1") {
                            str1 += "<div class=\"waitPG\"><i class=\"icon\" ><span>已化解</span></i></div>";

                        } else if (result["data"]["content"][i].sfhj == "0") {
                            str1 += "<div class=\"noPG\"><i class=\"icon\"><span>未化解</span></i></div>";
                        }
                        if (result["data"]["content"][i].personImage != null && result["data"]["content"][i].personImage != "" && result["data"]["content"][i].personImage != "null") {
                            str1 += "<div style=\"float: left;\"><img src=\"/uploads/" + result["data"]["content"][i].personImage + "\" style=\"margin-left: 20px;\"alt=\"\"></div>"
                        } else {
                            str1 += "<div style=\"float: left;\"><img src=\"../images/people.png\" style=\"margin-left: 20px;\"alt=\"\"></div>"

                        }
                        str1 += "<div style=\"margin-left: 120px;\"><p class=\"proInfo\" name=\"paId\" hidden=\"hidden\">" + result["data"]["content"][i].id + "</p>";
                        if (result["data"]["content"][i].personName != null && result["data"]["content"][i].personName != "" && result["data"]["content"][i].personName != "") {
                            str1 += "<p class=\"proName\" style=\"font-size:17px;\" name=\"objectName\" onclick=\"personIndex('" + result["data"]["content"][i].id + "')\">" + result["data"]["content"][i].personName;

                            if (result["data"]["content"][i].gender == "1") {
                                //  str1 += "<img  src=\"wwpt/images/men.png\" style=\"position: absolute;height: 23px;\"/> ";
                                str1 += "<span class=\"proName2\"></span>";
                            }
                            if (result["data"]["content"][i].gender == "0") {
                                //str1 += "<img  src=\"wwpt/images/women.png\" style=\"position: absolute;height: 23px;\"/> ";
                                str1 += "<span class=\"proName1\"></span>";
                            }
                            str1 += "</p>"
                        }
                        str1 += "<div class=\"labelBox\">";
                        str1 += unittag;
                        str1 += "</div><table>";
                        if (result["data"]["content"][i].personDocuNum != null && result["data"]["content"][i].personDocuNum != "" && result["data"]["content"][i].personDocuNum != "null") {
                            str1 += "<tr><td class=\"proInfo\">证件号：" + result["data"]["content"][i].personDocuNum + "</td> ";
                        } else {
                            str1 += "<tr><td class=\"proInfo\">证件号：无</td> ";

                        }

                        if (result["data"]["content"][i].phoneNum != null && result["data"]["content"][i].phoneNum != "" && result["data"]["content"][i].phoneNum != "null") {
                            str1 += "<td class=\"proInfo\" style=\"margin-left: 250px;\">电话：" + result["data"]["content"][i].phoneNum + "</td></tr>";
                        } else {
                            str1 += "<td class=\"proInfo\" style=\"margin-left: 250px;\">电话:无</td></tr>";

                        }
                        str1 += "</table>"

                        var time1 = result["data"]["content"][i].putDate;
                        var time = timestampToTime(result["data"]["content"][i].putDate);
                        if (time1 != "" && time1 != "1970-01-1 ") {


                            str1 += "<div class=\"infoBox\"><div class=\"item\" name='入库时间'><i></i> <span>" + time + "</span></div>";
                        } else {
                            str1 += "<div class=\"infoBox\"><div class=\"item\" name='入库时间'><i></i> <span>无</span></div>";

                        }

                        str1 += "<div class=\"item\"><div class=\"item\" id=" + result["data"]["content"][i].id + "></div>";

                        str1 += "</div>";
                        str1 += "</div>";
                        str1 += "<div class=\"btnGroup\">"
                        str1 += " <a onclick=\"xinfangnew('" + result["data"]["content"][i].id + "')\" class=\"btnSty\">上访录入</a>"
                        str1 += "<div class=\"sortList sortList2 v-fr\">";
                        str1 += "<a onclick='showPress(this)' class=\"sort\">操作</a>";
                        str1 += "<div class=\"sortDown sortDown2\">";
                        str1 += "<p  onclick=\"personIndex('" + result["data"]["content"][i].id + "')\">详情</p><p onclick=\"editnew('" + result["data"]["content"][i].id + "')\">修改</p><p onclick=\"delPerson('" + result["data"]["content"][i].id + "')\">删除</p><p onclick=\"operate('" + result["data"]["content"][i].id + "')\">处置日志</p><p onclick=\"hjcd('" + result["data"]["content"][i].id + "')\">化解存档</p>";
                        str1 += " </div></div></div>";
                        str1 += "</div></li></ul>";
                        findnum(result["data"]["content"][i].id);

                    }
                    $("#searchCon").html(str1);
                    if (str1 == "") {
                        str1 += "<img src=\"../images/noImage.png\" style=\"margin-left: 400px;\">";
                        $("#searchCon").html(str1);
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
                    footerChange();


                }

            })
            $("#searchCon").mLoading("hide");
            window.clearTimeout(timer1);
        }, new Date() - beginDate + 200)
        closegaoji();
    }


    function findnum(id) {
        var objectId = id;

        $.ajax({
            url: '/personaffair/personEvent',
            result: 'POST',
            dataType: "json",
            data: {
                "keyObjectListId": objectId,
            },
            success: function (data) {
                var num = 0;
                for (var k in data) {
                    num = num + 1;
                }
                var str1 = "";
                str1 += "<i></i> <span onclick=\'jump(\"" + id + "\")\'>数据聚合（" + num + "）</span> ";


                $("#" + id).html(str1);


            }
        })
    }

    function jump(id) {
        var url = 'dataTogether.jsp?paId=' + id + '';
        openNewWindow(url);
    }

    function footerChange() {
        // .index-main高度
        var indexMainH = $(".fx-left").outerHeight(true);
        var indexMainHR = $(".fx-right").outerHeight(true);
        if (indexMainH < indexMainHR) {
            indexMainH = indexMainHR - 45;
        }
    }

    //显示
    function usesearch() {
        var sfhj;
        if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
            sfhj = "-1";
        }
        if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
            sfhj = "1";
        }
        if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
            sfhj = "0";
        }
        search(1, sfhj, true);
    }

    function textclick(text) {
        var textCon = text;
        // 隐藏输入框
        $("#labelfuzzyBox").css("display", "none");
        var str = "<span> <strong>" + textCon + "</strong><i class=\"labelClose\">×</i></span>";
        $(".labelAll").prepend(str);
        var sfhj;
        if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
            sfhj = "-1";
        }
        if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
            sfhj = "1";
        }
        if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
            sfhj = "0";
        }
        findPerson(sfhj, "", "", "", "", "", "", "", "", 1, 5, "0", true);
    };

    function labelclick(text) {
        var textHtml = text;
        $("#labelfuzzyBox").css("display", "none");
        var str2 = "<span> <strong>" + textHtml + "</strong><i class=\"labelClose\">×</i></span>";
        $(".labelAll").prepend(str2);
        var sfhj;
        if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
            sfhj = "-1";
        }
        if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
            sfhj = "1";
        }
        if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
            sfhj = "0";
        }
        findPerson(sfhj, "", "", "", "", "", "", "", "", 1, 5, "0", true);
    }

    function findMore() {
        var url = 'dataTogether.jsp';
        openNewWindow(url);
    }

    function findHandlelogById(pid, page, flag) {
        $.ajax({
            url: '/personaffair/findHandlelogById',
            result: 'POST',
            dataType: "json",
            data: {
                "keyPersonId": pid,
                "pages": page,
                "rows": 2
            },
            success: function (result) {
                $("#counteventnum").html(result.total);
                if (flag) {
                    // 分页
                    var pageTotal;
                    if (result.total <= 2) {
                        pageTotal = 1;
                    } else {
                        pageTotal = Math.ceil(result.total / 2);
                    }
                    new Page({
                        id: 'handlelogpage',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 2,  //每页多少条
                        dataTotal: result.total, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 2, //分页个数,不填默认为5
                        showPageTotalFlag: false, //是否显示数据统计,不填默认不显示
                        showSkipInputFlag: false, //是否支持跳转,不填默认不显示
                        getPage: function (page) {
                            console.log(page);

                            findHandlelogById(pid, page, false);
                            //获取当前页数*!/

                        }
                    });

                }
                var str1 = "";
                str1 += "<tr>\n" +
                    "                    <th style=\"width:100px\">处置日期</th>\n" +
                    "                    <th style=\"width:100px\">日志类型</th>\n" +
                    "                    <th style=\"width:100px\">简要内容</th>\n" +
                    /* "                    <th width=\"10%\">附件</th>\n" +*/
                    "                    <th style=\"width:100px\">录入人员</th>\n" +
                    "                    <th style=\"width:100px\">操作</th>\n" +
                    "                </tr>";
                var data = result.rows;
                for (var i in data) {
                    if (data[i].handleDate != "0" && data[i].handleDate != null && data[i].handleDate != "null") {
                        var time = timestampToTime(data[i].handleDate);
                        str1 += "<tr><td>" + time + "</td>";
                    } else {
                        str1 += "<tr><td>无日期</td>";
                    }
                    if (data[i].handleLogType != null && data[i].handleLogType != "" && data[i].handleLogType != "null") {
                        if (data[i].handleLogType == "1") {
                            str1 += "<td>领导批示</td>";
                        } else if (data[i].handleLogType == "2") {
                            str1 += "<td>依法处置</td>";
                        } else {
                            str1 += "<td>" + data[i].handleLogType + "</td>";
                        }
                    } else {
                        str1 += "<td>无</td>";
                    }
                    if (data[i].handleContent != null && data[i].handleContent != "" && data[i].handleContent != "null") {

                        str1 += "<td style=\"max-width: 200px;overflow: hidden;white-space: nowrap; text-overflow:ellipsis;\">" + data[i].handleContent + "</td>";
                    } else {
                        str1 += "<td style=\"max-width: 200px;overflow: hidden;white-space: nowrap; text-overflow:ellipsis;\">无</td>";
                    }
                    var filepath = "";
                    if (data[i].handleFilepath != null && data[i].handleFilepath != "" && data[i].handleFilepath != "null") {
                        filepath = data[i].handleFilepath;
                    }

                    if (data[i].handleUser != null && data[i].handleUser != "" && data[i].handleUser != "null") {

                        str1 += "<td>" + data[i].handleUser + "</td>";
                    } else {
                        str1 += "<td>无</td>";
                    }
                    str1 += "<td><a onclick=\"edithandlelog('" + data[i].handleLogId + "','" + data[i].keyPersonId + "')\" class=\"insertBtn\">编辑</a><a onclick=\"downLoadFj('" + filepath + "')\" class=\"insertBtn\">下载</a><a onclick=\"deletehandlelog('" + data[i].handleLogId + "','" + data[i].keyPersonId + "')\" class=\"insertBtn\">删除</a></td></tr>";
                }

                $("#personHandlelog").html(str1);
            }


        })
    }

    function uploadHanlelogFj(handleLogId, keyPersonId) {
        var fileEleId = "czPath";
        var attrName = "czPath";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/personaffair/uploadHandleLogFj",
            fileElementId: fileEleId,
            async: false,
            dataType: "text",
            data: {
                attrName: attrName,
                handleLogId: handleLogId
            },
            success: function (data) {

                findHandlelogById(keyPersonId, 1, true);
            }
        });

    }


    function uploadsfFj(sfId) {
        var fileEleId = "sfPath";
        var attrName = "sfPath";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/personaffair/uploadsfFj",
            fileElementId: fileEleId,
            dataType: "text",
            data: {
                attrName: attrName,
                sfId: sfId
            },
        });
    }

    var ifuploadimg = false;

    function uploadImg(personId, sfhj) {
        if (ifuploadimg == true) {
            //单个文件的异步上传
            $.ajaxFileUpload({
                result: "POST",
                url: "/personaffair/uploadImg",
                fileElementId: "browerfile",
                async: false,
                dataType: "text",
                data: {
                    attrName: "browerfile",
                    personId: personId
                },
                success: function (data) {
                    $("#browerfile").val("");
                    $("#browerfile").change(function (e) {
                        ifuploadimg = true;
                        var path = browerfile.value;
                        var objUrl = getObjectURL(this.files[0]);
                        if (objUrl) {
                            $('#QRCode').attr("src", objUrl);
                        }
                    })
                    findPerson(sfhj, "", "", "", "", "", "", "", "", nowpage, 5, "0", true);
                    findAlreadyAccessNum();
                    findNotAccessNum();
                    ifuploadimg = false;

                }
            });
        } else {
            findPerson(sfhj, "", "", "", "", "", "", "", "", nowpage, 5, "0", true);
            findAlreadyAccessNum();
            findNotAccessNum();
        }
    }

    function newAdduploadImg() {
        var img = '';

        //获取图片路径的方法，兼容多种浏览器，通過createObjectURL实现


        //实现上上传图片功能代码
        $(function () {

            $("#browerfile").change(function (e) {
                ifuploadimg = true;
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

    function edithandlelog(id, personid) {
        $("#handlelogeventId").val("");

        $("#handleType").val("");

        $("#handleDate").val("");

        $("#writerId").val("");
        $("#briefInfo").val("");
        $("#fileName").text("");
        $("#fileName").val("");
        $("#czPath").val("");
        $.ajax({
            url: '/personaffair/findhandlelogById',
            result: 'post',
            async: false,
            dataType: "json",
            data: {"handleLogId": id},
            success: function (data) {
                $("#handlelogeventId").val(id);

                $("#handleType").val(data[0].handleLogType);
                if (data[0].handleDate != "0" && data[0].handleDate != null && data[0].handleDate != "null") {
                    var time = timestampToTime(data[0].handleDate.time);
                    $("#handleDate").val(time);
                }
                $("#writerId").val(data[0].handleUser);
                $("#briefInfo").val(data[0].handleContent);
                var filepath = getCaption(data[0].handleFilepath);
                $("#fileName").text(filepath);
            }
        })
    }

    function getCaption(obj) {
        return obj.split("@@@@")[1]
    }

    function deletehandlelog(id, personid) {
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    // console.log("pa"+paId);
                    $.ajax({
                        url: '/personaffair/deletehandlelog',
                        result: 'post',
                        async: false,
                        dataType: "json",
                        data: {"handleLogId": id},
                        success: function (result) {


                            $.messager.alert("操作提示", "操作成功!");
                            findHandlelogById(personid, 1, true);
                            $("#handlelogeventId").val("");

                            $("#handleType").val("");

                            $("#handleDate").val("");

                            $("#writerId").val("");
                            $("#briefInfo").val("");
                            $("#fileName").text("");
                            $("#fileName").val("");
                            $("#czPath").val("");
                        },
                        error: function (error) {
                            $.messager.alert("操作提示", "操作失败!");
                            findHandlelogById(personid, 1, true);
                            $("#handlelogeventId").val("");

                            $("#handleType").val("");

                            $("#handleDate").val("");

                            $("#writerId").val("");
                            $("#briefInfo").val("");
                            $("#fileName").text("");
                            $("#fileName").val("");
                            $("#czPath").val("");
                        }
                    })

                }
            }
        })
    }

    function AllKeyEventList() {
        $.ajax({
            url: '/personaffair/findAllKeyEvent',
            result: 'POST',
            dataType: "json",
            data: {id: ''},
            success: function (data) {
                var str1 = "";
                var count = 0;
                /* var num = data.length;*/
                //$("#eventdataNum").html(num);

                for (var i = 0; i < data.length; i++) {


                    str1 += "<dl> <dt>";
                    if (data[i].EVENT_NAME != null && data[i].EVENT_NAME != "" && data[i].EVENT_NAME != "null") {

                        str1 += "<span>" + data[i].EVENT_NAME + "</span><i class=\"new\"></i></dt><dd>";
                    } else {
                        str1 += "<span>无事件名</span><i class=\"new\"></i></dt><dd>";

                    }
                    if (data[i].EVENT_CONTENT != null && data[i].EVENT_CONTENT != "" && data[i].EVENT_CONTENT != "null") {

                        str1 += "<p class=\"con\"  style=\"white-space: nowrap; text-overflow:ellipsis; overflow: hidden;\">" + data[i].EVENT_CONTENT + "</p>";
                    } else {
                        str1 += "<p class=\"con\"  style=\"white-space: nowrap; text-overflow:ellipsis; overflow: hidden;\">无事件内容</p>";

                    }
                    str1 += "<div class=\"sourceInfo\">";
                    if (data[i].OBJECT_NAME != null && data[i].OBJECT_NAME != "" && data[i].OBJECT_NAME != "null") {

                        str1 += " <span class=\"name\">" + data[i].OBJECT_NAME + "</span>";
                    } else {
                        str1 += " <span class=\"name\">无</span>";
                    }
                    if (data[i].EVENT_SOURCE != null && data[i].EVENT_SOURCE != "" && data[i].EVENT_SOURCE != "null") {
                        str1 += "  <strong> <b>来源 ：</b><span>" + data[i].EVENT_SOURCE + "</span> </strong>";
                    } else {
                        str1 += "  <strong> <b>来源 ：</b><span>无</span> </strong>";

                    }

                    if (data[i].OCCURED_TIME != null && data[i].OCCURED_TIME != "0" && data[i].OCCURED_TIME != "null") {
                        var time = timestampToTime(data[i].OCCURED_TIME.time);
                        if (time != "1970-01-1 ") {
                            str1 += "<em>" + time + "</em>";
                        }

                    } else {
                        str1 += "<em>无</em>";
                    }


                    str1 += "</div></dd></dl>";
                }

                $("#dataList").html(str1);
                if (str1 == "") {
                    str1 += "<img src=\"../images/noImage.png\" style=\"\n" +
                        "    margin-left: 130px;\n" +
                        "    margin-top: 40px;\n" +
                        "\">";

                }
            }
        })

    }

    $(function () {
        /*导航切换*/
        $(".header-nav a").click(function () {
            $(".header-nav a").removeClass("active");
            $(this).addClass("active");
        });
        /*下拉链接*/
        $(".dropdown-link").click(function () {
            if ($(this).children("ul").is(":hidden")) {
                $(this).children("ul").fadeIn(100);
            } else {
                $(this).children("ul").fadeOut(100);
            }
        });
        $(".dropdown-link").mouseleave(function () {
            $(this).children("ul").fadeOut(100);
        });
        /*消息提醒下拉切换*/
        $('.dropdown-notice').click(function () {
            if ($(this).find(".notice-box").is(":hidden")) {
                $(this).find(".notice-box").fadeIn(100);
            } else {
                $(this).find(".notice-box").fadeOut(100);
            }
        });
        $(".dropdown-notice").mouseleave(function () {
            $(this).children(".notice-box").fadeOut(100);
        });
        /*header-hover*/
        $(".header-box").hover(function () {
            $(this).addClass("hover");
        }, function () {
            $(this).removeClass("hover");
        });

        // 输入框控件调用
        vVsub();

        /*  jeDate("#putDate", {
              theme: { bgcolor: "#00A1CB", pnColor: "#00CCFF" },
              format: "YYYY-MM-DD",
              multiPane: true,
          });*/
        jeDate("#handleDate", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: true,
        });
        jeDate("#rq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: true,
        });

        jeDate("#createDate", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: " 至 "
        });

        jeDate("#hjrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: true,
        });
        jeDate("#cdrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: true,
        });


        // //新增的模糊查询下拉框滚动条

        //弹出列表框
        $("#addPersonName").click(function () {
            choosePerson();
            $("#showdata").fadeIn();
            return false;
        });

        //隐藏列表框
        $("body").click(function () {
            $("#showdata").fadeOut();
        });

        //移入移出效果
        $(".spanItem").hover(function () {
            $(this).css('background-color', '#dbf1fc');
        }, function () {
            $(this).css('background-color', 'white');
        });


        $("#addPersonName").keyup(function () {
            $("#showdata").fadeIn();//只要输入就显示列表框

            if ($("#addPersonName").val().length <= 0) {
                $(".spanItem").css('display', 'block');//如果什么都没填，跳出，保持全部显示状态
                return;
            }

            $(".spanItem").css('display', 'none');//如果填了，先将所有的选项隐藏

            for (var i = 0; i < $(".spanItem").length; i++) {
                //模糊匹配，将所有匹配项显示
                if ($(".spanItem").eq(i).text().substr(0, $("#addPersonName").val().length) == $("#addPersonName").val()) {
                    $(".spanItem").eq(i).css('display', 'block');
                }
            }
        });


        $(".tabConSon2").perfectScrollbar();
        // 高级搜索
        $(".advancedSearch").click(function () {
            if (searchonOff) {
                $(this).html("收起工具");
                $(this).addClass("active");
                $(".advanceBox").addClass("active");
                $(".advanceBox").animate({"height": "235px"}, 100);
            } else {
                $(this).html("高级搜索");
                $(this).removeClass("active");
                $(".advanceBox").removeClass("active");
                $(".advanceBox").animate({"height": "70px"}, 100);
            }
            searchonOff = !searchonOff;
        })


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
            // $("#txt1").val(textCOn);
            $(".labelAll").prepend('<span>\n' +
                '                <strong>' + textCon + '</strong>\n' +
                '                <i class="labelClose">×</i>\n' +
                '            </span>');
            clickHandle();
            var sfhj;
            if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
                sfhj = "-1";
            }
            if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
                sfhj = "1";
            }
            if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
                sfhj = "0";
            }
            findPerson(sfhj, "", "", "", "", "", "", "", "", 1, 5, "0", true);
            $(".labelDown").fadeOut();

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
            clickHandle();
            var sfhj;
            if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
                sfhj = "-1";
            }
            if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
                sfhj = "1";
            }
            if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
                sfhj = "0";
            }
            findPerson(sfhj, "", "", "", "", "", "", "", "", 1, 5, "0", true);
            $(".labelDown").fadeOut();
        });
        // 标签删除
        $('.labelAll').on("click", ".labelClose", function () {
            var removeStr = $(this).parent().find("strong").text();
            removeByValue(labelArr, removeStr);
            $(this).parent().remove();
            clickHandle();
            var sfhj;
            if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
                sfhj = "-1";
            }
            if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
                sfhj = "1";
            }
            if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
                sfhj = "0";
            }
            findPerson(sfhj, "", "", "", "", "", "", "", "", 1, 5, "0", true);
            $(".labelDown").fadeOut();
        });

        $('.easyui-combobox').combobox({
            // 定义用户是否可以直接输入文本到字段中。
            editable: false,
            // 自适应高度。
            panelHeight: 'auto',
            // 设置需要固定的高度(适用于1.4或以上版本)。
            panelMaxHeight: 154
        });    // 人-社会实体-事件切换
        $(".tabName div").mouseenter(function () {
            $(this).addClass("active").siblings().removeClass("active");
            $(".tabCon").children().eq($(this).index()).removeClass("displayNone").siblings().addClass("displayNone");
        })
        // 标签弹窗关闭
        $(".labelCloseBtn").click(function () {
            $("#txt1").val("");
            $("#txt1").keyup();
            $(".labelDown").fadeOut();
            $(".fuzzyBox").css("display", "none");
        })
        $('.easyui-combobox').combobox({
            // 定义用户是否可以直接输入文本到字段中。
            editable: false,
            // 自适应高度。
            panelHeight: 'auto',
            // 设置需要固定的高度(适用于1.4或以上版本)。
            panelMaxHeight: 154
        });


// 弹框滚动条
        $("#insertnew").perfectScrollbar();
        // 排序方式
        $(".statusList li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        })
        var sortHtml = "";
        $(".sortMethod").click(function () {
            $(this).next().slideDown();
        });
        $(".sortText p").click(function () {
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
    })

    function addnew() {
        $("#findpersonId").val("");
        $("#addshowname").show();
        $("#editshowname").hide();
        $("#addPersonName").val("");
        $("#editPersonName").val("");
        $('#addPersonUsedName').val("");
        $('#gender').val("");
        //移出disabled属性
        $('#addPeronDocuNum').removeAttr("readOnly");
        $('#addPeronDocuNum').val("");
        $('#addNationality').val("");
        $('#addPhoneNum').val("");
        $('#addNativePlace').val("");
        $('#addDataSource').val("");
        $('#addLivePlace').val("");
        $("#province option").removeAttr("selected"); //移除属性selected
        $("#city option").removeAttr("selected");
        $('#addPutReason').val("");
        $('#addPutUserId').val("");
        /*$('#putDate').val("");*/
        $('#wkunit').val("");
        $('#hjunit').val("");
        $('#zrsq').val("");
        $("#conflictType").val("");
        $("#conflictRank").val("");
        $("#QRCode").attr("src", "../images/imgIcon.png");


        $("#addnew").fadeIn();
    }

    function editnew(id) {
        $("#addshowname").hide();
        $("#editshowname").show();

        editnewshow(id);
    }


    function xinfangnew(id) {
        $("#pid").val(id);
        $("#rq").val("");
        $("#lrry").val("");
        $("#jyqk").val("");
        $("#sftype").val("");

        $("#sfPath").val("");
        $("#filepath").val("");
        $("#filepath").text("");
        $("#xinfang").fadeIn();

    }

    function operate(id) {
        $("#keyPersonId").attr("value", id);

        $("#handleType").val("");
        $("#handleDate").val("");
        $("#writerId").val("");
        $("#briefInfo").val("");
        $("#fileName").text("");
        $("#fileName").val("");
        $("#czPath").val("");
        findHandlelogById(id, 1, true);
        $("#operate").fadeIn();

    }

    function hjcd(id) {
        $("#hjdxid").attr("value", id);
        $("#hjrq").val("");
        $("#cdrq").val("");
        $("#huajie").fadeIn();

    }

    //数据回显
    function editnewshow(id) {

        $.ajax({
            url: '/personaffair/personBaseInfo',
            result: 'POST',
            dataType: "json",
            data: {
                "personId": id
            },
            success: function (data) {
                $("#findpersonId").val("");
                $("#addPersonName").val("");
                $("#editPersonName").val("");
                $('#addPersonUsedName').val("");
                $('#gender').val("");
                //移出不可修改不可赋值
                $('#addPeronDocuNum').removeAttr("readOnly");
                $('#addPeronDocuNum').val("");
                $('#addNationality').val("");
                $('#addNativePlace').val("");
                $('#addPhoneNum').val("");
                $('#addDataSource').val("");
                $("#province option").removeAttr("selected"); //移除属性selected
                $("#city option").removeAttr("selected");
                $('#addLivePlace').val("");
                $('#addPutReason').val("");
                $('#addPutUserId').val("");
                /*  $('#putDate').val("");*/
                $('#addLabel').val("");
                $('#wkunit').val("");
                $('#hjunit').val("");
                $('#zrsq').val("");
                $("#conflictType").val("");
                $("#conflictRank").val("");
                $('#QRCode').val("");
                $("#findpersonId").val(id);
                $("#editPersonName").val(data[0].personName);
                $('#addPersonUsedName').val(data[0].personUsedName);
                $('#gender').val(data[0].gender);
                $('#addPeronDocuNum').val(data[0].personDocuNum);
                //查询时候不可修改证件号
                $('#addPeronDocuNum').attr("readOnly", "false");
                $('#addNationality').val(data[0].nationality);
                $('#addPhoneNum').val(data[0].phoneNum);
                $('#addNativePlace').val(data[0].nativePlace);
                $('#addDataSource').val(data[0].dataSource);
                if (data[0].personImage != null && data[0].personImage != "" && data[0].personImage != "null") {
                    $("#QRCode").attr("src", "/uploads/" + data[0].personImage);
                } else {
                    $("#QRCode").attr("src", "../images/imgIcon.png");
                }

                $("#province").find("option:contains('" + data[0].liveStreet + "')").attr("selected", true);
                childchange();//根据街道输出所有居委选项
                $("#city").find("option:contains('" + data[0].neighborhood + "')").attr("selected", true);
                $('#addLivePlace').val(data[0].livePlace);

                $('#addLabel').val("");
            }
        })
        $.ajax({
            url: '/personaffair/KeyObjectInfoById',
            result: 'POST',
            dataType: "json",
            data: {
                "personId": id
            },
            success: function (data) {
                $('#addPutUserId').val("");
                /* $('#putDate').val("");*/
                $('#addPutReason').val("");
                $('#wkunit').val("");
                $('#hjunit').val("");
                $('#zrsq').val("");
                $("#conflictType").val("");
                $("#conflictRank").val("");
                $('#addPutUserId').val(data[0].putUserId);
                if (data[0].putDate != null && data[0].putDate != "0" && data[0].putDate != "null") {
                    /* var time = timestampToTime(data[0].putDate.time);
                     $('#putDate').val(time);*/
                    $('#addPutReason').val(data[0].putReason);
                    $('#wkunit').val(data[0].zrdw);
                    $('#hjunit').val(data[0].hjdw);
                    $('#zrsq').val(data[0].zrsq);
                    $("#conflictType").val(data[0].mdtype);
                    $("#conflictRank").val(data[0].mdjb);
                }

            }
        })
        $('#addLabel').val("");
        $.ajax({
            result: "POST",
            url: "/objectTagManager/getObjectTag",
            dataType: "json",
            async: false,
            data: {
                objectId: id,
            },
            success: function (result) {
                var str = '';
                if (result.message == "success") {
                    var tags = result.objectTag;
                    for (var i = 0; i < tags.length; i++) {
                        if (i == tags.length - 1) {
                            str += tags[i].tagName;
                        } else {
                            str += tags[i].tagName + "&";
                        }
                    }
                    $('#addLabel').val(str);
                    var a = $('#addLabel').val();
                    // console.log("a="+a);
                }

            }
        })

        $("#addnew").fadeIn();
    }


    //操作
    var showSort = true;

    function showPress(obj) {
        if (showSort) {
            $(obj).next().fadeIn();
        } else {
            $(obj).next().fadeOut();
        }
        showSort = !showSort;
    }

    //获取标签

    var num = $("#labelAll").find("span").length;

    function sortPerson(sortField) {
        $("#sort").val(sortField);
        var sfhj;
        if ($("#ifhuajie").find("li:eq(0)").hasClass("active")) {
            sfhj = "-1";
        }
        if ($("#ifhuajie").find("li:eq(1)").hasClass("active")) {
            sfhj = "1";
        }
        if ($("#ifhuajie").find("li:eq(2)").hasClass("active")) {
            sfhj = "0";
        }
        findPerson(sfhj, "", "", "", "", "", "", "", "", 1, 5, "0", true);
    }
</script>
</html>