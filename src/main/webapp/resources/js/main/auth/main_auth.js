$(function() {
	
})


function deleteOK(n) {
	var deleteOk = confirm('회원을 탈퇴하시겠습니까?');
	if (deleteOk) {
		location.href='deleteMember?u_no='+n
	}
	
}

function updateCheck() {
	
	var carnameInput = document.querySelector("input[name=i_carname]");
	var carbrandInput =document.querySelector("input[name=i_carbrand]");
	var caryearInput =document.querySelector("input[name=i_caryear]");
	var carnumInput =document.querySelector("input[name=i_carnum]");
	
	if (carnameInput.value == "") {
		alert('값을 입력해주세요');
		carnameInput.focus();
		return false;
	}
	if (carbrandInput.value == "") {
		alert('값을 입력해주세요');
		carbrandInput.focus();
		return false;
	}
	if (caryearInput.value == "") {
		alert('값을 입력해주세요');
		caryearInput.focus();
		return false;
	}
	if (carnumInput.value == "") {
		alert('값을 입력해주세요');
		carnumInput.focus();
		return false;
	}
	
	
	return true;
	
	
}