<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <link rel="stylesheet" type="text/css" href="./css/YeYag_Main.css" />
 <jsp:include page="/view/includes/header.jsp" /> 
</head>
<body>
<br><br>
<script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
</script>

<script>
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});
//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});
</script>
<script type="text/javascript">
 
function go_pop(){
 
 window.open("./planlist.do","new","width=415, height=620, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
</script>
<body onload="go_pop()">
<br><br>
<div class="section" style="margin:150px 0px 0px 0px;">
	<div class="header_cont">
		<div class="header_info">
			<div class="info_tit">
				<p class="tit-basic">
					<span class="tit-ko">해슬리 나인브릿지</span> <span class="tit-area">한국,경기도</span>
				</p>				
				<p class="tit-en"><span class="tit-en1">HAESLEY NLNE BRIDGE</span></p>
			</div>				
		</div>
	</div>
<div class="header_tab">
            <div class="section">
                <ul class="tab-cont">
                    <li id="ground-info" class="btn3" data-target-class="tab1"><button data-flag="info">정보</button></li>
                    <li id="ground-price" class="btn3" data-target-class="tab3"><button data-flag="price" value="예약하기" onclick="go_pop()">예약하기</button></li>
                </ul>
            </div>
        </div>
        </div>
        
   <div class="clear"></div> 
      <div id="image">
	  <div id="image_1"><img src="./images/yeyag/goldlakecc.jpg" width="500" height="300"/></div>
            <div class="basic-txt">
                <div class="txt-box txt01">
                    <p><span>홀</span><span>18</span></p>
                    <p><span>파</span><span>72</span></p>
                    <p><span>길이</span><span>7256</span></p>
                    <p><span>잔디</span><span>벤트</span></p>
                </div>
                <div class="txt-box txt02">
                    <p><span>코스타입</span><span>산악</span></p>
                    <p><span>코스구성</span><span>HAESLEY/PGA</span></p>
                    <p><span>캐디</span><span>유</span></p>
                    <p><span>카트</span><span>도보</span></p>
                </div>
            </div>
        </div>
        
        <div class="info-detail">
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="far fa-calendar-alt"></i> 개장년도</span>
                <br>
                <span><br/>2009</span>
                
            </p>
            
         
            
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-user-cog"></i> 코스설계자</span>
                <br>
                <span><br/>DAVID DALE</span>
               
            </p>
           
            
            <p class="detail-des" style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-comment-alt"></i>소개</span>
                <br>
                <span><br/>"해가 솟는 마을"의 줄임말인 해슬리는 공동의 관심사를 가지고 있는 회원들이 비즈니스, 
	                		 사교 또는 휴양의 목적으로 만남을 가지는 THE BEST PRIVATE MEMBERS CLUB으로 미국의 골프 전문 잡지 골프 다이제스트가 발표하는 세계 100대 코스 중 29위에 선정되었으며 이번 선정에서 골프
	              		  	다이제스트는 "해슬리는 아일랜드 페어웨이와 그린이 있으며 도널드 트럼프가 질투할 만한 암벽 폭포도 조성되어 있다. 해슬리의 벙커는 담대하며 해안가의 무게감 있고 반짝이는 모래가 있다."고 설명하였다.
	                	 	설계자 데이비드 데일에 의해 매혹적이고 도전적인 플레이와 뛰어난 드라마를 제공할 수 있도록 착안되었으며 시간이 지날수록 코스가 제공하는 굉장한 즐거움으로 인해 회원들이 더 방문하게 될 것이다. 
	                	 	해슬리는 코스 전문가들과의 협업을 통해 코스 잔디 품질 개선 및 샷 밸류, 코스 레이아웃 등을 지속적으로 개선해 가고 있다. 독립적이고 친환경적인 건축 설계와 국내에서 처음 시도된 나무 기둥 형태의 꽃이 피는 모습을 
	                 		형상화한 예술적인 TIMBER STRUCTURE는 해슬리의 또 다른 자랑거리</span>
                 		
            </p>          
        </div>
        
        
    <div id="map" style="width:50%; height: 50vh; margin:40px 0px 0px 300px ;"></div>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a776efec500b4b608cd15346b5f8310"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.251852874014844, 127.6187266043035 ), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.251852874014844, 127.6187266043035 ); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

</script>
  
   <div class="clear"></div>  
   <br/><br/>
	<table style="font-family: Noto Sans KR, sans-serif;">
	<tr>
		<td rowspan="2" style="vertical-align: top; width: 300px; "><h4 style="margin: 10px 0 0 170px ;"><strong>오시는 길</strong></h4></td>

		<td style="width: 720px; ">

			<strong>주소</strong><br>

			<p style="margin-top: 5px;">경기도 여주시 명품1로76(연리동)해슬리 나인브릿지</p>

			<hr style="border-color: #d1d1d1;">

		</td>

	</tr>

	<tr>

		<td style="width: 720px; ">

			<strong>전화안내</strong><br>

			<p style=" margin-top: 5px;">T: 061-339-3000 / F: 061-339-3100</p>

		</td>

	</tr>

</table>

<hr style="padding: 0.1px; background-color: grey; width: 77%; margin-left: 6%"/>
<%-- <hr style="border-color: #000000;">--%>



<table style="font-family: Noto Sans KR, sans-serif;">	

	<tr>

		<td rowspan="2" style="vertical-align: top; width: 300px; "><h4 style="margin: 10px 0 0 170px ;"><strong>오시는 방법</strong></h4></td>

		<td style="width: 720px; ">

			<strong>자차로 이동</strong><br>

			<p style="margin-top: 5px;">경부고속도로</p>

			<p style="margin-top: 5px;">하남IC-신갈JC(강릉방향)-여주JC-남여주IC-HAESLEY </p>

		
			<%--<hr style="border-color: #d1d1d1;">--%>

		</td>

	</tr>

</table>

<hr style="padding: 0.1px; background-color: grey; width: 77%; margin-left: 6%"/>
<%-- <hr style="border-color: #000000;">--%>

<div class="wrap">
    <h1>후기</h1>
    <form name="reviewform" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 		
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
      <div class="review_contents">
            <div class="warning_msg"></div>
            <textarea rows="10"  class="review_textarea" style="width: 80% resize:none;"></textarea>
        </div>   
        <div class="cmd"> 
            <input type="button" name="save" id="save" value="등록">
        </div>
    </form>
</div>
<jsp:include page="/view/includes/footer.jsp" /> 
</html>