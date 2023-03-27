$(function() {
	$(".auth_update").click(function() {
		$("#auth_modal").css("display","flex");
	});
	
	
	$("#auth_modal_cancel").click(function() {
		$("#auth_modal").css("display","none");
	})
	
	$(window).keydown(function(e) {
		if(e.keyCode == 27){
			$("#auth_modal_cancel").trigger("click");
		}
	})
	
	
});


function updateauth(no,id,grade,name,phone,carNum,carName,carBrand,carYear) {
	if(grade == 1){
		$('.auth_sortation_option1').prop('selected',"selected");
	}else if(grade == 3){
		$('.auth_sortation_option3').prop('selected',"selected");		
	}else{
		$('.auth_sortation_option2').prop('selected',"selected");		
	}
	console.log(no);
	console.log(id);
	console.log(carNum);
	console.log(carName);
	console.log(carBrand);
	console.log(carYear);
	
	$('#auth_i_no').val(no);
	$('#auth_id').val(id);
	$('#auth_name').val(name);
	$('#auth_phone').val(phone);
	$('#auth_carNUm').val(carNum);
	$('#auth_carName').val(carName);
	$('#auth_carBrand').val(carBrand);
	$('#auth_carYear').val(carYear);
}

function deleteAuth(id) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "auth.delete.go?u_id="+id;
	}
}










