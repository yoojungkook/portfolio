<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<div class="col-3" style="border-right: 1px solid black">
    <br/>
    <h2 style="color: black; margin:0 auto; padding:0;">메뉴</h2>
    <br/>
    <div class="card text-center">
        <div class="card-header">
            Featured
        </div>
        <div class="card-body">
            <c:choose>
                <c:when test="${sessionScope.loginId != null}">
                    <h5 class="card-title">닉네임</h5>
                    <img src="..." class="img-thumbnail" alt="...">
                    <p class="card-text">${sessionScope.loginId}</p>
                    <a href="#" class="btn btn-primary">뭐 넣지?</a>
                </c:when>
                <c:otherwise>
                    <h2 class="card-title">로그인 필요</h2>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="card-footer text-body-secondary">
            2 days ago
        </div>
    </div>
    <ul class="list-group">
        <li class="list-group-item d-flex justify-content-between align-items-center">
            전체 거래 완료 수
            <span class="badge bg-primary rounded-pill">0</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
            금일 거래 완료 수
            <span class="badge bg-primary rounded-pill">0</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
            전일 거래 완료
            <span class="badge bg-primary rounded-pill">0</span>
        </li>
    </ul>
    <ol class="list-group" >
        <li class="list-group-item d-flex justify-content-between align-items-start">
            <div class="ms-2 me-auto" style="width: 100%">
                <a data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <div class="fw-bold">
                        서울
                    </div>
                </a>
                <div class="collapse" id="collapseExample">
                    <c:forEach var="seoul" items="${seoulList}">
                        <a class="autonomyName" style="text-decoration-line: none; color: black" href="#">${seoul.autonomyName}</a><br/>
                    </c:forEach>
                </div>
            </div>
            <div class="badge bg-primary rounded-pill">${seoulList.size()}</div>
        </li>
    </ol>
</div>