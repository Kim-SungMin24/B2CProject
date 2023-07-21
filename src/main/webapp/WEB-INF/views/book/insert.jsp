<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="container">
	<form action="/book/insert" id="frm" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">책제목 : </label> <input type="text"
					class="form-control" id="title" placeholder="Enter title" name="title" >
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('title') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'title' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
			<div class="form-group">
				<label for="author">저자 : </label> <input type="text"
					class="form-control" id="author"
					name="author">
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('author') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'author' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
			
			<div class="form-group">
				<label for="category">카테고리 : </label>			
				<select name='category'>
 					<option value='domestic book'>국내도서</option>
 					<option value='foreign book'>해외도서</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="upload">파일:</label> <input type="File"
					class="form-control" id="upload"  
					name="upload">
			</div>
			
			<div class="form-group">
	      <label for="content">내용:</label>
	      <textarea class="form-control" rows="5" id="content" name="content"></textarea>
	    </div>
	    <spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('content') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'content' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
			<button type="submit" class="btn btn-primary btn-sm" id="insertBtn" >글쓰기</button>
	</form>
</div>
<script>
</script>
<%@ include file="../include/footer.jsp"%>