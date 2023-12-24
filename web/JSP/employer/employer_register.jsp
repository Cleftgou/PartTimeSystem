<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/26
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商家注册</title>
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

            $("#e_email").blur(function () {
                let e_email = $(this).val();
                if (e_email.trim() !== "") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/doEmployerSelectByEmail",
                        type: "post",
                        data: "e_email=" + e_email,
                        success: function (msg) {
                            if (msg === "no") {
                                flag = false;
                                //id选择器选中span
                                $("#messages").html("此邮箱已被注册!!!").attr("style", "color:red");
                            } else if (msg === "ok") {
                                flag = true;
                                $("#messages").html("邮箱可以使用").attr("style", "color:blue");
                            }
                        }, error: function () {
                            alert("ajax请求失败!!!");
                        }
                    });
                } else {
                    $("#messages").html("");
                }
            });

            $("form").submit(function (event) {
                $("#e_email").focus();
                if (flag === false) {
                    //阻止表单提交
                    alert("都说你邮箱已经注册过了！！！")
                    event.preventDefault();
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            let flag = false;

            $("#e_name").blur(function () {
                let e_name = $(this).val();
                if (e_name.trim() !== "") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/doEmployerSelectByName",
                        type: "post",
                        data: "e_name=" + e_name,
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
                $("#e_name").focus();
                if (flag === false) {
                    //阻止表单提交
                    alert("都说你用户名不能用了！！！");
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
        <a href="${pageContext.request.contextPath}" class="navbar-brand">兼职服务平台</a>

        <!-- 设置一个导航栏切换器按钮，这个切换器按钮通过navameny包括下面的测试文字*3 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <!-- margin start = margin left -->
                <li class="nav-item">
                    <a class="nav-link" href="employer_login.jsp"><i class="bi bi-person-badge-fill"></i>商家登录</a>
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
                <h1 class="text-center mb-4">注册成为商家</h1>
                <form action="${pageContext.request.contextPath}/doEmployerRegister" method="post">
                    <div class="mb-3">
                        <input type="text" id="e_name" class="form-control" name="e_name" required placeholder="用户名">
                        <span id="message"></span>
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" name="e_pwd" required placeholder="密码">
                    </div>
                    <div class="mb-3">
                        <input type="text" id="e_email" class="form-control" name="e_email" required placeholder="邮箱地址">
                        <span id="messages"></span>
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
</body>
</html>

