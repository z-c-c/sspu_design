var mmodal_timer;
var callbackFunc=null;
/**
 * 选择对话框
 * @param type error/warn
 * @param title 标题
 * @param content 内容
 * @param func 回调
 */
function mmodalConfirm(type,title,content,func) {
    if(type=='error'){
        $("#alertImg").attr("src","systemManager/images/modal4.png");
    }else if(type=='success'){
        $("#alertImg").attr("src","systemManager/images/modal2.png");
    }
    $("#alertTitle").text(title);
    $("#alertMessage").text(content);
    $("#m3-mmodal-cancel").show();
    $("#m3").show();
    if(func!=null && typeof func === 'function'){
        callbackFunc=func;
    }
}

/**
 * 提示框 3s后自动关闭
 */
function mmodalAlert(type,title,content) {
    if(type=='error'){
        $("#alertImg").attr("src","systemManager/images/modal4.png");
    }else if(type=='success'){
        $("#alertImg").attr("src","systemManager/images/modal2.png");
    }
    $("#alertTitle").text(title);
    $("#alertMessage").text(content);
    $("#m3-mmodal-cancel").hide();
    $("#m3").show();
    mmodal_timer=setTimeout(function () {
        $("#m3").hide();
    },3000);
}
/**
 * 取消
 */
function mmodalCancel() {
    if(callbackFunc != null && typeof callbackFunc === 'function'){
        callbackFunc(false);
        callbackFunc=null;
    }
}

/**
 * 确认
 */
function mmodalSure() {
    window.clearTimeout(mmodal_timer);
    $("#m3").hide();
    if(callbackFunc != null && typeof callbackFunc === 'function'){
        callbackFunc(true);
        callbackFunc=null;
    }
}