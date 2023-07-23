<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>


<div class="container">
	<h3>${member.username }의 상세정보</h3>
	<form action="/memberupdate" method="post">

		<div class="form-group">
			<label for="username">아이디:</label> <input type="text"
				class="form-control" id="username" name="username"
				value="${member.username }" readonly="readonly">
				<spring:hasBindErrors name="memberDTO"/>
		</div>
		<div class="form-group">
			<label for="password">비밀번호 </label> <input type="password"
				class="form-control" id="password" placeholder="Enter password"
				name="password" value="${member.password }">
			<spring:hasBindErrors name="memberDTO">
				<c:if test="${errors.hasFieldErrors('password') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'password' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>

		</div>

		<div class="form-group">
			<label for="name">이름: </label> <input type="text"
				class="form-control" id="name" placeholder="Enter name" name="name"
				value="${member.name }">
			<spring:hasBindErrors name="memberDTO">
				<c:if test="${errors.hasFieldErrors('name') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'name' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
		</div>

		<div class="form-group">
			<label for="email">email </label> <input type="text"
				class="form-control" id="email" placeholder="Enter email"
				name="email" value="${member.email }">
			<spring:hasBindErrors name="memberDTO">
				<c:if test="${errors.hasFieldErrors('email') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'email' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>

		</div>
		<div class="form-group">
			<label for="phone">전화번호 </label> <input type="text"
				class="form-control" id="phone" placeholder="Enter phone"
				name="phone" value="${member.phone }">
			<spring:hasBindErrors name="memberDTO">
				<c:if test="${errors.hasFieldErrors('phone') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'phone' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
		</div>
		<div class="form-group">
			<label for="address">주소 </label> <input type="text"
				class="form-control" id="address" placeholder="Enter address"
				name="address" value="${member.address }">

			<spring:hasBindErrors name="memberDTO">
				<c:if test="${errors.hasFieldErrors('address') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'address' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
		</div>
		<c:if test="${member.username ==principal.member.username}">
			<div class="form-group text-right">
				<button type="submit" class="btn btn-secondary btn-sm"
					id="btnUpdate">수정</button>
				<button type="button" class="btn btn-danger btn-sm" 
				id="btnDelete">탈퇴</button>
			</div>
		</c:if>
	</form>
</div>

<script>
$("#btnDelete").click(function() {
	if (!confirm('정말 삭제할까요?'))
		return;
	$.ajax({
		type : "DELETE",
		url : "/memberdelete/${member.username}"
	}).done(function(resp) {
		if(resp=="success")
			alert("삭제성공")
		location.href = "/member/memberlist"
	}).fail(function() {
		alert("삭제실패")
	})

})
</script>
<%@ include file="../include/footer.jsp"%>



