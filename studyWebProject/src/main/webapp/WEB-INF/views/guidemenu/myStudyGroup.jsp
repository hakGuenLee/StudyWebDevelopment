<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myStudyGroup.css"/>" rel="stylesheet"/> 	
<jsp:include page="../include/header.jsp"/> 

<!-- 나의 모임 공간 위시리스트 -->

<section>

		<div id="menuGuide">
			<h4><b>나의 스터디 모임 관리 페이지</b></h4>				
		</div>

		<div id="myGroupBox" class="container w-75">
			<h5><b>내가 만든 모임</b></h5>
			<p>나의 모임을 관리해보세요!</p>
			<table class="table mt-5">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>구분</th>
						<th>모임명</th>
						<th>개설일자</th>
						<th>제한인원 설정</th>
						<th>현재 참가인원</th>
						<th>모임설정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null || list.size()==0 }">
						<tr>
							<td colspan="7"><span>아직 개설한 모임이 없습니다. 모임을 만들어보세요!</span> <a href="<c:url value="/location/movetoMap"/>" id="movetomap" type="button" class="btn">모임 만들기</a> </td>
						</tr>
					</c:if>
					<c:if test="${list != null || list.size()!=0 }">	
						<c:forEach var="dto" items="${list}">		
							<tr>
								<td>${dto.group_no}</td>
								<td>${dto.group_category}</td>
								<td>${dto.group_name}</td>
								<td>${dto.register_dt}</td>
								<td>${dto.group_boundary}</td>
								<td>${dto.member_count}/${dto.group_boundary}</td>
								<td><button type="button" class="btn btn-primary">모임설정</button></td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>
		
		
		
		<div id="myJoinGroup" class="container w-75">
			<h5><b>참여 중인 모임</b></h5>
			<p>내가 참여 중인 모임을 확인해보세요!</p>
			<table class="table mt-5">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>구분</th>
						<th>모임명</th>
						<th>대표자</th>
						<th>모임인원</th>
						<th>가입일자</th>
						<th>탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null || list.size()==0 }">
						<tr>
							<td colspan="7"><span>아직 참여한 모임이 없습니다. 모임에 참가해보세요!</span> 
							<a href="<c:url value=""/>" id="" type="button" class="btn btn-success">모임 찾기</a> 
							<a href="<c:url value=""/>" id="" type="button" class="btn btn-primary">나의 알림 메세지</a> </td>
						</tr>
					</c:if>
					<c:if test="${list != null || list.size()!=0 }">	
						<c:forEach var="dto" items="${list}">		
							<tr>
								<td>${dto.group_no}</td>
								<td>${dto.group_category}</td>
								<td>${dto.group_name}</td>
								<td>${dto.register_dt}</td>
								<td>${dto.group_boundary}</td>
								<td>${dto.member_count}/${dto.group_boundary}</td>
								<td><button type="button" class="btn btn-danger">탈퇴</button></td>
							</tr>
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>
		
		
		

</section>


</body>
</html>