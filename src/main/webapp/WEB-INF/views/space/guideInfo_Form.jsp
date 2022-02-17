<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sp_common.css">
<link rel="stylesheet" href="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<% 
HttpSession httpSession = request.getSession(true);

String tbsp_num = (String) httpSession.getAttribute("tbsp_num");


if(tbsp_num == null){
	tbsp_num="";	
}
	%>
<script type="text/javascript">
	
	$(document).ready(function() {

		/* DayOff Add*/
		$(".add_result").css("display","none");
		$(document).on("click",".dayoff_add",function(){
			$("#dayoff_pop").css("display","block");
		});
		
		$(document).on("click",".dayoff_pop_close",function(){
			$("#dayoff_pop").css("display","none");
		});
		
		$(document).on("click",".btn_next_pop",function(){
			$('.add_result').html("<span>"+$("#tbsp_dayoff").val()+"</span>"+
						"<span>  "+$("#tbsp_dayoff_start").val()+" ~ </span>"+
						"<span>"+$("#tbsp_dayoff_end").val()+"</span>");
			$("#dayoff_pop").css("display","none");
			$(".add_result").css("display","block");
			$('.dayoff_add_text').text("휴무일 수정");
			
		});
		
		 /* DatePicker */
		 $("#tbsp_dayoff_start").datepicker({
                dateFormat: 'yy-mm-dd' 
		});
		 $("#tbsp_dayoff_end").datepicker({
             dateFormat: 'yy-mm-dd' 
		});
		
		
		$(document).on("click", "#sp3_next", function() {
			if($("#tbsp_cost").val() == ""){
			      alert("시간당 금액을 입력해주세요.");
			      $("#tbsp_cost").focus();
			      return;
			 }
			
			/* 편의시설 체크박스 tbsp_convenient */
			for(i = 1; i < 10; i++){
				if($('#tbsp_convenient'+[i]).val()=='on'){
					$('#tbsp_convenient'+[i]).val('Y');
				}
			}
			$('#guideInfo_Form').attr({
				'action' : 'guideInfo_Insert.sgg',
				'method' : 'POST',
				'enctype' : 'application/x-www-form-urlencoded'
			}).submit();
		});
	});

</script>

<title>SEE0GAN 호스트</title>
</head>
<body>
<div class="wrap">
<header class="header">
	<div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>이용안내</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
</header>
<div class="content_wrap">
<form name="guideInfo_Form" id="guideInfo_Form">
<section id="sp_contents" class="sp_contents">
<input type="text" name="tbsp_num"  value="<%= tbsp_num %>" style="display:none;">
<div class="heading">
	<h3>이용 정보를 입력해주세요.</h3>
	<div class="required">
		<span class="required_s">*</span>
		<span class="required_txt">필수입력</span>
	</div>
</div>
<div class="flex_wrap">
<div class="box_form">
<span class="title">
	이용시간
	<span class="required_s">*</span>
	<input type="checkbox" value=""/>24시 운영
</span>
<select name="tbsp_time_start">
	<c:forEach  var="i" begin="0" end="9" step="1">
		<option value="0${i}"><c:out value="0${i}시"/></option>
	</c:forEach>
	<c:forEach  var="i" begin="10" end="24" step="1">
		<option value="${i}"><c:out value="${i}시"/></option>
	</c:forEach>
</select>부터
<select name="tbsp_time_end">
	<c:forEach  var="i" begin="0" end="9" step="1">
		<option value="0${i}"><c:out value="0${i}시"/></option>
	</c:forEach>
	<c:forEach  var="i" begin="10" end="24" step="1">
		<option value="${i}"><c:out value="${i}시"/></option>
	</c:forEach>
</select>까지
<p>실제로 공간공유가 가능한 시간을 입력해주세요.</p>
</div>
<div class="box_form">	
<span class="title">
	정기휴무
	<span class="required_s">*</span>
	<!-- <input type="checkbox" value=""/>공휴일 휴무 -->
