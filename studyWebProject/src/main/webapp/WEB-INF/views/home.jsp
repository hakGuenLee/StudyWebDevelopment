<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
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
				<a href="#">HappyStudy</a>
			</div>						
			<div id="guidemenu">
				<ul>
					<li><a>이용안내</a></li>
					<li><a>모임 만들기</a></li>
					<li><a>자료실</a></li>
					<li>일정관리
						<ul>
							<li><a>일정 만들기</a></li>
							<li><a>나의 모임 일정</a></li>
						</ul>
					</li>
					<li>장소 둘러보기</li>
				</ul>	
			</div>	
			<div id="usermenu">
				<ul>
					<li>MyPage
						<ul>
							<li><a>나의 정보 수정</a></li>
							<li><a>나의 모임 관리</a></li>
							<li><a>나의 알림 메세지</a></li>
							<li><a>나의 위시리스트</a></li>
							<li><a>1:1문의하기</a></li>
						</ul>				
					</li>
					<li><a>Login</a></li>
					<li><a>join</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	<section>
		<div id="middleArea">
			<div style="margin-top:130px">
				<span style="font-size:35px">
				<b>함께 꿈꾸는 성장,</b> <br> <b>HappyStudy와 함께하세요</b>
				</span>
				<p style="margin-top:16px">친구들과 함께 하는 스터디 모임을 <br> 효율적으로 관리해보세요!</p>
			</div>
			<div id="mainImg">
				<img src="<c:url value="/img/mainimg.jpg"/>">
			</div>

		
		</div>
	
	
	
	
	</section>




</body>
</html>
