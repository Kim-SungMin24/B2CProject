<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="container">
	<h3>${member.username }의 상세정보</h3>


	<div class="form-group">
		<label for="userid">번호:</label> <input type="text"
			class="form-control" id="userid" name="userid"
			value="${member.userid }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="username">아이디:</label> <input type="text"
			class="form-control" id="username" name="title"
			value="${member.username }" readonly="readonly">
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
		<label for="name">이름: </label> <input type="text" class="form-control"
			id="name" placeholder="Enter name" name="name"
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
			<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정</button>
			<button type="button" class="btn btn-danger btn-sm" id="btnDelete">탈퇴</button>
		</div>
	</c:if>

</div>

<script>
$("#btnUpdate").click(function() {
	let dataParam = {
		username : $("#username").val(),
		password : $("#password").val(),
		email : $("#email").val(),
		address : $("#address").val(),
		phone : $("#phone").val(),
		name : $("#name").val()
	}
	$.ajax({
		type : "put",
		url : "/memberupdate",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(dataParam)
	}).done(function(resp) {
		if (resp == "success") {
			alert("수정완료.")
			location.href = "/memberview"
		} else if (resp == "fail") {
			alert("수정실패")
		}

	}).fail(function() {
		alert("실패???")
	})

})
</script>
<%@ include file="../include/footer.jsp"%>