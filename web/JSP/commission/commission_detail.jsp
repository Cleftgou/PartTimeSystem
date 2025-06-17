<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>委托详情</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <style>
        .rating { display: inline-flex; font-size: 24px; }
        .rating input { display: none; }
        .rating label { color: #ddd; cursor: pointer; }
        .rating input:checked ~ label { color: #ffc107; }
        .rating label:hover, .rating label:hover ~ label { color: #ffca28; }
        .star.filled { color: #ffc107; }
        .evaluation-card { margin-bottom: 15px; }
    </style>
</head>
<body>
<!-- 固定菜单栏 -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
    <div class="container">
        <a href="${pageContext.request.contextPath}" class="navbar-brand">兼职服务平台</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/JSP/employer/employer_login.jsp">
                        <i class="bi bi-people-fill"></i>切换账号
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="commission_pub.jsp">
                        <i class="bi bi-clipboard-plus-fill"></i>发布委托
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 留出导航栏高度的间距 -->
<div style="height: 60px;"></div>

<section class="p-5 bg-secondary text-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <h1 class="text-center mb-4">委托详情</h1>

                <%
                    // 获取委托ID参数
                    String jobIdParam = request.getParameter("job_id");
                    if (jobIdParam == null || jobIdParam.isEmpty()) {
                        out.println("<p class=\"text-danger\">无效的委托ID</p>");
                        return;
                    }
                    int jobId = Integer.parseInt(jobIdParam);

                    // 获取当前登录用户信息
                    Integer userId = (Integer) session.getAttribute("user_id");
                    String userType = (String) session.getAttribute("user_type");

                    // 数据库连接
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    Commission commission = null;
                    List<Evaluation> evaluations = new ArrayList<>();
                    boolean canEvaluate = false;

                    try {
                        // 加载数据库驱动
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/parttimesystem?useSSL=false",
                                "root", "123456");

                        // 查询委托信息及评价统计
                        String sql = "SELECT c.*, e.e_name AS employer_name, w.w_name AS worker_name, " +
                                "(SELECT AVG(score) FROM commission_evaluation WHERE job_id = c.c_id) AS avg_score, " +
                                "(SELECT COUNT(*) FROM commission_evaluation WHERE job_id = c.c_id) AS eval_count " +
                                "FROM commission c " +
                                "LEFT JOIN employer e ON c.c_employer_id = e.e_id " +
                                "LEFT JOIN worker w ON c.w_id = w.w_id " +
                                "WHERE c.c_id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, jobId);
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            commission = new Commission();
                            commission.setId(rs.getInt("c_id"));
                            commission.setTitle(rs.getString("c_title"));
                            commission.setDescription(rs.getString("c_description"));
                            commission.setEmployerId(rs.getInt("c_employer_id"));
                            commission.setEmployerName(rs.getString("employer_name"));
                            commission.setWorkerId(rs.getInt("w_id"));
                            commission.setWorkerName(rs.getString("worker_name"));
                            commission.setState(rs.getString("c_state"));
                            commission.setAvgScore(rs.getDouble("avg_score"));
                            commission.setEvalCount(rs.getInt("eval_count"));
                        }

                        // 查询评价列表
                        if (commission != null) {
                            sql = "SELECT e.*, emp.e_name AS employer_name, wrk.w_name AS worker_name " +
                                    "FROM commission_evaluation e " +
                                    "LEFT JOIN employer emp ON e.user_id = emp.e_id AND e.user_type = 'employer' " +
                                    "LEFT JOIN worker wrk ON e.user_id = wrk.w_id AND e.user_type = 'worker' " +
                                    "WHERE e.job_id = ? " +
                                    "ORDER BY e.create_time DESC";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setInt(1, jobId);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                Evaluation eval = new Evaluation();
                                eval.setId(rs.getInt("eval_id"));
                                eval.setJobId(rs.getInt("job_id"));
                                eval.setUserId(rs.getInt("user_id"));
                                eval.setUserType(rs.getString("user_type"));
                                eval.setScore(rs.getInt("score"));
                                eval.setComment(rs.getString("comment"));
                                eval.setCreateTime(rs.getTimestamp("create_time"));
                                eval.setUserName(eval.getUserType().equals("employer") ?
                                        rs.getString("employer_name") : rs.getString("worker_name"));
                                evaluations.add(eval);
                            }

                            // 判断用户是否可以评价（修改后的逻辑）
                            if (userId != null && userType != null && commission != null) {
                                // 只要委托已完成（状态为success）且已被接取（状态不是true）
                                boolean isJobCompleted = "success".equalsIgnoreCase(commission.getState());
                                boolean isJobTaken = !"true".equalsIgnoreCase(commission.getState());

                                canEvaluate = isJobCompleted && isJobTaken;
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p class=\"text-danger\">加载委托信息失败：" + e.getMessage() + "</p>");
                    } finally {
                        try { if (rs != null) rs.close(); } catch (Exception e) {}
                        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
                        try { if (conn != null) conn.close(); } catch (Exception e) {}
                    }
                %>

                <!-- 显示委托信息 -->
                <% if (commission != null) { %>
                <div class="card mb-4">
                    <div class="card-body">
                        <h2 class="card-title"><%= commission.getTitle() %></h2>
                        <p class="card-text"><strong>描述：</strong><%= commission.getDescription() %></p>
                        <p class="card-text"><strong>雇主：</strong><%= commission.getEmployerName() %></p>
                        <p class="card-text"><strong>工人：</strong><%= commission.getWorkerName() != null ? commission.getWorkerName() : "未分配" %></p>
                        <p class="card-text"><strong>状态：</strong>
                            <% if ("true".equals(commission.getState())) { %>
                            <span class="badge bg-success">可接取</span>
                            <% } else if ("false".equals(commission.getState())) { %>
                            <span class="badge bg-warning">已被接取</span>
                            <% } else if ("success".equals(commission.getState())) { %>
                            <span class="badge bg-secondary">已完成</span>
                            <% } else { %>
                            <%= commission.getState() %>
                            <% } %>
                        </p>
                    </div>
                </div>

                <!-- 评价入口（只要接取并完成就显示） -->
                <% if (canEvaluate) { %>
                <div class="alert alert-info">
                    <h4 class="alert-heading">提交评价</h4>
                    <p>您可以对这个委托进行评价</p>
                    <a href="commission_evaluation.jsp?job_id=<%= commission.getId() %>&user_id=<%= userId %>&user_type=<%= userType %>"
                       class="btn btn-primary">
                        <i class="bi bi-star-fill me-2"></i> 立即评价
                    </a>
                </div>
                <% } %>

                <!-- 评价展示区域 -->
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h4>委托评价</h4>
                        <span class="badge bg-light text-dark">
                                <%= commission.getEvalCount() != null ? commission.getEvalCount() : 0 %> 条评价
                            </span>
                    </div>
                    <div class="card-body">
                        <!-- 平均评分 -->
                        <div class="d-flex align-items-center mb-4">
                            <div class="rating mr-3">
                                <% for (int i = 1; i <= 5; i++) { %>
                                <span class="star <%= commission.getAvgScore() != null && i <= commission.getAvgScore() ? "filled" : "" %>">★</span>
                                <% } %>
                            </div>
                            <span class="h4 mb-0">
                                    <%= commission.getAvgScore() != null ? String.format("%.1f", commission.getAvgScore()) : "暂无评分" %>
                                </span>
                        </div>

                        <!-- 评价列表 -->
                        <% if (evaluations.isEmpty()) { %>
                        <div class="alert alert-info text-center">
                            暂无评价
                        </div>
                        <% } else { %>
                        <% for (Evaluation eval : evaluations) { %>
                        <div class="evaluation-card p-3 border rounded">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h5 class="mb-0">
                                    <%= eval.getUserName() != null ? eval.getUserName() :
                                            (eval.getUserType().equals("employer") ? "雇主" : "工人") %>
                                </h5>
                                <div class="rating">
                                    <% for (int i = 1; i <= 5; i++) { %>
                                    <span class="star <%= i <= eval.getScore() ? "filled" : "" %>">★</span>
                                    <% } %>
                                </div>
                            </div>
                            <p class="mb-2"><%= eval.getComment() %></p>
                            <div class="text-muted text-sm">
                                <%= eval.getCreateTime() %>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
                <% } else { %>
                <p class="text-danger">未找到该委托</p>
                <% } %>

                <a href="javascript:history.back()" class="btn btn-info">
                    <i class="bi bi-arrow-left me-2"></i> 返回
                </a>
            </div>
        </div>
    </div>
</section>

<!-- 底部版权信息 -->
<footer class="bg-dark text-light py-3">
    <div class="container text-center">
        <p>版权所有 &copy; 2025</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</body>
</html>

<!-- 辅助类定义 -->
<%!
    class Commission {
        private Integer id;
        private String title;
        private String description;
        private Integer employerId;
        private String employerName;
        private Integer workerId;
        private String workerName;
        private String state;
        private Double avgScore;
        private Integer evalCount;

        // Getters and setters
        public Integer getId() { return id; }
        public void setId(Integer id) { this.id = id; }
        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }
        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
        public Integer getEmployerId() { return employerId; }
        public void setEmployerId(Integer employerId) { this.employerId = employerId; }
        public String getEmployerName() { return employerName; }
        public void setEmployerName(String employerName) { this.employerName = employerName; }
        public Integer getWorkerId() { return workerId; }
        public void setWorkerId(Integer workerId) { this.workerId = workerId; }
        public String getWorkerName() { return workerName; }
        public void setWorkerName(String workerName) { this.workerName = workerName; }
        public String getState() { return state; }
        public void setState(String state) { this.state = state; }
        public Double getAvgScore() { return avgScore; }
        public void setAvgScore(Double avgScore) { this.avgScore = avgScore; }
        public Integer getEvalCount() { return evalCount; }
        public void setEvalCount(Integer evalCount) { this.evalCount = evalCount; }
    }

    class Evaluation {
        private Integer id;
        private Integer jobId;
        private Integer userId;
        private String userType;
        private String userName;
        private Integer score;
        private String comment;
        private Timestamp createTime;

        // Getters and setters
        public Integer getId() { return id; }
        public void setId(Integer id) { this.id = id; }
        public Integer getJobId() { return jobId; }
        public void setJobId(Integer jobId) { this.jobId = jobId; }
        public Integer getUserId() { return userId; }
        public void setUserId(Integer userId) { this.userId = userId; }
        public String getUserType() { return userType; }
        public void setUserType(String userType) { this.userType = userType; }
        public String getUserName() { return userName; }
        public void setUserName(String userName) { this.userName = userName; }
        public Integer getScore() { return score; }
        public void setScore(Integer score) { this.score = score; }
        public String getComment() { return comment; }
        public void setComment(String comment) { this.comment = comment; }
        public Timestamp getCreateTime() { return createTime; }
        public void setCreateTime(Timestamp createTime) { this.createTime = createTime; }
    }
%>