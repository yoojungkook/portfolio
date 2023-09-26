<%@ page pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover">
    <thead>
        <tr>
            <th scope="col">아이디</th>
            <th scope="col">이름</th>
            <th scope="col">이메일</th>
            <th scope="col">지역구</th>
            <th scope="col">생성날짜</th>
            <th scope="col">마지막 로그인</th>
            <th scope="col">마지막 로그아웃</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="m" items="${list}">
        <tr>
            <th scope="row">${m.id}</th>
            <td>${m.name}</td>
            <td>${m.email}</td>
            <td>${m.autonomy}</td>
            <td>${m.mdate}</td>
            <td>${m.lastLog}</td>
            <td>${m.logout}</td>
        </tr>
        </c:forEach>
    </tbody>
</table>