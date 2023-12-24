<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/27
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>发布委托</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<c:if test="${sessionScope.employer.e_name == null}">
    <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.employer.e_name != null}">
<!-- 固定菜单栏 -->
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/JSP/employer/employer_login.jsp"><i class="bi bi-people-fill"></i>切换账号</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="commission_pub.jsp"><i class="bi bi-clipboard-plus-fill"></i>发布委托</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <section class="p-5 bg-secondary text-light">
        <!-- 内容居中 -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <h1 class="text-center mb-4">发布委托</h1>
                    <form action="${pageContext.request.contextPath}/doCommissionPub" method="post">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="c_title" required placeholder="委托标题">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="c_description" required placeholder="委托描述">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="c_state" value="true" required placeholder="委托状态(默认是true)">
                        </div>

                        <input class="form-control"
                               type="text" name="c_employer_id"
                               value="${sessionScope.employer.e_id}"
                               aria-label="readonly input example"
                               readonly>

                        <div class="d-grid gap-2 my-3">
                            <button type="submit" class="btn btn-primary btn-lg">发布委托</button>
                        </div>
                        <div class="d-grid gap-2">
                            <a href="javascript:history.back()" class="btn btn-info btn-lg">返回上一级</a>
                        </div>
                    </form>
                </div>
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
                    <img src="${pageContext.request.contextPath}/static/img/测试图片.png" alt="error" class="img-fluid">
                </div>
                <div class="col-md">
                    <h2>测试代码</h2>
                    <!-- 一个字体样式 -->
                    <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia fugit maxime ea
                        expedita,
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta, rerum aliquam beatae tenetur
                        ipsam laboriosam aut eveniet cumque! Molestias corrupti sunt quasi fuga eos velit sit repellat
                        sapiente id nesciunt!
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
                    <h2>测试代码</h2>
                    <!-- 一个字体样式 -->
                    <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia fugit maxime ea
                        expedita,
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta, rerum aliquam beatae tenetur
                        ipsam laboriosam aut eveniet cumque! Molestias corrupti sunt quasi fuga eos velit sit repellat
                        sapiente id nesciunt!
                    </p>
                    <a href="" class="btn btn-light">查看详情</a>
                </div>
                <div class="col-md p-5">
                    <!-- img-fluid不超过这个div的大小 -->
                    <img src="${pageContext.request.contextPath}/static/img/测试图片.png" alt="error" class="img-fluid">
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

<!-- 引入js文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</c:if>
</body>
</html>
