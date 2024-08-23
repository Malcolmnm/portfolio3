<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/newarrival.css?v=1">
<title></title>
</head>
<body>
	<div class="newsbox">
		<div>
			<div class="newtitle">NEW ARRIVAL</div>		
			<ul class="aribox" id="aribox">

			</ul>
		</div>
	</div>
</body>
<script>

function ariv(){
	var http;
			if(window.XMLHttpRequest){
				http = new XMLHttpRequest();
			}
			http.onreadystatechange = function(){
				if(http.readyState == XMLHttpRequest.DONE){
					if(http.status == 200){
						var non = JSON.parse(http.response);
						lino(non);
					}
				}
			}
			http.open("GET","./newarrival.do");
			http.send();
}
ariv()

function lino(ar){
	var aribox = document.getElementById("aribox");
	
	var w = 1;
	var ww = 0;
	while(w <=9){
		var li = document.createElement("li");
		var ol = document.createElement("ol");
		
	    var li1 = document.createElement("li");
	    var img = document.createElement("img");
	    img.setAttribute("src", ar[ww]);
 			ww++;
			
			var li2 = document.createElement("li");
			li2.innerText = ar[ww];
			ww++;
			
			var li3 = document.createElement("li");
			li3.innerText = ar[ww];
			ww++;
			
			var li4 = document.createElement("li");
			li4.innerText = ar[ww]+" 원";
			ww++;
			
			li1.append(img);
			ol.append(li1);
			ol.append(li2);
			ol.append(li3);
			ol.append(li4);
			li.append(ol);
			aribox.append(li);
			 
		w++;
	}
	
	
	
}


</script>
</html>