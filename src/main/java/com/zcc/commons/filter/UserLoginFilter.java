package com.zcc.commons.filter;

import com.zcc.commons.utils.ConstUtil;
import com.zcc.manager.usermanager.entity.UserInfoEntity;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author zcc
 */
public class UserLoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        UserInfoEntity currentPerson = (UserInfoEntity) session.getAttribute(ConstUtil.CURRENT_PERSON);
        String requestUri = request.getRequestURI();
        boolean flag = true;
        if (currentPerson == null && !requestUri.contains(ConstUtil.LOGIN_JSP)) {

            if (requestUri.contains(ConstUtil.MANAGER_LOGIN_JSP)) {
                filterChain.doFilter(servletRequest, servletResponse);
            }else {
                if (requestUri.contains(ConstUtil.CSS) || requestUri.contains(ConstUtil.JS) || requestUri.contains(ConstUtil.PNG) || requestUri.contains(ConstUtil.JPG) || requestUri.contains(ConstUtil.MP4)) {
                    if (!requestUri.contains(ConstUtil.JSP)) {
                        filterChain.doFilter(servletRequest, servletResponse);
                    }else {
                        HttpServletResponse response = (HttpServletResponse) servletResponse;
                        PrintWriter writer = response.getWriter();
                        writer.println("<html><script>window.open ('/login.jsp','_top')</script></html>");
                    }
                } else if (requestUri.contains(ConstUtil.LOGIN_LOGIN)) {
                    filterChain.doFilter(servletRequest, servletResponse);
                }
                else {
                    HttpServletResponse response = (HttpServletResponse) servletResponse;
                    PrintWriter writer = response.getWriter();
                    writer.println("<html><script>window.open ('/login.jsp','_top')</script></html>");
                }
            }
            flag=false;
        }

        if (flag) {
            filterChain.doFilter(servletRequest, servletResponse);
        }

    }

    @Override
    public void destroy() {
        System.out.println("filter --destroy");
    }
}
