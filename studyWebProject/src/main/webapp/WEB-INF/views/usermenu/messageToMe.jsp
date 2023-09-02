<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myStudyGroup.css"/>" rel="stylesheet"/> 	
<jsp:include page="../include/header.jsp"/> 

<!-- 받은 메시지함 페이지 -->
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
<script>
$(document).ready(function(){
	var msgCode = '700';
	commonCodeList(msgCode, function(data){
		let str = "";
		let list = data;
		str = "<option>전체</option>";
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#messageCategory").html(str);
	})

})
</script>

<section>

		<div id="menuGuide">
			<h4><b>받은 메시지함</b></h4>	
			<p>내게 도착한 메시지를 확인해보세요!</p>			
		</div>

		<div id="myGroupBox" class="container w-75">
			<h5><b>내게 도착한 메시지</b></h5>
			
			<div class="d-flex">
				<div >
					<select id="messageCategory" style="width:160px" class="form-select" name="messageCategory" onchange="selectLocationCity()">
							<option></option>
					</select>
				</div>
				<div>
					<form action="/study/userMessage/searchingMessageForMe" method="post">
						<div id="searchGroup" class="input-group mb-3">
						  <input id="searchText" type="text" name="searchValue" class="form-control" placeholder="제목을 검색해보세요">
						  <button  class="btn btn-secondary" type="submit">검색하기</button>
						</div>
					</form>
				</div>
				
			</div>
			
			<table class="table mt-3">
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