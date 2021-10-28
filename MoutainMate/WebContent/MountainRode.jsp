<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>산으로 오세영 등산로</title>
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
					<caption>등산로 등록</caption>
					<tr>
						<td class="jointd1">* 산 이름</td>
						<td class="jointd2"><input type="text" required="required"
							placeholder="산 이름을 입력하세요"></td>
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
						<td class="jointd2"><input type="tel" name="phoneNumber" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화 번호를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">생일</td>
						<td class="jointd2"><input type="date" name="birth"></td>
					</tr>
					<tr>
						<td class="jointd1">성별</td>
						<td class="jointd2">
						남 <input type="radio" name="gender" value="0">
						여 <input type="radio" name="gender" value="1">
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
			
			
		<!-- 메인 -->
		<main>
		
		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>
		
		
		
</body>
</html>