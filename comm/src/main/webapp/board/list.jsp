<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body class="">
    <div class="container">
        <div class="row">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid" style="font-size: 15px;">
                    <a class="navbar-brand" href="#">사이트 이름 미정</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">자유게시판</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">익명게시판</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    흥미게시판
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">요리</a></li>
                                    <li><a class="dropdown-item" href="#">음악</a></li>
                                    <li><a class="dropdown-item" href="#">운동</a></li>
                                    <li><a class="dropdown-item" href="#">게임</a></li>
<%--                                    <li><hr class="dropdown-divider"></li>--%>
<%--                                    <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" aria-disabled="true">개발중...</a>
                            </li>
                        </ul>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
        <div class="row">
            <div class="col-8">
                <br/>
                <h2 style="color: black; margin:0 auto; padding:0;">게시판 리스트</h2>
                <br/>
                <table class="table table-hover">
                    <thead style="color: black">
                        <tr>
                            <th scope="col">제목</th>
                            <th scope="col">본문</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:forEach var="b" items="${list}">
                            <tr style="color: black">
                                <td>${b.title}</td> <td><a href="/comm/board/detail?no=${b.no}">${b.content}</a></td> <td>${b.id}</td> <td>${b.wdate}</td> <td>${b.views}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-4">
                <br/>
                <h2 style="color: black; margin:0 auto; padding:0;">핫글</h2>
                <br/>
                <table class="table table-hover">
                    <thead style="color: black">
                    <tr>
                        <th scope="col">제목</th>
                        <th scope="col">본문</th>
                        <th scope="col">조회수</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <c:forEach var="b" items="${list}">
                        <tr style="color: black">
                            <td>${b.title}</td> <td><a href="/comm/board/detail?no=${b.no}">${b.content}</a></td> <td>${b.views}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>