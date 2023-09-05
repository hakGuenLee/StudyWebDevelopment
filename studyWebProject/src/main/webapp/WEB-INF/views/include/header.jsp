<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script  src="<c:url value="/js/common.js"/>"></script>		 

	
<link  href="<c:url value="/css/main.css"/>" rel="stylesheet"/> 
	<title>Home</title>
</head>
<body>
	<header>
		<div id="menu">			
			<div id="logo" style="margin-top:20px">	
				<a href="<c:url value="/"/>">HappyStudy</a>
			</div>						
			<div id="guidemenu">
				<ul class="subul">
					<li class="submenu"><a href="<c:url value="/groupSearch/groupSearchPage"/>">스터디 모임</a>
						<ul>
							<li class="submenu"><a href="<c:url value="/groupSearch/groupSearchPage"/>">스터디 모임 검색</a>	
							<li class="submenu"><a href="<c:url value="/group/groupOpenPage"/>">스터디 만들기</a></li>	
							<li class="submenu"><a href="<c:url value="/group/groupOpenPage"/>">스터디 생활정보</a></li>	
						</ul>
					</li>	
					
					
					<li><a href="<c:url value="/location/movetoMap"/>">스터디 헬퍼</a>
						<ul>
							<li><a href="<c:url value="/location/movetoMap"/>">모임장소 둘러보기</a>	
							<li class="submenu"><a>참고 도서 검색</a></li>
						</ul>
					</li>
					<li><a>나의 스터디룸</a>
						<ul>
							<li class="submenu"><a href="<c:url value="/group/myGroupManager"/>">스터디 모임 관리</a></li>
							<li class="submenu"><a href="<c:url value="/file/groupFilePage"/>">스터디 게시판</a></li>
							<li class="submenu"><a href="<c:url value="/location/myWishList"/>">장소 위시리스트</a></li>
							<li class="submenu"><a>스터디 일정 관리</a></li>
						</ul>				
					</li>
					
				</ul>	
			</div>	
			<div id="usermenu">
				<ul class="subul">
					<li><a href="">커뮤니티</a>
						<ul>
							<li><a>공지사항</a></li>
							<li><a href="<c:url value="/userCs/csRegisterPage"/>">문의하기</a></li>
						</ul>
					</li>
				
				
					<li>MyPage
						<ul>
							<li class="submenu"><a href="<c:url value="/userAccount/userUpdatePage"/>">나의 정보 수정</a></li>						
							<li class="submenu"><a href="<c:url value="/userMessage/messageArived"/>">받은 메세지함</a></li>
							<li class="submenu"><a href="<c:url value="/userMessage/sendMessagePage"/>">보낸 메세지함</a></li>
							
							<li class="submenu"><a href="<c:url value="/userCs/myCsPage"/>">1:1문의하기</a></li>
						</ul>				
					</li>
					<c:if test="${sessionScope.userDTO == null}">
						<li><a href="<c:url value="/userAccount/loginPage"/>">Login</a></li>
					</c:if>
					<c:if test="${sessionScope.userDTO != null}">
						<li><a href="<c:url value="/userAccount/userLogOut"/>">Logout</a></li>
					</c:if>
					<c:if test="${sessionScope.userDTO == null }">
						<li><a href="<c:url value="/userRegister/acceptRule"/>">join</a></li>
					</c:if>
					<c:if test="${sessionScope.userDTO != null }">
						<span style="color:gray">${sessionScope.userDTO.user_nm}님, 즐거운 스터디 되세요!</span>
					</c:if>
					
				</ul>
			</div>
		</div>
	</header>
