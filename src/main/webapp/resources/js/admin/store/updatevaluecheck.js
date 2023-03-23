function branchupdatecall(){
	
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
	
	

	

if(isEmpty(b_id)){
	
	alert('아이디는 필수입력입니다.')
	b_id.focus();
	
	return false;
	
}

if(isEmpty(b_name)){
	
	alert('장착점명은 필수입력입니다.')
	b_id.focus();
	
	return false;
	
}

if(isEmpty(b_addr)){
	
	alert('상세주소는 필수입력입니다.')
	b_id.focus();
	
	return false;
	
}

if(isEmpty(b_time)){
	
	alert('영업시간은 필수입력입니다.')
	b_id.focus();
	
	return false;
	
}

if(isEmpty(b_service)){
	
	alert('서비스는 필수입력입니다.')
	b_id.focus();
	
	return false;
	
}

if(isEmpty(b_mapdata)){
	
	alert('지도데이터는 필수입력입니다.')
	b_id.focus();
	
	return false;
	
}

//지도 좌표 형식 검사
if(isNotMapType(b_mapdata)){
	alert('"위도값, 경도값"으로 입력해주세요. 공백 유의');
	b_mapdata.focus();
	
	return false;
}


// 담당자 전화번호 형식 검사
if(isNotTelNum(b_managernumber) || !lessThan(b_managernumber,14)){
	alert('유효하지 않은 전화번호입니다.')
	b_managernumber.focus();
	
	return false;
}

// 매장 전화번호 형식 검사
if(isNotTelNum(b_branchnumber) || !lessThan(b_branchnumber,14)){
	alert('유효하지 않은 전화번호입니다.')
	b_branchnumber.focus();
	
	return false;
}







}


	 
