<%@ taglib prefix="apptag" uri="app_tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="html">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <%@include file="/wwpt/common/w_include_header.jsp"%>
    <script result="text/javascript" src="../js/warningUtil.js"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript">
        $(function () {
            // 输入框控件调用
            vVsub();
            getList(1,10,true);
            getNumTable();
            // 月份日期控件
            jeDate("#Month", {
                theme: { bgcolor: "#00A1CB", pnColor: "#00CCFF" },
                format: "YYYY-MM"
            });
            $("#jiedao").change(function (e) {
                changeJw($(this).val())
            })



        })
        function changeJw(JdCode) {
            $("#juwei").empty()
            $.ajax({
                result:"POST",
                url:"/reportAnalysis/getJwByJdCode",
                dataType:"json",
                data:{
                    jdCode:JdCode
                },
                success:function (result) {
                    var str='<option value="">--请选择居委会--</option>'
                    for (var i=0;i<result.length;i++){
                        str+='<option value="'+result[i].jw_code+'">'+result[i].jw+'</option>';
                    }
                    $("#juwei").html(str)
                }
            })
        }
        function getNumTable() {
            $.ajax({
                result:"POST",
                url:"/reportAnalysis/contradictionWtEventListNum",
                dataType:"json",
                data:{
                    month:$("#Month").val(),
                    road:$("#jiedao").val(),
                    jw:$("#juwei").val()
                },
                success:function (result) {
                    for (key in result){
                        $("#"+key).html(result[key])
                    }
                }
            })
        }
        function getList(page,rows,flag) {
            $("#dataList").empty();
            $.ajax({
                result:"POST",
                url:"/reportAnalysis/contradictionEventList",
                dataType:"json",
                data:{
                    page:page,
                    rows:rows,
                    month:$("#Month").val(),
                    road:$("#jiedao").val(),
                    jw:$("#juwei").val(),
                    orderClum:'wwMdjb',
                    orderStatus:$("#orderStatus").val()
                },
                success:function (result) {
                    var pageTotal;
                    if (result.total<=10){
                        pageTotal=1;
                    } else {
                        pageTotal=Math.ceil(result.total/10);
                    }
                    if (flag){
                        new Page({
                            id: 'pagination',
                            pageTotal: pageTotal, //必填,总页数
                            pageAmount: 10,  //每页多少条
                            dataTotal: result.total, //总共多少条数据
                            curPage: 1, //初始页码,不填默认为1
                            pageSize: 10, //分页个数,不填默认为5
                            showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                            showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                            getPage: function (page) {
                                //获取当前页数
                                getList(page,10)
                            }
                        });
                    }

                    for (var i=0;i<result.rows.length;i++){
                        var event = result.rows[i][1];
                        var md=result.rows[i][0];
                        var wwSfhj='';
                        if (md.wwSfhj=='1'){
                            wwSfhj='已化解。';
                        } else {
                            wwSfhj='未化解。';
                        }
                        var wwIsKsssj='';
                        if (md.wwIsKsssj=='1'){
                            wwIsKsssj='跨省市';
                        } else {
                            wwIsKsssj='本省市';
                        }

                        var str='<tr>\n' +
                            '                        <td>'+parseInt((page-1)*rows+1+i)+'</td>\n' +
                            '                        <td>'+judgeNull(event.eventName)+'</td>\n' +
                            '                        <td class="textSpecial" name="'+judgeNull(event.eventContent)+'">\n' +
                            '                            <div>'+judgeNull(event.eventContent)+'</div>\n' +
                            '                        </td>\n' +
                            '                        <td class="textSpecial" name="'+wwSfhj+judgeNull(md.wwHjqk)+'">\n' +
                            '                            <div>'+wwSfhj+judgeNull(md.wwHjqk)+'</div>\n' +
                            '                        </td>\n' +
                            '                        <td>'+judgeNull(md.wwSjly)+'</td>\n' +
                            '                        <td>'+judgeNull(md.wwSjrs)+'</td>\n' +
                            '                        <td>'+wwIsKsssj+'</td>\n' ;
                        if (md.wwIsLshjsj=='1'){
                            str+='                        <td class="yes">是</td>\n';
                        } else {
                            str+='                        <td class="no">否</td>\n';
                        }
                        str+=
                            '                    </tr>';
                        $("#dataList").append(str);
                    }
                }
            });
        }
        function searchData() {
            getNumTable();
            getList(1,10,true);

        }
        function exportExcel() {
            $('<form id="exportExcel" method="post" action="/reportAnalysis/exportContradictionWtExcel?month='+$("#Month").val()+'&&road='+$("#jiedao").val()+'&&jw='+$("#juwei").val()+'"></form>').appendTo('body').submit().remove();
        }
    </script>
</head>

<body>
    <div class="index-main">
        <div class="formsAnalyze">
            <div class="bear-block">
                <div class="bear-tit">
                    <h5>查询条件</h5>
                </div>
                <div class="queryCondition">
                    <table border="0" class="fontSty">
                        <tr>
                            <td align="right" width="5%">月份：</td>
                            <td width="20%">
                                <input result="text" class="vV-ipt date jeinput w-246" id="Month" placeholder="请选择时间">
                </td>
                <td align="right" width="8%">分配单位：</td>
                <td width="20%">
                    <apptag:dict result="select" clazz="select w-246" style="width:245px;height:28px;color:#000"
                                 id="jiedao" name="wwJdName" dictId="XH_XZQY"/>

                </td>
                <td align="right" width="5%">居委：</td>
                <td width="20%">
                    <select style="color: #000" id="juwei" name="city" class="select w-246">
                        <option value="">--请选择居委会--</option>
                    </select>
                </td>
                <td width="16%">
                    <button class="btnBlue" onclick="searchData()">查 询</button>
                    <button class="downLoadBtn" onclick="exportExcel()">下 载</button>
                </td>
                </tr>
                </table>
                <div class="reportFormsInfo">
                    <div>
                        <strong>总&nbsp;&nbsp;数&nbsp;&nbsp;量：</strong>
                        <span id="zsl"></span>
                    </div>
                    <div>
                        <strong>涉及领域：</strong>
                        <span id="sjly"></span>
                    </div>
                    <div>
                        <strong>涉及人数：</strong>
                        <span id="sjrs"></span>
                    </div>
                    <div>
                        <strong>矛盾性质：</strong>
                        <span id="mdxz"></span>
                    </div>
                </div>
                <div class="sub-tit sub-tit2 mt-20">
                    <h4>详细信息</h4>
                </div>
                <table border="0" class="tabStyle tabStyle2">
                    <tr class="tr">
                        <th width="5%">序号</th>
                        <th width="15%">不稳定问题</th>
                        <th width="20%">基本情况</th>
                        <th width="20%">稳控化解工作情况</th>
                        <th width="10%">涉及领域</th>
                        <th width="10%">涉及人数</th>
                        <th width="10%">矛盾性质</th>
                        <th width="10%">是否落实稳控措施</th>
                    </tr>
                    <tbody id="dataList">

                    </tbody>

                </table>
                <div id="pagination" class="pagination"></div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>