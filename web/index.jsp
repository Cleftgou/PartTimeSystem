<%--
  Created by IntelliJ IDEA.
  User: bairimengchang
  Date: 2023/11/25
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>兼职服务平台</title>
  <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/static/bootstrap-icons-1.11.2/font/bootstrap-icons.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
  <style>
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
      filter: invert(0.5) sepia(1) saturate(5) hue-rotate(180deg);
    }

    .carousel-control-prev,
    .carousel-control-next {
      color: orange;
    }

  </style>
</head>

<!-- 格式化一下：alt+shift+f -->

<body>
<!-- 固定菜单栏 -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
  <!-- 导航栏里的内容居中 -->
  <div class="container">
    <a href="index.jsp" class="navbar-brand">兼职服务平台</a>

    <!-- 设置一个导航栏切换器按钮，这个切换器按钮通过navameny包括下面的测试文字*3 -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navmenu">
      <ul class="navbar-nav ms-auto">
        <!-- margin start = margin left -->
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/JSP/worker/worker_login.jsp"><i class="bi bi-person-badge"></i>个人登录</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/JSP/employer/employer_login.jsp"><i class="bi bi-person-badge-fill"></i>商家登录</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${sessionScope.flag}"><i class="bi bi-person-circle"></i>我的</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- 这个标签和div差不多 -->
<!-- padding填充边距大小，背景黑色，文字白色 -->
<section class="p-5 bg-dark text-light text-center text-sm-start">
  <!-- 内容居中 -->
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h1>关于我们的<span class="text-warning">兼职平台</span></h1>
        <p class="my-4 lh-2.5">
          &nbsp;&nbsp;&nbsp;&nbsp;欢迎来到我们革命性的兼职平台，这里是您重新定义工作方式的舞台！
          无论您是想要挑战自己、实现梦想还是寻找更多机会，我们的平台都将成为您茁壮成长的土壤。
          在这里，您可以释放真实的潜力，获得成功与成就感的汇聚。我们致力于为您提供强大的支持和资源，让您的兼职工作旅程更加顺畅和有意义。
          <br><br>
          &nbsp;&nbsp;&nbsp;&nbsp;不再满足于平庸，让伟大的机遇等待着您！我们的兼职服务平台将成为您梦想飞翔的起点。
          无论您是想要探索新领域、展示才华，还是积累宝贵的经验，我们将为您开辟通往无限可能的道路。
          在这里，您可以留下持久的影响，创造出令人瞩目的成就。
        </p>
        <a class="btn btn-primary btn-lg" href="#">了解更多</a>
      </div>
      <div class="col-md-6">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="${pageContext.request.contextPath}/static/img/主页1.png" class="d-block w-100" alt="轮播图1">
            </div>
            <div class="carousel-item">
              <img src="${pageContext.request.contextPath}/static/img/主页2.png" class="d-block w-100" alt="轮播图2">
            </div>
            <div class="carousel-item">
              <img src="${pageContext.request.contextPath}/static/img/主页3.png" class="d-block w-100" alt="轮播图3">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</section>

<section>
  <!-- 在Bootstrap中，主题色（primary）默认是一种蓝色 -->
  <section class="p-5 bg-primary text-light">
    <!-- 内容居中 -->
    <div class="container">
      <!-- 弹性盒子布局 -->
      <div class="d-md-flex justify-content-between align-items-center">
        <!-- margin-bottom -->
        <h3 class="mb-3">现在注册账号立刻开始兼职吧</h3>
        <!-- 文本框加按钮叫做inputgroup -->
        <div class="input-group news-input">
          <input type="text" class="form-control" placeholder="请点击右侧注册按钮">
          <button class="btn btn-dark btn-lg"
                  onclick="location.href = '${pageContext.request.contextPath}/JSP/worker/worker_register.jsp'">注册</button>
        </div>
      </div>
    </div>
  </section>
</section>

