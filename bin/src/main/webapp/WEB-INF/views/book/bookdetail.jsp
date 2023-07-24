<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>



<br/><br/>


<center>
<img src = "/resource/img/${book.img }" style="width:400px;"><br/> <!-- 업로드 이미지파일 -->
</center>
<hr style = "border : solid 2px #828282; width:395px">


<head>

<style>
		div {
			border: 1px solid white ;
			margin: 0px auto;
			padding: 0px;
			width: 400px;
			overflow: auto;
		}
</style>
</head>

<body>
	<div style = "font-size: 17px; font-weight:500">ID : ${book.memberid.username }</div>
	<div style = "font-size: 15px; font-weight:400">주소 : ${book.memberid.address }</div>
	
	<hr style = "border : solid 2px #828282; width:395px">
	<div style = "font-size: 15px; font-weight:200">${book.category }</div>
	<div style = "font-size: 20px; font-weight:700">${book.title }</div>
	
	
	<!--  <div>책제목 : ${book.title }</div>-->
	<div>${book.author }</div><br>
	<div>[내용] <br> ${book.content }</div><br>
	<div style = "font-size: 11px;">등록날짜 : ${book.uploaddate }</div>
	<br><br>	
	
</body>


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