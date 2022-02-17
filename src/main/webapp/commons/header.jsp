<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
    function search() {
        var query=document.getElementById('q').value;
        location.href="/search?q="+query;
       
    }
</script>

<title>header</title>
</head>
<body>
<div class="header_wrap">
	<div class="header_logo">
		<a href="/index_2" id="logo">see0gan</a>
	</div>
	<div class="search_box">
		<img class="icon_serch" alt="검색" src="/resources/icon/search.png" width="24">
		<input type="text" name="" id="q" class="search_txtbar" placeholder="공간명,공간유형으로 찾아보세요"
				onkeyup="if(window.event.keyCode==13){search()}"/>
		<div class="sp_insert_nav"><a href="/hostCenter">내 공간 등록하기</a></div>
		<button class="btn_menu" onclick="location.href='members/mypage'">
			<img id="icon_menu" alt="메뉴" src="/resources/icon/menu_bar.png" width="24">
		</button>
	</div>
	
</div>
</body>
</html>