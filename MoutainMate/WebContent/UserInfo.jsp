<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>소스jsp</title>

<link rel="stylesheet" href="assets/css/source.css">



</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>
						<li><a href="logoutService">로그아웃</a></li>
						<li><a href="MainPage.jsp">게시판</a></li>
						<li><a href="MainPage.jsp">등산로</a></li>
						<li><a href="MainPage.jsp">둘러보기</a></li>
				</ul>
			</nav>
		</header>
	</div>

	<!-- 메인 -->
	<main>
		<div id="maindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>회원정보수정</caption>
					
					<tr>
						<td colspan="2" align="center" color="red">
							<span id="sp_result"></span>
						</td>
					</tr>
					<tr>
						<td class="jointd1">* 비밀번호</td>
						<td class="jointd2"><input type="password" id="input_pw"name="pw" required="required"
							placeholder="PW를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 이름</td>
						<td class="jointd2"><input type="text" id="input_name" name="name" required="required"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 전화번호</td>
						<td class="jointd2"><input type="tel" id="input_tel" name="phoneNumber" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000"></td>
					</tr>
					<tr>
						<td class="jointd1">* 생일</td>
						<td class="jointd2"><input type="date" id="input_birth" name="birth" required="required"></td>
					</tr>
					<tr>
						<td class="jointd1">* 성별</td>
						<td class="jointd2" >
						남 <input type="radio" name="gender" id="input_gender" value="0" required="required">
						여 <input type="radio" name="gender" id="input_gender"  value="1" required="required">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정" onClick="join()">
						</td>
					</tr>
					
				</table>

			</form>
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