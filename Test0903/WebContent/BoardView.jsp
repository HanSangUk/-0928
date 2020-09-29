<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, td {
	border: 3px black solid;
	text-align: center;
	border-collapse: collapse;
}
</style>
<script>
	function boardlist(kategorie){
		location.href="boardlistpaging?kategorie="+kategorie;
	}
	
	function boarddelete(deleteid, up) {
		var ids = '${sessionScope.loginId}';
		/* 	var ids = sessionStorage.getItem('loginId'); */
		console.log(ids);
		var up = up;
		if(up==ids){
			if(confirm("정말 삭제하시겠습니까?"))
			location.href = "boarddelete?bnumber=" + deleteid;
		} else {
			alert("작성자가 아닙니다");
		}
	}
	
	function boardupdate(update, up){
		var ids = '${sessionScope.loginId}';
		/* var ids = sessionStorage.getItem('loginId'); */
		console.log(ids);
		var up = up;
		if(up==ids){
			location.href = "boardupdate?bnumber=" + update;
		} else {
			alert("작성자가 아닙니다");
		}
	}
	function comment(){
		commentform.submit();
	}
	function commentdelete(cnumber, bnumber, mid){
		var id = '${sessionScope.loginId}';
		if(id==mid){
			location.href = "commentdelete?cnumber="+cnumber+"&bnumber="+bnumber;
		} else {
			alert("작성자가 아닙니다.");
		}
	}
</script>
<style>
	.view{
		height: auto;
        width: 550px;
        border: 2px solid black;
        border-radius: 20px;
        margin:auto;
        display:block;
        padding: 20px;
        overflow:auto;
	}
	#bcontents{
		padding:10px;		
		height: 500px;
        width: 500px;
        border: 2px solid black;
        margin: 0px 0px 0px 3px;
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
	}

	.buttons:hover {
		background-color: #3e8e41
	}

	.buttons:active {
  		background-color: #3e8e41;
  		box-shadow: 0 5px #666;
  		transform: translateY(4px);
	}
	table{
		 height: 150px;
         width: 500px;
         border-radius: 20px;
	}
	.buttontop{
		margin: 20px 0px 0px 60px;
	}
	h1{
		text-align: center;
	}
	.clist{
		margin:auto;
		display:block;
		margin-top:10px;
		text-align: center;
		border:2px solid black;
		border-radius: 20px;
		width: 550px;
		padding:20px;
	}
	.make{
		margin:20px 80px 0px 100px;
		padding: 20px;
		width: 350px;
		text-align: left;
	}
	input{
		width:200px;
		height: 40px;
	}
</style>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
<h1><i class="far fa-eye"></i> 게시글 상세보기</h1>
<div class="view">
	<table>
		<tr>
			<th style="width: 80px;">카테고리</th>
			<th style="width: 50px;">글번호</th>
			<th style="width: 70px;">작성자</th>
			<th style="width: 140px;">제목</th>
			<th style="width: 110px;">작성일자</th>
			<th style="width: 50px;">조회수</th>
		</tr>
		<tr>
			<td>${viewDTO.bkategorie}</td>
			<td>${viewDTO.bnumber}</td>
			<td>${viewDTO.bwriter}</td>
			<td>${viewDTO.btitle}</td>
			<td>${viewDTO.bdate}</td>
			<td>${viewDTO.bhits}</td>
		</tr>
	</table><br>
	파일명 : ${viewDTO.bfile}<br><br>
	파일이미지  <br><img src="images/${viewDTO.bfile}" width="500" height="350"><br><br>
	<h3>내용</h3><br>
	<div id="bcontents">${viewDTO.bcontents}</div><br>
	태그1 : ${viewDTO.btag1}<br>
	태그2 : ${viewDTO.btag2}
	<div class="buttontop">
	<button class="buttons" onclick="boardlist('${viewDTO.bkategorie}')" style=" font-size: 20px;"><modifyi class="fas fa-clipboard-list"></i> 목록</button>
	<button class="buttons" onclick="boardupdate('${viewDTO.bnumber}', '${viewDTO.bwriter}')" style=" font-size: 20px;"><i class="far fa-edit"></i> 수정</button>
	<button class="buttons" onclick="boarddelete('${viewDTO.bnumber}', '${viewDTO.bwriter}')" style=" font-size: 20px;"><i class="fas fa-trash-alt"></i> 삭제</button>
	</div>
</div>
<div class = "clist">
<h2 style="text-align: center;"><i class="far fa-comment"></i> 댓글 창 <i class="far fa-comment"></i></h2><br>
		<table>
			<tr>
				<th style="width: 80px; height: 50px;">작성자</th>
				<th style="width: 220px;">내용</th>
				<th style="width: 120px;">작성일자</th>
				<th style="width: 80px;"></th>
			</tr>
			<c:forEach var="clist" items="${clist}">
			<tr>
				<td style="height:35px;">${clist.mid}</td>
				<td>${clist.content}</td>
				<td>${clist.bdate}</td>
				<td><button onclick="commentdelete('${clist.cnumber}', '${clist.bnumber}', '${clist.mid}')">삭제</button></td>
			</tr>
			</c:forEach>
		</table>
	<form action="commentinsert" method="post" name="commentform">
		<c:if test="${not empty sessionScope.loginId}">
		<div class = "make">
		<input type="hidden" style="width: 80px;" name="clist_mid" id="clist_mid" value="${sessionScope.loginId}" readonly><br>
		ID : ${sessionScope.loginId}<br>
		<input type="text" name="clist_content" id="clist_content" placeholder="댓글을 입력하세요.">
		<input type="hidden" name="clist_bnumber" id="clist_bnumber" value="${viewDTO.bnumber}">
		<button onclick="comment()">댓글 작성</button>
		</div>
		</c:if>
	</form>
	</div>
<jsp:include page="footer.jsp" flush="false" />	
</body>
</html>