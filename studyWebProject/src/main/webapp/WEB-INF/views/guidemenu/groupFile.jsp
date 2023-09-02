<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>


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
			<form action="/study/file/searchGroupFileList" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input type="text" id="postName" name="searchValue" class="form-control" placeholder="제목을 검색해보세요">
				  <button id="searchBtn" class="btn btn-secondary" type="submit">검색하기</button>
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
					<th>게시유형</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일자</th>
					<th>조회수</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="fileList">
				<c:if test="${list == null || list.size()==0 }">
					<tr>
						<td colspan="8">게시물이 존재하지 않습니다!</td>
					</tr>
				</c:if>
				<c:if test="${list != null || list.size()!=0 }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.file_no}</td>
							<td>${dto.group_name}</td>
							<td>${dto.post_type}</td>
							<td><a href="<c:url value="/file/fileAndPostDetail?no=${dto.file_no}"/>">${dto.post_title}</a></td>
							<td>${dto.uploader}</td>
							<td>${dto.upload_dt}</td>
							<td>${dto.hit}</td>
							<td><button onclick="fileAndPostDelete(this.value, '${dto.group_name}')" value="${dto.file_no}"  type="button" class="btn btn-danger">삭제하기</button></td>
						</tr>
					</c:forEach>	
				</c:if>	
			</tbody>		
		</table>
	</div>
</section>
<script>
$(document).ready(function(){
	
	//게시글 검색어 입력 후 엔터키 시 버튼 클릭 처리 이벤트
	$("#postName").keyup(function(event){
		if(event.which === 13){
			$("#searchBtn").click();
		}
	})
	
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
			
			
			if(list != null){
				let str = "";
				str = "<option>전체보기</option>";
				for(let i=0; i<list.length; i++){
					str += "<option>"+list[i]+"</option>";
				}
				
				$("#myGroupList").html(str);
			}
	
			
			
		},
		error:function(){
			alert("요청실패!");
		}
	})

	//스터디 모임 목록에 따라 자료 정렬하기
	let groupSelect = $("#myGroupList option:selected").val();
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
	
	//파일 자료유형 목록 가져오기
	var fileTypeCode = '100';
	commonCodeList(fileTypeCode, function(data){
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
<script>
function fileAndPostDelete(no, groupName){
	console.log(groupName);
	//회원이 작성한 게시물인지 확인하기
	$.ajax({
		url:"/study/file/uploaderCheck",
		type:"post",
		data:{"no":no},
		success:function(result){
			if(result == false){
				alert("자신이 작성한 게시글만 삭제 가능합니다!!");
			}else{ //자신이 작성한 게시물이 아닌 경우(삭제 가능)
				if(confirm("삭제하시면 다른 친구들도 볼 수 없게 됩니다! 그래도 삭제하시겠습니까?")){
					//삭제 처리 진행
					console.log("yes");
					$.ajax({
						url:"/study/file/fileAndPostDelete",
						type:"post",
						data:{"no":no, "groupName":groupName},
						success:function(result){
							alert(result);
							location.replace("/study/file/groupFilePage");
						},
						error:function(){
							alert("삭제 실패!");
						}
					})
				}
			}//else
		}
	})
	

}

</script>


</body>
</html>