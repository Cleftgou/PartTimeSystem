package com.hu.parttime.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/submit_evaluation")
public class SubmitEvaluationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 获取表单参数
        int jobId = 0;
        int userId = 0;
        String userType = "";
        int score = 0;
        String comment = "";

        try {
            jobId = Integer.parseInt(request.getParameter("job_id"));
            userId = Integer.parseInt(request.getParameter("user_id"));
            userType = request.getParameter("user_type");
            score = Integer.parseInt(request.getParameter("score"));
            comment = request.getParameter("comment");

            // 验证参数
            if (jobId <= 0 || userId <= 0 || userType == null ||
                    !userType.matches("employer|worker") ||
                    score < 1 || score > 5 || comment == null || comment.trim().isEmpty()) {
                throw new IllegalArgumentException("无效的评价参数");
            }

            // 插入评价记录
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // 加载数据库驱动
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/parttimesystem?useSSL=false",
                        "root", "123456");

                // 开始事务
                conn.setAutoCommit(false);

                // 插入评价
                String sql = "INSERT INTO commission_evaluation (job_id, user_id, user_type, score, comment) " +
                        "VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, jobId);
                pstmt.setInt(2, userId);
                pstmt.setString(3, userType);
                pstmt.setInt(4, score);
                pstmt.setString(5, comment);
                pstmt.executeUpdate();
                pstmt.close();

                // 更新委托的平均分和评价数量
                updateCommissionStats(jobId, conn);

                // 提交事务
                conn.commit();

                // 重定向回委托详情页
                response.sendRedirect("commission_detail.jsp?job_id=" + jobId);
            } catch (SQLException e) {
                // 回滚事务
                if (conn != null) {
                    try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
                }
                throw e;
            } finally {
                // 关闭资源
                try { if (pstmt != null) {
                    pstmt.close();
                }
                } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) {
                    conn.close();
                }
                } catch (SQLException e) { e.printStackTrace(); }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "提交评价失败：" + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // 更新委托统计信息的方法
    private void updateCommissionStats(int jobId, Connection conn) throws SQLException {
        String statsSql = "UPDATE commission c " +
                "JOIN (SELECT job_id, AVG(score) AS avg_score, COUNT(*) AS eval_count " +
                "      FROM commission_evaluation WHERE job_id = ? GROUP BY job_id) e " +
                "ON c.c_id = e.job_id " +
                "SET c.avg_score = e.avg_score, c.eval_count = e.eval_count";

        try (PreparedStatement pstmt = conn.prepareStatement(statsSql)) {
            pstmt.setInt(1, jobId);
            pstmt.executeUpdate();
        }
    }
}