</span>
<select name="tbsp_r_dayoff" >
	<option value="NONE">휴무없음</option>
	<option value="mon">월요일</option>
	<option value="tue">화요일</option>
	<option value="wed">수요일</option>
	<option value="thu">목요일</option>
	<option value="fri">금요일</option>
	<option value="sat">토요일</option>
	<option value="sun">일요일</option>
</select>

</div>
</div>

<div class="heading">
	<h3>지정 휴무일 추가</h3>
</div>
<div class="box_form">
	<div class="add_result"></div>
	<div class="dayoff_add">
		<span class="dayoff_add_text">휴무일 추가+</span>
	</div>
	
</div>

<div class="heading">
	<h3>시간당 가격</h3>
	<span class="required_s">*</span>
</div>
<div class="box_form">
	<input type="text" name="tbsp_cost" id="tbsp_cost" required/>원
</div>
<div class="heading">
	<h3>편의 시설</h3>
</div>
<div class="box_form convenient">	
	<ul>
	<li>
		<input type="checkbox" name="tbsp_convenient1" id="tbsp_convenient1">
		<label for="tbsp_convenient1">TV/프로젝터</label>
	</li>
	<li>
		<input type="checkbox" name=tbsp_convenient2 id="tbsp_convenient2">
		<label for="tbsp_convenient2">인터넷/WIFI</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient3" id="tbsp_convenient3">
		<label for="tbsp_convenient3">복사/인쇄기</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient4" id="tbsp_convenient4">
		<label for="tbsp_convenient4">음향/마이크</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient5" id="tbsp_convenient5">
		<label for="tbsp_convenient5">의자/테이블</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient6" id="tbsp_convenient6">
		<label for="tbsp_convenient6">전신거울</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient7" id="tbsp_convenient7">
		<label for="tbsp_convenient7">샤워시설</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient8" id="tbsp_convenient8">
		<label for="tbsp_convenient8">음식/주류반입가능</label>
	</li>
	<li>
		<input type="checkbox" name="tbsp_convenient9" id="tbsp_convenient9">
		<label for="tbsp_convenient9">주차</label>
	</li>
</ul>
</div>
</section>
<div class="sp_btn_bottom">
<span class="btn_wrap">
	<input type="button" class="btn_prev" value="이전">
</span>
<span class="btn_wrap">
	<input type="button" class="btn_next" id="sp3_next" value="저장">
</span>
</div>
<!-- 지정 휴무일 팝업 -->
<div id="dayoff_pop">
<div class="pop_header">
	지정 휴무일 수정/추가
	<span class="dayoff_pop_close">X</span>
</div>
<div class="pop_container">
	<div class="heading">휴무일명
		<span class="required_s">*</span>
	</div>
	<input type="text" name="tbsp_dayoff" id="tbsp_dayoff" placeholder="휴무일명을 입력해주세요." value="">
	<div class="heading">날짜
		<span class="required_s">*</span>
	</div>
	<input readonly type="text" name="tbsp_dayoff_start" id="tbsp_dayoff_start" placeholder="ex) 1991/1/1">
	<input readonly type="text" name="tbsp_dayoff_end" id="tbsp_dayoff_end" >
	<div class="heading">요일
		<span class="required_s">*</span>
	</div>
	<div class="box_form">
		<select name="tbsp_dayoff2" id="tbsp_dayoff2">
			<option value="every">매일</option>
			<option value="mon">월요일</option>
			<option value="tue">화요일</option>
			<option value="wed">수요일</option>
			<option value="thu">목요일</option>
			<option value="fri">금요일</option>
			<option value="sat">토요일</option>
			<option value="sun">일요일</option>
		</select>
	</div>
	<div class="sp_btn_pop">
		<input type="button" class="btn_next_pop" value="저장">
	</div>
</div>

</div>
</form>
</div>
</div>

</body>
</html>