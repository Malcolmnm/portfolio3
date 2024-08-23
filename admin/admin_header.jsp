<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="./js/header.js?v=1"></script>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/header.css?v=3">
<meta charset="UTF-8">
<span style="width: 100%; height: 50px; background-color: rgb(61,60,60)">
<div class="box">
	<ul class="ful">
		<li class="img" onclick="homego()" style="cursor: pointer;"></li>
		<li onclick="homego()" style="cursor: pointer;">ADMINISTRATOR</li>
		<li onclick="backlogin()">[로그아웃]</li>
		<li>[개인정보 수정]</li>
		<li>${unm} 관리자</li>
	</ul>
</div>
</span>
<script>
	function homego(){
		location.href = "./admin_main.do";
	}
</script>