


/* view에서 넘어온 공통 코드에 맞는 리스트를 공통코드 테이블에서 가져오기 */

function commonCodeList(a,cb){

	$.ajax({
		url: "/study/common/getCommonCodeList",
		type: "post",
		data: {"code" : a},
		dataType: "json",
		success: (result)=>{
			if(cb) cb(result);
		},
		error: function(){alert("error")}

	})
}

/* view에서 넘어온 지역 코드에 맞는 행정구 리스트를 공통코드 테이블에서 가져오기 */

function getLocationCity(a,b,cb){

		$.ajax({
		url: "/study/common/getCityList",
		type: "post",
		data: {"code" : a, "cityName" : b},
		dataType: "json",
		success: (result)=>{
			if(cb) cb(result);
		},
		error: function(){alert("error")}

	})

}

/* 유저가 받은 메시지함, 보낸 메시지함에서 메시지 삭제하기 */
function deletMessageByNumber(messageNumber, cb){
	
			$.ajax({
			url: "/study/userMessage/deleteMessage",
			type: "post",
			data: {"messageNumber" : messageNumber},
			success: (result)=>{
			if(cb) cb(result);
			},
			error:function(){
				alert("삭제실패!");
			}
		})	
}







