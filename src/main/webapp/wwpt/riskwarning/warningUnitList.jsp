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

        function GetQueryString(name)
        {
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }
        function formatDatebox(value,result,flag) {
            if (value == null || value == '') {
                return '';
            }
            var dt;
            if (value instanceof Date) {
                dt = value;
            } else {
                dt = new Date(value);
            }
            var str="yyyy"+result+"MM"+result+"dd";
            if (flag){
                str+=" hh:mm:ss";
            }
            return dt.format(str); //扩展的Date的format方法(上述插件实现)
        }
        /*datagrid 日期格式化*/
        Date.prototype.format = function (format) {
            var o = {
                "M+": this.getMonth() + 1, // month
                "d+": this.getDate(), // day
                "h+": this.getHours(), // hour
                "m+": this.getMinutes(), // minute
                "s+": this.getSeconds(), // second
                "q+": Math.floor((this.getMonth() + 3) / 3),
                "S": this.getMilliseconds()
                // millisecond
            };
            if (/(y+)/.test(format))
                format = format.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(format))
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            return format;
        };

        function getTags(objectId,objectType){
            $.ajax({
                result:"POST",
                url:"/riskWarningController/getObjectTagListByobjectId",
                dataType:"json",
                async:false,
                data:{
                    objectId:objectId,
                    objectType:objectType,
                },
                success:function (result) {
                    var str='';
                    if (result){
                        for (var i=0;i<result.length;i++){
                            str+='<span style="background: '+result[i].tagColorCode+'" class="green">'+result[i].tagName+'</span>';
                        }
                    }
                    if (objectType=='person'){
                        persontag=str;
                    } else if (objectType=='unit'){
                        unittag=str;
                    }else {
                        eventtag=str;
                    }

                }
            });
        }

        function judgeNull(data){
            if(data == "" || data == null || data ==undefined ||data == "null")
                data = "无"
            return data;
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