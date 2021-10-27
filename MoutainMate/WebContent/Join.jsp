
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>산으로 오세영 회원가입</title>

<link rel="stylesheet" href="assets/css/Main.css">

</head>
<body>
	
	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">로그인</a> <!--<a href="Login.jsp">로그인</a>  -->
						</li>
						<li><a href="#">회원가입</a></li>

						<li><a href="MainPage.jsp">게시판</a></li>
						<li><a href="MainPage.jsp">등산로</a></li>
						<li><a href="MainPage.jsp">둘러보기</a></li>
					
					</ul>
				</nav>
			</header>
		</div>


			
				<li><h5>회원가입</h5></li>
		<form action="Join" method="post">

				<table>
					<tr>
						<td><input type="text" name="id" required="required" placeholder="ID를 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="password" name="pw" required="required" placeholder="PW를 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="text" name="name" required="required" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
							placeholder="전화 번호를 입력하세요"></td>
					</tr>
					<tr>
            			<td> <input type="date"> </td>
            	    </tr>
					<tr>
						<td>남 <input type="radio" name="gender">
						여 <input type="radio" name="gender"></td>
					</tr>
				</table>
				<li><input type="submit" value="Join" class="button fit"></li>

			</form>

		<!-- 메인 -->

		<main>
		</main>

		<!-- 밑부분 -->
		<footer> </footer>
	</section>

</body>
</html>