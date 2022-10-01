/**
 * board.js
 */

function bw_check(){

	if($.trim($("#b_title").val())==""){
		alert("제목을 입력하세요!");
		$("#b_title").val("").focus();
		return false;
	}

	if($.trim($("#b_cont").val())==""){
		alert("글내용을 입력하세요!");
		$("#b_cont").val("").focus();
		return false;
	}
}