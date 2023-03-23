$(function() {
	$(".auth_update").click(function() {
		$("#auth_modal").css("display","flex");
	});
	
	
	$("#auth_modal_cancel").click(function() {
		$("#auth_modal").css("display","none");
	})
	
	
});


function updateauth(id,sortation,name,phone,address,carNum,carModel,carYear) {
	if(sortation=='일반'){
		$('.auth_sortation_option1').prop('selected',"selected");
	}else if(sortation=='관리자'){
		$('.auth_sortation_option3').prop('selected',"selected");		
	}else{
		
		$('.auth_sortation_option2').prop('selected',"selected");		
		/*$('.auth_sortation_option2').attr('selected',"selected");	*/	
	}
	console.log(carNum);
	console.log(carModel);
	console.log(carYear);
	$('#auth_id').val(id);
	$('#auth_name').val(name);
	$('#auth_phone').val(phone);
	$('#auth_address').val(address);
	$('#auth_carNUm').val(carNum);
	$('#auth_carModel').val(carModel);
	$('#auth_carYear').val(carYear);
}

function deleteAuth(id) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "auth.delete.go?a_id="+id;
	}
}










