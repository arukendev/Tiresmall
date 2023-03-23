$(function(){
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
	
	$('input[name="carTypeA"]').click(function getProductJSON(){
		$.getJSON("product.brand.type.ajax?b="+getParameter('b')+"&p=1&t="+$('input[name="carTypeA"]:checked').val(),function(j){
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
			
			$('#product_search span').eq(0).html('총 '+theNumber+'개 상품이 검색되었습니다.');
			
			$('#product_container a').remove();
			$.each(j.pGroups, function(i, s){
				s.minPrice=AddComma(s.minPrice);
				s.maxPrice=AddComma(s.maxPrice);
				$('#product_container').append('<a href="detail.test?item='+ s.tg_id + '"><div class="product_item"><div class="product_item_hidden"></div>'+
						'<div class="product_item_img"><img src="resources/web/main/product/no-tire-image.jpg"></div>'+
						'<div class="product_item_title"><p>'+ s.tg_brand +'</p><p>'+ s.tg_name +'</p></div>'+
						'<div class="product_item_text">'+ s.tg_text +'</div><div class="product_item_size">'+ s.minInch +'인치  ~ '+ s.maxInch +'인치</div>'+
						'<div class="product_item_price">￦'+s.minPrice+' ~ ￦'+s.maxPrice+'</div><div class="product_item_detail"><i class="fa-solid fa-magnifying-glass"></i>상세보기</div></div></a>')
			})
			
				var html = '<div class="paginationjs-pages"><ul>';
				if(curPage == 1){
					html+='<li class="paginationjs-prev disabled"><a>«</a></li>'
				} else{
					html+='<li class="paginationjs-prev J-paginationjs-previous"><a href="javascript:movePageType(1)">«</a></li>'
				}
				for (var pNum = 1; pNum <= pageCount; pNum++) {
					if(pNum==curPage){
						html+='<li class="paginationjs-page J-paginationjs-page active" ><a href="javascript:movePageType('+pNum+')">'+pNum+'</a></li>'
					} else{
						html+='<li class="paginationjs-page J-paginationjs-page" ><a href="javascript:movePageType('+pNum+')">'+pNum+'</a></li>'
					}
				}
				if(curPage==pageCount){
					html+='<li class="paginationjs-next disabled"><a>»</a></li>'
				} else{
					html+='<li class="paginationjs-next J-paginationjs-next"><a href="javascript:movePageType('+pageCount+')">»</a></li>'
				}
				html+='</ul></div>'
				$('#product_wrap_paging').html(html)
		
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
	})
	
	
	$( "#slider-range" ).slider({
		range: true,
		min: 0,
		max: 2000000,
		step: 50000,
		values: [ 0, 2000000 ],
		slide: function( event, ui ) {
			$( "#amount" ).val("￦"+ AddComma(ui.values[ 0 ]) + " - ￦" + AddComma(ui.values[ 1 ]) );
		},
			
	});
	$( "#amount" ).val( "￦"+AddComma($( "#slider-range" ).slider( "values", 0 )) +
			" - ￦" + AddComma($( "#slider-range" ).slider( "values", 1 )) );
		
	
	$('#product_priceRange_button').click(function(){
		alert($( "#slider-range" ).slider("values",0)+', '+ $( "#slider-range" ).slider( "values", 1 ));
	})
			  
			  
		 
	
	
	
	
	
	
	
	
	
	
	
	
	
}) // ready 끝

// paging 함수
function movePage(pageNumber){
	location.href=location.href.substring(0,location.href.lastIndexOf('p')+2) + pageNumber + location.href.substring(location.href.lastIndexOf('p')+3)
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
