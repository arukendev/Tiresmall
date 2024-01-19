$(function() {
	
	//세단,suv 추천 일반 값 넘기기
	tireGroupPrintCheck();
	//타이어 할인률 설정
	tireGroupDcrate();
	
	//타이어 이름 같게만들기
	tireRegName();
	
	//타이어 등록페이지 사이즈 추가
	tireRegSizeAdd();
	tireUpdateRegSizeAdd();
	
	//타이어 등록페이지 사이즈 삭제
	tireRegSizeDelete();
	
	//타이어 등록페이지 타이어 사이즈 저장
	tireRegSizeReg();
	//타이어 수정페이지 타이어사이즈 저장
	tireSizeNewInfoReg();
	
	//tire-reg 이미지 등록
	tireRegImgReg();
	
	//출력/미출력 AJAX
	printOnOff();

	//세단 추천
	sedanRecommend();
	//suv 추천
	suvRecommend();
	
	//수정페이지작업들
	
	// 브랜드 체크드
	tireBrandSelected();
	
	// 체크드
	tireHiddenSelected();
	
	//업데이트 이미지 없을떄
	tireUpdateNotImg();
	
	//타이어 사이즈tr 포커스아웃시 
	tireMarkingChange();
	tirePriceChange();
	tireStockChange();
	
	
	
	
	//타이어 브랜드 작업
	//출력 여부
	 BrnadprintOnOff();
	 //에이젝스 저장
	 tireBrandForcusout();
	 //브랜드 신규등록
	 tireBrandModal();
	 //input숫자만 입력 및 자리수
	 numberInput();
	 
	 //form에서 input이 비여있는지
	 inputEmpty();
	 
	$(window).keydown(function(e) {
		if(e.keyCode == 13){
			$(".searchtirebtn").trigger("click");
		}
	})
	 
})

//세단,suv 추천 일반 값 넘기기
function tireGroupPrintCheck() {
	if($("#suv_check").checked) {
	    $("#suv_check_hidden").disabled = true;
	}
	if($("#sedan_check").checked) {
	    $("#sedan_check_hidden").disabled = true;
	}
}

//타이어 할인률 설정
function tireGroupDcrate() {
	let dcrateBefor="";
	$(document).on("click",".admin_tire_dcrate_input",function() {
		dcrateBefor = $(this).val(); 
	})
	$(".admin_tire_dcrate_input").focusout(function() {
		let tg_dcrate = $(this).val(); 
		let tg_id = $(this).siblings().val();
		if(dcrateBefor != tg_dcrate && tg_dcrate != ""){
			$.ajax({
				url : "admin.tire.group.dcrate.change",
				data : {tg_id,tg_dcrate},
				success : function(data) {
				}
			});
		}	
	});
}




// 타이어 그룹 삭제
function tireDelete(tireID) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "admin.tireGroup.delete.go?tg_id="+tireID;
	}
}

//타이어 등록페이지 타이어 이름 같게하기
function tireRegName() {
	$("#admin-tire-reg-name-input").keyup(function() {
		$(".admin-tire-reg-name").text($("#admin-tire-reg-name-input").val()); 
	});
}

