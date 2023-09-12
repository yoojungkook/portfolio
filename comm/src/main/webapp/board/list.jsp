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
    <div class="container text-center">
        <div class="row">
            <h3>시작!</h3>
            <div class="container" style="border: 1px solid black">
                <h2>게시판 리스트</h2>
                <table border="1">
                    <tr>
                        <th>제목</th> <th>본문</th> <th>작성자</th> <th>작성일</th> <th>조회수</th>
                    </tr>
                    <c:forEach var="b" items="${list}">
                        <tr>
                            <td>${b.title}</td> <td><a href="/comm/board/detail?no=${b.no}">${b.content}</a></td> <td>${b.id}</td> <td>${b.wdate}</td> <td>${b.views}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>