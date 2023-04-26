$(function() {
	//사이즈 추가
	tireRegSizeAdd();
	//사이즈 삭제
	tireRegSizeDelete();
	
	//타이어
	carTire();
	//input값 체크
	inputEmpty() ;
	
	//자동차 이미지 작업
	carImgReg();
	
	//이미지가 없을시
	notImg();
	
	//브랜드 모달
	carBrandModal();

})

//사이즈 추가시
function tireRegSizeAdd() {
	$(document).on("click","#admin_tire_size_button",function() {
		$("#admin_tire_size_add").append(
				"<tr style='height: 50px;' class='admin_tire_validation_test'>" +
					"<td class='admin-tire-size-reg-content'>" +
						"<div class='admin-tire-reg-size-modal1'>	" +
							"<div class='admin-tire-reg-size-modal-container1'>" +
								"<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>" +
								"<div class='admin-tire-reg-size-modal-input'>" +
									"<div class='admin-tire-reg-size-modal-input'>" +
									"<input class='tire_input_width1' name='tf_width' maxlength='3'>"+ 
									"<span class='size-span'>/</span> "+
									"<input class='tire_input_ratio1' name='tf_ratio' maxlength='2'>"+
									"<span class='size-span'>R</span> "+
									"<input class='tire_input_inch1' name='tf_inch' maxlength='2'>"+
								"</div>" +
									"<div class='admin-tire-reg-size-modal-button'>" +
										"<div class='admin_tire_reg_in1 admin-tire-reg-size-modal-button1'>입력</div>" +
										"<div class='admin_tire_reg_cen1 admin-tire-reg-size-modal-button2'>취소</div>" +
									"</div>" +
								"</div>" +
							"</div>" +
						"</div>" +
						"<div class='admin_tire_size_reg_modal_open1'>" +
						"<span class='tire_width1 size-span'>---</span>" +
						"<span class='size-span'>&nbsp;/&nbsp;</span>" +
						"<span class='tire_ratio1 size-span'>--</span>" +
						"<span class='size-span'>&nbsp;R&nbsp;</span>" +
						"<span class='tire_inch1 size-span'>--</span>" +
						"</div>" +
					"</td>" +
					"<td class='admin-tire-size-reg-content'>" +
						"<div class='admin-tire-reg-size-modal2'>" +
							"<div class='admin-tire-reg-size-modal-container2'>	" +
								"<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>	" +
								"<div class='admin-tire-reg-size-modal-input'>" +
									"<div class='admin-tire-reg-size-modal-input'>" +
										"<input class='tire_input_width2' name='tb_width' maxlength='3'>"+ 
										"<span class='size-span'>/</span> "+
										"<input class='tire_input_ratio2' name='tb_ratio' maxlength='2'>"+
										"<span class='size-span'>R</span> "+
										"<input class='tire_input_inch2' name='tb_inch' maxlength='2'>"+
									"</div>" +
									"<div class='admin-tire-reg-size-modal-button'>" +
										"<div class='admin_tire_reg_in2 admin-tire-reg-size-modal-button1'>입력</div>" +
										"<div class='admin_tire_reg_cen2 admin-tire-reg-size-modal-button2'>취소</div>" +
									"</div>" +
								"</div>" +
							"</div>" +
						"</div>	" +
						"<div class='admin_tire_size_reg_modal_open2'>" +
						"<span class='tire_width2 size-span'>---</span>" +
						"<span class='size-span'>&nbsp;/&nbsp;</span>" +
						"<span class='tire_ratio2 size-span'>--</span>" +
						"<span class='size-span'>&nbsp;R&nbsp;</span>" +
						"<span class='tire_inch2 size-span'>--</span>" +
						"</div>" +
					"</td>" +
					"<td class='admin-tire-size-reg-content'>" +
					"<div class='admin-tire-size-reg-delete'>삭제</div></td>" +
					"</tr>");
		
	});
}

//사이즈 삭제시
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

