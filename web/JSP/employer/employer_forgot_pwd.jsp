<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/12/10
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家重置密码</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        //jQuery页面加载完成：()
        $(function () {
            //先隐藏密码框
            $(".pwd").hide();
            //定义变量用于判断账号和邮箱是否验证成功
            var isNameValid = false;
            var isEmailValid = false;

            //给账号和邮箱文本框绑定失去焦点事件，使用class选择器
            $(".validate-input").blur(function () {//失去焦点后要做的事情
                var e_name = $("#e_name").val();
                var e_email = $("#e_email").val();

                //判断账号和邮箱是否不为空
                if (e_name.trim() !== "" && e_email.trim() !== "") {
                    //利用Ajax把账号和邮箱传给服务器进行验证
                    $.ajax({
                        url: "${pageContext.request.contextPath}/doEmployerSelectByName_Email",
                        type: "post",
                        data: {
                            "e_name": e_name,
                            "e_email": e_email,
                        },
                        success: function (msg) {//请求成功的回调函数
                            if (msg === "ok") {
                                $("span.name-message").html("用户名正确").attr("style", "color:blue");
                                isNameValid = true;
                                $("span.email-message").html("邮箱正确").attr("style", "color:blue");
                                isEmailValid = true;
                                checkValidation();
                            } else if (msg === "no") {
                                $("span.name-message").html("用户名或邮箱输入有误，请重新输入！！！").attr("style", "color:red");
                                isNameValid = false;
                                $("span.email-message").html("用户名或邮箱输入有误，请重新输入！！！").attr("style", "color:red");
                                isEmailValid = false;
                                checkValidation();
                            }
                        },
                        error: function () {//请求失败的回调函数
                            alert("ajax请求失败!!!");
                        }
                    });
                } else {
                    $("span.name-message").html("");
                    isNameValid = false;
                    $("span.email-message").html("");
                    isEmailValid = false;
                    checkValidation();
                }
            });

            //检查账号和邮箱是否验证成功
            function checkValidation() {
                if (isNameValid && isEmailValid) {
                    $(".pwd").show();//显示密码框
                    $("#e_name, #e_email").attr("readonly", true);
                    $("button").html("提交").unbind("click").bind("click", function () {
                        var e_pwd = $("#e_pwd").val().trim();
                        var e_repwd = $("#e_repwd").val().trim();
                        if (e_pwd !== "" && e_repwd !== "" && e_pwd === e_repwd) {
                            location.href = "${pageContext.request.contextPath}/doEmployerUpdatePwdByNameEmail?e_name=" + $("#e_name").val() + "&e_pwd=" + e_pwd + "&e_email=" + $("#e_email").val();
                            alert("修改密码成功！！！");
                        } else {
                            alert("密码为空或者两次密码不一致！！！");
                        }
                    });
                } else {
                    $(".pwd").hide();//隐藏密码框
                }
            }
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

<section class="p-5 bg-secondary text-light">
    <!-- 内容居中 -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <h1 class="text-center mb-4">商家重置密码</h1>
                <div class="mb-3">
                    <input type="text" id="e_name" class="form-control validate-input" name="e_name" required placeholder="用户名">
                    <span id="message" class="name-message"></span>
                </div>
                <div class="mb-3">
                    <input type="text" id="e_email" class="form-control validate-input" name="e_email" required placeholder="邮箱地址">
                    <span id="messages" class="email-message"></span>
                </div>

                <div class="mb-3 pwd">
                    <input type="password" class="form-control" name="e_pwd" id="e_pwd" required placeholder="密码">
                </div>
                <div class="mb-3 pwd">
                    <input type="password" class="form-control" name="e_repwd" id="e_repwd" required placeholder="确认密码">
                </div>

                <div class="d-grid gap-2 my-3">
                    <button type="submit" class="btn btn-primary btn-lg">下一步</button>
                </div>
                <div class="d-grid gap-2">
                    <a href="javascript:history.back()" class="btn btn-info btn-lg">返回上一级</a>
                </div>
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

<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</body>
</html>
