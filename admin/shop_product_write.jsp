<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<script src="../ckeditor/ckeditor.js?v=1"></script>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/shop_product_write.css?v=2">
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section style="width: 1000px; height: auto;margin: auto;">
<div class="shopdiv">
	<!-- 배너관리 -->
	<div class="shopsub"><a>■</a> 상품 등록 페이지</div>
	<form id="sfrm" enctype="multipart/form-data">
	<ul class="shop_ul">
		<li>대메뉴 카테고리</li>
		<li>
			<select name="smenu1">
				<option>기획상품</option>
				<option>이벤트 상품</option>
				<option>무료배송상품</option>
				<option>베스트 상품</option>
				<option>이주의 핫딜</option>
			</select>
		</li>
	</ul>
	<ul class="shop_ul">
		<li>소메뉴 카테고리</li>
		<li>
			<select name="smenu2">
				<option>채소/과일/농수산물</option>
				<option>간식/간편음식</option>
				<option>베이커리/우유</option>
				<option>냉장고/김치냉장고</option>
				<option>주방용품/생활가전</option>
				<option>컴퓨터/스마트폰</option>
				<option>공기청정기</option>
			</select>
		</li>
	</ul>
	
	<ul class="shop_ul">
		<li>상품코드</li>
		<li>
			<input type="text" id="rancode" name="scode">
			<input type="button" value="중복확인" onclick="codecheck()">
			<a>※ 상품코드는 절대 중복되지 않도록 합니다.</a>
		</li>
	</ul>
	
	<ul class="shop_ul shop_ul2">
		<li>상품명</li>
		<li>
			<input type="text" name="sname">
			<a>※ 상품명은 최대 100자까지만 적용할 수 있습니다.</a>
		</li>
	</ul>
	
	<ul class="shop_ul shop_ul3">
		<li>상품 부가설명</li>
		<li>
			<input type="text" name="stext1">
			<a>※ 상품 설명은 최대 200자까지만 적용할 수 있습니다.</a>
		</li>
	</ul>
	
	<ul class="shop_ul shop_ul4">
		<li>판매가격</li>
		<li>
			<input type="text" maxlength="7" name="ssel">
			<a>※ ,없이 숫자만 입력하세요 최대 7자리</a>
		</li>
	</ul>
	
	<ul class="shop_ul shop_ul4">
		<li>할인율</li>
		<li>
			<input type="text" maxlength="2" onkeyup="s_price()" placeholder="0" name="sdis">
			<a>% ※ 숫자만 입력하세요.</a>
		</li>
	</ul>
	
	
	<ul class="shop_ul shop_ul4">
		<li>할인가격</li>
		<li>
			<input type="text" maxlength="3" placeholder="0" name="sdissel">
			<a>※ 할인율이 0%일 경우 할인가격은 0으로 처리 합니다.</a>
		</li>
	</ul>	
	
	<ul class="shop_ul shop_ul4">
		<li>상품제고</li>
		<li>
			<input type="text" maxlength="3" placeholder="0" name="scon">
			<a>EA ※ 숫자만 입력하세요 재고가 0일 경우 soldout이 됩니다.</a>
		</li>
	</ul>	
	
	<ul class="shop_ul shop_ul4">
		<li>판매 유/무</li>
		<li>
			<label><input type="radio" checked name="scan" value="Y"> 판매 시작</label>
			<label><input type="radio" name="scan" value="N"> 팬매 종료</label>
		</li>
	</ul>	
	<ul class="shop_ul shop_ul4">
		<li>조기품절</li>
		<li>
			<label><input type="radio" name="ssold" value="Y"> 사용</label>
			<label><input type="radio" name="ssold" checked  value="N"> 미사용</label>
		</li>
	</ul>
	
	<ul class="shop_ul shop_ul5">
		<li>상품 대표이미지</li>
		<li>
			<div><input type="file" name="sfile1"><a>※ 상품 대표이미지 이며, 이미지 용량은 2MB 까지 입니다.</a></div>
			<div><input type="file" name="sfile2"><a>※ 추가 이미지이며, 이미지 용량은 2MB 까지 입니다.</a></div>
			<div><input type="file" name="sfile3"><a>※ 추가 이미지이며, 이미지 용량은 2MB 까지 입니다.</a></div>
		</li>
	</ul>	
	
	<ul class="shop_ul shop_ul6">
		<li>상품 상세설명</li>
		<li>
			<textarea id="texts" name="stext2"></textarea>
		</li>
	</ul>	
	<div class="shopbtn">
		<input type="button" value="상품 리스트" onclick="backlist()">
		<input type="button" value="상품 등록" onclick="shop_pro()">
	</div>
	</form>
</div>
</section>
<section style="height: 100px;">
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>
</body>
<script src="./js/shop_product_write.js?v=1"></script>
<script>
CKEDITOR.replace('texts',{
	width:"800px",
	height:"310px",
	editorplaceholder:"내용을 입력하세요.",
	filebrowserUploadUrl: "./imageupload.do"
});
</script>
</html>