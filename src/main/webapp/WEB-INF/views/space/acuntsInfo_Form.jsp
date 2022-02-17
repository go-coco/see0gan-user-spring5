<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sp_common.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<% 
HttpSession httpSession = request.getSession(true);

String tbsp_num = (String) httpSession.getAttribute("tbsp_num");


if(tbsp_num == null){
	tbsp_num="";	
}
	%>
<script type="text/javascript">
	$(document).ready(function() {
	
		/* 이메일 */
		$("#tbb_email3").on("change",function(){
			var $selected = $(this).val();
			if($selected == "직접 입력"){
				$('#tbb_email2').prop("disabled",false);
				$('#tbb_email2').val("");
			}else{
				$('#tbb_email2').val($selected);
				$('#tbb_email2').prop("disabled",true);
			}
			
		});
		/* 문자열 폼 가리기 */
		$("#tbc_res_num").css("display","none");
		$("#tbb_email").css("display","none");
		$("#tbb_tel").css("display","none");
		
		
		$(document).on("click", "#sp4_next", function() {
			console.log("acuntsInfo_insert.sgg >>> : ");
		
			/* 유효성 검사 */
			if($("#tbc_name").val() == ""){
			      alert("상호명을 입력해주세요.");
			      $("#tbc_name").focus();
			      return;
			 }
			if($("#tbc_ceo").val() == ""){
			      alert("대표자명을 입력해주세요.");
			      $("#tbc_ceo").focus();
			      return;
			 }
			if($("#tbc_res_num1").val() == ""){
			      alert("사업자 등록번호를 입력해주세요.");
			      $("#tbc_res_num1").focus();
			      return;
			 }
			if($("#tbc_res_num2").val() == ""){
			      alert("사업자 등록번호를 입력해주세요.");
			      $("#tbc_res_num2").focus();
			      return;
			 }
			if($("#tbc_res_num3").val() == ""){
			      alert("사업자 등록번호를 입력해주세요.");
			      $("#tbc_res_num3").focus();
			      return;
			 }
			/* if (!$("input:checked[class='tbc_type']").is(":checked")){
				alert("사업자 유형을 선택해주세요.");
				$(".tbc_type").focus();
				return;
			} */
			if($("#tbc_mainbizstat").val() == ""){
			      alert("주업태를 입력해주세요.");
			      $("#tbc_mainbizstat").focus();
			      return;
			 }
			if($("#tbc_maintheme").val() == ""){
			      alert("주종목을 입력해주세요.");
			      $("#tbc_maintheme").focus();
			      return;
			 }
			if($("#tbc_addr1").val() == ""){
			      alert("사업장 주소를 입력해주세요.");
			      $("#tbc_addr1").focus();
			      return;
			 }
			if($("#tbc_addr2").val() == ""){
			      alert("상세 주소를 입력해주세요.");
			      $("#tbc_addr2").focus();
			      return;
			 }
			if($("#tbb_email1").val() == ""){
			      alert("정산용 이메일을 입력해주세요.");
			      $("#tbb_email1").focus();
			      return;
			 }
			if($("#tbb_email2").val() == ""){
			      alert("정산용 이메일을 입력해주세요.");
			      $("#tbb_email2").focus();
			      return;
			 }
			if($("#tbb_tel1").val() == ""){
			      alert("정산용 연락처를 입력해주세요.");
			      $("#tbb_tel1").focus();
			      return;
			 }
			if($("#tbb_tel2").val() == ""){
			      alert("정산용 연락처를 입력해주세요.");
			      $("#tbb_tel2").focus();
			      return;
			 }
			if($("#tbb_tel3").val() == ""){
			      alert("정산용 연락처를 입력해주세요.");
			      $("#tbb_tel3").focus();
			      return;
			 }
			if($("#tbb_name").val() == ""){
			      alert("은행명을 입력해주세요.");
			      $("#tbb_name").focus();
			      return;
			 }
			 if($("#tbb_acuntnum").val() == ""){
			      alert("계좌번호를 입력해주세요.");
			      $("#tbb_acuntnum").focus();
			      return;
			 }if($("#tbb_depositor").val() == ""){
			      alert("예금주를 입력해주세요.");
			      $("#tbb_depositor").focus();
			      return;
			 }
			/* 사업자 등록번호 문자열 */
			var res_num_str = $("#tbc_res_num1").val()+$("#tbc_res_num2").val()+$("#tbc_res_num3").val();
			$("#tbc_res_num").val(res_num_str);
			
			/* 이메일 문자열 */
			var email_str = $("#tbb_email1").val()+"@"+$("#tbb_email2").val();
			$("#tbb_email").val(email_str);
			
			/* 정산용 연락처 문자열 */
			var tel_str = $("#tbb_tel1").val()+$("#tbb_tel2").val()+$("#tbb_tel3").val();
			$("#tbb_tel").val(tel_str);
			/* 입력 데이터 전송 */
			$('#acuntsInfo_Form').attr({
				'action' : 'acuntsInfo_Insert.sgg',
				'method' : 'POST',
				'enctype' : 'application/x-www-form-urlencoded'
			}).submit();
		});
	});
