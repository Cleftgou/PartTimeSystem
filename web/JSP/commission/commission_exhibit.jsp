<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/29
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>全部委托展示</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <style>
        .pagination {
            display: flex;
            justify-content: center;
        }
    </style>
    <script>
        //定义接取委托的方法（提示信息）
        function getCommission(c_id, w_id){
            var bo = confirm("是否确认接取编号为"+c_id+"的委托");
            if (bo){
                //确认接取
                //提交请求到委托服务器的修改委托状态功能：
                location.href="${pageContext.request.contextPath}/doUpdateStateWorkerId?c_state=false&w_id="+w_id+"&c_id="+c_id;
            }
        }
    </script>
</head>
<body>
<c:if test="${sessionScope.worker.w_name == null}">
    <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.worker.w_name != null}">
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/JSP/worker/worker_login.jsp"><i class="bi bi-people-fill"></i>切换账号</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/${sessionScope.flag}"><i class="bi bi-clipboard-plus-fill"></i>个人中心</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

    <section class="p-5 bg-primary">
        <div class="container">
            <h2 class="text-center text-light">委托大厅</h2>
            <p class="lead text-center text-white md-5">
                欢迎来到我们的委托大厅！这里不仅是您实现个人职业发展的平台，更是探索多彩人生的舞台。
                我们致力于为您提供丰富多样的委托任务，让您在实践中不断提升技能、积累经验，为未来的职业发展打下坚实的基础。
                无论您是刚入行的新人还是经验丰富的专业人士，委托大厅都将竭诚为您开启更广阔的职业发展之门。加入我们，发现更多可能，开启精彩人生！
            </p>
            <div class="row g-4">
                <c:forEach items="${requestScope.page.list}" var="commission" varStatus="commissionStatus">
                <div class="col-md-6 col-lg-3">
                    <div class="card bg-light">
                        <div class="card-body text-center">
                            <img src="${pageContext.request.contextPath}/static/img/委托.png" alt="error" class="img-fluid mb-3">
                            <h5 class="card-title">委托${commissionStatus.count}</h5>
                            <ul class="list-group">
                                <li class="list-group-item">委托编号 ${commission.c_id}</li>
                                <li class="list-group-item">委托标题 ${commission.c_title}</li>
                                <li class="list-group-item">委托描述 ${commission.c_description}</li>
                                <li class="list-group-item">委托状态 ${commission.c_state}</li>
                                <li class="list-group-item">委托发布人 ${commission.c_employer_id}</li>
                                <li class="list-group-item">委托接取人 ${commission.w_id}</li>

                                <li class="list-group-item" ${commission.c_state == false || commission.c_state == "success" ? "style='display:none;'" : ""}>
                                    <a href="javascript:getCommission('${commission.c_id}', '${sessionScope.worker.w_id}')" class="btn btn-danger">接取此委托</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <nav aria-label="Page navigation example" class="my-3">
            <ul class="pagination">
                <li class="page-item"><button class="page-link" onclick="firstPage(${requestScope.page.pageNow})">首页</button></li>
                <li class="page-item"><button class="page-link" onclick="upPage(${requestScope.page.pageNow})">上一页</button></li>
                <li class="page-item disabled"><a class="page-link" href="#">${requestScope.page.pageNow}/${requestScope.page.pageSum}</a></li>
                <li class="page-item"><button class="page-link" onclick="nextPage(${requestScope.page.pageNow}, ${requestScope.page.pageSum})">下一页</button></li>
                <li class="page-item"><button class="page-link" onclick="lastPage(${requestScope.page.pageNow}, ${requestScope.page.pageSum})">尾页</button></li>
                <li class="page-item">
                    <div class="input-group">
                        <input type="text" id="pageNumberInput" class="page-link" placeholder="跳转页码">
                        <button class="btn btn-warning" onclick="jumpToPage(${requestScope.page.pageNow},${requestScope.page.pageSum})">跳转</button>
                    </div>
                </li>
            </ul>
        </nav>
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

    <footer class="bg-dark text-light py-3">
        <div class="container text-center">
            <p>版权所有 &copy; 2023</p>
        </div>
    </footer>
<!-- 引入js文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</c:if>
</body>
<%--分页用操作--%>
<script>
    //首页
    function firstPage(pageNow){
        if (pageNow === 1){
            alert("当前已是第一页");
        }else {
            location.href = "${pageContext.request.contextPath}/doGetCommissionPage?pageNow=1";
        }
    }

    //上一页
    function upPage(pageNow){
        if (pageNow <= 1){
            alert("当前已是第一页");
        }else {
            location.href = "${pageContext.request.contextPath}/doGetCommissionPage?pageNow=" + (pageNow-1);
        }
    }

    //下一页
    function nextPage(pageNow, pageSum){
        if (pageNow >= pageSum){
            alert("已经到最后一页");
        }else {
            location.href = "${pageContext.request.contextPath}/doGetCommissionPage?pageNow="+(parseInt(pageNow) + 1);
        }
    }

    //尾页
    function lastPage(pageNow, pageSum){
        if (pageNow === pageSum){
            alert("已经到最后一页");
        }else {
            location.href = "${pageContext.request.contextPath}/doGetCommissionPage?pageNow="+pageSum;
        }
    }

    // 跳转到指定界面
    function jumpToPage(pageNow,pageSum) {
        var pageInput = document.getElementById("pageNumberInput").value;
        // 判断是否为首页
        if (pageInput === pageNow) {
            alert("已经在第"+pageNow+"页");
        }else if( pageInput<=0 ||  pageInput>pageSum || isNaN(pageInput)){
            alert("无效页码！！！");
        }else{
            location.href = "${pageContext.request.contextPath}/doGetCommissionPage?pageNow=" + pageInput;
        }
        document.getElementById("pageNumberInput").value="";
    }
</script>
</html>
