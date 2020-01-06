function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}
function formatDatebox(value,type,flag) {
    if (value == null || value == '') {
        return '';
    }
    var dt;
    if (value instanceof Date) {
        dt = value;
    } else {
        dt = new Date(value);
    }
    var str="yyyy"+type+"MM"+type+"dd";
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
        type:"POST",
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