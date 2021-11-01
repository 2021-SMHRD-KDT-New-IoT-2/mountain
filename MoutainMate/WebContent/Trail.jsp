<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>산으로 오세영 등산로등록</title>

<link rel="stylesheet" href="assets/css/DeviceMGR.css">


</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>
					<li><a href="MainPage.jsp">HOME</a></li>
					<li><a href="DeviceMGR.jsp">기기등록</a></li>
					<li><a href="RegistrationDevice.jsp">기기대여</a></li>
					<li><a href="Trail.jsp">완주코스등록</a></li>
					<li><a href="MemberList.jsp">회원정보관리</a></li>
				</ul>
			</nav>
		</header>
	</div>

	<!-- 메인 -->
	<main>
		<div id="maindiv">
			<form action="TrailUpdate" method="post">
				<table class="devicetable">
					<caption>완주코스 등록</caption>

					<tr>
						<td class="devicetd">* 사용자ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text" id="input_id"
							name="deviceid" required="required" placeholder="ID를 입력하세요">
							&nbsp;<input class="btn" type="button" value="ID중복체크"
							onclick="idCheck()"></td>
					</tr>

					<tr>
						<td colspan="2" id="sp_result"></td>
					</tr>


					<tr>
						<td class="devicetd">* 등산로&nbsp;</td>
						<td><input type="text" list="select_mountain"
							name="mountainid"> <datalist id="select_mountain">
								<%
									MountainDAO dao = new MountainDAO();
								ArrayList<MountainVO> al = dao.selectAll();

								for (int i = 0; i < al.size(); i++) {
									MountainVO vo = al.get(i);
								%>
								<option value="<%=vo.getM_id()%>"><%=vo.getM_name()%></option>
								<%
									}
								%>
							</datalist></td>
					</tr>
					<tr>
						<td colspan="2" id="send"><input type="button" class="btn"
							value="완주코스 등록" onClick="RegiSuccess()"></td>
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
		function idCheck() {
			var input = $("#input_id").val();
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input
				}, // 전송하는 데이터
				url : "IdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
						$("#sp_result").html("이미 사용중인 id입니다.");
					} else {
						$("#sp_result").html("사용가능한 id 입니다.");
					}
				},
				error : function() {
					alert("통신실패");
				}
			});
		}

		function joinCheck() {
			var input_id = $("#input_id").val();
			var input_pw = $("#input_pw").val();
			var input_name = $("#input_name").val();
			var input_tel = $("#input_tel").val();
			var input_birth = $("#input_birth").val();
			var input_gender = $(":input:radio[name='gender']:checked").val();

			if ((input_id != "") && (input_pw != "") && (input_name != "")
					&& (input_tel != "") && (input_birth != "")
					&& (input_gender != "")) {
				alert("빈칸없음");
				alert("if문 안에 들어옴");
				$.ajax({
					type : "post", // 데이터 전송 받식
					data : { // 전송하는 데이터
						"id" : input_id,
						"pw" : input_pw,
						"name" : input_name,
						"phoneNumber" : input_tel,
						"birth" : input_birth,
						"gender" : input_gender
					},
					url : "joinService", //데이터를 전송하는 (요청하는) 서버페이지 url
					dataType : "text", //응답데이터의 형식
					success : function(data) {
						alert("joincheck완료");
						window.location.assign("joinsuccess.jsp");
					},
					error : function() {
						alert("통신실패");
					}
				});
			} else {
				alert("필수 입력란을 모두 입력해 주세요.");
			}

		}

		function join() {
			var input = $("#input_id").val();
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input
				}, // 전송하는 데이터
				url : "IdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
						alert("중복된 아이디가 존재합니다.");
						$("#sp_result").html("이미 사용중인 id입니다.");
					} else {
						joinCheck();
					}
				},
				error : function() {
					alert("통신실패");
				}
			});
		}
	</script>
</body>
</html>