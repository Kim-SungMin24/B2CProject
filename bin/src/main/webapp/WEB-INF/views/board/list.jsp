<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container mt-3">
    <h2>게시판(${count })</h2>
    <!-- <div class="form-group text-right">
        <a href="/board/insert">
            <button type="button" class="btn btn-secondary btn-sm" id="writeBtn">글쓰기</button>
        </a>
    </div> -->

    <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${boards}" var="board" varStatus="st">
                <tr>
                    <td>${board.boardid}</td>
                    <td><a href="/board/view/${board.boardid}">${board.title }[${board.replycnt }]</a></td>
                    <td>${board.member.username}</td>
                    <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
                    <td>${board.hitcount }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <form class="form-inline" action="/board/list" method="get">
        <select name='field' class="form-control mr-sm-1">
            <option value="title">제목</option>
            <option value="content">내용</option>
        </select>
        <input type='text' name='word' class="form-control" placeholder="Search">
        <button class='btn btn-secondary'>Search</button>

<div class="d-flex justify-content-between mt-3">
    <ul class="pagination">
        <c:if test="${currentPage > 1}">
            <li class="page-item">
                <a class="page-link" href="#" onclick="goToPage(${currentPage - 1})" >
                    이전
                </a>
            </li>
        </c:if>
        <c:if test="${currentPage < totalPages}">
            <li class="page-item">
                <a class="page-link" href="#" onclick="goToPage(${currentPage + 1})" >
                   다음
                </a>
            </li>
        </c:if>
    </ul>
</div>
</form>

<script>
    function goToPage(pageNumber) {
        // 페이지 번호를 저장할 숨겨진 입력 요소(hidden input)를 생성합니다.
        var hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'page'; // 페이지 번호를 받는 파라미터 이름이 'page'인 것으로 가정합니다.
        hiddenInput.value = pageNumber;

        // 숨겨진 입력 요소를 폼에 추가합니다.
        document.forms[0].appendChild(hiddenInput);

        // 폼을 제출합니다.
        document.forms[0].submit();
    }
</script>

