<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name>数据聚合</name>
    <%@include file="/wwpt/common/w_include_header.jsp"%>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
     <script result="text/javascript" src="../js/warningUtil.js" ></script>

    <script result="text/javascript">
        $(function(){
            // 输入框控件调用
            vVsub();
        });

        $(function () {
            getList(true,1)
        });

        function getList(flag,page) {
            $("#unitList").html("")
            var data={};
            data.page=page;
            data.rows=5;
            var warningClassesFirstCode=GetQueryString("firstClassesCode");
            if (warningClassesFirstCode){
                data.warningClassesFirstCode=warningClassesFirstCode;
            }

            $.ajax({
                result:"POST",
                url:"/riskWarningController/getRiskWarningList",
                dataType:"json",
                data:data,
                success:function (result) {
                    var warning=result.rows;
                    $("#rightTotle").text("共有"+result.total+"条结果")
                    if (flag) {
                        // 分页
                        var pageTotal;
                        if (result.total<=5){
                            pageTotal=1;
                        } else {
                            pageTotal=Math.ceil(result.total/5);
                        }
                        $("#totle").text(result.total)
                        new Page({
                            id: 'pagination',
                            pageTotal: pageTotal, //必填,总页数
                            pageAmount: 5,  //每页多少条
                            dataTotal: result.total, //总共多少条数据
                            curPage: 1, //初始页码,不填默认为1
                            pageSize: 5, //分页个数,不填默认为5
                            showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                            showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                            getPage: function (page) {
                                //获取当前页数
                                getList(false,page);
                            }
                        });
                    }
                    for (var i = 0; i < warning.length; i++) {
                        var tagStr='';
                        var tags =jQuery.parseJSON(warning[i].warningTags);
                        if (tags){
                            for (var t =0;t<tags.length;t++) {
                                tagStr+='<span name="'+tags[t].description+'" style="background: '+tags[t].tagColorCode+'" class="green">'+tags[t].tagName+'</span>';
                            }
                        }
                        var noticeContent='无';
                        if(warning[i].noticeContent&&warning[i].noticeContent!='null'){
                            noticeContent=warning[i].noticeContent;
                        }
                        var date='';
                        if (judgeNull(warning[i].noticeDate!='无')){
                            date=formatDatebox(new Date(warning[i].noticeDate),"-",true)
                        }
                        var str='<div class="pubBlock peoSty">\n' +
                            '                    <p class="proName">'+warning[i].noticeName+'</p>\n' +
                            '                    <p class="proInfo">\n' +
                            '                        '+noticeContent+'\n' +
                            '                    </p>\n' +
                            '                    <div class="infoBox">\n' +
                            '                        <div class="item">\n' +
                            '                            <i></i>\n' +
                            '                            <span>'+date+'</span>\n' +
                            '                        </div>\n' +
                            '                    </div>\n' +
                            '                    <div class="labelBox">\n' +tagStr+
                            '                    </div>\n' +
                            '                </div>';
                        $("#unitList").append(str)
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="index-main mt-15">
    <div class="bear-block peopleInfo">
        <div class="bear-tit">
            <h5 id="rightTotle">共有0条结果</h5>
        </div>
        <div class="peoBox" id="unitList">

        </div>
        <div id="pagination" class="pagination"></div>
    </div>
</div>


</body>
</html>