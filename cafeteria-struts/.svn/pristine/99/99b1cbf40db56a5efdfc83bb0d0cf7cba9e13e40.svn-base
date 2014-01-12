/* jQuery DatePicker 초기화 */
$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	showMonthAfterYear: true,	
	monthNames: ['년 1 월','년 2 월','년 3 월','년 4 월','년 5 월','년 6 월','년 7 월','년 8 월','년 9 월','년 10 월','년 11 월','년 12 월'],
	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	buttonImageOnly: true,
	buttonText: "달력",
	buttonImage: "images/calendar.gif"
});
$(function() {
	$("#pre_reservation_datepicker").datepicker({
		showOn: "both"
	});
});
$(function() {
	$("#register_menu_datepicker").datepicker();
});

/* 메뉴 등록 폼 보여주는 함수 */
function showRegisterMenu() {
	document.getElementById("plex_register_menu_form").style.display = "block";
}

/* 예약 신청 폼 보여주는 함수 */
function showReserveMenu() {
	document.getElementById("plex_pre_reserve_menu_form").style.display = "block";
}