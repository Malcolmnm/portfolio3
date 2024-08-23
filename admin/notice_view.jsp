<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script src="../ckeditor/ckeditor.js?v=1"></script>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/notice_write.css?v=2">
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section class="write_box">
	<div class="write_sub"><a>■</a> 공지사항 등록페이지</div>
	<form id="shview">
	<div class="write_page">
<app:forEach var="top" items="${ml}">
		<input type="hidden" name="nidx" value="${top['nidx']}">
		<ul class="write_ul">
			<li>공지일자</li>
			<li>${fn:substring(top["ndate"],0,10)}</li>
		</ul>
		
		<ul class="write_ul write_paul">
			<li>공지사항 제목</li>
			<li>${top["nsub"]}</li>
		</ul>
		
		<ul class="write_ul write_paul">
			<li>글쓴이</li>
			<li>${top["nname"]}</li>
		</ul>
		
		<ul class="write_ul write_paul">
			<li>첨부파일</li>
			<li>${top["nfile"]}</li>
		</ul>
		
		<ul class="write_ul write_paul write_sol">
			<li>공지내용</li>
			<li><textarea id="write_text" name="ntext">${top["ntext"]}</textarea></li>
		</ul>
</app:forEach>
	</div>
	<input type="hidden" value="0" name="nview">
	<div class="write_btn">
		<input style="background-color: rgb(132,6,6);" type="button" value="공지삭제" onclick="writesuc()">
		<input style="background-color: rgb(20,4,91);" type="button" value="공지수정" onclick="shiftview()">
		<input style="background-color: rgb(27,25,25);" type="button" value="공지목록" onclick="listgo()">
	</div>
	</form>
</section>
<section style="height: 800px;">
	
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>
<script>
   CKEDITOR.replace('write_text',{
	   width:"700px",
	   height:"440px",
	   editorplaceholder:"내용을 입력하세요."
   });
   
   function listgo(){
	   history.go(-1);
   }
   
   function writesuc(){
		if(confirm("게시물을을 삭제하시겠습니까?") == true){
			alert("삭제되었습니다.");
			shview.method = "post";
			shview.action = "./shiftdelete.do";
			shview.submit();
		}
		else{
			alert("취소되었습니다.");
		}
   }
   function shiftview(){
		if(confirm("게시물을을 수정하시겠습니까?") == true){
			alert("수정되었습니다.");
			shview.method = "post";
			shview.action = "./shiftwrite.do";
			shview.submit();
		}
		else{
			alert("취소되었습니다.");
		}
   }
   
</script>
</body>
</html>