<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>산으로 오세영 기기등록</title>

<link rel="stylesheet" href="assets/css/join.css">
<link rel="stylesheet" href="assets/css/Device.css">



</head>
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

		<section id="page3">
			<div id="page3-left">
				<div id="joindiv">
					<form id="joinform" action="Join" method="post">

						<table id="jointable">
							<caption>기기대여시작</caption>
							<tr>
								<td class="jointd1">* 기기ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="기기ID를 입력하세요"></td>
							</tr>
							<tr>
								<td class="jointd1">* 사용자ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="사용자ID를 입력하세요"></td>
							</tr>
							<tr>
								<td class="jointd1">* 대여일</td>
								<td class="jointd2"><input type="date" required="required"
									placeholder="대여일을 입력하세요"></td>
							</tr>
							<tr>
								<td class="jointd1">* 대여 시작시간</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="대여 시작시간을 입력하세요"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="기기대여시작"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>
			
			<div id="page3-right">
				<div id="joindiv">
				
					<form id="joinform" action="Join" method="post">

						<table id="jointable">
							<caption>기기대여시작</caption>
							<tr>
								<td class="jointd1">* 기기ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="기기ID를 입력하세요"></td>
							</tr>
							<tr>
								<td class="jointd1">* 사용자ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="사용자ID를 입력하세요"></td>
							</tr>
							<tr>
								<td class="jointd1">* 대여일</td>
								<td class="jointd2"><input type="date" required="required"
									placeholder="대여일을 입력하세요"></td>
							</tr>
							<tr>
								<td class="jointd1">* 대여 시작시간</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="대여 시작시간을 입력하세요"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="기기대여시작"></td>
							</tr>
						</table>

					</form>
				</div>
			
			</div>
			
		</section>
			
			
			

			<!-- 메인 -->
			<main></main>


			<!-- 밑부분 -->
			<footer> </footer>
</body>
</html>