<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function goLogin(){
		loginform.submit();
	}
	function goJoin(){
		location.href="MemberJoin.jsp";
	}
</script>
<style>
	#loginmain {
		width: 600px;
		height: 400px;
		border-radius: 20px;
		border: 2px solid dimgray;
		padding: 40px;
		margin: 100px auto;
		font-size: 30px;
		text-align: center;
	}
        
	input {
		padding: 5px;
		margin: 5px;
		font-size: 30px;
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
		margin-top:25px;
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
<body>
<jsp:include page="main12.jsp" flush="false" />
	<form action="login" method="post" name="loginform">
    <div id="loginmain">
	<h2><i class="fas fa-sign-in-alt"></i> 로그인창</h2><br>
	<input type="text" name="mid" id="mid" placeholder="아이디 입력"><br>
	<input type="password" name="mpassword"  id="mpassword" placeholder="비밀번호 입력"><br>
	<button style="WIDTH: 100pt; HEIGHT: 40pt;" class="button" type="button" onclick="goLogin()"><i class="fas fa-sign-in-alt"></i> 로그인</button>
	<button style="WIDTH: 110pt; HEIGHT: 40pt;" class="button" type="button" onclick="goJoin()"><i class="fas fa-file-signature"></i> 회원가입</button>
	</div>
	</form>
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>