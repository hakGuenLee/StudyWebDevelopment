<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/groupMade.css"/>" rel="stylesheet"/> 		 
  <script  src="<c:url value="/js/groupMade.js"/>"></script>    
  <script  src="<c:url value="/js/commonMovePage.js"/>"></script>    
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div class="d-flex justify-content-center">
		<div id="mentBox">
			<div>
				<h3><b>스터디 모임 만들기</b></h3>	
				<p style="color:Peru   ">스터디 모임을 만들고 함께 공부를 시작해보세요!</p>
				<img id="sideImg" src="<c:url value="/img/book.jpg"/>">
			</div>
		</div>
		<div id="groupOpenBox">
		  <form action="/study/group/groupMadeComplete" method="post">
			<div class="d-flex">
				<p><b>모임명</b></p>
				<input id="groupNameInput" type="text" class="form-control" placeholder="모임 이름을 입력해주세요!" name="group_name">
				<button id="checkNameBtn" onclick="groupNameCheck()" type="button" class="btn btn-secondary">중복 확인</button>

			</div>
			<div id="register" class="d-flex mt-5">
				<p><b>최대 인원</b></p>
				<input id="memberCount" type="text" class="form-control" name="group_boundary">
				<p style="margin-left:15px"><b>명</b></p> 
			</div>
			
			<div id="groupOpenOrNot" class="d-flex mt-5">
				<p><b>공개 설정</b></p>
				<select id="open_yn" class="form-select" name="open_yn">
					<option>공개</option>
					<option>비공개</option>
				</select>
			</div>
			
			<div id="registerName" class="d-flex mt-5">
				<p><b>모임 유형</b></p>
				<select id="groupCategory" class="form-select" name="group_category">
					<option></option>
				</select>
			</div>
			
			<div id="location" class="d-flex mt-5">
				<p><b>지역 설정</b></p>
				<select id="locationlist" class="form-select" name="group_location" onchange="selectLocation()">
					<option value=""></option>
				</select>
			</div>
			
			<div id="location2" class="d-flex mt-5">
				<p><b>상세 지역</b></p>
				<select id="locationCity" class="form-select" name="group_locationCity">
					<option></option>
				</select>
			</div>

			
			<div class="mt-5 d-flex">
				<p><b>모임 설명</b></p>
				<textarea name="group_info" id="groupIntro" class="form-control" 
				placeholder="다른 회원들이 볼 수 있는 모임에 대한 소개 내용을 적어주세요. 더불어 가입 조건을 꼭 명시해주세요! 불량 회원 또는 적합하지 않은 회원의 가입을 방지할 수 있습니다. "></textarea>
			</div>

			
			<div id="buttonGroup" class="d-flex">

				<button onclick="gobackHome()" id="goBackBtn" type="button" class="btn">이전으로</button>

				<button style="margin-left:10px" id="registerConfirmBtn" type="button" class="btn" onclick="groupMade()">모임 만들기</button>
				
			</div>
		  </form>
		
		</div>
	</div>		

</section>

<script>
$(document).ready(function(){
	
	var studyCode = '200';
	commonCodeList(studyCode, function(data){
		console.log(data);
		let list = data;
		let str = "";
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#groupCategory").html(str);
	
	})
	
	var locationCode = '400';
	commonCodeList(locationCode, function(data){
		console.log(data);
		let list = data;
		let str = "";
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#locationlist").html(str);
	
	})

	var cityCode = '300'

	//처음에는 바로 출력되는 서울의 행정구 가져오기
	getLocationCity(cityCode, "서울", function(data){
		console.log(data);
		let cityList = data;
		let str2 = "";
		
		for(let i=0; i<cityList.length; i++){
			str2 += "<option>"+cityList[i].item_nm+"</option>";
		}
		
		$("#locationCity").html(str2);
		
	})
	
})


</script>

</body>
</html>