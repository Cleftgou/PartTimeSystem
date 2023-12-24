<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/30
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>雇主个人空间界面</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script>
        //定义删除委托的方法（提示信息）
        function delCommission(c_id){
            var bo = confirm("是否确认删除编号为"+c_id+"的委托");
            if (bo){
                //确认删除
                //提交请求到委托服务器的删除功能：
                location.href="${pageContext.request.contextPath}/doDeleteCommissionById?c_id="+c_id;
            }
        }

        //定义修改委托的方法（提示信息）
        function updateCommission(c_title){
            var bo = confirm("是否确认修改名称为"+c_title+"的委托");
            if (bo){
                //确认删除
                //提交请求到委托服务器的删除功能：
                location.href="${pageContext.request.contextPath}/doCommissionSelect?c_title="+c_title;
            }
        }
    </script>
</head>
<body>
<c:if test="${sessionScope.employer.e_name == null}">
    <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.employer.e_name != null}">
<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
    <!-- 导航栏里的内容居中 -->
    <div class="container">
        <a href="${pageContext.request.contextPath}" class="navbar-brand">兼职服务平台</a>

        <!-- 设置一个导航栏切换器按钮，这个切换器按钮通过navameny包括下面的测试文字*3 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <!-- margin start = margin left -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/doEmployerExit"><i class="bi bi-box-arrow-in-left"></i>退出登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/JSP/commission/commission_pub.jsp"><i class="bi bi-clipboard-plus-fill"></i>发布委托</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-person-circle"></i>我的</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="p-5 bg-secondary text-light">
    <!-- 创建一个定宽的容器，在小屏幕设备上居中对齐。 -->
    <div class="container">
        <!-- 水平和垂直居中 -->
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">e_name: ${sessionScope.employer.e_name}</h5>
                <p class="card-text">ID: ${sessionScope.employer.e_id}</p>
                <p class="card-text">email: ${sessionScope.employer.e_email}</p>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">个人简介</h5>
                <p class="card-text">欢迎来到我的个人空间！通过我的个人空间，您可以了解更多关于我和我的企业的信息。</p>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-body">
<%--                使用ajax应该可以解决每次都要刷新的问题--%>
                <h5 class="card-title">加载已发布的委托</h5>
                <a class="card-text" href="${pageContext.request.contextPath}/doSelectCommissionByE_name?e_name=${sessionScope.employer.e_name}">刷新委托列表</a>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-body">
                <c:forEach items="${requestScope.commissionListByE_name}" var="commission" varStatus="commissionStatus">
                <h5 class="card-title">委托${commissionStatus.count}</h5>
                <ul class="list-group">
                    <li class="list-group-item">委托编号 ${commission.c_id}</li>
                    <li class="list-group-item">委托标题 ${commission.c_title}</li>
                    <li class="list-group-item">委托描述 ${commission.c_description}</li>
                    <li class="list-group-item">委托状态 ${commission.c_state}</li>
                    <li class="list-group-item">委托发布人 ${commission.c_employer_id}</li>
                    <li class="list-group-item">委托接取人 ${commission.w_id}</li>
                    <li class="list-group-item">
                        <a href="javascript:delCommission(${commission.c_id})" class="btn btn-danger">删除此委托</a>
                        <a href="javascript:updateCommission('${commission.c_title}')" class="btn btn-danger">修改此委托</a>
                    </li>
                </ul>
                </c:forEach>
            </div>
        </div>

        <div class="d-grid gap-2">
            <a href="${pageContext.request.contextPath}" class="btn btn-info btn-lg">返回到主页</a>
        </div>
    </div>
</section>

<section class="p-5">
    <!-- 创建一个定宽的容器，在小屏幕设备上居中对齐。 -->
    <div class="container">
        <!-- 水平和垂直居中 -->
        <div class="row align-items-center justify-content-between">
            <div class="col-md p-5">
                <!-- img-fluid不超过这个div的大小 -->
                <img src="${pageContext.request.contextPath}/static/img/商家个人空间1.png" alt="error" class="img-fluid">
            </div>
            <div class="col-md">
                <h2>共同进步</h2>
                <!-- 一个字体样式 -->
                <p class="lead">
                    我们的平台以客户需求为导向，精心挑选高品质商品，
                </p>
                <p>
                    我们的优秀团队将竭尽全力为您提供全方位的支持，确保您获得最佳的营销效果和用户满意度。
                    我们非常注重与商家的沟通和互动。如果您有任何问题、建议或需求，请随时联系我们的客服团队，我们将竭诚为您解答和提供专业的支持。
                </p>
                <a href="" class="btn btn-light">查看详情</a>
            </div>
        </div>
    </div>
</section>

<section class="p-5 bg-dark text-light">
    <!-- 创建一个定宽的容器，在小屏幕设备上居中对齐。 -->
    <div class="container">
        <!-- 水平和垂直居中 -->
        <div class="row align-items-center justify-content-between">
            <div class="col-md">
                <h2>高效合作</h2>
                <!-- 一个字体样式 -->
                <p class="lead">
                    我们的平台为商家提供了一个便捷、安全的渠道，让您可以发布委托需求并与合适的服务提供者进行合作。
                </p>
                <p>
                    通过我们的平台，您可以快速发布委托需求，并在短时间内收到多个合格的报价和竞标。
                    我们与大量经过严格筛选的服务提供者合作，确保他们具备高素质、专业的技能和经验，以满足您的各项需求。
                </p>
                <a href="" class="btn btn-light">查看详情</a>
            </div>
            <div class="col-md p-5">
                <!-- img-fluid不超过这个div的大小 -->
                <img src="${pageContext.request.contextPath}/static/img/商家个人空间2.png" alt="error" class="img-fluid">
            </div>
        </div>
    </div>
</section>

<!-- 底部版权信息 -->
<footer class="bg-dark text-light py-3">
    <div class="container text-center">
        <p>版权所有 &copy; 2023</p>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</c:if>
</body>
</html>
