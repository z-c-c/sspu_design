<%@ page import="com.zcc.manager.usermanager.entity.UserInfoEntity" %>
<%@ page import="com.zcc.commons.utils.ConstUtil" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    UserInfoEntity currentPerson = (UserInfoEntity) session.getAttribute("currentPerson");
%>
<%
    if (!ConstUtil.USER_TYPE_ONE.equals(currentPerson.getType())) {

%>
<script>
    window.location.href = '/managerLogin';
</script>
<%
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>div</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/spectrum.css">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/page.css" charset="UTF-8">
    <link rel="stylesheet" href="../../systemManager/css/jquery.mloading.css">
    <script type="text/javascript" src="../../systemManager/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../systemManager/js/jquery.mloading.js"></script>
    <script type="text/javascript" src="../../systemManager/js/pop.js"></script>
    <script type="text/javascript" src="../../systemManager/js/spectrum.js"></script>
    <script type="text/javascript" src="../../js/jquery.mousewheel.js"></script>

    <style type="text/css">
        .tagbtn {
            width: 43px;
            height: 22px;
            background-color: #479bfd;
            border-radius: 4px;
            background: #479bfd;
            color: #fff;
            line-height: 26px;
        }

        .modal-inputset select {
            margin-left: 14px;
            width: 300px;
        }

        .drop-down-load:after {
            display: inline;
            content: "下滑加载更多";
        }

        .drop-down-load.no-more:after {
            content: "所有数据加载完毕";
        }

        input::-webkit-input-placeholder { /* WebKit browsers */
            opacity: 0.5;

        }

        #search {
            width: 440px;
            height: 40px;
            border: none; /*取消默认的边框以设置自定义边框*/
            outline: none; /*取消浏览器默认的蓝光边框以设置自定义的输入框*/
            font-size: 16px;
            color: rgb(112, 112, 112);
            margin-left: 10px;

        }

        .searchbar { /*目的是设置自定义边框，比如圆角与阴影*/
            border: rgb(218, 218, 218) solid 1px;
            border-radius: 2em;
            width: 515px;
            height: 42px;
            box-shadow: 0px 0px 5px rgb(212, 212, 212);
            margin: 0 auto;

            margin-left: 25%;


        }

        .searchbar img {
            vertical-align: -11px;
        }

        .mcp {
            height: 35px;
        }

        .mg {
            height: 25px;
            margin-left: 15px;
        }

        #search, .mcp, .mg {
            vertical-align: middle;
        }

        input:-webkit-autofill, textarea:-webkit-autofill, select:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px #ffffff inset
        }
    </style>
    <script type="text/javascript">
        var timer2 = null;
        var page = 1;
        var maxPages = 0;
        var loadFlag = true;
        $(function () {

            getTagList();
            $(".js-cancel").click(function () {
                $(this).parents(".mmodal").hide();
                loadFlag = true;
            });
            $(".nav-box li").click(function () {
                $(this).addClass("clicked").siblings().removeClass("clicked");
            });


            //初始化调色板
            $(".full").spectrum({
                allowEmpty:true,
                color: "#ECC",
                showInput: true,
                containerClassName: "full-spectrum",
                showInitial: true,
                showPalette: true,
                showSelectionPalette: true,
                showAlpha: true,
                maxPaletteSize: 10,
                preferredFormat: "hex",
                localStorageKey: "spectrum.demo",
                // move: function (color) {
                //     updateBorders(color);
                // },
                show: function () {

                },
                beforeShow: function () {

                },
                // hide: function (color) {
                //     updateBorders(color);
                // },

                palette: [
                    ["rgb(0, 0, 0)", "rgb(67, 67, 67)", "rgb(102, 102, 102)", /*"rgb(153, 153, 153)","rgb(183, 183, 183)",*/
                        "rgb(204, 204, 204)", "rgb(217, 217, 217)", /*"rgb(239, 239, 239)", "rgb(243, 243, 243)",*/ "rgb(255, 255, 255)"],
                    ["rgb(152, 0, 0)", "rgb(255, 0, 0)", "rgb(255, 153, 0)", "rgb(255, 255, 0)", "rgb(0, 255, 0)",
                        "rgb(0, 255, 255)", "rgb(74, 134, 232)", "rgb(0, 0, 255)", "rgb(153, 0, 255)", "rgb(255, 0, 255)"],
                    ["rgb(230, 184, 175)", "rgb(244, 204, 204)", "rgb(252, 229, 205)", "rgb(255, 242, 204)", "rgb(217, 234, 211)",
                        "rgb(208, 224, 227)", "rgb(201, 218, 248)", "rgb(207, 226, 243)", "rgb(217, 210, 233)", "rgb(234, 209, 220)",
                        "rgb(221, 126, 107)", "rgb(234, 153, 153)", "rgb(249, 203, 156)", "rgb(255, 229, 153)", "rgb(182, 215, 168)",
                        "rgb(162, 196, 201)", "rgb(164, 194, 244)", "rgb(159, 197, 232)", "rgb(180, 167, 214)", "rgb(213, 166, 189)",
                        "rgb(204, 65, 37)", "rgb(224, 102, 102)", "rgb(246, 178, 107)", "rgb(255, 217, 102)", "rgb(147, 196, 125)",
                        "rgb(118, 165, 175)", "rgb(109, 158, 235)", "rgb(111, 168, 220)", "rgb(142, 124, 195)", "rgb(194, 123, 160)",
                        "rgb(166, 28, 0)", "rgb(204, 0, 0)", "rgb(230, 145, 56)", "rgb(241, 194, 50)", "rgb(106, 168, 79)",
                        "rgb(69, 129, 142)", "rgb(60, 120, 216)", "rgb(61, 133, 198)", "rgb(103, 78, 167)", "rgb(166, 77, 121)",
                        /*"rgb(133, 32, 12)", "rgb(153, 0, 0)", "rgb(180, 95, 6)", "rgb(191, 144, 0)", "rgb(56, 118, 29)",
                        "rgb(19, 79, 92)", "rgb(17, 85, 204)", "rgb(11, 83, 148)", "rgb(53, 28, 117)", "rgb(116, 27, 71)",*/
                        "rgb(91, 15, 0)", "rgb(102, 0, 0)", "rgb(120, 63, 4)", "rgb(127, 96, 0)", "rgb(39, 78, 19)",
                        "rgb(12, 52, 61)", "rgb(28, 69, 135)", "rgb(7, 55, 99)", "rgb(32, 18, 77)", "rgb(76, 17, 48)"]
                ]
            });

            $(window).mousewheel(function (event) {
                if (loadFlag) {
                    if (event.deltaY < 0) {
                        if (page < maxPages) {
                            $('body').mLoading("show");
                        }
                        clearTimeout(timer2);
                        timer2 = setTimeout(function () {
                            if (page < maxPages) {
                                page++;
                                //ajax访问请求
                                $.ajax({
                                    type: "POST",
                                    url: "/tagBaseInfo/findTagWithPage",
                                    dataType: 'json',
                                    data: {
                                        tagName: $("#search").val(),
                                        tagLabelType: $("#searchLabelType").val(),
                                        page: page,
                                        pageSize: 30,
                                    },
                                    success: function (data) {
                                        if (data.code == 'success') {
                                            var tags = data.data.tags;
                                            $("#totle").text("(" + data.data.total + "条)");
                                            maxPages = Math.ceil(data.data.total / 30);
                                            var str = '';
                                            for (var i = 0; i < tags.length; i++) {
                                                var tagCssCode
                                                if (tags[i].tagCssCode === null || tags[i].tagCssCode.trim().length == 0) {
                                                    tagCssCode = JSON.parse('{"color":"red"}');
                                                } else {
                                                    tagCssCode = JSON.parse(tags[i].tagCssCode);
                                                }
                                                var tagCssCode = JSON.parse(tags[i].tagCssCode);
                                                str = '<dd style="background-color: ' + tagCssCode.color + ';color: white;font-size: 10px" onclick="tagClick($(this),\'' + tags[i].tagId + '\')">' + tags[i].tagName + '</dd>';
                                                $("#tags").append(str);
                                            }
                                            $('body').mLoading("hide");
                                        }
                                    }
                                });
                                if (page >= maxPages) {//检测没有下一页数据
                                    $(".drop-down-load").addClass("no-more");//改变底部提示文字
                                } else {
                                    $(".drop-down-load").removeClass("no-more");
                                }
                            }
                        }, 50);
                    }
                }

            });
        });

        function colorRGBtoHex(color) {
            var rgb = color.split(',');
            var r = parseInt(rgb[0].split('(')[1]);
            var g = parseInt(rgb[1]);
            var b = parseInt(rgb[2].split(')')[0]);
            var hex = "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
            return hex;
        }

        //获取数据列表
        function getTagList(tagLabelType) {

            $("#m4").hide();
            $("#tags").find('dd').removeClass('clicked');
            $("#searchLabelType").val(tagLabelType);
            $("#tagType").text('全部标签');
            if (tagLabelType === 'person') {
                $("#tagType").text('人员标签');
            }
            if (tagLabelType === 'event') {
                $("#tagType").text('事件标签');
            }
            if (tagLabelType === 'unit') {
                $("#tagType").text('单位标签');
            }
            page = 1;
            $('body').mLoading("show");
            $("#tags").empty();
            $.ajax({
                type: "POST",
                url: "/tagBaseInfo/findTagWithPage",
                dataType: 'json',
                data: {
                    tagName: $("#search").val(),
                    tagLabelType: tagLabelType,
                    page: 1,
                    pageSize: 30,
                },
                success: function (data) {
                    if (data.code == 'success') {
                        var tags = data.data.tags;
                        $("#totle").text("(" + data.data.total + "条)");
                        maxPages = Math.ceil(data.data.total / 30);
                        var str = '';
                        for (var i = 0; i < tags.length; i++) {
                            var tagCssCode
                            if (tags[i].tagCssCode === null || tags[i].tagCssCode.trim().length == 0) {
                                tagCssCode = JSON.parse('{"color":"red"}');
                            } else {
                                tagCssCode = JSON.parse(tags[i].tagCssCode);
                            }
                            var tagCssCode = JSON.parse(tags[i].tagCssCode);
                            str = '<dd style="background-color: ' + tagCssCode.color + ';color: white;font-size: 10px" onclick="tagClick($(this),\'' + tags[i].tagId + '\')">' + tags[i].tagName + '</dd>';
                            $("#tags").append(str);
                        }
                        if (page >= maxPages) {//检测没有下一页数据
                            $(".drop-down-load").addClass("no-more");//改变底部提示文字
                        } else {
                            $(".drop-down-load").removeClass("no-more");
                        }
                        $('body').mLoading("hide");

                    }
                }
            });
        }

        function tagClick(thisDom, id) {
            $("#StagID").val(id);
            if (thisDom.hasClass("clicked")) {
                thisDom.removeClass("clicked");
                $(".modal").hide(300);
            } else {
                $(".f-li dd").filter(".clicked").removeClass("clicked");
                thisDom.addClass("clicked");
                var x = thisDom.position().left;
                var y = thisDom.position().top;
                var w = thisDom.outerWidth(true);
                var txt = thisDom.text();
                var width = $(".modal").outerWidth();
                var idx = thisDom.parents(".f-li").index();
                $("#modal_title").text(txt);
                $.ajax({
                    type: 'post',
                    url: '/tagBaseInfo/findTagById',
                    dataType: 'json',
                    data: {
                        tagId: id
                    },
                    success: function (result) {
                        if (result.code == 'success') {
                            var tag = result.data;
                            $("#showTagExplain").text(judgeNull(tag.tagExplain));
                            $("#showTagColor").css("background-color", JSON.parse(tag.tagCssCode).color);
                            if (tag.tagLabelType == 'person') {
                                $("#showTagLabelType").text("人员");
                            }
                            if (tag.tagLabelType == 'event') {
                                $("#showTagLabelType").text("事件");
                            }
                            if (tag.tagLabelType == 'unit') {
                                $("#showTagLabelType").text("单位");
                            }
                        }
                    }
                })
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
        }

        function tagShow(flag) {
            loadFlag = false;
            $("#tagName").val('');
            $("#tagExplain").val('');
            $("#tagLabelType").val('person');
            //修改
            if (flag) {
                $.ajax({
                    type: 'post',
                    url: '/tagBaseInfo/findTagById',
                    dataType: 'json',
                    data: {
                        tagId: $('#StagID').val()
                    },
                    success: function (result) {

                        if (result.code == 'success') {
                            var tag = result.data;
                            $("#tagName").val(tag.tagName);
                            $("#tagExplain").val(judgeNull(tag.tagExplain));
                            $("#tagLabelType").val(tag.tagLabelType);
                            var color = JSON.parse(tag.tagCssCode).color;
                            $("#addColorDiv").find("div[class='sp-preview-inner']").css("background-color", color)
                        }
                    }
                })
            } else {
                $('#StagID').val('');
            }
            $("#m1").show();
        }

        function judgeNull(str) {
            if (str == null || str == '' || str == 'null' || str == undefined || str == 'undefined') {
                return '无';
            }
            return str;
        }

        //保存
        function save() {

            $('body').mLoading("show");
            $('body').mLoading({text: '保存中'});

            var tagCssCode = {};
            if ($("#addColorDiv").find("div[class='sp-preview-inner']").css("background-color") == undefined) {
                tagCssCode.color = "";
            } else {
                tagCssCode.color = colorRGBtoHex($("#addColorDiv").find("div[class='sp-preview-inner']").css("background-color"));
            }
            $.ajax({
                type: 'post',
                url: '/tagBaseInfo/saveTag',
                dataType: 'json',
                data: {
                    tagId: $("#StagID").val(),
                    tagName: $("#tagName").val(),
                    tagExplain: $("#tagExplain").val(),
                    tagLabelType: $("#tagLabelType").val(),
                    tagCssCode: JSON.stringify(tagCssCode),
                },
                success: function (result) {
                    if (result.code == 'success') {
                        $("#m1").hide();
                        $('body').mLoading("hide");
                        getTagList();
                    }
                }
            });


            // $('body').mLoading("hide");
        }
    </script>
</head>
<body>
<input id="searchLabelType" type="hidden">
<input id="StagID" type="hidden">
<div class="f-content p2-1">
    <div class="f-top">
        <div class="f-title"><span>基本信息管理&nbsp;/&nbsp;</span>标签管理</div>
        <div class="search-box">
            <div class="fz-left" onclick="tagShow()">
                <img src="../../systemManager/images/p2-1-icon4.png">
                <span>新建标签</span>
            </div>
            <div class="searchbar">
                <input type="text" id="search" placeholder="请输入标签名"
                       onkeypress="if(event.keyCode==13){getTagList($('#searchLabelType').val())}"/>
                <%--                <img src=../../images/microphone.png class="mcp">--%>
                <img src=../../images/search.png class="mg" onclick="getTagList()">
            </div>

        <ul class="nav-box">
            <li class="clicked" onclick="getTagList()">全部</li>
            <li onclick="getTagList('person')">人员标签</li>
            <li onclick="getTagList('unit')">单位标签</li>
            <li onclick="getTagList('event')">事件标签</li>
        </ul>
    </div>
    <div class="f-bott">
        <div class="inner-title">搜索结果<span id="totle" style="color: #479bfd;">(0条)</span></div>
        <div class="f-inner">
            <ul id="tagUl">
                <li style="width: 100%" id="'+resultList[i].objectId+'" class="f-li">
                    <div>
                        <div class="fz-top">
                            <div title="各种标签" class="fz-left"
                                 style="width: 80%;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">
                                <img src="../../systemManager/images/p2-1-icon1.png">
                                <span id="tagType">标签</span><span style="color: #479bfd;"></span>
                            </div>
                        </div>
                        <div class='fz-mid'>
                            <dl class="tags" id="tags">
                                <%--                                <dt onclick="tagShow()">--%>
                                <%--                                    <img src="../../systemManager/images/p2-1-icon2.png" alt=""/>--%>
                                <%--                                </dt>--%>
                            </dl>
                        </div>
                        <div class="fz-bott"></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="m1" class="mmodal">
    <div class="modal-form">
        <div class="modal-title">
            <img class="modal-title__img" src="../../systemManager/images/modal2.png"/>
            <span class="modal-title__span">标签信息</span>
            <img class="modal-title__cancel js-cancel"
                 src="../../systemManager/images/modal4.png"/>
        </div>
        <form class="modal-content">
            <div class="modal-inputset">
                <label class="modal-label">标签名称</label>
                <input class="modal-inputset__input" id="tagName" required/>
            </div>
            <div class="modal-inputset" id="wordContentdiv">
                <label class="modal-label" style="display: block;">标签描述</label>
                <textarea id="tagExplain" class="modal-inputset__input"
                          style="margin-top: -21px;margin-left: 75px;height: 100px;"></textarea>
            </div>
            <div class="modal-inputset">
                <label class="modal-label">标注对象</label>
                <select id="tagLabelType" class="modal-inputset__input" style="margin-left: 0px;width: 350px">
                    <option value="person">人员</option>
                    <option value="unit">单位</option>
                    <option value="event">事件</option>
                </select>
            </div>
            <div class="modal-inputset" id="addColorDiv">
                <label class="modal-label  modal-label--strong">标签颜色</label>
                <input class="modal-inputset__input full" id="tagCssCode"/>
            </div>
        </form>
        <div id="buttons" class="modal-buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="save()">保存</div>
        </div>
    </div>
</div>

<div id="jiafeng" class="drop-down-load">
    <div class="loading">
        <i></i><i></i><i></i><i></i>
    </div>
</div>
<div id="m3" class="mmodal">
    <div class="modal-pop">
        <div class="modal-title">
            <img class="modal-title__img" id="alertImg" src="../../systemManager/images/modal1.png"/>
            <span class="modal-title__span" id="alertTitle">提示</span>
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

<div class="modal" id="m4">
    <div class="fz-top">
        <div class="fz-left">
            <img src="../images/p2-1-icon3.png">
            <span id="modal_title"></span>
        </div>
    </div>
    <div class="fz-bott">
        <h6>标签描述:</h6>
        <dl class="tags">
            <dd id="showTagExplain"></dd>
        </dl>
        <div class="f-block">
            <span>标签颜色:</span>
            <b><span style="background-color: red"
                     id="showTagColor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></b>
        </div>
        <div class="f-block">
            <span>标签标注对象:</span>
            <b id="showTagLabelType">人员<img src="../images/p1-1-icon2.png"></b>
        </div>
        <button id="sc" class="tagbtn" style="margin-left: 80px;background-color: red" onclick="del()">删&nbsp;除</button>
        <button id="xg" class="tagbtn" style="margin-left: 10px;" onclick="tagShow(true)">修&nbsp;改</button>
    </div>
</div>
</body>
<script>

    function del() {
        // mmodalConfirm("","提示","删除！");
        mmodalConfirm("", "提示", "是否删除", function (e) {
            if (e) {

                $.ajax({
                    type: 'post',
                    url: '/tagBaseInfo/delTag',
                    dataType: 'json',
                    data: {
                        tagId: $("#StagID").val()
                    },
                    success: function (result) {
                        if (result.code == 'success') {
                            mmodalConfirm("", "提示", "删除成功！");
                            $("#m4").hide();
                            getTagList();
                        }
                    }
                })

            }
        })
    }
</script>
</html>