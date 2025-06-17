<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/30
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人登录 - 兼职服务平台</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <style>
        /* 全局样式优化 */
        body {
            background-color: #f8f9fa;
            font-family: 'Inter', system-ui, sans-serif;
        }

        .bg-secondary {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
        }

        .card {
            border-radius: 1rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .btn-primary {
            background-color: #3b82f6;
            border-color: #3b82f6;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-primary:hover {
            background-color: #2563eb;
            border-color: #1d4ed8;
            transform: translateY(-2px);
        }

        .btn-warning {
            background-color: #f59e0b;
            border-color: #f59e0b;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-warning:hover {
            background-color: #d97706;
            border-color: #b45309;
            transform: translateY(-2px);
        }

        .btn-info {
            background-color: #06b6d4;
            border-color: #06b6d4;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-info:hover {
            background-color: #0891b2;
            border-color: #0e7490;
            transform: translateY(-2px);
        }

        .form-control {
            border-radius: 0.5rem;
            padding: 0.75rem 1rem;
            border: 1px solid #e5e7eb;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.3);
            outline: none;
        }

        .form-check-input:checked {
            background-color: #3b82f6;
            border-color: #3b82f6;
        }

        .form-check-input:focus {
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.3);
        }

        .text-warning {
            color: #f59e0b !important;
        }

        .login-icon {
            color: #3b82f6;
            font-size: 4rem;
            margin-bottom: 1.5rem;
        }

        .card-title {
            font-weight: 700;
            color: #1f2937;
        }

        .card-subtitle {
            color: #6b7280;
            margin-bottom: 2rem;
        }

        .footer {
            background-color: #1e293b;
            color: #94a3b8;
        }
    </style>
    <script>
        // 声明一个函数，当自动登录被选中时，把记住密码也选中
        function autoLogin() {
            // 获取自动登录的复选框对象
            var W_autoLoginCheck = document.getElementById("W_autoLoginCheck");
            // 判断该元素是否被选中
            if (W_autoLoginCheck.checked) {
                // 自动登录被选中
                // 获取记住密码的对象，设置记住密码被选中(checked为true表示被勾选)
                document.getElementById("W_savePasswordCheck").checked = true;
            }
        }

        // 声明一个函数，当取消记住密码时，把自动登录也取消
        function savePassword() {
            // 获取记住密码的复选框对象
            var W_savePasswordCheck = document.getElementById("W_savePasswordCheck");
            // 判断该元素是否被选中
            if (W_savePasswordCheck.checked === false) {
                // 被取消
                // 获取自动登录的对象，设置自动登录被取消(checked为true表示被勾选)
                document.getElementById("W_autoLoginCheck").checked = false;
            }
        }

        // 添加表单提交动画
        document.getElementById('login').addEventListener('click', function(e) {
            this.innerHTML = '<i class="bi bi-box-arrow-in-right me-2"></i> 登录中...';
            this.disabled = true;
        });
    </script>
</head>

<body class="min-vh-100 d-flex flex-column">
<!-- 固定菜单栏 -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary shadow-lg">
    <!-- 导航栏里的内容居中 -->
    <div class="container">
        <a href="${pageContext.request.contextPath}" class="navbar-brand fw-bold">
            <i class="bi bi-briefcase me-2"></i>兼职服务平台
        </a>

        <!-- 设置一个导航栏切换器按钮 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="worker_login.jsp">
                        <i class="bi bi-person-circle me-2"></i>个人登录
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 登录表单 -->
<section class="flex-grow-1 d-flex align-items-center py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card bg-white p-5">
                    <div class="text-center mb-4">
                        <i class="bi bi-person-circle login-icon"></i>
                        <h2 class="card-title">个人登录</h2>
                        <p class="card-subtitle">欢迎回来，请登录您的账号</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/doWorkerLogin" method="post">
                        <div class="mb-4">
                            <div class="input-group">
                                    <span class="input-group-text bg-light">
                                        <i class="bi bi-person"></i>
                                    </span>
                                <input type="text" class="form-control" name="w_name" required
                                       placeholder="请输入用户名" value="${cookie.w_name.value}"
                                       aria-label="用户名">
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="input-group">
                                    <span class="input-group-text bg-light">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                <input type="password" class="form-control" name="w_pwd" required
                                       placeholder="请输入密码" value="${cookie.w_pwd.value}"
                                       aria-label="密码">
                            </div>
                        </div>

                        <div class="d-grid gap-3 my-4">
                            <button id="login" type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-box-arrow-in-right me-2"></i>登录
                            </button>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="W_autoLoginCheck"
                                           name="W_autoLoginCheck" value="1"
                                           <c:if test="${cookie.W_autoLoginCheck.value == 1}">checked</c:if>
                                           onchange="autoLogin()">
                                    <label class="form-check-label" for="W_autoLoginCheck">
                                        <i class="bi bi-shield-check me-1"></i>自动登录
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6 text-end">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="W_savePasswordCheck"
                                           name="W_savePasswordCheck" value="1"
                                           <c:if test="${cookie.W_savePasswordCheck.value == 1}">checked</c:if>
                                           onchange="savePassword()">
                                    <label class="form-check-label" for="W_savePasswordCheck">
                                        <i class="bi bi-key me-1"></i>保存密码
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4 text-center">
                            <p>还没有求职者账户？快去点击下方<span class="text-warning fw-bold">注册</span>按钮吧！</p>
                        </div>

                        <div class="d-grid gap-3 my-4">
                            <button type="button" class="btn btn-warning btn-lg"
                                    onclick="location.href = '${pageContext.request.contextPath}/JSP/worker/worker_register.jsp'">
                                <i class="bi bi-person-plus-fill me-2"></i>立即注册
                            </button>
                        </div>

                        <div class="d-grid gap-3">
                            <a href="javascript:history.back()" class="btn btn-info btn-lg">
                                <i class="bi bi-arrow-left-circle me-2"></i>返回上一级
                            </a>
                        </div>

                        <c:if test="${cookie.W_autoLoginCheck.value == 1}">
                            <script>
                                // 自动登录
                                // 获取登录按钮，自动点击
                                document.getElementById("login").click();
                            </script>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 底部版权信息 -->
<footer class="footer py-4">
    <div class="container text-center">
        <p class="mb-0">© 2025 兼职服务平台 - 版权所有</p>
        <div class="mt-2 text-sm">
            <a href="#" class="text-muted me-3">隐私政策</a>
            <a href="#" class="text-muted me-3">用户协议</a>
            <a href="#" class="text-muted">帮助中心</a>
        </div>
    </div>
</footer>

<!-- 引入js文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</body>
</html>