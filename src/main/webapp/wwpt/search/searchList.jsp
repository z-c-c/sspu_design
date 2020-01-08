<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>搜索结果</name>
    <%@ include file="../common/w_include_header.jsp" %>
    <script result="text/javascript" src="../js/getParameter.js"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <style>
        .labelBox {
            max-width: 380px;
            top: 15px;
            right: 0;
            height: 26px;
            overflow: hidden;
            text-align: right;
            display: inline-block;
            line-height: 22px;
            position: absolute;
        }
        .labelBox span {
            margin-top: 1px;
        }
    </style>
    <script result="text/javascript">
        var searchKey = "";

        <%--时间格式化--%>
       /* Date.prototype.Format = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "H+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        };*/

        function searchOneKey(pageNum) {
            if (searchKey == null || searchKey == undefined || searchKey == "") {
                window.location = '../shell.jsp'
            }
            var searchWord = encodeURI(searchKey);

            var searchType = $(".scroll .act").attr("id");

            $.ajax({
                url: "/esSearch/searchOne",
                dataType: "json",
                async: false,
                data: {
                    "searchKey": searchWord,
                    "objectType": searchType,
                    "pageNum": pageNum,
                    "pageSize": 5
                },
                result: "post",
                success: function (res) {
                    if (res.code == "200") {
                        var contentArr = res.data.data;
                        var pageInfo = res.data.page;
                        $(".peoBox").empty();
                        var html = "";
                        for (var i = 0; i < contentArr.length; i++) {
                            var result = contentArr[i].objectType;
                            var objectInfo = contentArr[i].objectInfo;
                            var tag = contentArr[i].tag;
                            if ("event" == result) {
                                var eventId = objectInfo.eventId;
                                var eventName = objectInfo.eventName == null ? "无" : objectInfo.eventName;
                                var eventContent = objectInfo.eventContent == null ? "无" : objectInfo.eventContent;
                                var occurredTime = objectInfo.occurredTime == null ? "无" : new Date(objectInfo.occurredTime.time).Format("yyyy.MM.dd");
                                //onclick=\"goDetailPage('" + eventId + "','event','"+eventName+"')\"
                                html += "<div class=\"pubBlock peoSty\" >" +
                                    "                <p class=\"proName\">" + eventName + "</p>\n" +
                                    "                <p class=\"proInfo\">\n" + eventContent +
                                    "                </p>\n" +
                                    "                <div class=\"infoBox\">\n" +
                                    "                    <div class=\"item\">\n" +
                                    "                        <i></i>\n" +
                                    "                        <span>" + occurredTime + "</span>\n" +
                                    "                    </div>\n" +
                                    "                    <div class=\"item\">\n" +
                                    // "                        <i></i>\n" +
                                    // "                        <a href=\"javascript:;\">数据聚合（5）</a>\n" +
                                    "                    </div>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"labelBox\">\n";
                                if (tag != null && tag.length > 0) {
                                    for (var j = 0; j < tag.length; j++) {
                                        var tagColor = tag[j].tagColorCode;
                                        var tagName = tag[j].tagName;
                                        html += "<span style=\"background: " + tagColor + "\" class=\"green\">" + tagName + "</span>\n";
                                    }
                                }
                                html +=
                                    "                </div>\n" +
                                    "            </div>";
                            } else if ("person" == result) {
                                var personId = objectInfo.personId;
                                var personName = objectInfo.personName == null ? "未知" : objectInfo.personName;
                                var personImage = objectInfo.personImage == null || objectInfo.personImage == "" ? "../images/people.png" : contentArr[i].personImage;
                                var gender = objectInfo.gender == null ? "未知" : objectInfo.gender;
                                var phoneNum = objectInfo.phoneNum == null ? "未知" : objectInfo.phoneNum;
                                var personDocuNum = objectInfo.personDocuNum == null ? "未知" : objectInfo.personDocuNum;
                                var nativePlace = objectInfo.nativePlace == null ? "未知" : objectInfo.nativePlace;
                                var livePlace = objectInfo.livePlace == null ? "未知" : objectInfo.livePlace;
                                //onclick=\"goDetailPage('" + personId + "','" + result + "','"+personName+"')\"
                                html += "<div class=\"pubBlock\" >\n" +
                                    "                <div class=\"peoImg\">\n" +
                                    "                    <img src=\"" + personImage + "\" alt=\"\">\n" +
                                    "                </div>\n" +
                                    "                <div class=\"peoInfo\">\n" +
                                    "                    <div>\n" +
                                    "                        <span class=\"name\">" + personName + "</span>\n" +
                                    "                        <div class=\"label\">\n";
                                if (tag != null && tag.length > 0) {
                                    for (var j = 0; j < tag.length; j++) {
                                        var tagColor = tag[j].tagColorCode;
                                        var tagName = tag[j].tagName;
                                        html += "<span style=\"background: " + tagColor + "\" class=\"green\">" + tagName + "</span>\n";
                                    }
                                }
                                html +=
                                    "                        </div>\n" +
                                    "                    </div>\n" +
                                    "                    <p>\n" +
                                    "                        <span>姓名：</span>\n" +
                                    "                        <strong>" + gender + "</strong>\n" +
                                    "                        <span class=\"ml-60\">电话：</span>\n" +
                                    "                        <strong>" + phoneNum + "</strong>\n" +
                                    "                    </p>\n" +
                                    "                    <p>\n" +
                                    "                        <span>证件号：</span>\n" +
                                    "                        <strong>" + personDocuNum + "</strong>\n" +
                                    "                    </p>\n" +
                                    "                    <p>\n" +
                                    "                        <span>户籍地：</span>\n" +
                                    "                        <strong>" + nativePlace + "</strong>\n" +
                                    "                    </p>\n" +
                                    "                    <p>\n" +
                                    "                        <span>居住地址：</span>\n" +
                                    "                        <strong>" + livePlace + "</strong>\n" +
                                    "                    </p>\n" +
                                    "                </div>\n" +
                                    "            </div>";

                            } else if ("unit" == result) {
                                var unitId = objectInfo.unitId;
                                var unitName = objectInfo.unitName == null ? "无" : objectInfo.unitName;
                                var unitLegelPerson = objectInfo.unitLegelPerson == null ? "无" : objectInfo.unitLegelPerson;
                                var unitIndustry = objectInfo.unitIndustry == null ? "无" : objectInfo.unitIndustry;
                                var usccCode = objectInfo.usccCode == null ? "无" : objectInfo.usccCode;
                                var registerAddr = objectInfo.registerAddr == null ? "无" : objectInfo.registerAddr;
                                // onclick=\"goDetailPage('" + unitId + "','" + result + "')\"
                                html += "<div class=\"pubBlock infoBox-l-item\" >\n" +
                                    "                <div class=\"relatedUnits\">" + unitName + "</div>\n" +
                                    "                <div class=\"label\">\n";
                                if (tag != null && tag.length > 0) {
                                    for (var j = 0; j < tag.length; j++) {
                                        var tagColor = tag[j].tagColorCode;
                                        var tagName = tag[j].tagName;
                                        html += "<span style=\"background: " + tagColor + "\" class=\"green\">" + tagName + "</span>\n";
                                    }
                                }
                                html +=
                                    "                </div>\n" +
                                    "                <div class=\"text\">\n" +
                                    "                    <strong>法定代言人：</strong>\n" +
                                    "                    <span>" + unitLegelPerson + "</span>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"text\">\n" +
                                    "                    <strong>所属行业：</strong>\n" +
                                    "                    <span>" + unitIndustry + "</span>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"text\">\n" +
                                    "                    <strong>统一社会信用代码：</strong>\n" +
                                    "                    <span>" + usccCode + "</span>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"text\">\n" +
                                    "                    <strong>注册地址：</strong>\n" +
                                    "                    <span>" + registerAddr + "</span>\n" +
                                    "                </div>\n" +
                                    /*"                <div class=\"text text2 clearfix\">\n" +
                                    "                    <strong>经营范围：</strong>\n" +
                                    "                    <span>境内外各类建设工程的承包、设计、施工、咨询及配套设备、材料、构件的生产、经营、销售，从事各类货物及技术的进出口业务，建筑技术开发与转让，机械设备租赁，房地产开发经营及咨询，城市基础设施的投资建设，实业投资。</span>\n" +
                                    "                </div>\n" +*/
                                    "            </div>";
                            }
                        }
                        $(".peoBox").html(html);
                        createPage(pageInfo);
                    } else {
                        $.messager.alert('Warning', res.message);
                    }
                }
            });
        }

        function createPage(pageInfo) {
            if (pageInfo != null && pageInfo != undefined && pageInfo != "") {
                var totalPages = pageInfo.totalPages == null ? 0 : pageInfo.totalPages;
                var size = pageInfo.size == null ? 0 : pageInfo.size;
                var totalElements = pageInfo.totalElements == null ? 0 : pageInfo.totalElements;
                var number = pageInfo.number == null ? 0 : pageInfo.number;

                $(".bear-tit h5").text("共有" + totalElements + "条结果");
                // 分页
                new Page({
                    id: 'pagination',
                    pageTotal: totalPages, //必填,总页数
                    pageAmount: size,  //每页多少条
                    dataTotal: totalElements, //总共多少条数据
                    curPage: number + 1, //初始页码,不填默认为1
                    pageSize: 5, //分页个数,不填默认为5
                    showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                    showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                    getPage: function (page) {
                        //获取当前页数
                        console.log(page);
                        //转跳
                        searchOneKey(page);
                    }
                });
            }
        }

        function goDetailPage(id, result,  objName) {
            if ('person' == result) {
                window.open('../person/personDetail.jsp?paId=' + id + '', 'newwindow');
            } else if ('event' == result) {
                window.open("../event/eventDetail.jsp?eventId=" + id + "&eventName=" + objName);
            } else if ('unit' == result) {
                window.open('../person/personDetail.jsp?paId=' + id + '', 'newwindow');
            }
            // window.location.href="index.jsp?sign="+sign;
        }

        $(function () {
            //走正常搜索路线
            searchKey = getParameter("searchKey");
            if (searchKey == null || searchKey == undefined || searchKey == "") {
                window.location = '../shell.jsp'
            }
            searchKey = decodeURI(searchKey);

            searchOneKey(1);

            // 输入框控件调用
            // vVsub();


            $(".vV-drop:not(.dis)").click(function () {
                $(this).addClass("focus").find(".drop").fadeIn(200);
            });
            $(".vV-drop").mouseleave(function () {
                $(this).removeClass("focus").find(".drop").fadeOut(200);
            });
            $(".vV-drop .drop a").click(function () {
                var ckText = $(this).html();
                $(this).addClass("act")
                    .siblings().removeClass("act")
                    .parents(".vV-drop").find(".view").html(ckText);
                searchOneKey(1);
            });
            $(".vV-drop .case").each(function () {
                // $(this).perfectScrollbar();
                $(this).parents(".drop").hide();
            });
            footerChange();
        });


        /*$(window).resize(function () {
            footerChange();
        })*/
        function footerChange() {
            // .index-main高度
            var indexMainH = $(".peopleInfo").outerHeight(true);
            $(".footerBox").css("top", indexMainH + 50);
        }
    </script>
