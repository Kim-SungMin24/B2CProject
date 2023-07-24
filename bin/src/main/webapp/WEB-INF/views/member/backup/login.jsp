<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<h3>[로그인]</h3>
<br />
<div class="container">
	<form action="/login" method="post">
		<div class="form-group">
			<label for="username">아이디 </label> <input type="text"
				class="form-control" id="username" placeholder="Enter id"
				name="username">
		</div>

		<div class="form-group">
			<label for="password">비밀번호 </label> <input type="password"
				class="form-control" id="password" placeholder="Enter password"
				name="password">
		</div>
		<c:if test="${!empty loginErrorMsg }">
			<div class="alert alert-danger">
						<strong>${loginErrorMsg }</strong>
			</div>
		</c:if>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>


<%@ include file="../include/footer.jsp"%>
