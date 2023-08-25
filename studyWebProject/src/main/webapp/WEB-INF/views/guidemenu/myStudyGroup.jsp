<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myWishSpace.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 

<!-- 나의 모임 공간 위시리스트 -->

<section>

		<div id="menuGuide">
			<h4><b>나의 스터디 모임</b></h4>	
			<p>나의 모임을 관리해보세요!</p>
		</div>

		<div id="wishListBox" class="container w-75">
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>구분</th>
						<th>모임명</th>
						<th>대표자ID</th>
						<th>참가인원</th>
						<th>가입일자</th>
						<th>나의권한</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null || list.size()==0 }">
						<tr>
							<td colspan="8"><span>아직 참여하신 모임이 없습니다. 모임을 만들거나 참여해보세요!</span> <a href="<c:url value="/location/movetoMap"/>" id="movetomap" type="button" class="btn">모임 만들기</a> </td>
						</tr>
					</c:if>
					<c:if test="${list != null || list.size()!=0 }">	
						<c:forEach var="dto" items="${list}">		
							<tr>
								<td>${dto.wish_no}</td>
								<td>${dto.space_name}</td>
								<td>${dto.space_addr}</td>
								<td>${dto.space_tel}</td>
								<td>${dto.space_tel}</td>
								<td>${dto.space_tel}</td>
								<td>${dto.space_tel}</td>
								<td>${dto.space_tel}</td>
								<td><a href="<c:url value="/location/deleteWish?no=${dto.wish_no}"/>" type="button" class="btn btn-danger">삭제하기</a></td>
							</tr>
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>

</section>


</body>
</html>