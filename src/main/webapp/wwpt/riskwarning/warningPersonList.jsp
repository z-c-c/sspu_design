<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
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
        var noticeId=GetQueryString("noticeId");
        var persontag;
        $(function(){
            rightEventNotice(true,1);
        });
        function rightEventNotice(flag,page) {
            $("#unitList").append('')
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getObjectListByNoticeIdPage",
                dataType:"json",
                data:{
                    noticeId:noticeId,
                    objectType:'person',
                    page:page,
                    rows:5
                },
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
                                rightEventNotice(false,page);
                            }
                        });
                    }
                    for (var i = 0; i < warning.length; i++) {
                        getTags(warning[i].personId,'person');
                        if (!persontag){
                            persontag=''
                        }
                        var str='<div class="pubBlock">\n' +
                            '                    <div class="peoImg">\n' +
                            '                        <img src="../images/people.png" alt="">\n' +
                            '                    </div>\n' +
                            '                    <div class="peoInfo">\n' +
                            '                        <div>\n' +
                            '                            <span class="name">'+warning[i].personName+'</span>\n' +
                            '                            <div class="label">\n' +persontag+
                            '                            </div>\n' +
                            '                        </div>\n' +
                            '                        <p>\n' +
                            '                            <span>性别：</span>\n' +
                            '                            <strong>'+warning[i].gender+'</strong>\n' +
                            '                            <span class="ml-60">电话：</span>\n' +
                            '                            <strong>'+warning[i].phoneNum+'</strong>\n' +
                            '                        </p>\n' +
                            '                        <p>\n' +
                            '                            <span>证件号：</span>\n' +
                            '                            <strong>'+warning[i].personDocuNum+'</strong>\n' +
                            '                        </p>\n' +
                            '                        <p>\n' +
                            '                            <span>户籍地：</span>\n' +
                            '                            <strong>'+warning[i].nativePlace+'</strong>\n' +
                            '                        </p>\n' +
                            '                        <p>\n' +
                            '                            <span>居住地址：</span>\n' +
                            '                            <strong>'+warning[i].livePlace+'</strong>\n' +
                            '                        </p>\n' +
                            '                    </div>\n' +
                            '                </div>';
                        $("#unitList").append(str)
                    }
                }
            })
        }

    </script>
</head>
<body>
    <div class="index-main mt-15">
        <div class="bear-block peopleInfo">
            <div class="bear-tit">
                <h5 id="rightTotle">共有10条结果</h5>
            </div>
            <div class="peoBox" id="unitList">

            </div>
            <div id="pagination" class="pagination"></div>
        </div>
    </div>


</body>
</html>