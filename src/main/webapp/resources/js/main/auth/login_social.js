$(document).ready(function() {
	
	console.log('1');
	 var kakaoInfo = '${kakaoInfo}';

     if(kakaoInfo != ""){
         var data = JSON.parse(kakaoInfo);

         alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
         alert(
         "user : \n" + "email : "
         + data['email']  
         + "\n nickname : " 
         + data['nickname']);
     }
     
     
     
     
     
     
	
});


function kakaoLogin() {

	
    $.ajax({
        url: 'login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
        	console.log(res);
            location.href =res;
        }
    });

  }