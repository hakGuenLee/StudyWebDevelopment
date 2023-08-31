<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/acceptRule.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	<h4>약관 동의</h4>	
	<p>약관에 동의하셔야 회원 가입을 진행하실 수 있습니다.</p>
	<div class="container">	
		<!-- 이용약관 -->		
		<div class="agreementText">

			<input type="checkbox" id="agreeCheckBox">
			<lable for="agreeCheckBox">이용약관을 확인하였으며 이에 동의합니다</lable>
			<input type="text" class="form-control w-100 h-25 mt-3" value="Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit, ut. Omnis, asperiores facere? Corrupti at, explicabo quidem optio recusandae,
				reiciendis culpa odio libero laudantium enim laboriosam accusantium qui esse rem!" readonly>	
		</div>

		<!-- 개인정보 처리방침 -->
	
		<div class="agreementText">
			<input type="checkbox" id="agreeCheckBox2">
			<lable for="agreeCheckBox2">개인정보 처리방침을 확인하였으며 이에 동의합니다</lable>
			<input type="text" class="form-control w-100 h-25 mt-3" value="Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit, ut. Omnis, asperiores facere? Corrupti at, explicabo quidem optio recusandae,
				reiciendis culpa odio libero laudantium enim laboriosam accusantium qui esse rem!" readonly>		
		</div>
	</div>
	
	<div id="btnBox">
	<a type="button" href="<c:url value="/"/>" class="btn btn-secondary">이전으로</a>
	<a type="button" id="confirmBtn"<%--  href="<c:url value="/usermenu/registerInfo"/>" --%> class="btn btn-primary">다음으로</a>
	
	</div>
</section>


<script>

//약관 동의 유효성 검사 함수

$("#confirmBtn").on("click", function(){
	
	let check1 = $("#agreeCheckBox").prop('checked');
	let check2 = $("#agreeCheckBox2").prop('checked');
	
	console.log(check1);
	console.log(check2);
	
	//모두 체크되었을 경우에만 가입 정보 입력 페이지로 이동
	if(check1 == true && check2 == true){
		$("#confirmBtn").attr("href", "<c:url value='/userRegister/registerInfo'/>");
	}
	
	if(check1 == false){
		alert("이용약관에 동의해주세요!")
		$("#confirmBtn").attr("href", "#");
	}
	
	if(check2 == false){
		alert("개인정보 방침에 동의해주세요!")
		$("#confirmBtn").attr("href", "#");
	}
		
})
</script>



</body>
</html>