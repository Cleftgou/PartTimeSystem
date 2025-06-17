<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>求职者个人空间界面</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script>
        // 放弃委托的方法
        function outCommission(c_id){
            var bo = confirm("是否确认放弃编号为"+c_id+"的委托");
            if (bo){
                location.href="${pageContext.request.contextPath}/doUpdateStateWorkerId?c_state=true&c_id="+c_id+"&w_id=0";
            }
        }

        // 标记委托为已完成的方法
        function updateCommission(c_id){
            var bo = confirm("是否确认已完成编号为"+c_id+"的委托");
            if (bo){
                location.href="${pageContext.request.contextPath}/doUpdateStateWorkerId?c_state=success&c_id="+c_id+"&w_id=0";
            }
        }

        // 前往评价页面的方法
        function goToEvaluate(c_id){
            location.href="${pageContext.request.contextPath}/commission_detail.jsp?job_id="+c_id;
        }
    </script>
</head>
<body>
<c:if test="${sessionScope.worker.w_name == null}">
    <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.worker.w_name != null}">
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
        <div class="container">
            <a href="${pageContext.request.contextPath}" class="navbar-brand">兼职服务平台</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navmenu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/doWorkerExit"><i class="bi bi-box-arrow-in-left"></i>退出登录</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/doGetCommissionPage"><i class="bi bi-clipboard-plus-fill"></i>委托广场</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-person-circle"></i>我的</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="p-5 bg-secondary text-light">
        <div class="container">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">用户名: ${sessionScope.worker.w_name}</h5>
                    <p class="card-text">ID: ${sessionScope.worker.w_id}</p>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">个人简介</h5>
                    <p class="card-text">我是一名积极进取、富有激情的求职者，对于机会充满期待。</p>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="card-title">已接取的委托</h5>
                        <!-- 新增：查看已完成委托按钮 -->
                        <a href="${pageContext.request.contextPath}/doSelectCompletedCommissionByW_id?w_id=${sessionScope.worker.w_id}"
                           class="btn btn-success">
                            <i class="bi bi-check-circle me-2"></i> 查看已完成委托
                        </a>
                    </div>
                    <a class="card-text" href="${pageContext.request.contextPath}/doSelectCommissionByW_name?w_name=${sessionScope.worker.w_name}">刷新委托列表</a>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-body">
                    <c:forEach items="${requestScope.commissionListByW_name}" var="commission" varStatus="commissionStatus">
                        <div class="border p-3 mb-3 rounded">
                            <h5 class="mb-3">委托 ${commissionStatus.count}</h5>
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>委托编号</span>
                                    <span>${commission.c_id}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>委托标题</span>
                                    <span>${commission.c_title}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>委托描述</span>
                                    <span>${commission.c_description}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>委托状态</span>
                                    <span>
                                        <c:if test="${commission.c_state == 'true'}">
                                            <span class="badge bg-success">可接取</span>
                                        </c:if>
                                        <c:if test="${commission.c_state == 'false'}">
                                            <span class="badge bg-warning">已接取</span>
                                        </c:if>
                                        <c:if test="${commission.c_state == 'success'}">
                                            <span class="badge bg-secondary">已完成</span>
                                        </c:if>
                                    </span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>委托发布人</span>
                                    <span>${commission.c_employer_id}</span>
                                </li>
                            </ul>

                            <div class="d-flex gap-2">
                                <a href="javascript:outCommission(${commission.c_id})" class="btn btn-danger">
                                    <i class="bi bi-x-circle me-1"></i> 放弃委托
                                </a>
                                <a href="javascript:updateCommission(${commission.c_id})" class="btn btn-primary">
                                    <i class="bi bi-check-circle me-1"></i> 完成委托
                                </a>

                                <!-- 新增：评价按钮（仅已完成委托显示） -->
                                <c:if test="${commission.c_state == 'success'}">
                                    <a href="javascript:goToEvaluate(${commission.c_id})" class="btn btn-warning">
                                        <i class="bi bi-star me-1"></i> 评价委托
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}" class="btn btn-info btn-lg">返回到主页</a>
            </div>
        </div>
    </section>

    <section class="p-5">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md p-5">
                    <img src="${pageContext.request.contextPath}/static/img/求职者个人空间1.png" alt="error" class="img-fluid">
                </div>
                <div class="col-md">
                    <h2>积极沟通</h2>
                    <p class="lead">
                        在兼职的过程中，遇到问题是难免的，但不要因此气馁或者放弃。
                    </p>
                    <p>
                        兼职平台作为你的支持和指导者，会提供专业的帮助和解决方案，帮助你克服困难并取得成功。
                        无论是遇到技术困扰、合作纠纷还是其他挑战，坦诚地与兼职平台分享你的问题，共同寻找最佳解决方案。
                    </p>
                    <a href="" class="btn btn-light">查看详情</a>
                </div>
            </div>
        </div>
    </section>

    <section class="p-5 bg-dark text-light">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md">
                    <h2>勇往直前</h2>
                    <p class="lead">
                        当你来到这里，你已经展现了对自己未来的无限可能的渴望和追求。
                    </p>
                    <p>
                        在这个充满机遇的世界里，每一个兼职委托都是一次锻炼自我的机会，是你展示专业能力、结识新朋友、拓展人脉圈的舞台。
                        不要畏惧失败，因为失败会让你更加坚强。勇敢地迈出第一步，接取兼职委托，
                    </p>
                    <a href="" class="btn btn-light">查看详情</a>
                </div>
                <div class="col-md p-5">
                    <img src="${pageContext.request.contextPath}/static/img/求职者个人空间2.png" alt="error" class="img-fluid">
                </div>
            </div>
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