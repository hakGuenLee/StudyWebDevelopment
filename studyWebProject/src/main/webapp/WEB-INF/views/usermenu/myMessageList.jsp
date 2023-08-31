<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myMessageList.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 

<!-- 나의 알림 메시지 -->

<section>

		<div id="menuGuide">
			<h4><b>나의 알림 메시지</b></h4>	
			<p>내게 도착한 메시지를 확인해보세요!</p>
		</div>

		<div id="wishListBox" class="container w-75">
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>발신자</th>
						<th>메시지유형</th>
						<th>제목</th>
						<th>답장 여부</th>
						<th>도착일자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list == null || list.size()==0 }">
						<tr>
							<td colspan="6">도착한 메시지가 없습니다!</td>
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