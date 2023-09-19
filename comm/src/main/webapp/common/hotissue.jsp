<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div class="col-4">
    <br/>
    <h2 style="color: black; margin:0 auto; padding:0;">핫글</h2>
    <br/>
    <table class="table table-hover">
        <thead style="color: black">
        <tr>
            <th scope="col">제목</th>
            <th scope="col">본문</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        <c:forEach var="b" items="${list}">
            <tr style="color: black">
                <td>${b.title}</td> <td><a href="/comm/board/detail?no=${b.no}">${b.content}</a></td> <td>${b.views}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>