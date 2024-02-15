$(function(){
	$('#location_lng').val($('#location').val().substr($('#location').val().indexOf(' ')+1));
	$('#location_lat').val($('#location').val().substr(0,$('#location').val().indexOf(',')));
	$('#store_wrap_banner img').attr("src", "resources/web/main/store/"+$('#store_banner_img').val());

	
	initMap();
	
})

function initMap() {
		
		const latV=parseFloat(document.getElementById('location_lat').value);
		const lngV=parseFloat(document.getElementById('location_lng').value);
		
		  //네이버 지도
		  
		  var mapOptions = {
				    center: new naver.maps.LatLng(latV, lngV),
				    zoom: 18,
				    zoomControl: true,
				    zoomControlOptions: {
				        style: naver.maps.ZoomControlStyle.LARGE,
				        position: naver.maps.Position.RIGHT_CENTER
				    }
				    
		  };

		  var map = new naver.maps.Map('store_wrap_map', mapOptions);
		  
		  //정보창 
		  var contentString = [
			  	'<div id="content">' +
			  		'<div id="siteNotice">' + "</div>" +
			  		'<h1 id="firstHeading" class="firstHeading">'+ $('#store_info_name').text() +'</h1>' +
			    "</div>"
		   ].join('');
		  

		  //마커
		  var marker = new naver.maps.Marker({
				  position: new naver.maps.LatLng(latV, lngV),
				  map: map

		  });
		  var infowindow = new naver.maps.InfoWindow({
			    content: contentString
		  });
		  
		  
		  //정보창 오픈하기
		  infowindow.open(map, marker);
		  //클릭하면정보창 없애고 띄우기
		  naver.maps.Event.addListener(marker, "click", function(e) {
			    if (infowindow.getMap()) {
			        infowindow.close();
			    } else {
			        infowindow.open(map, marker);
			    }
			});			
	};	







