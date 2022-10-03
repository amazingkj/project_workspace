<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="./css/YeYag_Main.css" />
<meta charset="UTF-8">
<title></title>
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

<div class="section" style="margin:150px 0px 0px 0px;">
	<div class="header_cont">
		<div class="header_info">
			<div class="info_tit">
				<p class="tit-basic">
					<span class="tit-ko">소노 펠리체 CC</span> <span class="tit-area">한국,강원도</span>
				</p>				
				<p class="tit-en"><span class="tit-en1">SONO FELICE COUNTRY CLUB</span></p>
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
	  <div id="image_1"><img src="./images/yeyag/SONO.jpg" width="500" height="300"/></div>
            <div class="basic-txt">
                <div class="txt-box txt01">
                    <p><span>홀</span><span>18</span></p>
                    <p><span>파</span><span>72</span></p>
                    <p><span>길이</span><span>7235</span></p>
                    <p><span>잔디</span><span>벤트</span></p>
                </div>
                <div class="txt-box txt02">
                    <p><span>코스타입</span><span>산악</span></p>
                    <p><span>코스구성</span><span>HEALING/ECO</span></p>
                    <p><span>캐디</span><span>유</span></p>
                    <p><span>카트</span><span>5인</span></p>
                </div>
            </div>
        </div>
        
        <div class="info-detail">
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="far fa-calendar-alt"></i> 개장년도</span>
                <br>
                <span><br/>2013</span>
                
            </p>
            
         
            
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-user-cog"></i> 코스설계자</span>
                <br>
                <span><br/>DAVID-PIERRE JALICON</span>
               
            </p>
           
            
            <p class="detail-des" style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-comment-alt"></i>소개</span>
                <br>
                <span><br/>하늘과 맞닿은 정상에서 최적의 라운딩을. 세계적인 건축가 다비드 피에르 잘리콩의 야심작으로 태어난 소노 펠리체 컨트리클럽은 차가운 세상에서 
      		 	동화 속 유토피아로 가까워지는 방법이다. 코스 전장 6,630m, 총 면적 1,322,655㎡에 달하는 광활한 천혜의 자연 지형을 그대로 보여주고 있으며 짙은 녹음을 헤치고 
      			 편안히 보이는 푸른 초원과 잔잔히 빛나는 호수는 팔봉산의 아름다운 명작을 펼쳐준다. 하늘에 맞닿아 꿈으로 가는 세계, 누구도 쉽게 넘보지 못하는 바로 그 곳에서 나만을 위한 
      		 	최적의 라운딩을 경험해볼 수 있다. 약 18,800㎡의 빛나는 호수와 품격있는 자연으로 이제까지 보지 못한 경이로운 풍광으로 새로운 감동을 주는 HEALING 
               	코스와 장엄한 산 가운데 보이는 푸른 초원과 계곡 등 친환경적인 설계 속에 한층 더 편안한 라운딩을 도와주는 ECO 코스로 구성되어 있다.</span>
                 		
            </p>          
        </div>
        
        
    <div id="map" style="width:50%; height: 50vh; margin:40px 0px 0px 300px ;"></div>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a776efec500b4b608cd15346b5f8310"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(38.208906528531045, 128.4991935895657 ), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(38.208906528531045, 128.4991935895657 ); 

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

			<p style="margin-top: 5px;">강원도 홍천군 서면 한치골길 541번길 123</p>

			<hr style="border-color: #d1d1d1;">

		</td>

	</tr>

	<tr>

		<td style="width: 720px; ">

			<strong>전화안내</strong><br>

			<p style=" margin-top: 5px;">T: 1644-0063</p>

		</td>

	</tr>

</table>

		<hr style="padding: 0.1px; background-color: grey; width: 77%; margin-left: 6%"/>
<%-- <hr style="border-color: #000000;">--%>



<table style="font-family: Noto Sans KR, sans-serif;">	

	<tr>

		<td rowspan="2" style="vertical-align: top; width: 300px; "><h4 style="margin: 10px 0 0 170px ;"><strong>오시는 방법</strong></h4></td>

		<td style="width: 720px; ">

			<strong>자차로이동</strong><br>

			<p style="margin-top: 5px;">서울 출발</p>

			<p style="margin-top: 5px;">서울-강일IC-서울-춘천 고속도로-남춘천IC-비발디파크 </p>

			
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
            <textarea rows="10" class="review_textarea"></textarea>
        </div>   
        <div class="cmd">
            <input type="button" name="save" id="save" value="등록">
        </div>
    </form>
</div>
<jsp:include page="/view/includes/footer.jsp" /> 
</html>