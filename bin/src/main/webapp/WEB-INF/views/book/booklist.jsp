<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
	<h2>대여 가능 도서</h2>
 	<div class="row">
	  <c:forEach items="${lists }" var="item">
	  <c:if test="${empty item.rentalid }">
		  <div class="card col-4" style= "width:400px"> <!-- col-4 4개의 칼럼이 나타남 -->
			  <a href = "/book/bookdetail/${item.bookid }">
			    <img class="card-img-top" src="/resource/img/${item.img }" alt="Card image" style="width:100px;height:100px">
			    <div class="card-body" >
			      <h4 class="card-title">${item.title }</h4>
			      <p class="card-text">${item.content }</p>
			    </div>
			  </a>
		   </div>
	   </c:if>
	  </c:forEach>
  </div>
  <h2>대여중 도서(대여불가)</h2>
 	<div class="row">
	  <c:forEach items="${lists }" var="item">
	  	  <c:if test="${!empty item.rentalid }">
		  <div class="card col-4" style= "width:400px"> <!-- col-4 4개의 칼럼이 나타남 -->
			  <a href = "/book/bookdetail/${item.bookid }">
			    <img class="card-img-top" src="/resource/img/${item.img }" alt="Card image" style="width:100px;height:100px">
			    <div class="card-body" >
			      <h4 class="card-title">${item.title }</h4>
			      <p class="card-text">${item.content }</p>
			    </div>
			  </a>
		   </div>
		   </c:if>
	  </c:forEach>
  </div>
</div>


<script>









</script>


<%@ include file="../include/footer.jsp"%>