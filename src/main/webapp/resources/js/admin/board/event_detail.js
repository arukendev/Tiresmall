$(".detail-updateBtn").click((e) => {
  let btn = e.currentTarget;
  let btnType = btn.value;
  let event_row = $(btn).closest(".event-row");
  let col2El = $(event_row).find(".event-col2");
  let col3El = $(event_row).find(".event-col3");
  let col2Span = col2El.find("span");
  let col2Data = col2Span.html();
  let inputEl = $("<input>");
  let textareaEl = $("<textarea rows='5' cols='65' style='resize: none;' ></textarea>");
  let saveBtn = $("<button class='save-btn'>저장</button>");
  let cancleBtn = $(
    "<button class='cancle-btn' value='" + col2Data + "'>취소</button>"
  );

  if (btnType == "duration-btn") {
    $(inputEl).attr("id", "datepicker");
  } else if (btnType == "main-btn") {
    $("input[name=e_mainimg]").show();
    $(btn).hide();
    $(col3El).append(saveBtn).append(cancleBtn);
    $(saveBtn).attr("class", "imgbtn");
    return;
  } else if (btnType == "detail-btn") {
    $("input[name=e_detailimg]").show();
    $(btn).hide();
    $(col3El).append(saveBtn).append(cancleBtn);
    $(saveBtn).attr("class", "imgbtn");
    return;
  } else if (btnType == "status-btn") {
    $("#event-status").val(col2Data).prop("selected", true);
    $("#event-status").show();
    $(col2El).find("span").hide();
    $(btn).hide();
    $(col3El).append(saveBtn).append(cancleBtn);
    return;
  } else if (btnType == 'content-btn'){
    $(col2El).append(textareaEl);
    $(col2Span).hide();
    $(btn).hide();
    $(col3El).append(saveBtn);
    $(col3El).append(cancleBtn);
    $(textareaEl).text(col2Span.html().replaceAll("<br>","\r\n"));
    return;
  }
  $(inputEl).attr("value", col2Data);
  $(col2Span).hide();
  $(col2El).append(inputEl);
  $(btn).hide();
  $(col3El).append(saveBtn);
  $(col3El).append(cancleBtn);
  $("#datepicker").datepicker({ minDate: 1 });
});

$(document).on("click", ".cancle-btn", function (e) {
  let btn = e.currentTarget;
  let originVal = btn.value;
  let event_row = $(btn).closest(".event-row");
  let col2El = event_row.find(".event-col2");
  let col3El = event_row.find(".event-col3");
  let col2Textarea = col2El.find("textarea");
  let col2Span = col2El.find("span");
  let col2Data = col2Span.html();
  let updateBtn = col3El.find(".detail-updateBtn");
  let saveBtn = col3El.find(".save-btn");
  let imgBtn = col3El.find(".imgbtn");
  let cancleBtn = col3El.find(".cancle-btn");

  saveBtn.hide();
  cancleBtn.hide();
  updateBtn.show();
  col2Span.html(cancleBtn.val()).show();

  console.log(updateBtn.val());
  if (updateBtn.val() == "main-btn") {
    col2El.find("input:eq(1)").val("").hide();
    imgBtn.hide();
    return;
  } else if (updateBtn.val() == "detail-btn") {
    col2El.find("input:eq(1)").val("").hide();
    imgBtn.hide();
    return;
  } else if (updateBtn.val() == "selectType") {
    $("#event-status").hide();
    return;
  } else if (updateBtn.val() == 'content-btn'){
      col2Textarea.remove();
  }

  col2El.find("input").remove();
});

