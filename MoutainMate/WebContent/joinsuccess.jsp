<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>join����</title>

<link rel="stylesheet" href="assets/css/joinsuccess.css">


</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>

					<li><a href="MainPage.jsp">HOME</a>
					<li><a href="MainPage.jsp">�α���</a></li>
					<li><a href="MainPage#page3.jsp">����</a></li>
					<li><a href="MainPage#page4.jsp">�ѷ�����</a></li>

				</ul>
			</nav>
		</header>
	</div>

	<!-- ���� -->
	<main>
	<%
	String joinid="";
	joinid = (String) session.getAttribute("joinId");
	
	%>
		<div id="maindiv">
		<span>
		<%=joinid%>�� ȸ�������� ȯ���մϴ�<br>
		HOME���� ���ư��� �α��� ���ּ���.
		</span>
		
		
		</div>

	</main>


	<!-- �غκ� -->
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