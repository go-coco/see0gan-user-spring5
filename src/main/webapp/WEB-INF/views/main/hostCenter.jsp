<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/hostcenter.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>호스트 센터</title>
</head>
<body>
<div class="wrap">
<header class="header">
	<div class="subheader_wrap">
		<div class="header_logo hostcenter_logo">
			<a href="/main.jsp">see0gan</a>
			<span>호스트 센터</span>
		</div>
		<button class="btn_menu" onclick="location.href='/mypage.sgg'">
			<img id="icon_menu" alt="메뉴" src="/resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
</header>
<div class="content_wrap">
	<section class="host_section" id="host_section1">
		<div class="host_main_txt">지금 MZ세대들을 위한 <br> 공간비즈니스를 시작해보세요!</div>
		<div>
			<a href="/space/register" class="hostc_btn">공간 등록하기</a>
			<a href="/host/loginform" class="hostc_btn">호스트 로그인</a>
		</div>
		<div class="host_sub_txt">
			<span class="text-title">| 등록 가능 공간 |</span>
			<span class="text-content"> 모임 · 촬영  · 연습 · 행사 · 회의까지</span>
		</div>
	<img src="/resources/icon/hostcenter_main.jpg" width="400px">
	</section>
	<section class="host_section" id="host_section2">
		<div class="text">
			<div>KOSMO No.1 공간공유 플랫폼,</div>
			<div>see0gan의 호스트가 되세요!</div>
		</div>
		<div id="hostjoin_btn">
			<a href="/host/join.sgg" class="hostc_btn">호스트 회원가입</a>
		</div>
	</section>
	<section class="host_section" id="host_section3">
		<div class="title">공지사항</div>

	</section>
	<!-- <a href="/host/hostCenter.sgg"><button>호스트센터</button></a><br><br>
	 -->
	 <!-- <a href="/login/kakaoLogin.sgg"><button>카카오 로그인</button></a><br>
	<a href="/host/idInquiry.sgg">아이디 찾기</a>
	<a href="/host/pwInquiry.sgg">비밀번호 찾기</a> <hr> 
	<a href="/space/hostInfo_Select.sgg">공간등록3,4</a><br>
	<a href="/host/hostLogin.sgg"><button>로그인</button></a><br><br>	
	
	
	-->
</div>
<footer class="footer">
	<%@include file="/commons/footer.jsp" %>
</footer>
</div>
</body>
</html>