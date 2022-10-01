/*class_detail.js*/

$(function(){
// 탭 컨텐츠 숨기기
$(".tab_content").hide();

// 첫번째 탭콘텐츠 보이기
$(".tab_container").each(function () {
  $(this).children(".tabs li:first").addClass("active"); //Activate first tab
  $(this).children(".tab_content").first().show();
});
//탭메뉴 클릭 이벤트
$(".tabs li a").click(function () {
  
  $(this).parent().siblings("li").removeClass("active");
  $(this).parent().addClass("active"); $(this).parent().parent().parent().parent().find(".tab_content").hide();
  var activeTab = $(this).attr("rel");
   $("#" + activeTab).fadeIn();
});
});