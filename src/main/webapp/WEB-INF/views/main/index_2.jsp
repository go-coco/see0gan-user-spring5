<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <%@ page import="java.util.List"%>
<%-- <%@ page import="com.see0gan.space.vo.SP_BasicInfoVO"%>
 --%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">

<title>See 공간 : 우리의 공간을 보다</title>
<%--<% 
 HttpSession httpSession = request.getSession(true);

GuestVO svo = (GuestVO) httpSession.getAttribute("user");
HostVO hvo = null;
if(svo == null) 	hvo = (HostVO) httpSession.getAttribute("HostVO");

	List<SP_BasicInfoVO> list = (List<SP_BasicInfoVO>) request.getAttribute("SpaceList");
%> --%>
</head>
<body>
<div class="wrap">
<header class="header">
	<%@include file="/commons/header.jsp" %>
	<!-- sub header -->
	<!-- 
	<div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>공간등록</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
	-->
</header>
	<div class="content_wrap">
	<div class="main_wrap">
		<section class="sp_type">
			<h1>어떤 공간을 찾고 있나요?</h1>
			<div class="sp_type_wrap">
				<div>
					<button class="sp_type_btn" onclick="location.href='/booking/hi'">
						<img alt="파티룸" src="/resources/icon/party_room.jpg">
						<div class="keyword">파티룸</div>
					</button>
				</div>
				<div>
					<button class="sp_type_btn" onclick="location.href='/search?q=practice'">
						<img alt="연습실" src="/resources/icon/practice_room.jpg">
						<div class="keyword">연습실</div>
					</button>
				</div>
				<div>
					<button class="sp_type_btn" onclick="location.href='/search?q=studio'">
						<img alt="촬영스튜디오" src="/resources/icon/studio.jpg">
						<div class="keyword">촬영스튜디오</div>
					</button>
				</div>
				<div>
					<button class="sp_type_btn" onclick="location.href='/search?q=conference'">
						<img alt="회의실" src="/resources/icon/conference_room.jpg">
						<div class="keyword">회의실</div>
					</button>
				</div>
			</div>
		</section>
		<section class="sp_recommend">
			<h2>오늘의 추천 공간</h2>
			<h3>뜨기 전에 먼저 예약하세요</h3>
			<div class="list_today_sp">
		<%-- 	<%
					if (list == null) {
				%>
				<div>예약한 공간이 없습니다</div>
			<%-- 	<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							SP_BasicInfoVO sp_BasicInfoVO = list.get(i);
				%>
				<div class="sp_list">
				<a href="space_detail.sgg?tbsp_num=<%=sp_BasicInfoVO.getTbsp_num()%>">
					<div class="sp_list_img">
						<img src="../../../resources/img/<%= sp_BasicInfoVO.getTbsp_img1()%>" border="1" alt="image">
						<% System.out.println("img1 name >>> : " + sp_BasicInfoVO.getTbsp_img1()); %>
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit"><%= sp_BasicInfoVO.getTbsp_name() %></h3>
						<div class="sp_tags">
							<span class="tag_area_name"><%= sp_BasicInfoVO.getTbsp_addr() %></span> 
							<span><%= sp_BasicInfoVO.getTbsp_tag1() %></span>
							<span><%= sp_BasicInfoVO.getTbsp_tag2() %></span>
							<span><%= sp_BasicInfoVO.getTbsp_tag3() %></span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price"><%= sp_BasicInfoVO.getTbsp_cost() %></strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span><%= sp_BasicInfoVO.getTbsp_capacity() %></span> 
						</div>
					</div>
				</a>
				</div>
							<%
					}
				%>
				<%
					}
				%>  --%>
			</div>
		</section>
	</div>

</div>	
<footer class="footer">
	 <%@include file="/commons/footer.jsp" %> 
</footer>



</div>

</body>
</html>
