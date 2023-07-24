<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
</sec:authorize>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="/">HOME</a>

		<!-- Links -->
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/book/insert">Insert</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/book/list">board</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/rent/list">내가대여해준리스트</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/rent/returnlist">내가대여받은리스트</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/memberlist">Memberlist</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/memberview/${principal.member.userid }">유저 상세보기</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/board/insert">게시판입력</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/board/list">게시판 리스트</a>
			</li>
		</ul>
		<ul class="navbar-nav">
			<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/join">회원가입</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<li class="nav-item"><a class="nav-link" href="/logout">로그아웃(<sec:authentication property="principal.username"/>)</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/member/update">회원변경</a>
			</li>
			</sec:authorize>
		</ul>
	</nav>