$(function() {

	
	
	
	//tire-reg 이미지 등록 
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
	var num=0;		//번호
	
	$("#admin_tire_size_button").click(function() {
		num +=1;
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
				"<span class='size-span'>/</span>" +
				"<span class='tire_ratio size-span'>--</span>" +
				"<span class='size-span'>R</span>" +
				"<span class='tire_inch size-span'>--</span>" +
				"<input class='tire_size_reg_width' value='' name='ti_inch' type='hidden'>" +
				"<input class='tire_size_reg_ratio' value='' name='ti_ratio' type='hidden'>" +
				"<input class='tire_size_reg_inch' value='' name='ti_width' type='hidden'>" +
				"</div>" +
				"</td>" +
				"<td class='admin-tire-size-reg-content'><span class='admin-tire-reg-name'></span></td>" +
				"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-marking-input' name='ti_marking'></td>" +
				"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-pricefac-input' name='ti_pricefac'>&nbsp;원</td>" +
				"<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-stock-input' name='ti_stock'>&nbsp;개</td>" +
				"<td class='admin-tire-size-reg-content'>" +
				"<div class='admin-tire-size-reg-delete'>삭제</div></td>" +
				"</tr>");
	});

	$(document).on("click",".admin-tire-size-reg-delete",function() {
		$(this).closest("tr").remove();
	});
	
	
	
	
	//tire-reg-siz-reg
	$(document).on("click",".admin_tire_size_reg_modal_open",function() {
		$(".admin-tire-reg-size-modal").css("display","flex");
	});
	$(document).on("click",".admin_tire_reg_in",function() {
		var width =$(".tire_input_width").val();
		var ratio =$(".tire_input_ratio").val();
		var inch =$(".tire_input_inch").val();		
		$(".tire_width").text(width);	
		$(".tire_ratio").text(ratio);
		$(".tire_inch").text(inch);

		
		$(".tire_size_reg_width").attr('value',width);
		$(".tire_size_reg_ratio").attr('value',ratio);
		$(".tire_size_reg_inch").attr('value',inch);
		
		$(".admin-tire-reg-size-modal").css("display","none");
	});
	$(document).on("click",".admin_tire_reg_cen",function() {
		$(".admin-tire-reg-size-modal").css("display","none");
	});
	
	$("#admin-tire-reg-name-input").keyup(function() {
		$(".admin-tire-reg-name").text($("#admin-tire-reg-name-input").val()); 
	});
	
	
})



//타이어 그룹 삭제
function tireDelete(tireID) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "admin.tireGroup.delete.go?tg_id="+tireID;
	}
}

//타이어브랜드 삭제
function tireBrandDelete(name) {
	var ok = confirm("정말 삭제하시겠습니까?");
	if (ok) {
		location.href = "admin.tire.brand.delete.go?tb_name="+name;
	}
}