<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/csRegister.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div class="d-flex">
		<div id="mentBox">
			<div>
				<h3><b>문의 등록</b></h3>	
				<p>회원님의 소중한 문의에 최대한 신속히 답변해드리겠습니다</p>
			</div>
		</div>
		<div id="registerBox">
			<div class="d-flex">
				<p><b>문의 유형 선택</b></p>
				<select id="csType" class="form-select">
					<option>sssss</option>
					<option>sssss</option>
					<option>sssss</option>
					<option>ssssss</option>
				</select>
			</div>
			<div id="register" class="d-flex">
				<p><b>등록자 ID</b></p>
				<p id="registerId">sksksksk</p>
	<!-- 			<input id="registerId" type="text" class="form-control" readonly> -->
			</div>
			<div id="registerName" class="d-flex">
				<p><b>등록자 성명</b></p>
				<p id="userName">sksksksk</p>
			</div>

			<div class="mt-5">
				<p><b>문의 내용 입력</b></p>
			</div>
		
			<div>
				<textarea id="contentText" class="form-control"></textarea>
			</div>
			
			<div>
				<button type="button" class="btn">등록하기</button>
				
			</div>
		
		</div>
	</div>		
	

	

</section>



</body>
</html>