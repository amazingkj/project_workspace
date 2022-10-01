/**
 * member.js
 */
  function join_check() {
      if ($.trim($('#m_id').val()) == '') {//trim()함수는 양쪽 공백을 제거
         alert('아이디를 입력하세요!');
         $('#m_id').val('').focus();
         return false;
      }

      if ($.trim($('#m_pwd').val()) == '') {
         alert('비밀번호를 입력하세요!');
         $('#m_pwd').val('').focus();
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
      
      if ($.trim($('#m_email').val()) == '') {
         alert('이메일을 입력하세요!');
         $('#m_email').val('').focus();
         return false;
      }
      
      if ($.trim($('input[name=m_gender]:radio:checked').val()) == '') {
          alert('성별을 선택하세요');
          $('#m_email').val('').focus();
          return false;
       }
       
  
      
   }
   
 //중복아이디 검색
   function id_Check(){
    /* copy begin */
   	$("#idcheck").hide();
   	//아이디 영역을 숨김
   	$m_id=$.trim($("#m_id").val());
   	//1.입력글자 길이 체크
   	if($m_id.length < 4){
   		$newtext='<font color="red" size="2"><b>아이디는 4자 이상이어야 합니다.</b></font>';
   		$("#idcheck").text('');
   		//idcheck 아이디 영역 문자열을 초기화
   		$("#idcheck").show();
   		//idcheck 아이디 영역을 보이게 함.
   		$("#idcheck").append($newtext);
   		//idcheck영역에 문자열을 추가
   		$("#m_id").val('').focus();
   		return false;
   	};
   	if($m_id.length > 12){
   		$newtext='<font color="red" size="2"><b>아이디는12자 이하이어야 합니다.</b></font>';
   		$("#idcheck").text('');
   		//idcheck 아이디 영역 문자열을 초기화
   		$("#idcheck").show();
   		//idcheck 아이디 영역을 보이게 함.
   		$("#idcheck").append($newtext);
   		//idcheck영역에 문자열을 추가
   		$("#m_id").val('').focus();
   		return false;
   	};
   	//2.입력글자 확인
   	if(!(validate_userid($m_id))){
   		$newtext='<font color="red" size="2"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
   		$("#idcheck").text('');
   		$("#idcheck").show();
   		$("#idcheck").append($newtext);
   		$("#m_id").val('').focus();
   		return false;
   	};
   	
    

   	//아이디 중복확인
       $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 비동기식 아작스 실행
           type:"POST",//데이터를 서버로 보내는 방법
          //url:"./member/member_idcheck.jsp",    
           url:"idcheck.do", //아작스 서버 주소 파일명
           data: {"id":$m_id},  //좌측 id 피라미터 이름에 우측 $m_id변수값을 저장
           datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
           success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           	//서버 데이터를 data변수에 저장
         	  if(data==1){//중복 아이디가 있다면
         		$newtext='<font color="red" size="2"><b>중복 아이디입니다.</b></font>';
         		$("#idcheck").text('');
           	$("#idcheck").show();
           	$("#idcheck").append($newtext);          		
             	$("#m_id").val('').focus();
             	return false;
   	     
         	  }else{//중복 아이디가 아니면
         		$newtext='<font color="blue" size="2"><b>사용가능한 아이디입니다.</b></font>';
         		$("#idcheck").text('');
         		$("#idcheck").show();
         		$("#idcheck").append($newtext);
         		$("#m_pw").focus();
         	  }  	    	  
           },
       	  error:function(){//비동기식 아작스로 서버디비 데이터를
       		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
       		  alert("data error");
       	  }
         });//$.ajax
    /* end */	
   

}


   function email_Check(){  //작업중 더블체크할 것 

	//이메일 중복확인
       $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 비동기식 아작스 실행
           type:"POST",//데이터를 서버로 보내는 방법
           url:"emailcheck.do", //아작스 서버 주소 파일명
           data: {"email":$m_email},  
           datatype:"String",//서버의 실행된 결과값을 사용자로 받아오는 방법
           success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           	//서버 데이터를 data변수에 저장
         	  if(data==1){//중복 아이디가 있다면
         		$newtext='<font color="red" size="2"><b>중복 이메일이 있습니다.</b></font>';
         		$("#emailcheck").text('');
           	$("#emailcheck").show();
           	$("#emailcheck").append($newtext);          		
             	$("#m_email").val('').focus();
             	return false;
   	     
         	  }else{//중복 아이디가 아니면
         		$newtext='<font color="blue" size="2"><b>사용가능한 이메일입니다.</b></font>';
         		$("#emailcheck").text('');
         		$("#emailcheck").show();
         		$("#emailcheck").append($newtext);
         		$("#m_pw").focus(); //포커스값 재설정 하기
         	  }  	    	  
           },
       	  error:function(){//비동기식 아작스로 서버디비 데이터를
       		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
       		  alert("data error");
       	  }
         });//$.ajax
    /* end */	


}





//정규표현식
function validate_userid($m_id)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
  //자와 숫자 와 _조합으로 처리
  return pattern.test($m_id);
};


//메일 주소 선택과 직접입력
function domain_list(){
  var num=m.mail_list.selectedIndex;//선택한 목록 항목 번호
  if(num == -1){//목록이 선택되지 않았을때 실행
	  return true;
  }
  if(m.mail_list.value =="직접입력"){
	  m.mail_domain.value = "";
	  m.mail_domain.readOnly=false;//쓰기 가능
	  m.mail_domain.focus();//입력박스로 포커스 이동
  }else{//목록에서 멜주소를 선택한 경우
	 m.mail_domain.value=m.mail_list.options[num].value;
	 //목록 옵션 value값이 멜도메인 입력박스로 입력
	 m.mail_domain.readOnly=true;//읽기만 가능
  }
}//domain_list()

//member_edit.jsp 유효성 검증
function edit_check(){
	$mem_pwd=$.trim($("#mem_pwd").val());
	$mem_pwd2=$.trim($("#mem_pwd2").val());
	if($mem_pwd == ""){
		alert("비번을 입력하세요!");
		$("#mem_pwd").val("").focus();
		return false;
	}
	if($mem_pwd2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mem_pwd2").val("").focus();
		return false;
	}
	if($mem_pwd != $mem_pwd2){
		alert("비번이 다릅니다!");
		$("#mem_pwd").val("");//비번 입력박스를 초기화
		$("#mem_pwd2").val("");
		$("#mem_pwd").focus();
		return false;
	}
	if($.trim($("#mem_name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#mem_name").val("").focus();
		return false;
	}
	if($.trim($("#mem_zip").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}
	if($.trim($("#mem_zip2").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}
	if($.trim($("#mem_addr").val())==""){
		alert("주소를 입력하세요!");		
		return false;
	}
	if($.trim($("#mem_addr2").val())==""){
		alert("나머지 주소를 입력하세요!");
		$("#mem_addr2").val("").focus();
		return false;
	}
	if($.trim($("#mem_phone02").val())==""){
		alert("폰번호를 입력하세요!");
		$("#mem_phone02").val("").focus();
		return false;
	}
	if($.trim($("#mem_phone03").val())==""){
		alert("폰번호를 입력하세요!");
		$("#mem_phone03").val("").focus();
		return false;
	}
	if($.trim($("#mail_id").val())==""){
		alert("전자우편을 입력하세요!");
		$("#mail_id").val("").focus();
		return false;
	}
	if($.trim($("#mail_domain").val())==""){
		alert("전자우편을 입력하세요!");		
		return false;
	}
}//edit_check()









































