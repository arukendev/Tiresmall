function isEmpty(input){
	return !input.value;
	
}

function isNotNumber(input){
	return isNaN(input.value);
	
}
function lessThan(input,length){
	return input.value.length < length;
	
}

// 전화번호 형식 검사
function isNotTelNum(input) {
    return !/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(input.value);
}

// 좌표 형식 검사
function isNotMapType(input){
	return !/([0-9]+\.[0-9]*), ([0-9]+\.[0-9]*)/.test(input.value);
}