<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function boardlist(){
		location.href="boardlist";
	}
	
	function setThumbnail(event) {
		var reader = new FileReader(); 
		reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); 
	}
	
	
</script>
<style>

	#bcontents{
		 height: 500px;
         width: 500px;
	}
	.board{
		height: auto;
        width: 545px;
        margin:auto;
        display:block;
        border:2px solid black;
        border-radius: 20px;
        padding:20px;
        font-size: 20px;
	}

	.button {
		padding: 15px 25px;
		font-size: 24px;
		text-align: center;
		cursor: pointer;
		outline: none;
		color: #fff;
		background-color: #4CAF50;
		border: none;
		border-radius: 15px;
		box-shadow: 0 9px #999;
		margin-bottom:20px;
	}

	.button:hover {
		background-color: #3e8e41
	}

	.button:active {
		background-color: #3e8e41;
		box-shadow: 0 5px #666;
		transform: translateY(4px);
	}
	input{
		font-size: 20px;
	}
</style>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
<% 
	request.setCharacterEncoding("UTF-8");
	String kategorie = request.getParameter("kategorie"); 
%>
	
	<h1><i class="fas fa-marker"></i> 게시글 작성</h1>
    <div class="board">
      <form action="board" method="post" name="writeform" enctype="multipart/form-data">
		<i class="fas fa-clipboard-list"></i> 카테고리  <select name="bkategorie">
			<option value="papermodel">종이모형
			<option value="lego">레고
			<option value="plamodel">프라모델
			<option value="miniature">미니어쳐
		</select><br>     
		<br><i class="fas fa-user-edit"></i> 작성자 <br> <input type="text" name="bwriter" value='${loginId}' readonly><br>
		<br><i class="fas fa-heading"></i> 제목 <br> <input type="text" name="btitle" id="btitle"><br>
		<br><i class="fas fa-comments"></i> 내용 <br> <input type="text" name="bcontents" id="bcontents"><br>
		<br><i class="fas fa-file-image"></i> 파일첨부 <br> <input type="file" name="bfile" id="bfile" accept="image/*" onchange="setThumbnail(event);"/><br>
		<div id="image_container"></div>
      	<br>태그1 <input type="text" name="btag1" id="btag1" style="WIDTH: 105px; HEIGHT: 30px; margin-left: 4px;"><br>
      	 태그2 <input type="text" name="btag2" style="WIDTH: 105px; HEIGHT: 30px;">
     	</form>
     	<div class="bt" style="padding:20px 0px 0px 100px;">
        	<button type="button" style="WIDTH: 100pt; HEIGHT: 40pt;" class="button" onclick="boardwrite()"><i class="fas fa-marker"></i> 작성</button>
        	<button type="button"style="WIDTH: 100pt; HEIGHT: 40pt;" class="button" onclick="location.href='boardlistpaging?kategorie=<%= kategorie%>'"><i class="fas fa-clipboard-list"></i> 목록</button>
    	</div>
    </div>
    <script>function boardwrite(){
		var fileCheck = document.getElementById("bfile").value;
		var tagCheck = document.getElementById("btag1").value;
		var titleCheck = document.getElementById("btitle").value;
			if(titleCheck.length == ""){
				alert("제목을 입력해주세요.");
				titleCheck.focus();
				return false;
			}
			
			if(fileCheck.length == ""){
				alert("파일을 첨부해주세요.");
				fileCheck.focus();
				return false;
			}
			
			if(tagCheck.length == ""){
				alert("태그를 입력해주세요.");
				tagCheck.focus();
				return false;
			}
			
			writeform.submit();
	}
    </script>
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>