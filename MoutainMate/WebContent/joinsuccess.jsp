<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>join성공</title>

<link rel="stylesheet" href="assets/css/joinsuccess.css">


</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>

					<li><a href="MainPage.jsp">HOME</a>
					<li><a href="MainPage.jsp">로그인</a></li>
					<li><a href="MainPage#page3.jsp">등산로</a></li>
					<li><a href="MainPage#page4.jsp">둘러보기</a></li>

				</ul>
			</nav>
		</header>
	</div>

	<!-- 메인 -->
	<main>
	<%
	String joinid="";
	joinid = (String) session.getAttribute("joinId");
	
	%>
		<div id="maindiv">
		<span>
		<%=joinid%>님 회원가입을 환영합니다<br>
		HOME으로 돌아가서 로그인 해주세요.
		</span>
		
		
		</div>

	</main>


	<!-- 밑부분 -->
	<footer> </footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script>
		
	</script>

</body>
</html>