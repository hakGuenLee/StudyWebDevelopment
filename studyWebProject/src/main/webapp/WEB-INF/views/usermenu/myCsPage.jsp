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
	
	
	<div id="csListBox" class="d-flex justify-content-around">
		<div>
			<h4>나의 1:1문의 내역</h4>	
		</div>
		<div>
			<div id="searchGroup" class="input-group mb-3">
			  <input type="text" class="form-control" placeholder="제목을 검색해보세요">
			  <button class="btn btn-secondary" type="submit">검색하기</button>
			</div>
		</div>
	</div>
	
	<div id="tableBox" class="container w-75 mt-5">
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
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>		
		</table>
	</div>
</section>






</body>
</html>