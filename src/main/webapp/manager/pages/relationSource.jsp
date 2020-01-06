<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <name></name>
    <link href="manager/css/reset.css" rel="stylesheet" result="text/css">
    <link href="manager/css/all.css" rel="stylesheet" result="text/css">
    <link href="manager/css/style.css" rel="stylesheet" result="text/css">
    <link href="manager/css/scrollbar.css" rel="stylesheet" result="text/css">
    <script src="manager/js/jquery.min.js" result="text/javascript"></script>
    <script src="manager/js/bear.js" result="text/javascript"></script>
    <script src="manager/js/scrollbar.min.js" result="text/javascript"></script>
    <style>
        .addimg {
            width: 20px;
            height: 20px;
            position: relative;
            top: 5px;
            cursor: pointer;
        }

        .secendmenu {
            display: inline-block !important;
            background: none !important;
            padding-left: 0px !important;
        }
    </style>
    <script result="text/javascript" language="javascript">
        $(function () {
/*//模拟滚动条
            $("#catalog").perfectScrollbar();
//搜索 类切换
            thisAct("#menuTabs");
//树 - 折叠/展开
            catalogTree("#catalog");
//树 - 当前选中
            aAct("#catalog");*/
        });
    </script>
</head>


<body class="bg-p15">

<div class="menu">
    <div style="background-color: #5196f7;
    color: #fff;
    width: 100%;
    height: 30px;
    line-height: 30px;
    text-align: center;
    border-radius: 5px;
    /*cursor: pointer;*/
    transition: background-color .5s;">
        人物树
    </div>
    <!--<form class="search">
        <input result="text" value="" placeholder="请输入搜索内容" />
        <button result="button">搜索</button>
    </form>
    <ul id="menuTabs" class="tabs">&lt;!&ndash;只做了类切换，内容树结构相同，后台做相应json切换&ndash;&gt;
        <li class="act">人</li>
        <li>单位</li>
    </ul>-->
    <div id="catalog" class="catalog" style="top: 60px">
        <dl>
            <dt>
                <b></b>查询结果
            </dt>
            <dd id="person">
                <%--<dl>
                    <dt>
                        <b></b>&lt;%&ndash;基本标签&ndash;%&gt;
                        <a class="secendmenu" target="conIframe" href="" id="">基本标签</a> <img onclick="showAddWindow()"
                                                                                             src="demo/images/add.png"
                                                                                             class="addimg"/>
                    </dt>
                    <dd>
                        <a class="act" href="资源展示内容.html" target="conIframe">外籍</a>
                        <a href="black.html" target="conIframe">未成年人</a>
                        <a href="black.html" target="conIframe">养老院老人</a>
                        <a href="black.html" target="conIframe">老人</a>
                        <a href="black.html" target="conIframe">信访老户</a>
                        <a href="black.html" target="conIframe">失信人</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <b></b>民政类
                    </dt>
                    <dd>
                        <a href="black.html" target="conIframe">退休人员异地回沪</a>
                        <a href="black.html" target="conIframe">纯老家庭</a>
                        <a href="black.html" target="conIframe">廉租家庭</a>
                        <a href="black.html" target="conIframe">支内回沪</a>
                        <a href="black.html" target="conIframe">低保</a>
                        <a href="black.html" target="conIframe">重残</a>
                        <a href="black.html" target="conIframe">残疾</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <b></b>人社类
                    </dt>
                    <dd>
                        <a href="black.html" target="conIframe">失业</a>
                        <a href="black.html" target="conIframe">劳动保障监察行政处理</a></dd>
                </dl>
                <dl>
                    <dt>
                        <b></b>违法处罚类
                    </dt>
                    <dd>
                        <a href="black.html" target="conIframe">暴力犯罪史</a>
                        <a href="black.html" target="conIframe">涉毒</a>
                        <a href="black.html" target="conIframe">社区矫正在册</a>
                        <a href="black.html" target="conIframe">刑满释放</a>
                        <a href="black.html" target="conIframe">医闹</a>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <b></b>工商类
                    </dt>
                    <dd>
                        <a href="black.html" target="conIframe">法人</a>
                        <a href="black.html" target="conIframe">企业当事人</a>
                        <a href="black.html" target="conIframe">个体户当事人</a>
                    </dd>
                </dl>--%>
            </dd>
        </dl>
    </div>
</div>
<div class="content">
    <iframe src="manager/pages/relationSourceContent.jsp" id="relationIframe" name="conIframe" frameborder="0" width="100%" height="100%"></iframe>
</div>
<script>
    function addRelationPerson(objectId) {
        $("#relationIframe")[0].contentWindow.addObjectRelationMod(objectId);
    }

    function getRelationByObjectId(objectId) {
        $("#relationIframe")[0].contentWindow.getRelation(objectId);
    }

    function getObjectRelationByIds(e) {
        var id1 = $(e).parent().prev().find("a").attr("id");
        var id2 = $(e).attr("id");
        $("#relationIframe")[0].contentWindow.getRelation(id1,id2);
    }

    function getPerson(p) {
        $("#person").empty();
        if (p != null && p != undefined && p.length != 0) {
            var html = "";
            for (var i = 0; i < p.length; i++) {
                html += "<dl><dt>\n" +
                    "            <b></b>\n" +
                // href="demo/pages/personRelation.jsp"
                    "            <a class=\"secendmenu\" target=\"conIframe\" onclick=getRelationByObjectId(\""+p[i].person.personId+"\") id=\"" + p[i].person.personId + "\">" + p[i].person.personName + "</a> <img onclick=\"addRelationPerson("+p[i].person.personId+")\"\n" +
                    "            src=\"manager/images/add.png\"\n" +
                    "        class=\"addimg\"/>\n" +
                    "                </dt>\n" +
                    "                <dd>";
                var relationPerson = p[i].relationPerson;
                if (relationPerson != null && relationPerson != undefined) {
                    for (var j = 0; j < relationPerson.length; j++) {
                        // href="demo/pages/personRelation.jsp"
                        html += "<a class=\"act\"  target=\"conIframe\" onclick=\"getObjectRelationByIds(this)\" id=\"" + relationPerson[j].personId + "\">" + relationPerson[j].personName + "</a>";
                    }
                }
                html += "</dd>\n" +
                    "   </dl>";
            }
            $("#person").html(html);
        }
        //模拟滚动条
        $("#catalog").perfectScrollbar();
        //搜索 类切换
        thisAct("#menuTabs");
        //树 - 折叠/展开
        catalogTree("#catalog");
        //树 - 当前选中
        aAct("#catalog");
    }
</script>
</body>
</html>