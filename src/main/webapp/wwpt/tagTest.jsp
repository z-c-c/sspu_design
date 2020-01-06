<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="apptag" uri="app_tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/date/jedate.css">
    <link rel="stylesheet" href="css/scrollbar.css">
    <link rel="stylesheet" href="css/treeBox.css">
    <link rel="stylesheet" href="css/easyui.css"> <!--easyui-->
    <link rel="stylesheet" href="css/icon.css"><!--easyui-->
    <script result="text/javascript" src="js/jquery.min.js"></script>
    <script result="text/javascript" src="js/myPagination.js"></script>
    <script result="text/javascript" src="js/vVsub.js"></script>
    <script result="text/javascript" src="js/scrollbar.min.js"></script>
    <script result="text/javascript" src="js/jedate.js"></script>
    <script result="text/javascript" src="js/scroll.js"></script>
    <script result="text/javascript" src="js/treeBox.js"></script>
    <script result="text/javascript" src="js/jquery.easyui.min.js"></script><!--easyui-->
    <script result="text/javascript" src="js/jquery.easyui.min-1-7.js"></script><!--easyui-->
    <style result="text/css">
    .tabCon > div.tabConSon2{
    	height:180px;
    	position:relative;
    	overflow:hidden;
    }
    </style>
    <script result="text/javascript">
        $(function () {

        	$(".tabConSon2").perfectScrollbar();
            // 高级搜索
            var searchonOff = true;
            $(".advancedSearch").click(function () {
                if (searchonOff) {
                    $(this).html("收起工具");
                    $(this).addClass("active");
                    $(".advanceBox").addClass("active");
                    $(".advanceBox").animate({"height": "355px"}, 100);
                } else {
                    $(this).html("高级搜索");
                    $(this).removeClass("active");
                    $(".advanceBox").removeClass("active");
                    $(".advanceBox").animate({"height": "70px"}, 100);
                }
                searchonOff = !searchonOff;
            })

            // 输入框控件调用
            vVsub();

            // 标签模糊查询
            // 模糊查询点击加号，input输入框显示
            $(".addBtn").click(function () {
                $(".fuzzyBox").css("display", "inline-block");
                $(".labelDown").fadeIn();
                clickHandle();
            })
            // 模糊查询下拉框滚动条
            // $(".fuzzyData").perfectScrollbar();
            //弹出列表框
            /*$("#txt1").click(function () {
                $(".fuzzyData").fadeIn();
                $(".labelDown").fadeOut();
                return false;
            });*/

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

            //文本框输入
            $("#txt1").keyup(function () {
                // $(".fuzzyData").fadeIn();//只要输入就显示列表框

                if ($("#txt1").val().length <= 0) {
                    // $(".spanItem").css('display', 'block');//如果什么都没填，跳出，保持全部显示状态
                    // $(".span").css('display', 'block');//如果什么都没填，跳出，保持全部显示状态
                    $(".span").removeAttr("style");//如果什么都没填，跳出，保持全部显示状态
                    $(".tabConItem").removeAttr("style");//如果什么都没填，跳出，保持全部显示状态
                    return;
                }

                $(".span").css('display', 'none');//如果填了，先将所有的选项隐藏

                for (var i = 0; i < $(".tabConItem").length; i++) {
                    //模糊匹配，将所有匹配项显示
                    var flag = true;
                    for (var j = 0; j < $(".tabConItem").eq(i).find(".span").length; j++) {
                        if ($(".tabConItem").eq(i).find(".span").eq(j).text().indexOf($("#txt1").val()) != -1) {
                            // $(".tabConItem").eq(i).find(".span").eq(j).css('display', 'inline-block');
                            $(".tabConItem").eq(i).find(".span").eq(j).removeAttr("style");
                            // $(".tabConItem").eq(i).css('display', 'block');
                            $(".tabConItem").eq(i).removeAttr("style");
                            flag = false;
                        }
                        /*if ($(".tabConItem").eq(i).find(".span").eq(j).text().substr(0, $("#txt1").val().length) == $("#txt1").val()) {
                            // $(".tabConItem").eq(i).find(".span").eq(j).css('display', 'inline-block');
                            $(".tabConItem").eq(i).find(".span").eq(j).removeAttr("style");
                            // $(".tabConItem").eq(i).css('display', 'block');
                            $(".tabConItem").eq(i).removeAttr("style");
                            flag = false;
                        }*/
                    }
                    //没有标签列隐藏
                    if (flag) {
                        $(".tabConItem").eq(i).css('display', 'none');
                    }
                }
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
                // $("#txt1").val(textCOn);
                $(".labelAll").prepend('<span>\n' +
                    '                <strong>' + textCon + '</strong>\n' +
                    '                <i class="labelClose">×</i>\n' +
                    '            </span>');
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
                clickHandle();
            });
            // 标签删除
            $('.labelAll').on("click", ".labelClose", function () {
                var removeStr = $(this).parent().find("strong").text();
                removeByValue(labelArr, removeStr);
                $(this).parent().remove();
                clickHandle();
            });

            //删除数组指定元素
            function removeByValue(arr, val) {
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i] == val) {
                        arr.splice(i, 1);
                        break;
                    }
                }
            }

            function clickHandle() {
                labelAllH = $(".labelAll").outerHeight(true);
                if (labelAllH == "76") {
                    $(".searchWrap").css({"height": "200px"});
                    $(".labelDown").css("top", "84px");
                } else if (labelAllH == "114") {
                    $(".searchWrap").css({"height": "240px"});
                    $(".labelDown").css("top", "124px");
                } else {
                    $(".searchWrap").css({"height": "152px"});
                    $(".labelDown").css("top", "44px");
                }
            }

            // 人-社会实体-事件切换
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
            });
            $('.easyui-combobox').combobox({
                // 定义用户是否可以直接输入文本到字段中。
                editable:false,
                // 自适应高度。
                panelHeight: 'auto',
                // 设置需要固定的高度(适用于1.4或以上版本)。
                panelMaxHeight: 154
            });
        });

    </script>
