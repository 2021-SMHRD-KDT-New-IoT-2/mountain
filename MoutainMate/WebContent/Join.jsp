
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>산으로 오세영 회원가입</title>

<link rel="stylesheet" href="assets/css/join.css">

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


		<div id="joindiv">
			<form id="joinform" action="Join" method="post">

				<table id="jointable">
					<caption>회원가입</caption>
					<tr>
						<td class="jointd1">* 아이디</td>
						<td class="jointd2"><input type="text" name="id" required="required"
							placeholder="ID를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 비밀번호</td>
						<td class="jointd2"><input type="password" name="pw" required="required"
							placeholder="PW를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 이름</td>
						<td class="jointd2"><input type="text" name="name" required="required"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 전화번호</td>
						<td class="jointd2"><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화 번호를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">생일</td>
						<td class="jointd2"><input type="date"></td>
					</tr>
					<tr>
						<td class="jointd1">성별</td>
						<td class="jointd2">
						남 <input type="radio" name="gender" value="man">
						여 <input type="radio" name="gender" value="woman">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Join">
						</td>
					</tr>
				</table>

			</form>


		</div>

	</section>

</body>
</html>