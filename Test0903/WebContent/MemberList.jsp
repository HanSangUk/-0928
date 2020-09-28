<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.paging{
		text-align: center;
	}
	table, th, td {
		border: 3px black solid;
		text-align: center;
		border-collapse: collapse;
	}
	table{
		height: 150px;
		width: 400px;
	}
	.memberlist {
		margin: auto;
		padding: 30px 60px;
 		border: 2px solid black;
 		width: 540px;
 		height: auto;
		border-radius: 20px;
	}
	.tablelist{
		margin-left: 10px;
	}
	body {
		font-family: Arial, Helvetica, sans-serif;
	}

	/* The Modal (background) */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding-top: 100px; /* Location of the box */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}

	/* Modal Content */
	.modal-content {
		background-color: #fefefe;
		margin: auto;
		padding: 20px;
		border: 1px solid #888;
		width: 700px;
	}

	/* The Close Button */
	.close {
		color: #aaaaaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}

	.close:hover, .close:focus {
		color: #000;
		text-decoration: none;
		cursor: pointer;
	}
	#myBtn{
		border: transparent;
		background-color: white;
		box-shadow: unset;
		font-color:black;
		color:#111;
		font-size: 20px;
	}
	.memberview{
		width:890px;
		height:auto;
		margin:auto;
		display:block;
	}
</style>
<script>
	function memberdelete(deletemid){
		if(confirm("이 회원을 삭제 하시겠습니까?")){
			console.log(deletemid);
			location.href="memberdelete?mid="+deletemid;	
		}
	}
	function main(){
		location.href="Main.jsp"
	}
	function memberview(mid){
		var url = "memberview?mid=" + mid;
		var name = "popup";
		var option = "width=770, height=600, scrollbars= 0, toolbar=0, menubar=no";
		window.open(url,name,option);
	}

</script>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
<h1><i class="fas fa-tasks"></i> 회원관리목록</h1>
<div class="memberlist">
<div class="tablelist">
	<table>
		<tr>
			<th style="width: 120px;">아이디</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 80px;">성별</th>
			<th style="width: 100px;">삭제</th>
		</tr>
		<c:forEach var="list" items="${list}" >
			<tr>
				<td><a href="javascript:memberview('${list.mid}')">${list.mid}</a></td>
				<td>${list.mname}</td>
				<td>${list.mgender}</td>
				<td><button onclick="memberdelete('${list.mid}')">삭제</button></td>
			</tr>
		</c:forEach>
	</table>

</div><br>
<!-- 페이징 처리 -->
<div class="paging">
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="memberlist?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
		<c:choose> 
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="memberlist?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.page>=paging.maxPage}">
		[다음]
	</c:if>
	<c:if test="${paging.page<paging.maxPage}">
		<a href="memberlist?page=${paging.page+1}">[다음]</a>
	</c:if>
</div>
</div>
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>