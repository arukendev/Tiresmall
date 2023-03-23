$(function() {
	//세단,suv 추천 일반 값 넘기기
	tireGroupPrintCheck();
	
	//타이어 이름 같게만들기
	tireRegName();
	
	//타이어 등록페이지 사이즈 추가
	tireRegSizeAdd();
	
	//타이어 등록페이지 사이즈 삭제
	tireRegSizeDelete();
	
	//타이어 등록페이지 타이어 사이즈 저장
	tireRegSizeReg();
	
	//tire-reg 이미지 등록
	tireRegImgReg();
	
	//출력/미출력 AJAX
	printOnOff();

	//세단 추천
	sedanRecommend();
	//suv 추천
	suvRecommend();
	
	//수정페이지 브랜드 체크드
	tireBrandSelected();
	
	//수정페이지 체크드
	tireHiddenSelected();
	
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
		$("#admin_tire_size_add").append("<tr style='height: 50px;'>" +
				"<td class='admin-tire-size-reg-content'>" +
				"<div class='admin-tire-reg-size-modal'>" +
				"<div class='admin-tire-reg-size-modal-container'>" +
				"<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>" +
				"<div class='admin-tire-reg-size-modal-input'>" +
				"<div class='admin-tire-reg-size-modal-input'>" +
				"<input class='tire_input_width'>" +
				"<span class='size-span'>/</span>" +
				"<input class='tire_input_ratio'>" +
				"<span class='size-span'>R</span>" +
				"	<input class='tire_input_inch'>" +
				"</div>" +
				"	<div class='admin-tire-reg-size-modal-button'>" +
				"	<div class='admin_tire_reg_in admin-tire-reg-size-modal-button1'>입력</div>" +
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
				"<input class='tire_size_reg_width' value='' name='ti_inch' type='hidden'>" +// type='hidden'
				"<input class='tire_size_reg_ratio' value='' name='ti_ratio' type='hidden'>" +
				"<input class='tire_size_reg_inch' value='' name='ti_width' type='hidden'>" +
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

//타이어 등록페이지 사이즈 삭제
function tireRegSizeDelete() {
	$(document).on("click",".admin-tire-size-reg-delete",function() {
		$(this).closest("tr").remove();
		if($(this).find($('#tiTgIdHidden')).val()==null){
			$.ajax({
				url : "admin.tire.size.delete",
				data : {ti_tg_id},
				success : function(data) {
					if(date==1){
						alert('삭제성공');						
					}else{
						alert('삭제실패');						
						
					}
				}
			});
		}
	});
	
	//에이젝스로 없애는것 추가하기
}

//타이어 등록페이지 타이어 사이즈 저장
function tireRegSizeReg() {
	$(document).on("click",".admin_tire_size_reg_modal_open",function() {	
		$(this).siblings().css("display","flex");			// 형제 노드를 찾아서 열어줌
	});
	$(document).on("click",".admin_tire_reg_in",function() {
		var width = $(this).closest("tr").find(".tire_input_width").val();
		var ratio = $(this).closest("tr").find(".tire_input_ratio").val();
		var inch = $(this).closest("tr").find(".tire_input_inch").val();

		$(this).closest("tr").find(".tire_width").text(width);
		$(this).closest("tr").find(".tire_ratio").text(ratio);
		$(this).closest("tr").find(".tire_inch").text(inch);
		
		$(this).closest("tr").find(".tire_size_reg_width").attr('value',width);
		$(this).closest("tr").find(".tire_size_reg_ratio").attr('value',ratio);
		$(this).closest("tr").find(".tire_size_reg_inch").attr('value',inch);

		
		$(".admin-tire-reg-size-modal").css("display","none");
	});
	
	$(document).on("click",".admin_tire_reg_cen",function() {
		$(".admin-tire-reg-size-modal").css("display","none");
	});
}

//타이어 등록페이지 사진css
function tireRegImgReg() {
	$("#file1").on('change',function(){
		var arSplitUrl = $("#file1").val().split("\\");
		var nArLength = arSplitUrl.length;
		var fileName = arSplitUrl[nArLength-1];
		$(".upload-name1").val(fileName);
	});
	$("#file2").on('change',function(){
		var arSplitUrl = $("#file2").val().split("\\");
		var nArLength = arSplitUrl.length;
		var fileName = arSplitUrl[nArLength-1];
		$(".upload-name2").val(fileName);
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


function tireBrandSelected() {
	let brand =  $('#tireBrandHidden').val();

	$('input[value='+brand+']').attr("checked","checked"); 
}

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







