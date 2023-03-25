$(function() {
	
	$('#idFnd_btn').click(function() {
		alert('1');
		var phoneNumInput = document.querySelector("input[name=i_phoneNum]").value
	    var nameInput = document.querySelector("input[name=i_name]").value
		console.log(phoneNumInput)
		console.log(nameInput)
		
	    $.ajax({
	        url:'./idFind', //Controller에서 요청 받을 주소
	        type:'post', //POST 방식으로 전달
	        data:{phoneNumInput:phoneNumInput,nameInput:nameInput},
	        success:function(findID){ //컨트롤러에서 넘어온 cnt값을 받는다 
	            if(findID != null){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	            	alert("11");
	            	
	            	$('#find_email').css("display","none"); 
	                $('#result_id').css("color","green"); 
	                $('#result_id').html("아이디는 "+findID+"입니다"); 
	                
	            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	            	 alert('이름 혹은 전화번호를 확인해주세요')
	            }
	        },
	        error:function(request,status,error){
	            alert("에러입니다");
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	});
	
});


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