<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container"> 
	<h2>대여 요청</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='request' }">
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		</c:if>
	</c:forEach>
	<hr/>
	<h2>대여중</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='rent' }">
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		대여 날짜 : <fmt:formatDate value="${item.rentdate }" pattern="yyyy-MM-dd"/><br/>
		반납 날짜 : <fmt:formatDate value="${item.returndate }" pattern="yyyy-MM-dd"/><br/>
	<button type="button" class="btn btn-primary btn-sm" >반납완료</button><br/>
		</c:if>
	</c:forEach>
	<hr/>
	<h2>반납 완료</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='return' }">
		책 이름 : ${item.bookid.title } 
		대여 날짜 : <fmt:formatDate value="${item.rentdate }" pattern="yyyy-MM-dd"/> 
		대여 유저 : ${item.rentid.username }<br/>
		</c:if>
	</c:forEach>
</div>
<%@ include file="../include/footer.jsp"%>