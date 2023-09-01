<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>


<link  href="<c:url value="/css/groupSearching.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 

<input type="hidden" id="sessionId" value="${sessionScope.userDTO}">

<section>
	<div id="guideText">
		<div>
			<h4><b>스터디 모임 찾기</b></h4>	
			<p>스터디 모임을 찾고 함께 참여해보세요!</p>
		</div>
	</div>
	

	<div id="arrayMenu" class="d-flex mt-5">	
		<div >
			<select id="locationList" style="width:160px" class="form-select" name="groupList" onchange="selectLocationCity()">
					<option></option>
			</select>
		</div>
		
		<div>
			<select id="locationCity" style="width:160px; margin-left:40px;" class="form-select" onchange="selectLocationCity2()">
					<option>전체</option>
			</select>
		</div>
		<div>
			<form action="/study/groupSearch/searchGroupName" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input type="text" name="searchValue" class="form-control" placeholder="모임명을 검색해보세요">
				  <button class="btn btn-secondary" type="submit">검색하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<div id="tableBox" class="container w-75 mt-3">
		<table class="table mt-3">
			<thead class="table-secondary">
				<tr>
					<th>No.</th>
					<th>모임명</th>
					<th>모임유형</th>
					<th>지역</th>
					<th>상세지역</th>
					<th>대표자 닉네임</th>
					<th>참가인원</th>
					<th>활동상태</th>
					<th>문의하기</th>
					<th>가입신청</th>
				</tr>
			</thead>
			<tbody id="fileList">
				
				<c:if test="${list == null}">
					<tr>
						<td colspan="10">모임이 존재하지 않습니다!</td>
					</tr>
				</c:if>				
				<c:if test="${list != null}">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.group_no}</td>
							<td>${dto.group_name}</td>
							<td>${dto.group_category}</td>
							<td>${dto.group_location}</td>
							<td>${dto.group_locationCity}</td>
							<td>${dto.maker_nickname}</td>
							<td>${dto.member_count}</td>
							<c:if test="${dto.use_yn == 'Y' }">
							<td>활동 중</td>
							</c:if>
							<c:if test="${dto.use_yn == 'N' }">
							<td>활동 중단</td>
							</c:if>
							<td><button value="${dto.group_name}" onclick="messageSender(this.value)" id="questionBtn" type="button" class="btn btn-success">문의하기</button></td>
							<td><button value="${dto.group_name}" onclick="joinMessageSender(this.value, this)" type="button" class="btn btn-primary">가입신청</button></td>
						</tr>
					</c:forEach>	
				</c:if>	
			</tbody>		
		</table>
	</div>
</section>


<!-- 모임 정보 Modal -->
<div class="modal fade" id="GroupInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header" id="groupModalHeader">

        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="groupModal-body" style="height:500px">

      </div>

      <div class="modal-footer">
        <button id="senderBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">문의 보내기</button>
      </div>

    </div>
  </div>
</div> 


<!-- 문의하기 Modal -->
<div class="modal fade" id="QuestionModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 id="title" class="modal-title">문의하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:500px">
        <p>모임에 문의하실 내용을 적어주세요!</p>
        <p style="color:gray; font-size:15px">문의하신 내용은 모임의 대표자에게 전달됩니다!</p>
        <p>제목</p>
        <input type="text" class="form-control w-100" id="questionTitle">
        <p>문의내용</p>
        <textarea id="QuestionArea" class="form-control w-100" style="height:300px; resize: none;"></textarea>
      </div>

      <div class="modal-footer">
        <button id="senderBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">문의 보내기</button>
      </div>

    </div>
  </div>
</div> 



<!-- 가입하기 Modal -->
<div class="modal fade" id="joinModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 id="head" class="modal-title">가입 신청하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" style="height:500px">
        <p>가입 신청 메시지를 작성해보세요!</p>
        <p style="color:gray; font-size:15px">문의하신 내용은 모임의 대표자에게 전달됩니다!</p>
        <p>제목</p>
        <input type="text" class="form-control w-100" id="joinRequestTitle">
        <p>가입신청 내용</p>
        <textarea id="requestArea" class="form-control w-100" style="height:300px; resize: none;" placeholder="자신에 대한 소개를 꼭! 함께 적어주세요!"></textarea>
      </div>

      <div class="modal-footer">
        <button id="joinBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">가입 신청하기</button>
      </div>

    </div>
  </div>
