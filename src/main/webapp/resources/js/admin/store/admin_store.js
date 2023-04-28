$(function() {
	var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시",
			"울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도",
			"경상북도", "경상남도", "제주도" ];
	var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구",
			"노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구",
			"송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
	var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군",
			"옹진군" ];
	var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
	var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
	var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ];
	var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
	var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구",
			"서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ];
	var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시",
			"동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시",
			"오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시",
			"화성시", "가평군", "양평군", "여주군", "연천군" ];
	var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군",
			"양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군",
			"횡성군" ];
	var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군",
			"음성군", "증평군", "진천군", "청원군" ];
	var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군",
			"당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군" ];
	var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군",
			"부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
	var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군",
			"구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
			"장흥군", "진도군", "함평군", "해남군", "화순군" ];
	var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시",
			"영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
			"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
	var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시",
			"창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
			"함안군", "함양군", "합천군" ];
	var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];

	// 시/도 선택 박스 초기화

	$("select[name^=b_area1]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='" + this + "'>" + this + "</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});

	// 시/도 선택시 구/군 설정

	$("select[name^=b_area1]").change(function() {
		var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의
		// 구군
		// Array
		var $gugun = $(this).next(); // 선택영역 군구 객체
		$("option", $gugun).remove(); // 구군 초기화

		if (area == "area0")
			$gugun.append("<option value=''>구/군 선택 </option>");
		else {
			$.each(eval(area), function() {
				$gugun.append("<option value='" + this + "'>" + this + "</option>");
			});
		}

	});

	$(".branchsearchButton").click(function() {
		let b_area = $("#listsido1").val() + $("#listgugun1").val(); 
		$("#hidden_b_area").val(b_area);
		if($("#hidden_b_area").val()=="시/도 선택"){
			$("#hidden_b_area").val("");
		}
	})

})





































function updatebranch(id, sortation, area, addr, name, time, service, mapdata,
		manager, managernumber, branchname, branchnumber, cr, email, b_file) {

	$("#popup01").show();
	$("body").append('<div class="backon"></div>');

	$("body").on(
			"click",
			function(event) {
				if (event.target.className == 'close'
						|| event.target.className == 'backon') {
					$("#popup01").hide();
					$(".backon").hide();
				}
			});

	$('#b_id_i').val(id);
	$('#b_sortation_i').val(sortation).prop('selected', true);
	$('#b_name_i').val(name);
	$('#b_addr_i').val(addr);
	$('#b_time_i').val(time);
	$('#b_service_i').val(service);
	$('#b_mapdata_i').val(mapdata);
	$('#b_manager_i').val(manager);
	$('#b_managernumber_i').val(managernumber);
	$('#b_branchname_i').val(branchname);
	$('#b_branchnumber_i').val(branchnumber);
	$('#b_cr_i').val(cr);
	$('#b_email_i').val(email);
	$('.updatefileinputstyle').html(b_file);

	var areaArray = area.split("\t");
	var sido = areaArray[0];
	var gugun = areaArray[1];

	$("#sido1").val(sido).trigger("change");

	$("#gugun1 option").filter(function() {
		return $(this).text() == gugun;
	}).prop("selected", true);

	const branchImg = document.getElementById('branchImg');
	branchImg.src = `resources/web/${b_file}`;

	document.querySelector('.update-upload-thumb').addEventListener('load',
			function() {
				document.getElementById('branchImg').style.display = 'none';
			});

	if (file) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".preview-image .update-upload-thumb").attr("src",
					e.target.result);
		};
		reader.readAsDataURL(file);
	}

}


function deletebranch(iddd) {
	let ok = confirm('정말 삭제하시겠습니까?');
	if (ok) {
		location.href = 'admin.store.delete.go?b_id=' + iddd;
	}
}

function previewImagereg(event) {
	var input = event.target;
	var preview = document.querySelector('.preview-image .upload-thumb');
	var filename = input.files[0].name;
	var fileinputstyle = document.querySelector('.fileinputstyle');

	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(event) {
			preview.src = event.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	}

	fileinputstyle.textContent = filename;

}