//사이즈 맞게 맞기
function carTire() {
	$(document).on("click",".admin_tire_size_reg_modal_open1",function() {	
		$(this).siblings().css("display","flex");			// 형제 노드를 찾아서 열어줌
	});
	$(document).on("click",".admin_tire_size_reg_modal_open2",function() {	
		$(this).siblings().css("display","flex");			// 형제 노드를 찾아서 열어줌
	});
	
	//사이즈 입력시에  (모달창에)
	//앞타이어
	$(document).on("click",".admin_tire_reg_in1",function() {	
		var width = $(this).closest("tr").find(".tire_input_width1").val();
		var ratio = $(this).closest("tr").find(".tire_input_ratio1").val();
		var inch = $(this).closest("tr").find(".tire_input_inch1").val();

		$(this).closest("tr").find(".tire_width1").text(width);
		$(this).closest("tr").find(".tire_ratio1").text(ratio);
		$(this).closest("tr").find(".tire_inch1").text(inch);	
		
		/*let ti_id =$(this).closest("tr").find($(".tiIdHidden")).val(); 

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
			});*/
			$(".admin-tire-reg-size-modal1").css("display","none");
		});
		
		//뒤타이어
		$(document).on("click",".admin_tire_reg_in2",function() {
			var width = $(this).closest("tr").find(".tire_input_width2").val();
			var ratio = $(this).closest("tr").find(".tire_input_ratio2").val();
			var inch = $(this).closest("tr").find(".tire_input_inch2").val();

			$(this).closest("tr").find(".tire_width2").text(width);
			$(this).closest("tr").find(".tire_ratio2").text(ratio);
			$(this).closest("tr").find(".tire_inch2").text(inch);	

			$(".admin-tire-reg-size-modal2").css("display","none");
		});

		

	
		//취소 누를시
		$(document).on("click",".admin_tire_reg_cen1",function() {
			$(".admin-tire-reg-size-modal1").css("display","none");
			$(this).closest("tr").find($(".tire_input_width1")).val()=="";
			$(this).closest("tr").find($(".tire_input_ratio1")).val()=="";
			$(this).closest("tr").find($(".tire_input_inch1")).val()=="";	
		});
		$(document).on("click",".admin_tire_reg_cen2",function() {
			$(".admin-tire-reg-size-modal2").css("display","none");
			$(this).closest("tr").find($(".tire_input_width2")).val()=="";
			$(this).closest("tr").find($(".tire_input_ratio2")).val()=="";
			$(this).closest("tr").find($(".tire_input_inch2")).val()=="";	
		});
}
//자동차 등록페이지 사진css
function carImgReg() {
	
	let tg_id = $('#tireIdHidden').val();
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
}

function notImg() {
	$(".admin-tire-reg-button").click(function() {
		if($("#file1").val()==""){
			$("#file1").remove();
		}
	})
}


function updateCar(id) {
	location.href = 'admin.car.update.go?c_id=' + id;
}


function inputEmpty() {
	$(".admin-tire-reg-button").click(function() {
		let returnResult =0;	//틀렸으면 1을 저장하여 return false를 해줌 
		$(".admin_tire_validation_test").each(function (i) {
			if($("input[name='tf_width']").eq(i).val()==""){
				alert((i+1)+"번째 앞타이어 단면폭 값이 비여있습니다.");
				returnResult=1;
				return false;
			}
			if($("input[name='tf_ratio']").eq(i).val()==""){
				alert((i+1)+"번째 앞타이어 편평비 값이 비여있습니다.");
				returnResult=1;
				return false;
			}
			if($("input[name='tf_inch']").eq(i).val()==""){
				alert((i+1)+"번째 앞타이어 인치 값이 비여있습니다.");
				returnResult=1;
				return false;
			}

			if($("input[name='tb_width']").eq(i).val()==""){
				alert((i+1)+"번째 뒷타이어 단면폭 값이 비여있습니다.");
				returnResult=1;
				return false;
			}
			if($("input[name='tb_ratio']").eq(i).val()==""){
				alert((i+1)+"번째 뒷타이어 편평비 값이 비여있습니다.");
				returnResult=1;
				return false;
			}
			if($("input[name='tb_inch']").eq(i).val()==""){
				alert((i+1)+"번째 뒷타이어 인치 값이 비여있습니다.");
				returnResult=1;
				return false;
			}
		
		});
		if(returnResult==1){
			return false;
		}
	})
}

function updateCar(id) {
	location.href = 'admin.car.update.go?c_id=' + id;
}
function deletecar(id) {
	let ok = confirm('정말 삭제하시겠습니까?');
	if (ok) {
		location.href = 'admin.car.delete.do?c_id=' + id;
	}

}



function carBrandModal() {
	//신규 등록 누를시
	$(".brandRegButton").click(function() {
		$("#admin_car_brand_reg_modal").css("display","flex");
	})
	//취소 버튼 누를시
	$(".admin_carBrand_deleteBTN").click(function() {
		$("#admin_car_brand_reg_modal").css("display","none");
		$(".admin_car_brand_reg_brant_name").val()==null;
	})
	
	
	
	
	
}




function deletecb1(cbname) {
	let ok = confirm('정말 삭제하시겠습니까?');
	if (ok) {
		location.href = 'brand.delete.do?cb_name=' + cbname;
	}
}








