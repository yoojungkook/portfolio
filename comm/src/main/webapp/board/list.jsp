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
    <%@ include file="../common/header.jsp" %>
    <div class="container" style="margin-bottom: 30px;">
        <%@ include file="../common/nav.jsp" %>
        <div class="row">
<%--            <div class="col-3" style="border-right: 1px solid black">--%>
<%--                <br/>--%>
<%--                <h2 style="color: black; margin:0 auto; padding:0;">메뉴</h2>--%>
<%--                <br/>--%>
<%--                <div class="card text-center">--%>
<%--                    <div class="card-header">--%>
<%--                        Featured--%>
<%--                    </div>--%>
<%--                    <div class="card-body">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${sessionScope.loginId != null}">--%>
<%--                                <h5 class="card-title">닉네임</h5>--%>
<%--                                <img src="..." class="img-thumbnail" alt="...">--%>
<%--                                <p class="card-text">${sessionScope.loginId}</p>--%>
<%--                                <a href="#" class="btn btn-primary">뭐 넣지?</a>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <h2 class="card-title">로그인 필요</h2>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </div>--%>
<%--                    <div class="card-footer text-body-secondary">--%>
<%--                        2 days ago--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <ul class="list-group">--%>
<%--                    <li class="list-group-item d-flex justify-content-between align-items-center">--%>
<%--                        전체 거래 완료 수--%>
<%--                        <span class="badge bg-primary rounded-pill">0</span>--%>
<%--                    </li>--%>
<%--                    <li class="list-group-item d-flex justify-content-between align-items-center">--%>
<%--                        금일 거래 완료 수--%>
<%--                        <span class="badge bg-primary rounded-pill">0</span>--%>
<%--                    </li>--%>
<%--                    <li class="list-group-item d-flex justify-content-between align-items-center">--%>
<%--                        전일 거래 완료--%>
<%--                        <span class="badge bg-primary rounded-pill">0</span>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <ol class="list-group" style="overflow:auto; height:500px;">--%>
<%--                    <li class="list-group-item d-flex justify-content-between align-items-start">--%>
<%--                        <div class="ms-2 me-auto">--%>
<%--                            <div class="fw-bold">서울</div>--%>
<%--                                <c:forEach var="seoul" items="${seoulList}">--%>
<%--                                    <a style="text-decoration-line: none; color: black" href="#">${seoul.autonomyName}</a><br/>--%>
<%--                                </c:forEach>--%>
<%--                        </div>--%>
<%--                        <div class="badge bg-primary rounded-pill">${seoulList.size()}</div>--%>
<%--                    </li>--%>
<%--                </ol>--%>
<%--            </div>--%>
            <%@ include file="../common/menu.jsp" %>
            <div class="col-9">
                <br/>
                <h2 style="color: black; margin:0 auto; padding:0;">게시판 리스트</h2>
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
                        <th scope="col" style="width: 8%; text-align: right">제목</th>
                        <th scope="col" style="width: 52%">본문</th>
                        <th scope="col" style="width: 15%">작성자</th>
                        <th scope="col" style="width: 15%">작성일</th>
                        <th scope="col" style="width: 10%">조회수</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <c:forEach var="b" items="${list}">
                        <tr style="color: black">
                            <td style="text-align: right">${b.title}</td> <td><a href="/comm/board/detail?no=${b.no}">${b.content}</a></td> <td>${b.id}</td> <td>${b.wdate}</td> <td>${b.views}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%-- 페이지네이션 --%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
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
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script type="text/javascript">
        let item = document.querySelectorAll('.autonomyName');
        for(let i = 0; i < item.length; i++) {
            item[i].addEventListener('mouseover',ms);
            item[i].addEventListener('mouseout',mo);
        }

        function ms(event) {
            this.style.color = "blue";
        }

        function mo(event) {
            this.style.color = "black";
        }
    </script>
</body>
</html>