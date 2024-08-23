<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=1"></link>
    <title>Document</title>
</head>
<body>
    <div class="container">
            <div class="contents">
                <span>
                    HOME ▶ 로그인
                </span>
                <div class="sub_cotents">
                    <span>로그인</span>
                    <div class="member_info"> 
                        <h3>회원 로그인</h3>
                    <form id="logck" onsubmit="return loggo()">
                        <ul>
                            <li>
                                <div class="member_login_box">
                                    <span>
                                        <input type="text" id="mid" name="mid" class="login_input" placeholder="아이디를 입력하세요!">
                                    </span>
                                    <span>
                                        <input type="password" id="mpw" name="mpw" class="login_input" placeholder="패스워드를 입력하세요!">
                                    </span>
                                    <button type="submit" class="login_btn" title="회원 로그인">로그인</button>
                                </div>
                            </li>
                            <li>
                                <label class="id_save"><input type="checkbox" id="idck" onclick="idsv(this.checked)"> 아이디 저장</label>
                            </li>
                        </ul>
                        </form>
                        <h3 class="none"></h3>
                        <ol class="btn_login_box">
                            <li>
                            <input type="button" value="회원가입" class="btn_box1" onclick="joingo()" title="회원가입">
                            </li>
                            <li>
                            <input type="button" value="아이디 찾기" class="btn_box1 reserve1" onclick="nogo()" title="아이디 찾기">
                            </li>
                            <li>
                            <input type="button" value="비밀번호 찾기" class="btn_box1 reserve1" onclick="nogo()" title="비밀번호 찾기">
                            </li>
                        </ol>
                        <h3>비회원 로그인</h3>
                        <form id="prock" onsubmit="return progo()">
                        <ul>
                            <li>
                                <div class="member_login_box">
                                    <span>
                                        <input type="text" class="login_input" id="pronm" placeholder="주문자명">
                                    </span>
                                    <span>
                                        <input type="text" maxlength="8" id="pronum" class="login_input" placeholder="주문번호">
                                    </span>
                                    <button type="submit" class="login_btn reserve1" title="비회원 로그인">확인</button>
                                </div>
                            </li>
                            <li style="font-size: 12px; height: 40px; line-height: 40px;">
                                ※ 주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.
                            </li>
                        </ul>
                        </form>
                    </div>
                </div>
            </div>
    </div>
</body>
<script>
	function progo(){
		var pronm = document.getElementById("pronm");
		var pronum = document.getElementById("pronum");
		var procheck = /[A-z가-힣!@#$%^&*]/gi;
		var pronumck = procheck.test(pronum.value);
		if(pronm.value==""){
			 alert("주문자명을 입력해 주세요.");
			 return false;
		}
		else if(pronum.value==""){
			alert("주문번호를 입력해 주세요.");
			 return false;
		}
		else if(pronumck == true){
			alert("주문번호에 숫자만 입력해 주세요.");
			return false;
		}
		else if(pronum.value.length < 8){
			alert("주문번호는 8자리입니다.");
			return false;
		}
		else{
			return false;
			//logck.method = "post";
			//logck.action = "./index.jsp";
			//logck.submit();
		}
	}


	function loggo(){
		var mid = document.getElementById("mid");
		var mpw = document.getElementById("mpw");
		var idck = document.getElementById("idck");
			if(mid.value ==""){
				alert("아이디를 입력해주세요.");
				return false;
			}
			else if(mpw.value==""){
				alert("패스워드를 입력해주세요.");
				return false;
			}
			else{
				if(idck.checked == true){
					localStorage.setItem("userid",mid.value);
				}
				logck.method = "post";
				logck.action = "./login.do";
				logck.submit();
			}
	}
    function idsv(movement){
        if(movement==false){
            localStorage.setItem("userid","");
        }
    }

	
    var saveid = localStorage.getItem("userid");
	var mid = document.getElementById("mid");
    if(saveid != ""){
        mid.value = saveid;
        document.getElementById("idck").checked = true;
    }

	function nogo(){
		alert("서비스 준비중 입니다.");
	}
	
	function joingo(){
		location.href = "./member_join.jsp";
	}
	
	
	
	

</script>
</html>