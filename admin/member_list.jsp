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
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/member_list.css?v=1">
<title>회원관리</title>
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section class="mbox">
	<div class="top"><a style="color:red;">■</a> 회원관리</div>
	<form id="mems">
	<div class="top2">
		<select name="memsel1">
			<option value="1">아이디</option>
			<option value="2">고객명</option>
			<option value="3">휴대폰</option>
		</select>
		<input type="text" name="memsel2">
		<input type="button" value="검색" onclick="mem()">
	</div>
	</form>
	<ul class="topul">
		<li><input type="checkbox" id="checkall" onclick="allck()"></li>
		<li>아이디</li>
		<li>고객명</li>
		<li>휴대폰</li>
		<li>전화번호</li>
		<li>레벨</li>
		<li>포인트</li>
		<li>최종접속</li>
		<li>가입일</li>
		<li>메일수신</li>
		<li>SMS 수신</li>
		<li>관리</li>
	</ul>
	<ul class="noul" id="noul">
		<li>등록된 회원이 없습니다.</li>
	</ul>
<%
	int now_page = (int)request.getAttribute("now_page");
%>
<form id="delsul">
<app:set var="w" value="<%=z - (now_page-1)*4%>"></app:set>
<app:forEach var="top" items="${ml}">
	<ul class="topul acul">
		<li><input type="checkbox" id="ck${w}" onclick="ckk(${w})" value="${top['mid']}"></li>
		<li>${top["mid"]}</li>
		<li>${top["mnm"]}</li>
		<li>${top["mcel"]}</li>
		<li>${top["mtel"]}</li>
		<li>${top["mlevel"]}</li>
		<li>${top["mpoint"]}</li>
		<li>${top["mcalldate"]}</li>
		<li>${top["mindate"]}</li>
		<li>${top["memag"]}</li>
		<li>${top["msmsag"]}</li>
		<li><input type="button" value="수정" onclick="memshi(${top['midx']})"><input type="button" value="정지"></li>
	</ul>

	<input type="hidden" id="sul${w}" name="sul${w}">
<app:set var="w" value="${w-1}"></app:set>
</app:forEach>
</form>
	<div class="nextbox">
	<%
		int pg = (int)Math.ceil(z / 4f);
		int ac = 1;
		while(ac <= pg){
	%>
		<input type="button" onclick="pageing(<%=ac%>)" value="<%=ac%>">
	<%
		ac++;
		}
	%>
	</div>
	<input type="button" value="선택삭제" class="delbtn" onclick="delbtn()">
</section>
<section style="height: 800px;">
	
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>
</body>
<script src="./js/member_list.js?v=2"></script>
<script>
	if("${ml[0]['mid']}" != ""){
		document.getElementById("noul").style.display = "none";
	}
	else{
		document.getElementById("noul").style.display = "block";
	}
	
	function allck(){
		var checkall = document.getElementById("checkall");
		var ww = ${w+1};
		if(checkall.checked == true){
			while(ww <= ${w+4}){
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
			while(ww <= ${w+4}){
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
	function pageing(no){
		location.href = "./member_list.do?page=" + no;
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
		while(ww <= ${w+4}){
			var ck = document.getElementById("ck"+ ww);
			if(ck != null){
				if(document.getElementById("sul"+ ww).value != ""){
					count++;
				}
			}
			ww++;
		}
		if(count == 0){
			alert("삭제하실 계정을 선택해주세요.");
		}
		else{
			if(confirm("선택하신 계정을 삭제하시겠습니까?") == true){
				alert("삭제되었습니다.");
				delsul.method = "post";
				delsul.action = "./member_list.do";
				delsul.submit();
			}
			else{
				alert("취소되었습니다.");
			}
		}
	}
	function memshi(no){
		var url = "./member_modify.do?midx="+ no;
        var option = "width = 550, height = 450"
        window.open(url ,"", option);
	}

	function mem(){
		alert("준비중입니다.");
		//mems.method = "post";
		//mems.action = "./member_list.do";
		//mems.submit();
	}
	
</script>
</html>