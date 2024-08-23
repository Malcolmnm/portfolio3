<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<script src="./js/list.js?v=1"></script>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/list.css?v=1">
<meta charset="UTF-8">
<div class="lbox" style="margin:auto;">
	<div>
		<a style="color:red;">■</a>  <a>신규 등록 관리자</a>
	</div>
	<ul class="lul">
		<li>NO</li>
		<li>관리자명</li>
		<li>아이디</li>
		<li>전화번호</li>
		<li>이메일</li>
		<li>담당부서</li>
		<li>담당직책</li>
		<li>가입일자</li>
		<li>승인여부</li>
	</ul>
	<form id="frm" method="post">
	<app:set var="w" value="1"></app:set>
	<app:forEach var="top" items="${nc}">
	<ul class="lul lul2">
		<li>${w}</li>
		<li>${top["unm"]}</li>
		<li>${top["uid"]}</li>
		<li>${top["utel"]}</li>
		<li>${top["uem"]}</li>
		<li>${top["uteam"]}</li>
		<li>${top["umen"]}</li>
		<li>${top["udate"]}</li>
		<li><input type="button" value="승인" onclick="okgo(${w})"><input type="button" value="미승인" onclick="nogo(${w})"></li>
		<input type="hidden" id="so${w}" value="${top['uid']}">
	</ul>
	<app:set var="w" value="${w+1}"></app:set>
		<input type="hidden" name="uid" id="uid">
	</app:forEach>
	</form>
</div>
<script>
function okgo(no){
	if(confirm("승인 하시겠습니까?")){
		var num = no - 1;
		document.getElementById("uid").value = document.getElementById("so"+no).value;
		frm.action = "okgo.do";
		frm.submit();
	}
}
function nogo(no){
	if(confirm("미승인 하시겠습니까?")){
		var num = no - 1;		
		document.getElementById("uid").value = document.getElementById("so"+no).value;
		frm.action = "nogo.do";
		frm.submit();
	}
}
</script>