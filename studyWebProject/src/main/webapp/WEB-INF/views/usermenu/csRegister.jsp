<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/csRegister.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div class="d-flex">
		<div id="mentBox">
			<div>
				<h3><b>문의 등록</b></h3>	
				<p>회원님의 소중한 문의에 최대한 신속히 답변해드리겠습니다</p>
			</div>
		</div>
		<div id="registerBox">
		  <form action="/study/userCs/csRegisterComplete" method="post">
			<div class="d-flex">
				<p><b>문의 유형 선택</b></p>
				<select id="csType" class="form-select" name="cs_code">
					<option></option>
				</select>
			</div>
			<div id="register" class="d-flex">
				<p><b>등록자 ID</b></p>
<!-- 				<p id="registerId">sksksksk</p> -->
				<input id="registerId" type="text" value="${sessionScope.userDTO.user_id}" class="form-control" name="user_id" readonly> 
			</div>
			<div id="registerName" class="d-flex">
				<p><b>등록자 성명</b></p>
				<input id="userName" type="text" value="${sessionScope.userDTO.user_nm}" class="form-control" readonly> 
			</div>
			
			
			<div class="mt-5 d-flex">
				<p><b>문의 제목</b></p>
				<input id="titleInput" type="text" class="form-control" name="cs_title" >
			</div>
			
			
			<div class="mt-5">
				<p><b>문의 내용</b></p>
			</div>
		
			<div>
				<textarea name="cs_content" id="contentText" class="form-control"></textarea>
			</div>
			
			<div id="buttonGroup">
				<a id="goBackBtn" href="<c:url value="/userCs/myCsPage"/>" type="button" class="btn">이전으로</a>
				<button id="registerResetBtn" type="reset" class="btn">다시 작성하기</button>
				<button id="registerConfirmBtn" type="button" class="btn">등록하기</button>
				
			</div>
		  </form>
		
		</div>
	</div>		

</section>
<script>
$(document).ready(function(){
	
	var studyCode = '500';
	commonCodeList(studyCode, function(data){
		console.log(data);
		let list = data;
		let str = "";

		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#csType").html(str);
	
	})

})
</script>



<script>
//빈 값 유효성 체크

$("#registerConfirmBtn").on("click", function(){
	let content = $("#contentText").val();
	
	if(content == 0){
		alert("문의 내용을 입력해주세요!");
	}else{
		$("#registerConfirmBtn").attr("type","submit");
	}

})

</script>



</body>
</html>