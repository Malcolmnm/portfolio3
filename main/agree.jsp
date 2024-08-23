<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/agree.css?v=1"></link>
<title></title>
</head>
<body>
	<div class="joinbox">
		<div class="join_tag">HOME > 회원가입 > 약관동의</div>
		
		<ul class="join_ul">
			<li>회원가입</li>
			
			<li>03 가입완료</li>
			<li></li>
			<li>02 정보입력</li>
			<li></li>
			<li>01 약관동의</li>
		</ul>
		
		<div class="join_tep">약관동의</div>
		<label class="join_tep2"><input type="checkbox" id="ckall" onclick="allck()">베스트샵의 모든 약관을 확인하고 전체 동의 합니다.<a>(전체동의, 선택항목도 포함됩니다.)</a></label>
		<label class="join_tep2"><input type="checkbox" id="ck1">(필수)<a>이용약관</a><a>전체보기</a><a>></a></label>
		<div id="agree_box" class="join_notice"></div>
		
		<label class="join_tep2"><input type="checkbox" id="ck2">(필수)<a>개인정보 수집 및 이용</a><a>전체보기</a><a>></a></label>
		<div id="agree_box2" class="join_notice"></div>
		
		<div class="btnbox">
			<input class="joinbtn" type="button" value="다음단계" onclick="join1_next()">
		</div>
	</div>
</body>
<script>
	var agree = function(z){
   		var http = new XMLHttpRequest();
   		http.open("GET",z,false);
    	http.send();
    	return http.response;
	}

	var agree_box = document.getElementById("agree_box");
	agree_box.innerText =  agree("./agreement/agree1.txt");
	
	var agree_box2 = document.getElementById("agree_box2");
	agree_box2.innerText = agree("./agreement/agree2.txt");
	
	
	function allck(){
		var ckall = document.getElementById("ckall");
		var ck1 = document.getElementById("ck1");
		var ck2 = document.getElementById("ck2");
		
		if(ckall.checked == true){
			ck1.checked = true;
			ck2.checked = true;
		}
		else{
			ck1.checked = false;
			ck2.checked = false;
		}
	}
	
	function join1_next(){
		var ck1 = document.getElementById("ck1");
		var ck2 = document.getElementById("ck2");
		if(ck1.checked == true && ck2.checked == true){
			location.href = "./member_join2.jsp";
		}
		else{
			alert("약관동의를 전부 동의해주세요.");
		}
		
	}
	
	
	
	
</script>
</html>