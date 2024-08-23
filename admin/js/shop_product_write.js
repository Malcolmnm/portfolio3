
var pro_code = Math.ceil(Math.random(100000)*999999); 
var rancode = document.getElementById("rancode");
rancode.value = pro_code;

var count = 0;

function backlist(){
	location.href = "./shop_product_list.do";
}


function codecheck(){
	var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var a = http.response;
						if(a == "true"){
							alert("코드가 중복됩니다. 다른코드를 입력바랍니다.");
						}
						else{
							alert("중복되지않은 코드입니다.");
							count++;
						}
					}
				}
			}
			http.open("GET","./shop_codecheck.do?scode=" + sfrm.scode.value);
			http.send();
}
	
	
	
	
function shop_pro(){
	
	if(sfrm.scode== ""){
		alert("상품코드를 입력해주세요.");
	}
	else if(sfrm.sname.value== ""){
		alert("상품명를 입력해주세요.");
	}
	else if(sfrm.stext1.value== ""){
		alert("상품 부가설명을 입력해주세요.");
	}
	else if(sfrm.ssel.value== ""){
		alert("판매가격을 입력해주세요.");
	}
	else if(sfrm.sdis.value== ""){
		alert("상품 할인율을 입력해주세요.");
	}
	else if(sfrm.sfile1.value== ""){
		alert("상품 대표이미지를 설정해주세요.");
	}
	else{
		sfrm.method = "post";
		sfrm.action = "./shop_write.do";
		sfrm.submit();
	}
			
}

function s_price(){
	if(sfrm.ssel.value == ""){
		alert("판매가격을 먼저 입력해주세요.");
		sfrm.sdis.value="";
		sfrm.ssel.focus();
	}
	else{
		sfrm.sdissel.value = sfrm.ssel.value - (sfrm.ssel.value * sfrm.sdis.value / 100);
	}
}



