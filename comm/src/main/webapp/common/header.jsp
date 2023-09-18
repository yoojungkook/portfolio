<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="border-bottom: 1px solid black;">
    <div class="row">
        <ul class="nav justify-content-end">
            <c:choose>
                <c:when test="${sessionScope.loginId != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-disabled="true" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-disabled="true" href="#">
                            <img src="../images/noti.png" style="width: 50px; height: 50px" alt="...">
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/member/login">로그인</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>