</div> 

<script>
$(document).ready(function(){
	
	var locationCode = '400';
	
	//지역 목록 가져오기
	commonCodeList(locationCode, function(data){
		console.log(data);
		let list = data;
		let str = "";
		str = "<option>전체</option>"
		
		for(let i=0; i<list.length; i++){
			str += "<option value='"+list[i].item_nm+"'>"+list[i].item_nm+"</option>";
		}
		
		$("#locationList").html(str);
	
	})

})
</script>
<script>



//문의하기 창 열기
function messageSender(value){
	
	let user = $("#sessionId").val();
	
	
	
	if(user == 0){
		var result = confirm("로그인이 필요한 서비스입니다! 로그인하시겠습니까?");
		
		if(result == true){
			location.replace("/study/userAccount/loginPage")
		}
	}else{
	$("#QuestionModal").modal("show");
	$("#title").html(value + "에 문의하기");

	$("#senderBtn").on("click", function(){
	let title = $("#questionTitle").val();
		
		let content = $("#QuestionArea").val();

		$.ajax({
			url: "/study/groupSearch/sendQuestion",
			type: "post",
			data: {"groupName":value, "title":title, "message":content},
			success: function(data){
				alert(data);
			},
			error:function(){
				alert("요청실패!")
			}			
			
		})		
		
	})
	
	}
}


//가입하기 처리
function joinMessageSender(value, a){
	
	let user = $("#sessionId").val();
	console.log(a);
	
	if(user == 0){
		var result = confirm("로그인이 필요한 서비스입니다! 로그인하시겠습니까?");
		
		if(result == true){
			location.replace("/study/userAccount/loginPage")
		}
	}else{
		
		//이미 가입되어 있는지 확인하기
		$.ajax({
			url:"/study/groupSearch/joinCheck",
			type:"post",
			data:{"groupName":value},
			success:function(result){

				if(result == true){
					if(confirm("가입하실 수 있는 모임입니다! 가입 신청 하시겠습니까?")){
						//가입 신청 진행	
						$("#joinModal").modal("show");
					
						$("#head").html(value+"에 가입 신청하기")

						$("#joinBtn").on("click", function(){
						
							let title = $("#joinRequestTitle").val();
							let joinContent = $("#requestArea").val();
							
							$.ajax({
								url:"/study/groupSearch/joinComplete",
								type:"post",
								data:{"groupName" :value, "title":title, "content":joinContent},
								success:function(result){
									alert(result);
								},
								error:function(){
									alert("요청 실패!");
								}
								
							})
							
						}) //가입 진행 버튼 클릭시

					} //confirm if 문
					
				}else{  //이미 가입되어 있는 경우
					alert("이미 가입하신 모임입니다!")
				}
			},
			error:function(data){
				alert("에러!");
			}
			
		})
		
	}
	
}

