<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
	<form id="write_good2">
	<input type="hidden" name="nsel" value="N">
	<div class="write_page">
		<ul class="write_ul">
			<li>공지사항 여부</li>
			<li><input type="checkbox" id="nsel_id"> 공지출력 ※공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.</li>
		</ul>
		
		<ul class="write_ul write_paul">
			<li>공지사항 제목</li>
			<li><input type="text" maxlength="150" class="write_in1" id="nsub" name="nsub"> ※ 최대 150자까지 입력이 가능</li>
		</ul>
		
		<ul class="write_ul write_paul">
			<li>글쓴이</li>
			<li><input type="text" class="write_in2" id="nname" name="nname"> ※ 관리자 이름이 노출 됩니다.</li>
		</ul>
		
		<ul class="write_ul write_paul">
			<li>첨부파일</li>
			<li><input type="file" name="nfile"> ※ 첨부파일 최대 용량은 2MB 입니다.</li>
		</ul>
		
		<ul class="write_ul write_paul write_sol">
			<li>공지내용</li>
			<li><textarea id="write_text" name="ntext"></textarea></li>
		</ul>
	</div>
	<input type="hidden" value="0" name="nview">
	<div class="write_btn">
		<input type="button" value="공지등록" onclick="writesuc()">
		<input type="button" value="공지목록" onclick="listgo()">
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
   
   function writesuc(){
	   var nsub = document.getElementById("nsub");
	   var nname = document.getElementById("nname");
	   var nsel_id = document.getElementById("nsel_id");
	   var ntext = CKEDITOR.instances.write_text.getData();
	   
	   if(nsel_id.checked == true){
		   write_good2.nsel.value = "Y";
	   }
	   
	   if(nsub.value == ""){
		   alert("제목을 입력해주세요.");
		   nsub.focus();
	   }
	   else if(nname.value == ""){
		   alert("글쓴이를 입력해주세요.");
		   nname.focus();
	   }
  	   else if(ntext == ""){
	   	   alert("내용을 입력해주세요.");
       }
  	   else{
  		   write_good2.method = "post";
  		   write_good2.action = "./writego.do";
  		   write_good2.submit();
	   }
   }
   function listgo(){
	  	history.go(-1);
   }
</script>
</body>
</html>