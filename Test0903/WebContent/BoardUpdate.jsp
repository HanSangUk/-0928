<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function boardlist(kategorie){
		location.href="boardlistpaging?kategorie="+kategorie;
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
	.update {
		 height: auto;
         width: 550px;
         border: 2px solid black;
         border-radius: 20px;
         margin:auto;
         display:block;
         padding: 20px;
         font-size: 20px;
	}
	.buttons {
		padding: 15px 25px;
		font-size: 24px;
		text-align: center;
		cursor: pointer;
		outline: none;
		color: #fff;
		background-color: black;
		border: none;
		border-radius: 15px;
		box-shadow: 0 9px #999;
		text-align: center;
		margin-bottom:25px;
	}

	.buttons:hover {
		background-color: #3e8e41
	}
	.buttons:active {
 		background-color: #3e8e41;
 		box-shadow: 0 5px #666;
 		transform: translateY(4px);
	}
	#bcontents{
		height: 500px;
        width: 500px;
        border: 2px solid black;
        padding: 10px;
	}
	.buttontop{
		margin: 15px 0px 0px 110px;
	}
	img{
		height: 350px;
        width: 500px;
	}
	input{
		font-size: 20px;
	}
</style>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
<h1><i class="fas fa-marker"></i> 정보수정</h1>
<div class="update">
	<form action="updateprocess" method="post" name="updateform" enctype="multipart/form-data">
		<i class="fas fa-sort-numeric-up-alt"></i> 글번호 <br><input type="text" name="bnumber" id="bnumber" value="${boardupdate.bnumber}" readonly><br><br>
		<i class="fas fa-user-edit"></i> 작성자 <br><input type="text" name="bwriter" id="bwriter" value="${boardupdate.bwriter}" readonly><br><br>
		<i class="fas fa-heading"></i> 제목 <br><input type="text" name="btitle" id="btitle" value="${boardupdate.btitle}"><br><br>
		<i class="fas fa-file-image"></i> 기존이미지  <br><input type="text" name="bfile" id="bfile" value="${boardupdate.bfile}" readonly><br>
		<br><img src="images/${boardupdate.bfile}"><br>
 		<br><i class="fas fa-file-image"></i> 변경이미지  <input type="file" name="updatefile" id="updatefile" accept="image/*" onchange="setThumbnail(event);"/><br><br>
		<div id="image_container"></div> <br>
		<i class="fas fa-comments"></i> 내용 <br> <input type="text" name="bcontents" id="bcontents" value="${boardupdate.bcontents}"><br><br>
		<br>태그1 <input type="text" name="btag1" id="btag1" style="WIDTH: 105px; HEIGHT: 30px; margin-left: 4px;" value="${boardupdate.btag1}"><br>
      	 태그2 <input type="text" name="btag2" id="btag2" style="WIDTH: 105px; HEIGHT: 30px;" value="${boardupdate.btag2}">
	</form>
	<div class="buttontop">
	<button type = "button" class = "buttons" onclick="UpdateProcess()"><i class="fas fa-eraser"></i> 수정</button>
	<button class = "buttons" onclick="boardlist('${boardupdate.bkategorie}')"><modifyi class="fas fa-clipboard-list"></i> 목록</button>
</div>
</div>
   <script>
   function UpdateProcess(){
		var tagCheck = document.getElementById("btag1").value;
		var titleCheck = document.getElementById("btitle").value;
			if(titleCheck.length == ""){
				alert("제목을 입력해주세요.");
				titleCheck.focus();
				return false;
			}
			
			if(tagCheck.length == ""){
				alert("태그를 입력해주세요.");
				tagCheck.focus();
				return false;
			}
			
			if(confirm("수정하시겠습니까?")){
				updateform.submit();
			}
	}
    </script>
<jsp:include page="footer.jsp" flush="false" />	
</body>
</html>