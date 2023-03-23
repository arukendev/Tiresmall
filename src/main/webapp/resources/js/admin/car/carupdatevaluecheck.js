function carupdatecall(){
	
	
	let c_id = document.carupdateform.c_id_u;
	let c_brand = document.carupdateform.c_brand_u;
	let c_name = document.carupdateform.c_name_u;
	let c_option = document.carupdateform.c_option_u;
	let c_year1 = document.carupdateform.c_year1_u;
	let c_year2 = document.carupdateform.c_year2_u;
	let c_print = document.carupdateform.c_print_u;
	let c_ft = document.carupdateform.c_ft_u;
	let c_bt = document.carupdateform.c_bt_u;
	
	if(isEmpty(c_id)){
		
		alert('아이디는 필수입력입니다.')
		c_id.focus();
		
		return false;
		
	}
	

 
if(isEmpty(c_name)){
		
		alert('차종은 필수입력입니다.')
		c_name.focus();
		
		return false;
		
	}
	
	
	
if(isEmpty(c_option)){
	
	alert('차종옵션은 필수입력입니다.')
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


	
	
}

