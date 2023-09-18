<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<div class="container">--%>
    <div class="row" style="border-bottom: 1px solid black;">
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
<%--</div>--%>