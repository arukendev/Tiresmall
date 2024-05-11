$(function(){
	checkForHash();
	loadPrices(); // 가격 최소, 최대 가져오는 함수 호출
	
	// radio 체크
	$('input[type="radio"]').eq(0).attr('checked','checked')
	if(getParameter('t')!=''){
		$('input[value='+getParameter('t')+']').attr('checked','checked')
	}

//	let curPage = $('#product_curPage').val();
//	let pageCount = $('#product_pageCount').val();
//	let n = 0;
//	for (var i = 0; i < 10000; i++) {
//		if(curPage>3*i && curPage<=3*(i+1)){
//			n=i+1;
//			break;
//		}
//	}
//	
//	$('#product_paging_num').append("<a href='javascript:movePage("+ (3*n-2) +")'>"+ (3*n-2) +"</a>")
//	$('#product_paging_num').append("<a href='javascript:movePage("+ (3*n-1) +")'>"+ (3*n-1) +"</a>")
//	$('#product_paging_num').append("<a href='javascript:movePage("+ 3*n +")'>"+ 3*n +"</a>")
//	$('#product_paging_num').find('a:contains('+curPage+')').addClass('present_page')
//	
//	for (var i = 2; i >=0; i--) {
//		if($('#product_paging_num a:eq('+i+')').text()> pageCount){
//			$('#product_paging_num a:eq('+i+')').remove();
//		}
//	}
	
	$('input[name="carTypeA"]').click(function(){
		getProductJSON(1)
	})
		
	
//	var priceMin =0;
//	var priceMax = 2000000;
//	
//	if(getParameter('pr')!=''){
//		priceMin = getParameter('pr').split('-')[0];
//		priceMax = getParameter('pr').split('-')[1];
//	}
//	
//	$( "#slider-range" ).slider({
//		range: true,
//		min: 0,
//		max: 2000000,
//		step: 50000,
//		values: [ priceMin, priceMax ],
//		slide: function( event, ui ) {
//			$( "#amount" ).val("￦"+ AddComma(ui.values[ 0 ]) + " - ￦" + AddComma(ui.values[ 1 ]) );
//		}
//			
//	});
//	$( "#amount" ).val( "￦"+AddComma($( "#slider-range" ).slider( "values", 0 )) +
//			" - ￦" + AddComma($( "#slider-range" ).slider( "values", 1 )) );
//		
//	
//	$('#product_priceRange_button').click(function(){
//		if($('input[name="carTypeA"]:checked').val() == 0 || $('input[name="carTypeA"]:checked').val()==1){
//			location.href='product.brand.price?b='+getParameter('b')+'&p=1&t='+$('input[name="carTypeA"]:checked').val()+'&pr='+$( "#slider-range" ).slider("values",0)+'-'+$( "#slider-range" ).slider("values",1)
//		} else{
//			location.href='product.brand.price?b='+getParameter('b')+'&p=1&t='+getParameter('t')+'&pr='+$( "#slider-range" ).slider("values",0)+'-'+$( "#slider-range" ).slider("values",1)
//		}
//	})
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}) // ready 끝
function getProductJSON(page){
		
		$.getJSON("product.brand.type.ajax?b="+
				getParameter('b')+"&p="+page+"&t="+
				$('input[name="carTypeA"]:checked').val(),function(j){
			console.log(JSON.stringify(j));
			
//			$('#product_search span').eq(0).html('총 '+j.pGroups.length+'개 상품이 검색되었습니다.');
//			
//			$('#product_container').empty();
//			$('#pagination').remove();
//			$('#product_container').after('<div id="pagination" style="margin-top:50px; display:flex; justify-content:center"></div>')
//			$('#product_wrap_paging').empty();
//			
//			$('#pagination').pagination({
//			    dataSource: j.pGroups,
//			    pageSize: 16,
//			    className: 'paginationjs-theme-red paginationjs-big',
//			    hideFirstOnEllipsisShow: false,
//			    hideLastOnEllipsisShow: false,
//			    callback: function(data, pagination) {
//			        var html = ''
//		        	$.each(data, function(index, item){
//		        		item.minPrice=AddComma(item.minPrice)
//		        		item.maxPrice=AddComma(item.maxPrice)
//			        	html+='<a href="detail.test?item='+ item.tg_id + '"><div class="product_item"><div class="product_item_hidden"></div>'+
//						'<div class="product_item_img"><img src="resources/web/main/product/no-tire-image.jpg"></div>'+
//						'<div class="product_item_title"><p>'+ item.tg_brand +'</p><p>'+ item.tg_name +'</p></div>'+
//						'<div class="product_item_text">'+ item.tg_text +'</div><div class="product_item_size">'+ item.minInch +'인치  ~ '+ item.maxInch +'인치</div>'+
//						'<div class="product_item_price">￦'+item.minPrice+' ~ ￦'+ item.maxPrice+'</div><div class="product_item_detail"><i class="fa-solid fa-magnifying-glass"></i>상세보기</div></div></a>';
//		        	})
//		        	$('#product_container').html(html);
//			    }
//			})
			
			const pageCount = j.pageCount;
			const theNumber = j.theNumber;
			const curPage = j.curPage;
			
			$('#product_search span').eq(0).html('총 '+theNumber+'개 상품이 검색 되었습니다.');
			
			$('#product_container a').remove();
			$.each(j.pGroups, function(i, s){
				$('#product_container').append(
					'<a href="product.detail?tg_id='+ s.tg_id + '">'+
						'<div class="product_item">'+
							'<div class="product_item_hidden">'+
								'<div class="product_item_hidden product_img_border">'+
								'</div>'+
							'</div>'+
							'<div class="product_item_img">'+
								'<img src="resources/web/main/product/no-tire-image.jpg">'+
							'</div>'+
							'<div class="product_item_title">'+
								'<p>'+ s.tg_brand +'</p>'+
								'<p>'+ s.tg_name +'</p>'+
							'</div>'+
							'<div class="product_item_size">'+ s.minInch +'인치  ~ '+ s.maxInch +'인치</div>'+
							'<div class="product_item_price">'+
						
								'<input type="hidden" class="pl_dcRate" value="'+s.tg_dcrate+'">'+
								 '￦  <span class="pl_minPriceSpan">'+s.minPrice +'</span>'+
								 '<input type="hidden" class="pl_minPrice" value="'+s.minPrice+'"> ~ ￦  '+
								 '<span class="pl_maxPriceSpan">'+s.maxPrice+'</span>'+
								 '<input type="hidden" class="pl_maxPrice" value="'+s.maxPrice+'">'+
							'</div>'+
							'<div class="product_item_detail">'+
								'<i class="fa-solid fa-magnifying-glass"></i>상세보기'+
							'</div>'+
						'</div>'+
					'</a>')
			})
			loadPrices();
			
				var html = '<div></div><div class="product_pagingButtons">';
				if(curPage != 1){
					html+='<div><a href="javascript:movePageType(1)"><i class="fa-solid fa-angles-left"></i></a></div>'+
						'<div><a href="javascript:movePageType('+(curPage - 1)+')"><i class="fa-solid fa-chevron-left"></i></a></div>'
				} else{
					html+='<div><i class="fa-solid fa-angles-left" style="color:lightgray"></i></div>'+
						'<div><i class="fa-solid fa-chevron-left" style="color:lightgray"></i></div>'
				}
				for (var pNum = 1; pNum <= pageCount; pNum++) {
					if(pNum==curPage){
						html+='<div class="product_pagingButtons_selected"><a href="javascript:movePageType('+pNum+')" style="color: #fff;">'+pNum+'</a></div>'
					} else{
						html+='<div><a href="javascript:movePageType('+pNum+')">'+pNum+'</a></div>'
					}
				}
				if(curPage==pageCount || pageCount == 0){
					html+='<div><i class="fa-solid fa-chevron-right" style="color:lightgray"></i></div>'+
						'<div><i class="fa-solid fa-angles-right" style="color:lightgray"></i></div>'
				} else{
					html+='<div><a href="javascript:movePageType('+(curPage+1)+')"><i class="fa-solid fa-chevron-right"></i></a></div>'+
						'<div><a href="javascript:movePageType('+pageCount+')"><i class="fa-solid fa-angles-right"></i></a></div>'
				}
				html+='</div><div></div></div>'
				$('#product_paging').html(html)
				
				let hashUrl = '';
			    if(document.URL.indexOf('#') > -1){
			        let url = document.URL.substring(0, document.URL.indexOf('#'))
			        hashUrl = url + '#'+getParameter('b')+'_1_'+$('input[name="carTypeA"]:checked').val();
			    } else {
			        hashUrl = document.URL += '#'+getParameter('b')+'_1_'+$('input[name="carTypeA"]:checked').val();
			    }
			    window.location.replace(hashUrl)
//				 if(document.URL.indexOf('#') > -1){
//					 window.location.replace(location.href.substr(0,location.href.indexOf('#'))+'#type');
//				 } else{
//					 window.location.replace(location.href+'#type');
//				 }
				
		
//			if(curPage!=1){
//				$('#product_wrap_paging').append('<div class="product_paging_firstLast"><a href="javascript:movePage(1)">1</a> . . .</div>')
//			}
//			if(curPage==1){
//				$('#product_wrap_paging').append('<div class="product_paging_prevNext" style="color:lightgray">이전</div>')
//			} else{
//				$('#product_wrap_paging').append('<div class="product_paging_prevNext"><a href="javascript:movePage('+ (curPage-1) +')">이전</a></div>')
//			}
//			$('#product_wrap_paging').append('<div id="product_paging_num></div>');
//			$('#product_paging_num').text('111111');
//			if(curPage == pageCount){
//				$('#product_wrap_paging').append('<div class="product_paging_prevNext" style="color:lightgray">다음</div>')
//			}
//			
//			if(curPage!=pageCount){
//				$('#product_wrap_paging').append('<div class="product_paging_firstLast">. . . <a href="javascript:getProductJSON('+ pageCount +')">'+ pageCount +'</a></div>')
//			}
			
		})
	}

