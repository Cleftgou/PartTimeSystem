<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/28
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人注册</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <style>
    </style>
    <%--    引入js文件--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            let flag = false;

            $("#w_name").blur(function () {
                let w_name = $(this).val();
                if (w_name.trim() !== "") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/doWorkerSelectByName",
                        type: "post",
                        data: "w_name=" + w_name,
                        success: function (msg) {
                            if (msg === "no") {
                                flag = false;
                                //id选择器选中span
                                $("#message").html("此账号已被注册!!!").attr("style", "color:red");
                            } else if (msg === "ok") {
                                flag = true;
                                $("#message").html("用户名可以使用").attr("style", "color:blue");
                            }
                        }, error: function () {
                            alert("ajax请求失败!!!");
                        }
                    });
                } else {
                    $("#message").html("");
                }
            });

            $("form").submit(function (event) {
                $("#w_name").focus();
                if (flag === false) {
                    //阻止表单提交
                    event.preventDefault();
                }
            });
        });
    </script>
</head>

<body>
<!-- 固定菜单栏 -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
    <!-- 导航栏里的内容居中 -->
    <div class="container">
        <a href="../../index.jsp" class="navbar-brand">兼职服务平台</a>

        <!-- 设置一个导航栏切换器按钮，这个切换器按钮通过navameny包括下面的测试文字*3 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <!-- margin start = margin left -->
                <li class="nav-item">
                    <a class="nav-link" href="worker_login.jsp"><i class="bi bi-person-badge"></i>个人登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 注册表单 -->
<section class="p-5 bg-secondary text-light">
    <!-- 内容居中 -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <h1 class="text-center mb-4">注册成为个人求职者</h1>
                <form action="${pageContext.request.contextPath}/doWorkerRegister" method="post">
                    <div class="mb-3">
                        <input type="text" id="w_name" class="form-control" name="w_name" required placeholder="用户名">
                        <span id="message"></span>
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" name="w_pwd" required placeholder="密码">
                    </div>
                    <div class="d-grid gap-2 my-3">
                        <button type="submit" class="btn btn-primary btn-lg">注册</button>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="javascript:history.back()" class="btn btn-info btn-lg">返回上一级</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- 兼职求职者优势展示区 -->
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
                <h2>海量兼职机会，灵活时间安排</h2>
                <!-- 一个字体样式 -->
                <p class="lead">轻松找到适合你的兼职工作，开启灵活收入新方式</p>
                <p>
                    无论你是学生、上班族还是自由职业者，我们都能为你提供丰富的兼职选择。<br>
                    <br>
                    平台汇聚餐饮服务、零售促销、活动执行、家教辅导等多种类型兼职，满足你的技能和时间需求。
                </p>
                <a href="" class="btn btn-light">查看热门兼职</a>
            </div>
        </div>
    </div>
</section>

<!-- 求职者服务功能区 -->
<section class="p-5 bg-dark text-light">
    <!-- 创建一个定宽的容器，在小屏幕设备上居中对齐。 -->
    <div class="container">
        <!-- 水平和垂直居中 -->
        <div class="row align-items-center justify-content-between">
            <div class="col-md">
                <h2>全方位服务保障，求职无忧</h2>
                <!-- 一个字体样式 -->
                <p class="lead">从注册到上岗，我们全程为你提供专业支持</p>
                <p>
                    所有兼职信息均经过严格审核，确保真实可靠。我们还提供：
                </p>
                <ul class="mt-3">
                    <li><i class="bi bi-check-circle text-success"></i> 智能匹配系统，精准推荐适合你的兼职</li>
                    <li><i class="bi bi-check-circle text-success"></i> 简历模板与优化建议，提升求职成功率</li>
                    <li><i class="bi bi-check-circle text-success"></i> 在线沟通工具，直接与雇主交流</li>
                    <li><i class="bi bi-check-circle text-success"></i> 薪资保障机制，确保劳动所得</li>
                </ul>
                <a href="" class="btn btn-light">了解服务详情</a>
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
        <p>版权所有 &copy; 2025</p>
    </div>
</footer>

<!-- 引入js文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</body>
</html>