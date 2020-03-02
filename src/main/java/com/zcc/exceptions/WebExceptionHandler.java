package com.zcc.exceptions;

import com.zcc.commons.utils.ResultBean;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 自定义异常处理器，两种定义方式都可以
 * @author zcc
 */
@ControllerAdvice
@ResponseBody
public class WebExceptionHandler {

    @ExceptionHandler()
    public ResultBean unknownException(Exception ex) {
        ex.printStackTrace();
        return ResultBean.error(ResultBean.ERROR, "系统错误");
    }

    @ExceptionHandler(MyException.class)
    public ResultBean myException(){
        return ResultBean.error(ResultBean.ERROR, "发生了'我的异常'");
    }
}
