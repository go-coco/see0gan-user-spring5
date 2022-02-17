<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/sp_common.css">
<title>SPACE BASIC</title>
<%-- <% 
HttpSession httpSession = request.getSession(true);

GuestVO svo = (GuestVO) httpSession.getAttribute("user");
HostVO hvo = null;
if(svo == null){
	hvo = (HostVO) httpSession.getAttribute("HostVO");
	if(hvo == null){
	%>
	<script>alert("로그인 : false"); </script>
<% }
}

else {%>
<script>alert("로그인 : true"); </script>
<%
	} 
%> --%>
<!-- 다음 api 주소등록 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//태그추가
var i =1;
var j =0;
function addList()  {
		if(i>6) return;
		var tag="";
		 tag += "tag0"+i
		// 1. 추가할 값을 input창에서 읽어온다
		const tbsp_tag 
		= document.getElementById('tbsp_tag').value;
		// 2. 추가할 li element 생성
		// 2-1. 추가할 li element 생성
		const li = document.createElement("li");
		// 2-2. li에 id 속성 추가 
		li.setAttribute('id', tbsp_tag);
		// 2-3. li에 text node 추가 
		const textNode = document.createTextNode(tbsp_tag);
		li.appendChild(textNode);
		// 3. 생성된 li를 ul에 추가
		document
		.getElementById('addTag')
		.appendChild(li);
		// 4. db에 들어가는 값
		document.getElementById(tag).value= tbsp_tag;
		
		i += 1;
		j += 1;
}
//태그 삭제
function removeItem()  {
		var tag="";
	  tag += "tag0"+j;
	  document.getElementById(tag).value = "";
	  // 1. <ul> element 선택
	  const ul = document
	    .getElementById('addTag');
	  
	  // 2. <li> 목록 선택
	  const items = ul.getElementsByTagName('li');
	  
	  // 3. <li> 목록 중 첫번째 item 삭제
	  if(items.length > 0)  {
	    items[0].remove();
	  }
	 
	 i -= 1; 
	 j -=1;
}
$(document).ready(function(){
	//체크박스
	$('input[type="checkbox"][name="tbsp_type"]').click(function(){
		
		//체크박스가 클릭되어 있다면
		if($(this).prop('checked')){
			//체크박스 전체 해제
			$('input[type="checkbox"][name="tbsp_type"]').prop('checked', false);
			//클릭한 요소만 체크
			$(this).prop('checked', true);
		}
		
	});
	
	$(document).on("click", "#saveBtn", function(){
			console.log("saveBtn >>> : ");
		
		//공간명 유효성 검사
		if($("#tbsp_name").val() == ""){
		      alert("공간명을 입력해주세요.");
		      $("#tbsp_name").focus();
		      return;
		 }
		//공간유형 체크박스 유효성 검사
		if (!$("input:checked[class='tbsp_type']").is(":checked")){
			alert("공간유형을 선택해주세요.");
			$(".tbsp_type").focus();
			return;
		}
		
		//공간 한줄 소개 유효성 검사
		if($("#tbsp_intro1").val() == ""){
		      alert("공간한줄 소개를 입력해주세요.");
		      $("#tbsp_intro1").focus();
		      return;
		 }
		
		//공간 소개 유효성 검사
		if($("#tbsp_intro2").val() == ""){
		      alert("공간에 대한 상세한 소개를 입력해주세요.");
		      $("#tbsp_intro2").focus();
		      return;
		 }
		
		//수용인원 유효성 검사
		if($("#tbsp_capacity").val() == ""){
		      alert("최대 정원을 입력해주세요.");
		      $("#tbsp_capacity").focus();
		      return;
		 }
		
		//시설안내 유효성 검사
		if($("#tbsp_guide").val() == ""){
		      alert("시설안내를 입력해주세요.");
		      $("#tbsp_guide").focus();
		      return;
		 }
		
		//태그 유효성 검사
		if($("#tbsp_tag1").val() == ""){
		      alert("태그를 입력해주세요.");
		      $("#tbsp_tag1").focus();
		      return;
		 }
		
		//주의사항 유효성 검사
		if($("#tbsp_caution").val() == ""){
		      alert("주의사항을 입력해주세요.");
		      $("#tbsp_caution").focus();
		      return;
		 }
		//대표이미지 유효성 검사
		if($("#tbsp_img1").val() == ""){
		      alert("대표이미지를 넣어주세요.");
		      $("#tbsp_img1").focus();
		      return;
		 }
		
		//이미지 유효성 검사
		if($("#tbsp_img2").val() == ""){
		      alert("이미지를 넣어주세요.");
		      $("#tbsp_img2").focus();
		      return;
		 }
			
		$('#spaceInsert').attr({
			'action':'/space/basicInfo',
			'method':'POST',
			'enctype':'multipart/form-data'
		}).submit();
	});
});
</script>

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div class="wrap">
<header class="header">
	<div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>기본 정보</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
</header>
<div class="content_wrap">
<div class="heading">
	<h3>공간 정보를 입력해주세요.</h3>
	<div class="required">
		<span class="required_s">*</span>
		<span class="required_txt">필수입력</span>
	</div>
