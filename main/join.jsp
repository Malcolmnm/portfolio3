<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/join.css?v=1"></link>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<title></title>
</head>
<body>
	<div class="joinbox">
	<form id="jn">
		<div class="join_tag">HOME > 회원가입 > 정보입력</div>
		
		<ul class="join_ul">
			<li>회원가입</li>
			
			<li>03 가입완료</li>
			<li></li>
			<li>02 정보입력</li>
			<li></li>
			<li>01 약관동의</li>
		</ul>
		
		<div class="join_tep">기본정보</div>
		
		<div class="join_ulcss">
			<ul>
				<li>아이디</li>
				<li><input type="text" name="mid"></li>
			</ul>
			<ul>
				<li>비밀번호</li>
				<li><input type="password" name="mpw"></li>
			</ul>
			<ul>
				<li>비밀번호 확인</li>
				<li><input type="password"></li>
			</ul>
			<ul>
				<li>이름</li>
				<li><input type="text"  name="mnm"></li>
			</ul>
			<ul>
				<li>이메일</li>
				<li>
					<input type="text"  name="mem">
					<select onchange="ems()" id="hob">
						<option value="">직접입력</option>
						<option>naver.com</option>
						<option>nate.com</option>
						<option>gmail.com</option>
					</select>
				<a><input type="checkbox"  name="memag" value="Y">정보/이벤트 메일 수신에 동의합니다.</a>
				</li>
			</ul>
			<ul>
				<li>휴대폰번호</li>
				<li>
					<input type="text" placeholder="-없이 입력하세요." name="mcel" maxlength="13">
				<a><input type="checkbox" name="msmsag" value="Y">정보/이벤트 SMS 수신에 동의합니다.</a>
				</li>
			</ul>
			
			<ul>
				<li>전화번호</li>
				<li><input type="text" placeholder="-없이 입력하세요."  maxlength="13" name="mtel"></li>
			</ul>
		
			
			<ul>
				<li>주소</li>
				<li>
					<a><input type="text" id="rd1" class="postcodify_postcode5" maxlength="5" readonly="readonly"><input type="button" value="우편번호검색" id="addpost"></a>
					<a><input type="text" id="rd2" class="postcodify_address"></a>
					<a><input type="text" id="rd3" ></a>
            	<input type="hidden" name="mad"  id="rdt">
				</li>
			</ul>
			<input type="hidden" name="mlevel" value="1">
			<input type="hidden" name="mpoint" value="0">
			<input type="hidden" name="mrest" value="N">
			<input type="hidden" name="mindate" value="1">
			<div class="join_btn">
				<input type="button" value="취소">
				<input type="button" value="회원가입" onclick="mainj()">
			</div>
		</div>
		</form>
	</div>
</body>
<script>

	$(function() {
		$("#addpost").postcodifyPopUp();
	});
	
	var now = new Date();
	var now1 = now.getFullYear();
	var now2 = now.getMonth();
	var now3 = now.getDate();
	var mtime = now1 + now2 + now3;
	
	
	
	
	function mainj(){
		if(jn.mid.value=="" || jn.mpw.value=="" || jn.mnm.value=="" || jn.mem.value=="" || jn.mcel.value==""){
			alert("회원가입 정보를 확인해주세요.");
		}
		else{
			var rd1 = document.getElementById("rd1");
			var rd2 = document.getElementById("rd2");
			var rd3 = document.getElementById("rd3");
			var rdt = document.getElementById("rdt");
		
			
			jn.mindate.value = mtime;
			rdt.value = rd1.value + rd2.value + rd3.value;
			jn.method = "post";
			jn.action = "./join.do";
			jn.submit();
		}
		
	}
	
	function ems(){
		var hob = document.getElementById("hob");
		
		if(jn.mem.value.split("@")[0] != null){
			jn.mem.value = jn.mem.value.split("@")[0] +"@" + hob.value;
		}
		else{
			jn.mem.value = jn.mem.value +"@" + hob.value;
		}
	}
</script>
</html>