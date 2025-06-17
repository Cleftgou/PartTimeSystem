package com.hu.parttime.servlet;

import com.hu.parttime.pojo.Commission;
import com.hu.parttime.service.CommissionService;
import com.hu.parttime.service.impl.CommissionServiceImpl;
import com.hu.parttime.utils.PageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/doCommissionPub", "/doCommissionSelect",
        "/doSelectAllCommission", "/doSelectCommissionByE_name",
        "/doDeleteCommissionById", "/doUpdateCommission",
        "/doSelectCommissionByW_name", "/doUpdateStateWorkerId", "/doGetCommissionPage",
        "/doSelectCompletedCommissionByW_id"})
public class CommissionServlet extends HttpServlet {

    //新建一个业务对象
    private CommissionService commissionService = new CommissionServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        //返回请求的 URL 中的 servlet 路径部分
        String servletPath = req.getServletPath();

        if ("/doCommissionPub".equals(servletPath)){
            doCommissionPub(req, resp);
        }else if("/doCommissionSelect".equals(servletPath)){
            doCommissionSelect(req, resp);
        }else if("/doSelectAllCommission".equals(servletPath)){
            doSelectAllCommission(req, resp);
        }else if("/doSelectCommissionByE_name".equals(servletPath)){
            doSelectCommissionByE_name(req, resp);
        }else if("/doDeleteCommissionById".equals(servletPath)){
            doDeleteCommissionById(req, resp);
        }else if("/doUpdateCommission".equals(servletPath)){
            doUpdateCommission(req, resp);
        }else if ("/doSelectCommissionByW_name".equals(servletPath)){
            doSelectCommissionByW_name(req, resp);
        }else if ("/doUpdateStateWorkerId".equals(servletPath)){
            doUpdateStateWorkerId(req, resp);
        }else if ("/doGetCommissionPage".equals(servletPath)){
            doGetCommissionPage(req, resp);
        }else if("/doSelectCompletedCommissionByW_id".equals(servletPath)){
            doSelectCompletedCommissionByW_id(req, resp);
        }
    }

    /*
    处理新增委托
     */
    protected void doCommissionPub(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();

        String c_title = req.getParameter("c_title");
        String c_description = req.getParameter("c_description");
        String c_state = req.getParameter("c_state");
        String c_employer_id = req.getParameter("c_employer_id");

        Commission commission = new Commission();
        commission.setC_title(c_title);
        commission.setC_description(c_description);
        commission.setC_state(c_state);
        commission.setC_employer_id(Integer.parseInt(c_employer_id));

        boolean b = commissionService.InsertCommission(commission);

        if (b) {
            //增加
            //重新向服务器发送请求，要回到商家信息界面
            resp.sendRedirect(contextPath + "/JSP/employer/employer_detail.jsp");
        } else {
            resp.sendRedirect(contextPath + "/error.jsp");
        }
    }

    /*
    处理查询指定委托
    */
    protected void doCommissionSelect(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();

        String cTitle = req.getParameter("c_title");

        Commission commission = commissionService.SelectCommissionByTitle(cTitle);

        if (commission != null){
            //查到了对应的委托
            //存储
            req.getSession().setAttribute("commission", commission);
            //转发机制
            req.getRequestDispatcher("/JSP/commission/commission_detail.jsp").forward(req, resp);
        }else {
            resp.sendRedirect(contextPath + "/error.jsp");
        }
    }

    /*
    查询全部委托，目前未使用
     */
    protected void doSelectAllCommission(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Commission> AllCommissionListQ = commissionService.SelectAllCommission();

        //保存到会话作用域里
        req.setAttribute("AllCommissionListQ", AllCommissionListQ);

        //转发机制
        req.getRequestDispatcher("/JSP/commission/commission_exhibit.jsp").forward(req, resp);

    }

    /*
    根据委托人账号查询此人的委托列表
     */
    protected void doSelectCommissionByE_name(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();
        String e_name = req.getParameter("e_name");

        List<Commission> commissionListByE_name = commissionService.SelectCommissionByE_name(e_name);

        //保存到请求作用域里
        req.setAttribute("commissionListByE_name", commissionListByE_name);

        //转发机制
        req.getRequestDispatcher("/JSP/employer/employer_detail.jsp").forward(req, resp);
    }

    /*
    根据委托编号删除指定委托
     */
    protected void doDeleteCommissionById(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();
        String c_id = req.getParameter("c_id");

        boolean b = commissionService.DeleteCommissionById(Integer.parseInt(c_id));

        if (b){
            //删除成功
            //重新向服务器发送请求，要回到商家信息界面
            resp.sendRedirect(contextPath+"/JSP/employer/employer_detail.jsp");
        }else {
            resp.sendRedirect(contextPath + "/error.jsp");
        }
    }

    /*
    编辑委托
     */
    protected void doUpdateCommission(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();

        String c_id = req.getParameter("c_id");
        String c_title = req.getParameter("c_title");
        String c_description = req.getParameter("c_description");
        String c_state = req.getParameter("c_state");
        String c_employer_id = req.getParameter("c_employer_id");

        Commission commission = new Commission();
        commission.setC_id(Integer.valueOf(c_id));
        commission.setC_title(c_title);
        commission.setC_description(c_description);
        commission.setC_state(c_state);
        commission.setC_employer_id(Integer.parseInt(c_employer_id));

        boolean b = commissionService.UpdateCommission(commission);

        if (b){
            //修改成功
            //重新向服务器发送请求，要回到商家信息界面
            resp.sendRedirect(contextPath+"/JSP/employer/employer_detail.jsp");
        }else {
            resp.sendRedirect(contextPath + "/error.jsp");
        }
    }

    /*
    根据求职者账号查询此人的委托列表
     */
    protected void doSelectCommissionByW_name(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();
        String w_name = req.getParameter("w_name");

        List<Commission> commissionListByW_name = commissionService.SelectCommissionByW_name(w_name);

        //保存到请求作用域里
        req.setAttribute("commissionListByW_name", commissionListByW_name);

        //转发机制
        req.getRequestDispatcher("/JSP/worker/worker_detail.jsp").forward(req, resp);
    }

    /*
    处理修改指定委托的状态，以及接单人
     */
    protected void doUpdateStateWorkerId(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contextPath = req.getContextPath();
        String c_state = req.getParameter("c_state");
        String c_id = req.getParameter("c_id");
        String w_id = req.getParameter("w_id");

        boolean b = commissionService.UpdateStateWorkerId(c_state, Integer.parseInt(c_id), Integer.parseInt(w_id));
        if (b){
            //接单成功
            //重定向回个人空间
            resp.sendRedirect(contextPath+"/JSP/worker/worker_detail.jsp");
        }else {
            resp.sendRedirect(contextPath + "/error.jsp");
        }
    }

    /*
    处理委托分页
     */
    protected void doGetCommissionPage(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //获取当前页
        String pageNow = req.getParameter("pageNow");
        //判断是否是第一页
        if (pageNow == null){
            pageNow = "1";
        }
        PageUtil page = new PageUtil();
        page.setPageNow(Integer.parseInt(pageNow));
        //调用
        page = commissionService.GetCommissionPage(page);

        //存储
        req.setAttribute("page", page);
        //跳转到委托大厅界面
        req.getRequestDispatcher("/JSP/commission/commission_exhibit.jsp").forward(req, resp);
    }

    /*
    根据求职者账号查询此人的已完成委托列表
    */
    protected void doSelectCompletedCommissionByW_id(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String w_id = req.getParameter("w_id");

        List<Commission> completedCommissions = commissionService.
                getCompletedCommissionsByWorkerId(Integer.parseInt(w_id));

        //保存到请求作用域里
        req.setAttribute("completedCommissions", completedCommissions);

        //转发机制
        req.getRequestDispatcher("/JSP/commission/completed_commissions.jsp").forward(req, resp);
    }
}
