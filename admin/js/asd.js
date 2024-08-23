var count;

function dogo(a){
	if(a == 1){
		location.href = "./user_agree.html";
	}
	else{
		var id1 = document.getElementById("jid");
		var pw1 = document.getElementById("jpw");
		var pw2 = document.getElementById("jpw2");
		var nm1 = document.getElementById("jnm");
		var tel = document.getElementById("jtel");
		var em1 = document.getElementById("jem");
		
		var idcheck = /[0-9a-z]/gi;
		var idck = idcheck.test(id1.value);
		
		var pwcheck = /[0-9a-z!@#$%^&*]/gi;
		var pwck = pwcheck.test(pw1.value);
		
		var nmcheck = /[a-z가-힣]/gi;
		var nmck = nmcheck.test(nm1.value);
		
		var emcheck = /[0-9a-z]+@[0-9a-z]+.[a-z]+/gi;
		var emck = emcheck.test(em1.value);
		
		var telcheck = /[0-9]/g;
		var telck = telcheck.test(tel.value);		
		
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
		else if(tel == ""){
			alert("전화번호를 입력해주세요.");
			tel.focus();
		}
		else if(telck == false){
			alert("전화번호를 확인해주세요.");
			tel.focus();
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
	var id1 = document.getElementById("jid");
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
