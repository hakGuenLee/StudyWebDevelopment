<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<th>친구초대</th>
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
								<td id="groupName">${dto.group_name}</td>
								<td>${dto.register_dt}</td>
								<td>${dto.group_boundary}</td>
								<td id="memberCount" onclick="memberList()">${dto.member_count}/${dto.group_boundary}</td>
								<td><button type="button" class="btn btn-success">친구초대</button></td>
								<td><button type="button" class="btn btn-primary">모임설정</button></td>
								<td><button type="button" class="btn btn-danger">삭제</button></td>
							</tr>
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>
		
	
<!-- 참가인원 보기 Modal -->
<div class="modal fade" id="memberSearchModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">참가인원 보기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:300px">
        <p>참가인원 현황</p>
        <table class="table">
        	<thead class="table-secondary">
        		<tr>
        			<th>No</th>
        			<th>참가자 닉네임</th>
        		</tr>
        	</thead>
        	<tbody id="memberModalBody">
        		<tr>
        			<td></td>
        		</tr>
        	</tbody>
        </table>
      </div>

      <div class="modal-footer">
        <button id="serchIdBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
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
					<c:if test="${list2 == null || list2.size()==0 }">
						<tr>
							<td colspan="7"><span>아직 참여한 모임이 없습니다. 모임에 참가해보세요!</span> 
							<a href="<c:url value=""/>" id="searchNewGroup" type="button" class="btn btn-success">모임 찾기</a> 
							<a href="<c:url value=""/>" id="myNewMsg" type="button" class="btn btn-primary">나의 알림 메세지</a> </td>
						</tr>
					</c:if>
					<c:if test="${list2 != null || list2.size()!=0 }">	
						<c:forEach var="dto2" items="${list2}">		
							<tr>
								<td>${dto2.group_no}</td>
								<td>${dto2.group_category}</td>
								<td>${dto2.group_name}</td>
								<td>${dto2.maker_nickname}</td>
								<td>${dto2.member_count}</td>
								<td>${dto2.join_dt}</td>
								<td><button id="outMyGroupBtn" type="button" class="btn btn-danger">탈퇴</button></td>
							</tr>
						</c:forEach>
					</c:if>	
				</tbody>
			</table>
		</div>
</section>
<script>


//그룹 탈퇴 버튼 클릭 시 체크 후 탈퇴 처리 진행
$("#outMyGroupBtn").on("click",function(){
	if(window.confirm("모임을 정말 탈퇴하시겠습니까?")){
		alert("탈퇴가 완료되었습니다!")
	}else{
		
	}
})

//참가인원 클릭 시 해당 그룹의 참가인원 목록 가져오기
function memberList(){
	$("#memberSearchModal").modal("show");
	var groupName = document.getElementById("groupName").innerText;
	console.log(groupName);
	
	$.ajax({
		url: "/study/group/getMemberList",
		type:"post",
		data:{"name" : groupName},
		success:function(data){
			console.log(data);
			let list = data;
			let str = "";
			
			var num = 1;
			
			for(let i=0; i<list.length; i++){
				str += "<tr>";
				str += "<td>"+num+"</td>";
				str += "<td>"+list[i].member_nickname+"</td>";
				str += "</tr>";
				
				num + 1;
				
				$("#memberModalBody").html(str);
			}
		},
		error:function(){
			alert("실패!");
		}

	})
	
	
}
</script>

</body>
</html>