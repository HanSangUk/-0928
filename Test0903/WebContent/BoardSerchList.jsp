<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function main(){
			location.href="Main.jsp";
		}
		
		function tagview(tag){
			location.href = "boardtag?btag=" + tag;
		}
		
		function boardview(view){
			location.href = "boardview?bnumber=" + view;
		}
		function boarddelete(deleteid, id) {
			var uid = '<%=(String)session.getAttribute("loginId")%>';
			var ids = sessionStorage.getItem('loginId');
			var id = id;
			var admin = "admin";
			if(id==ids){
				console.log("2");
				location.href = "boarddelete?bnumber=" + deleteid;
			} else if(uid==admin){
				console.log("3");
				location.href = "boarddelete?bnumber=" + deleteid;
			} else {
				alert("작성자가 아닙니다");
			}
		}
		
		function boardupdate(update, id){
			var ids = sessionStorage.getItem('loginId');
			var id = id;
			if(id==ids){
				location.href = "boardupdate?bnumber=" + update;
			} else {
				alert("작성자가 아닙니다");
			}
		}
		
		function search(){
			searchform.submit();
		}
	</script>
	<style>
	.column1 {
  		float: left;
 		width: 100%;
 		height: 600px;
  		margin-bottom: 16px;
  		padding: 0 8px;
	}
	.row1 {
  		float: left;
  		width: 33.3%;
  		height: 600px;
  		margin-bottom: 16px;
  		padding: 0 15px;
	}
	.card{
		margin: 10px	
	}
	.paging{
		text-align: center;
		margin: auto;
		display: block;
	}
	.boards{
		width:auto;
		height:700px;
		border:2px soild #111;
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
  font-size: 20px;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
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
<% 
	request.setCharacterEncoding("UTF-8");
	String kategorie = request.getParameter("kategorie"); 
%>
<c:choose>
	<c:when test="${kategorie eq 'papermodel'}"> <h1 style="text-align: center;"><i class="fas fa-history"></i> 종이모형</h1> </c:when>
	<c:when test="${kategorie eq 'lego'}"> <h1 style="text-align: center;"><i class="fas fa-history"></i> 레고</h1> </c:when>
	<c:when test="${kategorie eq 'plamodel'}"> <h1 style="text-align: center;"><i class="fas fa-history"></i> 프라모델</h1> </c:when>
	<c:when test="${kategorie eq 'miniature'}"> <h1 style="text-align: center;"><i class="fas fa-history"></i> 미니어쳐</h1> </c:when>
</c:choose><br><br>
<div class="paging">
<div class="boards">
<c:forEach var="serchlist" items="${serchlist}" >
	<div class="row1">
 		<div class="column1">
      			<a href="boardview?bnumber=${serchlist.bnumber}&kategorie=${kategorie}"><img src="File/${serchlist.bfile}" alt="Jane" style="width:100%" id="star"></a>
        		<h2><a href="boardview?bnumber=${serchlist.bnumber}&page=${boardserch.page}">${serchlist.btitle}</a></h2>
        		<p class="title">${serchlist.bwriter}</p>
        		<c:if test="${not empty serchlist.btag1}">
        		<button id="tag1" onclick="tagview('${serchlist.btag1}')">#${serchlist.btag1}</button>
        		</c:if>
        		<c:if test="${not empty serchlist.btag2}">
        		<button id="tag2" onclick="tagview('${serchlist.btag2}')">#${serchlist.btag2}</button>
  				</c:if>
  		</div>
	</div>
</c:forEach> 
</div>

	<!-- 페이징 처리 -->
	<c:if test="${boardserch.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${boardserch.page>1}">
		<a href="boardlistpaging?page=${boardserch.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${boardserch.startPage}" end="${boardserch.endPage}" var="i" step="1">
		<c:choose> 
			<c:when test="${i eq boardserch.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="searchs?page=${i}&keyword=${keyword}&wtsearch=${wtsearch}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${boardserch.page>=boardserch.maxPage}">
		[다음]
	</c:if>
	<c:if test="${boardserch.page<boardserch.maxPage}">
		<a href="searchs?page=${boardserch.page+1}">[다음]</a>
	</c:if><br>
	<c:if test="${not empty sessionScope.loginId}">
	<button style="WIDTH: 100pt; HEIGHT: 40pt;" class="button" onclick="location.href='BoardWrite.jsp?kategorie=${kategorie}'"><i class="far fa-edit"></i> 글쓰기</button> 
	</c:if>
	<form action="searchs" name="searchform" class="search">
		<select name="wtsearch" style="HEIGHT: 40px;">	
			<option value="btitle">제목
			<option value="bwriter">작성자
		</select>
			<input type="hidden" value="${kategorie}" name="kategorie">
			<input type="text" name="keyword" id="keyword"  style="WIDTH: 150px; HEIGHT: 40px;">
			<button class="button" style="WIDTH: 100pt; HEIGHT: 40pt;" onclick="search()"><i class="fas fa-search"></i> 검색</button>
	</form>
</div>	
<jsp:include page="footer.jsp" flush="false" />	
</body>
</html>