// 타이어 등록페이지 사이즈 추가
function tireRegSizeAdd() {
	$(document).on("click","#admin_tire_size_button",function() {
		$("#admin_tire_size_add").append("<tr style='height: 50px;' class='admin_tire_validation_test'>" +
				"<td class='admin-tire-size-reg-content'>" +
				"<div class='admin-tire-reg-size-modal'>" +
				"<div class='admin-tire-reg-size-modal-container'>" +
				"<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>" +
				"<div class='admin-tire-reg-size-modal-input'>" +
				"<div class='admin-tire-reg-size-modal-input'>" +
					"<input class='tire_input_width'name='ti_width' maxlength='3'>" + 
					"<span class='size-span'>/</span>" +
					"<input class='tire_input_ratio' name='ti_ratio'  maxlength='2'>" +
					"<span class='size-span'>R</span>" +
					"<input class='tire_input_inch' name='ti_inch' maxlength='2'>" +
				"</div>" +
					"<div class='admin-tire-reg-size-modal-button'>" +
					"<div class='admin_tire_reg_in admin-tire-reg-size-modal-button1'>입력</div>" +
				"<div class='admin_tire_reg_cen admin-tire-reg-size-modal-button2'>취소</div>" +
				"</div>" +
				"</div>" +
				"</div>" +
				"</div> " +
				"<div class='admin_tire_size_reg_modal_open'>" +
				"<span class='tire_width size-span'>---</span>" +
				"<span class='size-span'>&nbsp;/&nbsp;</span>" +
				"<span class='tire_ratio size-span'>--</span>" +
				"<span class='size-span'>&nbsp;R&nbsp;</span>" +
				"<span class='tire_inch size-span'>--</span>" +
				"</div>" +
				"</td>" +
				"<td class='admin-tire-size-reg-content'><span class='admin-tire-reg-name'></span></td>" +
				"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-marking-input' name='ti_marking'></td>" +
				"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-pricefac-input' name='ti_pricefac'>&nbsp;원</td>" +
				"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-stock-input' name='ti_stock' value='0'>&nbsp;개</td>" +
				"<td class='admin-tire-size-reg-content'>" +
				"<div class='admin-tire-size-reg-delete'>삭제</div></td>" +
				"</tr>");
		$(".admin-tire-reg-name").text($("#admin-tire-reg-name-input").val()); 
	});
}

function tireUpdateRegSizeAdd() {
	$(document).on("click","#admin_tire_update_size_button",function() {
		$("#admin_tire_size_add").append(
				"<tr style='height: 50px;'>" +
					"<td class='admin-tire-size-reg-content'>" +	
						"<div class='admin-tire-reg-size-modal'>" +
							"<div class='admin-tire-reg-size-modal-container'>" +
								"<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>" +
								"<div class='admin-tire-reg-size-modal-input'>" +
									"<div class='admin-tire-reg-size-modal-input'>" +
										"<input class='tire_input_width' name='ti_width' maxlength='3'>" + /*그냥 여기다 name을 넣고 밑에 hidden은 지워됨*/ 
										"<span class='size-span'>/</span>" +
										"<input class='tire_input_ratio' name='ti_ratio' maxlength='2'>" +
										"<span class='size-span'>R</span>" +
										"<input class='tire_input_inch' name='ti_inch' maxlength='2'>" +
									"</div>" +
									"<div class='admin-tire-reg-size-modal-button' maxlength='2'>" +
										"<div class='admin_tire_reg_in admin-tire-reg-size-modal-button1'>입력</div>" +
										"<div class='admin_tire_reg_cen admin-tire-reg-size-modal-button2'>취소</div>" +
									"</div>" +
								"</div>" +
							"</div>" +
						"</div> " +
						"<div class='admin_tire_size_reg_modal_open'>" +
							"<span class='tire_width size-span'>---</span>" +
							"<span class='size-span'>&nbsp;/&nbsp;</span>" +
							"<span class='tire_ratio size-span'>--</span>" +
							"<span class='size-span'>&nbsp;R&nbsp;</span>" +
							"<span class='tire_inch size-span'>--</span>" +
						"</div>" +
					"</td>" +
					"<td class='admin-tire-size-reg-content'><span class='admin-tire-reg-name'></span></td>" +
					"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-marking-input' name='ti_marking'></td>" +
					"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-pricefac-input' name='ti_pricefac'>&nbsp;원</td>" +
					"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-stock-input' name='ti_stock' value='0'>&nbsp;개</td>" +
					"<td class='admin-tire-size-reg-content'>" +
						"<div class='admin-tire-size-reg-button-div'>"+
							"<div class='admin-tire-reg-size-modal-button1 admin-tire-size-newInfo-reg'>저장</div>"+
							"<div class='admin-tire-size-reg-delete' style='margin-left:5px;'>삭제</div>" +
						"</div>"+
					"</td>" +
				"</tr>");
		$(".admin-tire-reg-name").text($("#admin-tire-reg-name-input").val()); 
	});
}


