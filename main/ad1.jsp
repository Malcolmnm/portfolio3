<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/ad1.css?v=2">
<title></title>
</head>
<body>
	<div class="ad1box">
		<div id="ad1" onclick="ad1go()">
		
		</div>
	</div>
</body>
<script>

var adhr = "";
function aad(){
	var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var non = JSON.parse(http.response);
						console.log(non[0]);
						var ad1 =  document.getElementById("ad1");
					    var img = document.createElement("img");
					    img.setAttribute("src", non[0]);
					    img.setAttribute("alt", "adbanner1");
						ad1.append(img);
						adhr = non[1];
					}
				}
			}
			http.open("GET","./ad1.do");
			http.send();
}
aad()





function ad1go(){
	location.href = adhr;
}
</script>
</html>