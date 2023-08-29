


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


