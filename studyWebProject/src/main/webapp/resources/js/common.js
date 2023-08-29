


/* 파일 유형을 공통 코드 테이블에서 가져오기 */

function getFileType(a,cb){

	$.ajax({
		url: "/study/common/getFileType",
		type: "post",
		data: {"code" : a},
		dataType: "json",
		success: (result)=>{
			if(cb) cb(result);
		},
		error: function(){alert("error")}

	})


}
