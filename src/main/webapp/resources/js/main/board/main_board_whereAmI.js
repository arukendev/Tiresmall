let whereAmI = document.querySelector(".whereAmI");

/*
let whereAmI = document.querySelector(".whereAmI");
let valueOfWAI = whereAmI.value;
console.log(valueOfWAI);

let lengthOfWAI_withoutFileExtension = valueOfWAI.indexOf(".");
console.log(lengthOfWAI_withoutFileExtension);

let whatIWant = valueOfWAI.substr(0, (lengthOfWAI_withoutFileExtension));
console.log(whatIWant);
*/

const board_home = document.querySelector(".board_home");
const board_faq = document.querySelector(".board_faq");
const board_qna = document.querySelector(".board_qna");
const board_notice = document.querySelector(".board_notice");
const board_event = document.querySelector(".board_event");

if (whereAmI.value == "고객센터") {
	board_home.classList.add("board_imHere");
} else if (whereAmI.value == "FAQ") {
	board_faq.classList.add("board_imHere");
} else if (whereAmI.value == "1:1문의") {
	board_qna.classList.add("board_imHere");
} else if (whereAmI.value == "공지사항") {
	board_notice.classList.add("board_imHere");
} else if (whereAmI.value == "이벤트") {
	board_event.classList.add("board_imHere");
}