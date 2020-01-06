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
        $(function(){
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
            $("#juwei").empty();
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
                        var str='<tr>\n' +
                            '                                <td>'+parseInt((page-1)*rows+1+i)+'</td>\n' +
                            '                                <td>'+judgeNull(event.eventName)+'</td>\n' ;
                        if (md.wwMdJbName=='一级') {
                            str+=
                                '                                <td class="one">一级</td>\n' ;
                        }else if(md.wwMdJbName=='二级'){
                            str+=
                                '                                <td class="two">二级</td>\n' ;
                        }else if (md.wwMdJbName=='三级') {
                            str+=
                                '                                <td class="three">三级</td>\n' ;
                        }else {
                            str+=
                                '                                <td class="three">'+judgeNull(md.wwMdJbName)+'</td>\n' ;
                        }
                            str+=
                            '                                <td name="'+judgeNull(md.wwHjqk)+'" class="textSpecial"><div>'+judgeNull(event.eventContent)+'</div></td>\n' +
                            '                                <td>'+judgeNull(md.wwZrbmZb)+'</td>\n' +
                            '                                <td>'+judgeNull(md.wwZrr)+'</td>\n' +
                            '                                <td>'+judgeNull(md.wwZrbmXb)+'</td>\n' +
                            '                                <td name="'+judgeNull(md.wwHjqk)+'" class="textSpecial"><div>'+judgeNull(md.wwHjqk)+'</div></td>\n' ;
                        if (md.wwSfhj=='1'){
                            str+='                                <td class="defuse">已化解</td>\n' ;
                        } else {
                            str+='                                <td class="noDefuse">未化解</td>\n' ;
                        }
                            str+=
                            '                                <td>'+judgeNull(event.eventSource)+'</td>\n' +
                            '                            </tr>';
                        $("#dataList").append(str);
                    }
                }
            });
        }

        function getNumTable() {
            $.ajax({
                result:"POST",
                url:"/reportAnalysis/contradictionEventListNum",
                dataType:"json",
                data:{
                    month:$("#Month").val(),
                    road:$("#jiedao").val(),
                    jw:$("#juwei").val()
                },
                success:function (result) {
                    var allNumList=result.allNumList;
                    var hjMonthNumList=result.hjMonthNumList;
                    var hjNumList=result.hjNumList;
                    var monthNumList=result.monthNumList;
                    var allNumListStr=
                        '                            <td class="td">累计</td>\n' +
                        '                            <td>'+allNumList.ALLNUM+'</td>\n' +
                        '                            <td>'+allNumList.ALLCSNUM+'</td>\n' +
                        '                            <td>'+allNumList.ALLNCNUM+'</td>\n' +
                        '                            <td>'+allNumList.ALLSFSS+'</td>\n' +
                        '                            <td>'+allNumList.ALLQTSJ+'</td>\n' +
                        '                            <td>'+allNumList.ALLCXCF+'</td>\n' +
                        '                            <td>'+allNumList.ALLLDBA+'</td>\n' +
                        '                            <td>'+allNumList.ALLDB+'</td>\n' +
                        '                            <td>0</td>\n' ;

                    var hjMonthNumListStr=' <td rowspan="2" class="td">发生情况</td>\n' +
                        '                           <td class="td">本月</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLNUM+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLCSNUM+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLNCNUM+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLSFSS+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLQTSJ+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLCXCF+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLLDBA+'</td>\n' +
                        '                            <td>'+hjMonthNumList.ALLDB+'</td>\n' +
                        '                            <td>0</td>\n' ;

                    var hjNumListStr=
                        '                            <td class="td">累计</td>\n' +
                        '                            <td>'+hjNumList.ALLNUM+'</td>\n' +
                        '                            <td>'+hjNumList.ALLCSNUM+'</td>\n' +
                        '                            <td>'+hjNumList.ALLNCNUM+'</td>\n' +
                        '                            <td>'+hjNumList.ALLSFSS+'</td>\n' +
                        '                            <td>'+hjNumList.ALLQTSJ+'</td>\n' +
                        '                            <td>'+hjNumList.ALLCXCF+'</td>\n' +
                        '                            <td>'+hjNumList.ALLLDBA+'</td>\n' +
                        '                            <td>'+hjNumList.ALLDB+'</td>\n' +
                        '                            <td>0</td>\n' ;

                    var monthNumListStr=' <td rowspan="2" class="td">化解情况</td>\n' +
                        '                            <td class="td">本月\n</td>' +
                        '                            <td>'+monthNumList.ALLNUM+'</td>\n' +
                        '                            <td>'+monthNumList.ALLCSNUM+'</td>\n' +
                        '                            <td>'+monthNumList.ALLNCNUM+'</td>\n' +
                        '                            <td>'+monthNumList.ALLSFSS+'</td>\n' +
                        '                            <td>'+monthNumList.ALLQTSJ+'</td>\n' +
                        '                            <td>'+monthNumList.ALLCXCF+'</td>\n' +
                        '                            <td>'+monthNumList.ALLLDBA+'</td>\n' +
                        '                            <td>'+monthNumList.ALLDB+'</td>\n' +
                        '                            <td>0</td>\n' ;
                    $("#allNumList").html(allNumListStr)
                    $("#hjMonthNumList").html(hjMonthNumListStr)
                    $("#hjNumList").html(hjNumListStr)
                    $("#monthNumList").html(monthNumListStr)
                }
            })
        }
        function searchData() {
            getNumTable();
            $("#orderStatus").val("")
            getList(1,10,true);

        }
        function exportExcel() {
            $('<form id="exportExcel" method="post" action="/reportAnalysis/exportContradictionExcel?month='+$("#Month").val()+'&&road='+$("#jiedao").val()+'&&jw='+$("#juwei").val()+'&&orderClum=wwMdjb&&orderStatus='+$("#orderStatus").val()+'"></form>').appendTo('body').submit().remove();
        }
        function orderLevel(orderStatus) {
            $("#orderStatus").val(orderStatus)
            getList(1,10,true);
        }
    </script>
