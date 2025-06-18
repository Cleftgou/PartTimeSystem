<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>评价委托</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .rating {
            display: inline-flex;
            font-size: 24px;
        }
        .rating input {
            display: none;
        }
        .rating label {
            color: #ddd;
            cursor: pointer;
        }
        .rating input:checked ~ label {
            color: #ffc107;
        }
        .rating label:hover,
        .rating label:hover ~ label {
            color: #ffca28;
        }
    </style>
</head>
<body>
<c:if test="${sessionScope.worker.w_name == null}">
    <h1>尚未登录，请先登录!!!<a href="<%=request.getContextPath()%>/index.jsp">返回主页去登录</a></h1>
</c:if>
<c:if test="${sessionScope.worker.w_name != null}">
<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top border-bottom border-secondary">
    <div class="container">
        <a href="${pageContext.request.contextPath}" class="navbar-brand">兼职服务平台</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navmenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/doWorkerExit">
                        <i class="bi bi-box-arrow-in-left"></i>退出登录
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/doGetCommissionPage">
                        <i class="bi bi-clipboard-plus-fill"></i>委托广场
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="bi bi-person-circle"></i>我的
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5 pt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">评价委托</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/doEvaluate" method="post">
                        <div class="mb-4">
                            <label class="form-label">评分</label>
                            <div class="rating">
                                <input type="radio" id="star5" name="score" value="5" required>
                                <label for="star5" title="5星">★</label>
                                <input type="radio" id="star4" name="score" value="4">
                                <label for="star4" title="4星">★</label>
                                <input type="radio" id="star3" name="score" value="3">
                                <label for="star3" title="3星">★</label>
                                <input type="radio" id="star2" name="score" value="2">
                                <label for="star2" title="2星">★</label>
                                <input type="radio" id="star1" name="score" value="1">
                                <label for="star1" title="1星">★</label>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="comment" class="form-label">评价内容</label>
                            <textarea id="comment" name="comment" rows="4" class="form-control" required></textarea>
                        </div>

                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-check-circle"></i> 提交评价
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
</c:if>
</body>
</html>