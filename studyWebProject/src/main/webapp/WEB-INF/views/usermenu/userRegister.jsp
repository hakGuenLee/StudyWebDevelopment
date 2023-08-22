<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<link  href="<c:url value="/css/userRegister.css"/>" rel="stylesheet"/> 			

<jsp:include page="../include/header.jsp"/>


<section>
	<h4>가입 정보 입력</h4>
	<div id="container">
	
		<form action="" method="post">
		
			<div id="idArea" class="d-flex mt-5 p-3">
				<p>아이디</p>
				<input type="text" class="idInput form-control" style="width:300px" name="user_id">
				<button type="button" id="idConfirmBtn" class="btn btn-secondary">중복확인</button>	
			</div>		
			
			<!-- 비밀번호 최초 입력 -->
			<div id="passwordArea" class="passwordArea d-flex mt-5">
				<p>비밀번호</p>
				<input type="text" class="idInput form-control" style="width:400px">
			</div>
			
			<!-- 비밀번호 재확인 -->
			<div id="passwordArea2" class="passwordArea d-flex mt-5">
				<p>비밀번호 재확인</p>
				<input type="text" class="idInput form-control" style="width:400px">
			</div>
		</form>	
	
	</div>
</section>

<script>
//ID 중복검사

$("#idConfirmBtn").on("click", function(){
	
	let inputId = $(".idInput").val();
	console.log(inputId);
	
	if(inputId == 0){
		alert("아이디를 입력하세요!");
	}else{

	$.ajax({
		url: "/study/usermenu/idCheck",
		type: "post",
		data: {"id" : inputId},

		success:function(result){
			console.log(result);
			alert(result);
			if(result == "중복된 아이디입니다!"){
				$(".idInput").attr("value", "");
			}
		},
		error:function(request, status, error){
			alert("error code : " + request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
			console.log("실패!")
		}	
	})
	
	}
})




</script>
</body>
</html>