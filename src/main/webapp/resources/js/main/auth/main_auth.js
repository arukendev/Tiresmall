$(function() {
	
	
	
	$('#idFind_btn').click(function() {
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
	                $('#backHOME').css("display","block");
	                
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
	
	$('#pwFind_btn').click(function() {
		var idInput = document.querySelector("input[name=u_idPW]").value
	    var emailInput = document.querySelector("input[name=i_emailPW]").value
	    console.log(idInput)
		console.log(emailInput)
		
	    $.ajax({
	        url:'./pwFind', //Controller에서 요청 받을 주소
	        type:'post', //POST 방식으로 전달
	        data:{idInput:idInput,emailInput:emailInput},
	        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	            if(cnt == 1){ //cnt가 1이면(=0일 경우) -> 이메일 인증번호 발송 
	            	$('#find_pw').css("display","none");
	                $('#emailNumCheck_box').css("display","flex");
	                $.ajax({
	        	        type:"GET",
	        	        url:"mailCheck?sm_email=" + emailInput,
	        	        cache : false,
	        	        success:function(data){
	        	        	if(data == "error"){
	        	        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
	        					
	        	        	}else{	        		
	        	        		
	        					alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
	        	        		code = data;
	        	        		console.log(code);
	        	        	}
	        	        }
	        	    });
	                
	            } else { // cnt가 0일 경우 -> 아이디 ,이메일 db에 없음
	            	 alert('이름 혹은 이메일을 확인해주세요')
	            }
	        },
	        error:function(request,status,error){
	            alert("에러입니다");
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	});
	
	$("#authnum_check").click(function(){
		console.log(code);
		var idInput = document.querySelector("input[name=u_idPW]").value
		
		var userInputcode = $("input[name=i_emailCheck]").val();
		console.log(userInputcode);
		
		if (userInputcode == code) {
			alert('인증이 완료되었습니다.')
			$('input[name=u_id]').val(idInput);
			$("#emailNumCheck_box").css("display","none");
    		$("#setPw_box").css("display","flex");
		}else {
			alert('인증번호가 일치하지 않습니다.')
			$('#i_emailCheck').text('');
			$('#i_emailCheck').focus();
		}
		
		
	});
	
	$('#backHOME').click(function() {
		location.href='/home'
	});
	
	//년도 내년까지 자동계산 
	setDateSelectBox();
	
	//차종 가져오기
	findCarName();
	
	
});
// ready끝  

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

//년도 자동계산 내년까지
function setDateSelectBox(){
	var now = new Date();
	var now_year = now.getFullYear();
	$("#mc_year").append("<option value=''>선택</option>");
	// 2000년 부터 올년까지
	for(var i = now_year; i >= 2000; i--){
		$("#mc_year").append("<option value='"+ i +"'  >"+ i + " 년" +"</option>");
		//저장된 년도 선택
		$("select[name=mc_year] option[value="+$("#mc_year_hidden").val()+"]").prop("selected", true);
	}
}

//차종 가져오기
function findCarName() {
	//년도 변경할떄
	$("#mc_year").on("change",function() {
		if( $("#mc_brand").val()!=""){
			$("#mc_carname option").remove();
			
			$.ajax({
				url: "product.car.name.get.ajax",
				data : {c_brand : $("#mc_brand").val(),
						c_year1 : $("#mc_year").val()},
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$("select[name=mc_carname]").append(
							"<option value='"+  data[i].c_name +"'>"+  data[i].c_name + "</option>"
						);
					}
				}
			})
		}	
	})
	
	//브랜드 변경할때
	$("#mc_brand").on("change", function() {
		if($("#mc_year").val() != ""){
			$("#mc_carname option").remove();// 차종 셀렉트 내용 삭제
			
			$.ajax({
				url: "product.car.name.get.ajax",
				data : {c_brand : $("#mc_brand").val(),
						c_year1 : $("#mc_year").val()},
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$("select[name=mc_carname]").append(
							"<option value='"+  data[i].c_name +"'>"+  data[i].c_name + "</option>"
						);
					}
				}
			})
		}
	})
}


















