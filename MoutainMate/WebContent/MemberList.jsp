<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="assets/css/join.css">
<body>
	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">메인페이지</a></li>
						<li><a href="#">기기등록</a></li>
						<li><a href="#">회원정보</a></li>
						<li><a href="#">등산로관리</a></li>
					</ul>
				</nav>
			</header>
		</div>
		
			<div id="joindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>회원 목록</caption>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>생년월일</td>
						<td>성별</td>
					</tr>
					
					
				</table>

			</form>


		</div>
			
			
		<!-- 메인 -->
		<main>
		
		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>

</body>
</html>