<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myStudyGroup.css"/>" rel="stylesheet"/> 	
<jsp:include page="../include/header.jsp"/> 

<!-- 나의 모임 공간 위시리스트 -->
<script>
//메시지 삭제
function deleteMessage(messageNumber){
	if(confirm("메시지를 삭제하시면 답변을 할 수 없습니다! 그래도 삭제하시겠습니까?")){
		deletMessageByNumber(messageNumber, function(result){
			alert(result);
			location.replace("/study/userMessage/messageArived");
		});
		
	}
}
</script>

<section>

		<div id="menuGuide">
			<h4><b>받은 메시지함</b></h4>	
			<p>내게 도착한 메시지를 확인해보세요!</p>			
		</div>

		<div id="myGroupBox" class="container w-75">
			<h5><b>내게 도착한 메시지</b></h5>
			<table class="table mt-5">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>보낸 친구 닉네임</th>
						<th>메시지 유형</th>
						<th>제목</th>
						<th>도착일자</th>
						<th>확인 여부</th>
						<th>확인 일자</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${myMessage == null || myMessage.size()==0 }">
						<tr>
							<td colspan="8"><span>도착한 메시지가 존재하지 않습니다.</span> <a href="<c:url value="/location/movetoMap"/>" id="movetomap" type="button" class="btn">모임 만들기</a> </td>
						</tr>
					</c:if>
					<c:if test="${myMessage != null || myMessage.size()!=0 }">	
						<c:forEach var="dto" items="${myMessage}">		
							<tr>
								<td>${dto.msg_no}</td>
								<td>${dto.msg_sender}</td>
								<td>${dto.msg_category}</td>
								<td>${dto.msg_title}</td>
								<td>${dto.msg_dt}</td>
								<c:if test="${dto.msg_check == 'N'}">
								<td>읽지 않음</td>
								</c:if>
								<c:if test="${dto.msg_check == 'Y'}">
								<td>읽음</td>
								</c:if>
								<td>${dto.read_dt}</td>
								<td><button onclick="deleteMessage(this.value)" value="${dto.msg_no}" type="button" class="btn btn-danger">삭제</button></td>
							</tr>
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>

		<!-- paging area -->
		<ul class="pagination justify-content-center my-5">
	        <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
	            <a class="page-link" href="<c:url value="/userMessage/messageArived?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
	        </li>
	
	        <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	            <li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
	                <a class="page-link"
	                   href="<c:url value="/userMessage/messageArived?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}"/>">${i}</a>
	            </li>
	        </c:forEach>
	
	        <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
	            <a class="page-link" href="<c:url value="/userMessage/messageArived?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
	        </li>
   	   </ul>
</section>


</body>
</html>