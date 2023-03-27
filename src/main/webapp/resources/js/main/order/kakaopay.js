function kakao_pay() {
	
	let tg_id = $(".pay_product_name").val();
	console.log(tg_id);
	
	let so_user_zoncode = $('#stuff-postcode').val();
	let stuffAddress = $('#stuff-Address').val();
	let stuffDetailAddress = $('#stuff-detailAddress').val().trim();
	
	if(stuffDetailAddress == null||stuffDetailAddress == ''){
		alert('상세주소를 입력해주세요');
		$('#stuff-detailAddress').focus();
		return false;
	}
	
	$.ajax({
		url : 'kakao.ready.popup',
		type: 'post',	
		data : {'items' : items,
				'so_user_zoncode': so_user_zoncode,
				'so_user_addr' : stuffAddress,
				'so_user_detailAddr' : stuffDetailAddress
			},
		dataType : 'json',
		success : function(data) {
			console.log(data);
			console.log(data.next_redirect_pc_url);
			console.log(data.tid);
			var win = window.open(data.next_redirect_pc_url, "PopupWin", "width=500,height=700,left=500");
			console.log('팝업 열리고 나서?');
		},
		error : function(error) {
			alert('결제실패');
			console.log('k3');
		}

	});

}