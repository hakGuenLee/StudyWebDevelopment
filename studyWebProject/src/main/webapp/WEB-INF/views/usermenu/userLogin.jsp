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

      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:100px">
        <p>가입 시 등록하셨던 이메일을 입력해주세요!</p>
        <input id="mailInput" type="text" class="form-control w-100">
      </div>

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

      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기 결과</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" id="idSearchResultModalBody">
        <p></p>
      </div>

      <div class="modal-footer">
        <button id="serchIdBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 



<!-- 비밀번호 변경 Modal -->
<div class="modal fade" id="pwSerchModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">비밀번호 변경하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:160px">
        <p>가입하셨던 ID와 이메일을 입력해주세요!</p>
        <div>
	        <input id="idInput2" type="text" class="form-control w-100" placeholder="ID를 입력하세요">
	        <input id="mailInput2" type="text" class="form-control mt-3 w-100" placeholder="이메일을 입력하세요">
        </div>
      </div>

      <div class="modal-footer">
        <button id="changePwBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">비밀번호 변경하기</button>
      </div>

    </div>
  </div>
</div> 

<!-- 비밀번호 변경 진행 Modal -->
<div class="modal fade" id="pwChangeModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">비밀번호 변경 진행</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:200px" id="pwChangeConfirmBody">
        <p>새로운 비밀번호를 입력해주세요!</p>
        <div>
	        <input id="newPwInput" type="password" class="form-control w-100" placeholder="비밀번호를 입력하세요" onkeyup="patternCheck()">
	        <p id="checkMsg"></p>
	        <input id="newPwInput2" type="password" class="form-control mt-3 w-100" placeholder="비밀번호를 확인해주세요">
	        <p id="checkMsg2"></p>
        </div>
      </div>

      <div class="modal-footer" id="pwChangeConfirmFooter">
        <button id="changePwConfirmBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">변경하기</button>
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

//일치하는 계정이 없을 경우 에러 메세지 alert
$(document).ready(function(){
	
	let error = $("#errorMessage").val();
	
	if(error != 0){
		alert(error);
	}
})

//아이디찾기 Modal 열기
$("#searchId").on("click", function(){	
	$("#idSerchModal").modal("show");
})



//아이디찾기 Modal에서 찾기 버튼 클릭 시 아이디 찾기 진행 및 결과 Modal 열기
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
			str += "<p>검색된 ID : " +data+ "</p>";
			$("#idSearchResultModalBody").html(str);
			
			
		},
		error: function(){
			alert("요청실패!");
		}
	})
})

//비밀번호 찾기 Modal 열기
$("#searchPw").on("click", function(){
	$("#pwSerchModal").modal("show")	
})

//비밀번호 찾기 Modal에서 찾기 버튼 클릭 시 비밀번호 변경 진행 처리 및 Modal 열기

$("#changePwBtn").on("click", function(){
	let id2 = $("#idInput2").val();	
	let mail2 = $("#mailInput2").val();
	
	console.log(id2);
	console.log(mail2);
	
	$.ajax({
		url:"/study/usermenu/pwChange",
		type:"post",
		data: {"id":id2, "mail":mail2},
		success: function(data){
			console.log(data)
			if(data == false){
				$("#pwChangeModal").modal("show");
				let str = "";
				str += "<p>일치하는 계정이 존재하지 않습니다! 아이디와 이메일을 다시 확인해보세요!</p>";
				$("#pwChangeConfirmBody").html(str);
				
				let str2 = ""
				str2 += "<button id='againBtn' type='button' class='btn btn-danger' data-bs-dismiss='modal'>다시 입력하기</button>";
				$("#pwChangeConfirmFooter").html(str2);
				$("#againBtn").on("click", function(){
					$("#pwSerchModal").modal("show");
				})
				
			}else if(data == true){
				$("#pwChangeModal").modal("show");
				let str3= "";
				
				str3 += "<p>새로운 비밀번호를 입력해주세요!</p>"
					+	"<div>"
					+	"<input id='newPwInput' type='password' class='form-control w-100' placeholder='비밀번호를 입력하세요' onkeyup='patternCheck()'>"
					+	"<p id='checkMsg'></p>"
					+	"<input id='newPwInput2' type='password' class='form-control mt-3 w-100' placeholder='비밀번호를 확인해주세요'>"
					+   "<p id='checkMsg2'></p>"
					+ "</div>"
				$("#pwChangeConfirmBody").html(str3);
				
				str4 = "";
				str4 += "<button id='changePwConfirmBtn' type='button' class='btn btn-primary' data-bs-dismiss='modal'>변경하기</button>"
				
				$("#pwChangeConfirmFooter").html(str4);
				
			}			
		},
		error: function(){
			alert("요청실패!");
		}
	})
})

//새 비밀번호 정규식 검사
 function patternCheck(){
	let pattern = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	let newPw1 = $("#newPwInput").val();
	if(!pattern.test(newPw1)){
		$("#checkMsg").html("비밀번호는 영어,숫자, 특수기호 조합 8~16자여야 합니다! 다시 입력해주세요!");
		$("#checkMsg").css({"color" : "red", "font-size" : "12px"});
		
		let str4 = "";
		str4 += "<button id='changePwConfirmBtn' type='button' class='btn btn-primary'>변경하기</button>"
		
		$("#pwChangeConfirmFooter").html(str4);
	}else{
		$("#checkMsg").html("사용 가능한 비밀번호입니다!");
		$("#checkMsg").css({"color" : "blue", "font-size" : "12px"});
		let str5 = "";
		str5 += "<button id='changePwConfirmBtn' type='button' class='btn btn-primary' data-bs-dismiss='modal'>변경하기</button>"
			$("#pwChangeConfirmFooter").html(str5);
	}
} 
//새 비밀번호 변경 처리 전 유효성 검사 후 변경 처리 진행
$("#changePwConfirmBtn").on("click", function(){
	let fisrtPw = $("#newPwInput").val();
	let secondPw = $("#newPwInput2").val();
	
	console.log(firstPw);
	console.log(secondPw);
	
	if(firstPw != secondPw){
		$("#checkMsg2").html("비밀번호가 일치하지 않습니다! 다시 확인해주세요!");
		$("#checkMsg2").css({"color" : "red", "font-size" : "12px"});
		$("#newPwInput2").val("");
		
		let str = "";
		str += "<button id='changePwConfirmBtn' type='button' class='btn btn-primary'>변경하기</button>"
		
		$("#pwChangeConfirmFooter").html(str);
	}
	
	if(firstPw == 0 || secondPw == 0){
		$("#checkMsg").html("비밀번호를 입력해주세요!");
		$("#checkMsg").css({"color" : "red", "font-size" : "12px"});
		let str2 = "";
		str2 += "<button id='changePwConfirmBtn' type='button' class='btn btn-primary'>변경하기</button>"
		
		$("#pwChangeConfirmFooter").html(str2);
	}
	
	if(firstPw == secondPw){
		$("#checkMsg2").html("비밀번호가 일치합니다!");
		$("#checkMsg2").css({"color" : "blue", "font-size" : "12px"});
	}
	
	
	
	
	
})

</script>







</body>
</html>