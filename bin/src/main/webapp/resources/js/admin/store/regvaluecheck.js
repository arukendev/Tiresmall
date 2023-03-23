function branchregcall(){
	
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


}