
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산으로 오세영 회원정보</title>

<link rel="stylesheet" href="assets/css/Main.css">

</head>
<body>
	

	<section>
		<header>
			<h1>
				<a id="mainLogo" href="MainPage.jsp"></a>
			</h1>
			<nav>
				<ul>
				<li><a href="notice.jsp">공지사항</a></li>
				
					<li><a href="Login.jsp">로그인</a></li>
					<li><a href="Join.jsp">회원가입</a></li>
				
					<!-- <li><a href="LogOut.jsp">로그아웃</a></li>
					<li><a href="MemberInfo.jsp">회원정보</a></li> -->
				
					<li><a href="#">둘러보기</a></li>
				</ul>
			</nav>
		</header>
		
		
		<!-- 메인 -->
		<main>
			<form action="LoginCheck" method="post">
				<table id="ta">
					<tr>
					
						<td>
							
				<input type="submit" id ="input_submit" href="#" value="회원수정">
				<input type="submit" id ="input_submit" href="Delete" value="회원탈퇴">
						</td>
						
					</tr>
				</table>
			</form>
		
		
		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>

		
		
</body>
</html>