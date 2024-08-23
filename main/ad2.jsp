<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"  type="text/css" href="./css/ad2.css?v=2">
<title></title>
</head>
<body>
	<div class="ad2box">
		<div id="ad2" onclick="ad2go()">
		
		</div>
	</div>
</body>
<script>

var adhr2 = "";
function aad2(){
	var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var nen = JSON.parse(http.response);
						var ad2 =  document.getElementById("ad2");
					    var img = document.createElement("img");
					    img.setAttribute("src", nen[0]);
					    img.setAttribute("alt", "adbanner2");
						ad2.append(img);
						adhr2 = nen[1];
					}
				}
			}
			http.open("GET","./ad2.do");
			http.send();
}
aad2()





function ad2go(){
	location.href = adhr2;
}
</script>
</html>