//타이어 등록페이지 사이즈 삭제
function tireRegSizeDelete() {
	$(document).on("click",".admin-tire-size-reg-delete",function() {
		let address =$(this).closest("tr"); 
		let ti_id =address.find($(".tiIdHidden")).val(); 
		if(ti_id!=null){
			var ok = confirm("정말 삭제하시겠습니까?");
			if (ok) {
				$.ajax({
					url : "admin.tire.size.delete",
					data : {ti_id},
					success : function(data) {
						address.remove();	
						alert("삭제성공");
					}
				});
			}
		}else{
			$(this).closest("tr").remove();			
		}
	});
}

//타이어 등록페이지 타이어 사이즈 저장
function tireRegSizeReg() {
	$(document).on("click",".admin_tire_size_reg_modal_open",function() {	
		$(this).siblings().css("display","flex");			// 형제 노드를 찾아서 열어줌
	});
	
	//사이즈 입력시에  (모달창에)
	$(document).on("click",".admin_tire_reg_in",function() {
		var width = $(this).closest("tr").find(".tire_input_width").val();
		var ratio = $(this).closest("tr").find(".tire_input_ratio").val();
		var inch = $(this).closest("tr").find(".tire_input_inch").val();

		$(this).closest("tr").find(".tire_width").text(width);
		$(this).closest("tr").find(".tire_ratio").text(ratio);
		$(this).closest("tr").find(".tire_inch").text(inch);	
		
		let ti_id =$(this).closest("tr").find($(".tiIdHidden")).val(); 

		//ajax로 바로바로 바뀌게 한것
		if(ti_id !=null){
			let ti_width=$(this).closest("tr").find($(".tire_input_width")).val()
			let ti_ratio=$(this).closest("tr").find($(".tire_input_ratio")).val()
			let ti_inch=$(this).closest("tr").find($(".tire_input_inch")).val()
			
			//input창 비여있는지 유효성 검사
			if(ti_width == ""){
				alert("단면폭값이 비여있습니다.");
				return false;
			}
			if(ti_ratio == ""){
				alert("편평비값이 비여있습니다.");
				return false;
			}
			if(ti_inch == ""){
				alert("인치값이 비여있습니다.");
				return false;
			}
			$.ajax({
				url : "admin.tire.size.change",
				data : {ti_id,ti_width,ti_ratio,ti_inch},
				success : function(data) {
				}
			});
		}

		$(".admin-tire-reg-size-modal").css("display","none");
	});
	
	$(document).on("click",".admin_tire_reg_cen",function() {
		$(".admin-tire-reg-size-modal").css("display","none");
		$(this).closest("tr").find($(".tire_input_width")).val()=="";
		$(this).closest("tr").find($(".tire_input_ratio")).val()=="";
		$(this).closest("tr").find($(".tire_input_inch")).val()=="";	
	});
	
	$(document).on("click",".admin_tire_brand_reg_cen", function() {
		$(".admin-tire-reg-size-modal").css("display","none");
		$(".tire-brand-input").val()=="";
		$(".tire-brand-input").val()=="";
	})
}

//타이어 등록페이지 사진css
function tireRegImgReg() {

	let formData = new FormData();
	$("#file1").on('change',function(e){
		var arSplitUrl = $("#file1").val().split("\\");
		var nArLength = arSplitUrl.length;
		var fileName = arSplitUrl[nArLength-1];
		$(".upload-name1").val(fileName);
		
		
		//사진 미리보기
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 파일만 업로드 가능합니다.");
				return;
			}
			var sel_file =f;
	
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#imagePreview").attr('src',e.target.result);
			}
			reader.readAsDataURL(f);
		})

	});

	
	
	$("#file2").on('change',function(e){
		
		var fileInput = $("#file2");
		//파일 이름 저장할 공간
		let filesName = "";

		//파일 이름 출력하기
		for( var i=0; i<fileInput.length; i++ ){
			if( fileInput[i].files.length > 0 ){
				for( var j = 0; j < fileInput[i].files.length; j++ ){
					
					if(j!=fileInput[i].files.length-1){
						filesName +=fileInput[i].files[j].name +"/";							
					}else{
						filesName +=fileInput[i].files[j].name;	
					}	
				}
			}
		}
		$(".upload-name2").val(filesName);
		
	
		//파일 미리보기!!
		var sel_files = []; 

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("이미지 파일만 업로드 가능합니다.");
				return;
			}
			
			if($('.admin_tire_reg_img_preview').length>0){	
				$(".admin_tire_reg_img_preview").find('img').remove();
			}
			sel_files.push(f);
			
			console.log(sel_files.push(f))
			var reader = new FileReader();
			reader.onload = function(e) {
				let files = e.target.result
				var img_html = "<img src='" +files +"\'/>";
				$(".admin_tire_reg_img_preview").append(img_html);
			}
			reader.readAsDataURL(f);
		})
	});
}