</script>
<script>
$(document).on("click", "#addr_search", function() {
    new daum.Postcode({
        oncomplete: function(data) {
        	$("#tbc_addr1").val(data.address);
        }
    }).open();
});
</script>
<title>스페이스 클라우드 호스트</title>
</head>
<body>
<div class="wrap">
<header class="header">
	<div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>정산 정보</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
</header>
<div class="content_wrap">
<form id="acuntsInfo_Form">
<section id="sp_contents" class="sp_contents">
<input type="text" name="tbsp_num"  value="<%= tbsp_num %>" style="display:none;">
<!-- <div class="heading">
	<h3>예약방법</h3>
	<div class="required">
		<span class="required_s">*</span>
		<span class="required_txt">필수입력</span>
	</div>
</div>
<div class="flex_wrap">
	<div class="choice"> -->
		<input type="hidden" name="tbsp_bok_type" id="tbsp_bok_type1" class="radio" value="NOW_PAY" checked readonly>
<!-- 		<label for="way1">바로결제</label>
		<span class="p_choice">호스트의 예약승인 절차 없이, 게스트가 예약과 동시에 결제를 진행합니다.</span>
	</div>
</div>
<div class="flex_wrap">
	<div class="choice active">
		<input type="radio" name="tbsp_bok_type" id="tbsp_bok_type2" class="radio" value="APPROVE_PAY">
		<label for="way2">승인결제</label>
		<span class="p_choice">호스트가 예약을 승인해야, 게스트가 결제를 진행할 수 있습니다.</span>
	</div>
</div> -->
<!-- <input type="text" id="tbsp_bok_type" name="tbsp_bok_type" val=""> -->
<!-- <p class="p_guide normal"><i class="sp_icon required_alert"></i>공간별로 1가지 방식의 예약방법을 선택하셔야 합니다. 예약방법은 언제든 변경이 가능합니다.</p> -->
<div class="heading">
	<h3>정산 정보를 입력해주세요.</h3>
	<div class="required">
		<span class="required_s">*</span>
		<span class="required_txt">필수입력</span>
	</div>
</div>
<div class="box_form">
	<div class="title">
		<label for="tbc_name">상호명 (개인/법인)
			<span class="required_s">*</span>
		</label>
	</div>
<!-- 	<span class="option">
		<span class="txt_count"><em>0</em>자/<em>17</em>자</span>
	</span> -->
	<div class="input undefined">
		<input type="text" name="tbc_name" id="tbc_name" placeholder="상호명을 입력해주세요." required>
	</div>
<!-- 	<p class="p_guide warn">
		<i class="sp_icon required_alert"></i>상호명은 필수 입력입니다.
	</p> -->
