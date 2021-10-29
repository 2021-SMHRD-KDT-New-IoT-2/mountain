<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>산으로 오세영 기기등록</title>

<link rel="stylesheet" href="assets/css/DeviceMGR.css">


</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>
					<li><a href="MainPage.jsp">메인페이지</a></li>
					<li><a href="DeviceMGR.jsp">기기등록</a></li>
					<li><a href="RegistrationDevice.jsp">기기대여</a></li>
					<li><a href="MemberList.jsp">회원정보관리</a></li>
				</ul>
			</nav>
		</header>
	</div>

	<!-- 메인 -->
	<main>
		<div id="maindiv">
			<form>
				<table class="devicetable">
					<caption>기기 등록</caption>

					<tr>
						<td class="devicetd">* 기기ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text"></td>
					</tr>
					<tr>
						<td class="devicetd">* 산 ID&nbsp;</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td colspan="2" class="send"><input type="submit"
							value="기기등록"></td>
					</tr>
				</table>
			</form>
		</div>

	</main>


	<!-- 밑부분 -->
	<footer> </footer>
</body>
</html>