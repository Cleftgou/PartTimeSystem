package com.niu.parttime.servlet;

import com.niu.parttime.pojo.Worker;
import com.niu.parttime.service.WorkerService;
import com.niu.parttime.service.impl.WorkerServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/doWorkerLogin", "/doWorkerRegister",
        "/doWorkerUpdate", "/doWorkerSelectByName", "/doWorkerExit"})
public class WorkerServlet extends HttpServlet {

    //新建一个业务对象
    private WorkerService workerService = new WorkerServiceImpl();


    //模板类
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        //返回请求的 URL 中的 servlet 路径部分
        String servletPath = req.getServletPath();

        if ("/doWorkerLogin".equals(servletPath)){
            doWorkerLogin(req, resp);
        }else if("/doWorkerRegister".equals(servletPath)){
            doWorkerRegister(req, resp);
        }else if("/doWorkerUpdate".equals(servletPath)){
            doWorkerUpdate(req, resp);
        }else if ("/doWorkerSelectByName".equals(servletPath)){
            doWorkerSelectByName(req, resp);
        }else if("/doWorkerExit".equals(servletPath)){
            doWorkerExit(req, resp);
        }
    }

    /*
    处理登录
     */
    protected void doWorkerLogin(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //验证用户名和密码是否正确
        //username=admin&password=123456
        String w_name = req.getParameter("w_name");
        String w_pwd = req.getParameter("w_pwd");

        String contextPath = req.getContextPath();

        Worker worker = workerService.WorkerLogin(w_name, w_pwd);
        if (worker != null){
            //登录成功
            //记住密码和自动登录
            //获取自动登录，值为1
            String W_autoLoginCheck = req.getParameter("W_autoLoginCheck");

            //获取记住密码，值为1
            String W_savePasswordCheck = req.getParameter("W_savePasswordCheck");

            //创建cookie对象保存账号密码
            Cookie c_w_name = new Cookie("w_name", w_name);
            Cookie c_w_pwd = new Cookie("w_pwd", w_pwd);

            //把记住密码的状态对勾也记住（1）
            Cookie c_W_savePasswordCheck = new Cookie("W_savePasswordCheck", W_savePasswordCheck);
            //保存自动登录的值
            Cookie c_W_autoLoginCheck = new Cookie("W_autoLoginCheck", W_autoLoginCheck);
            //判断是否自动登录
            if ("1".equals(W_autoLoginCheck)){
                //自动登录(记住密码)
                c_w_name.setMaxAge(30);
                c_w_pwd.setMaxAge(30);
                c_W_savePasswordCheck.setMaxAge(30);
                c_W_autoLoginCheck.setMaxAge(30);
            }else {
                //不自动登录
                c_w_name.setMaxAge(0);
                c_w_pwd.setMaxAge(0);
                c_W_savePasswordCheck.setMaxAge(0);
                c_W_autoLoginCheck.setMaxAge(0);
                //是否记住密码
                if ("1".equals(W_savePasswordCheck)){
                    //记住密码
                    //设置记住密码的时长，单位是秒
                    c_w_name.setMaxAge(30);
                    c_w_pwd.setMaxAge(30);
                    c_W_savePasswordCheck.setMaxAge(30);
                }else {
                    //不记住密码
                    c_w_name.setMaxAge(0);
                    c_w_pwd.setMaxAge(0);
                    c_W_savePasswordCheck.setMaxAge(0);
                }
            }

            //存放在响应对象中
            resp.addCookie(c_w_name);
            resp.addCookie(c_w_pwd);
            resp.addCookie(c_W_savePasswordCheck);
            resp.addCookie(c_W_autoLoginCheck);


            //登录成功
            //把账户保存到session作用域中：
            req.getSession().setAttribute("worker", worker);

            //把求职者登录状态保存到session作用域中
            req.getSession().setAttribute("flag", "JSP/worker/worker_detail.jsp");

//            req.getRequestDispatcher("index.jsp").forward(req, resp);
            resp.sendRedirect(contextPath);
        }else {
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理注册
     */
    protected void doWorkerRegister(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String w_name = req.getParameter("w_name");
        String w_pwd = req.getParameter("w_pwd");

        String contextPath = req.getContextPath();

        Worker worker = new Worker();

        worker.setW_name(w_name);
        worker.setW_pwd(w_pwd);

        int num = workerService.WorkerRegister(worker);

        if (num != 0){
            //添加成功
            resp.sendRedirect(contextPath+"/JSP/worker/worker_login.jsp");
        }else {
            //添加失败
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理注册验证功能
     */
    protected void doWorkerSelectByName(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String w_name = req.getParameter("w_name");

        Boolean bo = workerService.WorkerSelectByName(w_name);
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
    protected void doWorkerUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String w_name = req.getParameter("w_name");
        String w_pwd = req.getParameter("w_pwd");

        String contextPath = req.getContextPath();

        Worker worker = new Worker();

        worker.setW_name(w_name);
        worker.setW_pwd(w_pwd);

        int num = workerService.WorkerUpdate(worker);

        if (num != 0){
            //修改成功
            resp.sendRedirect(contextPath+"/JSP/worker/worker_login.jsp");
        }else {
            //修改失败
            resp.sendRedirect(contextPath+"/error.jsp");
        }
    }

    /*
    处理退出登录
     */
    protected void doWorkerExit(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 获取当前请求中的所有cookie
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // 判断cookie名称是否是要删除的四个cookie
                if (cookie.getName().equals("w_name") ||
                        cookie.getName().equals("w_pwd") ||
                        cookie.getName().equals("W_savePasswordCheck") ||
                        cookie.getName().equals("W_autoLoginCheck")) {
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
}