</div>
<div class="box_form">
	<div class="title">
		<label for="tbc_ceo">대표자명
			<span class="required_s">*</span>
		</label>
	</div>
	<span class="option">
<!-- 		<span class="txt_count">
			<em>0</em>자/<em>10</em>자</span>
		</span> -->
		<div class="input undefined">
			<input type="text" name="tbc_ceo" id="tbc_ceo" placeholder="대표자명을 입력해 주세요." required>
		</div>
<!-- 		<p class="p_guide warn">
			<i class="required_alert"></i>대표자명은 필수 입력입니다.
		</p> -->
</div>
<div class="box_form mobile tbc_res_num">
	<span class="title">
		<label for="tbc_res_num">사업자 등록번호
			<span class="required_s">*</span>
		</label>
	</span>
	<div class="row phone">
		<div class="col3">
			<input type="tel" id="tbc_res_num1" class="tbc_res_num" maxlength="3" title="사업자 등록번호 앞자리" required>
		</div>
		<div class="col3">
			<input type="tel" id="tbc_res_num2" class="tbc_res_num" maxlength="2" title="사업자 등록번호 중간자리" required>
		</div>
		<div class="col3">
			<input type="tel" id="tbc_res_num3" class="tbc_res_num" maxlength="5" title="사업자 등록번호 뒷자리" required>
		</div>
		<input type="tel" name="tbc_res_num" id="tbc_res_num" value="">
	</div>
	
<!-- 	<p class="p_guide warn">
		<i class="sp_icon required_alert"></i>사업자 등록번호는 필수 입력입니다.
	</p> -->
</div>
<div class="box_form sp_adrs">
	<span class="title">
		<label for="sp_adrs">사업자 유형
			<span class="required_s">*</span>
		</label>
	</span>
	<div class="col_wrap">
		<div class="col col5">
			<input type="radio" id="tbc_type1" name="tbc_type" class="radio" value="STAXN" checked="">
			<label for="biztype1">간이과세자</label>
		</div>
		<div class="col col5">
			<input type="radio" id="tbc_type2" name="tbc_type" class="radio" value="NTAXN">
			<label for="biztype2">일반과세자</label>
		</div>
		<div class="col col5">
			<input type="radio" id="tbc_type3" name="tbc_type" class="radio" value="CBIZR">
			<label for="biztype3">법인사업자</label>
		</div>
		<div class="col col5">
			<input type="radio" id="tbc_type4" name="tbc_type" class="radio" value="MBIZR">
			<label for="biztype4">면세사업자</label>
		</div>
		<div class="col col5">
			<input type="radio" id="tbc_type5" name="tbc_type" class="radio" value="EBIZR">
			<label for="biztype5">기타사업자</label>
		</div>
	</div>
</div>
<div class="flex_wrap column2">
	<div class="box_form mobile">
		<span class="title">
			<label for="tbc_mainbizstat">주업태
				<span class="required_s">*</span>
			</label>
		</span>
		<div class="input">
			<input type="text" name="tbc_mainbizstat" id="tbc_mainbizstat" value="">
		</div>
<!-- 		<p class="p_guide warn">
			<i class="sp_icon required_alert"></i>주업태는 필수 입력입니다.
		</p> -->
	</div>
	<div class="box_form mobile">
		<span class="title">
			<label for="tbc_maintheme">주종목
				<span class="required_s">*</span>
			</label>
		</span>
		<div class="input">
			<input type="text" name="tbc_maintheme" id="tbc_maintheme" value="">
		</div>
<!-- 		<p class="p_guide warn">
			<i class="sp_icon required_alert"></i>주종목은 필수 입력입니다.
		</p> -->
	</div>
</div>
<div class="box_form">
	<span class="title">
		<label for="tbc_addr">사업장 주소
			<span class="required_s">*</span>
		</label>
