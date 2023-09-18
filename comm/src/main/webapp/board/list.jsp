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
<body>
    <%@include file="../common/header.jsp"%>
    <div class="container">
        <%@ include file="../common/nav.jsp" %>
        <div class="row">
            <div class="col-8">
                <br/>
                <h2 style="color: black; margin:0 auto; padding:0;">게시판 리스트<${pages}></h2>
                <div class="btn-group" role="group" style="float: right">
                    <button type="button" class="btn btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        선택
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">테이블</a></li>
                        <li><a class="dropdown-item" href="#">카드</a></li>
                    </ul>
                </div>
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
                <%-- 페이지네이션 --%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <%-- 이전 --%>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <%-- 페이지수 --%>
                        <c:forEach var="i" begin="1" end="${pages}">
                            <c:choose>
                                <%-- 현재 페이지 --%>
                                <c:when test="${currentPage == i}">
                                    <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
                                </c:when>
                                <%-- 현재 페이지가 아닌 다른 페이지 --%>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}//board/list?no=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <%-- 앞으로 --%>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
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