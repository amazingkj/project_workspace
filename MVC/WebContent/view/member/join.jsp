<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<div class="clear"></div>
<script src="./js/jquery.js"></script>

<script>
   function join_check() {
      if ($.trim($('#id').val()) == '') {//trim()함수는 양쪽 공백을 제거
         alert('아이디를 입력하세요!');
         $('#id').val('').focus();
         return false;
      }

      if ($.trim($('#pw').val()) == '') {
         alert('비밀번호를 입력하세요!');
         $('#pw').val('').focus();
         return false;
      }

      if ($.trim($('#pw').val()) == '') {
          alert('비밀번호를 입력하세요!');
          $('#pw').val('').focus();
          return false;
       }

      
      if ($.trim($('#pwCheck').val()) == '') {
         alert('비밀번호를 다시 한 번 입력하세요!');
         $('#pwCheck').val('').focus();
         return false;
      }
      
      if ($.trim($('#phone').val()) == '') {
         alert('휴대폰 번호를 입력하세요!');
         $('#phone').val('').focus();
         return false;
      }
      
      if ($.trim($('#email').val()) == '') {
         alert('이메일을 입력하세요!');
         $('#email').val('').focus();
         return false;
      }
      
      if ($.trim($('input[name=gender]:radio:checked').val()) == '') {
          alert('성별을 선택하세요');
          $('#email').val('').focus();
          return false;
       }
      
   }
   
 //중복아이디 검색
   function id_Check(){
    /* copy begin */
   	$("#id_Check").hide();
   	//아이디 영역을 숨김
   	$m_id=$.trim($("#m_id").val());
   	//1.입력글자 길이 체크
   	if($mem_id.length < 4){
   		$newtext='<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
   		$("#id_Check").text('');
   		//idcheck 아이디 영역 문자열을 초기화
   		$("#id_Check").show();
   		//idcheck 아이디 영역을 보이게 함.
   		$("#id_Check").append($newtext);
   		//idcheck영역에 문자열을 추가
   		$("#m_id").val('').focus();
   		return false;
   	};
   	if($m_id.length > 12){
   		$newtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
   		$("#id_Check").text('');
   		//idcheck 아이디 영역 문자열을 초기화
   		$("#id_Check").show();
   		//idcheck 아이디 영역을 보이게 함.
   		$("#id_Check").append($newtext);
   		//idcheck영역에 문자열을 추가
   		$("#m_id").val('').focus();
   		return false;
   	};
   	//2.입력글자 확인
   	if(!(validate_userid($mem_id))){
   		$newtext='<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
   		$("#id_Check").text('');
   		$("#id_Check").show();
   		$("#id_Check").append($newtext);
   		$("#m_id").val('').focus();
   		return false;
   	};
   	//아이디 중복확인
       $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 비동기식 아작스 실행
           type:"POST",//데이터를 서버로 보내는 방법
          //url:"./member/member_idcheck.jsp",    
           url:"idcheck.do", //아작스 서버 주소 파일명
           data: {"id":$m_id},  //좌측 id 피라미터 이름에 우측 $mem_id변수값을 저장
           datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
           success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           	//서버 데이터를 data변수에 저장
         	  if(data==1){//중복 아이디가 있다면
         		$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
         		$("#idcheck").text('');
           	$("#id_Check").show();
           	$("#id_Check").append($newtext);          		
             	$("#m_id").val('').focus();
             	return false;
   	     
         	  }else{//중복 아이디가 아니면
         		$newtext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
         		$("#id_Check").text('');
         		$("#id_Check").show();
         		$("#id_Check").append($newtext);
         		$("#m_pw").focus();
         	  }  	    	  
           },
       	  error:function(){//비동기식 아작스로 서버디비 데이터를
       		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
       		  alert("data error");
       	  }
         });//$.ajax
    /* end */	
   
   
   
   
</script>

<%-- 회원가입 페이지 --%>

<body class="join">

<form name="m" method="post" action="join_ok.do" onsubmit="return join_check();">      
<div class="joinForm">
<input type="text" name="m_id" id="m_id" class="textField" placeholder="아이디">
<input type=button class="CheckBtn" id="id_Check" value=중복확인  onclick="idCheck();"/>
<input type="password" name="m_pw" id="m_pwd" class="textField" placeholder="비밀번호"><br>
<input type="password" name="pwCheck" id="pwCheck" class="textField" placeholder="비밀번호 확인"><br>
<input type="tel" name="m_phone" class="textField" id="phone"pattern="^[0][1][0]-\d{4}-\d{4}$" placeholder="휴대폰 번호"><br>
<input type="email" name="m_email" id="m_email" class="textField" placeholder="이메일"><br>
<input type="button" class="CheckBtn" value=이메일인증>
<input type="radio" name="m_gender" id="m_gender" class="gender" value="male"><label id="m_gender">남</label>
<input type="radio" name="m_gender" id="m_gender" class="gender" value="female"><label id="m_gender">여</label>
<input type="submit" class="submitBtn" value=회원가입>
</div>
</form>
</body>

