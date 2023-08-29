<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/fileRegister.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 

<!-- 스터디 자료 업로드 페이지 -->

<section>
	
	<div class="d-flex">
		<div id="mentBox">
			<div>
				<h3><b>자료 등록</b></h3>	
				<p>스터디 모임에 필요한 자료 또는 공지를 업로드해보세요!</p>
			</div>
		</div>
		<div id="registerBox">
		  <form action="/study/file/fileRegisterComplete" method="post" enctype="multipart/form-data">

		  
		  
			<div class="d-flex">
				<p><b>게시 유형 선택</b></p>
				<select id="csType" class="form-select" name="post_type">
					<option></option>
				</select>
			</div>
			
			
			<div class="d-flex mt-3">
				<p><b>모임 선택</b></p>
				
				<c:forEach var="dto" items="${list}">
				<select id="myStudyGroup" class="form-select" name="group_name">
					<option>${dto.group_name}</option>
				</select>
				</c:forEach>
			</div>
			
			
			<div id="register" class="d-flex">
				<p><b>등록자 닉네임</b></p>
<!-- 				<p id="registerId">sksksksk</p> -->
				<input id="registerId" type="text" value="${sessionScope.userDTO.user_nickname}" class="form-control" name="uploader" readonly> 
			</div>
			<div id="registerName" class="d-flex">
				<p><b>등록자 성명</b></p>
				<input id="userName" type="text" value="${sessionScope.userDTO.user_nm}" class="form-control" readonly> 
			</div>
			
			
			<div class="mt-5 d-flex">
				<p><b>게시 제목</b></p>
				<input id="titleInput" type="text" class="form-control" name="post_title" >
			</div>
			
			
			<div class="mt-5">
				<p><b>게시 내용</b></p>
			</div>
		
			<div>
				<textarea name="content" id="contentText" class="form-control"></textarea>
			</div>
			
			<div class="d-flex mt-3">
				<p><b>파일 유형 선택</b></p>
				<select id="fileType" class="form-select" name="file_type">
					<option></option>
				</select>
			</div>
			
			<div class="mt-5 d-flex">
				<p><b>파일 첨부</b></p>
				<input id="file_name" type="file" class="form-control" name="file_name" >
			</div>
			
			
			
			<div id="buttonGroup">
				<a id="goBackBtn" href="<c:url value="/userCs/myCsPage"/>" type="button" class="btn">이전으로</a>
				<button id="registerConfirmBtn" type="submit" class="btn">등록하기</button>
				
			</div>
		  </form>
		
		</div>
	</div>		

</section>

<script>

$(document).ready(function(){
	
	var postCode = '600';
	commonCodeList(postCode, function(data){
		console.log(data);
		let list = data;
		let str = "";
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#csType").html(str);
	
	})
	
	
	var fileCode = '100';
	commonCodeList(fileCode, function(data){
		console.log(data);
		let list = data;
		let str = "";
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#fileType").html(str);
	
	})

})
</script>





</body>
</html>