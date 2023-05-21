$(function() {
	$(".auth_update").click(function() {
		$("#auth_modal").css("display","flex");
	});
	
	
	$(".admin_cenBTN").click(function() {
		$("#auth_modal").css("display","none");
	})
	
	$(window).keydown(function(e) {
		if(e.keyCode == 13){
			$("#adminauthserch").trigger("click");
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
	$('#auth_id').text(id);
	$('#auth_name').text(name);
	$('#auth_phone').text(phone);
	$('#auth_carNUm').text(carNum);
	$('#auth_carName').text(carName);
	$('#auth_carBrand').text(carBrand);
	$('#auth_carYear').text(carYear +"년");
	
	$(window).keydown(function(e) {
		if(e.keyCode == 13){
			$(".admin_printBTN").trigger("click");
		}
		if(e.keyCode == 27){
			$(".admin_cenBTN").trigger("click");
		}
	})

}

function deleteAuth(id) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "auth.delete.go?u_id="+id;
	}
}










