<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>커뮤니티</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
	<div class="container-sm">
		<h1>로그인</h1>
		<form action="${pageContext.request.contextPath}/member/login" method="post">
			<div class="mb-3">
				<label for="id" class="form-label">아이디</label>
				<input type="text" class="form-control" id="id" placeholder="이메일" name="id">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="password" placeholder="비밀번호" name="password">
			</div>
			<input type="submit" class="btn btn-outline-success" value="Success" style="width: 100%">
		</form>

		<br/>

		<form action="/comm/member/join" method="get">
			<div style="width: 100%">
				<input class="btn btn-primary" type="submit" value="Input" style="width: 100%">
			</div>
		</form>
	</div>
</body>
</html>