</div>
<form name="spaceInsert" id="spaceInsert">
	<!-- readonly을 사용해서 sbnum를 사용할 수 없게 만든다.-->
	<input type="hidden" name="tbsp_num" id="tbsp_num" readonly>
	<div class="box_form">
		<div class="title">공간명<span class="required_s">*</span></div>
		<input type="text" name="tbsp_name" id="tbsp_name" size="20" placeholder="공간명 입력하세요">
	</div>
	<div class="box_form chkbox_style">
		<div class="title">공간유형<span class="required_s">*</span></div>
		<input type="checkbox" name="tbsp_type" id="tbsp_type1" class="tbsp_type" value="party" />
		<label for="tbsp_type1" class="ellip">파티룸</label>    
	    <input type="checkbox" name="tbsp_type" id="tbsp_type2" class="tbsp_type" value="practice" />
	    <label for="tbsp_type2" class="ellip">연습실</label>   
	    <input type="checkbox" name="tbsp_type" id="tbsp_type3" class="tbsp_type" value="studio" />
	    <label for="tbsp_type3" class="ellip">촬영스튜디오</label>   
	    <input type="checkbox" name="tbsp_type" id="tbsp_type4" class="tbsp_type" value="conference" />
		<label for="tbsp_type4" class="ellip">회의실</label>
	</div>

	<div class="box_form">
		<div class="title">공간 한줄 소개<span class="required_s">*</span></div>
		<input type="text" name="tbsp_intro1" id="tbsp_intro1" size="50"  placeholder="공간을 소개하는 한줄 문장을 입력해주세요">
	</div>

	<div class="box_form">
		<div class="title">공간 소개<span class="required_s">*</span></div>
		<textarea name="tbsp_intro2" id="tbsp_intro2" rows="10" placeholder="공간을 상세히 소개해주세요"></textarea>
	</div>

	<div class="box_form">
		<div class="title">최대 수용 인원<span class="required_s">*</span></div>
		<input type="text" name="tbsp_capacity" id="tbsp_capacity" size="20" placeholder="수용 인원">
	</div>

	<div class="box_form">
		<div class="title">공간 태그<span class="required_s">*</span></div>
		<ol id='addTag'></ol>
		<input type='text' name='tbsp_tag' id='tbsp_tag' value="#" placeholder="태그입력"/>
		<!-- 태그삭제 -->
		<ul id='addTag'></ul>
		<input type='button' class="pupl_btn" value='추가' onclick='addList()' />
		<input type='button' class="pupl_btn" value='삭제' onclick='removeItem()' />
		
		
	</div>


	<div class="box_form">
		<div class="title">시설안내<span class="required_s">*</span></div>
		<input type="text" name="tbsp_guide" id="tbsp_guide" size="20" placeholder="어떤 시설이 포함되어 있나요">
	</div>

	<div class="box_form">
		<div class="title">예약 시 주의사항<span class="required_s">*</span></div>
		<input type="text" name="tbsp_caution" id="tbsp_caution" size="20" placeholder="예약시 주의사항">
	</div>

	<div class="box_form">
		<div class="title">웹사이트</div>
		<input type="text" name="tbsp_url" id="tbsp_url" size="20"  placeholder="웹사이트 URL">
	</div>

	<div class="box_form">
		<div class="title">대표 이미지<span class="required_s">*</span></div>
		<input type="file" name="tbsp_img1" id="tbsp_img1" class="pupl_btn">
	</div>

	<div class="box_form">
		<div class="title">이미지<span class="required_s">*</span></div>
		<input multiple="multiple" type="file" name="tbsp_img2" id="tbsp_img2" class="pupl_btn">
	</div>

	<div class="box_form">
		<div class="title">주소(위치)<span class="required_s">*</span></div>
		<input type="text" name="tbsp_addr" id="sample4_postcode" placeholder="우편번호">
		<input type="button" name="tbsp_addr" class="pupl_btn" onclick="sample4_execDaumPostcode()" value="주소등록">
		<input type="text" name="tbsp_addr" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" name="tbsp_addr" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" name="tbsp_addr" style="color:#999;display:none"></span>
		<input type="text" name="tbsp_addr2" id="sample4_detailAddress" placeholder="상세주소">
	</div>
	<input type="hidden" name="tbh_num" id="tbh_num" value="H0001">
	
	<div class="sp_btn_bottom">
		<span class="btn_wrap">
			<input type="button" class="btn_prev" value="이전">
		</span>
		<span class="btn_wrap">
			<input type="button" class="btn_next" id="saveBtn" value="저장">
		</span>
	</div>			
	
	<input type="hidden" name="tag01" id="tag01" value="">
	<input type="hidden" name="tag02" id="tag02" value="">
	<input type="hidden" name="tag03" id="tag03" value="">
	<input type="hidden" name="tag04" id="tag04" value="">
	<input type="hidden" name="tag05" id="tag05" value="">
	</form>
</div>
</div>
</body>
</html>