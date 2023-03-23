	var val1 = ""
	var val2 = ""
	var val3 = ""
$(function() {		
	$(".vhrItem1").click(function() {
		$('.vhrItem1').css('backgroundColor','transparent');
		$('.vhrItem1').css('color','black');
		$(this).css('backgroundColor', '#ab1e21');
		$(this).css('color', 'white');
		val1 = $(this).text();
	});
	
	$(".vhrItem2").click(function() {
		$('.vhrItem2').css('backgroundColor','transparent');
		$('.vhrItem2').css('color','black');
		$(this).css('backgroundColor', '#ab1e21');
		$(this).css('color', 'white');
		val2 = $(this).text();
	});
	
	$(".vhrItem3").click(function() {
		$('.vhrItem3').css('backgroundColor','transparent');
		$('.vhrItem3').css('color','black');
		$(this).css('backgroundColor', '#ab1e21');
		$(this).css('color', 'white');
		val3 = $(this).text();
	});
	

	$('#ttt').click(function() {
		let item = $('.tire-item').clone();
		$('.tire-items').append(item);
	})
	
	
	
});
	function searchTire() {
		if (val1 == "" || val2 == "" || val3 == "") {
			alert("사이즈를 모두 선택해 주세요");
		} else{
/* 			let ti_width = val1;
			let ti_ratio = val2;
			let ti_inch = val3;
 */			
			
			// 임시 데이터(임시 db에 입력된 값)
			let ti_width = 5;
			let ti_ratio = 5;
			let ti_inch = 1;
			
			
			$.ajax({
				url:"getTires.json",
				data : {"ti_width" : ti_width,"ti_ratio" : ti_ratio, "ti_inch" : ti_inch},
				success:function(data){
					
					console.log(data.tires);
				
					
					$.each(data.tires, function(i, item) {
						let itemDIV = $('.tire-item').first().clone();
						$(itemDIV).addClass('show');
						console.log(item);
						let getWidth = 	item.ti_width;
						let getRatio = 	item.ti_ratio;
						let getInch = 	item.ti_inch;
						$(itemDIV).find(".tire-info-width").text(getWidth);
						$(itemDIV).find(".tire-info-ratio").text(getRatio);
						$(itemDIV).find(".tire-info-inch").text(getInch);
					
						
						
						$('.tire-items').append(itemDIV);
					
					
					$('.show').css('display','block');
					
					
				});
				}
			});
		}
	}