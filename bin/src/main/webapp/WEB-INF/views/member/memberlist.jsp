<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<div class="container">

	<h3>Member List (${count})</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${member }" var="member" varStatus="st">
				<tr>
					<td><a href="memberview/${member.username }">${member.username }</a></td>
					<td>${member.name }
					<td>${member.password}</td>
					<td>${member.email}</td>
					<td>${member.phone}</td>
					<td>${member.address}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>
<%@ include file="../include/footer.jsp"%>