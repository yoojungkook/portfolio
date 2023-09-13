<%--
  Created by IntelliJ IDEA.
  User: KOSTA
  Date: 2023-09-13
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <form action="${pageContext.request.contextPath}/member/join" method="post" name="join" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="exampleFormControlId" class="form-label">아이디</label><input type="button" class="btn btn-secondary" onclick="check()" value="check">
                    <input name="mId" type="text" class="form-control" placeholder="아이디 입력">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlPassword" class="form-label">비밀번호</label>
                    <input name="mPassword" type="password" class="form-control"  placeholder="비밀번호 입력">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlPasswordCheck" class="form-label">비밀번호 확인</label>
                    <input name="cPassword" type="password" class="form-control"  placeholder="비밀번호 입력">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlName" class="form-label">이름</label>
                    <input name="mName" type="text" class="form-control" placeholder="이름 입력">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlEmail" class="form-label">이메일</label>
                    <input name="mEmail" type="email" class="form-control"  placeholder="이메일 입력">
                </div>

                <%--<input type="text" id="sample4_postcode" placeholder="우편번호">--%>
                <%--<input type="text" id="sample4_roadAddress" placeholder="도로명주소">--%>
                <%--<input type="text" id="sample4_jibunAddress" placeholder="지번주소">--%>
                <%--<span id="guide" style="color:#999;display:none"></span>--%>
                <%--<input type="text" id="sample4_detailAddress" placeholder="상세주소">--%>
                <%--<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br>--%>

                <br/>
                <div class="input-group mb-3">
                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br/>
                    <span class="input-group-text">우편번호</span>
                    <input id="postcode" name="post" type="text" class="form-control" placeholder="우편번호" aria-label="" readonly>
                    <span class="input-group-text">도로명 주소</span>
                    <input id="roadAddress" name="road" type="text" class="form-control" placeholder="도로명 주소" aria-label="" readonly>
                    <span class="input-group-text">지번주소</span>
                    <input id="jibunAddress" name="jibun" type="text" class="form-control" placeholder="지번주소" aria-label="" readonly>
                    <span class="input-group-text">상세주소</span>
                    <input id="detailAddress" type="text" class="form-control" placeholder="상세주소" aria-label="">
                    <span class="input-group-text">참고항목</span>
                    <input id="extraAddress" type="text" class="form-control" placeholder="참고항목" aria-label="">
                </div>

                <label for="exampleFormControlPhoto" class="form-label">사진(선택사항)</label>
                <div class="input-group">
                    <input type="file" class="form-control" aria-describedby="inputGroupFileAddon04" aria-label="선택" onchange="readURL(this)">
                </div>
                <img id="preview" style="display: none; width: 300px; height: 300px;"/>

                <br/>

                <input type="submit" class="btn btn-outline-success" value="Success" style="width: 100%">
            </form>
        </div>
    </div>
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
                    console.log("3");
                };
                reader.readAsDataURL(input.files[0]);
                console.log("1");
            } else {
                document.getElementById('preview').src = "";
                alert("else!");
            }
            console.log("2");
        }
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>
</body>
</html>
