	var val1 = ""
	var val2 = ""
	var val3 = ""
	var val4 = ""
	var val5 = ""
	var val6 = ""
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
	
	$(".vhrItem4").click(function() {
		$('.vhrItem4').css('backgroundColor','transparent');
		$('.vhrItem4').css('color','black');
		$(this).css('backgroundColor', '#ab1e21');
		$(this).css('color', 'white');
		val4 = $(this).text();
	});
	
	$(".vhrItem5").click(function() {
		$('.vhrItem5').css('backgroundColor','transparent');
		$('.vhrItem5').css('color','black');
		$(this).css('backgroundColor', '#ab1e21');
		$(this).css('color', 'white');
		val5 = $(this).text();
	});
	
	$(".vhrItem6").click(function() {
		$('.vhrItem6').css('backgroundColor','transparent');
		$('.vhrItem6').css('color','black');
		$(this).css('backgroundColor', '#ab1e21');
		$(this).css('color', 'white');
		val6 = $(this).text();
	});
	
	
	
});
	function searchTire() {
		if (val1 == "" || val2 == "" || val3 == "") {
			alert("사이즈를 모두 선택해 주세요");
		} else{
			let ti_width = val1;
			let ti_ratio = val2;
			let ti_inch = val3;
			
			
			$.ajax({
				url:"getTires.json",
				data : {"ti_width" : ti_width,
						"ti_ratio" : ti_ratio,
						"ti_inch" : ti_inch },
				success:function(data){
					
					$('.tire-items').empty();
					
					if(data.tires[0] == undefined) {
						$('tire-items').append($('tire-search-fail').first().clone());
						$('.searchResultContainer').css('display','block');
						$('.tire-search-fail').css('display','block');
					} else {
						$('.tire-search-fail').css('display','none');
					}
				
					
					$.each(data.tires, function(i, item) {
						let itemDIV = $('.tire-item').first().clone();
						$(itemDIV).addClass('show');
						console.log(item);
						let getImg = item.tg_img;
						let getBrand = item.tg_brand;
						let getName = item.tg_name;
						let getPrice = item.ti_pricefac;
						let getWidth = 	item.ti_width;
						let getRatio = 	item.ti_ratio;
						let getInch = 	item.ti_inch;
						$(itemDIV).find(".tire-img").text(getImg);
						$(itemDIV).find(".tire-brand").text(getBrand);
						$(itemDIV).find(".tire-name").text(getName);
						$(itemDIV).find(".tire-price").text("판매가 : " + getPrice + "원");
						$(itemDIV).find(".tire-info-width").text(getWidth);
						$(itemDIV).find(".tire-info-ratio").text(getRatio);
						$(itemDIV).find(".tire-info-inch").text(getInch);
						
						$('.tire-items').append(itemDIV);
						
						
					
					
					$('.show').css('display','flex');
					$('.searchResultContainer').css('display','block');
									
				});
				}
			});
		}
	}
	
	function searchTire2() {
		console.log(1);
	}
	
	function addSearch() {
		if ($('.second').css('display') == 'none') {
			$('.second').slideDown();
			$('.second').css('display','flex');
			$('.searchTireBtn2').empty();
			$('.searchTireBtn2').append('돌아가기');
			$('.searchTireBtn').removeAttr("onclick");
			$('.searchTireBtn').attr("onclick","searchTire2()");
		} else {
			$('.second').slideUp();
			$('.searchTireBtn2').empty();
			$('.searchTireBtn2').append('앞뒤 타이어 사이즈가 다른 경우');
			$('.searchTireBtn').removeAttr("onclick");
			$('.searchTireBtn').attr("onclick","searchTire()")
		}
	}