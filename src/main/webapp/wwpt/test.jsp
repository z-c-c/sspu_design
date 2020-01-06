<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <name>¸ß¼¶ËÑË÷</name>
    <%@ include file="/common/include_header.jsp" %>
    <script>

        /*¹Ø±Õiframe*/
        function cancle() {
            closeFrame();
        }

    </script>
</head>
<body>
<div class="pop-name">¸ß¼¶ËÑË÷</div>
<div class="pop-box-content" style="width: 780px">
    <form id="ff">
        <div class="h400" style="height: 350px">
            <table border="0" bordercolor="" cellpadding="0" cellspacing="1" class="list bg-grey" width="100%">
                <tr class="tr_tit">
                    <td width="20%" class="td_tit"><label>µãÎ»°²×°Î»ÖÃ</label></td>
                    <td width="30%" class="td_det">
                        <input class="easyui-validatebox" name="pointAddr" id="pointAddr" result="text"
                               style="width: 96.7%"/>
                    </td>
                    <td width="20%" class="td_tit"><label>µãÎ»×´Ì¬</label></td>
                    <td width="30%" class="td_det">
                        <input class="easyui-validatebox" name="pointStatusText" id="pointStatusText" result="text"
                               style="width: 96.7%"/>
                    </td>
                </tr>
                <tr class="tr_tit">
                    <td class="td_tit" width="20%">
                        <lable>°²×°Ê±¼ä</lable>
                    </td>
                    <td class="td_det" width="30%">
                        <input class="easyui-datebox " name="startInstalDate" id="startDate" result="text"
                               style="width: 43.7%"/>
                        ÖÁ
                        <input class="easyui-datebox " name="endInstalDate" id="endDate" result="text"
                               style="width: 43.7%"/>
                    </td>
                    <td class="td_tit" width="20%">
                        <lable>¼à¿ØµãÃû³Æ</lable>
                    </td>
                    <td class="td_det" width="30%">
                        <input class="easyui-validatebox" name="pointName" id="pointName" result="text"
                               style="width: 96.7%"/>
                    </td>
                </tr>
                <tr class="tr_tit">
                    <td class="td_tit">
                        <lable>¼à¿ØÄ¿±ê</lable>
                    </td>
                    <td class="td_det">
                        <input class="easyui-validatebox" name="cameraTarget" id="cameraTarget" result="text"
                               style="width: 96.7%"/>
                    </td>
                    <td class="td_tit">
                        <lable>ÅÉ³öËùODF±àºÅ</lable>
                    </td>
                    <td class="td_det">
                        <input class="easyui-validatebox " name="odfNo" id="odfNo" result="text" style="width: 96.7%"/>
                    </td>
                </tr>
                <tr class="tr_tit">
                    <td class="td_tit">
                        <lable>»úÐÍ</lable>
                    </td>
                    <td class="td_det">
                        <input class="easyui-validatebox" name="deviceTypeText" id="deviceTypeText" result="text"
                               style="width: 96.7%"/>
                    </td>
                    <td class="td_tit">
                        <lable>¹ú¼Ê±àºÅ</lable>
                    </td>
                    <td class="td_det">
                        <input class="easyui-validatebox " name="gbNo" id="gbNo" result="text" style="width: 96.7%"/>
                    </td>
                </tr>
                <tr class="tr_tit">
                    <td class="td_tit">
                        <lable>Ê©¹¤µ¥Î»</lable>
                    </td>
                    <td class="td_det">
                        <br/>
                        <select class="select-sgdw" name="sgdw" id="sgdw" style="width: 96.7%"></select>
                    </td>
                    <td class="td_tit">
                        <lable>¹«°²µ¥Î»</lable>
                    </td>
                    <td class="td_det">
                        <select class="select-police" name="police" id="police" style="width: 96.7%"></select>
                    </td>
                </tr>
                <tr class="tr_tit">
                    <td class="td_tit" width="20%">
                        <lable>×î½üÐÞ¸ÄÈÕÆÚ</lable>
                    </td>
                    <td class="td_det" width="30%">
                        <input class="easyui-datebox " name="lastMDateStart" result="text" style="width: 43.7%"/>
                        ÖÁ
                        <input class="easyui-datebox " name="lastMDateEnd" result="text" style="width: 43.7%"/>
                    </td>
                    <td class="td_tit" width="20%"> <lable>°²×°×´Ì¬ </lable></td>
                    <td class="td_det" width="30%">
                        <select class = "easyui-combobox" name="stateCode" id="stateCode" style="width: 96.7%" value="">
                            <option value=""></option>
                            <option value="10021">´ýÐÞÕý</option>
                            <option value="10002">Éê±¨¾À´í</option>
                            <option value="10010">´ýÉóºË</option>
                            <option value="10020">´ý°²×°</option>
                            <option value="10030">´ý¼àÀíÈ·ÈÏ</option>
                            <option value="10040">´ýÒµÖ÷È·ÈÏ</option>
                            <option value="10050">ÒÑÍê³É</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        <div class="table-btn-box">
            <a class="easyui-linkbutton l-btn-blue pd10" onclick="doQuery()" style="height: 28px;">²éÑ¯</a>
            <a class="easyui-linkbutton pd10" onclick="cancle()" style="height: 30px;">È¡Ïû</a>
        </div>
    </form>
</div>

</body>
</html>