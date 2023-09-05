//모임명 중복검사


function groupNameCheck(){	
	groupName = $("#groupNameInput").val();
	
	if(groupName == 0){
		alert("모임명을 입력해주세요!");
	}else{
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
	
	}



}


	
	function selectLocation(){
		let location = $("#locationlist option:selected").val();
		console.log(location);
		
		
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
	

//빈 값 유효성 체크

function groupMade(){

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

}