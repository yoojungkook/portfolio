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
            <form class="needs-validation" action="#" <%--action="${pageContext.request.contextPath}/member/join"--%> method="post" name="join" enctype="multipart/form-data" novalidate>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="validationCustom01" name="id" placeholder="아이디 입력" required>
                    <label for="validationCustom01">아이디</label>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="user_password" name="password" placeholder="비밀번호 입력" required>
                    <label for="floatingInput">비밀번호</label>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="user_cpassword" placeholder="비밀번호 재입력" required>
                    <label for="floatingInput">비밀번호 확인</label>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="user_name" placeholder="이름 입력" required>
                    <label for="floatingInput">이름</label>
                    <div class="valid-feedback">
                        통과!
                    </div>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="user_email" placeholder="이메일 입력" required>
                    <label for="floatingInput">이메일</label>
                    <div class="valid-feedback">
                        통과!
                    </div>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="btn">Dropdown</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#" >010</a></li>
                        <li><a class="dropdown-item" href="#" >011</a></li>
                        <li><a class="dropdown-item" href="#" >016</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">없음</a></li>
                    </ul>
                    <input type="text" class="form-control" aria-label="Text input with dropdown button" required>
                    <div class="valid-feedback">
                        통과!
                    </div>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="form-floating mb-3">
                    <div class="col-md-4">
                        <label for="floatingInput">생일 입력</label>
                        <input type="date" class="form-control" id="user_date" required>
                    </div>
                    <div class="valid-feedback">
                        통과!
                    </div>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="validationCustom04" class="form-label">지역구 선택</label>
                        <select class="form-select" id="autonomy" required>
                            <option selected disabled value="">자치구 선택</option>
                            <c:forEach var="s" items="${seoulAutonomyList}">
                                <option>${s.autonomyName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="validationDefault03" class="form-label">선택된 지역구</label>
                        <input type="text" class="form-control" id="validationDefault03" required>
                    </div>
                    <div class="valid-feedback">
                        통과!
                    </div>
                    <div class="invalid-feedback">
                        공백!
                    </div>
                </div><br/>

                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="exampleFormControlPhoto" class="form-label">사진(선택사항)</label>
                        <div class="input-group">
                            <input type="file" class="form-control" aria-describedby="inputGroupFileAddon04" aria-label="선택" onchange="readURL(this)" >
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="exampleFormControlPhotoPick" class="form-label" id="photo_thumbnail"></label>
                        <div class="input-group">
                            <img id="preview" class="img-thumbnail" style="display: none; width: 200px; height: 200px" alt="..."/>
                        </div>
                    </div>
                </div><br/>

                <button type="submit" class="btn btn-outline-success" style="width: 100%">Success</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script>
        const liList = document.querySelectorAll(".dropdown-item");

        const btn = document.getElementById("btn");

        liList.forEach(function(li) {

            li.addEventListener('click', function() {

                btn.innerHTML = li.innerText;

            });

        });
    </script>
    <script type="text/javascript">
        const check = () => {
            let id = document.join.mId.value;
            if((id == '')) {
                alert("아이디 입력!");
                return;
            }

            let password = document.join.mPassword.value;
            if(password == '') {
                alert("비밀번호 입력!");
                return;
            }

            let cPassword = document.join.cPassword.value;
            if(cPassword == '') {
                alert("비밀번호 확인 입력!");
                return;
            }

            if(password != cPassword) {
                alert("비밀번호가 맞지 않습니다.");
                return;
            }

            let name = document.join.mName.value;
            if(name == '') {
                alert("이름 입력!");
                return;
            }

            let email = document.join.mEmail.value;
            if(email == '') {
                alert("이메일 입력!");
                return;
            }
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
    <script type="text/javascript">
        (() => {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            const forms = document.querySelectorAll('.needs-validation');

            // Loop over them and prevent submission
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                        console.log("1L: " + forms.item(this).password); // 태그 그 자체를 출력
                    } else {
                        console.log("2L: " + forms.item(this).id.valueOf());
                    }

                    form.classList.add('was-validated')
                }, false)
            });
        })()
    </script>
</body>
</html>
