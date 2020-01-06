package com.zcc.commons.filter;

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
        UserInfoEntity currentPerson = (UserInfoEntity) session.getAttribute("currentPerson");
        String requestUri = request.getRequestURI();
        boolean flag = true;
        if (currentPerson == null && !requestUri.contains("login.jsp")) {

            if(requestUri.contains("managerLogin.jsp")){
                filterChain.doFilter(servletRequest, servletResponse);
            }else {
                if(requestUri.contains(".css") || requestUri.contains(".js") || requestUri.contains(".png")|| requestUri.contains(".jpg")||requestUri.contains(".mp4")){
                    if(!requestUri.contains("jsp")){
                        filterChain.doFilter(servletRequest, servletResponse);
                    }else {
                        HttpServletResponse response = (HttpServletResponse) servletResponse;
                        PrintWriter writer = response.getWriter();
                        writer.println("<html><script>window.open ('/login.jsp','_top')</script></html>");
                    }
                }
                else if (requestUri.contains("login/login")) {
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
