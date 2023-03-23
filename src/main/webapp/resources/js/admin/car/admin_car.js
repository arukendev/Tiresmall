function deletecb1(cbbbb) {
	let ok = confirm('정말 삭제하시겠습니까?');
	if (ok) {
		location.href = 'brand.delete.do?cb_name=' + cbbbb;
	}
}

$(document).ready(
		function($) {
			$(".carRegButton").on("click", function(event) { // 팝업오픈 버튼 누르면
				$("#carregpopup01").show(); // 팝업 오픈
				$("body").append('<div class="backon"></div>'); // 뒷배경 생성
			});

			$("body").on(
					"click",
					function(event) {
						if (event.target.className == 'close'
								|| event.target.className == 'backon') {
							 $(".preview-image .upload-thumb").attr("src", "");
							    $(".fileinputstyle").text("");
							$("#carregpopup01").hide(); // close버튼 이거나 뒷배경 클릭시
														// 팝업 삭제
							$(".backon").hide();
						}

					});

		});

$(document).ready(
		function($) {
			$(".brandRegButton").on("click", function(event) { // 팝업오픈 버튼 누르면
				$("#brandregpopup01").show(); // 팝업 오픈
				$("body").append('<div class="backon"></div>'); // 뒷배경 생성
			});

			$("body").on(
					"click",
					function(event) {
						if (event.target.className == 'close'
								|| event.target.className == 'backon') {
							$("#brandregpopup01").hide(); // close버튼 이거나 뒷배경
															// 클릭시 팝업 삭제
							$(".backon").hide();
						}

					});

		});

function deletecar(carrr) {
	let ok = confirm('정말 삭제하시겠습니까?');
	if (ok) {
		location.href = 'admin.car.delete.do?c_id=' + carrr;
	}

}



function updatecar(id, name, year1, year2, option, brand, ft, bt, print, c_file) {

	// c_bta_u나 c_fta_u에 값이 들어있는 경우
	

	$(document).ready(
			function($) {
				$(".updatecarbutton").on("click", function(event) { // 팝업오픈 버튼
																	// 누르면
					$("#updatecarpopup01").show(); // 팝업 오픈
					$("body").append('<div class="backon"></div>'); // 뒷배경 생성
				});

				$("body").on(
						"click",
						function(event) {
							if (event.target.className == 'close'
									|| event.target.className == 'backon') {
								 $(".preview-image .update-upload-thumb").attr("src", "");
								    $(".updatefileinputstyle").text("");
								$("#updatecarpopup01").hide(); // close버튼 이거나
																// 뒷배경 클릭시 팝업 삭제
								$(".backon").hide();
							}
						});

			});

	$('#c_id_u').val(id);
	$('#c_name_u').val(name);
	$('#c_year1_u').val(year1);
	$('#c_year2_u').val(year2);
	$('#c_print_u').val(print);
	$('#c_option_u').val(option);
	$('#c_brand_u').val(brand);
	$('.updatefileinputstyle').html(c_file);
	$('#c_file_u').attr('readonly', true);
	
	 //...

	// c_ft_u와 c_bt_u에서 값을 가져온 뒤 콤마로 분할하여 배열로 저장
	var ftArray = ft.split(',');
	var btArray = bt.split(',');

	// div를 생성할 개수를 구한다
	var numOfDivs = Math.max(ftArray.length, btArray.length);

	// 기존에 있던 div들을 모두 제거한다
	$('#updatesizeInputs').empty();

	// numOfDivs 만큼 div를 생성한다
	for (var i = 0; i < numOfDivs; i++) {
		addupdateSize();
	}

	console.log("!!!!!!");
	console.log(numOfDivs);
	console.log("!!!!!!");

	// 생성된 div에 값을 넣어준다
	for (var i = 0; i < numOfDivs; i++) {
		var ftValue = i < ftArray.length ? ftArray[i] : "";
		var btValue = i < btArray.length ? btArray[i] : "";
		$('#updatesizeInputs .ftinputstyle:eq(' + i + ') input').val(ftValue);
		$('#updatesizeInputs .btinputstyle:eq(' + i + ') input').val(btValue);
	}
}

function updatecb1(name, order) {

	$(document).ready(
			function($) {
				$(".updatecarbrandbutton").on("click", function(event) { // 팝업오픈
																			// 버튼
																			// 누르면
					$("#updatebrandpopup01").show(); // 팝업 오픈
					$("body").append('<div class="backon"></div>'); // 뒷배경 생성
				});

				$("body").on(
						"click",
						function(event) {
							if (event.target.className == 'close'
									|| event.target.className == 'backon') {
								
								$("#updatebrandpopup01").hide(); // close버튼
																	// 이거나 뒷배경
																	// 클릭시 팝업 삭제
								$(".backon").hide();
							}
						});

			});

	$('#cb_name_u').val(name);
	$('#cb_name_u').attr('readonly', true);
	$('#cb_order_u').val(order);

}


