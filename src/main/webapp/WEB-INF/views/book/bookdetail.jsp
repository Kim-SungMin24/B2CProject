<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>





업로드 이미지파일 <br/>

책이름 : ${book.title } <br>


회원이름 : ${book.memberid.username }<br/>
회원주소 : ${book.memberid.address }<br/>

책제목 : title <br/>

저자 : author <br/>

내용 <br/>
content <br/>

등록날짜 : uploaddate <br/>



<!-- 대여 요청 버튼? 수정 김명준-->
	<sec:authorize access="isAuthenticated()">
	<c:if test="${empty book.rentalid and principal.username!=book.memberid.username }">
		<div class="form-group">
			<button type="button" class="btn btn-primary btn-sm" id="rentBook">대여신청</button>
		</div>
	</c:if>
	<c:if test="${!empty book.rentalid or principal.username==book.memberid.username }">
		<div class="form-group">
			<button type="button" class="btn btn-danger btn-sm">대여불가</button>
		</div>
	</c:if>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<div class="form-group">
			<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/login'">로그인</button>
		</div>
	</sec:authorize>
<script>
<!-- 대여 요청 버튼? 수정 김명준-->
$('#rentBook').on('click', function(){
	$.ajax({
		type : 'get',
		url : '/rent/request/${book.bookid}'
	})
	.done(function(resp){
		if(resp=='success'){
			alert('대여 요청되었습니다')
			location.href="/book/list";
		}else{
			alert('대여 요청 실패 (자기자신, 다른사람이 먼저 요청함)')
			location.href="/book/list";
		}
	})
	.fail(function(){
		alert('실패')
	})
})
<!--끝-->
</script> 

<%@ include file="../include/footer.jsp"%>