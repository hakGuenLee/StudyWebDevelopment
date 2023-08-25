<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myWishSpace.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 

<!-- 나의 모임 공간 위시리스트 -->

<section>

		<div id="menuGuide">
			<h4><b>나의 모임 공간 위시리스트</b></h4>	
			<p>내가 찜한 장소를 확인해보세요!</p>
		</div>

		<div id="wishListBox" class="container w-75">
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>모임공간 이름</th>
						<th>주소지</th>
						<th>연락처</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null || list.size()==0 }">
						<tr>
							<td colspan="5"><span>찜하신 모임 공간이 없습니다. 모임 공간을 찾아보세요!</span> <a href="<c:url value="/location/movetoMap"/>" id="movetomap" type="button" class="btn">모임공간 둘러보기</a> </td>
						</tr>
					</c:if>
					<c:if test="${list != null || list.size()!=0 }">	
						<c:forEach var="dto" items="${list}">		
							<tr>
								<td>${dto.wish_no}</td>
								<td>${dto.space_name}</td>
								<td>${dto.space_addr}</td>
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