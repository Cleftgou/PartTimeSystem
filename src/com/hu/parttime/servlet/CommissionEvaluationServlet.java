package com.hu.parttime.servlet;

import com.hu.parttime.pojo.Commission;
import com.hu.parttime.pojo.CommissionEvaluation;
import com.hu.parttime.service.impl.CommissionServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/doEvaluate"})
public class CommissionEvaluationServlet extends HttpServlet {

    private final CommissionServiceImpl commissionService = new CommissionServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        //返回请求的 URL 中的 servlet 路径部分
        String servletPath = req.getServletPath();

        if ("/doEvaluate".equals(servletPath)){
            doEvaluate(req, resp);
        }
    }

    // 进行评价
    private void doEvaluate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();

        String comment = req.getParameter("content");
        String score = req.getParameter("score");

        System.out.println(comment + score);
        CommissionEvaluation commissionEvaluation = new CommissionEvaluation();
        commissionEvaluation.setComment(comment);
        commissionEvaluation.setScore(score);
        // todo 具体逻辑


        resp.sendRedirect(contextPath + "/index.jsp");
    }

}
