package com.niu.parttime.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//@WebFilter
public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        //先做强制类型转换
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        //获取请求路径
        String servletPath = req.getServletPath();

        //入口的验证，这个session不需要新建
        HttpSession session = req.getSession(false);
        if ("/index.jsp".equals(servletPath) ||
                "employer/employer_login.jsp".equals(servletPath) ||
                "employer/employer_register.jsp".equals(servletPath) ||
                "employer/employer_forgot_pwd.jsp".equals(servletPath) ||
                "worker/worker_login.jsp".equals(servletPath) ||
                "worker/worker_register.jsp".equals(servletPath) ||
                "/CommissionServlet".equals(servletPath) ||
                "/EmployerServlet".equals(servletPath) ||
                "/WorkerServlet".equals(servletPath)
                || (session!=null && session.getAttribute("uname")!=null)){
            //继续往下走
            chain.doFilter(req, resp);
        }else {
            //跳转到系统主界面
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
