<%@page import="model.UserDAO"%>
<%@page import="model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>마이페이지</title>

<link rel="stylesheet" href="assets/css/UserInfo.css">

</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	UserVO vo = (UserVO) session.getAttribute("User");
	String id = vo.getid();
	
	System.out.println("vo.getid() : "+id);
	UserDAO dao = new UserDAO();
	
	vo = dao.selectOne(id);
	String gender = "";
	String mgr = "";
	
	String vogender = vo.getgender();
	String vomgr = vo.getmgr();
	
	System.out.println("vogender : "+vogender);
	System.out.println("vomgr : "+vomgr);
	
		if (vogender.equals("0")) {// 남자
			gender = "man";
		} else if (vogender.equals("1")) {
			gender = "woman";
		}

		if ((vo.getmgr()).equals("1")) {
			mgr = "관리자";
		} else {
			mgr = "";
		}
	
	
	
	%>
	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">로그아웃</a></li>
						<li><a href="UserInfo.jsp">마이페이지</a></li>
						<li><a href="MainPage.jsp#page2">게시판</a></li>
						<li><a href="MainPage.jsp#page3">등산로</a></li>
						<li><a href="MainPage.jsp#page4">둘러보기</a></li>
						<li><a class="btn trigger" href="#menu">≡</a></li>
					</ul>
				</nav>

			</header>

		</div>



		<main>
			<div id="joindiv">
				<form id="joinform" action="updateService" method="post">

					<table id="jointable">
						<caption>마이 페이지</caption>
						<tr>
							<td class="jointd1">* 아이디</td>
							<td class="jointd2" name="id"><%=vo.getid()%></td>
						</tr>
						<tr>
							<td class="jointd1">* 비밀번호</td>
							<td class="jointd2"><input type="password" name="pw"
								required="required" id="input_pw">&nbsp; <input
								type="button" id="pwcheck" class="btn" onClick="pwCheck()"
								value="check"></td>
						</tr>
						<tr>
							<td colspan="2"><span id="sp_result"></span></td>
						</tr>


						<tr>
							<td class="jointd1">* 이름</td>
							<td class="jointd2">
								<input placeholder="<%=vo.getname()%>" type="text" id="input_name" name="name">
							</td>
						</tr>
						<tr>
							<td class="jointd1">* 전화번호</td>
							<td class="jointd2">
								<input placeholder="<%=vo.getphoneNumber()%>" type="tel" name="phoneNumber"
								id="input_tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000">
							</td>
						</tr>
						<tr>
							<td class="jointd1">* 생일</td>
							<td class="jointd2"><%=vo.getbirth()%></td>
						</tr>
						<tr>
							<td class="jointd1"></td>
							<td class="jointd2"><input type="date" id="input_birth"
								name="birth"></td>

						</tr>

						<tr>
							<td class="jointd1">* 성별</td>
							<td class="jointd2"><%=gender%></td>
						</tr>
						<tr>
							<td class="jointd1"></td>
							<td class="jointd2">남 <input type="radio" name="gender"
								value="0"> 여 <input type="radio" name="gender" value="1">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn"
								type="button" value="수정" onClick="modify()"></td>
						</tr>
					</table>

				</form>


			</div>
		</main>


		<footer> </footer>
	</section>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script>
		function pwCheck() {
		
			var input_pw = $("#input_pw").val();
			$.ajax({
				type : "post",
				data : {
					
					"pw" : input_pw
				},
				url : "pwCheck",
				dataType : "text",
				success : function(data) {
					console.log(data);
					if (data == "true") {
						$("#sp_result").html("비밀번호가 일치합니다.");
					} else {
						$("#sp_result").html("비밀번호가 일치하지 않습니다.");
					}
				},
				error : function() {
					alert("통신오류");
				}
			});
		}

		function modifyCheck() {
	
			var input_pw = $("#input_pw").val();
			var input_name = $("#input_name").val();
			var input_tel = $("#input_tel").val();
			var input_birth = $("#input_birth").val();
			var input_gender = $(":input:radio[name='gender']:checked").val();

			$.ajax({
				type : "post", // 데이터 전송 받식
				data : { // 전송하는 데이터
				
					"pw" : input_pw,
					"name" : input_name,
					"phoneNumber" : input_tel,
					"birth" : input_birth,
					"gender" : input_gender
				},
				url : "updateService", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					alert("수정완료");
					window.location.href = "MainPage.jsp";
				},
				error : function() {
					alert("통신실패");
				}
			});
		}
		
		function modify() {
	
			var input_pw = $("#input_pw").val();
			$.ajax({
				type : "post",
				data : {
				
					"pw" : input_pw
				},
				url : "pwCheck",
				dataType : "text",
				success : function(data) {
					console.log(data);
					if (data == "true") {
						modifyCheck();
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						$("#sp_result").html("비밀번호가 일치하지 않습니다.");
						
					}
				},
				error : function() {
					alert("통신오류");
				}
			});
		}
		
	</script>



</body>
</html>