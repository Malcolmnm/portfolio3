<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/member_modify.css?v=2">
<title>고객정보 수정</title>
</head>
<body>
	<header class="modify_h">
		<div class="">[ 고객정보 수정 ]</div>
	</header>
	<section class="sec1">
	<div class="divbox1">
	<form id="frm">
<app:forEach var="top" items="${mody}">
		<input type="hidden" name="midx" value="${top.midx}">
		<ul class="boxul">
			<li>아이디</li>
			<li>${top.mid}</li>
		</ul>
		
		<ul class="boxul">
			<li>고객명</li>
			<li>${top.mnm}</li>
		</ul>
		
		<ul class="boxul">
			<li>레벨</li>
			<li><input type="text" class="mote" value="${top.mlevel}" name="mlevel"></li>
		</ul>
		
		<ul class="boxul">
			<li>포인트</li>
			<li><input type="text" class="mote" value="${top.mpoint}" name="mpoint"></li>
		</ul>
<app:if test="${top.mrest == 'Y'}">
		<ul class="boxul">
			<li>휴먼상태</li>
			<li><input type="radio" name="mrest" value="Y"  checked>적용<input type="radio" name="mrest" class="mora" value="N">미적용</li>
		</ul>
</app:if>
<app:if test="${top.mrest == 'N'}">
		<ul class="boxul">
			<li>휴먼상태</li>
			<li><input type="radio" name="mrest" value="Y" >적용<input type="radio" name="mrest" class="mora" value="N" checked>미적용</li>
		</ul>
</app:if>			
		<ul class="boxul">
			<li>탈퇴일자</li>
			<li>${top.mcalldate}</li>
		</ul>
</app:forEach>
</form>
	</div>
	<div class="divbox2">
		<input type="button" value="정보수정" onclick="mobtn_up()">
		<input type="button" value="창닫기" onclick="mobtn_cl()">
	</div>
	</section>
</body>
<script>
function mobtn_cl(){
	window.close();		
}
function mobtn_up(){
	if(confirm("선택하신 계정을 수정하시겠습니까?") == true){
		alert("수정되었습니다.");
		frm.method = "post";
		frm.action = "./modify_up.do";
		frm.submit();
		window.opener.parent.location.reload();
	}
	else{
		alert("취소되었습니다.");
	}
}
</script>
</html>