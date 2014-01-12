/* jQuery DatePicker �ʱ�ȭ */
$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	showMonthAfterYear: true,	
	monthNames: ['�� 1 ��','�� 2 ��','�� 3 ��','�� 4 ��','�� 5 ��','�� 6 ��','�� 7 ��','�� 8 ��','�� 9 ��','�� 10 ��','�� 11 ��','�� 12 ��'],
	dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	buttonImageOnly: true,
	buttonText: "�޷�",
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

/* �޴� ��� �� �����ִ� �Լ� */
function showRegisterMenu() {
	document.getElementById("plex_register_menu_form").style.display = "block";
}

/* ���� ��û �� �����ִ� �Լ� */
function showReserveMenu() {
	document.getElementById("plex_pre_reserve_menu_form").style.display = "block";
}