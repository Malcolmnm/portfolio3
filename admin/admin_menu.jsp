<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="./js/menu.js?v=1"></script>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/menu.css?v=1">
<meta charset="UTF-8">
<span style="width: 100%; height: 70px; background-color: #333333">
<div class="boxh" style="margin:auto;">
	<ul class="hul">
		<li onclick="hul(1)">쇼핑몰 기본설정</li>
		<li onclick="hul(2)">회원관리</li>
		<li onclick="hul(3)">공지사항</li>
		<li onclick="hul(4)">쇼핑몰관리</li>
		<li onclick="hul(5)">상품리스트</li>
		<li>주문내역</li>
		<li>매출내역</li>
	</ul>
</div>
</span>
<script>
	function hul(no){
		if(no == 1){
			location.href = "./shop_config.do";
		}
		else if(no == 2){
			location.href = "./member_list.do";
		}	
		else if(no == 3){
			location.href = "./notice_list.do?page=1";
		}
		else if(no == 4){
			location.href = "./shop_setup.do";
		}
		else if(no == 5){
			location.href = "./shop_product_list.do";
		}
	}
</script>