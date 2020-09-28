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
        * {
            margin: 0px;
            padding: 0px;
            font-family: 'Jua', sans-serif;
        }

        body {
            margin: 20px;
        }

        .mySlides {
            display: none
        }

        .mainname {
            text-align: center;
            margin-bottom: 10px;
            margin: 20px 0px;
            padding: 0px 0px 20px 0px;
        }


        button {
            box-shadow: 4px 4px 5px rgb(51, 50, 50);
            border-radius: 10px;
            border: 2px solid dimgray;
            padding: 7px 8px;
            margin: 10px;
            background-color: dimgray;
            color: white;
        }

        
        
		#star{
			width: auto;
            height: 550px;
            padding: auto;
            margin: auto;
            min-width: auto;
            display: block;
		}
		
        /* Slideshow container */
        .slideshow-container {
            width: auto;
            height: 550px;
            background-color: rgb(94, 93, 93);
            border: 5px solid rgb(223, 216, 216);
            position: relative;
            margin: 10px;
            overflow: hidden;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 20px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 20px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active,
        .dot:hover {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }

        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {

            .prev,
            .next,
            .text {
                font-size: 11px
            }
        }

        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidebar a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            color: #f1f1f1;
        }

        .sidebar .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #111;
            color: white;
            padding: 10px 15px;
            border: none;
        }

        .openbtn:hover {
            background-color: #444;
        }
		
		
        #main {
            transition: margin-left .5s;
           	margin : 15px;
            padding: 20px;
            height: 130px;
            border-bottom: 2px solid black;
            border-top: 2px solid black;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
            .sidebar {
                padding-top: 15px;
            }

            .sidebar a {
                font-size: 18px;
            }
        }

        .login {
            float: right;
            margin: 40px 0px 20px 20px;
            font-size: 25px;
            text-align: center;
        }

        .login :hover {
            color: black;
        }
		
		 .login1 {
            float: right;
            margin: 20px 0px 20px 20px;
            font-size: 25px;
            text-align: center;
        }

        .login1 :hover {
            color: black;
        }
		
		 .login2 {
            float: right;
            margin: 0px 0px 20px 20px;
            font-size: 25px;
            text-align: center;
        }

        .login2 :hover {
            color: black;
        }
		
        a {
            text-decoration: none;
            color: black;
        }

        .footer {
            margin: 20px 0px;
            padding: 10px;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
        }

        .footer2 {
            margin: 10px;

        }

        h1 {
            text-align: center;
            /* background-color: cornsilk; */
            color: rgb(14, 14, 13);
            margin: 10px;
            padding: 10px;
        }

        /* ---------------------------------------------------------- */
        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            padding-top: 20px;
        }

        /* Style the sidenav links and the dropdown button */
        .sidenav a,
        .dropdown-btn {
            padding: 6px 8px 6px 16px;
            border-radius : 20px 0px 0px 20px;
            text-decoration: none;
            font-size: 20px;
            color: #818181;
            display: block;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            outline: none;
        }

        /* On mouse-over */
        .sidenav a:hover,
        .dropdown-btn:hover {
            color: #f1f1f1;
        }

        /* Main content */
        .main {
            margin-left: 200px;
            /* Same as the width of the sidenav */
            font-size: 20px;
            /* Increased text to enable scrolling */
            padding: 0px 10px;
        }

	/* Add an active class to the active dropdown button */
	.active {
		background-color: green;
		color: white;
	}

	/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
	.dropdown-container {
		display: none;
		background-color: #262626;
		padding-left: 8px;
	}

	/* Optional: Style the caret down icon */
	.fa-caret-down {
		float: right;
		padding-right: 8px;
	}

	/* Some media queries for responsiveness */
	@media screen and (max-height: 450px) {
		.sidenav {
			padding-top: 15px;
		}

		.sidenav a {
			font-size: 18px;
		}
	}
        
	html {
		box-sizing: border-box;
	}

	*, *:before, *:after {
		box-sizing: inherit;
	}

	.column {
		float: left;
		width: 33.3%;
		margin-bottom: 16px;
		padding: 0 8px;
	}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
	}
}

	.card {
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}

	.container {
		padding: 0 16px;
	}

	.container::after, .row::after {
		content: "";
		clear: both;
		display: table;
	}

	.title {
		color: grey;
	}

	.button {
		border: none;
		outline: 0;
		display: inline-block;
		padding: 8px;
		color: white;
		background-color: #000;
		text-align: center;
		cursor: pointer;
		width: 100%;
		font-size: 20px;
	}
	.button:hover {
  		background-color: #555;
	}
    </style>