<!-- 		<span class="title_check">
			<input type="checkbox" id="every" class="checkbox">
			<label for="every">
				<i class="sp_icon"></i>공간정보와 동일
			</label>
		</span> -->
	</span>
	<div class="file">
		<input type="text" name="tbc_addr1" id="tbc_addr1" class="tbc_addr" value="" readonly/>
			<div class="btn_box" id="addr_search">
				<a class="btn" title="레이어 팝업 열림">주소검색</a>
			</div>
		</div>
	<div class="input">
		<input type="text" name="tbc_addr2" id="tbc_addr2" class="tbc_addr" placeholder="상세 주소를 입력해주세요." value="">
	</div>
<!-- 	<p class="p_guide warn">
		<i class="sp_icon required_alert"></i>사업장 주소는 필수 입력입니다.
	</p> -->
</div>
<div class="box_form email">
	<span class="title">
		<label for="tbb_email">정산용 이메일
			<span class="required_s">*</span>
		</label>
	</span>
	<div class="row">
		<div class="tbb_email">
			<input type="text" id="tbb_email1" class="tbb_email" title="이메일 주소" value="" >
		</div>
		<div class="tbb_email">
			<span class="txt_at">@</span>
			<input type="text" id="tbb_email2" class="tbb_email" title="이메일 도메인" placeholder="직접입력" >
		</div>
		<div class="tbb_email">
			<div class="select">
				<select title="이메일 도메인 선택" id="tbb_email3">
					<option disabled selected>이메일을 선택해주세요.</option>
					<option>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
				</select>
			</div>
		</div>
		<input type="text" name="tbb_email" id="tbb_email" value=""/>
	</div>
<!-- 	<p class="p_guide warn">
		<i class="sp_icon required_alert"></i>정산용 이메일은 필수 입력입니다.
	</p>
	<p class="p_guide normal">
		<i class="sp_icon required_alert"></i>월별 정산 자료를 해당 메일로 보내드립니다.
	</p> -->
</div>
<div class="flex_wrap column2">
	<div class="box_form mobile">
		<span class="title">
			<label for="tbb_tel">정산용 연락처
				<span class="required_s">*</span>
			</label>
		</span>
		<div class="row phone">
			<div class="col3">
				<input type="tel" id="tbb_tel1" maxlength="3" class="tbb_tel" title="정산용 연락처 앞자리" required>
			</div>
			<div class="col3">
				<input type="tel" id="tbb_tel2" maxlength="4" class="tbb_tel" title="정산용 연락처 중간자리" required>
			</div>
			<div class="col3">
				<input type="tel" id="tbb_tel3" maxlength="4" class="tbb_tel" title="정산용 연락처 뒷자리" required>
			</div>
			<input type="tel" id="tbb_tel" name="tbb_tel" value=""/>
		</div>
<!-- 		<p class="p_guide warn">
			<i class="sp_icon required_alert"></i>정산용 연락처는 필수 입력입니다.
		</p> -->
	</div>
</div>
<div class="heading">
	<h3>계좌 정보</h3>
	<div class="required">
		<span class="required_s">*</span>
		<span class="required_txt">필수입력</span>
	</div>
</div>
<div class="account">
	<dl class="flex_box">
		<dt class="flex title">
			<label for="tbb_name">은행명
				<span class="required_s">*</span>
			</label>
		</dt>
		<dd class="flex">
			<div class="select">
				<select id="tbb_name" name="tbb_name">
					<option value="HANA">하나은행</option>
					<option value="IBK">기업은행</option>
					<option value="KEB">국민은행</option>
				</select>
			</div>
		</dd>
	</dl>
	<dl class="flex_box">
		<dt class="flex title">
			<label for="bank12">계좌번호
				<span class="required_s">*</span>
			</label>
		</dt>
		<dd class="flex">
			<input type="tel" id="tbb_acuntnum" name="tbb_acuntnum">
		</dd>
	</dl>
	<dl class="flex_box">
		<dt class="flex title">
			<label for="bank13">예금주
				<span class="required_s">*</span>
			</label>
		</dt>
		<dd class="flex">
			<input type="text" id="tbb_depositor" name="tbb_depositor">
		</dd>
	</dl>
