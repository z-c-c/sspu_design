package com.zcc.exceptions;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author zcc
 */
public class MyExceptionHandler implements HandlerExceptionResolver {
    /**
     * 当处理器中抛出异常后，SpringMvc能够捕获到异常，调用所有实现了HandlerExceptionResolver类的resolveException（）方法，由这个方法处理异常。这个
     * 方法的处理结果就是用户看到的处理结果
     * @param httpServletRequest 请求
     * @param httpServletResponse 应答
     * @param o 处理对象
     * @param e 异常
     * @return
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        //处理异常：1。把异常处理到日志或数据库；2。使用短信或邮件，把异常处理题通知出去。
        //给用户一个异常处理结果
        ModelAndView mv=new ModelAndView();
        //根据异常的类型，给出不同的处理方式
        if(e instanceof MyException){
            mv.setViewName("/WEB-INF/500");
        }else {
            e.printStackTrace();
            mv.setViewName("/WEB-INF/404");
        }
        return mv;
    }

}
