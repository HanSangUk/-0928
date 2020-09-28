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
		function tagview(tag){
			location.href = "boardtag?btag=" + tag;
		}
	</script>
	<style>
		img {
            width: 800px;
            height: 550px;
            padding: auto;
            margin: auto;
            min-width: 800px;
            display: block;
        }
        #tag1, #tag2{
			background-color: #cc4141;
			border: none;
			font-size: 15px;
		}
	</style>
</head>
<body>
<jsp:include page="main12.jsp" flush="false" />
    <div class="slideshow-container">
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <a href="boardlistpaging?kategorie=papermodel"><img src="images\종이모형.jpg"></a>
            <div class="text">PaperModel</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <a href="boardlistpaging?kategorie=lego"><img src="images/레고.jpg"></a>
            <div class="text">Lego</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <a href="boardlistpaging?kategorie=plamodel"><img src="images/프라모델.jpg"></a>
            <div class="text">PlaModel</div>
        </div>
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <a href="boardlistpaging?kategorie=miniature"><img src="images/미니어쳐.jpg"></a>
            <div class="text">Miniature</div>
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
    </div>
    <script>
        var slideIndex = 1;
        showSlides(slideIndex);
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            
            
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }
    </script>
	<br>
<h1><i class="fas fa-arrow-down"></i> 인기 Top3 <i class="fas fa-arrow-down"></i></h1>
<br>

<div class="row">
  <div class="column">
    <div class="card">
      <a href="boardview?bnumber=${list1.bnumber}"><img src="File/${list1.bfile}" alt="Jane" style="width:100%" id="star"></a>
      <div class="container">
        <h2>${list1.btitle}</h2>
        <p class="title">${list1.bwriter}</p>
        <c:if test="${not empty list1.btag1}">
        		<button id="tag1" onclick = "tagview('${list1.btag1}')">#${list1.btag1}</button>
        		</c:if>
        		<c:if test="${not empty list1.btag2}">
        		<button id="tag2" onclick = "tagview('${list1.btag2}')">#${list1.btag2}</button>
  				</c:if>
      </div>
    </div>
  </div>
  
   <div class="column">
    <div class="card">
      <a href="boardview?bnumber=${list2.bnumber}"><img src="File/${list2.bfile}" alt="Jane" style="width:100%" id="star"></a>
      <div class="container">
        <h2>${list2.btitle}</h2>
        <p class="title">${list2.bwriter}</p>
        <c:if test="${not empty list2.btag1}">
        		<button id="tag1" onclick = "tagview(${list2.btag1})"> #${list2.btag1} </button>
        		</c:if>
        		<c:if test="${not empty list2.btag2}">
        		<button id="tag2" onclick = "tagview(${list2.btag2})"> #${list2.btag2} </button>
  				</c:if>
      </div>
    </div>
  </div>
  
   <div class="column">
    <div class="card">
      <a href="boardview?bnumber=${list3.bnumber}"><img src="File/${list3.bfile}" alt="Jane" style="width:100%" id="star"></a>
      <div class="container">
        <h2>${list3.btitle}</h2>
        <p class="title">${list3.bwriter}</p>
        <c:if test="${not empty list3.btag1}">
        		<button id="tag1" onclick = "tagview(${list3.btag1})">#${list3.btag1}</button>
        		</c:if>
        		<c:if test="${not empty list3.btag2}">
        		<button id="tag2" onclick = "tagview(${list3.btag2})">#${list3.btag2}</button>
  				</c:if>
      </div>
    </div>
  </div>
</div>

	
<jsp:include page="footer.jsp" flush="false" />
</body>
</html>