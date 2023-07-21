<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container mt-3">
	<form action="/board/insert" method="post">
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" placeholder="Enter title"
				name="title">
			<spring:hasBindErrors name="boardFormDTO">
				<c:if test="${errors.hasFieldErrors('title') }">
					<div class="alert alert-danger">
						${errors.getFieldError( 'title' ).defaultMessage }
					</div>
				</c:if>
			</spring:hasBindErrors>
		</div>
	
		<div class="form-group">
			<label for="writer">작성자:</label> <input type="text"
				class="form-control" id="writer" placeholder="Enter writer"
				name="writer" readonly="readonly" value="${principal.username }">
		</div>

		<div class="form-group">
			<label for="content">내용:</label>
			<textarea class="form-control" rows="5" id="content" name="content"></textarea>
			<spring:hasBindErrors name="boardFormDTO">
				<c:if test="${errors.hasFieldErrors('content') }">
					<div class="alert alert-danger">
						${errors.getFieldError( 'content' ).defaultMessage }
					</div>
				</c:if>
			</spring:hasBindErrors>
		</div>

		<div class="form-group text-right">
			<button type="submit" class="btn btn-primary btn-sm">Submit</button>
		</div>

		<div class="form-group">
			<label for="reply">댓글:</label>
			<textarea class="form-control" rows="5" id="reply" name="reply"></textarea>
		</div>

	</form>
</div>
