package com.hu.parttime.servlet;

import com.hu.parttime.pojo.Employer;
import com.hu.parttime.service.EmployerService;
import com.hu.parttime.service.impl.EmployerServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/doEmployerLogin", "/doEmployerRegister",
        "/doEmployerUpdate", "/doEmployerSelectByName",
        "/doEmployerSelectByEmail", "/doEmployerExit",
        "/doEmployerUpdatePwdByNameEmail", "/doEmployerSelectByName_Email"})
public class EmployerServlet extends HttpServlet {

    //新建一个业务对象
    private EmployerService employerService = new EmployerServiceImpl();


    //模板类
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        //返回请求的 URL 中的 servlet 路径部分
        String servletPath = req.getServletPath();

        if ("/doEmployerLogin".equals(servletPath)){
            doEmployerLogin(req, resp);
        }else if("/doEmployerRegister".equals(servletPath)){
            doEmployerRegister(req, resp);
        }else if("/doEmployerUpdate".equals(servletPath)){
            doEmployerUpdate(req, resp);
        }else if ("/doEmployerSelectByName".equals(servletPath)){
            doEmployerSelectByName(req, resp);
        }else if ("/doEmployerSelectByEmail".equals(servletPath)){
            doEmployerSelectByEmail(req, resp);
        }else if("/doEmployerExit".equals(servletPath)){
            doEmployerExit(req, resp);
        }else if ("/doEmployerUpdatePwdByNameEmail".equals(servletPath)){
            doEmployerUpdatePwdByNameEmail(req, resp);
        }else if ("/doEmployerSelectByName_Email".equals(servletPath)){
            doEmployerSelectByName_Email(req, resp);
        }
    }

    /*
    处理登录
     */
    protected void doEmployerLogin(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //验证用户名和密码是否正确
        //username=admin&password=123456
        String e_name = req.getParameter("e_name");
        String e_pwd = req.getParameter("e_pwd");

        String contextPath = req.getContextPath();

        Employer employer = employerService.EmployerLogin(e_name, e_pwd);
        if (employer != null){

            //登录成功
            //记住密码和自动登录
            //获取自动登录，值为1
            String autoLoginCheck = req.getParameter("autoLoginCheck");

            //获取记住密码，值为1
            String savePasswordCheck = req.getParameter("savePasswordCheck");

            //创建cookie对象保存账号密码
            Cookie c_e_name = new Cookie("e_name", e_name);
            Cookie c_e_pwd = new Cookie("e_pwd", e_pwd);
            //把记住密码的状态对勾也记住（1）
            Cookie c_savePasswordCheck = new Cookie("savePasswordCheck", savePasswordCheck);
            //保存自动登录的值
            Cookie c_autoLoginCheck = new Cookie("autoLoginCheck", autoLoginCheck);
            //判断是否自动登录
            if ("1".equals(autoLoginCheck)){
                //自动登录(记住密码)
                c_e_name.setMaxAge(30);
                c_e_pwd.setMaxAge(30);
                c_savePasswordCheck.setMaxAge(30);
                c_autoLoginCheck.setMaxAge(30);
            }else {
                //不自动登录
                c_e_name.setMaxAge(0);
                c_e_pwd.setMaxAge(0);
                c_savePasswordCheck.setMaxAge(0);
                c_autoLoginCheck.setMaxAge(0);
                //是否记住密码
                if ("1".equals(savePasswordCheck)){
                    //记住密码
                    //设置记住密码的时长，单位是秒
                    c_e_name.setMaxAge(30);
                    c_e_pwd.setMaxAge(30);
                    c_savePasswordCheck.setMaxAge(30);
                }else {
                    //不记住密码
                    c_e_name.setMaxAge(0);
                    c_e_pwd.setMaxAge(0);
                    c_savePasswordCheck.setMaxAge(0);
                }
            }

            //存放在响应对象中
            resp.addCookie(c_e_name);
            resp.addCookie(c_e_pwd);
            resp.addCookie(c_savePasswordCheck);
            resp.addCookie(c_autoLoginCheck);

            //登录成功
            //把账户保存到session作用域中：
            req.getSession().setAttribute("employer", employer);

            //把雇主登录状态保存到session作用域中
            req.getSession().setAttribute("flag", "JSP/employer/employer_detail.jsp");

            resp.sendRedirect(contextPath);
        }else {
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理注册
     */
    protected void doEmployerRegister(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String e_name = req.getParameter("e_name");
        String e_pwd = req.getParameter("e_pwd");
        String e_email = req.getParameter("e_email");

        String contextPath = req.getContextPath();

        Employer employer = new Employer();

        employer.setE_name(e_name);
        employer.setE_pwd(e_pwd);
        employer.setE_email(e_email);

        int num = employerService.EmployerRegister(employer);

        if (num != 0){
            //添加成功
            resp.sendRedirect(contextPath+"/JSP/employer/employer_login.jsp");
        }else {
            //添加失败
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理注册账号验证功能
     */
    protected void doEmployerSelectByName(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String e_name = req.getParameter("e_name");

        Boolean bo = employerService.EmployerSelectByName(e_name);
        PrintWriter out = resp.getWriter();

        if (bo){
            //可以注册
            out.write("ok");
        }else {
            //不能注册
            out.write("no");
        }
    }

    /*
    处理注册邮箱验证功能
     */
    protected void doEmployerSelectByEmail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String e_email = req.getParameter("e_email");

        Boolean bo = employerService.EmployerSelectByEmail(e_email);
        PrintWriter out = resp.getWriter();

        if (bo){
            //可以注册
            out.write("ok");
        }else {
            //不能注册
            out.write("no");
        }
    }

    /*
    处理修改账号信息
     */
    protected void doEmployerUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String e_name = req.getParameter("e_name");
        String e_pwd = req.getParameter("e_pwd");
        String e_email = req.getParameter("e_email");

        String contextPath = req.getContextPath();

        Employer employer = new Employer();

        employer.setE_name(e_name);
        employer.setE_pwd(e_pwd);
        employer.setE_email(e_email);

        int num = employerService.EmployerUpdate(employer);

        if (num != 0){
            //修改成功
            resp.sendRedirect(contextPath+"/JSP/employer/employer_login.jsp");
        }else {
            //修改失败
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理退出登录
     */
    protected void doEmployerExit(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 获取当前请求中的所有cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // 判断cookie名称是否是要删除的四个cookie
                if (cookie.getName().equals("e_name") ||
                        cookie.getName().equals("e_pwd") ||
                        cookie.getName().equals("savePasswordCheck") ||
                        cookie.getName().equals("autoLoginCheck")) {
                    // 将要删除的cookie的过期时间设置为0，即立即过期
                    cookie.setMaxAge(0);
                    // 将修改后的cookie添加到响应中
                    resp.addCookie(cookie);
                }
            }
        }

        // 销毁session
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 跳转回登录界面
        resp.sendRedirect(req.getContextPath());
    }

    /*
    处理找回密码
     */
    protected void doEmployerUpdatePwdByNameEmail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String e_name = req.getParameter("e_name");
        String e_pwd = req.getParameter("e_pwd");
        String e_email = req.getParameter("e_email");

        String contextPath = req.getContextPath();

        Employer employer = new Employer();

        employer.setE_name(e_name);
        employer.setE_pwd(e_pwd);
        employer.setE_email(e_email);

        boolean b = employerService.EmployerUpdatePwdByNameEmail(employer);

        if (b){
            //修改成功
            resp.sendRedirect(contextPath+"/JSP/employer/employer_login.jsp");
        }else {
            //修改失败
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理根据账户邮箱找密码
     */
    protected void doEmployerSelectByName_Email(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String e_name = req.getParameter("e_name");
        String e_email = req.getParameter("e_email");

        boolean bo = employerService.EmployerSelectByName_Email(e_name, e_email);
        PrintWriter out = resp.getWriter();

        if (bo){
            //可以找回
            out.write("ok");
        }else {
            //不能注册
            out.write("no");
        }

    }
}
