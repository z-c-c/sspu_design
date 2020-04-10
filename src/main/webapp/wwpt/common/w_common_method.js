//获取网址栏参数
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

function timestampToTime(timestamp) {
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';
    var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    var D = date.getDate() + ' ';
    /* var h = date.getHours() + ':';
   ??? var m = date.getMinutes() + ':';
   ??? var s = date.getSeconds();*/
    return Y + M + D;//不显示时分秒
}
function uuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
}


//根据传递过来的参数name获取对应的值
function getParameter(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = location.search.substr(1).match(reg);
    if (r != null) return (r[2]);
    return null;
}

Date.prototype.Format = function (fmt) { //author: meizz
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
}
//格式化日期
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}

function footerChangeDetail() {

    var indexMainHL = $(".infoBox-l").outerHeight(true);
    var indexMainHR = $(".infoBox-r").outerHeight(true);
    if (indexMainHL <= 700 && indexMainHR <= 700) {
        $(".whiteBox").css("height", 700 + 100);
        $(".footerBox").css("top", 700 + 90);
    } else {
        if (indexMainHL <= indexMainHR) {
            $(".whiteBox").css("height", indexMainHR + 100);
            $(".footerBox").css("top", indexMainHR + 90);
        } else {
            $(".whiteBox").css("height", indexMainHL + 100);
            $(".footerBox").css("top", indexMainHL + 90);
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

//删除数组指定元素
function removeByValue(arr, val) {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == val) {
            arr.splice(i, 1);
            break;
        }
    }
}


function tagfind() {
    // 标签模糊查询
    // 模糊查询点击加号，input输入框显示
    $(".addBtn").click(function () {
        $(".fuzzyBox").css("display", "inline-block");
        $(".labelDown").fadeIn();
        clickHandle();
    })
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
            }
            //没有标签列隐藏
            if (flag) {
                $(".tabConItem").eq(i).css('display', 'none');
            }
        }
    });
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
    })
}
function openNewWindow(url,target) {
/*
    //window.open("", target);
    var f = document.createElement("form");
    document.body.appendChild(f);
    f.action = url;
    f.method = "post";
    f.target = target;
    f.submit();
    document.removeChild(f);*/
    if(target==null){
        target="_target";
    }
    window.open("",target);
    var f = document.createElement("form");
    document.body.appendChild(f);
    f.action = url;
    f.method = "post";
    f.target = target;
    f.submit();
    // document.removeChild(f);
}

function location_href(url) {
    var f = document.createElement("form");
    document.body.appendChild(f);
    f.action = url;
    f.method = "post";
    f.target = "_self";
    f.submit();
}

function isValidStr(str) {

    if (str == null || str === undefined || str === "null" || str === "undefined" || str.length == 0) {
        return "无";
    }
    return str;
}

function safeToString(str) {
    if (str == null) {
        return "";
    } else {
        try {
            return str.toString();
        } catch (e) {
            return "";
        }
    }
}

function successOperator() {
    $.messager.alert("操作提示", "操作成功!");
}