</head>
<body>
   <div class="mainname">
        <a href="main">
            <h1><i class="fas fa-hand-sparkles"></i> Assembly</h1>
        </a>
    </div>
    
    <div id="main" style="height: 174px;">
    <div class="login">
    <c:if test="${empty sessionScope.loginId}">
        <a href="Login.jsp" id="ang"><i class="fas fa-sign-in-alt"></i>
            <p>login</p>
        </a>
    </c:if>
    </div>
    
    <div class="login1">
	<c:if test="${not empty sessionScope.loginId and sessionScope.loginId ne 'admin'}">
		${sessionScope.loginId} 님<br>
		<button onclick="Update()" name="Update"><i class="fab fa-stack-exchange"></i> 회원정보수정</button>

		<button onclick="logout()"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
	</c:if>
	</div>
	
	<div class="login2">
	<c:if test="${sessionScope.loginId eq 'admin'}">
		${sessionScope.loginId} 님<br>
		<button onclick="Update()" name="Update"><i class="fab fa-stack-exchange"></i> 회원정보수정</button>

		<button onclick="logout()"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
		<br><button onclick="memberlist()" style="margin-top: 0px;"><i class="fas fa-tasks"></i> 관리자모드(회원목록)</button>
	</c:if>
	</div>



    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <a href="main"><i class="fas fa-home"></i> Home</a>
        <!-- <a href="#">종이모형</a>
        <a href="#">레고</a>
        <a href="#">프라모델</a>
        <a href="#">미니어쳐</a> -->
        <button class="dropdown-btn">종이모형
            <i class="fa fa-caret-down"></i>
        </button>
      
        <div class="dropdown-container">
            <a href="Kategorie.jsp?id=paper">종이모형이란?</a>
            <a href="boardlistpaging?kategorie=papermodel">게시판</a>
   			<a href="#">도면 및 재료</a>
        </div>
        <button class="dropdown-btn">레고
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="Kategorie.jsp?id=lego">레고란?</a>
            <a href="boardlistpaging?kategorie=lego">게시판</a>
            <a href="#">도면 및 재료</a>
        </div>
        <button class="dropdown-btn">프라모델
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="Kategorie.jsp?id=pla">프라모델이란?</a>
            <a href="boardlistpaging?kategorie=plamodel">게시판</a>
            <a href="#">도면 및 재료</a>
        </div>
        <button class="dropdown-btn">미니어쳐
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="Kategorie.jsp?id=mini">미니어쳐란?</a>
            <a href="boardlistpaging?kategorie=miniature">게시판</a>
            <a href="#">도면 및 재료</a>
        </div>
        <script>
            /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;

            for (i = 0; i < dropdown.length; i++) {
                dropdown[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var dropdownContent = this.nextElementSibling;
                    if (dropdownContent.style.display === "block") {
                        dropdownContent.style.display = "none";
                    } else {
                        dropdownContent.style.display = "block";
                    }
                });
            }
        </script>
    </div>
        <button class="openbtn" onclick="openNav()"><i class="fas fa-bars"></i></button>
        <h2>Type of model making</h2>
        <p>
            Find a craft that suits your taste.</p>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidebar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
        }

        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
        }
    </script>
</body>

</html>