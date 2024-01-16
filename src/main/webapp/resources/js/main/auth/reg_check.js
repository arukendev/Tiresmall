$(function() {

	//비밀번호 유효성검사
	checkPw();
	
	//폰 번호 겸치는지 검사
	phoneNumberCheck();
	
	lastCheck();

	/*var code = "";
	var emailBool="";*/
	/*$("#mail_Check").click(function(){
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
	});*/
	
});


/*function joinCheck() {

	var idInput = document.querySelector("input[name=u_id]");
	var pwInput = document.querySelector("input[name=pw_password]");
	var pwChkInput = document.querySelector("input[name=pw_pwCheck]");
	var nameInput = document.querySelector("input[name=i_name]");
	var phoneNumInput = document.querySelector("input[name=i_phoneNum]");
	var emailConfirm = document.querySelector("input[name=emailConfirm]");
	var carInfoConfirm =  document.querySelector("input[name=carInfoConfirm]");
	var joinbox = document.querySelector(".join_box");
	
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
};	*/



//아이디 체크
function checkId(){
    var id = document.querySelector("input[name=u_id]").value 
    //아이디 패턴   영문 숫자 조합으로 아이디 입력하게함.
    const pattern = new RegExp("^[a-zA-Z][0-9a-zA-Z]{4,19}$");
    //아이디 유효한지 검사 0이면 아이디 다시 작성하고  1이면 넘어가기



   	pattern.test(id.value)
    if (pattern.test(id)) {   
    	$('#checkID_result').css("color","green");
        $('#checkID_result').html("");
        $('#checkID_result').html("사용 가능한 아이디입니다.");
        //아이디 중복검사
           $.ajax({
        	   url:'./idCheck', //Controller에서 요청 받을 주소
        	   type:'post', //POST 방식으로 전달
        	   data:{id:id},
        	   success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
        		   if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
        			   $('#checkID_result').css("color","green"); 
        	           $('#checkID_result').html("");
        	           $('#checkID_result').html("사용 가능한 아이디입니다");
        	           $('#checkID_result').val(1); 
        	          
        		   } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
        			   $('#checkID_result').css("color","red");
        			   $('#checkID_result').html("");
        			   $('#checkID_result').html("사용 불가능한 아이디입니다");
        			   $('#checkID_result').val(0);
        	       }
        	   },
        	   error:function(){
        		   alert("에러입니다");
        	   }
           });   	
    }else{
    	$('#checkID_result').css("color","red");
        $('#checkID_result').html("");
        $('#checkID_result').html("아이디: 5~20자의 영문 소문자,대문자, 숫자만 사용 가능합니다.");
        $('#checkID_result').val(0);
    }
 };
 
 
 //비밀번호 유효성검사
 function checkPw(){
		let pwInput = $("input[name=pw_password]").val();
		var pwChkInput = $("input[name=pw_pwCheck]").val();
		const pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		
	
		$("#pw_input").focusout(function() {
			console.log($("input[name=pw_password]").val());
			console.log(pwInput);
			if (pattern.test($("input[name=pw_password]").val())){
				$('#checkPW_result').css("color","green");
		        $('#checkPW_result').html("");
		        $('#checkPW_result').html("사용 가능한 비밀번호입니다.");
		        $('#checkPW_result').val(1); 
			}else{
				$('#checkPW_result').css("color","red");
		        $('#checkPW_result').html("");
		        $('#checkPW_result').html("비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요."); 
		        $('#checkPW_result').val(0); 
			}
		
		})
	
		$("#pwCheck_input").focusout(function() {
			console.log($("input[name=pw_password]").val());
			console.log($("input[name=pw_pwCheck]").val());
			
			if($("input[name=pw_password]").val() != $("input[name=pw_pwCheck]").val()){
				$("input[name=pw_pwCheck]").css("border-color","")
				$('#checkPW_result_check').css("color","red");
		        $('#checkPW_result_check').html("");
		        $('#checkPW_result_check').html("비밀번호가 일치하지  않습니다."); 
		        $('#checkPW_result_check').val(0);
		        
			}else{
		        $('#checkPW_result_check').html("");
		        $('#checkPW_result_check').val(1); 
			}	
		})
}
 //마지막 틀린거 있는지 검사
function lastCheck() {
	$(".lastCheck").on("click",function() {
		if($('#checkID_result').val() == 0){
			alert("아이디를 다시 입력해주세요");
			$("input[name=u_id]").focus();
			return false;
		}else if($('#checkPW_result').val() == 0){
			alert("비밀번호를 다시 입력해주세요");
			$("input[name=pw_password]").focus();
			return false;
		}else if($('#checkPW_result_check').val() == 0){
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name=pw_pwCheck]").focus();
			return false;
		}else if($("input[name=i_name]").val().leght == 0){
			alert("이름을 입력해주세요");
			$("input[name=i_name]").focus();
			return false;
		}else if($('#checkNum_result_check').val() == 0 ){
			alert("전화번호를 다시입력해주세요");
			$("input[name=i_phoneNum]").focus();
			return false;
		}
	})
}
function phoneNumberCheck() {
    $("#phoneNum_input").focusout(function() {
    	var phoneNum = $("input[name=i_phoneNum]").val(); 
    	if(phoneNum.length != 11){
    		$('#checkNum_result_check').css("color","red");
	        $('#checkNum_result_check').html("");
	        $('#checkNum_result_check').html("전화번호 11자리를 입력해주세요");
	        $('#checkNum_result_check').val(0); 
	        return false;
    	}else{
    		$.ajax({
    			url:'./phoneNumberCheck', //Controller에서 요청 받을 주소
    			type:'post', //POST 방식으로 전달
    			data:{phoneNum:phoneNum},
    			success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
    				if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 없는 전화번호
    			        $('#checkNum_result_check').html("");
    			        $('#checkNum_result_check').val(1); 
    				} else { // cnt가 1일 경우 -> 있는 전화번호
    					$('#checkNum_result_check').css("color","red");
    			        $('#checkNum_result_check').html("");
    			        $('#checkNum_result_check').html("이미 가입된 전화번호입니다.");
    			        $('#checkNum_result_check').val(0); 
    				}
    			},
    			error:function(){
    				alert("에러입니다");
    			}
    		});
    	}
    		
    	
    	
		  
    }) 
}