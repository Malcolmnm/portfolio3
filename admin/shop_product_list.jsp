<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="./css/shop_product_list.css?v=2">
<title>상품리스트</title>
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section class="smbox">
<form id="prof">
	<div class="stop"><a style="color:red;">■</a> 상품관리 페이지</div>
	<div class="stop2">
		<select>
			<option>상품명</option>
			<option>상품코드</option>
		</select>
		<input type="text">
		<input type="button" value="검색" onclick="shoplist()">
	</div>
	<ul class="stopul">
		<li><input type="checkbox" id="checkall" onclick="allck()"></li>
		<li>상품코드</li>
		<li>이미지</li>
		<li>상품명</li>
		<li>대 카테고리</li>
		<li>판매가격</li>
		<li>할인가격</li>
		<li>할인율</li>
		<li>재고현황</li>
		<li>판매유/무</li>
		<li>관리</li>
	</ul>
	<ul class="snoul" id="noul">
		<li>등록된 회원이 없습니다.</li>
	</ul>
<%
	int now_page = (int)request.getAttribute("now_page");
%>
<app:set var="w" value="<%=z - (now_page-1)*8%>"></app:set>
<app:forEach var="top" items="${ml}">
	<ul class="stopul sacul">
		<li><input type="checkbox" id="ck${w}" onclick="ckk(${w})" value="${top['sidx']}"></li>
		<li>${top["scode"]}</li>
		<li><img src="${top['smfile1']}" class="shopimg"></li>
		<li>${top["sname"]}</li>
		<li>${top["smenu1"]}</li>
		<li>${top["ssel"]}</li>
		<li>${top["sdissel"]}</li>
		<li>${top["sdis"]} %</li>
		<li>${top["ssold"]}</li>
		<li>${top["scan"]}</li>
		<li><input type="button" value="수정" onclick="memshi(${top['sidx']})"></li>
	</ul>
<input type="hidden" id="sul${w}" name="sul${w}">

<app:set var="w" value="${w-1}"></app:set>
</app:forEach>
	<div class="snextbox">
<%
		int pg = (int)Math.ceil(z / 8f);
		int ac = 1;
		while(ac <= pg){
%>
	
		<input type="button" onclick="pageing(<%=ac%>)" value="<%=ac%>">
<%
		ac++;
		}
%>
		
	</div>
	<input type="button" value="상품등록" class="sdelbtn2" onclick="prowrite()">
	<input type="button" value="선택삭제" class="sdelbtn" onclick="delbtn()">
	</form>
</section>
<section style="height: 800px;">
	
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>
</body>
<script>
	if("${ml[0]['sidx']}" != ""){
		document.getElementById("noul").style.display = "none";
	}
	else{
		document.getElementById("noul").style.display = "block";
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
	function pageing(no){
		location.href = "./shop_product_list.do?page=" + no;
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
		if(count == 0){
			alert("삭제하실 상품을 선택해주세요.");
		}
		else{
			if(confirm("선택하신 상품을 삭제하시겠습니까?") == true){
				alert("삭제되었습니다.");
				prof.method = "post";
				prof.action = "./shop_product_list.do";
				prof.submit();
			}
			else{
				alert("취소되었습니다.");
			}
		}
	}
	function prowrite(){
		location.href = "./shop_product_write.jsp";
	}
	function shoplist(){
		alert("준비중입니다.");
	}
</script>
</html>