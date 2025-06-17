<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败 - 兼职服务平台</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f9fafb;
            font-family: 'Inter', system-ui, sans-serif;
            color: #1f2937;
        }

        .error-container {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .error-card {
            background-color: white;
            border-radius: 1.5rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.03);
            padding: 3rem;
            max-width: 500px;
            width: 100%;
            text-align: center;
            border: 1px solid #e5e7eb;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .error-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .error-icon {
            color: #374151;
            font-size: 5rem;
            margin-bottom: 2rem;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .error-title {
            font-size: 2rem;
            font-weight: 700;
            color: #111827;
            margin-bottom: 1rem;
        }

        .error-message {
            font-size: 1.1rem;
            color: #4b5563;
            margin-bottom: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background-color: #1f2937;
            border-color: #1f2937;
            color: white;
        }

        .btn-primary:hover {
            background-color: #111827;
            border-color: #111827;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: #f3f4f6;
            border-color: #e5e7eb;
            color: #4b5563;
        }

        .btn-secondary:hover {
            background-color: #e5e7eb;
            border-color: #d1d5db;
            transform: translateY(-2px);
        }

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: #1f2937;
            color: #9ca3af;
            text-align: center;
            padding: 1rem 0;
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-card">
        <i class="bi bi-exclamation-circle-fill error-icon"></i>
        <h1 class="error-title">登录失败</h1>
        <p class="error-message">抱歉，您的用户名或密码不正确，请重试。</p>
        <div class="d-grid gap-3">
            <button class="btn btn-primary" onclick="history.back()">
                <i class="bi bi-arrow-left-circle me-2"></i>返回登录
            </button>

            <div class="row g-3">
                <div class="col-md-6">
                    <a href="${pageContext.request.contextPath}/JSP/worker/worker_register.jsp" class="btn btn-secondary w-100">
                        <i class="bi bi-person-plus-fill me-2"></i>用户注册
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="${pageContext.request.contextPath}/JSP/employer/employer_register.jsp" class="btn btn-secondary w-100">
                        <i class="bi bi-shop me-2"></i>商家注册
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="mb-0">© 2025 兼职服务平台 - 版权所有</p>
    </div>
</footer>
</body>
</html>