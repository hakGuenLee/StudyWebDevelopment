<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

 <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q48bpdovim&submodules=geocoder"></script>


<jsp:include page="../include/header.jsp"/> 

<section style="margin-top:100px">
	<div class="d-flex">
		<div style="margin-left:130px">
			<h4 style="font-size:30px"><b>장소 둘러보기</b></h4>
			<div class="d-flex mt-5">
				<input id="searchLocation" type="text" style="width:280px" class="form-control" placeholder="검색할 장소를 입력해주세요!">
				<input id="submit" type="button" style="margin-left:30px" class="btn btn-primary" value="주소검색">
			</div>
		</div>
	
		<div id="map" style="width:1000px;height:600px; margin-left:18%;">
		</div>
	</div>
	
</section>	
<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);
</script>
</body>
</html>