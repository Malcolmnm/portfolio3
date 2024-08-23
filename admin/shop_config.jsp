<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/shopconfig.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<script src="./js/header.js?v=1"></script>
<title>쇼핑몰 기본설정</title>
</head>
<body>
	<%@ include file="/admin/admin_header.jsp"%>
	<!-- 탑 -->
	<%@ include file="/admin/admin_menu.jsp"%>
	<!-- 메뉴 -->
	<form id="cofig">
	<section class="shopconfig_css">
		<section class="l1">
			<ul class="l1ul">
				<li>■</li>
				<li>홈페이지 가입환경 설정</li>
			</ul>
		</section>
		<ul class="shopconfig_ul">
			<li style="margin-top: 15px;">
				<span>홈페이지 제목</span>
					<input type="text" style="width: 250px" name="stitle" value="${ml[0]['stitle']}">
			</li>

			<li>
				<span>관리자 메일 주소</span>
				<input type="text" style="width: 300px" name="semail" value="${ml[0]['semail']}"><a>⠀※관리자가 보내고 받는 용도로 사용하는 메일 주소를
					입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)</a></li>
			<li><span>포인트 사용 유/무</span><label class="shop_nav">
				<input type="radio" id="spointok1" value="Y" name="spointok">포인트 사용</label><label class="shop_nav">
				<input type="radio" id="spointok2" value="N" name="spointok" checked>포인트 미사용</label></li>
			<li class="shopconfig_li"><div>
					<span>회원가입시 적립금</span>
						<input type="text" class="score" style="width: 80px" name="spoint" value="${ml[0]['spoint']}">⠀점
				</div>
				<div>
					<span>회원가입시 권한레벨</span>
					<input type="text" class="score" style="width: 80px" name="slevel" value="${ml[0]['slevel']}">⠀레벨
				</div></li>
		</ul>

		<section class="l1">
			<ul class="l1ul">
				<li>■</li>
				<li>홈페이지 기본환경 설정</li>
			</ul>
		</section>
		<ul class="shopconfig_ul shop_middle">
			<li style="display: flex; margin-top: 45px;"><div>
					<span>회사명</span><input type="text" name="swork" value="${ml[0]['swork']}">
				</div>
				<div>
					<span>사업자등록번호</span><input type="text" name="sno" value="${ml[0]['sno']}">
				</div></li>
			<li style="display: flex"><div>
					<span>대표자명</span><input type="text" name="sceo" value="${ml[0]['sceo']}">
				</div>
				<div>
					<span>대표전화번호</span><input type="text" name="stel" value="${ml[0]['stel']}">
				</div></li>
			<li style="display: flex"><div>
					<span>통신판매업 신고번호</span><input type="text" name="snu" value="${ml[0]['snu']}">
				</div>
				<div>
					<span>부가통신 사업자번호</span><input type="text" name="scnu" value="${ml[0]['scnu']}">
				</div></li>
			<li style="display: flex"><div>
					<span>사업장 우편번호</span><input type="text" name="sad" value="${ml[0]['sad']}">
				</div>
				<div>
					<span>사업장 주소</span><input type="text" style="width: 300px " name="sare" value="${ml[0]['sare']}">
				</div></li>
			<li style="display: flex"><div>
					<span>정보관리책임자명</span><input type="text"  name="sname" value="${ml[0]['sname']}">
				</div>
				<div>
					<span>정보책임자 E-mail</span><input type="text" style="width: 250px" name="sema" value="${ml[0]['sema']}">
				</div></li>
		</ul>

		<section class="l1">
			<ul class="l1ul">
				<li>■</li>
				<li>홈페이지 기본환경설정</li>
			</ul>
		</section>
		<ul class="shopconfig_ul">
			<li class="shopconfig_li" style="margin-top: 45px;"><div>
					<span>무통장 은행</span><input type="text"  name="sbank" value="${ml[0]['sbank']}">
				</div>
				<div>
					<span>은행계좌번호</span><input type="text" style="width: 250px" name="sbno" value="${ml[0]['sbno']}">
				</div></li>
			<li><span>신용카드 결제 사용</span><label class="shop_nav">
			<input type="radio" name="scard" value="Y">사용</label><label class="shop_nav">
			<input type="radio" name="scard" value="N" checked>미사용</label><a>⠀※해당 PG사가 있을
					경우 사용으로 변경합니다.</a></li>
			<li><span>휴대폰 결제 사용</span><label class="shop_nav">
			<input type="radio" name="sphone" value="Y">사용</label><label class="shop_nav">
			<input type="radio" name="sphone" value="N" checked>미사용</label><a>⠀※주문시 휴대폰 결제를
					가능하게 할 것인지를 설정합니다.</a></li>
			<li><span>도서상품권 결제사용</span><label class="shop_nav">
			<input type="radio" name="smo" value="Y">사용</label><label class="shop_nav">
			<input type="radio" name="smo" value="N" checked>미사용</label><a>⠀※도서상품권
					결제만 적용이 되며,그 외에 상품권은 결제 되지 않습니다.</a></li>
			<li class="shopconfig_li"><div>
					<span>결제 최소 포인트</span><input type="text" name="sdo" value="${ml[0]['sdo']}">⠀점
				</div>
				<div>
					<span>결제 최대 포인트</span><input type="text" name="spo" value="${ml[0]['spo']}">⠀점
				</div></li>
			<li><span>현금 영수증 발급사용</span><label class="shop_nav">
			<input type="radio" name="spaper" value="Y">사용</label><label class="shop_nav">
			<input type="radio" name="spaper" value="N" checked>미사용</label><a>⠀※현금영수증 관련 사항은
					PG사 가입이 되었을 경우 사용가능 합니다.</a></li>
			<li class="shopconfig_li"><div>
					<span>배송업체명</span><input type="text" name="sden" value="${ml[0]['sden']}">
				</div>
				<div>
					<span>배송비 가격</span><input type="text" name="spri" class="score" value="${ml[0]['spri']}">
				</div></li>
			<li style="margin-bottom: 40px;"><span>희망배송일</span><label
				class="shop_nav">
				
				<input type="radio" name="sdilve" value="Y">사용</label>
				
				<label class="shop_nav">
				
				<input type="radio" name="sdilve" value="N" checked>미사용</label>
				<a>⠀※희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.</a></li>
		</ul>

		<div class="shopsave">
			<span onclick="shopcon()">설정 저장</span> <span>저장 취소</span>
		</div>
	</section>
		</form>
</body>
<script>
	if("${ml[0]['spointok']}" == 'Y'){
		cofig.spointok[0].checked = true;
	}
	else{
		cofig.spointok[1].checked = true;
	}


	if("${ml[0]['scard']}" == 'Y'){
		cofig.scard[0].checked = true;
	}
	else{
		cofig.scard[1].checked = true;
	}

	if("${ml[0]['sphone']}" == 'Y'){
		cofig.sphone[0].checked = true;
	}
	else{
		cofig.sphone[1].checked = true;
	}

	if("${ml[0]['smo']}" == 'Y'){
		cofig.smo[0].checked = true;
	}
	else{
		cofig.smo[1].checked = true;
	}
	
	
	if("${ml[0]['spaper']}" == 'Y'){
		cofig.spaper[0].checked = true;
	}
	else{
		cofig.spaper[1].checked = true;
	}
	
	
	if("${ml[0]['sdilve']}" == 'Y'){
		cofig.sdilve[0].checked = true;
	}
	else{
		cofig.sdilve[1].checked = true;
	}

	function shopcon(){
		cofig.method = "post";
		cofig.action = "./shop_config2.do";
		cofig.submit();
	}
</script>
</html>