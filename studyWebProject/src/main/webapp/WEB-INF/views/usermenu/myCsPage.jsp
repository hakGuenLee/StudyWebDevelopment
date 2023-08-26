<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/myCsPage.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div id="guideBox" class="d-flex justify-content-around">
		<div>
			<h4>나의 1:1문의</h4>	
			<p>HappyStudy는 회원님의 목소리에 항상 귀 기울이고 있습니다.<br>더 나은 서비스를 제공해드릴 수 있도록 의견을 보내주세요!</p>
		</div>
		<div>
			<a href="<c:url value="/userCs/csRegisterPage"/>" id="csRegisterBtn" type="button" class="btn">문의 등록하기</a>
		</div>
	</div>
	
	<hr style="width:1300px; margin-left:340px; margin-top:40px;">
	
<!-- 	<div id="csListBox" class="d-flex justify-content-around"> -->
	<div id="csListBox">
		<div>
			<h4>나의 1:1문의 내역</h4>	
		</div>
		<!-- <div>
			<form action="/study/userCs/searchMyCsList" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input type="text" name="searchValue" class="form-control" placeholder="제목을 검색해보세요">
				  <button class="btn btn-secondary" type="submit">검색하기</button>
				</div>
			</form>
		</div> -->
	</div>
	
<!-- 	<div class="d-flex justify-content-around mt-3"> -->	
	<div id="arrayMenu" class="d-flex mt-5">	
		<div>
			<select style="width:160px" class="form-select">
					<option selected>사이트이용</option>
					<option>회원정보</option>
					<option>컴플레인</option>
			</select>
		</div>
		<div>
			<form action="/study/userCs/searchMyCsList" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input type="text" name="searchValue" class="form-control" placeholder="제목을 검색해보세요">
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
					<th>구분</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록일자</th>
					<th>상태</th>
					<th>상세보기</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list == null || list.size()==0}">
					<tr>
						<td colspan="8">문의 내역이 존재하지 않습니다!</td>
					</tr>
				</c:if>
				<c:if test="${list != null || list.size()!=0}">
					<c:forEach var="cs" items="${list }">
					<tr>
						<td>${cs.cs_no}</td>
						<td>${cs.cs_code}</td>
						<td>${cs.cs_title}</td>
						<td>${cs.user_id}</td>
						<td>${cs.cs_dt}</td>
						<td>${cs.proc_sts}</td>
						<td><a href="<c:url value="/userCs/userCsDetailInfo?no=${cs.cs_no}"/>" type="button" class="btn btn-primary">상세보기</a></td>
						<td><button value="${cs.cs_no}" onclick="deleteConfirm(this.value)" type="button" class="btn btn-danger">삭제하기</button></td>
					</tr>
					</c:forEach>
				</c:if>
			</tbody>		
		</table>
	</div>
</section>
<script>
function deleteConfirm(e){
	
	console.log(e)
	
	if(window.confirm("삭제하시면 문의 내역을 복구할 수 없습니다. 정말 삭제하시겠습니까?")){
		console.log("확인")
		
		$.ajax({
			url: "/study/userCs/csDelete",
			type: "post",
			data: {"no" : e},
			success: function(data){
				location.replace(data);
			},
			error: function(){
				alert("요청실패!!");
			}		
		})
		
	}else{
		console.log("취소")
	}	
}

</script>

</body>
</html>