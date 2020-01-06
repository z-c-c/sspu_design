<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>实体数据管理</title>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="systemManager/css/page.css">
    <link rel="stylesheet" type="text/css" href="knowledge/css/jquery.mloading.css">
    <link rel="stylesheet" type="text/css" href="systemManager/css/jedate.css">
    <link rel="stylesheet" type="text/css" href="systemManager/css/scrollbar.css">
    <script type="text/javascript" src="systemManager/js/jquery.min.js"></script>
    <script type="text/javascript" src="knowledge/js/jquery.mloading.js"></script>
    <script type="text/javascript" src="systemManager/js/pop.js"></script>
    <script type="text/javascript" src="systemManager/js/jedate.js"></script>
    <script type="text/javascript" src="systemManager/js/scrollbar.min.js"></script>
    <style type="text/css">
        .drop-down-load:after {
            display: inline;
            content: "下拉加载更多";
        }

        .drop-down-load.no-more:after {
            content: "所有数据加载完毕";
        }

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

        .modal-inputset input {
            width: 80%;
            padding-left: 10px;
            height: 36px;
            line-height: 30px;
            border: 1px solid #e6e6e6;
            background-color: #fff;
            border-radius: 3px;
            background-color: #fcfcfc;
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
<div class="f-content p2-1">
    <div class="f-top">
        <div class="f-title"><span>知识库管理&nbsp;/&nbsp;</span>实体数据管理</div>
        <div class="search-box">
            <div class="fz-left" onclick="showAddBaseinfo();">
                <img src="systemManager/images/p2-1-icon4.png">
                <span>新增</span>
            </div>
            <div class="fz-right">
                <img src="systemManager/images/p2-1-icon5.png">
                <%--<input id="instanceKey" onkeypress="if(event.keyCode==13){instanceSearch.click();return false;}">--%>
                <input id="instanceKey" onkeypress="enterSearch(this)">
                <script>
                    function enterSearch(e) {
                        if (event.keyCode == 13) {
                            getInstanceList();
                            return false;
                        }
                    }
                </script>
                <button name="instanceSearch" onclick="getInstanceList();">搜索</button>
            </div>
        </div>
    </div>
    <div class="f-bott">
        <div class="inner-title">搜索结果</div>
        <div class="f-inner">
            <ul>
                <li class="f-li">
                    <div>
                        <div class="fz-top">
                            <div class="fz-left">
                                <img src="systemManager/images/p2-1-icon1.png">
                                <span>无</span>
                            </div>
                        </div>
                        <div class='fz-mid'>
                            <h6>法规信息:</h6>
                            <div>
                                <div class="method">
                                    <div class="obj-left"><span>标题</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>法规状态</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>修改依据</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>失效依据</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>发布部门</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>发布文号</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>发布日期</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>实施日期</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>时效性</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>法规效力级别</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                                <div class="method">
                                    <div class="obj-left"><span>法规类别</span><%--<b style="font-size:20px;">get</b>--%>
                                    </div>
                                    <div class="obj-right"><span>无</span><%--<b class="open">启用</b>--%></div>
                                </div>
                            </div>

                            <%--<dl class="tags">
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dt><img src="systemManager/images/p2-1-icon2.png"/></dt>
                            </dl>--%>
                        </div>
                        <div class="fz-bott">
                            <div class="fz-left">
                                <span>属性:</span>
                                <b>法规<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                            <div class="fz-right">
                                <span>本体关系:</span>
                                <b>引用关系<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                        </div>
                    </div>
                </li>
                <%--<li class="f-li">
                    <div>
                        <div class="fz-top">
                            <div class="fz-left">
                                <img src="systemManager/images/p2-1-icon1.png">
                                <span>上海市轨道交通管理条例</span>
                            </div>
                        </div>
                        <div class='fz-mid'>
                            <h6>类别标签:</h6>
                            <dl class="tags">
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dt><img src="systemManager/images/p2-1-icon2.png"/></dt>
                            </dl>
                        </div>
                        <div class="fz-bott">
                            <div class="fz-left">
                                <span>属性:</span>
                                <b>法规<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                            <div class="fz-right">
                                <span>本体关系:</span>
                                <b>引用关系<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="f-li">
                    <div>
                        <div class="fz-top">
                            <div class="fz-left">
                                <img src="systemManager/images/p2-1-icon1.png">
                                <span>上海市青少年管理条例</span>
                            </div>
                        </div>
                        <div class='fz-mid'>
                            <h6>类别标签:</h6>
                            <dl class="tags">
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dt><img src="systemManager/images/p2-1-icon2.png"/></dt>
                            </dl>
                        </div>
                        <div class="fz-bott">
                            <div class="fz-left">
                                <span>属性:</span>
                                <b>法规<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                            <div class="fz-right">
                                <span>本体关系:</span>
                                <b>引用关系<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="f-li">
                    <div>
                        <div class="fz-top">
                            <div class="fz-left">
                                <img src="systemManager/images/p2-1-icon1.png">
                                <span>生活垃圾管理条例</span>
                            </div>
                        </div>
                        <div class='fz-mid'>
                            <h6>类别标签:</h6>
                            <dl class="tags">
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dd>生态安全</dd>
                                <dd>垃圾源头减量</dd>
                                <dd>资源循环利用</dd>
                                <dt><img src="systemManager/images/p2-1-icon2.png"/></dt>
                            </dl>
                        </div>
                        <div class="fz-bott">
                            <div class="fz-left">
                                <span>属性:</span>
                                <b>法规<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                            <div class="fz-right">
                                <span>本体关系:</span>
                                <b>引用关系<img src="systemManager/images/p1-1-icon2.png"></b>
                            </div>
                        </div>
                    </div>
                </li>--%>

            </ul>
        </div>
    </div>
</div>
<div id="jiafeng" class="drop-down-load">
    <div class="loading">
        <i></i><i></i><i></i><i></i>
    </div>
</div>
<%--<div class="modal">
    <div class="fz-top">
        <div class="fz-left">
            <img src="systemManager/images/p2-1-icon3.png">
            <span id="modal_title">生活垃圾管理条例</span>
        </div>
    </div>
    <div class="fz-bott">
        <h6>基本信息:</h6>
        <dl class="tags">
            <dd>生态安全</dd>
            <dd>垃圾源头减量</dd>
            <dd>资源循环利用</dd>
            <dd>生态安全</dd>
            <dd>垃圾源头减量</dd>
        </dl>
        <div class="f-block">
            <span>属性:</span>
            <b>法规<img src="systemManager/images/p1-1-icon2.png"></b>
        </div>
        <div class="f-block">
            <span>本体关系:</span>
            <b>引用关系<img src="systemManager/images/p1-1-icon2.png"></b>
        </div>
    </div>
</div>--%>

<div class="modal">
    <div class="fz-top">
        <div class="fz-left">
            <img src="systemManager/images/p2-1-icon3.png">
            <span id="modal_title">生活垃圾管理条例</span>
        </div>
    </div>
    <div class="fz-bott">
        <div class="modal-inputset">
            <label class="modal-label">法规类别</label>
            <select id="updateLawType" name="updateLawType">
                <option>中央法规</option>
                <option>地方法规</option>
                <option>中央相关文件</option>
                <option>地方相关文件</option>
                <option>中央部门规章</option>
                <option>地方政府规章</option>
            </select>
        </div>
        <div class="f-block">
            <span>属性:</span>
            <b>法规<img src="systemManager/images/p1-1-icon2.png"></b>
        </div>
        <div class="f-block">
            <span>本体关系:</span>
            <b>引用关系<img src="systemManager/images/p1-1-icon2.png"></b>
        </div>
    </div>
</div>

<%--<div id="m2" class="mmodal">

    <div class="modal-form">
        <div class="modal-title">
            <img class="modal-title__img" src="../images/modal3.png"/>
            <span class="modal-title__span">接口示例</span>
            <img class="modal-title__cancel js-cancel" src="../images/modal4.png"/>
        </div>
        <div id="scroll" style="overflow: hidden;height: 500px;position: relative;" class="scrollBox">
            <div>
                <div class="modal-content">
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">接口名称:</span>
                        <span class="modal-info__span"
                              title="jdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsj">jdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsj</span>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">请求方式:</span>
                        <span class="modal-info__span">jdbc:mysql://10.1.93.215:3306/flzsj</span>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">请求事例:</span>
                        <span class="modal-info__span">jdbc:mysql://10.1.93.215:3306/flzsj</span>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">请求参数说明</span>
                        <dl class="modal-list">
                            <dt class="modal-list-dt">
                                <ul class="inline-list">
                                    <li class="inline-list__li">序号</li>
                                    <li class="inline-list__li">名称</li>
                                    <li class="inline-list__li">必填</li>
                                    <li class="inline-list__li">类型</li>
                                    <li class="inline-list__li">说明</li>
                                </ul>
                            </dt>
                            <dd class="modal-list-dd">
                                <ul class="inline-list">
                                    <li class="inline-list__li">1</li>
                                    <li class="inline-list__li">type</li>
                                    <li class="inline-list__li">是</li>
                                    <li class="inline-list__li">string</li>
                                    <li class="inline-list__li">阿三打扫</li>
                                </ul>
                            </dd>
                            <dd class="modal-list-dd">
                                <ul class="inline-list">
                                    <li class="inline-list__li">1</li>
                                    <li class="inline-list__li">type</li>
                                    <li class="inline-list__li">是</li>
                                    <li class="inline-list__li">string</li>
                                    <li class="inline-list__li">阿三打扫</li>
                                </ul>
                            </dd>
                            <dd class="modal-list-dd modal-list-dd--last">
                                <ul class="inline-list">
                                    <li class="inline-list__li">1</li>
                                    <li class="inline-list__li">type</li>
                                    <li class="inline-list__li">是</li>
                                    <li class="inline-list__li">string</li>
                                    <li class="inline-list__li">阿三打扫</li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">JSON返回示例</span>
                        <div class="modal-info__div">
                            <code class="code">
                            </code>
                        </div>
                    </div>
                </div>
                <div class="modal-buttons">
                    <div class="modal-btns__btn modal-btns__btn--primary js-cancel">关闭</div>
                </div>
            </div>
        </div>

    </div>

</div>--%>

<div id="add" class="mmodal">
    <div class="modal-form" style="max-height: none;">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal2.png"/>
            <span class="modal-title__span">新增</span>
            <img class="modal-title__cancel js-cancel" src="systemManager/images/modal4.png"/>
        </div>
        <div id="scroll" style="overflow: hidden;height: 500px;position: relative;" class="ps-container">
            <div>
                <form class="modal-content" id="newLawForm">
                    <div class="modal-inputset">
                        <label class="modal-label">法规名称</label>
                        <input class="modal-inputset__input" id="objectName" name="objectName" required/>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">法规状态</label>
                        <select id="state" name="state">
                            <option>现行有效</option>
                            <option>失效</option>
                            <option>已被修改</option>
                            <option>部分失效</option>
                            <option>尚未生效</option>
                        </select>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">修改依据</label>
                        <input class="modal-inputset__input" id="modBasis" name="modBasis"/>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">失效依据</label>
                        <input class="modal-inputset__input" id="expireBasis" name="expireBasis"/>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">发布部门</label>
                        <input class="modal-inputset__input" id="teamName" name="teamName"/>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">发布文号</label>
                        <input class="modal-inputset__input" id="lawNum" name="lawNum"/>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">发布日期</label>
                        <input type="text" class="jeinput" name="releaseDate" id="releaseDate" placeholder="年-月-日">
                        <%--<input class="modal-inputset__input" id="releaseDate" name="releaseDate"/>--%>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">实施日期</label>
                        <%--<input class="modal-inputset__input" id="effectiveDate" name="effectiveDate"/>--%>
                        <input type="text" class="jeinput" name="effectiveDate" id="effectiveDate" placeholder="年-月-日">
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">时&nbsp;&nbsp;效&nbsp;&nbsp;性</label>
                        <select id="effectiveness" name="effectiveness">
                            <option>现行有效</option>
                            <option>失效</option>
                            <option>已被修改</option>
                            <option>部分失效</option>
                            <option>尚未生效</option>
                        </select>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">效力级别</label>
                        <input class="modal-inputset__input" id="level" name="level"/>
                    </div>
                    <div class="modal-inputset">
                        <label class="modal-label">法规类别</label>
                        <%--<input class="modal-inputset__input" id="lawType" name="lawType"/>--%>
                        <select id="lawType" name="lawType">
                            <option>中央法规</option>
                            <option>地方法规</option>
                            <option>中央相关文件</option>
                            <option>地方相关文件</option>
                            <option>中央部门规章</option>
                            <option>地方政府规章</option>
                        </select>
                    </div>
                </form>
                <div class="modal-buttons">
                    <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
                    <div class="modal-btns__btn modal-btns__btn--primary" onclick="addBaseinfo()">确定</div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--提示--%>
<div id="m3" class="mmodal">
    <div class="modal-pop">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal1.png"/>
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

<div id="typeModal" class="mmodal">
    <div class="modal-pop">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal1.png"/>
            <span class="modal-title__span">属性</span>
            <img class="modal-title__cancel js-cancel" src="systemManager/images/modal4.png"/>
        </div>
        <div class="modal-content">
            <input id="updateId" hidden value="">
            <div id="allType">
                <div class="modal-inputset">
                    <label class="modal-label">法规类别</label>
                    <%--<input class="modal-inputset__input" id="lawType" name="lawType"/>--%>
                    <select id="lawType" name="lawType">
                        <option>中央法规</option>
                        <option>地方法规</option>
                        <option>中央相关文件</option>
                        <option>地方相关文件</option>
                        <option>中央部门规章</option>
                        <option>地方政府规章</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="modal-buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消
            </div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="updateObjectType()">确定</div>
        </div>
    </div>
</div>


<div id="relationsModal" class="mmodal">
    <div class="modal-pop">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal1.png"/>
            <span class="modal-title__span">属性</span>
            <img class="modal-title__cancel js-cancel" src="systemManager/images/modal4.png"/>
        </div>
        <div class="modal-content">
            <input id="updateRelationId" hidden value="">
            <div id="allRelation">
                <div class="modal-inputset">
                    <label class="modal-label">本体关系</label>
                    <%--<input class="modal-inputset__input" id="lawType" name="lawType"/>--%>
                    <select id="relationType" name="relationType">

                    </select>
                </div>
            </div>
        </div>
        <div class="modal-buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消
            </div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="updateRelationType()">确定</div>
        </div>
    </div>
</div>
</body>
<script>

    jeDate("#releaseDate", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        format: "YYYY-MM-DD"
    });
    jeDate("#effectiveDate", {
        theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
        format: "YYYY-MM-DD"
    });

    function getInstanceList() {
        $('body').mLoading("show");
        var instanceKey = $("#instanceKey").val();
        $.ajax({
            url: "instance/getInstanceData",
            type: "post",
            dataType: "json",
            data: {
                pageNum: 1,
                pageSize: 10,
                instanceKey: instanceKey
            },
            success: function (res) {
                $(".f-inner ul").empty();
                if (res.code == 200) {
                    if (res.data.content == undefined || res.data.content == null || res.data.content.length < 1) {
                        //无返回数据
                        return;
                    } else {
                        var baseinfoArr = res.data.content;
                        var relationArr = res.relation;
                        var html = "";
                        for (var i = 0; i < baseinfoArr.length; i++) {
                            var objectName = baseinfoArr[i].objectName == null || baseinfoArr[i].objectName == "" ? "无" : baseinfoArr[i].objectName;
                            var state = baseinfoArr[i].state == null || baseinfoArr[i].state == "" ? "无" : baseinfoArr[i].state;
                            var modBasis = baseinfoArr[i].modBasis == null || baseinfoArr[i].modBasis == "" ? "无" : baseinfoArr[i].modBasis;
                            var expireBasis = baseinfoArr[i].expireBasis == null || baseinfoArr[i].expireBasis == "" ? "无" : baseinfoArr[i].expireBasis;
                            var teamName = baseinfoArr[i].teamName == null || baseinfoArr[i].teamName == "" ? "无" : baseinfoArr[i].teamName;
                            var lawNum = baseinfoArr[i].lawNum == null || baseinfoArr[i].lawNum == "" ? "无" : baseinfoArr[i].lawNum;
                            var releaseDate = baseinfoArr[i].releaseDate == null || baseinfoArr[i].releaseDate == "" ? "无" : baseinfoArr[i].releaseDate;
                            var effectiveDate = baseinfoArr[i].effectiveDate == null || baseinfoArr[i].effectiveDate == "" ? "无" : baseinfoArr[i].effectiveDate;
                            var effectiveness = baseinfoArr[i].effectiveness == null || baseinfoArr[i].effectiveness == "" ? "无" : baseinfoArr[i].effectiveness;
                            var level = baseinfoArr[i].level == null || baseinfoArr[i].level == "" ? "无" : baseinfoArr[i].level;
                            var lawType = baseinfoArr[i].lawType == null || baseinfoArr[i].lawType == "" ? "无" : baseinfoArr[i].lawType;
                            var rela = relationArr[i].relationData[0] == null || relationArr[i].relationData[0] == undefined || relationArr[i].relationData[0] == "" ? "无" : relationArr[i].relationData[0].value;

                            var showTitle = objectName;
                            if (objectName.length > 32) {
                                showTitle = objectName.substring(0, 32) + "...";
                            }
                            html += "<li class=\"f-li\">\n" +
                                "       <div>\n" +
                                "           <div class=\"fz-top\">\n" +
                                "               <div class=\"fz-left\">\n" +
                                "                   <img src=\"systemManager/images/p2-1-icon1.png\">\n" +
                                "                   <input hidden value='" + baseinfoArr[i].id + "'> " +
                                "                   <span>" + showTitle + "</span>\n" +
                                "               </div>\n" +
                                "           </div>\n" +
                                "           <div class='fz-mid'>\n" +
                                "               <h6>基本信息:</h6>\n" +
                                "               <div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>标题</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + objectName + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>法规状态</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + state + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>修改依据</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + modBasis + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>失效依据</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + expireBasis + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>发布部门</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + teamName + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>发布文号</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + lawNum + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>发布日期</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + releaseDate + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>实施日期</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + effectiveDate + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>时效性</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + effectiveness + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>法规效力级别</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + level + "</span></div>\n" +
                                "                   </div>\n" +
                                "                   <div class=\"method\">\n" +
                                "                       <div class=\"obj-left\"><span>法规类别</span></div>\n" +
                                "                       <div class=\"obj-right\"><span>" + lawType + "</span></div>\n" +
                                "                   </div>\n" +
                                "               </div>" +
                                "           </div>" +
                                "           <div class=\"fz-bott\">\n" +
                                "               <div class=\"fz-left\" >" +
                                "                   <span>属性:</span>" +
                                "                   <b style=\"cursor: pointer;\" onclick='showLawType(\"" + baseinfoArr[i].id + "\");'>" + lawType + "<img src=\"systemManager/images/p1-1-icon2.png\"></b>" +
                                "               </div>" +
                                "           <div class=\"fz-right\" >" +
                                "               <span>本体关系:</span>" +
                                "               <b style=\"cursor: pointer;\" onclick='showRelation(\"" + baseinfoArr[i].id + "\");'>" + rela + "<img src=\"systemManager/images/p1-1-icon2.png\"></b>" +
                                "           </div>" +
                                "       </div>" +
                                "   </div>\n" +
                                "</li>";
                        }
                        $(".f-inner ul").html(html);
                    }
                }
                $('body').mLoading("hide");
            }
        })
    }

    function getOntologyType() {
        $.ajax({
            url: "instance/getInstanceOntologyType",
            dataType: "json",
            success: function (res) {
                if (res.code == 200) {
                    var relaArr = res.data;
                    var html = "";
                    for (var i = 0; i < relaArr.length; i++) {
                        html += "<option value='" + relaArr[i].type + "'>" + relaArr[i].name + "</option>";
                    }
                    $("#relationType").append(html);
                } else {
                    mmodalAlert("error", "提示", res.message);
                }
            }
        });
    }

    var timer2 = null;
    var page = 1;
    var maxPages = 0;
    $(function () {
        //本体关系
        getOntologyType();

        //滚动条
        $("#scroll").perfectScrollbar();

        //初始化数据
        getInstanceList();
        //初始化分页
        $(window).scroll(function (e) {
            var wH = $(window).height();
            var wT = $(window).scrollTop();
            var bH = $(".f-content").height();
            clearTimeout(timer2);
            timer2 = setTimeout(function () {
                if (Math.abs(bH - wH - wT) <= 102) {//下滚(若修改页面元素高度则需调整此判断)
                    page++;
                    $.ajax({
                        url: "instance/getInstanceData",
                        type: "POST",
                        dataType: "json",
                        data: {
                            instanceKey: $("#instanceKey").val(),
                            pageNum: page,
                            pageSize: 10
                        },
                        success: function (res) {
                            // debugger;
                            // $(".f-inner ul").empty();
                            if (res.code == 200) {
                                if (res.data.content == undefined || res.data.content == null || res.data.content.length < 1) {
                                    //无返回数据
                                    return;
                                } else {
                                    var baseinfoArr = res.data.content;
                                    var relationArr = res.relation;
                                    var html = "";
                                    for (var i = 0; i < baseinfoArr.length; i++) {
                                        var objectName = baseinfoArr[i].objectName == null || baseinfoArr[i].objectName == "" ? "无" : baseinfoArr[i].objectName;
                                        var state = baseinfoArr[i].state == null || baseinfoArr[i].state == "" ? "无" : baseinfoArr[i].state;
                                        var modBasis = baseinfoArr[i].modBasis == null || baseinfoArr[i].modBasis == "" ? "无" : baseinfoArr[i].modBasis;
                                        var expireBasis = baseinfoArr[i].expireBasis == null || baseinfoArr[i].expireBasis == "" ? "无" : baseinfoArr[i].expireBasis;
                                        var teamName = baseinfoArr[i].teamName == null || baseinfoArr[i].teamName == "" ? "无" : baseinfoArr[i].teamName;
                                        var lawNum = baseinfoArr[i].lawNum == null || baseinfoArr[i].lawNum == "" ? "无" : baseinfoArr[i].lawNum;
                                        var releaseDate = baseinfoArr[i].releaseDate == null || baseinfoArr[i].releaseDate == "" ? "无" : baseinfoArr[i].releaseDate;
                                        var effectiveDate = baseinfoArr[i].effectiveDate == null || baseinfoArr[i].effectiveDate == "" ? "无" : baseinfoArr[i].effectiveDate;
                                        var effectiveness = baseinfoArr[i].effectiveness == null || baseinfoArr[i].effectiveness == "" ? "无" : baseinfoArr[i].effectiveness;
                                        var level = baseinfoArr[i].level == null || baseinfoArr[i].level == "" ? "无" : baseinfoArr[i].level;
                                        var lawType = baseinfoArr[i].lawType == null || baseinfoArr[i].lawType == "" ? "无" : baseinfoArr[i].lawType;
                                        var rela = relationArr[i].relationData[0] == null || relationArr[i].relationData[0] == undefined || relationArr[i].relationData[0] == "" ? "无" : relationArr[i].relationData[0].value;

                                        var showTitle = objectName;
                                        if (objectName.length > 32) {
                                            showTitle = objectName.substring(0, 32) + "...";
                                        }
                                        html += "<li class=\"f-li\">\n" +
                                        "       <div>\n" +
                                        "           <div class=\"fz-top\">\n" +
                                        "               <div class=\"fz-left\">\n" +
                                        "                   <img src=\"systemManager/images/p2-1-icon1.png\">\n" +
                                        "                   <input hidden value='" + baseinfoArr[i].id + "'> " +
                                        "                   <span>" + showTitle + "</span>\n" +
                                        "               </div>\n" +
                                        "           </div>\n" +
                                        "           <div class='fz-mid'>\n" +
                                        "               <h6>基本信息:</h6>\n" +
                                        "               <div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>标题</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + objectName + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>法规状态</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + state + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>修改依据</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + modBasis + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>失效依据</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + expireBasis + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>发布部门</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + teamName + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>发布文号</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + lawNum + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>发布日期</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + releaseDate + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>实施日期</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + effectiveDate + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>时效性</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + effectiveness + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>法规效力级别</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + level + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "                   <div class=\"method\">\n" +
                                        "                       <div class=\"obj-left\"><span>法规类别</span></div>\n" +
                                        "                       <div class=\"obj-right\"><span>" + lawType + "</span></div>\n" +
                                        "                   </div>\n" +
                                        "               </div>" +
                                        "           </div>" +
                                        "           <div class=\"fz-bott\">\n" +
                                        "               <div class=\"fz-left\">" +
                                        "                   <span>属性:</span>" +
                                        "                   <b  style=\"cursor: pointer;\" onclick='showLawType(\"" + baseinfoArr[i].id + "\");'>" + lawType + "<img src=\"systemManager/images/p1-1-icon2.png\"></b>" +
                                        "               </div>" +
                                        "           <div class=\"fz-right\">" +
                                        "               <span>本体关系:</span>" +
                                        "               <b style=\"cursor: pointer;\" onclick='showRelation(\"" + baseinfoArr[i].id + "\");'>" + rela + "<img src=\"systemManager/images/p1-1-icon2.png\"></b>" +
                                            "           </div>" +
                                            "       </div>" +
                                            "   </div>" +
                                            "</li>";
                                    }
                                    $(".f-inner ul").append(html);
                                }

                            }
                        }


                    });
                    if (page >= maxPages) {//检测没有下一页数据
                        $(".drop-down-load").addClass("no-more");//改变底部提示文字
                    } else {
                        $(".drop-down-load").removeClass("no-more");
                    }
                }
            }, 800);
        });
    });

    function showLawType(objId) {
        $("#updateId").val(objId);
        $("#typeModal").show();
    }

    function showRelation(objId) {
        $("#updateRelationId").val(objId);
        $("#relationsModal").show();
    }

    function updateObjectType() {
        $('body').mLoading("show");
        var id = $("#updateId").val();
        var selected = $("#lawType option:selected");
        $.ajax({
            url: "instance/updateInstanceType",
            data: {
                objectId: id,
                type: selected.text()
            },
            dataType: "json",
            type: "post",
            success: function (res) {
                $('body').mLoading("hide");
                if (res.code == 200) {
                    $("#typeModal").hide();
                    mmodalAlert("success", "提示", "修改成功！");
                } else {
                    mmodalAlert("error", "提示", res.message);
                }
            }
        })
    }

    function updateRelationType() {
        $('body').mLoading("show");
        var id = $("#updateRelationId").val();
        var selected = $("#relationType option:selected");
        $.ajax({
            url: "instance/updateInstanceOntologyType",
            data: {
                objectId: id,
                type: selected.val(),
                name: selected.text()
            },
            dataType: "json",
            type: "post",
            success: function (res) {
                $('body').mLoading("hide");
                if (res.code == 200) {
                    $("#relationsModal").hide();
                    mmodalAlert("success", "提示", "修改成功！");
                } else {
                    mmodalAlert("error", "提示", res.message);
                }
            }
        })
    }

    $(".js-cancel").click(function () {
        $(this).parents(".mmodal").hide();
    });

    function showAddBaseinfo() {
        $("#add").show();
        // $("#m2").show();
    }

    function addBaseinfo() {

        if ($("#objectName").val() == undefined || $("#objectName").val() == null || $("#objectName").val() == "") {
            mmodalAlert('success', '提示', '添加失败,请输入法规名称！');

            return;
        }

        $('body').mLoading("show");
        var data = $("#newLawForm").serialize();
        $.ajax({
            url: "instance/addInstanceData",
            type: "post",
            dataType: "json",
            data: data,
            success: function (res) {
                $('body').mLoading("hide");
                if (res.code == 200) {
                    $("#add").hide();
                    mmodalAlert("success", "提示", "添加成功！");
                } else {
                    mmodalAlert("error", "提示", res.code + ",添加失败！");
                }
            }
        });
    }

    $(function () {
        $(".f-li dd").click(function () {
            if ($(this).hasClass("clicked")) {
                $(this).removeClass("clicked");
                $(".modal").hide(300);
            } else {
                $(".f-li dd").filter(".clicked").removeClass("clicked");
                $(this).addClass("clicked");

                var x = $(this).position().left;
                var y = $(this).position().top;
                var w = $(this).outerWidth(true);
                var txt = $(this).text();
                var width = $(".modal").outerWidth();
                var idx = $(this).parents(".f-li").index();

                $("#modal_title").text(txt);
                if (idx % 2) {
                    $(".modal").removeClass("leftside").addClass("rightside");
                    $(".modal").animate({opacity: 0}, 100).animate({
                        left: x - width - 12,
                        top: y - 10,
                        opacity: 1
                    }, 300);
                    $(".modal").show(100);
                } else {
                    $(".modal").removeClass("rightside").addClass("leftside");
                    $(".modal").animate({opacity: 0}, 100).animate({left: x + w, top: y - 10, opacity: 1}, 300);
                    $(".modal").show(100);
                }
            }
        })
    })
</script>
</html>
