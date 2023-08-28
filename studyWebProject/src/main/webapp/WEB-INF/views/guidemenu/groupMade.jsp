<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/groupMade.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div class="d-flex justify-content-center">
		<div id="mentBox">
			<div>
				<h3><b>모임 만들기</b></h3>	
				<p>즐거운 스터디 모임을 시작할 수 있습니다!</p>
				<img id="sideImg" src="<c:url value="/img/book.jpg"/>">
			</div>
		</div>
		<div id="groupOpenBox">
		  <form action="/study/group/groupMadeComplete" method="post">
			<div class="d-flex">
				<p><b>모임명</b></p>
				<input id="groupNameInput" type="text" class="form-control" placeholder="모임 이름을 입력해주세요!" name="group_name">
				<button id="checkNameBtn" type="button" class="btn btn-secondary">중복 확인</button>

			</div>
			<div id="register" class="d-flex mt-5">
				<p><b>최대 인원</b></p>
				<input id="memberCount" type="text" class="form-control" name="group_boundary">
				<p style="margin-left:15px"><b>명</b></p> 
			</div>
			
			<div id="registerName" class="d-flex mt-5">
				<p><b>모임 유형</b></p>
				<select id="groupCategory" class="form-select" name="group_category">
					<option>취업스터디</option>
					<option>취미모임</option>
					<option>학술회</option>
					<option>독서모임</option>
					<option>팀플모임</option>
					<option>토론회</option>
				</select>
			</div>
			
			<div id="location" class="d-flex mt-5">
				<p><b>지역 설정</b></p>
				<select id="groupCategory" class="form-select" name="group_location">
					<option>서울</option>
					<option>경기</option>
					<option>인천</option>
					<option>강원</option>
					<option>충남</option>
					<option>충북</option>
					<option>경북</option>
					<option>경남</option>
					<option>전북</option>
					<option>전남</option>
					<option>광주</option>
					<option>대구</option>
					<option>부산</option>
					<option>광주</option>
				</select>
			</div>
			
			
			<div class="mt-5 d-flex">
				<p><b>모임 설명</b></p>
				<textarea name="group_info" id="groupIntro" class="form-control" placeholder="30자 내외로 작성해주세요! 작성해주신 내용은 초대할 친구들에게 전해집니다!"></textarea>
			</div>
			

			
			<div id="buttonGroup">
				<a id="goBackBtn" href="<c:url value="/"/>" type="button" class="btn">이전으로</a>
				<button id="registerConfirmBtn" type="button" class="btn">모임 만들기</button>
				
			</div>
		  </form>
		
		</div>
	</div>		

</section>

<script>

//모임명 중복검사
$("#checkNameBtn").on("click", function(){
	
	groupName = $("#groupNameInput").val();
	
	$.ajax({
		url:"/study/group/nameCheck",
		type:"post",
		data:{"name" : groupName},
		success:function(data){
			if(data == "중복된 모임 이름입니다! 다른 이름으로 만들어주세요!"){
				alert(data);
				$("#groupNameInput").val("");
			}else{
				alert(data);
			}
		}
	})

})


//빈 값 유효성 체크

$("#registerConfirmBtn").on("click", function(){

	let groupName =  $("#groupNameInput").val();
	let memberCount = $("#memberCount").val();
	let category = $("#groupCategory").val();
	let intro = $("#groupIntro").val();
	
	if(groupName == 0 || memberCount == 0 || category == 0 || intro == 0){
		alert("내용을 빠짐 없이 입력해주세요!");
		location.replace("#");
	}else{
		$("#registerConfirmBtn").attr("type", "submit");
	}

})

</script>



</body>
</html>