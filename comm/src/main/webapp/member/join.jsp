<%--
  Created by IntelliJ IDEA.
  User: KOSTA
  Date: 2023-09-13
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid">
        <div class="container-md">
            <h1>회원 가입</h1>
            <form action="${pageContext.request.contextPath}/member/join" method="post" name="join" enctype="multipart/form-data" novalidate>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="user_id" name="id" placeholder="아이디 입력">
                    <label for="user_id">아이디</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="user_password" name="password" placeholder="비밀번호 입력">
                    <label for="user_password">비밀번호</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="user_cpassword" placeholder="비밀번호 재입력">
                    <label for="user_cpassword">비밀번호 확인</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="user_name" name="name" placeholder="이름 입력">
                    <label for="user_name">이름</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="user_email" name="email" placeholder="이메일 입력">
                    <label for="user_email">이메일</label>
                </div>

                <div class="input-group mb-3">
                    <button id="user_phone" class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</button>
                    <input id="phone" type="hidden" name="phone">
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#" >010</a></li>
                        <li><a class="dropdown-item" href="#" >011</a></li>
                        <li><a class="dropdown-item" href="#" >016</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">없음</a></li>
                    </ul>
                    <input id="user_phone_etc" type="text" class="form-control" aria-label="Text input with dropdown button">
                </div>

                <div class="form-floating mb-3">
                    <div class="col-md-4">
                        <label for="user_date">생일 입력</label>
                        <input name="date" type="date" class="form-control" id="user_date">
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="user_autonomy" class="form-label">지역구 선택</label>
                        <select class="form-select" id="user_autonomy" onchange="changeAutonomy()">
                            <option selected disabled value="">자치구 선택</option>
                            <c:forEach var="s" items="${seoulAutonomyList}">
                                <option value="${s.autonomyName}">${s.autonomyName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="user_autonomy_ck" class="form-label">선택된 지역구</label>
                        <input name="autonomy" id="user_autonomy_ck" type="text" class="form-control" readonly>
                    </div>
                </div><br/>

                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="user_file" class="form-label">사진(선택사항)</label>
                        <div class="input-group">
                            <input name="file" id="user_file" type="file" class="form-control" aria-describedby="inputGroupFileAddon04" aria-label="선택" onchange="readURL(this)" >
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="preview" class="form-label" id="photo_thumbnail"></label>
                        <div class="input-group">
                            <img id="preview" class="img-thumbnail" style="display: none; width: 200px; height: 200px" alt="..."/>
                        </div>
                    </div>
                </div><br/>

                <button type="button" class="btn btn-outline-success" style="width: 100%" onclick="check()">Success</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script>
        const liList = document.querySelectorAll(".dropdown-item");

        const btn = document.getElementById("user_phone");

        liList.forEach(function(li) {

            li.addEventListener('click', function() {

                btn.innerHTML = li.innerText;

            });

        });
    </script>
    <script type="text/javascript">
        const check = () => {
            let id = document.join.user_id.value;
            if((id == '')) {
                alert("아이디 입력!");
                return;
            }

            let password = document.join.user_password.value;
            if(password == '') {
                alert("비밀번호 입력!");
                return;
            }

            let cPassword = document.join.user_cpassword.value;
            if(cPassword == '') {
                alert("비밀번호 확인 입력!");
                return;
            }

            if(password != cPassword) {
                alert("비밀번호가 맞지 않습니다.");
                return;
            }

            let name = document.join.user_name.value;
            if(name == '') {
                alert("이름 입력!");
                return;
            }

            let email = document.join.user_email.value;
            if(email == '') {
                alert("이메일 입력!");
                return;
            }

            let phone = document.join.user_phone;
            if(phone.innerHTML == 'Dropdown'){
                alert("번호 선택!");
                return;
            }

            let phoneEtc = document.join.user_phone_etc.value;
            if(phoneEtc == ''){
                alert("번호 나머지 입력!")
                return;
            } else {
                let p = document.getElementById("phone");
                p.value = btn.innerHTML + phoneEtc;
            }

            let userDate = document.join.user_date.value;
            if(userDate == '') {
                alert("생일 입력!");
                return;
            }

            let autonomy = document.join.user_autonomy;
            if(autonomy.options[autonomy.selectedIndex].value == '') {
                alert("지역구 입력!");
                return;
            }

            document.join.submit();
        }

        const changeAutonomy = () => {
            let autonomy = document.join.user_autonomy;
            let autonomy_ck = document.join.user_autonomy_ck;
            autonomy_ck.value = autonomy.options[autonomy.selectedIndex].value;
        }

        let preview = document.getElementById("preview");

        const readURL = (input) => {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                    preview.style.display = "block";

                    document.getElementById('photo_thumbnail').innerHTML = "사진 썸네일"
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview').src = "";
                alert("else!");
            }
        }
    </script>
</body>
</html>
