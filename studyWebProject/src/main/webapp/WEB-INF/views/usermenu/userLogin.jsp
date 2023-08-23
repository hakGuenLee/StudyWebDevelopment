<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<link  href="<c:url value="/css/userLogin.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/>


<section>
 	<input id="errorMessage" type="hidden" value="${loginError}">
	<h4>로그인</h4>
	<div id="container">
		<form action="/study/usermenu/userLogin" method="post">
			<div class="d-flex justify-content-center mt-5">
				<p><b>아이디</b></p>
				<input id="idInput" type="text" class="form-control" placeholder="아이디를 입력하세요" name="id">
			</div>
			<div class="d-flex justify-content-center mt-5">
				<p><b>비밀번호</b></p>
				<input id="pwInput" type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="pw">
			</div>
	
			<div class="d-flex justify-content-center mt-5">
				<button id="loginBtn" type="button" class="btn">로그인하기</button>
			</div>
		</form>	
	</div>
	
	
	<p id="askMsg" class="mt-5">계정이 생각나지 않으시나요?</p>
			<div class="d-flex justify-content-center">
				<a id="searchId" type="button" class="btn">아이디 찾기</a>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<a id="searchPw" type="button" class="btn">비밀번호 변경하기</a>
			</div>
			
			
		<p id="askMsg2" class="mt-5">아직 회원이 아니신가요?</p>
			<div class="d-flex justify-content-center">
				<a href="<c:url value="/usermenu/acceptRule"/>" id="joinButton" type="button" class="btn">회원가입하기</a>
			</div>
	
</section>



<!-- 아이디 찾기 Modal -->
<div class="modal fade" id="idSerchModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" style="height:100px">
        <p>가입 시 등록하셨던 이메일을 입력해주세요!</p>
        <input id="mailInput" type="text" class="form-control w-100">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button id="serchIdBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">아이디찾기</button>
      </div>

    </div>
  </div>
</div>

<!-- 아이디 찾기 결과 Modal -->
<div class="modal fade" id="idsearchResultModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기 결과</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="idSearchResultModalBody">
        <p></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button id="serchIdBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>




<script>
//로그인 정보 입력 유효성 검사
$("#loginBtn").on("click", function(){
	let id = $("#idInput").val();
	let pw = $("#pwInput").val();
	
	if(id == 0 || pw == 0){
		alert("아이디 또는 비밀번호를 입력해주세요!")
	}else{
		$("#loginBtn").attr("type", "submit");
	}

})


$(document).ready(function(){
	
	let error = $("#errorMessage").val();
	
	if(error != 0){
		alert(error);
	}
})

$("#searchId").on("click", function(){	
	$("#idSerchModal").modal("show");
})




$("#serchIdBtn").on("click", function(){
	let mail = $("#mailInput").val();
	console.log(mail);
	
	$.ajax({
		url:"/study/usermenu/idSerch",
		type:"post",
		data: {"mail" : mail},
		success: function(data){
			console.log(data)
			
			$("#idsearchResultModal").modal("show");
			
			let str = "";
			str += "<p>" +data+ "</p>";
			$("#idSearchResultModalBody").html(str);
			
			
		},
		error: function(){
			alert("요청실패!");
		}
	})


})


</script>







</body>
</html>