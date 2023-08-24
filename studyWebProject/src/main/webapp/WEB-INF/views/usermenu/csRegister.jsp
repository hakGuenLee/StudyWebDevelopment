<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<link  href="<c:url value="/css/csRegister.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	
	<div id="guideBox" class="d-flex justify-content-around">
		<div>
			<h4>문의 등록</h4>	
			<p>회원님의 소중한 문의에 최대한 신속히 답변해드리겠습니다</p>
		</div>
		<div>
			<button id="csRegisterBtn" type="button" class="btn">문의 등록하기</button>
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