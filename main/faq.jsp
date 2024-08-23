<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="ko">
<title id=titlename></title>
<link rel="stylesheet" type="text/css" href="./css/faq.css?v=2"></link>
<script defer="defer" src="./static/js/main.8a4c07a8.js"></script>
<link href="./static/css/main.8faa5e5b.css" rel="stylesheet">
</head>
<body>
	<header class="header_css">
		<div id="top" class="topcss"></div>
	</header>
	<nav class="menu_css">
		<div id="menu"></div>
	</nav>
	<section>
<div class="faq">
	<div>HOME > FAQ</div>
	<div>FAQ</div>
	<ul class="menu">
		<li onclick="pur(0)" id="purl0" >전체</li>
		<li>|</li>
		<li onclick="pur(1)" id="purl1">상품구매</li>
		<li>|</li>
		<li onclick="pur(2)" id="purl2">상품배송</li>
		<li>|</li>
		<li onclick="pur(3)" id="purl3">상품반품</li>
		<li>|</li>
		<li onclick="pur(4)" id="purl4">개인정보변경</li>
		<li>|</li>
		<li onclick="pur(5)" id="purl5">회원가입/탈퇴</li>
	</ul>
	<app:set var="w" value="1"></app:set>
	<app:forEach var="list" items="${faq}">
	<ul class="list" id="list${w}">
		<li class="listq" id="listq" onclick="question(${w})"><span>Q.</span> <span>${list.qques}</span></li>
		<li class="lista" id="view${w}" style="display: none;"><span>A.</span> <span>${list.qanswer}</span></li>
	</ul>
	<app:set var="w" value="${w+1}"></app:set>
	</app:forEach>
	<form id=faq2>
		<input type="hidden" name="sel"> 
	</form>
</div>
</section>
	<footer class="cp_css" style="background-color: #cccccc">
		<div id="cp">
			<%@ include file="copy.jsp" %>
		</div>
	</footer>

</body>
<script>
function question(no) {
	var listq = document.getElementById("listq");
	var op = ${w-1};
	var ww = 1;
	while(ww <= op){
		var view = document.getElementById("view" + ww);
		if(view){
		view.style.display = "none";	
		}
		ww++;
	}
	var viewsel = document.getElementById("view" + no);	
	viewsel.style.display = "block";
}
<%
	String mo = (String)request.getAttribute("mo");
%>


function bod(moo){
	if(moo =="" || moo==null){
		moo = 0;
	}
	var purl = document.getElementById("purl"+moo);
      purl.style.fontWeight = "bold";
	
}
bod(<%=mo%>);

function pur(no){
	
	
	if(no != 0){
		faq2.sel.value = no;
	}
	faq2.method="post";
	faq2.action="./faq.do";
	faq2.submit();
}
function all1(){
	location.href="./faq.do";
}
</script>
</html>