<section class="p-5">
  <div class="container">
    <!-- 这里的row与下方的col联动，等分屏幕后，col都在同一行 -->
    <!-- 表示网格系统中列（Column）之间的间距 -->
    <!-- 在Bootstrap中，网格系统将页面分成12个等宽的列。
        通过使用col类，可以将一个元素定义为网格系统中的一列，
        并指定该列在不同屏幕大小下所占的列数。例如，col-6表示该元素是一列，
        占用网格系统中的6个等分（即占据一半的宽度，因为总共有12个等分）。 -->
    <div class="row g-4">
      <div class="col-md">
        <div class="card bg-dark text-light">
          <div class="card-body  text-center">
            <div class="card-title">
              商家注册
            </div>
            <div class="card-text">
              我们提供了优质的兼职人才资源和完善的审核机制，
              无论是个体商家还是大型企业，我们均可为您提供全方位的兼职委托解决方案。
              注册成为我们的商家用户，一起打造更加智能化的兼职市场！
            </div>
            <!-- margin-top -->
            <a href="${pageContext.request.contextPath}/JSP/employer/employer_register.jsp" class="btn btn-primary mt-2">注册</a>
          </div>
        </div>
      </div>
      <div class="col-md">
        <div class="card bg-secondary text-light">
          <div class="card-body text-center">
            <div class="card-title">
              个人注册
            </div>
            <div class="card-text">
              我们的兼职系统为您提供了丰富多样的兼职机会，让您可以灵活安排自己的时间和收入。
              您可以浏览各行各业的兼职委托，并选择适合自己的工作。
              加入我们，开启兼职工作的新篇章！
            </div>
            <a href="${pageContext.request.contextPath}/JSP/worker/worker_register.jsp" class="btn btn-dark mt-2">注册</a>
          </div>
        </div>
      </div>
      <div class="col-md">
        <div class="card bg-dark text-light">
          <div class="card-body text-center">
            <div class="card-title">
              委托大厅
            </div>
            <div class="card-text">
              我们精心筛选并发布了众多优质委托，涵盖了不同行业和岗位。
              我们提供详细的委托信息，让您可以快速了解并选择适合自己的委托。
              不再浪费时间搜索兼职工作，立即来委托大厅探索属于您的兼职机会吧！
            </div>
            <%--            向委托服务器发出请求全部委托且是分页形式--%>
            <a href="${pageContext.request.contextPath}/doGetCommissionPage" class="btn btn-primary mt-2">查看</a>
          </div>
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
        <img src="${pageContext.request.contextPath}/static/img/附加模块1.png" alt="error" class="img-fluid">
      </div>
      <div class="col-md">
        <h2>高效工作</h2>
        <!-- 一个字体样式 -->
        <p class="lead">在我们的平台上，您将发现一系列优化工作流程的功能，让工作变得更加轻松和高效。
        </p>
        <p>
          在我们的平台上，您将享受到高效工作的乐趣和成就感。通过我们的创新工具和资源，您可以轻松地实现任务的高效完成。
          与我们一起打造一个高效的工作流程，让您事半功倍。
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
        <h2>专业团队</h2>
        <!-- 一个字体样式 -->
        <p class="lead">我们承诺只与经过严格筛选和验证的专业人士合作，为您提供最高水平的专业评测和咨询支持。
        </p>
        <p>
          我们与顶尖专业人士组成的团队合作，为您提供卓越的服务和评测。通过与行业专家紧密合作，我们为您提供专业、可靠的评测结果和解决方案。
          他们的专业背景和经验将为您提供权威的评测结果。
        </p>
        <a href="" class="btn btn-light">查看详情</a>
      </div>
      <div class="col-md p-5">
        <!-- img-fluid不超过这个div的大小 -->
        <img src="${pageContext.request.contextPath}/static/img/附加模块2.png" alt="error" class="img-fluid">
      </div>
    </div>
  </div>
</section>

<section class="p-5">
  <div class="container">
    <h2 class="text-center mb-4">联系我们</h2>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">电话：555-9876-1234</li>
    <li class="list-group-item">邮箱：housepotal123@example.com</li>
    <li class="list-group-item">地址：123 Main Street, New York, NY 10001, USA</li>
  </ul>
</section>

<footer class="p-5 bg-dark text-white text-center">
  <div class="container">
    <p class="lead">
      Copyright &copy; 2025
    </p>
  </div>
</footer>

<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
