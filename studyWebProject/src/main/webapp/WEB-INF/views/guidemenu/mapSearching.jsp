<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 	 
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84333c9c51fc5f7bcaa6f798ec88144b&libraries=services"></script>	 
<link  href="<c:url value="/css/kakaomapAPI.css"/>" rel="stylesheet"/> 

<jsp:include page="../include/header.jsp"/> 
<script>
//장소 검색 후 엔터 키 입력 시 검색 버튼 클릭 이벤트
$(document).ready(function(){
	$("#keyword").keyup(function(event){
		if(event.which === 13){
			$("#searchBtn").click();
		}
	})
	
})
</script>


	<section class="mt-5">
		<div class="d-flex" style="margin-top:180px">
			<div style="margin-left:300px">
				<h4 style="font-size:28px"><b>장소 둘러보기</b></h4>
				<p>친구들과 함께 스터디 하기 좋은 장소를 찾아보세요!</p>
				
				<div class="d-flex">
					<input id="keyword" type="text" style="width:250px" class="form-control" placeholder="검색어를 입력해주세요!">
					<button id="searchBtn" type="button" style="margin-left:20px" class="btn btn-primary">검색하기</button>
				</div>
				
				<div id="menu_wrap" class="bg_white" style="margin-top:360px; margin-left:300px; width:500px; height:430px; border:1px solid #DCDCDC">
					<ul id="placesList"></ul>
                	<div id="pagination"></div>
				</div>
			</div>
		
			<div id="map" style="width:900px;height:600px; margin-left:11%;">
			</div>
		</div>
		
		<div id="mapTypeSelectButton" style="margin-left:45%; margin-top:30px;">
		<p>
		    <input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /> 지적편집도 정보 보기
		    <input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /> 지형정보 보기 
		    <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기       
		    <input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
		</p> 
		</div>
		
	</section>

<script>
 var markers = [];

var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.566826, 126.9786567), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴

var mapTypes = {
	    terrain : kakao.maps.MapTypeId.TERRAIN,    
	    traffic :  kakao.maps.MapTypeId.TRAFFIC,
	    bicycle : kakao.maps.MapTypeId.BICYCLE,
	    useDistrict : kakao.maps.MapTypeId.USE_DISTRICT,
	};

	// 체크 박스를 선택하면 호출되는 함수입니다
	function setOverlayMapTypeId() {
	    var chkTerrain = document.getElementById('chkTerrain'),  
	        chkTraffic = document.getElementById('chkTraffic'),
	        chkBicycle = document.getElementById('chkBicycle'),
	        chkUseDistrict = document.getElementById('chkUseDistrict');
	    
	    // 지도 타입을 제거합니다
	    for (var type in mapTypes) {
	        map.removeOverlayMapTypeId(mapTypes[type]);    
	    }

	    // 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
	    if (chkUseDistrict.checked) {
	        map.addOverlayMapTypeId(mapTypes.useDistrict);    
	    }
	    
	    // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
	    if (chkTerrain.checked) {
	        map.addOverlayMapTypeId(mapTypes.terrain);    
	    }
	    
	    // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
	    if (chkTraffic.checked) {
	        map.addOverlayMapTypeId(mapTypes.traffic);    
	    }
	    
	    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
	    if (chkBicycle.checked) {
	        map.addOverlayMapTypeId(mapTypes.bicycle);    
	    }

	    
	} 







//장소 검색 객체를 생성합니다
/* /* var ps = new kakao.maps.services.Places();  */

var ps = new kakao.maps.services.Places();  


var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//버튼 클릭 시 검색 함수 호출
$("#searchBtn").on("click", function(){
	
	searchPlaces();
})

function searchPlaces(){
	var keyword = document.getElementById("keyword").value;
	console.log(keyword);
		
	if(!keyword.replace(/^\s+|\s+$/g, '')){
		alert("검색어를 입력해주세요!");
		return false;
	}
	
	ps.keywordSearch(keyword, placesSearchCB);
}

//장소 검색이 완료되었을 때 호출되는 콜백 함수
function placesSearchCB(data, status, pagination){
	if(status === kakao.maps.services.Status.OK){
		displayPlaces(data);
		
		displayPagination(pagination);
	}else if(status === kakao.maps.services.Status.ZERO_RESULT){
		alert("검색 결과가 존재하지 않습니다!");
		return;
	}else if(status === kakao.maps.services.Status.ERROR){
		alert("오류가 발생하였습니다!");
		return;
	}
}

function displayPlaces(places){
	
	var listEl = document.getElementById("placesList"),
	menuEl = document.getElementById("menu_wrap"),
	fragment = document.createDocumentFragment(),
	bounds = new kakao.maps.LatLngBounds(),
	listStr = "";
	
	removeAllChildNods(listEl);
	
	removeMarker();
	
	for(var i=0; i<places.length; i++){
		
		//마커 생성 및 지도에 표시
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x)
		marker = addMarker(placePosition, i),
		itemEl = getListItem(i, places[i]);
		
		bounds.extend(placePosition);
		
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
		
	}

	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;
	
	map.setBounds(bounds);

}

function getListItem(index, places){
	
	var el = document.createElement("li"),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
    '<div class="info">' +
    '   <h5>' + places.place_name + '</h5>';
	
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';       
                
       itemStr += '<a id="wishBtn" href="<c:url value="/location/addWishPlace?name='+places.place_name+'&addr='+places.address_name+'&tel='+places.phone+'"/>" type="button" class="btn btn-success rounded-0 sm">WISH</a>';         

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}



//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
  function displayInfowindow(marker, title) {
 var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

 infowindow.setContent(content);
 infowindow.open(map, marker);
}
 


 
 
 
// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
 while (el.hasChildNodes()) {
     el.removeChild (el.lastChild);
 }
}  



  

</script>

</body>
</html>