//지역에 따라 모임 리스트 정렬
function selectLocationCity(){
	let location = $("#locationList option:selected").val();
	let locationCity = $("#locationCity option:selected").val();
	
	if(location == '전체'){
		let str = "";
		str += "<option>전체</option>";
		$("#locationCity").html(str);
	}else{
		var cityCode = '300'

			console.log("지역명 : " + location)
			
			getLocationCity(cityCode, location, function(data){
				console.log(data);
				let cityList = data;
				let str2 = "";
				
				for(let i=0; i<cityList.length; i++){
					str2 += "<option>"+cityList[i].item_nm+"</option>";
				}
				
				$("#locationCity").html(str2);
				
			}) 
	}
	
	//지역에 따라 모임 리스트 가져오기
	$.ajax({
		url:"/study/groupSearch/getStudyListByLocation",
		type:"post",
		data: {"location":location, "city":locationCity},
		success:function(data){
			console.log(data)
			let anotherStr ="";
			let y = "Y";
			let N = "N";
			let studyList = data;
			
			if(data == 0){
				anotherStr += "<tr>";
				anotherStr += "<td colspan='10'>스터디 모임이 존재하지 않습니다!</td>";
				$("#fileList").html(anotherStr);
			}else{
				for(let i=0; i<studyList.length; i++){
					anotherStr += "<tr>"
					anotherStr += "<td>"+studyList[i].group_no+"</td>";	
					anotherStr += "<td>"+studyList[i].group_name+"</td>";	
					anotherStr += "<td>"+studyList[i].group_category+"</td>";	
					anotherStr += "<td>"+studyList[i].group_location+"</td>";	
					anotherStr += "<td>"+studyList[i].group_locationCity+"</td>";	
					anotherStr += "<td>"+studyList[i].maker_nickname+"</td>";	
					anotherStr += "<td>"+studyList[i].member_count+"</td>";	
					if(studyList[i].use_yn == "Y"){
						anotherStr += "<td>활동 중</td>";		
					}
					if(studyList[i].use_yn == "N"){
						anotherStr += "<td>활동 중단</td>";		
					}
	/* 				anotherStr += "<c:if test='"+studyList[i].use_yn+" =="+y+"'>";	
					anotherStr += "<td>활동 중</td>";	
					anotherStr += "</c:if>";	
					anotherStr += "<c:if test='"+studyList[i].use_yn+"=="+N+"'>";	
					anotherStr += "<td>활동 중단</td>";	
					anotherStr += "</c:if>";	 */
					anotherStr += "<td><button value='"+studyList[i].group_name+"' onclick='messageSender(this.value)' type='button' class='btn btn-success'>문의하기</button></td>";
					anotherStr += "<td><button value='"+studyList[i].group_name+"' onclick='joinMessageSender(this.value)' type='button' class='btn btn-primary'>가입신청</button></td>";
					anotherStr += "</tr>"
					
					$("#fileList").html(anotherStr);
					
				}
			}
			

		},
		error:function(){
			alert("지역 정렬 실패!!");
		}
		
		
	})
		
}




//행정구역에 따라 모임 리스트 정렬
function selectLocationCity2(){
	let location = $("#locationList option:selected").val();
	let locationCity = $("#locationCity option:selected").val();

	//지역에 따라 모임 리스트 가져오기
	$.ajax({
		url:"/study/groupSearch/getStudyListByLocation",
		type:"post",
		data: {"location":location, "city":locationCity},
		success:function(data){
			console.log(data)
			let anotherStr ="";
			let y = "Y";
			let N = "N";
			let studyList = data;
			
			if(data == 0){
				anotherStr += "<tr>";
				anotherStr += "<td colspan='10'>스터디 모임이 존재하지 않습니다!</td>";
				$("#fileList").html(anotherStr);
			}else{
				for(let i=0; i<studyList.length; i++){
					anotherStr += "<tr>"
					anotherStr += "<td>"+studyList[i].group_no+"</td>";	
					anotherStr += "<td>"+studyList[i].group_name+"</td>";	
					anotherStr += "<td>"+studyList[i].group_category+"</td>";	
					anotherStr += "<td>"+studyList[i].group_location+"</td>";	
					anotherStr += "<td>"+studyList[i].group_locationCity+"</td>";	
					anotherStr += "<td>"+studyList[i].maker_nickname+"</td>";	
					anotherStr += "<td>"+studyList[i].member_count+"</td>";	
					if(studyList[i].use_yn == "Y"){
						anotherStr += "<td>활동 중</td>";		
					}
					if(studyList[i].use_yn == "N"){
						anotherStr += "<td>활동 중단</td>";		
					}
	/* 				anotherStr += "<c:if test='"+studyList[i].use_yn+" =="+y+"'>";	
					anotherStr += "<td>활동 중</td>";	
					anotherStr += "</c:if>";	
					anotherStr += "<c:if test='"+studyList[i].use_yn+"=="+N+"'>";	
					anotherStr += "<td>활동 중단</td>";	
					anotherStr += "</c:if>";	 */
					anotherStr += "<td><button value='"+studyList[i].group_name+"' onclick='messageSender(this.value)' type='button' class='btn btn-success'>문의하기</button></td>";
					anotherStr += "<td><button value='"+studyList[i].group_name+"' onclick='joinMessageSender(this.value)' type='button' class='btn btn-primary'>가입신청</button></td>";
					anotherStr += "</tr>"
					
					$("#fileList").html(anotherStr);
					
				}
			}
			

		},
		error:function(){
			alert("지역 정렬 실패!!");
		}
		
		
	})
		
}




</script>

</body>
</html>