// 타이어브랜드 삭제
function tireBrandDelete(name) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "admin.tire.brand.delete.go?tb_name="+name;
	}
}

// 출력/미출력 에이젝스
function printOnOff() {
	$(".printbtn").click(function() {
		let onoff =	$(this).text();
		let tg_id =	$(this).val();
		let tg_print = onoff == '출력' ? 0 : 1;
		
		let btnEl = $(this);
		
		$.ajax({
			url : "admin.tire.print.onoff",
			data : {tg_print,tg_id},
			success : function(data) {
				if(data == 1){
					btnEl.text('출력');
					btnEl.attr('class','printbtn admin_printBTN');
				}else{
					btnEl.attr('class', 'printbtn admin_notPrintBTN');
					btnEl.text('미출력');
				}
			}
		});
	});
}

function sedanRecommend() {
	$('.sedanRecommend').click(function() {
	
		let sedanRecommend = $(this).text();
		let tg_id =	$(this).val();
		let tg_sedan = sedanRecommend == '추천' ? 0 : 1;
		let btnEl = $(this);

		$.ajax({
			url : "admin.tire.sedan.recommend",
			data : {tg_sedan,tg_id},
			success : function(data) {
				if(data == 1){
					btnEl.text('추천');
					btnEl.attr('class','admin_printBTN sedanRecommend ');
				}else{
					btnEl.attr('class', 'admin_notPrintBTN sedanRecommend');
					btnEl.text('일반');
				}
			}
		});
	});
}


function suvRecommend() {
	$('.suvRecommend').click(function() {
		let suvRecommend =	$(this).text();
		let tg_id =	$(this).val();
		let tg_suv = suvRecommend == '추천' ? 0 : 1;
		let btnEl = $(this);
		$.ajax({
			url : "admin.tire.suv.recommend",
			data : {tg_suv,tg_id},
			success : function(data) {
				if(data == 1){
					btnEl.text('추천');
					btnEl.attr('class','admin_printBTN suvRecommend');
				}else{
					btnEl.attr('class', 'admin_notPrintBTN suvRecommend');
					btnEl.text('일반');
				}
			}
		});
	});
}

//브랜드 체크
function tireBrandSelected() {
	let brand =  $('#tireBrandHidden').val();

	$('input[value='+brand+']').attr("checked","checked"); 
}
//selecter 체크
function tireHiddenSelected() {
	if($('#tirePrintHidden').val()==1){
		$('.radioPrint').attr("checked","checked");
	}else{
		$('.radioNotPrint').attr("checked","checked");
	}
	if($('#tireSedanHidden').val()==1){
		$('.sedanChecked').attr("checked","checked");		
	};
	
	if($('#tireSUVHidden').val()==1){
		$('.suvChecked').attr("checked","checked");		
	};
}

//수정 페이지 이미지이 없이 저장할때
function tireUpdateNotImg() {
	$(".admin_tire_update_do").click(function() {

		if($("#file1").val()==""){
			$("#file1").remove();
		}		
		
		
		//있어야 DAO에서 size가 0이 됨
		if($("#file2")[0].files.length == 0){
			$("#file2").remove();
		}
	});
}


