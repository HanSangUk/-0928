<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	    
	   function pwdeqFn(){
		   var pwd = document.getElementById("mpassword").value;
		   var pwdch = document.getElementById("mpasswordch").value;
		   var eqMsg = document.getElementById("pwdEq");
		   if (pwd == pwdch){
			   eqMsg.style.color = "green";
			   eqMsg.innerHTML = "맞음";
		   } else {
			   eqMsg.style.color = "red";
			   eqMsg.innerHTML = "틀렸습니다.";
			   }
		   }
	   
	   function pwdCheck(){
		   var exp = /^[a-zA-z0-9]{4,12}$/;
		   var pwd = document.getElementById("mpassword").value;
		   var pwdch = document.getElementById("pwdch");
		   if(pwd.match(exp)){
			   pwdch.style.color = "green";
			   pwdch.innerHTML = "비밀번호 형식 맞음"
		   } else {
			   pwdch.style.color = "red";
			   pwdch.innerHTML = "형식 틀림"
		   }

	   }
	   function idCheck(){
		   var exp = /^[A-Za-z]{1}[A-Za-z0-9]{3,9}$/;
		   var pid = document.getElementById("mid").value;
		   var pidch = document.getElementById("pidch");
		   if(pid.match(exp)) {
			   pidch.style.color = "green";
			   pidch.innerHTML = "형식 맞음"
		   } else {
			   pidch.style.color = "red";
			   pidch.innerHTML = "6~10자리를 입력하세요."
		   }
	   }
	   function phCheck(){
		   	var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		   	var mph = document.getElementById("mphone").value;
		   	var mphch = document.getElementById("phch");
		   	if(mph.match(regExp)){
		   		mphch.style.color = "green";
		   		mphch.innerHTML = "형식맞음"
		   	} else {
		   		mphch.style.color = "red";
		   		mphch.innerHTML = "형식틀림"
		   	}
	   }
</script>
<style>
	.memberupdate {
		margin: auto;
        padding: 15px 60px;
        border: 2px solid black;
        width: 600px;
        height: auto;
        font-size: 20px;
        border-radius: 20px;
	}
	h1{
		text-align: center;
	}
	input {
        color: black;
        background-color: transparent;
        border: 2px solid transparent;
        border-bottom: 2px solid black;
        padding: 10px;
        margin: 5px 5px 15px 20px;
        font-size: 20px;
    }
	.button {
        padding: 15px 25px;
        font-size: 24px;
        text-align: center;
            /* cursor: pointer; */
        outline: none;
        color: #fff;
        background-color: rgb(34, 34, 36);
        border: none;
        border-radius: 15px;
        box-shadow: 0 9px #999;
        margin: 20px auto;
        display: block;
	}
	.button:hover {
		background-color: #1dc5d1
	}

	.button:active {
		background-color: #1dc5d1;
		box-shadow: 0 5px #666;
		transform: translateY(4px);
	}   
</style>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
<% request.setCharacterEncoding("UTF-8"); %>
<h1><i class="far fa-eye"></i> 회원정보 수정</h1>
<div class=memberupdate>
	<form action="memberupdateprocess" method="post" name="updateform" enctype="multipart/form-data">
		<i class="fas fa-camera"></i> 프로필 사진 <br><input type="file" name="mfile" id="mfile"><br>
		<i class="far fa-id-badge"></i> 아이디 <br><input name="mid" id="mid" value="${update.mid}" readonly><br>
		<i class="fas fa-unlock-alt"></i> 비밀번호 <br><input type="password" name="mpassword" id="mpassword" placeholder="비밀번호를 입력하세요." onkeyup="pwdCheck()">
		<span id="pwdch" ></span><br>
		<i class="fas fa-unlock"></i> 비밀번호확인 <br><input type="password" name="mpasswordch" id="mpasswordch" placeholder="비밀번호를 입력하세요." onkeyup="pwdeqFn()">
		<span id="pwdEq"></span><br>
		<i class="fas fa-file-signature"></i> 이름 <br><input type="text" name="mname" id="mname" value="${update.mname}"><br>
		<i class="fas fa-mobile-alt"></i> 전화번호 <br><input type="text" name="mphone" id="mphone" onkeyup="phCheck()" placeholder="010-4자리-4자리 " value="${update.mphone}">
		<span id="phch"></span><br>
		<i class="fas fa-envelope-open-text"></i> 이메일 <br><input type="email" name="memail" id="memail" value="${update.memail}"><br>
		<i class="fas fa-map-marker-alt"></i> 주소 <div class="maddress">
		 	<input type="text" id="sample6_postcode" name="maddress1" placeholder="우편번호" value="${update.maddress1}">
			<input type="button" onclick="sample6_execDaumPostcode()"  value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" name="maddress2" placeholder="주소" value="${update.maddress2}"><br>
			<input type="text" id="sample6_detailAddress" name="maddress3" placeholder="상세주소" value="${update.maddress3}">
			<input type="text" id="sample6_extraAddress" name="maddress4" placeholder="참고항목" value="${update.maddress4}">
			</div>
	<button type = "button" onclick="memberUpdateProcess()" class="button">수정</button>
	</form>
</div>	
	<script>
	function memberUpdateProcess(){
		   var repw = /^[a-zA-z0-9]{4,12}$/;
		   var reph = /^\d{3}-\d{4}-\d{4}$/;
		   var rename = /^[가-힝a-zA-Z]{2,}$/;
		   
		   var passwordcheck = document.getElementById("mpassword").value;
		   var password2check = document.getElementById("mpasswordch").value;
		   var namecheck = document.getElementById("mname").value;
		   var phonecheck = document.getElementById("mphone").value;
		   var emailcheck = document.getElementById("memail").value;
		   
			if((passwordcheck.length) == ""){
				alert("비밀번호를 입력해 주세요.");
				passwordcheck.focus();
				return false;
			}
			
		 	if((password2check.length) == ""){
				alert("비밀번호를 입력해 주세요.");
				password2check.focus();
				return false;
			}
		   
			if(!check(repw,passwordcheck,"비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")){
				return false;
			}
		   
		 	if((passwordcheck.value) != (password2check.value)){
			   alert("비밀번호가 일치 하지 않습니다.");
			   passwordcheck.focus();
			   password2check.focus();
			   return false;
			}
		  
			if((namecheck.length)==""){
		   		alert("이름을 입력해 주세요.");
		   		namecheck.focus();
		   		return false;
		   	}
		   	
			if(!check(rename,namecheck,"이름이 잘못 되었습니다.")){
		   		return false;
		   	}
		 
		  
			if((phonecheck.length)==""){
			   alert("전화번호를 입력하지 않았습니다.");
			   phonecheck.focus();
			   return false;
			}
		
		   
			if((emailcheck.length)==""){
				alert("이메일을 입력해 주세요.");
				emailcheck.focus();
				return false;
			}
			
			if(confirm("수정하시겠습니까?")){
				updateform.submit();
			}
	}
	
	 function check(re, what, message){//정규화데이터,아이템 id,메세지
	       if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
	       //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
	           return true;
	       }
	       alert(message);
	       what.value = "";
	       what.focus();
	   }
	</script>
<jsp:include page="footer.jsp" flush="false" />	
</body>
</html>