$(document).on("click", ".save-btn", function (e) {
  let event_row = $(this).closest(".event-row");
  let col2El = event_row.find(".event-col2");
  let col3El = event_row.find(".event-col3");
  let col2Span = col2El.find("span");
  let col2Input = col2El.find("input");
  let col2Textarea = col2El.find("textarea");
  let col2TextareaVal;
  let updateBtn = col3El.find(".detail-updateBtn");
  let saveBtn = col3El.find(".save-btn");
  let cancleBtn = col3El.find(".cancle-btn");
  let type = updateBtn.val();
  let e_no = $("#e_no").text();
  let url = "event.detail.update?e_no=";
  url += e_no + "&";
  console.log(col2Input.val());
  if (type == "title-btn") {
    col2Input.attr("name", "e_title");
    url += "e_title=";
    url += col2Input.val();
    console.log(url);
  } else if (type == "content-btn") {
	col2Input = col2Textarea;
    col2TextareaVal = col2Textarea.val().replaceAll('\n', '<br>');
	col2Input.attr("name", "e_content");
    url += "e_content=";
    url += col2TextareaVal;
  } else if (type == "duration-btn") {
    col2Input.attr("name", "e_duration");
    url += "e_duration=";
  } 
  if (type == "status-btn") {
    url = "event.detail.update?e_no=";
    url += e_no + "&";
    url += "e_status=" + $("#event-status").val();
  }

  console.log(updateBtn.val());
  console.log(e_no);

  $.ajax({
    url: url,
    type: "post",
    async: false,
    success: function (data) {
      if (type == "status-btn") {
        $("#event-status").hide();
        col2Span.text($("#event-status").val());
      }
      col2Span.text(col2Input.val());
      if (type == "content-btn"){
    	  col2Span.html(col2TextareaVal);
      }
      col2Span.show();
      col2Input.hide();
      updateBtn.show();
      saveBtn.hide();
      cancleBtn.val(col2Span.html());
      cancleBtn.hide();
    },
  });
});

$(document).on("click", ".imgbtn", function (e) {
  let event_row = $(this).closest(".event-row");
  let col2El = event_row.find(".event-col2");
  let col3El = event_row.find(".event-col3");
  let updateBtn = col3El.find(".detail-updateBtn");
  let type = updateBtn.val();
  let imgEl = col2El.find(".e_img");
  let imgEl2 = imgEl.clone();
  // 파일을 여러개 선택할 수 있으므로 files 라는 객체에 담긴다.
  console.log("imageInput: ", $(imgEl2)[0].files);
  console.log($(imgEl2)[0].files.length);
  if (imgEl2.val().length === 0) {
    alert("파일을 선택해주세요");
    return;
  }
  console.log(type);
  if(type == 'main-btn'){
	  console.log('main');
	  $("input[name=e_type]").val(type);
  }else if(type == 'detail-btn'){
	  $("input[name=e_type]").val(type);
	  console.log('detail');
  }
  console.log( $("input[name=e_type]").val());
  
  let formData = new FormData($("#uploadForm")[0]);
  
  for (var i = 0; i < $(imgEl2)[0].files.length; i++) {
    formData.append("file" + i, $(imgEl2)[0].files[i]);
  }
  $.ajax({
    type: "POST",
    url: "event.detail.updateFile",
    enctype: "multipart/form-data",
    processData: false,
    contentType: false,
    data: formData,
    success: function (data) {
      let fileNames = data.split("!");
      let cnt = fileNames.length;
      if (fileNames.length > 1) {
        cnt--;
      }
      col2El.find("img").remove();
      for (var i = 0; i < cnt; i++) {
        col2El.prepend("<img class='img" + i + "'>");
        col2El
          .find(".img" + i)
          .attr("src", "resources/upload-event/" + fileNames[i]);
      }
      col3El.find(".cancle-btn").trigger("click");
    },
    err: function (err) {
      console.log("err:", err);
    },
  });
});

$(".event-del-btn").click(() => {
  let e_no = $("#e_no").text();
  let ok = confirm("이벤트를 삭제 합니까?");
  if (ok) {
    $.ajax({
      url: "event.delete",
      data: { e_no },
      success: function (data) {
        if (data == 1) {
          alert("삭제처리 되었습니다");
          location.href = "admin.event.go";
        }
      },
    });
  }
});
