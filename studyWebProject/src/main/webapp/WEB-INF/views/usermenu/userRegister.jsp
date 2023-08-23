<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<script  src="<c:url value="/js/daumAPI.js"/>"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link  href="<c:url value="/css/userRegister.css"/>" rel="stylesheet"/> 			

<jsp:include page="../include/header.jsp"/>


<section>
	<h4>가입 정보 입력</h4>
	<div id="container">	
		<form action="" method="post">
		
			<div id="idArea" class="infoBox d-flex mt-5 p-3">
				<p><b>아이디</b></p> <span>*</span>
				<input type="text" id="idInput" class="infoText form-control w-25" name="user_id" placeholder="ID는 영문,숫자 조합 & 2자리 이상 10자리 이하로 만들어주세요!">

				<button type="button" id="idConfirmBtn" class="btn btn-secondary">중복확인</button>	
			</div>

			<div id="nickArea" class="infoBox d-flex mt-3 p-3">
				<p><b>닉네임</b></p> <span>*</span>
				<input type="text" id="nickInput" class="infoText form-control w-25" name="user_nickname">
				<button type="button" id="nickConfirmBtn" class="btn btn-secondary">중복확인</button>	
			</div>	
			
			<div id="passwordArea" class="d-flex mt-3 p-3 me-5 justify-content-center">
				<p><b>비밀번호</b></p> <span>*</span>
				<input type="password" id="pwInput" class="infoText form-control w-25" placeholder="비밀번호는 영문,숫자,특수기호 조합 8~16자로 만들어주세요!">
			</div>		
 			<div id="passwordArea2" class="infoBox d-flex mt-3 p-3 me-5 justify-content-center">
				<input type="password" id="pwConfirm" class="infoText form-control w-25" name="user_pw" placeholder="비밀번호를 한번 더 확인해주세요!">
				<button type="button" id="pwConfirmBtn" class="btn btn-secondary">비밀번호 확인</button>	
			</div>
					
			<div id="usernamedArea" class="d-flex mt-3 p-3 me-5 justify-content-center">
				<p><b>성명</b></p> <span>*</span>
				<input type="text" class="infoText form-control w-25" placeholder="성함을 입력해주세요" name="user_nm">
			</div>	
			
			<div id="birthArea" class="d-flex mt-3 p-3 me-5 justify-content-center" >
				<p><b>생년월일</b></p>
				<input type="date" class="infoText form-control w-25" placeholder="성함을 입력해주세요" name="birth_ymd">
			</div>
			
			<div id="homeNumberArea" class="d-flex mt-3 p-3 me-5 justify-content-center">
				<p><b>자택번호</b></p> 
				<input type="text" class="infoText form-control w-25" placeholder="성함을 입력해주세요" name="user_home">
			</div>	
			
			<div id="mobileNumberArea" class="d-flex mt-3 p-3 me-5 justify-content-center">
				<p><b>휴대번호</b></p> <span>*</span> 
				<input type="text" class="infoText form-control w-25" placeholder="휴대번호를 입력해주세요" name="user_phone">
			</div>	
			
			<div id="mailArea" class="d-flex mt-3 p-3 me-5 justify-content-center">
				<p><b>이메일</b></p> <span>*</span>
				<input type="text" id="mailInput" class="infoText form-control w-25" name="user_email" placeholder="정확한 메일을 입력해주세요!">

				<button type="button" id="mailConfirmBtn" class="btn btn-secondary">이메일 인증</button>	
			</div>		
			<!-- 이메일 인증코드 확인 -->
			<div class="infoBox mt-3 p-3 row" id="confirmEmail">
			</div>
			
			<!-- 주소 확인 -->
			
			<div id="addrArea" class="infoBox d-flex mt-3 p-3">
				<p><b>주소 확인</b></p> <span>*</span>
				<input type="text" id="sample4_postcode" class="infoText form-control w-25" name="zipcode" placeholder="우편번호" readonly>
				<button type="button" id="" onclick="sample4_execDaumPostcode()" class="btn btn-primary">주소 검색</button>	
			</div>	
			
			<div id="addrArea2" class="infoBox d-flex mt-3 p-3">
				<p><b>도로명 주소</b></p> <span>*</span>
				<input type="text" id="sample4_roadAddress" class="infoText form-control w-25" name="addr_road" placeholder="도로명주소" readonly>
			</div>	
			
			<div id="addrArea3" class="infoBox d-flex mt-3 p-3">
				<p><b>지번 주소</b></p> <span>*</span>
				<input type="text" id="sample4_jibunAddress" class="infoText form-control w-25" name="addr_jibun" placeholder="지번주소" >
			</div>	
			
			<div id="addrArea4" class="infoBox d-flex mt-3 p-3">
				<p><b>상세 주소</b></p> <span>*</span>
				<input type="text" id="addrInfo" class="infoText form-control w-25" name="addr_detail" placeholder="상세주소를 입력해주세요" >
			</div>	
			
			<div class="infoBox d-flex mt-3 p-3 justify-content-center">
				<button type="button" class="btn btn-secondary">이전으로</button>
				<button type="button" class="btn btn-primary">가입하기</button>
			</div>

		</form>	
	
	</div>
