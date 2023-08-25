<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/groupMade.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div class="d-flex">
		<div id="mentBox">
			<div>
				<h3><b>모임 만들기</b></h3>	
				<p>즐거운 스터디 모임을 시작할 수 있습니다!</p>
				<img id="sideImg" src="<c:url value="/img/book.jpg"/>">
			</div>
		</div>
		<div id="groupOpenBox">
		  <form action="/study/userCs/csRegisterComplete" method="post">
			<div class="d-flex">
				<p><b>모임명</b></p>
				<input id="groupNameInput" type="text" class="form-control" placeholder="모임 이름을 입력해주세요!">
				<button id="checkNameBtn" type="button" class="btn btn-secondary">중복 확인</button>

			</div>
			<div id="register" class="d-flex mt-5">
				<p><b>모임 인원</b></p>
				<input id="memberCount" type="text" class="form-control" name="user_id" readonly>
				<p style="margin-left:15px"><b>명</b></p> 
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