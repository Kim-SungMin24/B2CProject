<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container"> 
	<!-- 책정보 :bookid 빌려준사람 정보 :rentid 빌린 사람 정보 :returnid -->
	책이름 : ${rental.bookid.title }<br/>
	빌려준 사람 : ${rental.rentid.username }<br/>
	빌린 사람 : ${rental.returnid.username }<br/>
	빌린 사람 주소 : ${rental.returnid.address }<br/>
	대여 날짜 : <fmt:formatDate value="${rental.rentdate }" pattern="yyyy-MM-dd"/><br/>
	반납 날짜 : <fmt:formatDate value="${rental.returndate }" pattern="yyyy-MM-dd"/><br/>
	<c:if test="${rental.rentstatus=='request' }">
	<button type="button" class="btn btn-primary btn-sm" onclick="rentrequest(${rental.rentalid})">대여수락</button>
	</c:if>
	<c:if test="${rental.rentid.username == principal.username }">
	<button type="button" class="btn btn-primary btn-sm" onclick="returnBook(${rental.rentalid})">반납완료</button>
	</c:if>
</div>
<script>
function rentrequest(num){
	if(!confirm('요청 승낙하겠습니까?')){
		return false;
	}
	$.ajax({
		type:'get',
		url:'/rent/acceptrent/'+num
	})
	.done(function(){
		alert('승낙되었습니다')
		location.href="/rent/list"
	})
	.fail(function(){
		alert('실패')
	})
}
function returnBook(num){
	if(!confirm('반납 완료하겠습니까?')){
		return false;
	}
	$.ajax({
		type:'get',
		url:'/rent/returnbook/'+num
	})
	.done(function(){
		alert('완료되었습니다')
		location.href="/"
	})
	.fail(function(){
		alert('실패')
	})
}
</script>
<%@ include file="../include/footer.jsp"%>