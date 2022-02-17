<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/logjoin.css">
<title>See 공간 : 회원 가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
 
	var nickJ = /^[a-z0-9]{2,12}$/;
	var nameJ = /^[A-Za-z가-힣]{2,6}$/;
	var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	var phoneJ = /^01(?:0|1|[6-9])?([0-9]{3,4})?([0-9]{4})$/;
	var inval_Arr = new Array(5).fill(false);

	// 회원가입 유효성검사
	$('#i-nickname').blur(function(){
		if(nickJ.test($('#i-nickname').val())){
			inval_Arr[0] = true;
			$('#nickname_check').text('');
			$('#i-nickname').css('border-color','#ccc');
		}else{
			$('#nickname_check').text('닉네임은 두 글자 이상(특수문자 입력 불가) 입력해주세요.');
			$('#i-nickname').css('border-color','red');
		}
	});
	$('#i-name').blur(function(){
		if(nameJ.test($('#i-name').val())){
			inval_Arr[1] = true;
			$('#name_check').text('');
			$('#i-name').css('border-color','#ccc');
		}else{
			$('#name_check').text('이름은 두 글자 이상(특수문자 입력 불가) 입력해주세요.');
			$('#i-name').css('border-color','red');
		}
	});
	$('#i-email').blur(function(){
		if(emailJ.test($('#i-email').val())){
			inval_Arr[2] = true;
			$('#email_check').text('');
			$('#i-email').css('border-color','#ccc');
		}else{
			$('#email_check').text('이메일의 형식이 올바르지 않습니다.');
			$('#i-email').css('border-color','red');
		}
	});
	$('#i-password').blur(function(){
		if(pwJ.test($('#i-password').val())){
			$('#pw_check').text('');
			$('#i-password').css('border-color','#ccc');
		}else{
			$('#pw_check').text('4~12자리의 문자 또는 숫자를 입력해주세요');
			$('#i-password').css('border-color','red');
		}
	});
	$('#i-confirm').on('blur keyup',function(){
		if($('#i-password').val() == $('#i-confirm').val()){
			inval_Arr[3] = true;
			$('#confirm_check').text('');
			$('#i-confirm').css('border-color','#ccc');
		}else{
			$('#confirm_check').text('비밀번호가 일치하지않습니다.');
			$('#i-confirm').css('border-color','red');
		}
	}); 
	$('#i-phone').blur(function(){
		if(phoneJ.test($('#i-phone').val())){
			inval_Arr[4] = true;
			$('#phone_check').text('');
			$('#i-phone').css('border-color','#ccc');
		}else{
			$('#phone_check').text('정확한 번호를 입력해주세요');
			$('#i-phone').css('border-color','red');
		}
	});

	$(document).on("click", "#btn-submit", function(){
		
		
			$("#form-signup").attr({
				'action' : "/members/join",
				'method' : "POST",
				'enctype' : "application/x-www-form-urlencoded"
			}).submit();
			
		
	});
});

</script>
</head>
<body>
<div class="wrap">
<header class="header">
	<%@include file="/commons/header.jsp" %>
</header>
<div class="content_wrap">
	<h1>${type} 회원가입</h1>
	<div class="log_join_wrap">
	<form name ="form-signup" id="form-signup" class="log_join_form">
		<input type ="text" id="i-nickname" name="nickname" placeholder="닉네임">
		<div class="form_check" id="nickname_check"></div>
		<input type ="text" id="i-name" name="name" placeholder="이름">
		<div class="form_check" id="name_check"></div>
		<input type ="text" id="i-email" name="email" placeholder="이메일">
		<div class="form_check" id="email_check"></div>
		<input type ="text" id= "i-password" name="password" placeholder="비밀번호">
		<div class="form_check" id="pw_check"></div>
		<input type ="text" id="i-confirm" placeholder="비밀번호 확인">
		<div class="form_check" id="confirm_check"></div>
		<input type ="text" id= "i-phone" name="phone" placeholder="휴대폰 번호">
		<div class="form_check" id="phone_check"></div>
		<input type = "hidden" name = "user_type" value=${type}>
	 	<input type="button" id="btn-submit" class="btn-submit" value="가입하기"/>
	</form>
	</div>
</div>
</div>

</body>
</html>