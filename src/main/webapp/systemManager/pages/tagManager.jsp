<%@ page import="com.zcc.manager.usermanager.entity.UserInfoEntity" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
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
            content: "下拉加载更多";
        }

        .drop-down-load.no-more:after {
            content: "所有数据加载完毕";
        }

        input::-webkit-input-placeholder { /* WebKit browsers */
            opacity: 0.5;

        }
    </style>
    <script type="text/javascript">
        var timer2 = null;
        var page = 1;
        var maxPages = 0;
        $(function () {
            $(".js-cancel").click(function () {
                $(this).parents(".mmodal").hide();
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
                move: function (color) {
                    updateBorders(color);
                },
                show: function () {

                },
                beforeShow: function () {

                },
                hide: function (color) {
                    updateBorders(color);
                },

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
            //标签点击事件
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
            });
            // getTagList();
            // isNeedCutWord();

            $(window).scroll(function (e) {
                var wH = $(window).height();
                var wT = $(window).scrollTop();
                var bH = $(".f-content").height();
                clearTimeout(timer2);
                timer2 = setTimeout(function () {
                    if (Math.abs(bH - wH - wT) <= 100) {//下滚(若修改页面元素高度则需调整此判断)
                        page++;
                        //ajax访问请求
                        $.ajax({
                            type: "POST",
                            url: "wordManager/getTagList",
                            dataType: 'json',
                            data: {
                                title: $("#content").val(),
                                pageNumber: page,
                                pageSize: 6,
                            },
                            success: function (data) {
                                if (data.message == 'success') {
                                    var resultList = data.resultList.content;
                                    var str = '';
                                    for (var i = 0; i < resultList.length; i++) {
                                        var tagstr = '';
                                        var tagarr = resultList[i].content.split(",");
                                        for (var t = 0; t < tagarr.length; t++) {
                                            tagstr += '<dd id="' + resultList[i].objectId + t + '" onclick="updateTag(\'' + resultList[i].objectId + '\',\'' + resultList[i].objectId + t + '\')">' + tagarr[t] + '</dd>\n';
                                        }
                                        str += ' <li style="width: 100%" id="' + resultList[i].objectId + '" class="f-li">\n' +
                                            '                    <div>\n' +
                                            '                        <div class="fz-top">\n' +
                                            '                            <div title="' + resultList[i].objectName + '" class="fz-left" style="width: 80%;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">\n' +
                                            '                                <img src="../../systemManager/images/p2-1-icon1.png">\n' +
                                            '                               <span>' + resultList[i].objectName + '</span><span style="color: #479bfd;">[' + tagarr.length + '个]</span>\n' +
                                            '                            </div>\n' +
                                            '                        </div>\n' +
                                            '                        <div class=\'fz-mid\'>\n' +
                                            '                            <dl class="tags">\n' + tagstr +
                                            '                                <dt id="' + resultList[i].objectId + 'add' + '" onclick="addTag()"><img src="../../systemManager/images/p2-1-icon2.png"/></dt>\n' +
                                            '                            </dl>\n' +
                                            '                        </div>\n' +
                                            '                        <div class="fz-bott"></div>\n' +
                                            '                    </div>\n' +
                                            '                </li>';
                                    }
                                    $("#tagUl").append(str)
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
        //rgb转为16进制(不是ie的情况下)
        function colorChange(rgb) {
            // var rgb = dom.css('background-color');
            if(!$.browser.msie){
                rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
                function hex(x) {
                    return ("0" + parseInt(x).toString(16)).slice(-2);
                }
                rgb= "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
            }
            return rgb;
        }
        //获取数据列表
        function getTagList() {
            // $('body').mLoading("show");
            $("#tagUl").html("");
            $.ajax({
                type: "POST",
                url: "/tagBaseInfo/findAllTag",
                dataType: 'json',
                // data: {
                //     title: $("#content").val(),
                //     pageNumber: 1,
                //     pageSize: 6,
                // },
                success: function (data) {
                    console.log(data)
                    // if (data.message == 'success') {
                    //     var resultList = data.resultList.content;
                    //     $("#totle").text("(" + data.resultList.totalElements + "条)");
                    //     maxPages = data.resultList.totalPages;
                    //     var str = '';
                    //     for (var i = 0; i < resultList.length; i++) {
                    //         var tagstr = '';
                    //         var tagarr = resultList[i].content.split(",");
                    //         for (var t = 0; t < tagarr.length; t++) {
                    //             tagstr += '<dd id="' + resultList[i].objectId + t + '" onclick="updateTag(\'' + resultList[i].objectId + '\',\'' + resultList[i].objectId + t + '\')">' + tagarr[t] + '</dd>\n';
                    //         }
                    //         str += ' <li style="width: 100%" id="' + resultList[i].objectId + '" class="f-li">\n' +
                    //             '                    <div>\n' +
                    //             '                        <div class="fz-top">\n' +
                    //             '                            <div title="' + resultList[i].objectName + '" class="fz-left" style="width: 80%;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">\n' +
                    //             '                                <img src="../../systemManager/images/p2-1-icon1.png">\n' +
                    //             '                                <span>' + resultList[i].objectName + '</span><span style="color: #479bfd;">[' + tagarr.length + '个]</span>\n' +
                    //             '                            </div>\n' +
                    //             '                        </div>\n' +
                    //             '                        <div class=\'fz-mid\'>\n' +
                    //             '                            <dl class="tags">\n' + tagstr +
                    //             '                                <dt id="' + resultList[i].objectId + 'add' + '" onclick="addTag(\'' + resultList[i].objectId + '\')"><img src="../../systemManager/images/p2-1-icon2.png"/></dt>\n' +
                    //             '                            </dl>\n' +
                    //             '                        </div>\n' +
                    //             '                        <div class="fz-bott"></div>\n' +
                    //             '                    </div>\n' +
                    //             '                </li>';
                    //     }
                    //     $("#tagUl").html(str);
                    //     if (page >= maxPages) {//检测没有下一页数据
                    //         $(".drop-down-load").addClass("no-more");//改变底部提示文字
                    //     } else {
                    //         $(".drop-down-load").removeClass("no-more");
                    //     }
                    //     $('body').mLoading("hide");
                    // }

                }
            });
        }

        function addTag() {
            $("#m1").show();
        }

        //切词
        function cut() {
            $('body').mLoading("show");
            $('body').mLoading({text: '保存中'});
            // $('body').mLoading("hide");
        }
    </script>
</head>
<body>
<input id="quxiaoid" type="hidden">
<input id="tagTabId" type="hidden">
<div class="f-content p2-1">
    <div class="f-top">
        <div class="f-title"><span>知识库管理&nbsp;/&nbsp;</span>数据标签管理</div>
        <div class="search-box">
            <div class="fz-left" onclick="addTag()">
                <img src="../../systemManager/images/p2-1-icon4.png">
                <span>新建标签</span>
            </div>
            <div class="fz-right">
                <img src="../../systemManager/images/p2-1-icon5.png">
                <input id="content" placeholder="请输入标签名"/>
                <button onclick="getTagList()">搜索</button>
            </div>
        </div>

        <ul class="nav-box">
            <li class="clicked">全部</li>
            <li>人员标签</li>
            <li>单位标签</li>
            <li>事件标签</li>
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
                                <span>各种标签</span><span style="color: #479bfd;">100个</span>
                            </div>
                        </div>
                        <div class='fz-mid'>
                            <dl class="tags">
                                <dd style="background-color: red;color: white;font-size: 10px">标签一标签标签标签标签标签</dd>
                                <dd onclick="updateTag()">标签一标签</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dd onclick="updateTag()">标签一</dd>
                                <dt onclick="addTag()">
                                    <img src="../../systemManager/images/p2-1-icon2.png" alt=""/>
                                </dt>
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
                <input class="modal-inputset__input"  name="objectName" required/>
            </div>
            <div class="modal-inputset" id="wordContentdiv">
                <label class="modal-label" style="display: block;">标签描述</label>
                <textarea id="wordContent" class="modal-inputset__input" style="margin-top: -21px;margin-left: 75px;height: 100px;"></textarea>
            </div>
            <div class="modal-inputset">
                <label class="modal-label">标注对象</label>
                <select id="isUseextWords" class="modal-inputset__input" style="margin-left: 0px;width: 350px">
                    <option value="person">人员</option>
                    <option value="unit">单位</option>
                    <option value="event">事件</option>
                </select>
            </div>
            <div class="modal-inputset" id="addColorDiv">
                <label class="modal-label  modal-label--strong">标签颜色</label>
                <input class="modal-inputset__input full" id="addTagColor"/>
            </div>
        </form>
        <div id="buttons" class="modal-buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="cut()">保存</div>
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
            <span id="modal_title">生活垃圾管理条例</span>
        </div>
    </div>
    <div class="fz-bott">
        <h6>标签描述:</h6>
        <dl class="tags">
            <dd>垃圾源头减量垃圾源头减量垃圾源头减量垃圾源头减量垃圾源头减量垃圾源头减量垃圾源头减量垃圾源头减量垃圾源头减量</dd>
        </dl>
        <div class="f-block">
            <span>标签颜色:</span>
            <b><span style="background-color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></b>
        </div>
        <div class="f-block">
            <span>标签标注对象:</span>
            <b>人员<img src="../images/p1-1-icon2.png"></b>
        </div>
        <button id="sc" class="tagbtn" style="margin-left: 80px;background-color: red" onclick="del('del')">删&nbsp;除</button>
        <button id="xg" class="tagbtn" style="margin-left: 10px;" onclick="addTag()">修&nbsp;改</button>
    </div>
</div>
</body>
<script>

    function del(e) {
        mmodalConfirm("", "提示", "是否删除", function (e) {
            if (e) {
                alert("删除")
            }
        })
    }
</script>
</html>