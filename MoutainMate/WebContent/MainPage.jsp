
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
	<div>
		<img src="images/side_up.png">
		<img src="images/side_down.png">
	</div>



	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="Login.jsp">로그인</a> <!--<a href="Login.jsp">로그인</a>  -->
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


		<!-- menu -->

		<nav id="menu">
			<ul class="links">
				<li><h5>로그인</h5></li>
				<form action="LoginService" method="post">
					<li><input name="id" type="text" required="required"
						placeholder="ID를 입력하세요"></li>
					<li><input name="pw" type="password" required="required"
						placeholder="PW를 입력하세요"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
				</form>
			</ul>
			<br> <br>
			<ul class="actions vertical">
				<li><h5>회원가입</h5></li>
				<form action="Join" method="post">

					<table>
						<tr>
							<td><input type="text" name="id" required="required"
								placeholder="ID를 입력하세요"></td>
						</tr>
						<tr>
							<td><input type="password" name="pw" required="required"
								placeholder="PW를 입력하세요"></td>
						</tr>
						<tr>
							<td><input type="text" name="name" required="required"
								placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<td><input type="tel" name="tel" required="required"
								pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화 번호를 입력하세요"></td>
						</tr>
						<tr>
							<td><input type="date"></td>
						</tr>
						<tr>
							<td id="td" align="right">성별</td>
							<td>남 <input type="radio" name="gender"> 여 <input
								type="radio" name="gender"></td>
						</tr>
					</table>

					<button>회원가입</button>
				</form>
			</ul>
		</nav>


		<!-- 메인 -->
		<main>
			<div id="centerlogo">
				<img id="mainlogo" src="images/mainLogo.png"> <img
					id="underbar" src="images/underbar.png">
			</div>
		</main>
	</section>


	<section id="page2">게시판</section>



	<section id="page3">
		<div id="page3-left">
			<div id="selectroad">
				<table id="roadtable">
					<caption>
						<b>랜선 등산로 탐방</b>
					</caption>
					<tr>
						<td><label for="searchM">산</label></td>
						<td>
							<div class="searchbox">
								<input id="searchM" type="text" placeholder="검색어를 입력해주세요.">
								<button>
									<img class="search" src="images/search.jpg">
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td><label for="searchR">등산로</label></td>
						<td>
							<div class="searchbox">
								<input id="searchR" type="text" list="mroad"
									placeholder="등산로를 선택해주세요.">
								<datalist id="mroad">
									<option value="1">무등1</option>
									<option value="2">무등2</option>
									<option value="3">무등3</option>
									<option value="4">무등4</option>
								</datalist>
							</div>
						</td>
					</tr>
				</table>

				<table id="top5">
					<caption>
						<b>주간 TOP5 등산로</b>
					</caption>
					<tr>
						<td>1</td>
						<td>무등산16코스</td>
					</tr>
					<tr>
						<td>2</td>
						<td>무등산16코스</td>
					</tr>
					<tr>
						<td>3</td>
						<td>무등산16코스</td>
					</tr>
					<tr>
						<td>4</td>
						<td>무등산16코스</td>
					</tr>
					<tr>
						<td>5</td>
						<td>무등산16코스</td>
					</tr>

				</table>
			</div>
		</div>

		<div id="page3-right">
			<div id="roadimgbox">
				<p id="coursename">
					<무등산16코스>
				</p>
				<div id="courselevel">
					<img>
				</div>
			</div>
		</div>

	</section>

	<section id="page4">
		<div id="page4inner">
			<div id="page4-up">
				<table id="searchIdtable">
					<tr>
						<td id="idtd1"><label id="idlabel" for="searchId">아이디
								검색</label></td>
						<td id="idtd2">
							<div class="searchidbox">
								<input id="searchId" type="text" placeholder="검색할 아이디를 입력해주세요.">
								<button>
									<img class="search" src="images/search.jpg">
								</button>
							</div>
						</td>
					</tr>
				</table>
			</div>


			<div id="page4-down">
				<div id="down-left">
					<p id="mname">산이름</p>
					<img id="side-left" class="side" src="images/side_left.png">
					<img id="side-right" class="side" src="images/side_right.png">
				</div>


				<div id="down-right">
					<img id="profile_back" src="images/profile_back.png">
					<ul id="select_user">
						<li>사용자id(수정)</li>
						<li>뒷동산2(수정) 레벨</li>
						<li>총 등산시간</li>
					</ul>
					<p id="select_user_time">155h</p>
				</div>
			</div>
		</div>


	</section>


	<!-- 밑부분 -->
	<footer> </footer>
















	<!-- 제이쿼리추가 -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>