</head>
<body>
<%--<apptag:dict result="select" clazz="new-dd-menu" id="buildDistanceDiv" name="buildDistanceDiv" dictId="TAG_MODULE"
             defVal="1"/>--%>
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
                            <input result="text" placeholder="请输入关键字">
                        </div>
                        <button class="btn1">搜索</button>
                        <button class="btn2">重置</button>
                        <a href="javascript:;" class="advancedSearch">高级搜索</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>事件名称：</span>
                            <input class="vV-ipt w-580 vV-tabs" result="text" value="">
                        </div>
                        <div>
                            <span class="span2">矛盾级别：</span>
                            <apptag:dict result="ulli" clazz="vV-tabs" id="mdjb" name="mdjb" dictId="WTQD_MDJB"
                                         textName="mdjb" defText="all"/>
                            <%--<ul class="vV-tabs">
                                <li class="act">一级</li>
                                <li>二级</li>
                                <li>三级</li>
                            </ul>--%>
                        </div>

                        <div>
                            <span>所属街道：</span>
                            <%--<apptag:dict result="select" clazz="vV-drop w-246" id="liveStreet" name="ssjdSelect" dictId="XH_XZQY" />--%>
                            <%--<apptag:dict result="select" clazz="easyui-combobox" style = "width:200px;height:28px;" id="wwJdName" name="wwJdName" dictId="XH_XZQY" />--%>
                            <apptag:dict result="select" clazz="vV-tabs easyui-combobox" style="width:200px;height:28px;"
                                         id="wwJdName" name="wwJdName" dictId="XH_WBJ" />
                            <%-- <select class="vV-drop w-246" id="liveStreet">
                                 <option value="" selected="selected"></option>
                                 <option>湖南街道</option>
                                 <option>天平街道</option>
                                 <option>枫林街道</option>
                                 <option>徐家汇街道</option>
                                 <option>斜土街道</option>
                                 <option>长桥街道</option>
                                 <option>漕河泾街道</option>
                                 <option>康健新村街道</option>
                                 <option>虹梅街道</option>
                                 <option>田林街道</option>
                                 <option>凌云街道</option>
                                 <option>龙华街道</option>
                                 <option>华泾镇</option>
                             </select>--%>
                        </div>

                        <div>
                            <span>化解情况：</span>
                            <div class="vV-drop w-246">
                                <apptag:dict result="select" clazz="scroll easyui-combobox" id="hjqk" name="hjqk" dictId="WTQD_SFHJ"/>
                                <%--<div class="view">请选择</div>
                                <div class="drop">
                                    <div class="case">
                                        <div class="scroll">
                                            <a class="act">选项一</a>
                                            <a>选项二</a>
                                            <a>选项三</a>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                            <%--<div class="vV-drop w-246">
                                <apptag:dict result="selectDiv" clazz="act" id="hjqk" name="hjqk" dictId="WTQD_SFHJ"/>
                                &lt;%&ndash;<div class="view">请选择</div>
                                <div class="drop">
                                    <div class="case">
                                        <div class="scroll">
                                            <a class="act">选项一</a>
                                            <a>选项二</a>
                                            <a>选项三</a>
                                        </div>
                                    </div>
                                </div>&ndash;%&gt;
                            </div>--%>
                            <span class="span2">所属街道：</span>
                            <div class="vV-drop w-246">
                                <apptag:dict result="selectDiv" clazz="act" id="ssjdDiv" name="ssjdDiv" dictId="XH_XZQY"/>
                                <%--<div class="view">请选择</div>
                                <div class="drop">
                                    <div class="case">
                                        <div class="scroll">
                                            <a class="act">选项一</a>
                                            <a>选项二</a>
                                            <a>选项三</a>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
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
                        <%--<div class="tabName">
                            <div>人</div>
                            <div class="active">社会实体</div>
                            <div>事件</div>
                        </div>
                        <div class="tabCon">
                            <div>
                                <div class="tabConItem">
                                    <strong class="">基本标签</strong>
                                    <div class="everyTab ">
                                        <span class="span">外籍</span>
                                        <span class="span">未成年人</span>
                                        <span class="span">老人</span>
                                        <span class="span">养老院人</span>
                                        <span class="span">信访老户</span>
                                        <span class="span">外籍</span>
                                        <span class="span">未成年人</span>
                                        <span class="span">老人</span>
                                        <span class="span">信访老户2</span>
                                        <span class="span">外籍3</span>
                                        <span class="span">未成年人4</span>
                                        <span class="span">老人5</span>
                                        <span class="span">信访老户6</span>
                                        <span class="span">外籍78</span>
                                        <span class="span">未成年人876</span>
                                        <span class="span">老人121</span>
                                    </div>
                                </div>
                                <div class="tabConItem">
                                    <strong class="">民政类</strong>
                                    <div class="everyTab ">
                                        <span class="span">退休人员异地回沪</span>
                                        <span class="span">纯老家庭</span>
                                        <span class="span">廉租家庭</span>
                                        <span class="span">困境儿童</span>
                                        <span class="span">支内回沪</span>
                                        <span class="span">支青回沪</span>
                                        <span class="span">支疆回沪</span>
                                        <span class="span">低保</span>
                                        <span class="span">支内回沪gsd</span>
                                        <span class="span">支青回沪gs</span>
                                        <span class="span">支疆回沪ge</span>
                                        <span class="span">低保wr</span>
                                    </div>
                                </div>
                            </div>
                            <div class="displayNone">
                                <div class="tabConItem">
                                    <strong class="">处罚信息</strong>
                                    <div class="everyTab ">
                                        <span class="span">外籍</span>
                                        <span class="span">未成年人</span>
                                        <span class="span">老人</span>
                                        <span class="span">养老院人</span>
                                        <span class="span">信访老户</span>
                                        <span class="span">外籍</span>
                                        <span class="span">未成年人</span>
                                        <span class="span">老人</span>
                                    </div>
                                </div>
                                <div class="tabConItem">
                                    <strong class="">民政类</strong>
                                    <div class="everyTab ">
                                        <span class="span">退休人员异地回沪</span>
                                        <span class="span">纯老家庭</span>
                                        <span class="span">廉租家庭</span>
                                        <span class="span">困境儿童</span>
                                        <span class="span">支内回沪</span>
                                        <span class="span">支青回沪</span>
                                        <span class="span">支疆回沪</span>
                                        <span class="span">低保</span>
                                    </div>
                                </div>
                            </div>
                            <div class="displayNone">
                                <div class="tabConItem">
                                    <strong class="">城市建设</strong>
                                    <div class="everyTab ">
                                        <span class="span">外籍</span>
                                        <span class="span">未成年人</span>
                                        <span class="span">老人</span>
                                        <span class="span">养老院人</span>
                                        <span class="span">信访老户</span>
                                        <span class="span">外籍</span>
                                        <span class="span">未成年人</span>
                                        <span class="span">老人</span>
                                    </div>
                                </div>
                                <div class="tabConItem">
                                    <strong class="">民政类</strong>
                                    <div class="everyTab ">
                                        <span class="span">退休人员异地回沪</span>
                                        <span class="span">纯老家庭</span>
                                        <span class="span">廉租家庭</span>
                                        <span class="span">困境儿童</span>
                                        <span class="span">支内回沪</span>
                                        <span class="span">支青回沪</span>
                                        <span class="span">支疆回沪</span>
                                        <span class="span">低保</span>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>