function previewImage(event) {
	var input = event.target;
	var preview = document.querySelector('.preview-image .update-upload-thumb');
	var filename = input.files[0].name;
	var fileinputstyle = document.querySelector('.updatefileinputstyle');

	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(event) {
			preview.src = event.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	}

	fileinputstyle.textContent = filename;

}

function isEmpty(input) {
	return !input.value;
}

function isNotNumber(input) {
	return isNaN(input.value);
}
function lessThan(input, length) {
	return input.value.length < length;
}

// 전화번호 형식 검사
function isNotTelNum(input) {
	return !/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(input.value);
}

// 좌표 형식 검사
function isNotMapType(input) {
	return !/([0-9]+\.[0-9]*), ([0-9]+\.[0-9]*)/.test(input.value);
}


//업데이트
function branchupdatecall() {

	let b_id = document.updateform.b_id;
	let b_name = document.updateform.b_name;
	let b_addr = document.updateform.b_addr;
	let b_time = document.updateform.b_time;
	let b_area = document.updateform.b_area1;
	let b_service = document.updateform.b_service;
	let b_mapdata = document.updateform.b_mapdata;
	let b_manager = document.updateform.b_manager;
	let b_managernumber = document.updateform.b_managernumber;
	let b_branchname = document.updateform.b_branchname;
	let b_branchnumber = document.updateform.b_branchnumber;
	let b_cr = document.updateform.b_cr;
	let b_email = document.updateform.b_email;

	if (isEmpty(b_id)) {
		alert('아이디는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_name)) {
		alert('장착점명은 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_addr)) {
		alert('상세주소는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_time)) {
		alert('영업시간은 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_service)) {
		alert('서비스는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_mapdata)) {
		alert('지도데이터는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	// 지도 좌표 형식 검사
	if (isNotMapType(b_mapdata)) {
		alert('"위도값, 경도값"으로 입력해주세요. 공백 유의');
		b_mapdata.focus();
		return false;
	}

	// 담당자 전화번호 형식 검사
	if (isNotTelNum(b_managernumber) || !lessThan(b_managernumber, 14)) {
		alert('유효하지 않은 전화번호입니다.')
		b_managernumber.focus();
		return false;
	}

	// 매장 전화번호 형식 검사
	if (isNotTelNum(b_branchnumber) || !lessThan(b_branchnumber, 14)) {
		alert('유효하지 않은 전화번호입니다.')
		b_branchnumber.focus();
		return false;
	}
}

//등록
function branchregcall() {

	let b_id = document.regform.b_id;
	let b_name = document.regform.b_name;
	let b_addr = document.regform.b_addr;
	let b_time = document.regform.b_time;
	let b_service = document.regform.b_service;
	let b_mapdata = document.regform.b_mapdata;
	let b_manager = document.regform.b_manager;
	let b_managernumber = document.regform.b_managernumber;
	let b_branchname = document.regform.b_branchname;
	let b_branchnumber = document.regform.b_branchnumber;
	let b_cr = document.regform.b_cr;
	let b_email = document.regform.b_email;

	if (isEmpty(b_id)) {
		alert('아이디는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_name)) {
		alert('장착점명은 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_addr)) {
		alert('상세주소는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_time)) {
		alert('영업시간은 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_service)) {
		alert('서비스는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	if (isEmpty(b_mapdata)) {
		alert('지도데이터는 필수입력입니다.')
		b_id.focus();
		return false;
	}

	// 지도 좌표 형식 검사
	if (isNotMapType(b_mapdata)) {
		alert('"위도값, 경도값"으로 입력해주세요. 공백 유의');
		b_mapdata.focus();
		return false;
	}

	// 담당자 전화번호 형식 검사
	if (isNotTelNum(b_managernumber) || !lessThan(b_managernumber, 14)) {
		alert('유효하지 않은 전화번호입니다.')
		b_managernumber.focus();
		return false;
	}

	// 매장 전화번호 형식 검사
	if (isNotTelNum(b_branchnumber) || !lessThan(b_branchnumber, 14)) {
		alert('유효하지 않은 전화번호입니다.')
		b_branchnumber.focus();
		return false;
	}
}