</section>

<script>
//ID 정규식 검사 & 중복검사
$("#idConfirmBtn").on("click", function(){
	
	let idpattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,10}$/; 
	
	let inputId = $("#idInput").val();
	console.log(inputId);

	if(inputId == 0){
		alert("아이디를 입력하세요!");
	}
	
	else if(!idpattern.test(inputId)){
		alert("ID는 영문,숫자 조합 & 2자리 이상 10자리 이하로 만들어주세요!")
		$("#idInput").val("");

	}else{

	$.ajax({
		url: "/study/usermenu/idCheck",
		type: "post",
		data: {"id" : inputId},

		success:function(result){
			console.log(result);
			alert(result);
			if(result == "중복된 아이디입니다!"){
				$("#idInput").attr("value", null);
			}
		},
		error:function(request, status, error){
			alert("error code : " + request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
			console.log("실패!")
		}	
	})
	
	}


})
//닉네임 중복 검사
$("#nickConfirmBtn").on("click", function(){
	
	let inputNick = $("#nickInput").val();
	console.log(inputNick);
	
	if(inputNick == 0){
		alert("닉네임을 입력하세요!");
	}else{

	$.ajax({
		url: "/study/usermenu/nicknameCheck",
		type: "post",
		data: {"nickName" : inputNick},

		success:function(result){
			console.log(result);
			alert(result);
			if(result == "중복된 닉네임입니다!"){
				$("#nickInput").val("")
			}
		},
		error:function(request, status, error){
			alert("error code : " + request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
			console.log("실패!")
		}	
	})
	
	}
})

//비밀번호 정규식 && 일치 여부 확인
$("#pwConfirmBtn").on("click", function(){
	
	let firstPwInput = $("#pwInput").val();
	let SecondPwInput = $("#pwConfirm").val();
	
	let pwPattern = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	
	if(firstPwInput == 0 || SecondPwInput == 0){
		alert("비밀번호를 입력하세요!");
	}
	
	if(firstPwInput == SecondPwInput){
		alert("비밀번호가 일치합니다!")
	}else{
		alert("비밀번호가 일치하지 않습니다! 다시 입력해주세요!")
		$("#pwConfirm").val("");
	}

})

//이메일 인증 진행
$("#mailConfirmBtn").on("click", function(){
	let email = $("#mailInput").val();
	console.log("하하!");
	
	$.ajax({
		url : "/study/usermenu/emailCheck",
		type : "post",
		data : {"mail": email},
		success : function(emailCode){
			
			if(emailCode != "fail"){
				
				serverUUID = emailCode;
				console.log(emailCode)
				

				$("#confirmEmail")
				.html(
						'<div class="col-md-8">'
								+ '<input class="form-control w-25 mb-2" type="text" id="confirmUUID">'
								+ ' </div>'
								+ ' <div class="col-md-4">'
								+ ' <span class="btn btn-outline-secondary" onclick="emailConfirm()">인증코드확인</span>'
								+ '</div>');
			}else{
			alert("이메일을 다시 확인하세요!")
			$("#mailInput").select();
			}
		},
		error:function(request, status, error){
			alert("error code : " + request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
			console.log("실패!")
		} 
		
	})	
})

//이메일 인증번호 확인 절차
function emailConfirm(){
	let confirmValue = $("#confirmUUID").val();
	
	if(confirmValue == null || confirmValue == ""){
		alert("인증코드를 확인하세요!");
		$("#confirmUUID").select();
	}else if(serverUUID == confirmValue){
		alert("인증에 성공하였습니다!")
	}else{
		alert("인증 번호를 확인하세요!")
		$("#confirmUUID").select();
		return;
	}
}












</script>



</body>
</html>