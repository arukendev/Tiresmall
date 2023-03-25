$(function() {
	//var agreementAll = document.join_form.agreementAll;
	//console.log(!($('#agreementAll').is(':checked')));
	
//체크박스 전체 선택
$("#join_policy").on("click", "#agreementAll", function () {
    $(this).parents("#join_policy").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$("#join_policy").on("click", ".agreements", function() {
    var is_checked = true;

    $("#join_policy .agreements").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#agreementAll").prop("checked", is_checked);
});


// findEmail 아이디 찾기 페이지 제어
	//첫 페이지 이동시 숨김처리
$('#find_pw').hide();
$('.findTab a').on('click', function (e) {
	  
	  e.preventDefault();
	  
	  $('#result_id').remove()
	  $('#backHOME').css("display","none");
	  
	  $(this).parent().addClass('active');
	  $(this).parent().siblings().removeClass('active');
	  
	  target = $(this).attr('href');

	  $('.find_content > div').not(target).hide();
	  
	  $(target).fadeIn(600);
	  
	});


});



function agreeCheck() {
	if (!($('#agreementAll').is(':checked'))) {
		alert('대전 타이어스몰 이용약관과 개인정보 수집 이용에 모두 동의해주세요.')
		return false;
	};
	return true;
}

function goHome(){
	href.locaion='home';
}


