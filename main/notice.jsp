<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./css/notice.css?v=1"></link>
<title></title>
<body>
	<ul class="noticeul">
		<li>NOTICE</li>
		<li onclick="slls()">+MORE</li>
	</ul>
	<div class="notbox" id="notbox">
	</div>
</body>
<script>
function noti(){
	var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var nodata = JSON.parse(http.response);
						console.log(nodata);
						suclis(nodata);
					}
				}
			}
			http.open("GET","./notice.do");
			http.send();
}
noti()


function suclis(ar){
	var notbox = document.getElementById("notbox");
	var w = ar[0].length /2;
	var no = 1;
	var ww = 0;
	
	while(no <= w){
		var ul = document.createElement("ul");
		var li1 = document.createElement("li");
		li1.innerText = "📢 " + ar[0][ww];
		ww++;
		var li2 = document.createElement("li");
		li2.innerText = ar[0][ww];
		ww++;
		no++;
		ul.append(li1);
		ul.append(li2);
		notbox.append(ul);
	}
	
	var op = ar[1].length / 2;
	var opno = 1;
	var opp = 0;
	
	while(opno <= op){
		var ul = document.createElement("ul");
		var li1 = document.createElement("li");
		li1.innerText = opno+ ". " + ar[1][opp];
		opp++;
		var li2 = document.createElement("li");
		li2.innerText = ar[1][opp];
		opp++;
		ul.append(li1);
		ul.append(li2);
		notbox.append(ul);
		opno++;
	}
	
}

function slls(){
	location.href = "./notice_view.do?page=1";
}





</script>
</html>