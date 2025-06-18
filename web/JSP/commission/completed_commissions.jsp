<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>已完成委托 - 求职者中心</title>
  <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
  <script>
    // 前往评价页面的函数
    function goToEvaluate(c_id) {
      location.href = "${pageContext.request.contextPath}/JSP/commission_evaluation/commission_evaluation.jsp?job_id=" + c_id;
    }
  </script>
</head>
<body>
<c:if test="${sessionScope.worker.w_name == null}">
  <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.worker.w_name != null}">
  <!-- 导航栏 -->
  <nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
    <div class="container">
      <a href="${pageContext.request.contextPath}" class="navbar-brand">兼职服务平台</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navmenu">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/doWorkerExit">
              <i class="bi bi-box-arrow-in-left"></i>退出登录
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/doGetCommissionPage">
              <i class="bi bi-clipboard-plus-fill"></i>委托广场
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="bi bi-person-circle"></i>我的
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div style="height: 60px;"></div>

  <section class="p-5 bg-secondary text-light">
    <div class="container">
      <div class="row justify-content-between align-items-center mb-4">
        <div class="col">
          <h1 class="display-5">已完成委托</h1>
        </div>
        <div class="col text-end">
          <a href="${pageContext.request.contextPath}/JSP/worker/worker_detail.jsp" class="btn btn-info">
            <i class="bi bi-arrow-left me-2"></i> 返回个人中心
          </a>
        </div>
      </div>

      <c:if test="${empty requestScope.completedCommissions}">
        <div class="alert alert-info text-center py-5">
          <i class="bi bi-info-circle text-3xl mb-3"></i>
          <h4>暂无已完成的委托</h4>
          <p>你还没有完成任何委托，快去接取委托吧！</p>
          <a href="${pageContext.request.contextPath}/doGetCommissionPage" class="btn btn-primary mt-3">
            <i class="bi bi-clipboard-plus me-2"></i> 查看委托广场
          </a>
        </div>
      </c:if>


      <c:if test="${not empty requestScope.completedCommissions}">
        <div class="row row-cols-1 row-cols-md-2 g-4">
          <c:forEach items="${requestScope.completedCommissions}" var="commission">
            <div class="col">
              <div class="card h-100 border border-secondary">
                <div class="card-header bg-secondary text-white">
                  <h5 class="card-title mb-0">委托 #${commission.c_id}</h5>
                </div>
                <div class="card-body">
                  <p class="card-text"><strong>标题：</strong>${commission.c_title}</p>
                  <p class="card-text"><strong>描述：</strong>${commission.c_description}</p>
                  <p class="card-text"><strong>状态：</strong>
                    <span class="badge bg-secondary">已完成</span>
                  </p>
                  <div class="mt-4 text-center">
                    <a href="javascript:goToEvaluate(${commission.c_id})" class="btn btn-warning w-100">
                      <i class="bi bi-star me-2"></i> 评价此委托
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </c:if>
    </div>
  </section>
  <footer class="bg-dark text-light py-3">
    <div class="container text-center">
      <p>版权所有 &copy; 2025</p>
    </div>
  </footer>
  <script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</c:if>
</body>
</html>