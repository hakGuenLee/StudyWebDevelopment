<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/csRegister.css"/>" rel="stylesheet"/> 		 
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
		  <form action="/study/userCs/csRegisterComplete" method="post">
			<div class="d-flex">
				<p><b>문의 유형 선택</b></p>
				<select id="csType" class="form-select" name="cs_code">
					<option selected>사이트이용</option>
					<option>회원정보</option>
					<option>컴플레인</option>
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