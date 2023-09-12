<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<form id="login" action="${pageContext.request.contextPath}/member/login" method="post">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">아이디</label>
				<input type="text" class="form-control" id="id" placeholder="이메일" name="id">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="password" placeholder="비밀번호" name="password">
			</div>
			<input type="submit" class="btn btn-outline-success" value="Success" style="width: 100%">
		</form>
	</div>
</body>
</html>