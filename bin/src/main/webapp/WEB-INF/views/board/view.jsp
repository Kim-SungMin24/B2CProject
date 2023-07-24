<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="container mt-3">
	<h3>${board.member.username }의 글보기</h3>
	<div class="form-group">
		<label for="num">글번호:</label> <input type="text" class="form-control"
			id="num" name="num" value="${board.boardid }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="title">제목:</label> <input type="text" class="form-control"
			id="title" name="title" value="${board.title }" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label for="writer">글쓴이:</label> <input type="text" class="form-control"
			id="writer" name="writer" value="${board.member.username }"
			readonly="readonly">
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<textarea class="form-control" rows="5" id="content" name="content">${board.content }</textarea>
	</div>
    
		<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정</button>
			<button type="button" class="btn btn-danger btn-sm" id="btnDelete">삭제</button>
		</div>
		
	<div align="center">
		<textarea rows="3" cols="50" id="msg"></textarea>
		<button type="button" class="btn btn-secondary btn-sm" id="btnComment">댓글쓰기</button>
	</div>
	<div id="replyResult"></div>
</div>

<script>

// 수정폼
$('#btnUpdate').click(function(){
	if(confirm("정말 수정할까요?"))
	location.href='/board/update/${board.boardid}'
})
	

$("#btnDelete").click(function(){
	if(!confirm('정말 삭제할까요'))
		return;
	$.ajax({
		type:'DELETE',
		url : '/board/delete/${board.boardid}'
	}).done(function(resp){
		alert("삭제 성공")
		location.href="/board/list"
	})
	.fail(function(e){
		alert("삭제 실패")
	})

})


</script>
