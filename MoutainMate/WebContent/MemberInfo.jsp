
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
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="#menu">로그인</a> <!--<a href="Login.jsp">로그인</a>  -->
						</li>
						<li><a href="Join.jsp">회원가입</a></li>

						<!-- <li><h2><a href="LogOut.jsp">로그아웃</a></h2></li>
				<li><h2><a href="MemberInfo.jsp">회원정보</a></h2></li> -->
						<li><a href="#page2">게시판</a></li>
						<li><a href="#page3">등산로</a></li>
						<li><a href="#page4">둘러보기</a></li>
					<li><a class="btn trigger" href="#menu">≡</a></li>
					</ul>
				</nav>
			</header>
		</div>
		
		
		
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