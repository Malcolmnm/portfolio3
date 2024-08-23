function go(a){
	if(a == 1){
		location.href = "./add_master.html";
	}
	else{
		location.href = "./add_master_search.html";
	}
}
function log(){
	var t1 = document.getElementById("t1");
	var t2 = document.getElementById("t2");
	if(t1.value == ""){
		alert("아이디를 입력해주세요.");
	}
	else if(t1.value == "admin" || t1.value == "master"){
		alert("입력불가능한 아이디입니다.")
	}
	else if(t2.value == ""){
		alert("패스워드를 입력해주세요.");
	}
	else{
		dogo.method="post";
		dogo.action="./login_check.do";
		dogo.submit();
	}	
}