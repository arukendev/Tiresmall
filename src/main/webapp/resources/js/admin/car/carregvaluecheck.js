function carregcall(){
	
	
	let c_id = document.carregform.c_id;
	let c_brand = document.carregform.c_brand;
	let c_name = document.carregform.c_name;
	let c_option = document.carregform.c_option;
	let c_year1 = document.carregform.c_year1;
	let c_year2 = document.carregform.c_year2;
	let c_print = document.carregform.c_print;
	let c_ft = document.carregform.c_ft;
	let c_bt = document.carregform.c_bt;
	let file = document.carregform.file;
	
	
	if(isEmpty(c_id)){
		
		alert('아이디는 필수입력입니다.')
		c_id.focus();
		
		return false;
		
	}
	
	if (containKR(c_id)) {
		alert('아이디에는 한글을 사용하실수없습니다.')
		c_id.focus();
		
		return false;
	}
 
if(isEmpty(c_name)){
		
		alert('차종은 필수입력입니다.')
		c_name.focus();
		
		return false;
		
	}
	
	
	
if(isEmpty(c_option)){
	
	alert('차종은 필수입력입니다.')
	c_option.focus();
	
	return false;
	
}

if(isEmpty(c_year1)){
	
	alert('연식은 필수 입력입니다.')
	c_year1.focus();
	
	return false;
	
}

if(isEmpty(c_year2)){
	
	alert('연식은 필수 입력입니다.')
	c_year2.focus();
	
	return false;
	
}

if(isNotNumber(c_year1)){
	alert('연식에는 숫자만 들어갈수있습니다.')
	c_year1.focus();
	
	return false;
	
}

if(isNotNumber(c_year2)){
	alert('연식에는 숫자만 들어갈수있습니다.')
	c_year2.focus();
	
	return false;
	
}


	
// 파일 업로드 여부 확인
var fileUpload = document.getElementsByName("file")[0];
if (fileUpload.value == "") {
  // 파일 업로드가 되지 않았을 때 경고창 띄우기
  alert("파일을 선택해주세요.");
  return false;
}
// 파일 업로드가 되었을 때 처리
// ...
return true;


	
	
}

