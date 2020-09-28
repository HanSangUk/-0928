<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
	<script>
		function Update(){
			location.href="MemberUpdate";
		}
		function logout(){
			location.href="logout";
		}
		function Write(){
			location.href="BoardWrite.jsp";
		}
		function login(){
			location.href="Login.jsp";
		}
		function list(){
			location.href="boardlistpaging";
		}
		function memberlist(){
			location.href="memberlist";
		}
		
	</script>
	<style>
		.board{
			width: 700px;
			height: 1000px;
			border: 2px solid #111;
			margin: auto;
			padding: 40px;
			display: block;
		}
		.papermodel{
			width:32%;
			height:200px;
		}

		#main {
            transition: margin-left .5s;
           	margin : 15px;
            padding: 20px;
            height: 130px;
            border-bottom: 2px solid black;
            border-top: 2px solid black;
        }
    </style>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
	<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); 
	%>
	<div class="board">
	<c:set var="id" value="<%= id%>"/>
    <c:if test="${id eq 'paper'}">
    	<h2><i class="fab fa-buffer"></i> 종이모형 이란?</h2>
    	<pre> - 어떤 물체를 만들 때 종이에 도면을 그리고 오려서 접합하는 방법으로 입체 조형물을 만드는 것</pre>
    	<br><br>
    	<h2><i class="fab fa-buffer"></i> 특징</h2>
    	<pre> - 다른 공작류 취미(프라모델, 피규어 등) 에 비해 돈이 적게 든다</pre>
    	<pre> - 다른 분야에서 나오기 힘든 마이너 아이템이 나올 수 있는 확률이 높다</pre>
    	<pre> - 대부분의 것들을 만들수 있어 종류 선택에 자유롭다.</pre>
    	<br><br>
    	<img src="images\종이모형-1.jpg" class="papermodel">
    	<img src="images\종이모형-2.jpg" class="papermodel">
    	<img src="images\종이모형-3.jpg" class="papermodel">
    	<pre> - 위 사진들처럼 케릭터, 사물, 프라모델 등 다양하게 제작할 수 있다</pre><br><br>
    	<h2><i class="fab fa-buffer"></i> 준비물</h2>
    	<pre> - 목공풀, 순간접착제, 핀셋, 칼, 커팅매트</pre>
    	<img src="images\도구1.png" class="papermodel">
    	<img src="images\도구2.png" class="papermodel">
    	<img src="images\도구3.png" class="papermodel">
    </c:if>
    
    <c:if test="${id eq 'lego'}">
    	<h2><i class="fab fa-buffer"></i> 레고란?</h2>
    	<pre> - 덴마크어로 '재미있게 놀다(PLAY WELL)'라는 뜻을 가진 'LEG GODT'를 줄인 것</pre>
    	<pre> - 만물을 창조하고 싶은 사람들을 위한 장난감</pre>
    	<br><br>
    	<h2><i class="fab fa-buffer"></i> 특징</h2>
    	<pre> - 무시무시한 호환성 = 연식에 상관없이, 타사 제품들과도 호환</pre>
    	<pre> - 무독성 플라스틱(주로 ABS+PC 수지)을 사용해 구매층, 즉 아이들의 건강을 최우선으로 하고 있다.</pre>
    	<pre> - 무엇을 만들든 설계도(설명서)와 블럭만 있으면 만들어 낼 수 있다.</pre><br>
    	<img src="images\레고1.jpg">
    	<pre> * 위 사진처럼 레고로 달리는 자동차도 만들수 있다  </pre>
    </c:if>
    	
    <c:if test="${id eq 'pla'}">
    	<h2><i class="fab fa-buffer"></i> 프라모델 이란?</h2>
    	<pre> -  플라스틱으로 되어 있는 부품들을 조립하여 완성시키는 장난감</pre>
    	<br><br>
    	<h2><i class="fab fa-buffer"></i> 주요 장르</h2>
    	<pre> - 현실에 존재하는 자연/인공물을 정밀 재현한 축소모형</pre>
    	<pre> - 전투병기 또는 유명 애니메이션, 영화 등의 매체에 나오는 병기/탈것</pre>
    	<br>
    	<img src="images\프라모델1.jpg" class="papermodel">
   		<img src="images\프라모델2.jpg" class="papermodel">
   		<img src="images\프라모델3.jpg" class="papermodel">
    	<br><br>
    	<h2><i class="fab fa-buffer"></i> 스케일</h2>
    	<pre> - 프라모델에는 '스케일'이라는 실물대비 모형의 축척비율이 따라붙는다. (1/n)</pre>
   		<pre> - 예시) 육상병기는 1/16, 1/35(차체가 15cm에서 20cm 가량), 1/48(차체가 10cm 가량) </pre>
   		<pre>          함선은 1/350, 1/700,      항공기는 1/32, 1/48, 1/72, 1/100, 1/144 </pre>
   		<pre>          건프라 등 로봇류는 1/60(반다이의 PG 등), 1/72, 1/100 등</pre>    
   		<br><br>
   		<h2><i class="fab fa-buffer"></i> 방법</h2>
   		<pre> - 부품을 프라모델 전용 니퍼[36] 등으로 절단하고, 접착제로 붙이고,[37] 캔스프레이나 에어 컴프레서, </pre>
    	<pre>   락카 / 에나멜 / 아크릴 병입 도료 등으로 시너로 희석시키면서 직접 도색[38]하고, </pre>
    	<pre>   어긋나는 부분을 일일이 사포 등으로 깎아내고, 퍼티 등으로 메꿔주는 등 완성시까지의 어려움이 많은 편</pre><br>
   		<pre> - 일본 반다이에서 내놓는 건담는 접착제 없이 끼워맞추는 스냅타이트 키트 방식을 사용하여 쉽게 접근</pre>
    </c:if>	
    
    <c:if test="${id eq 'mini'}">
    	<h2><i class="fab fa-buffer"></i> 미니어쳐란?</h2>
    	<pre> - 인물, 건물, 동물 등을 같은 크기 또는 일정한 비례의 크기로 축소하여 실물처럼 모형화한 것</pre>
    	<br><br>
    	<h2><i class="fab fa-buffer"></i> 특징</h2>
    	<pre> - 건물, 동물 등 뿐만 아니라 음식 같은 것들도 만들수 있으며 식용으로도 만들수 있다.</pre>
    	<pre> - 상업적으로도 많이 쓰이며 입문자 경우에는 초보자용으로 파는 세트들을 쉽게 찾을 수 있다.</pre>
    	<br><br>
    	<img src="images\미니어처1.jpg" class="papermodel">
    	<img src="images\미니어처2.jpg" class="papermodel">
    	<img src="images\미니어처3.jpg" class="papermodel">
    	<br><br>
    	<h2><i class="fab fa-buffer"></i> 준비물</h2>
    	<pre> - 목공풀, 순간접착제, 핀셋, 칼, 커팅매트</pre>
    	<img src="images\도구1.png" class="papermodel">
    	<img src="images\도구2.png" class="papermodel">
    	<img src="images\도구3.png" class="papermodel">
    </c:if>	
    </div>
<jsp:include page="footer.jsp" flush="false" />
</body>
</body>
</html>