//수정페이지 마킹 변경시
function tireMarkingChange() {
	$(".admin-tire-reg-marking-input").focusout(function(){
		let ti_id = $(this).closest("tr").find($(".tiIdHidden")).val();
		if(ti_id != null){
			let ti_marking = $(this).val();	
			$.ajax({
				url : "admin.tire.marking.change",
				data : {ti_marking,ti_id},
				success : function(data) {
				}
			});
		}
	});
	
}
//수정페이지 가격변경시
function tirePriceChange() {
	$(".admin-tire-reg-pricefac-input").focusout(function(){
		let ti_id = $(this).closest("tr").find($(".tiIdHidden")).val();
		if(ti_id != null){
			let ti_pricefac = $(this).val();
			$.ajax({
				url : "admin.tire.pricefac.change",
				data : {ti_pricefac,ti_id},
				success : function(data) {	
				}
			});
		}
	
	});
}
//타이어 사이즈 추가시  저장 버튼 누르면
function tireSizeNewInfoReg() {
	$(document).on("click",".admin-tire-size-newInfo-reg",function() {
		let address = $(this).closest("tr");
		let ti_width = address.find($('.tire_input_width')).val();
		let ti_ratio = address.find($('.tire_input_ratio')).val();
		let ti_inch = address.find($('.tire_input_inch')).val();
		let ti_marking = address.find($('.admin-tire-reg-marking-input')).val();
		let ti_pricefac = address.find($('.admin-tire-reg-pricefac-input')).val();
		let ti_stock = address.find($('.admin-tire-reg-stock-input')).val();
		let ti_tg_id = $("#tireIdHidden").val();
		
		if(ti_width==""){
			alert("단명폭값이 비여있습니다.");
			return false;
		}
		if(ti_ratio==""){
			alert("편평비값이 비여있습니다.");
			return false;
		}
		if(ti_inch==""){
			alert("인치값이 비여있습니다.");
			return false;
		}
		if(ti_marking==""){
			alert("마킹값이 비여있습니다.");
			return false;
		}
		if(ti_pricefac==""){
			alert("가격이 비여있습니다.");
			return false;
		}
		$.ajax({
			url : "admin.tire.size.newInsert.reg",
			data : {ti_width,ti_ratio,ti_inch,ti_marking,ti_pricefac,ti_stock,ti_tg_id},
			success : function(data) {	
				alert("저장완료");
				address.find(".admin-tire-size-newInfo-reg").remove();
				address.find(".admin-tire-size-reg-button-div").css("justify-content","center");
			}
		});
		
		
	});
	
}

//수정페이지 재고 수정
function tireStockChange() {
	$(".admin-tire-reg-stock-input").focusout(function(){
		let ti_id=$(this).closest("tr").find($(".tiIdHidden")).val();
		if(ti_id != null){
			let ti_stock = $(this).val();
			$.ajax({
				url : "admin.tire.stock.change",
				data : {ti_stock,ti_id},
				success : function(data) {
				}
			});
		}
	
	});
}






//브랜드 출력 미출력
function BrnadprintOnOff() {
	$(".brandPrintBtn").click(function() {
		let onoff =	$(this).text();
		let tb_name = $(this).val();
		let tb_ea = onoff == '출력' ? 0 : 1;	
		let btnEl = $(this);
		$.ajax({
			url : "admin.tire.brand.print.onoff",
			data : {tb_ea,tb_name},
			success : function(data) {
				if(data == 1){
					btnEl.text('출력');
					btnEl.attr('class','admin_printBTN brandPrintBtn');
				}else{
					btnEl.attr('class', 'admin_notPrintBTN brandPrintBtn');
					btnEl.text('숨김');
				}
			}
		});
	});
}
//타이어 브랜드 입력 후
function tireBrandForcusout() {
	//타이어 브랜드명 변경
	let brandNameBefor="";
	$(".admin-tire-brand-name").click(function name() {
		brandNameBefor=$(this).val();
	});
	$(".admin-tire-brand-name").focusout(function() {
		let tb_name=$(this).val();
		let tb_id=$(this).next().val();
		
		if(brandNameBefor!=tb_name && tb_name!=""){
			$.ajax({
				url : "admin.tire.brand.name.change",
				data : {tb_name,tb_id},
				success : function(data) {
					alert('성공');
				}
			});
		}
	});
	
	//타이어 브랜드 출력 순 변경
	$(".admin-tire-brand-order").focusout(function() {
		/*let sameOrder = $('input[value='+ $(this).val() + ']');
		
		console.log(sameOrder);*/
		let tb_order= $(this).val();
		let tb_name=$(this).closest("tr").find($('.brandPrintBtn')).val();
		console.log(tb_order);
		console.log(tb_name);
		$.ajax({
			url : "admin.tire.brand.order.change",
			data : {tb_name,tb_order},
			success : function(data) {
			}
		});
	});
	
	//타이어 브랜드 이미지 변경
	/*$(".admin-tire-brand-img").click(function() {
		
		var tb_id = $(this).next().val();
		$(this).nextAll($(".admin-tire-brand-img-update")).click();
		console.log($(".admin-tire-brand-img-update")[0].files[0]);
		
	
        
        //이미지가 바뀔때
        $(".admin-tire-brand-img-update").change(function() {
        	
        	console.log(form);
        	
        	//이미지가 선택 될때 안될때 구분
        	if(this.files.length > 0){
        	    //파일이 선택된 경우
        		var form = new FormData();
                form.append( "files", $(".admin-tire-brand-img-update")[0].files[0] );
                form.append( "tb_id", tb_id);
        		alert("파일등록함");
        	 	$.ajax({
            		url : "admin.tire.brand.img.change", 
            		method : "POST", 
            		processData : false, 
            		contentType : false, 
            		enctype: 'multipart/form-data',
            		data : form, 
            		success:function(response) {
            			alert("성공하였습니다.");
            		},error: function (jqXHR){ 
            			alert("실패");
            		}
            	});
        	}
        	else {
        		alert("파일 등록 안함");
        	}    	
        })    
			if(!$(".admin-tire-brand-img-update").value){
				console.log("1");
			}else{	
				console.log("2");
			}	
	})*/
}


