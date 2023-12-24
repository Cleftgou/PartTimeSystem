<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/30
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>求职者个人空间界面</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script>
        //定义放弃委托的方法（提示信息）
        function outCommission(c_id){
            var bo = confirm("是否确认放弃编号为"+c_id+"的委托");
            if (bo){
                //确认放弃
                //提交请求到委托服务器的修改委托状态功能：
                location.href="${pageContext.request.contextPath}/doUpdateStateWorkerId?c_state=true&c_id="+c_id+"&w_id=0";
            }
        }

        //定义修改委托的方法（提示信息）
        function updateCommission(c_id){
            var bo = confirm("是否确认已完成编号为"+c_id+"的委托");
            if (bo){
                //确认已完成
                //提交请求到委托服务器的修改委托状态功能：
                location.href="${pageContext.request.contextPath}/doUpdateStateWorkerId?c_state=success&c_id="+c_id+"&w_id=0";
            }
        }
    </script>
</head>
<body>
<c:if test="${sessionScope.worker.w_name == null}">
    <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.worker.w_name != null}">
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
        <!-- 创建一个定宽的容器，在小屏幕设备上居中对齐。 -->
        <div class="container">
            <!-- 水平和垂直居中 -->
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">w_name: ${sessionScope.worker.w_name}</h5>
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
                        <%--                使用ajax应该可以解决每次都要刷新的问题--%>
                    <h5 class="card-title">加载已接取的委托</h5>
                    <a class="card-text" href="${pageContext.request.contextPath}/doSelectCommissionByW_name?w_name=${sessionScope.worker.w_name}">刷新委托列表</a>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-body">
                    <c:forEach items="${requestScope.commissionListByW_name}" var="commission" varStatus="commissionStatus">
                        <h5 class="card-title">委托${commissionStatus.count}</h5>
                        <ul class="list-group">
                            <li class="list-group-item">委托编号 ${commission.c_id}</li>
                            <li class="list-group-item">委托标题 ${commission.c_title}</li>
                            <li class="list-group-item">委托描述 ${commission.c_description}</li>
                            <li class="list-group-item">委托状态 ${commission.c_state}</li>
                            <li class="list-group-item">委托发布人 ${commission.c_employer_id}</li>

                            <li class="list-group-item">
                                <a href="javascript:outCommission(${commission.c_id})" class="btn btn-danger">放弃此委托</a>
                                <a href="javascript:updateCommission(${commission.c_id})" class="btn btn-danger">设置委托已完成</a>
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
                    <img src="${pageContext.request.contextPath}/static/img/求职者个人空间1.png" alt="error" class="img-fluid">
                </div>
                <div class="col-md">
                    <h2>积极沟通</h2>
                    <!-- 一个字体样式 -->
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
        <!-- 创建一个定宽的容器，在小屏幕设备上居中对齐。 -->
        <div class="container">
            <!-- 水平和垂直居中 -->
            <div class="row align-items-center justify-content-between">
                <div class="col-md">
                    <h2>勇往直前</h2>
                    <!-- 一个字体样式 -->
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
                    <!-- img-fluid不超过这个div的大小 -->
                    <img src="${pageContext.request.contextPath}/static/img/求职者个人空间2.png" alt="error" class="img-fluid">
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

