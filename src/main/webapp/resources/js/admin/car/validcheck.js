//자동차 업데이트 유효성검사 
function carupdatecall() {
	let c_id = document.carupdateform.c_id_u;
	let c_brand = document.carupdateform.c_brand_u;
	let c_name = document.carupdateform.c_name_u;
	let c_year1 = document.carupdateform.c_year1_u;
	let c_year2 = document.carupdateform.c_year2_u;
	let c_print = document.carupdateform.c_print_u;
	let c_ft = document.carupdateform.c_ft_u;
	let c_bt = document.carupdateform.c_bt_u;

	if (isEmpty(c_id)) {
		alert('아이디는 필수입력입니다.')
		c_id.focus();
		return false;
	}

	if (isEmpty(c_name)) {
		alert('차종은 필수입력입니다.')
		c_name.focus();
		return false;
	}

	if (isEmpty(c_year1)) {
		alert('연식은 필수 입력입니다.')
		c_year1.focus();
		return false;
	}

	if (isEmpty(c_year2)) {
		alert('연식은 필수 입력입니다.')
		c_year2.focus();
		return false;
	}

	if (isNotNumber(c_year1)) {
		alert('연식에는 숫자만 들어갈수있습니다.')
		c_year1.focus();
		return false;
	}

	if (isNotNumber(c_year2)) {
		alert('연식에는 숫자만 들어갈수있습니다.')
		c_year2.focus();
		return false;
	}
}

//자동차 등록 유효성검사
function carregcall() {

	let c_id = document.carregform.c_id;
	let c_brand = document.carregform.c_brand;
	let c_name = document.carregform.c_name;
	let c_year1 = document.carregform.c_year1;
	let c_year2 = document.carregform.c_year2;
	let c_print = document.carregform.c_print;
	let c_ft = document.carregform.c_ft;
	let c_bt = document.carregform.c_bt;
	let file = document.carregform.file;

	if (isEmpty(c_id)) {
		alert('아이디는 필수입력입니다.')
		c_id.focus();
		return false;
	}

	if (containKR(c_id)) {
		alert('아이디에는 한글을 사용하실수없습니다.')
		c_id.focus();
		return false;
	}
	
	if (isEmpty(c_name)) {
		alert('차종은 필수입력입니다.')
		c_name.focus();
		return false;
	}
	
	if (isEmpty(c_option)) {
		alert('차종은 필수입력입니다.')
		c_option.focus();
		return false;
	}

	if (isEmpty(c_year1)) {
		alert('연식은 필수 입력입니다.')
		c_year1.focus();
		return false;
	}

	if (isEmpty(c_year2)) {
		alert('연식은 필수 입력입니다.')
		c_year2.focus();
		return false;
	}

	if (isNotNumber(c_year1)) {
		alert('연식에는 숫자만 들어갈수있습니다.')
		c_year1.focus();
		return false;
	}

	if (isNotNumber(c_year2)) {
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


//JS 라이브러리 완성

//일반적으로 유효성 검사하는 것들
// 함수형태로 정리해서
//나중에 필요할때 쓸라고
//-JAR 쓰던거처러(lib)

// 문제가 있으면 true, 없으면 false


// <input> 을 넣으면..
// 거기에 글자가 없으면 true, 있으면 false
function isEmpty(input){
	return !input.value;
}


// <input>과, 글자 수를 넣으면
// 그 글자수보다 적으면 true, 아니면 false
function lessThan(input, length){
	return input.value.length < length;
}

// <input> 을 넣어서
// 값이 숫자가 아니면 true, 숫자면 false

// input : 123
// input : asd

function isNotNumber(input){
	return isNaN(input.value);
}
// Test

// <input> x 2 넣으면 (비번 확인)
// 내용이 다르면 true, 아니면 false


function notEquals(input1,input2){
	
	return input1.value !=input2.value;
}
	// <input>을 넣으면
	// 한글/특수문자 들어있으면 true,아니면 false
	function containKR(input){
		// 엠제트
		// mz세상
		// mz1004
		let ok = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_@.1234567890"
			for(let i = 0; i <input.value.length; i++){
				if(ok.indexOf(input.value[i]) == -1){
					return true;
				} 				
			}	
	}

function notContains(input,set){
	// input : 1qwerASD
	// Input:ASD
	
	// set : 1234567890
	// set :QWERTYUIOPASDFGHJKLZXCVBNM 대문자를 반드시 포함해라
	for(let i = 0; i <set.length; i++)	{
		if(input.value.indexOf(set[i]) != -1){
			return false;
		}
	}
	return true;	
}

// <input>,확장자를 넣으면
// 그 파일이 아니면 true ,맞으면 false

// jpg,jpeg,png,gif
function isNotType(input,type){
	type = "." + type; 	// jpg
	return (input.value,indexOf(type) == -1);	
}

function isEmpty2(element) {
	  if (element.classList.contains('jsp-input') && element.value.trim() === '') {
		  alert('기본타이어는 필수 입력입니다.')
		  return false;
	  }
}
	