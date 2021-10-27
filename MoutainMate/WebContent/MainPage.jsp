
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>산으로 오세영</title>
    
<link rel="stylesheet" href="assets/css/Main.css">

</head>
<body>

	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>
						<li><a href="notice.jsp">공지사항</a></li>
						<li><a href="Login.jsp">로그인</a> <!--<a href="Login.jsp">로그인</a>  -->
						</li>
						<li><a href="Join.jsp">회원가입</a></li>

						<!-- <li><h2><a href="LogOut.jsp">로그아웃</a></h2></li>
				<li><h2><a href="MemberInfo.jsp">회원정보</a></h2></li> -->
						<li><a href="#">둘러보기</a></li>
						<li><a href="#menu">≡</a></li>
					</ul>
				</nav>

			</header>
		</div>

		<!-- menu -->
		<!-- 
		<nav id="menu">
			<ul class="links">
				<li><h5>로그인</h5></li>
				<form action="LoginService" method="post">
					<li><input name="email" type="text" placeholder="Email을 입력하세요"></li>
					<li><input name="pw" type="password" placeholder="PW를 입력하세요"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
				</form>
			</ul>
			<ul class="actions vertical">
				<li><h5>회원가입</h5></li>
				<form action="JoinService" method="post">
					<li><input name="email" id="input_email" type="text"
						placeholder="Email을 입력하세요" onkeydown="inputEChk()"></li>
					<li><input type="button" value="중복확인" class="button fit"
						onclick="emailCheck()"></li>
					<li><sapn id="emailCheck"></sapn></li>
					<li><input name="pw" type="password" placeholder="PW를 입력하세요"></li>
					<li><input name="tel" type="text" placeholder="전화번호를 입력하세요"></li>
					<li><input name="address" type="text" placeholder="집주소를 입력하세요"></li>

					<li><input type="submit" id="submit" value="JoinUs"
						class="button fit"></li>

					<li><input type="button" id="submit" value="JoinUs"
						class="button fit"></li>
					<li><span>아이디 중복 검사를 해주세요.</span></li>

				</form>
			</ul>
		</nav>
		-->

		<!-- 메인 -->
		<main>
			<div id="centerlogo">
				<img id="mainlogo" src="images/mainLogo.png"> <img
					id="underbar" src="images/underbar.png">
			</div>
		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>


</body>
</html>