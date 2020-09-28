<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<style>
	*{
		font-family: 'Jua', sans-serif;
	}
	table, th, td {
		border: 2px black solid;
		text-align: center;
		border-collapse: collapse;
	}
	table{
		width:890px;
		height:auto;
		margin:auto;
		display:block;
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
	}

	.button:hover {
		background-color: #3e8e41
	}

	.button:active {
		background-color: #3e8e41;
		box-shadow: 0 5px #666;
		transform: translateY(4px);
	}
</style>
<script>
	function memberlist(){
		location.href="memberlist"
	}
</script>
</head>
<body>
<h1 style="text-align: center;"><i class="far fa-eye"></i> 회원정보 상세보기</h1>
<div class="memberlist">
	<table style="width:650px; margin:10px 45px;">
		<tr>
			<th style="width: 250px; height:30px;">프로필사진 </th>
			<th style="width: 150px;">아이디 </th>
			<th style="width: 170px;">이름 </th>
			<th style="width: 80px;">성별 </th>
		</tr>
		<tr>
			<td><img src="images/${View.mfile}" width="250" height="175"></td>
			<td>${View.mid}</td>
			<td>${View.mname}</td>
			<td>${View.mgender}</td>
		</tr>
		<tr>
			<th style="height:30px;">주소 </th>
			<th>핸드폰번호 </th>
			<th>이메일 </th>
			<th></th>
		</tr>
		<tr>
			<td style="height:175px;">${View.maddress1} ${View.maddress2} ${View.maddress3} ${View.maddress4}</td>
			<td style="height:175px;">${View.mphone}</td>
			<td style="height:175px;">${View.memail}</td>
			<td style="height:175px;"></td>
		</tr>
	</table>
</div>
</body>
</html>