<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	int z = (int)(request.getAttribute("totals"));
%>
<html>
<head>
<meta charset="ko">
<title id=titlename></title>
<link rel="stylesheet" type="text/css" href="./css/notice_view.css?v=2">
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
		<div class="vbox">
			<div>HOME > NOTICE</div>
			<div>NOTICE</div>
			
		<ul class="vul1">
			<li>NO</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>날짜</li>
			<li>조회수</li>
		</ul>
<%
	int now_page = (int)request.getAttribute("now_page");
%>
<app:set var="w" value="<%=z - (now_page-1)*8%>"></app:set>
<app:forEach var="top" items="${ml}">
<app:if test="${top['nsel'] == 'Y'}">
		<ul class="vul1 vul2">
			<li>📢</li>
			<li>${top["nsub"]}</li>
			<li>${top["nname"]}</li>
			<li>${fn:substring(top["ndate"],0,10)}</li>
			<li>${top["nview"]}</li>
		</ul>
</app:if>
<app:if test="${top['nsel'] == 'N'}">
		<ul class="vul1 vul2">
			<li>${w}</li>
			<li>${top["nsub"]}</li>
			<li>${top["nname"]}</li>
			<li>${fn:substring(top["ndate"],0,10)}</li>
			<li>${top["nview"]}</li>
		</ul>
</app:if>
<app:set var="w" value="${w-1}"></app:set>
</app:forEach>

<%
	int btnpage = (Integer.parseInt(request.getParameter("page")));
	int pagedown = btnpage;
	int pageup = btnpage;
	if(btnpage == 1){
		pagedown = btnpage + 1;
	}
%>
		<div class="pdiv">
			<ul class="pul">
				<li onclick="pageing(1)"><<</li>
				<li onclick="pageing(<%=pagedown - 1%>)"><</li>
<%
		int pg = (int)Math.ceil(z / 8f);
		int ac = 1;
		while(ac <= pg){
%>
				<li onclick="pageing(<%=ac%>)"><%=ac%></li>
<%
		ac++;
		}
		
		if(btnpage == ac - 1){
			pageup = btnpage -1 ;
		}
%>
				<li onclick="pageing(<%=pageup + 1%>)">></li>
				<li onclick="pageing(<%=ac-1%>)">>></li>
			</ul>
		</div>
	
			<div class="pdiv2">
				<input type="text" placeholder="검색할 제목을 입력하세요.">
				<input type="button" value="검색">
			</div>
		</div>
	</section>
	
	
	<footer class="cp_css" style="background-color: #cccccc">
		<div id="cp">
			<%@ include file="copy.jsp" %>
		</div>
	</footer>

</body>
<script>
function pageing(no){
	location.href = "./notice_view.do?page=" + no;
}
</script>
</html>