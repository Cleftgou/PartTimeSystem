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
    <title>个人登录</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script>
        //声明一个函数，当自动登录被选中时，把记住密码也选中
        function autoLogin(){
            //获取自动登录的复选框对象
            var W_autoLoginCheck = document.getElementById("W_autoLoginCheck");
            //判断该元素是否被选中
            if (W_autoLoginCheck.checked) {
                //自动登录被选中
                //获取记住密码的对象，设置记住密码被选中(checked为true表示被勾选)
                document.getElementById("W_savePasswordCheck").checked=true;
            }
        }

        //声明一个函数，当取消记住密码时，把自动登录也取消
        function savePassword(){
            //获取记住密码的复选框对象
            var W_savePasswordCheck = document.getElementById("W_savePasswordCheck");
            //判断该元素是否被选中
            if (W_savePasswordCheck.checked === false) {
                //被取消
                //获取自动登录的对象，设置自动登录被取消(checked为true表示被勾选)
                document.getElementById("W_autoLoginCheck").checked=false;
            }
        }
    </script>
</head>

<body>
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
                <h1 class="text-center mb-4">个人登录</h1>
                <form action="${pageContext.request.contextPath}/doWorkerLogin" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="w_name" required placeholder="用户名" value="${cookie.w_name.value}">
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" name="w_pwd" required placeholder="密码" value="${cookie.w_pwd.value}">
                    </div>
                    <div class="d-grid gap-2 my-3">
                        <button id="login" type="submit" class="btn btn-primary btn-lg">登录</button>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="W_autoLoginCheck" name="W_autoLoginCheck" value="1"
                                       <c:if test="${cookie.W_autoLoginCheck.value == 1}">checked</c:if>
                                       onchange="autoLogin()">
                                <label class="form-check-label" for="W_autoLoginCheck">自动登录</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="W_savePasswordCheck" name="W_savePasswordCheck" value="1"
                                       <c:if test="${cookie.W_savePasswordCheck.value == 1}">checked</c:if>
                                       onchange="savePassword()">
                                <label class="form-check-label" for="W_savePasswordCheck">保存密码</label>
                            </div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <h4>还没有求职者账户？快去点击下方<span class="text-warning">注册</span>按钮吧！</h4>
                    </div>
                    <div class="d-grid gap-2 my-3">
                        <button type="button"
                                class="btn btn-warning btn-lg"
                        <%--                                onclick='window.open("employer_register.jsp")'--%>
                                onclick="location.href = '${pageContext.request.contextPath}/JSP/worker/worker_register.jsp'"
                        >注册</button>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="javascript:history.back()" class="btn btn-info btn-lg">返回上一级</a>
                    </div>
                    <c:if test="${cookie.W_autoLoginCheck.value == 1}">
                        <script>
                            //自动登录
                            //获取登录按钮，自动点击
                            document.getElementById("login").click();
                        </script>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</section>

<section class="p-5">
    <div class="container">
        <h2 class="text-center">常见问题</h2>
        <!-- 手风琴组件 -->
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        Accordion Item #1
                    </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse show"
                     data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">Placeholder content for this accordion, which is intended to
                        demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion
                        body.</div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        Accordion Item #2
                    </button>
                </h2>
                <div id="flush-collapseTwo" class="accordion-collapse collapse"
                     data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">Placeholder content for this accordion, which is intended to
                        demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion
                        body. Let's imagine this being filled with some actual content.</div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseThree" aria-expanded="false"
                            aria-controls="flush-collapseThree">
                        Accordion Item #3
                    </button>
                </h2>
                <div id="flush-collapseThree" class="accordion-collapse collapse"
                     data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">Placeholder content for this accordion, which is intended to
                        demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion
                        body. Nothing more exciting happening here in terms of content, but just filling up the
                        space to make it look, at least at first glance, a bit more representative of how this would
                        look in a real-world application.</div>
                </div>
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
</body>
</html>


