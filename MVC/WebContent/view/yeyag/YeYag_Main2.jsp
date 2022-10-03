<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="/view/includes/header.jsp" /> 
 <link rel="stylesheet" type="text/css" href="./css/YeYag_Main.css" />
</head>
<body>
<br/><br/>
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
					<span class="tit-ko">잭 니클라우스 GC 코리아</span><span class="tit-area">한국,인천</span>
				</p>				
				<p class="tit-en"><span class="tit-en1">JACK NICKLAUS GOLF CLUB KOREA</span></p>
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
	  <div id="image_1"><img src="./images/yeyag/JACK.jpg" width="500" height="300"/></div>
            <div class="basic-txt">
                <div class="txt-box txt01">
                    <p><span>홀</span><span>18</span></p>
                    <p><span>파</span><span>72</span></p>
                    <p><span>길이</span><span>7470</span></p>
                    <p><span>잔디</span><span>벤트</span></p>
                </div>
                <div class="txt-box txt02">
                    <p><span>코스타입</span><span>시사이드</span></p>
                    <p><span>코스구성</span><span>OUT/IN</span></p>
                    <p><span>캐디</span><span>유</span></p>
                    <p><span>카트</span><span>5인</span></p>
                </div>
            </div>
        </div>
        
        <div class="info-detail">
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="far fa-calendar-alt"></i> 개장년도</span>
                <br>
                <span><br/>2010</span>
                
            </p>
            
         
            
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-user-cog"></i> 코스설계자</span>
                <br>
                <span><br/>JACK NICKLAUS</span>
               
            </p>
           
            
            <p class="detail-des" style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-comment-alt"></i>소개</span>
                <br>
                <span><br/>"
				잭 니클라우스 골프클럽 코리아는 "골든 베어"로 상징되는 그의 이름을 내건 한국 내의 유일한 골프클럽으로 세계 최고 수준의 기준을 적용하여 설계되고 
				건설되었으며 토너먼트 티를 기준으로 7,413야드가 넘는 코스는 최정상급의 골퍼들도 도전해 보고 싶은 욕망을 불러일으킬 만하다. 
				다양한 티잉 그라운드와 함께 전략적 선택의 폭을 크게 함으로서 다양한 수준의 골퍼들이 모두 나름대로 즐겁게 경기할 수 있는 코스로 조성하였다.
				 훌륭한 골프코스란 바로 각 홀마다 특별하게 기억되는 요소가 있다는 것인데 잭 니클라우스 골프클럽 코리아는 도심형 골프코스로서 서해 바다의 풍광, 
				 페어웨이 빌라의 아름다운 정취와 도심의 빌딩 숲이 한데 어우러져 다양하고 이색적인 조망을 즐길 수 있다. 또한 국내 내륙 골프클럽에서는 드물게 티, 
				 그린은 물론 페어웨이까지 양잔디 중에서도 벤트그래스를 식재하여 뛰어난 샷 감각을 제공할 뿐만 아니라 사계절 푸르름을 유지하고 양탄자 위를 걷는 것 같은 
				 편안한 보행감으로 플레이어에게 차별화된 라운딩을 선사하고 있다. 첫 번째 티 샷에서부터 18번 그린의 마지막 퍼팅에 이르기까지 플레이어 자신의 기량을 
				 테스트하고 골퍼로서의 인내심과 정확성에 맞게 적절한 보상이 주어지며 플레이하는 모든 골퍼들에게 잊지 못할 라운딩의 추억을 안기기 위해 세심하게 설계되었다. 
				잭 니클라우스 골프클럽 코리아는 골프의 진정한 즐거움과 게임의 격을 즐길 줄 아는 골퍼들을 위한 클럽으로 오랜 세월 동안 회자될 진정한 명소가 될 것이다.</span>
                 		
            </p>          
        </div>
        
        
    <div id="map" style="width:50%; height: 50vh; margin:40px 0px 0px 300px ;"></div>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a776efec500b4b608cd15346b5f8310"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.38043678208038, 126.624363802242 ), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.38043678208038, 126.624363802242 ); 

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

			<p style="margin-top: 5px;">인천광역시 연수구 아카데미로209(송도동)</p>

			<hr style="border-color: #d1d1d1;">

		</td>

	</tr>

	<tr>

		<td style="width: 720px; ">

			<strong>전화안내</strong><br>

			<p style=" margin-top: 5px;">T: 032-850-8000 / F: 032-850-7678</p>

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

			<p style="margin-top: 5px;">영동고속도로</p>

			<p style="margin-top: 5px;">월곳JC-제3경인고속도로-고잔TG-고잔지하차도-송도방향으로진출 </p>

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