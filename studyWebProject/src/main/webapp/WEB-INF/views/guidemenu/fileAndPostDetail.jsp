<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
		 
<jsp:include page="../include/header.jsp"/> 

<!-- 게시글 내용 상세보기 -->

<section>
	
	<div style="margin-top:150px; margin-left:20%;">
		<div>
			<h4>게시 내용 상세보기</h4>	
		</div>
	</div>
	
	<div class="d-flex" style="margin-left:20%; margin-top:40px;">
		<p style="margin-left:80px">게시번호 : ${post.file_no}</p>
		<p style="margin-left:80px">제목 : ${post.post_title}</p>
		<p style="margin-left:80px">등록자 : ${post.uploader}</p>
		<p style="margin-left:80px">등록일자 : ${post.upload_dt}</p>
		<p style="margin-left:80px">조회수 : ${post.hit}</p>
	</div>
	
	<div style="margin-left:20%; margin-top:30px;">
		<textarea  style="width:1200px; height:200px; background-color:Cornsilk" 
		class="form-control" readonly>${post.content}
		</textarea>
	</div>
	
	<c:if test="${csDTO.proc_id == null}">
		<p style="margin-left:20%; margin-top:30px; color:gray">현재 담당자가 문의해주신 사항을 확인 중에 있습니다! 
		신속하게 답변해드리겠습니다.</p>
	</c:if>
	
<%--  	<c:if test="${csDTO.proc_id != null}"> 
		<div class="d-flex" style="margin-left:20%; margin-top:40px;">
			<p>담당자명 : ${csDTO.cs_serial}</p>
			<p style="margin-left:80px">등록일자 : ${csDTO.cs_title}</p>
		</div>
		<div style="margin-left:20%; margin-top:30px;">
			<textarea  style="width:1200px; height:150px;" 
			class="form-control" readonly>${csDTO.cs_content}
			</textarea>
		</div>	
	</c:if>  --%>
	
	<div style="margin-left:44%; margin-top:40px;">
		<a href="<c:url value="/"/>" type="button" style="background-color:gray;color:white; width:120px; height:50px;" class="btn">Home</a>
		<a href="<c:url value="/userCs/myCsPage"/>" type="button" style="background-color:dodgerBlue;color:white; height:50px; margin-left:12px;" class="btn">나의 1:1 문의 보기</a>
	</div>
	


</section>
</body>
</html>