function tireBrandModal() {
	$("#admin_tireBrand_reg").click(function() {
		$('.admin-tire-reg-size-modal').css("display","flex");	

		window.addEventListener("keydown", (e) => {
			if(e.keyCode == 27){
				console.log(e.keyCode);
				$(".admin_tire_brand_reg_cen").trigger("click");
			}
			if(e.keyCode == 13){
				console.log(e.keyCode);
				$(".admin_tire_brand_reg_in").trigger("click");
			}
		});

		
	})
	
	//타이어 브랜드 이미지 등록
	
	
	
}

function numberInput() {
	$(document).on("keyup",".tire_input_width",function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });
	$(document).on("keyup",".tire_input_ratio",function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });
	$(document).on("keyup",".tire_input_inch",function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });
	$(document).on("keyup",".admin-tire-reg-pricefac-input",function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });
	$(document).on("keyup",".admin-tire-reg-stock-input",function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });

}

function inputEmpty() {
	$(".admin-tire-reg-button").click(function() {

		if(!$('input[name="tg_brand"]').is(':checked')){
			alert("브랜드를 선택해주세요!!");
			return false;
		}
		if($("#admin-tire-reg-name-input").val() == ''){
			alert("모델명을 입력해주세요!!");
			$("#admin-tire-reg-name-input").focus();
			return false;
		}
		
		//$("input").filter("[value=null]").val("")  input빈칸 찾기
		//반복문 돌려서 비여있는 값 찾기
		let returnResult =0;	//틀렸으면 1을 저장하여 return false를 해줌 
		$(".admin_tire_validation_test").each(function (i) {
			if($("input[name='ti_width']").eq(i).val()==""){
				alert((i+1)+"번째 단면폭값이 비여있습니다.");
				returnResult=1;
				return;
			}
			if($("input[name='ti_ratio']").eq(i).val()==""){
				alert((i+1)+"번째 편평비값이 비여있습니다.");
				returnResult=1;
				return;
			}
			if($("input[name='ti_inch']").eq(i).val()==""){
				alert((i+1)+"번째 인치값이 비여있습니다.");
				returnResult=1;
				return;
			}
			if($("input[name='ti_marking']").eq(i).val()==""){
				alert((i+1)+"번째 마킹값이 비여있습니다.");
				returnResult=1;
				return;
			}
			if($("input[name='ti_pricefac']").eq(i).val()==""){
				alert((i+1)+"번째 가격이 비여있습니다.");
				returnResult=1;
				return;
			}
		});
		if(returnResult==1){
			return false;
		}
		
		
		if($('#file1').val() == "") {
			alert("메인 이미지를 넣어주세요!");
		    $("#file1").focus();
		    return false;
		}
		if($('#file2').val() == "") {
			alert("상세 이미지를 넣어주세요!");
		    $("#file2").focus();
		    return false;
		}
	})

}

