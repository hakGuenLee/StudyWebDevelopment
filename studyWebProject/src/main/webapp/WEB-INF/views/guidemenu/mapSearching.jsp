<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84333c9c51fc5f7bcaa6f798ec88144b"></script>		 

<jsp:include page="../include/header.jsp"/> 

	<section class="mt-5">
		<div class="d-flex" style="margin-top:130px">
			<div style="margin-left:160px">
				<h4 style="font-size:28px"><b>장소 둘러보기</b></h4>
				<p>친구들과 함께 스터디 하기 좋은 장소를 찾아보세요!</p>
			</div>
		
			<div id="map" style="width:900px;height:600px; margin-left:20%">
			</div>
		</div>
	</section>

<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴




</script>

</body>
</html>