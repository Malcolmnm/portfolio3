<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리</title>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/shop_setup.css?v=2">
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section style="width: 1000px; height: auto;margin: auto;">
<form id="setok">
	<div class="shopdiv">
	<!-- 배너관리 -->
	<div class="shopsub"><a>■</a> 쇼핑몰 메인 배너관리</div>
	<ul class="shopul">
		<li>메인 배너 등록</li>
		<li><input type="text" name="banner1" value="${ml[0]['banner1']}"></li>
		<li>배너1 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="bannerurl1" value="${ml[0]['bannerurl1']}"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="banner2" value="${ml[0]['banner2']}"></li>
		<li>배너2 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="bannerurl2" value="${ml[0]['bannerurl2']}"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="banner3"  value="${ml[0]['banner3']}"></li>
		<li>배너3 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="bannerurl3" value="${ml[0]['bannerurl3']}"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="banner4"  value="${ml[0]['banner4']}"></li>
		<li>배너4 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="bannerurl4" value="${ml[0]['bannerurl4']}"></li>
		<li>링크 URL</li>
	</ul>
	
	<div class="shopbtn">
		<input type="button" value="배너 번경" onclick="setup()">
	</div>
	
	<!-- 쇼핑몰 팝업 -->
	<div class="shopsub"><a>■</a> 쇼핑몰 메인 팝업관리</div>
	<ul class="shopul">
		<li>메인 팝업 등록</li>
		<li><input type="text" name="popup" value="${ml[0]['popup']}"></li>
		<li>팝업 <a>※ 팝업 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="popupurl" value="${ml[0]['popupurl']}"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li class="popset"><input type="checkbox" name="popupch" value="Y">팝업창 사용</li>
		<li></li>
	</ul>
	
	<div class="shopbtn">
		<input type="button" value="팝업창 변경" onclick="setup()">
	</div>
	<!-- 쇼핑몰 AD 배너 -->
	
	<div class="shopsub"><a>■</a> 쇼핑몰 AD 배너</div>
	<ul class="shopul">
		<li>AD 배너 등록</li>
		<li><input type="text" name="adbanner1" value="${ml[0]['adbanner1']}"></li>
		<li>AD 배너1 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="adbannerurl1" value="${ml[0]['adbannerurl1']}"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="adbanner2" value="${ml[0]['adbanner2']}"></li>
		<li>AD 배너2 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text" name="adbannerurl2" value="${ml[0]['adbannerurl2']}"></li>
		<li>링크 URL</li>
	</ul>
	
	<div class="shopbtn">
		<input type="button" value="AD 배너 변경" onclick="setup()">
	</div>
	</div>
	</form>
</section>
<section style="height: 100px;">
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>


</body>
<script>
	if(${ml[0]['popupch'] == "Y"}){
		setok.popupch.checked = true; 
	}
	else{
		setok.popupch.checked = false; 
	}
	
	function setup(){
		if(setok.popupch.checked == true){
			setok.popupch.value="Y";
		}
		else{
			setok.popupch.value="N";
		}
		
		setok.method = "post";
		setok.action = "./shop_setup2.do";
		setok.submit();
	}
</script>
</html>