function loadPrices(){
	const plMinPrice = document.querySelectorAll(".pl_minPrice");		  
	const plMaxPrice = document.querySelectorAll(".pl_maxPrice");		  
	const plDc = document.querySelectorAll(".pl_dcRate");
	const plMinPriceSpan = document.querySelectorAll(".pl_minPriceSpan");
	const plMaxPriceSpan = document.querySelectorAll(".pl_maxPriceSpan");
	for (var i = 0; i < plMinPrice.length; i++) {
		const plDcRate = (100 - plDc[i].value) * 0.01;
		plMinPrice[i].value = Math.floor(plMinPrice[i].value * plDcRate / 100) * 100;
		plMaxPrice[i].value = Math.floor(plMaxPrice[i].value * plDcRate / 100) * 100;
		plMinPriceSpan[i].innerText = parseInt(plMinPrice[i].value).toLocaleString();
		plMaxPriceSpan[i].innerText = parseInt(plMaxPrice[i].value).toLocaleString();
	}
}


// paging 함수
function movePage(pageNumber){
	var urlBeforeParam = location.href.substr(0,location.href.lastIndexOf('?')+1);
	var paramsOfUrl = location.href.substr(location.href.lastIndexOf('?')+1);
	var params = new URLSearchParams(paramsOfUrl);
	params.set('p', pageNumber)
	paramsOfUrl=params.toString();
	location.href=urlBeforeParam+paramsOfUrl
}

// type별 조회시 paging하는 함수 
function movePageType(pageNumber){
	location.href='product.brand.type?b='+getParameter('b')+'&p='+pageNumber+'&t='+$('input[name="carTypeA"]:checked').val()
}

// url에서 파라미터 이름으로 파라미터 값 가져오는 함수
function getParameter(param) {
    param = param.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    let regex = new RegExp("[\\?&]" + param + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

// 숫자에 콤마 찍어주는 함수
function AddComma(num) {
    var regexp = /\B(?=(\d{3})+(?!\d))/g;
    return num.toString().replace(regexp, ',');
}

function checkForHash() {
	if(document.location.hash){
		
		$('body').remove()
		var HashLocationName = document.location.hash;
		HashLocationName = HashLocationName.replace("#","");
		var url = location.href.substr(0,location.href.indexOf('?'))
		if(url.indexOf('brand.type')==-1){
			url+='.type';
		}
		url+='?b='+HashLocationName.split('_')[0]+'&p='+HashLocationName.split('_')[1]+'&t='+HashLocationName.split('_')[2]
		location.href=url;
	} 
}