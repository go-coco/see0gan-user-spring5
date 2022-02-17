<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/logjoin.css">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	var inval_Arr = new Array(5).fill(false);
	
	$('.email').blur(function(){
		if(emailJ.test($('.email').val())){
			$('#email_check').text('');
			$('.email').css('border-color','#ccc');
		}else{
			$('#email_check').text('이메일의 형식이 올바르지 않습니다.');
			$('.email').css('border-color','red');
		}
	});
	$('.pw').blur(function(){
		if(pwJ.test($('.pw').val())){
			$('#pw_check').text('');
			$('.pw').css('border-color','#ccc');
		}else{
			$('#pw_check').text('4~12자리의 문자 또는 숫자를 입력해주세요');
			$('.pw').css('border-color','red');
		}
	});


</script>
</head>
<body>



<div class="wrap">
<header class="header">
	<%@include file="/commons/header.jsp" %> 
</header>
<div class="content_wrap">
	<h1>${type_ko} 로그인</h1>
	<div class="log_join_wrap">
		
	<!-- 	<button><img src = "resources/icon/kakao_login_medium_wide.png"></button> -->
		<form name ="form-login" id="form-login" class="log_join_form" method = "POST" action ="/authenticate">
			<input type="text" class="email" placeholder ="이메일" name="userId" id="idVal"/>
			<div class="form_check" id="email_check"></div>
			<input type="password" class="pw" placeholder ="비밀번호" name="password" id="pwVal"/>
			<div class="form_check" id="pw_check"></div>
			
			<input type="submit" id="btn-submit" class="btn-submit" value="로그인"/>
		</form>
		<div class="no_mem">아직 스페이스 클라우드 회원이 아니신가요? <br>
			
			<a href="/${type}/joinform" class="join_link">${type_ko} 회원가입</a>
		</div>
	</div>
</div>
</div>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<a id="custom-login-btn" onclick="loginWithKakao()"> <!-- href="javascript:loginWithKakao()" -->
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<p id="token-result"></p>
<script type="text/javascript">
Kakao.init('1d6d0d86bdca1e0385ca83591eb0206e');
console.log(Kakao.isInitialized()); 
displayToken();


function loginWithKakao() {

$.ajax({
	url : '/login/getKakaoAuthUrl',
	type : 'get',
	dataType : 'text',
	success : function(res){
	location.href = res;
	}
})
}

/* $(document).ready(function() {
	$.ajax({
		url : '/login/kakao',
		type : 'get',
		dataType : 'text',
		success : function(res){
		location.href = res;
		}
	});
}); */
/*   function loginWithKakao() {
     alert('click!');
 */	/*   Kakao.Auth.authorize({
     // redirectUri: 'http://localhost:8088/member'
     redirectUri: 'http://localhost:8088/member/loginform'
   //  client_id: '1d6d0d86bdca1e0385ca83591eb0206e'
    //	  response_type: 'code'
    });  */
   /*  Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj))
        },
        fail: function(err) {
          alert(JSON.stringify(err))
        },
      })
	 *//* 	  success : function(res){	  
		console.log(res);
			   	  Kakao.API.request({
			    url: '/v2/user/me',
			    success: function(response) {
			        console.log(response);
			    },
			    fail: function(error) {
			        console.log(error);
			    }
		  }) 
		  },
	  	fail: function(error) {
	        console.log(error);
	  }
	  }) */
	  
//  }
  // 아래는 데모를 위한 UI 코드입니다.
  //	  loginInfo();
  function loginInfo(){
	 console.log("get");
	  Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(response) {
		        console.log(response);
		    },
		    fail: function(error) {
		        console.log(error);
		    }
		});
	  }

  function displayToken() { 
    const token = getCookie('authorize-access-token');
   console.log(token);
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
</script>

</body>
</html>
