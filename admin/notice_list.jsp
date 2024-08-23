<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	int z = (int)(request.getAttribute("totals"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/notice_list.css?v=1">
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section class="notice_box">
	<div class="notice_sub"><a>■</a> 공지사항 관리페이지</div>
	<div class="notice_big">
		<ul class="notice_ulsub">
			<li><input type="checkbox" id="checkall" onclick="allck()"></li>
			<li>NO</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>날짜</li>
			<li>조회</li>
		</ul>
		
		<ul class="notice_ulempty" id="noul">
			<li>등록된 공지 내용이 없습니다.</li>
		</ul>
<%
	int now_page = (int)request.getAttribute("now_page");
%>
<form id="delsul">
<app:set var="w" value="<%=z - (now_page-1)*8%>"></app:set>
<app:forEach var="top" items="${ml}">
<app:if test="${top['nsel'] == 'Y'}">
		<ul class="notice_ulsub notice_ultitle">
			<li><input type="checkbox" id="ck${w}" onclick="ckk(${w})" value="${top['nsub']}"></li>
			<li>📢</li>
			<li onclick="wral(${top['nidx']})">${top["nsub"]}</li>
			<li>${top["nname"]}</li>
			<li>${fn:substring(top["ndate"],0,10)}</li>
			<li>${top["nview"]}</li>
		</ul>
</app:if>
<app:if test="${top['nsel'] == 'N'}">
		<ul class="notice_ulsub notice_ultitle">
			<li><input type="checkbox" id="ck${w}" onclick="ckk(${w})" value="${top['nsub']}"></li>
			<li>${w}</li>
			<li onclick="wral(${top['nidx']})">${top["nsub"]}</li>
			<li>${top["nname"]}</li>
			<li>${fn:substring(top["ndate"],0,10)}</li>
			<li>${top["nview"]}</li>
		</ul>
</app:if>

<input type="hidden" id="sul${w}" name="sul${w}">

<app:set var="w" value="${w-1}"></app:set>
</app:forEach>
</form>
	</div>

	<div class="notice_btn">
		<input type="button" value="공지등록" onclick="writego()">
		<input type="button" value="공지삭제" onclick="delbtn()">
	</div>
<%
	int btnpage = (Integer.parseInt(request.getParameter("page")));
	int pagedown = btnpage;
	int pageup = btnpage;
	if(btnpage == 1){
		pagedown = btnpage + 1;
	}
%>
	<div class="notice_numbtn" id="notice_numbtn">
		<ul id="notice_numul">
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
	
</section>
<section style	="height: 800px;">
	
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>
<script>
	console.log(<%=pg%>);
	const noticeNumUl = document.getElementById('notice_numul');
	const liCount = noticeNumUl.getElementsByTagName('li').length;
	noticeNumUl.style.width = (liCount * 35) + "px";
	
	function writego(){
		location.href = "./notice_write.do";
	}

	if("${ml[0]['nsub']}" != ""){
		document.getElementById("noul").style.display = "none";
	}
	else{
		document.getElementById("noul").style.display = "block";
	}
	
	function ckk(no){
		var tec = document.getElementById("ck"+ no);
		var tic = document.getElementById("sul"+ no);
		if(tec.checked == true){
			tic.value = tec.value;
		}
		else if(tec.checked == false){
			tic.value = "";
		}
	}
	
	function delbtn(){
		var ww = ${w+1};
		var count = 0;
		while(ww <= ${w+8}){
			var ck = document.getElementById("ck"+ ww);
			if(ck != null){
				if(document.getElementById("sul"+ ww).value != ""){
					count++;
				}
			}
			ww++;
		}
		console.log(count);
		if(count == 0){
			alert("삭제하실 게시물을 선택해주세요.");
		}
		else{
			if(confirm("선택하신 게시물을을 삭제하시겠습니까?") == true){
				alert("삭제되었습니다.");
				delsul.method = "post";
				delsul.action = "./notice_list.do?page=<%=btnpage%>";
				delsul.submit();
			}
			else{
				alert("취소되었습니다.");
			}
		}
	}
	
	function pageing(no){
		location.href = "./notice_list.do?page=" + no;
	}
	
	function wral(no){
		location.href = "./notice_view.do?nidx="+no;
	}
	
	function allck(){
		var checkall = document.getElementById("checkall");
		var ww = ${w+1};
		if(checkall.checked == true){
			while(ww <= ${w+8}){
				var ck = document.getElementById("ck"+ ww);
				var sul = document.getElementById("sul"+ww);
				if(ck != null){
					sul.value = ck.value;
					ck.checked = true;
				}
				ww++;
			}
		}
		else{
			while(ww <= ${w+8}){
				var ck = document.getElementById("ck"+ ww);
				var sul = document.getElementById("sul"+ww);
				if(ck != null){
					sul.value = "";
					ck.checked = false;
				}
				ww++;
			}
		}
	}
</script>
</body>
</html>