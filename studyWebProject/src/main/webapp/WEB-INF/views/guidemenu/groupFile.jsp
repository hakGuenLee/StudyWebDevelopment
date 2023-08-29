<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<script  src="<c:url value="/js/common.js"/>"></script>		 
<link  href="<c:url value="/css/myCsPage.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	<input id="userId" type="hidden" value="${sessionScope.userDTO.user_id}">
	
	<div id="guideBox" class="d-flex justify-content-around">
		<div>
			<h4>스터디 모임 자료실</h4>	
			<p>스터디 자료를 올리고, 다운로드 할 수 있습니다.<br>친구들과 함께 자료를 공유하고 관리해보세요!</p>
		</div>
		<div>
			<a href="<c:url value="/file/groupFileRegister"/>" id="csRegisterBtn" type="button" class="btn">파일 업로드</a>
		</div>
	</div>
	
	<hr style="width:1300px; margin-left:340px; margin-top:40px;">
	
<!-- 	<div id="csListBox" class="d-flex justify-content-around"> -->
	<div id="csListBox">
		<div>
			<h4>모임별 자료 확인</h4>	
		</div>
	</div>
	

	<div id="arrayMenu" class="d-flex mt-5">	
		<div >
			<select id="myGroupList" style="width:160px" class="form-select" name="groupList">
					<option></option>
			</select>
		</div>
		
		<div>
			<select id="fileType" style="width:160px; margin-left:20px;" class="form-select">
					<option>전체</option>
			</select>
		</div>
		<div>
			<form action="/study/userCs/searchMyCsList" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input type="text" name="searchValue" class="form-control" placeholder="제목을 검색해보세요">
				  <button class="btn btn-secondary" type="submit">검색하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="tableBox" class="container w-75 mt-3">
		<table class="table mt-3">
			<thead class="table-secondary">
				<tr>
					<th>No.</th>
					<th>구분</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일자</th>
					<th>파일첨부</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="fileList">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button value=""  type="button" class="btn btn-danger">삭제하기</button></td>
					</tr>
<%-- 					</c:forEach>
				</c:if> --%>
			</tbody>		
		</table>
	</div>
</section>
<script>
$(document).ready(function(){
	
	let id = $("#userId").val();
	console.log(id);

	//자료실 페이지 이동 시 회원이 참여 중인 스터디 모임 목록 가져오기
	$.ajax({
		url: "/study/file/myGroupList",
		type: "post",
		data: {"id" : id},
		success:function(result){
			console.log(result);
			let list = result;
			
			let str = "";
			
			for(let i=0; i<list.length; i++){
				str += "<option>"+list[i].group_name+"</option>";
			}
			
			$("#myGroupList").html(str);
			
			
		},
		error:function(){
			alert("요청실패!");
		}
	})

	//스터디 모임 목록에 따라 자료 정렬하기
	let groupSelect = $("#myGroupList").val();
	$.ajax({
		url: "/study/file/getFileList",
		type: "post",
		data: {"groupName" : groupSelect},
		success:function(result){
			console.log(result);
		},
		error:function(){
			alert("요청 실패!!")
		}

	})
	
	//파일 자료형에 따라 자료 정렬하기
	var fileTypeCode = '100';
	getFileType(fileTypeCode, function(data){
		console.log(data);
		let list = data;
		
		let str ="";
		str += "<option>전체보기</option>";
		
		for(let i=0; i<list.length; i++){
			str += "<option>"+list[i].item_nm+"</option>";
		}
		
		str += "<option>파일없음</option>"
		
		$("#fileType").html(str);
	
	})
	
	
	
	
	
	
})

</script>


</body>
</html>