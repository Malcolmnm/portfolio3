var count;

function dogo(a){
	if(a == 1){
		location.href = "./index.html";
	}
	else{
		var id1 = document.getElementById("id1");
		var pw1 = document.getElementById("pw1");
		var pw2 = document.getElementById("pw2");
		var nm1 = document.getElementById("nm1");
		var em1 = document.getElementById("em1");
		var tel1 = document.getElementById("tel1");
		var tel2 = document.getElementById("tel2");
		var tel3 = document.getElementById("tel3");
		var sel1 = document.getElementById("sel1");
		var sel2 = document.getElementById("sel2");
		var utel = document.getElementById("utel");
		
		utel.value = tel1.value + tel2.value + tel3.value; 
		
		var idcheck = /[0-9a-z]/gi;
		var idck = idcheck.test(id1.value);
		
		var pwcheck = /[0-9a-z!@#$%^&*]/gi;
		var pwck = pwcheck.test(pw1.value);
		
		var nmcheck = /[a-z가-힣]/gi;
		var nmck = nmcheck.test(nm1.value);
		
		var emcheck = /[0-9a-z]+@[0-9a-z]+.[a-z]+/gi;
		var emck = emcheck.test(em1.value);
		
		var telcheck = /[0-9]/g;
		var telck2 = telcheck.test(tel2.value);
		var telck3 = telcheck.test(tel3.value);
				
		
		if(id1.value == ""){
			alert("아이디를 입력해주세요.");
			id1.focus();
		}
		else if(idck == false){
			alert("아이디를 확인해주세요.");
			id1.focus();
		}
		else if(pw1.value == ""){
			alert("패스워드를 입력해주세요.");
			pw1.focus();
		}		
		else if(pwck == false){
			alert("숫자와 문자 특수기호를 확인해주세요.");
			pw1.focus();
		}
		else if(pw1.value.length < 8){
			alert("8자리 이상 입력해주세요.");
			pw1.focus();
		}
		else if(pw1.value != pw2.value){
			alert("동일한 패스워드를 입력해주세요.");
			pw2.focus();
		}
		else if(nm1.value == ""){
			alert("담당자 이름을 입력해주세요.");
			nm1.focus();
		}
		else if(nmck == false){
			alert("담당자 이름을 확인해주세요.");
			nm1.focus();
		}
		else if(em1 == ""){
			alert("담당자 이메일을 입력해주세요.");
			em1.focus();
		}
		else if(emck == false){
			alert("담당자 이메일을 확인해주세요.");
			em1.focus();
		}
		else if(tel2 == ""){
			alert("전화번호를 입력해주세요.");
			tel2.focus();
		}
		else if(tel3 == ""){
			alert("전화번호를 입력해주세요.");
			tel3.focus();
		}
		else if(telck2 == false){
			alert("전화번호를 확인해주세요.");
			tel2.focus();
		}
		else if(telck3 == false){
			alert("전화번호를 확인해주세요.");
			tel3.focus();
		}
		else if(sel1.value == ""){
			alert("담당자 부서를 선택해주세요.");
		}
		else if(sel2.value == ""){
			alert("담당자 직책를 선택해주세요.");
		}
		else{
			if(count == 0){
				alert("아이디 중복체크를 해주세요.");
			}
			else{
				joingo.method = "post";
				joingo.action="./joinok.do";
				joingo.submit();
			}
		}
	}
}
function idck(){
	var id1 = document.getElementById("id1");
		if(id1.value == ""){
			alert("아이디를 입력해주세요.");
			id1.focus();
		}
		else{
			var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var a = http.response;
						if(a == "true"){
							alert("아이디가 중복됩니다.");
							id1.value = "";
							id1.focus();
						}
						else{
							alert("사용가능한 아이디입니다.");
							count++;
						}
					}
				}
			}
			http.open("GET","./joinid_check.do?userid=" + id1.value);
			http.send();
		}
}
function idkey(){
	count = 0;
}