</head>
<body>
<div class="index-main mt-15">
    <div class="bear-block peopleInfo">
        <div class="bear-tit">
            <h5>共有0条结果</h5>
        </div>
        <div class="vV-drop shaixuan">
            <div class="view">筛选</div>
            <div class="drop">
                <div class="case">
                    <div class="scroll">
                        <%--onclick="searchOneKey(1)"--%>
                        <a class="act" id="all" <%--onclick="searchOneKey(1)"--%>>全部</a>
                        <a id="person" <%--onclick="searchOneKey(1)"--%>>人</a>
                        <a id="unit" <%--onclick="searchOneKey(1)"--%>>社会实体</a>
                        <a id="event" <%--onclick="searchOneKey(1)"--%>>重大矛盾</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="peoBox">
            <%--<div class="pubBlock">
                <div class="peoImg">
                    <img src="../images/people.png" alt="">
                </div>
                <div class="peoInfo">
                    <div>
                        <span class="name">孙海</span>
                        <div class="label">
                            <span class="green">劳资纠纷</span>
                            <span class="blue">有市监类行政处罚史</span>
                            <span class="yellow">暴力前科</span>
                            <span class="green">劳资纠纷</span>
                            <span class="blue">有市监类行政处罚史</span>
                            <span class="yellow">暴力前科</span>
                        </div>
                    </div>
                    <p>
                        <span>姓名：</span>
                        <strong>男</strong>
                        <span class="ml-60">电话：</span>
                        <strong>13523523232</strong>
                    </p>
                    <p>
                        <span>证件号：</span>
                        <strong>321009********1111</strong>
                    </p>
                    <p>
                        <span>户籍地：</span>
                        <strong>上海市徐汇区</strong>
                    </p>
                    <p>
                        <span>居住地址：</span>
                        <strong>上海市徐汇区田林14村41号柳州路宜山路</strong>
                    </p>
                </div>
            </div>
            <div class="pubBlock">
                <div class="peoImg">
                    <img src="../images/people.png" alt="">
                </div>
                <div class="peoInfo">
                    <div>
                        <span class="name">孙海</span>
                        <div class="label">
                            <span class="green">劳资纠纷</span>
                            <span class="blue">有市监类行政处罚史</span>
                            <span class="yellow">暴力前科</span>
                        </div>
                    </div>
                    <p>
                        <span>姓名：</span>
                        <strong>男</strong>
                        <span class="ml-60">电话：</span>
                        <strong>13523523232</strong>
                    </p>
                    <p>
                        <span>证件号：</span>
                        <strong>321009********1111</strong>
                    </p>
                    <p>
                        <span>户籍地：</span>
                        <strong>上海市徐汇区</strong>
                    </p>
                    <p>
                        <span>居住地址：</span>
                        <strong>上海市徐汇区田林14村41号柳州路宜山路</strong>
                    </p>
                </div>
            </div>
            <div class="pubBlock infoBox-l-item">
                <div class="relatedUnits">上海建工集团股份有限公司</div>
                <div class="label">
                    <span class="green">劳资纠纷</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                    <span class="green">劳资纠纷</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                </div>
                <div class="text">
                    <strong>法定代言人：</strong>
                    <span>上海建工集团股份有限公司</span>
                </div>
                <div class="text">
                    <strong>所属行业：</strong>
                    <span>孙某、李某、张某、李某、吴某等</span>
                </div>
                <div class="text">
                    <strong>统一社会信用代码：</strong>
                    <span>城市建设</span>
                </div>
                <div class="text">
                    <strong>注册地址：</strong>
                    <span>上海市徐汇区田林14村41号柳州路宜山路</span>
                </div>
                <div class="text text2 clearfix">
                    <strong>经营范围：</strong>
                    <span>境内外各类建设工程的承包、设计、施工、咨询及配套设备、材料、构件的生产、经营、销售，从事各类货物及技术的进出口业务，建筑技术开发与转让，机械设备租赁，房地产开发经营及咨询，城市基础设施的投资建设，实业投资。</span>
                </div>
            </div>
            <div class="pubBlock infoBox-l-item">
                <div class="relatedUnits">上海建工集团股份有限公司</div>
                <div class="label">
                    <span class="green">劳资纠纷</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                    <span class="green">劳资纠纷</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                    <span class="blue">有市监类行政处罚史</span>
                    <span class="yellow">暴力前科</span>
                </div>
                <div class="text">
                    <strong>法定代言人：</strong>
                    <span>上海建工集团股份有限公司</span>
                </div>
                <div class="text">
                    <strong>所属行业：</strong>
                    <span>孙某、李某、张某、李某、吴某等</span>
                </div>
                <div class="text">
                    <strong>统一社会信用代码：</strong>
                    <span>城市建设</span>
                </div>
                <div class="text">
                    <strong>注册地址：</strong>
                    <span>上海市徐汇区田林14村41号柳州路宜山路</span>
                </div>
                <div class="text text2 clearfix">
                    <strong>经营范围：</strong>
                    <span>境内外各类建设工程的承包、设计、施工、咨询及配套设备、材料、构件的生产、经营、销售，从事各类货物及技术的进出口业务，建筑技术开发与转让，机械设备租赁，房地产开发经营及咨询，城市基础设施的投资建设，实业投资。</span>
                </div>
            </div>
            <div class="pubBlock peoSty">
                <p class="proName">复旦大学第三附属学校一期工程</p>
                <p class="proInfo">
                    项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮
                </p>
                <div class="infoBox">
                    <div class="item">
                        <i></i>
                        <span>2019.08.26</span>
                    </div>
                    <div class="item">
                        <i></i>
                        <a href="javascript:;">数据聚合（5）</a>
                    </div>
                    <div class="item">
                        <i></i>
                        <a href="javascript:;">工作动态（3）</a>
                    </div>
                </div>
                <div class="labelBox">
                    <span class="green">重大工程</span>
                    <span class="red">噪音</span>
                    <span class="yellow">建筑垃圾</span>
                </div>
            </div>
            <div class="pubBlock peoSty">
                <p class="proName">复旦大学第三附属学校一期工程</p>
                <p class="proInfo">
                    项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮
                </p>
                <div class="infoBox">
                    <div class="item">
                        <i></i>
                        <span>2019.08.26</span>
                    </div>
                    <div class="item">
                        <i></i>
                        <a href="javascript:;">数据聚合（5）</a>
                    </div>
                    <div class="item">
                        <i></i>
                        <a href="javascript:;">工作动态（3）</a>
                    </div>
                </div>
                <div class="labelBox">
                    <span class="green">重大工程</span>
                    <span class="red">噪音</span>
                    <span class="yellow">建筑垃圾</span>
                </div>
            </div>
            <div class="pubBlock peoSty">
                <p class="proName">复旦大学第三附属学校一期工程</p>
                <p class="proInfo">
                    项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮项目位于宛南六村46号，宛平中学修缮
                </p>
                <div class="infoBox">
                    <div class="item">
                        <i></i>
                        <span>2019.08.26</span>
                    </div>
                    <div class="item">
                        <i></i>
                        <a href="javascript:;">数据聚合（5）</a>
                    </div>
                    <div class="item">
                        <i></i>
                        <a href="javascript:;">工作动态（3）</a>
                    </div>
                </div>
                <div class="labelBox">
                    <span class="green">重大工程</span>
                    <span class="red">噪音</span>
                    <span class="yellow">建筑垃圾</span>
                </div>
            </div>--%>
        </div>
        <div id="pagination" class="pagination"></div>
    </div>
</div>

</body>
</html>