</head>
<body>
<input result="hidden" value="" id="orderStatus">
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
                    <div class="sub-tit sub-tit1 mt-20">
                        <h4>统计分析</h4>
                    </div>
                    <table border="0" class="tabStyle">
                        <tr class="tr">
                            <td></td>
                            <td></td>
                            <td>合计</td>
                            <td>城市</td>
                            <td>农村</td>
                            <td>涉法涉诉</td>
                            <td>群体性事件</td>
                            <td>重信重访</td>
                            <td>领导包案</td>
                            <td>督办</td>
                            <td>其他</td>
                        </tr>
                        <tr id="monthNumList">

                        </tr>
                        <tr id="allNumList">

                        </tr>
                        <tr id="hjMonthNumList">

                        </tr>
                        <tr id="hjNumList">

                        </tr>
                    </table>
                    <div class="sub-tit sub-tit2 mt-20">
                        <h4>详细信息</h4>
                    </div>
                    <table border="0" class="tabStyle tabStyle2">
                        <tr class="tr">
                            <th width="4%">序号</th>
                            <th width="15%">矛盾名称</th>
                            <th width="10%" class="level">
                                <span>矛盾级别</span>
                                <div class="sortGroup">
                                    <a href="javascript:;" onclick="orderLevel('asc')" class="sortup"></a>
                                    <a href="javascript:;" onclick="orderLevel('desc')" class="sortXia"></a>
                                </div>
                            </th>
                            <th width="20%">简要情况</th>
                            <th width="10%">责任部门</th>
                            <th width="5%">责任人</th>
                            <th width="12%">协作部门</th>
                            <th width="10%">化解情况</th>
                            <th width="8%">督办情况</th>
                            <th width="8%">数据来源</th>
                        </tr>
                        <tbody id="dataList">

                        </tbody>

                    </table>
                    <div style="text-align: center;" id="pagination" class="pagination"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>