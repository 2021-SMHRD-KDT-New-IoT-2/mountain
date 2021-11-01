
<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@page import="model.UserVO"%>
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
	<!-- 제이쿼리추가 -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<%
	
		UserVO vo = (UserVO) session.getAttribute("User");
	%>

	<section>

		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>
						<%
							if (vo == null) {
						%>
						<li><a href="#menu">로그인</a></li>
						<li><a href="Join.jsp">회원가입</a></li>
						<%
							} else {
						if ((vo.getmgr()).equals("0")) {
						%>
						<!-- 사용자,관리자 둘다 로그인시 로그아웃 -->
						<li><a href="logoutService">로그아웃</a></li>
						<li><a href="UserInfo.jsp">마이페이지</a></li>
						<%
							} else if ((vo.getmgr()).equals("1")) {
						%>
						<li><a href="logoutService">로그아웃</a></li>
						<li><a href="DeviceMGR.jsp">관리자페이지</a></li>
						<%
							}
						}
						%>


						<!-- 사용자 로그인시 회원가입 = 마이페이지 로 변경후 페이지 링크 -->




						<li class="scrollmoving"><a href="#page2">게시판</a></li>
						<li class="scrollmoving"><a href="#page3">등산로</a></li>
						<li class="scrollmoving"><a href="#page4">둘러보기</a></li>
						<li><a class="btn trigger" href="#menu">≡</a></li>
					</ul>
				</nav>
			</header>
		</div>


		<!-- menu -->

		<nav id="menu">
			<ul class="links">
				<li><h5>로그인</h5></li>
				<form action="loginService" method="post">
					<li><input name="id" type="text" required="required"
						placeholder="ID를 입력하세요"></li>
					<li><input name="pw" type="password" required="required"
						placeholder="PW를 입력하세요"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
				</form>
			</ul>

		</nav>

		<!-- 메인 -->
		<main>
			<div id="centerlogo">
				<img id="mainlogo" src="images/mainLogo.png"> <img
					id="underbar" src="images/underbar.png">
			</div>


			<div id="introduce">
				<span> 친구들과 함께 등산로를 탐색해 보세요.<br> 완주한 등산로를 친구들과 공유하며
					즐겨보세요.<br> 등산이 더울 즐거워 집니다.
				</span> <img src="images/main_rightside.png">
				<button id="mainbtn" onclick="location.href='#page3'">등산로
					탐색하기</button>


			</div>
		</main>


	</section>


	<section id="page2">게시판</section>









	<section id="page3">
		<div id="page3-left">
			<div id="selectroad">
				<form>
					<table id="roadtable">
						<caption>
							<b>랜선 등산로 탐방</b>
						</caption>
						<tr>
							<td><label for="searchM">산</label></td>
							<td>
								<div class="searchbox">
									<input id="searchM" type="text" list="select_mountain"
										name="select_mountain" placeholder="산을 선택해주세요.">

									<datalist id="select_mountain">
										<%
											MountainDAO dao = new MountainDAO();
										ArrayList<MountainVO> al = dao.selectAll();

										for (int i = 0; i < al.size(); i++) {
											MountainVO M_vo = al.get(i);
										%>
										<option value="<%=M_vo.getM_id()%>"><%=M_vo.getM_name()%></option>
										<%
											}
										%>
									</datalist>
								</div>
							</td>
						</tr>

						<script>
							$("#searchM").change(
											function() {

												var selectM = $("#searchM").val();

												if (selectM != "") {
													//alert("if문 안에 들어옴");
													$.ajax({
														type : "post", // 데이터 전송 받식
														data : {
															"select_mountain" : selectM
														}, // 전송하는 데이터
														url : "selectRoad", //데이터를 전송하는 (요청하는) 서버페이지 url
														dataType : "json", //응답데이터의 형식
														success : function(
																data) {
															var obj = JSON
																	.stringify(data);
															var obj2 = data;
															//alert("통신 성공!!");
															console.log(data[0]);
															console.log(data.length);
																for (var i = 0; i < data.length; i++) {
																	console.log(data[i].mroad_name);
																	var temp_html = "<option value='"+ (i + 1)+ "'>"+ data[i].mroad_name+ "</option>";
																	$("#mroad").append(temp_html);
																}
														},
														error : function() {
															alert("통신실패");
														}
													});
												}

											});
						</script>

						<tr>
							<td><label for="searchR">등산로</label></td>
							<td>
								<div class="searchbox">
									<input id="searchR" type="text" list="mroad"
										placeholder="등산로를 선택해주세요.">
									<datalist id="mroad">

										<!--<option id="sp_result" value=""></option>  -->

									</datalist>
								</div>
							</td>
						</tr>
					</table>
				</form>

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
				<img src="images/roadblack.png">
				<div id="courselevel">
					<img src="images/roadlevel.png">
				</div>
			</div>
		</div>

	</section>


	<section id="page4">
		<div id="page4inner">
			<div id="page4-up">
				<form>
					<table id="searchIdtable">
						<tr>
							<td id="idtd1"><label id="idlabel" for="searchId">아이디
									검색</label></td>
							<td id="idtd2">
								<div class="searchidbox">
									<input id="searchId" type="text" placeholder="검색할 아이디를 입력해주세요.">
									<button id="searchIdbtn" onClick="findUser()">
										<img class="search" src="images/search.png">
									</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
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

						<!-- <li></li> -->

					</ul>
					<p id="select_user_time"></p>
				</div>
			</div>
		</div>


	</section>

	<!-- 밑부분 -->
	<section id="page5">
		<footer id="footer">
			<div id="page5-left">
				<div>
					<!--제품 사진들 넣기-->
					<img id="footer_side-left" src="images/side_left.png"> <img
						id="footer_side-right" src="images/side_right.png">
					<!-- 이미지 cover로 넣기 -->
				</div>
				<div>
					<span id="explane"> &nbsp;&nbsp;&nbsp;▶ 우리 제품은 등삭객들의 등산로
						선호도을 확인 할 수 있으며 등산객의 등산 시작, 완료 시간을 기록하여 방문자 기록 자동 저장됩니다. 더불어 블루투스
						스피커의 역할이 가능하여 등산객들이 자발적 참여을 유도합니다. 'mountain mate'와 함께 산림 관리에 편리함을
						더해보세요. </span>
				</div>

			</div>

			<div id="page5-right">

				<table>
					<caption id="company">(주)산으로오세영</caption>
					<tr>
						<td id="phoneimgtd" rowspan="2"><img id="phoneimg"
							src="images/phonephoto.png"></td>
						<td id="phonenum" rowspan="2">대표전화</td>
						<td class="phonenumber">062-123-4567</td>
					</tr>
					<tr>
						<td class="phonenumber">010-1111-2222</td>
					</tr>
					<tr>
						<td class="companyinfo" colspan="3">월~금 PM 1 ~ PM 5</td>
					</tr>
					<tr>
						<td class="companyinfo" colspan="3">광주광역시 동구 스마트 인재 개발원 B반</td>

					</tr>
				</table>


				<div>
					<form>
						<table id="Asktable">
							<tr>
								<td id="asktabletd1">이메일</td>
								<td id="asktabletd2"><input id="writerid" type="text"
									placeholder="이메일을 입력해주세요."> @ <input
									id="select_email_input" type="text" list="select_email">
									<datalist id="select_email">
										<option>직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
									</datalist></td>
							</tr>
							<tr id="asktexttr">
								<td colspan="2"><textarea id="asktext">
                                        문의사항을 남겨주시면 빠르게 연락드립니다.
                                    </textarea></td>
							</tr>
							<tr>
								<td id="send" colspan="2"><input type="submit" value="보내기">
								</td>
							</tr>
						</table>
					</form>
				</div>

			</div>
		</footer>
	</section>

	<div id="quickscroll">
		<a href="#top_header"><img id="side_up" src="images/side_up.png"></a>
		<a class="scrollmoving" href="#page5"><img id="side_down"
			src="images/side_down.png"></a>
	</div>

	<script>
		function findUser() {
			var input = $("#searchId").val();
			console.log(input);
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input
				}, // 전송하는 데이터
				url : "FindUser", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "json", //응답데이터의 형식
				success : function(replise) {
					
					alert("json통신성공");
					console.log(replise[0]);
					console.log(replise.length);

					var id_html = "<li> ID : " + replise[0].id + "</li>";
					$("#select_user").append(id_html);
					var level_html = "<li> LEVEL : " + replise[0].level + "</li>";
					$("#select_user").append(level_html);
					var totalTime_html = "<li> Total Time : </li>";
					$("#select_user_time").innerText(replise[0].totalTime + "h");

				},
				error : function() {
					alert("통신실패");
				}
			});
		}
	</script>



</body>
</html>