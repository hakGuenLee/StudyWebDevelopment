<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>


<link  href="<c:url value="/css/groupSearching.css"/>" rel="stylesheet"/> 		
  <script  src="<c:url value="/js/groupSearching.js"/>"></script>		 
<jsp:include page="../include/header.jsp"/> 

<input type="hidden" id="sessionNickName" value="${sessionScope.userDTO.user_nickname}">

<section>
	<div id="guideText">
		<div>
			<h4><b>스터디 모임 찾기</b></h4>	
			<p>스터디 모임을 찾고 함께 참여해보세요!</p>
		</div>
	</div>
	

	<div id="arrayMenu" class="d-flex mt-5">	
		<div >
			<select id="locationList" style="width:160px" class="form-select" name="groupList" onchange="selectLocationCity()">
					<option></option>
			</select>
		</div>
		
		<div>
			<select id="locationCity" style="width:160px; margin-left:40px;" class="form-select" onchange="selectLocationCity2()">
					<option>전체</option>
			</select>
		</div>
		<div>
			<form action="/study/groupSearch/searchGroupName" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input id="searchText" type="text" name="searchValue" class="form-control" placeholder="모임명을 검색해보세요">
				  <button  class="btn btn-secondary" type="submit">검색하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="tableBox" class="container w-75 mt-3">
		<table class="table mt-3">
			<thead class="table-secondary">
				<tr>
					<th>No.</th>
					<th>모임명</th>
					<th>모임유형</th>
					<th>지역</th>
					<th>상세지역</th>
					<th>대표자 닉네임</th>
					<th>참가인원</th>
					<th>활동상태</th>
					<th>문의하기</th>
					<th>가입신청</th>
				</tr>
			</thead>
			<tbody id="fileList">
				
				<c:if test="${list == null}">
					<tr>
						<td colspan="10">모임이 존재하지 않습니다!</td>
					</tr>
				</c:if>				
				<c:if test="${list != null}">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.group_no}</td>
							<td>${dto.group_name}</td>
							<td>${dto.group_category}</td>
							<td>${dto.group_location}</td>
							<td>${dto.group_locationCity}</td>
							<td>${dto.maker_nickname}</td>
							<td>${dto.member_count}</td>
							<c:if test="${dto.use_yn == 'Y' }">
							<td>활동 중</td>
							</c:if>
							<c:if test="${dto.use_yn == 'N' }">
							<td>활동 중단</td>
							</c:if>
							<td><button value="${dto.group_name}" onclick="messageSender(this.value, '${dto.maker_nickname}')" id="questionBtn" type="button" class="btn btn-success">문의하기</button></td>
							<td><button value="${dto.group_name}" onclick="joinMessageSender(this.value, this)" type="button" class="btn btn-primary">가입신청</button></td>
						</tr>
					</c:forEach>	
				</c:if>	
			</tbody>		
		</table>
	</div>
	
			<!-- paging area -->
		<ul class="pagination justify-content-center my-5" id="pagenationArea">
	        <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}" id="beforePage">
	            <a class="page-link" href="<c:url value="/groupSearch/groupSearchPage?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
	        </li>
	
	        <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
	            <li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}" id="pageNumberArea">
	                <a class="page-link"
	                   href="<c:url value="/groupSearch/groupSearchPage?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}"/>">${i}</a>
	            </li>
	        </c:forEach>
	
	        <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}" id="nextPage">
	            <a class="page-link" href="<c:url value="/groupSearch/groupSearchPage?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
	        </li>
   	   </ul>
	
	
	
	
	
</section>


<!-- 모임 정보 Modal -->
<div class="modal fade" id="GroupInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header" id="groupModalHeader">

        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="groupModal-body" style="height:500px">

      </div>

      <div class="modal-footer">
        <button id="senderBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">문의 보내기</button>
      </div>

    </div>
  </div>
</div> 


<!-- 문의하기 Modal -->
<div class="modal fade" id="QuestionModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 id="title" class="modal-title">문의하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:500px">
        <p>모임에 문의하실 내용을 적어주세요!</p>
        <p style="color:gray; font-size:15px">문의하신 내용은 모임의 대표자에게 전달됩니다!</p>
        <p>제목</p>
        <input type="text" class="form-control w-100" id="questionTitle">
        <p>문의내용</p>
        <textarea id="QuestionArea" class="form-control w-100" style="height:300px; resize: none;"></textarea>
      </div>

      <div class="modal-footer">
        <button id="senderBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">문의 보내기</button>
      </div>

    </div>
  </div>
</div> 



<!-- 가입하기 Modal -->
<div class="modal fade" id="joinModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 id="head" class="modal-title">가입 신청하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:500px">
        <p>가입 신청 메시지를 작성해보세요!</p>
        <p style="color:gray; font-size:15px">문의하신 내용은 모임의 대표자에게 전달됩니다!</p>
        <p>제목</p>
        <input type="text" class="form-control w-100" id="joinRequestTitle">
        <p>가입신청 내용</p>
        <textarea id="requestArea" class="form-control w-100" style="height:300px; resize: none;" placeholder="자신에 대한 소개를 꼭! 함께 적어주세요!"></textarea>
      </div>

      <div class="modal-footer">
        <button id="joinBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">가입 신청하기</button>
      </div>

    </div>
  </div>
</div> 

<script>
$(document).ready(function(){
	
	var locationCode = '400';
	
	//지역 목록 가져오기
	commonCodeList(locationCode, function(data){
		console.log(data);
		let list = data;
		let str = "";
		str = "<option>전체</option>"
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#locationList").html(str);
	
	})

	//키보드 이벤트 
	//모임 명 입력 후 Enter 누를 시 검색 실행
	$("#searchText").keyup(function(event){
	      if (event.which === 13) {
	            $("#submit").click();
	        }
	})
	
	
})
</script>

</body>
</html>
