<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>


<link  href="<c:url value="/css/groupSearching.css"/>" rel="stylesheet"/> 		 
<jsp:include page="../include/header.jsp"/> 


<section>
	<div id="guideText">
		<div>
			<h4><b>스터디 모임 찾기</b></h4>	
			<p>스터디 모임을 찾고 함께 참여해보세요!</p>
		</div>
	</div>
	

	<div id="arrayMenu" class="d-flex mt-5">	
		<div >
			<select id="myGroupList" style="width:160px" class="form-select" name="groupList">
					<option></option>
			</select>
		</div>
		
		<div>
			<select id="fileType" style="width:160px; margin-left:20px;" class="form-select">
					<option>전체</option>
			</select>
		</div>
		<div>
			<form action="/study/userCs/searchMyCsList" method="post">
				<div id="searchGroup" class="input-group mb-3">
				  <input type="text" name="searchValue" class="form-control" placeholder="모임명을 검색해보세요">
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
					<th>모임명</th>
					<th>모임유형</th>
					<th>지역</th>
					<th>상세지역</th>
					<th>대표자 닉네임</th>
					<th>참가인원</th>
					<th>문의하기</th>
					<th>가입신청</th>
				</tr>
			</thead>
			<tbody id="fileList">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.group_no}</td>
						<td>${dto.group_name}</td>
						<td>${dto.group_category}</td>
						<td>${dto.group_location}</td>
						<td>${dto.group_locationCity}</td>
						<td>${dto.group_maker}</td>
						<td>${dto.member_count}</td>
						<td><button value=""  type="button" class="btn btn-success">문의하기</button></td>
						<td><button value=""  type="button" class="btn btn-primary">가입신청</button></td>
					</tr>
				</c:forEach>	
			</tbody>		
		</table>
	</div>
</section>



</body>
</html>