</div>
<p class="p_guide normal">
	<i class="sp_icon required_alert"></i>
	시공간을 통해 결제된 금액을 정산 받으실 
	<strong>사업장 통장 계좌</strong>를 입력해주세요.
</p>
<p class="p_guide warn usual">
	<i class="sp_icon required_alert"></i>
	입금자명은 "(주)코드빌런"으로 정산됩니다.
</p>
<p class="p_guide warn usual">
	<i class="sp_icon required_alert"></i>
	정보 오기입시 정산이 지연될 수 있으니 정확한 정보를 입력해주세요.
</p>
<article class="last">
	<div class="heading">
		<h3>환불기준</h3>
		<span class="option">
			<span class="txt_guide">해당 기준의 의해 환불 처리됩니다.</span>
		</span>
	</div>
	<div id="refund" class="refund">
		<dl class="flex_box">
			<dd class="flex" style="vertical-align: top;">
				<div style="margin-bottom: 16px;">
					<label>이용 7일 전</label>
					<div class="policy-group" style="display: inline-block; vertical-align: middle;">
						<span>총 금액의</span>
						<div class="select">
							<select name="tbsp_refund1">
								<c:set var="refund_txt" value="100"/>
								<c:forEach  var="i" begin="1" end="100" step="25">
									<option value="${refund_txt}">
										<c:out value="${refund_txt}%"/>
									</option>
									<c:set var="refund_txt" value="${refund_txt-25}"/>
								</c:forEach>
								<option value="0">환불불가</option>
							</select>
						</div>
						<span>환불</span>
					</div>
				</div>
				<div style="margin-bottom: 16px;">
					<label>이용 3일 전</label>
					<div class="policy-group" style="display: inline-block; vertical-align: middle;">
						<span>총 금액의</span>
						<div class="select">
							<select name="tbsp_refund2">
								<c:set var="refund_txt" value="100"/>
								<c:forEach  var="i" begin="1" end="100" step="25">
									<option value="${refund_txt}">
										<c:out value="${refund_txt}%"/>
									</option>
									<c:set var="refund_txt" value="${refund_txt-25}"/>
								</c:forEach>
								<option value="0">환불불가</option>
							</select>
						</div>
						<span>환불</span>
					</div>
				</div>
				<div style="margin-bottom: 16px;">
					<label>이용 전날</label>
					<div class="policy-group" style="display: inline-block; vertical-align: middle;">
						<span>총 금액의</span>
						<div class="select">
							<select name="tbsp_refund3">
								<c:set var="refund_txt" value="100"/>
								<c:forEach  var="i" begin="1" end="100" step="25">
									<option value="${refund_txt}">
										<c:out value="${refund_txt}%"/>
									</option>
									<c:set var="refund_txt" value="${refund_txt-25}"/>
								</c:forEach>
								<option value="0">환불불가</option>
							</select>
						</div>
						<span>환불</span>
					</div>
				</div>
			</dd>
		</dl>
	</div>
	<p class="p_guide normal">
		<i class="sp_icon required_alert"></i>
		5,000원 이상 결제 후 예약 취소시, 위의 기준으로 환불/정산 처리됩니다. (이후 수정 가능)
	</p>
	<p class="p_guide warn usual">
		<i class="sp_icon required_alert"></i>
		5,000원 미만 결제하는 경우, 전체환불만 가능합니다.
	</p>
</article>
</section>
<div class="sp_btn_bottom">
<span class="btn_wrap">
	<input type="button" class="btn_prev" value="이전">
</span>
<span class="btn_wrap">
	<input type="button" class="btn_next" id="sp4_next" value="저장">
</span>
</div>
</form>
</div>
</div>
</body>
</html>