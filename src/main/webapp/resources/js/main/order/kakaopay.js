function kakao_pay() {
	
	let tg_id = $(".pay_product_name").attr("value");
	console.log(tg_id);
	
	let partner_user_id = $("input[name=o_sortation]").val();
	let product_cnt = $(".pay_product").length;
	let item_name =  $(".pay_product_name").first().text().trim(); //.replaceAll(" ", "+");
	if(product_cnt >= 2){
		item_name += "외 "+ parseInt(product_cnt-1) + "개의 상품";
	}
	let quantityEl = $(".pay_quantity");
	let quantity = 0;
	$(quantityEl).each(function(i,e) {
	quantity +=	parseInt($(e).text().replace("EA", ""));
	});
	let total_amount = $(".pay_nav_value").last().text().replace(",","");
	total_amount = total_amount.replace("원","");
	let vat_amount = parseInt(total_amount * 0.1);
	let tax_free_amount = 0;
	console.log('user_id = ' + partner_user_id);
	console.log('product_cnt = ' + product_cnt);
	console.log('product_name = ' + item_name);
	console.log('quantity = ' + quantity);
	console.log('price = ' + total_amount);
	console.log('vat_amount = ' + vat_amount);
	
	$.ajax({
		url : 'kakao.popup',
		type: 'post',	
		data : {partner_user_id,
			item_name,
			quantity,
			total_amount,
			vat_amount,
			tax_free_amount
			},
		success : function(data) {
			console.log('data : ' + data);
			console.log(data.next_redirect_pc_url);
			console.log(data.tid);
			var win = window.open(data.next_redirect_pc_url, "PopupWin", "width=500,height=700,left=500");
			console.log('팝업 열리고 나서?');
		}
//		error : function(request,status,error) {
//			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//		}

	});

}