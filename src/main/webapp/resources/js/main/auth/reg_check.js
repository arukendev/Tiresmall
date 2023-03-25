$(function() {
	
	var code = "";
	var emailBool="";
	
	
	$("#mail_Check").click(function(){
		var sm_email = $("#i_email").val();
		$.ajax({
	        type:"GET",
	        url:"mailCheck?sm_email=" + sm_email,
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
					
	        	}else{	        		
					alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
	        		$("#i_email").attr("disabled",true);
	        		$("#mail_Check").css("display","none");
	        		$("#authnum_check").css("display","block");
	        		
	        		code = data;
	        		console.log(code);
	        	}
	        }
	    });
	});
	$("#authnum_check").click(function(){
		console.log(code);
		
		var userInputcode = $("input[name=i_emailCheck]").val();
		console.log(userInputcode);
		
		if (userInputcode == code) {
			alert('인증이 완료되었습니다.')
			$("#authnum_check").css("background-color","gray");
			$("#authnum_check").attr("disabled",true);
			$("input[name=i_emailCheck]").attr("disabled",true);
			$("input[name=emailConfirm]").val(2);
			
			
		}else {
			alert('인증번호가 일치하지 않습니다.')
			$('#i_emailCheck').text('');
			$('#i_emailCheck').focus();
		}
		
		
	});
	

	$("#i_carbrand").on('change',fun)
	
	
	
	
	
	
	
	
	
	
	
});


function joinCheck() {
	 
	  
	
	var idInput = document.querySelector("input[name=u_id]");
	var pwInput = document.querySelector("input[name=pw_password]");
	var pwChkInput = document.querySelector("input[name=pw_pwCheck]");
	var nameInput = document.querySelector("input[name=i_name]");
	var phoneNumInput = document.querySelector("input[name=i_phoneNum]");
	var emailConfirm = document.querySelector("input[name=emailConfirm]");
	var carInfoConfirm =  document.querySelector("input[name=carInfoConfirm]");
	var joinbox = document.querySelector(".join_box");
	
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getName= RegExp(/^[가-힣]+$/);
	
	
//	console.log('test2');
//	console.log('1'+emailConfirm);
//	console.log('2'+idInput);
//	console.log('3'+pwInput);
//	console.log('4'+pwChkInput);
//	console.log('5'+nameInput);
//	console.log('6'+phoneNumInput);
	 
	// 자동차 정보 입력 페이지로 이동 후 가입하기 누를 시 가입처리
//	if (carInfoConfirm.value == 2 ) {
//		$("#i_email").attr("disabled", false);
//		return true;
//	}
	
//	 //전화번호 입력 검사
//    if(phoneNumInput.length != 11){
//      alert("휴대폰번호 11자리 입력을 확인해주세요. 010 XXXX XXXX 띄어쓰기 없음 숫자만 붙혀서 작성해주세요." );
//      phoneNumInput.focus();
//      return false;
//    }

	
	//아이디 5자이상 
	if (idInput.value.length <5 ) {
		alert("아이디를 확인해주세요.")
        idInput.focus();
        return false;
	}
	//아이디 유효성 검사
	if(!getCheck.test(idInput.value)){
        alert("형식에 맞게 입력해주세요");
        idInput.value = null;
        idInput.focus();
        return false;
      }
	
	//아이디 비밀번호 같음 확인
    if(idInput.value == pwInput.value){
      alert("아이디와 비밀번호가 같습니다");
      pwInput.value = null;
      pwInput.focus();
      return false;
    }
    
    //비밀번호 8자이상 
	if (pwInput.value.length <8 ) {
		alert("비밀번호를 확인해주세요.")
        pwInput.focus();
        return false;
	}
	
    //비밀번호 유효성검사
    if(!getCheck.test(pwInput.value)){
      alert("형식에 맞게 입력해주세요");
      pwInput.value = null;
      pwInput.focus();
      return false;
    }
         
    //비밀번호 확인란 공백 확인
    if(pwChkInput.value == ""){
      alert("비밀번호 확인란을 입력해주세요");
      pwChkInput.focus();
      return false;
    }
         
    //비밀번호 서로확인
    if(pwInput.value != pwChkInput.value ){
        alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
        pwChkInput.value = null;
        pwChkInput.focus();
        return false;
    }
    
    //이름 공백 검사
    if(nameInput.value == ""){
      alert("이름을 입력해주세요");
      nameInput.focus();
      return false;
    }

    //이름 유효성 검사
    if(!getName.test(nameInput.value)){
      alert("이름 형식에 맞게 입력해주세요")
      nameInput.value = null;
      nameInput.focus();
      return false;
    }
    //이메일 인증 확인 , 값 1 : 디폴트  값 2 : 인증완료 
    if (emailConfirm.value != 2 ) {
		alert("이메일 인증이 필요합니다.");
		return false;
	}
    
//    var regOK = confirm('차량정보를 입력하시겠습니까?(선택)');
//	   
//	if (regOK) {
//		$(".join_box").css("display","none");
//		$(".join_box_carInfo").css("display","block");
//		carInfoConfirm.value = 2;
//		return false;
//	}else {
//		$("#i_email").attr("disabled", false);
//		return ture;
//	}
    
   
    
    
	
    $("#i_email").attr("disabled", false);
	return ture;
};	


function checkId(){
    var id = document.querySelector("input[name=u_id]").value
    $.ajax({
        url:'./idCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('#checkID_result').css("color","green"); 
                $('#checkID_result').html("");
                $('#checkID_result').html("사용 가능한 아이디입니다");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
            	 $('#checkID_result').css("color","red");
            	 $('#checkID_result').html("");
            	 $('#checkID_result').html("사용 불가능한 아이디입니다");
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
 };




//
//function emailCheck() {
//	
//	var emailInput = document.querySelector("input[name=i_email]");
//	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
//	
//	//이메일 공백 확인
//    if(emailInput.value == ""){
//      alert("이메일을 입력해주세요");
//      emailInput.focus();
//      return false;
//    }
//         
//    //이메일 유효성 검사
//    if(!getMail.test(emailInput.value)){
//      alert("이메일형식에 맞게 입력해주세요")
//      emailInput.value = null;
//      emailInput.focus();
//      return false;
//    }


