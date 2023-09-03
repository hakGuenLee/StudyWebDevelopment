
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