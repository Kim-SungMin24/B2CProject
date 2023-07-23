<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

/* 헤더 스타일 */
header {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
}

/* 기본 스타일 */
body {
	font-family: "NotoSansKR-Regular", Arial, sans-serif;
	margin: 0;
	padding: 0;
}

/* 버튼 스타일 */
button {
	background-color: #03D069;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
}


/* 제목에 색상을 적용하는 스타일 */ h3, h1, p {
	color: #03D069; /* 원하는 색상을 지정합니다. */
	font-family: "NotoSansKR-Regular", Arial, sans-serif;
}

@font-face {
	font-family: "NotoSansKR-Regular";
	src: url("NotoSansKR-Regular.otf") format("opentype");
}

/* 컨텐츠를 가운데로 정렬하는 스타일 */
        .centered-content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 40px); /* 헤더 높이를 제외한 부분의 높이를 기준으로 가운데 정렬 */
        }
        
        /* 컨텐츠 내용 스타일 (예시) */
        .content {
            padding: 20px;
            border: 1px solid #ccc;
        }
        
        /* SVG 이미지 스타일 */
        svg {
            max-width: 100%;
            height: auto;
            transition: transform 0.3s ease; /* 애니메이션 효과를 위한 트랜지션 */
        }

        /* 미디어 쿼리를 이용한 스타일 변경 */
        @media screen and (max-width: 600px) {
            /* 화면 너비가 600px 이하인 경우에만 적용됨 */
            svg {
                /* 작은 디바이스에서 SVG 이미지 크기를 축소 */
                max-width: 80%;
            }
        }

        /* 마우스 이벤트를 이용한 스타일 변경 */
        svg:hover {
            transform: scale(1.2); /* 마우스 오버 시 이미지를 1.2배 확대 */
        }
        
 
</style>
<meta charset="UTF-8">
<title>B2C - Local Community Book Rental.</title>
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
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="/">HOME</a>

		<!-- Links -->
		<ul class="navbar-nav mr-auto">
			<li><a class="nav-link" href="/book/insert">Insert</a>
			</li>
			<li><a class="nav-link" href="/book/list">board</a>
			</li>
			<li><a class="nav-link" href="/rent/list">내가
					대여한 리스트</a></li>
			<li><a class="nav-link" href="/memberlist">Memberlist</a>
			</li>
			<sec:authorize access="isAuthenticated()">
				<li><a class="nav-link"
					href="/memberview/${principal.member.username }">유저 상세보기</a></li>
			</sec:authorize>
			<li><a class="nav-link" href="/board/insert">게시판입력</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/board/list">게시판
					리스트</a></li>
		</ul>
		<ul class="navbar-nav">
			<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/join">회원가입</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃(<sec:authentication
							property="principal.username" />)
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/memberview/${principal.member.username }">회원변경</a></li>
			</sec:authorize>
		</ul>
	</nav>