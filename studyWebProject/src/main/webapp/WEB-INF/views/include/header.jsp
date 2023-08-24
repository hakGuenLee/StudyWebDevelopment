<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	
<link  href="<c:url value="/css/main.css"/>" rel="stylesheet"/> 
	<title>Home</title>
</head>
<body>
	<header>
		<div id="menu">			
			<div id="logo">	
				<a href="<c:url value="/"/>">HappyStudy</a>
			</div>						
			<div id="guidemenu">
				<ul>
					<li class="submenu"><a>이용안내</a></li>
					<li class="submenu"><a>모임 만들기</a></li>
					<li class="submenu"><a>자료실</a></li>
					<li>일정관리
						<ul>
							<li class="submenu"><a>일정 만들기</a></li>
							<li class="submenu"><a>나의 모임 일정</a></li>
						</ul>
					</li>
					<li>장소 둘러보기</li>
				</ul>	
			</div>	
			<div id="usermenu">
				<ul>
					<li>MyPage
						<ul>
							<li class="submenu"><a href="<c:url value="/userAccount/userInfoUpdate"/>">나의 정보 수정</a></li>
							<li class="submenu"><a>나의 모임 관리</a></li>
							<li class="submenu"><a>나의 알림 메세지</a></li>
							<li class="submenu"><a>나의 위시리스트</a></li>
							<li class="submenu"><a>1:1문의하기</a></li>
						</ul>				
					</li>
					<c:if test="${sessionScope.userDTO == null}">
						<li><a href="<c:url value="/userAccount/loginPage"/>">Login</a></li>
					</c:if>
					<c:if test="${sessionScope.userDTO != null}">
						<li><a href="<c:url value="/userAccount/userLogOut"/>">Logout</a></li>
					</c:if>
					<li><a href="<c:url value="/userRegister/acceptRule"/>">join</a></li>
					
				</ul>
			</div>
		</div>
	</header>