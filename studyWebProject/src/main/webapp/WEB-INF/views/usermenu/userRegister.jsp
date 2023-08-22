<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<link  href="<c:url value="/css/userRegister.css"/>" rel="stylesheet"/> 			 
<jsp:include page="../include/header.jsp"/>


<section>
	<h4>가입 정보 입력</h4>
	<div id="container">
	
		<form action="" method="post">
			<div class="d-flex mt-5">
				<p>아이디</p>
				<input id="idInput" type="text" class="form-control" style="margin: auto" name="user_id">
				<button type="button" id="idConfirmBtn" class="btn btn-secondary">중복확인</button>	
			</div>		
		</form>	
	
	</div>
</section>




<script>


//ID 중복검사
$("#idConfirmBtn").on("click", function(){
	
	let inputId = $("#idInput").val();
	console.log(inputId);
	
	$.ajax({
		url: "/study/usermenu/idCheck",
		type: "post",
		data: {"id" : inputId},

		success:function(result){
			console.log(result);
			alert(result);
		},
		error:function(request, status, error){
			alert("error code : " + request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
			console.log("실패!")
		}	
	})
})


</script>
</body>
</html>