function addSize() {
	  var ftInput = '<div style="display: block;"><div class="ftinputstyle" style="float: left;"><input style="height: 30px; width:198px;" name="c_ft" id="c_ft" class="c_ftinput"></div></div>';
	  var btInput = '<div style="display: block;"><div class="btinputstyle" style="float: left;"><input style="height: 30px; width:193px;" name="c_bt" id="c_bt" class="c_btinput"></div></div>';
	  var tmInput = '<div class="tmreginputstyle" style="float: left;">' +
	    '<div class="admin-tire-size-reg-delete">' + '삭제</div>' + '</div>';
	  var sizeInputs = document.getElementById('sizeInputs');
	  var newInput =  '<div class="size-info">' +
	  	'<br><br>' +
	
	    '<div class="ftbttmstyle">' +
	    '<div class="ftstyle" style="height: 30px; width:200px; border: 1px solid white;">앞타이어</div>' +
	    '<div class="btstyle" style="height: 30px; width:200px; border: 1px solid white;">뒤타이어</div>' +
	    '<div class="tmstyle" style="height: 30px; width:200px; border: 1px solid white;">관리</div>' +
	    '</div>'  + ftInput + btInput + tmInput + '</div>';
	  sizeInputs.innerHTML += newInput;
	  
	  var deleteBtns = document.querySelectorAll('.admin-tire-size-reg-delete');
	  for (var i = 0; i < deleteBtns.length; i++) {
	    deleteBtns[i].addEventListener('click', function(e) {
	      e.target.closest('.size-info').remove();
	    });
	  }
	}


function addupdateSize() {
	  // ...
	  
	  var sizeInputs = document.getElementById('updatesizeInputs');
	  var newInput = document.createElement('div');
	  newInput.className = 'size-info';
	  
	  // ... 새로운 요소의 내용을 추가
	  
	  var ftInput = '<div style="display: block;"><div class="ftinputstyle" style="float: left;"><input style="height: 40px; width:197px;" name="c_ft" id="c_ft_u" class="c_ftinput"></div></div>';
	  var btInput = '<div style="display: block;"><div class="btinputstyle" style="float: left;"><input style="height: 40px; width:195px;" name="c_bt" id="c_bt_u" class="c_btinput"></div></div>';
	  var tmInput = '<div class="tminputstyle" style="float: left;">' +
	                  '<div class="admin-tire-size-reg-delete">삭제</div>' +
	                '</div>';
	  newInput.innerHTML = '<br><br><br>' +
	                       '<div class="ftbttmstyle">' +
	                         '<div class="ftstyle" style="height: 30px; width:200px; border: 1px solid white;">앞타이어</div>' +
	                         '<div class="btstyle" style="height: 30px; width:200px; border: 1px solid white;">뒤타이어</div>' +
	                         '<div class="tmstyle" style="height: 30px; width:200px; border: 1px solid white;">관리</div>' +
	                       '</div>' + ftInput + btInput + tmInput;
	  
	  sizeInputs.appendChild(newInput);
	  
	  var deleteBtns = document.querySelectorAll('.admin-tire-size-reg-delete');
	  for (var i = 0; i < deleteBtns.length; i++) {
	    deleteBtns[i].addEventListener('click', function(e) {
	      e.target.closest('.size-info').remove();
	    });
	  }
	}

function previewImagereg(event) {
	  var input = event.target;
	  var preview = document.querySelector('.preview-image .upload-thumb');
	  var filename = input.files[0].name;
	  var fileinputstyle = document.querySelector('.fileinputstyle');

	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(event) {
	      preview.src = event.target.result;
	    }
	    reader.readAsDataURL(input.files[0]);
	  }

	  fileinputstyle.textContent = filename;
	
	}

function previewImage(event) {
	  var input = event.target;
	  var preview = document.querySelector('.preview-image .update-upload-thumb');
	  var filename = input.files[0].name;
	  var fileinputstyle = document.querySelector('.updatefileinputstyle');

	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(event) {
	      preview.src = event.target.result;
	    }
	    reader.readAsDataURL(input.files[0]);
	  }

	  fileinputstyle.textContent = filename;
	
	}

