<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/copy.css?v=2">
<title></title>
</head>
<body>
	<div class="copybox">
		<div>
			<ul class="copyul">
				<li>회사소개</li>
				<li>이용약관</li>
				<li>개인정보취급방침</li>
				<li>이용안내</li>
				<li>광고/제휴문의</li>
				<li>CUSTOMER CENTER</li>
				<li id="cp7"></li>
			</ul>
			<ul class="copymain">
				<li>
					<div id="cp1" onclick="gong()"></div>
					<div id="cp2"></div>
					<div id="cp3"></div>
					<div>copyright (c) 도메인 주소 All Rights reserved.</div>
				</li>
				<li>
					<div>BANK INFO</div>
					<div id="cp5"></div>
					<div id="cp6"></div>
				</li>
			</ul>
		</div>
	</div>
</body>
<script>
function copyaj(){
	var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var aj = JSON.parse(http.response);
						
						var cp1 = document.getElementById("cp1");
						var cp2 = document.getElementById("cp2");
						var cp3 = document.getElementById("cp3");
						var cp5 = document.getElementById("cp5");
						var cp6 = document.getElementById("cp6");
						var cp7 = document.getElementById("cp7");
						var titlename = document.getElementById("titlename");
						
						cp1.innerText = "상호명 : " + aj[0] + " / 대표 :" + aj[1] + " / 사업자등록번호 : " + aj[2] + " / [사업자정보확인]";
						cp2.innerText = "통신판매업신고번호 : " + aj[3] + " / 사업 주소 : " + aj[4];
						cp3.innerText = "개인정보책임자 : " + aj[5] + " / 개인정보 책임자 E-mail : " + aj[6];
						cp5.innerText = "무통장 은행 : " + aj[7];
						cp6.innerText = "은행계좌번호 : " + aj[8];
						cp7.innerText = aj[9];
						titlename.innerText = aj[0];
						
					}
				}
			}
			http.open("GET","./copy.do");
			http.send();
}
copyaj()

function gong(){
	location.href = "http://www.ftc.go.kr/bizCommPop.do";
}

</script>
</html>