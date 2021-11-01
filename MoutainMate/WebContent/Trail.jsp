
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
							name="id" required="required" placeholder="ID를 입력"></td>
					</tr>


					<tr>
						<td class="devicetd">* 등산로&nbsp;</td>
						<td><input type="text" id="input_mroad" name="mroad"
							required="required" placeholder="SD카드 정보를 입력">
						</td>

					</tr>
					<tr>
						<td colspan="2" id="send"><input type="button" class="btn"
							value="완주코스 등록" onClick="insert()"></td>
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
		function insert() {
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
						alert("insert() id체크완료");
						insertCheck();

					} else {
						alert("존재하지 않는 사용자입니다.");
					}
				},
				error : function() {
					alert("통신실패");
				}
			});
		}
		
		
		function insertCheck() {
			var input_id = $("#input_id").val();
			var input_mroad = $("#input_mroad").val();

			if ((input_id != "") && (input_mroad != "")) {
				alert("빈칸없음");
				$.ajax({
					type : "post", // 데이터 전송 받식
					data : { // 전송하는 데이터
						"id" : input_id,
						"arduino" : input_mroad
					},
					url : "TrailUpdate", //데이터를 전송하는 (요청하는) 서버페이지 url
					dataType : "text", //응답데이터의 형식
					success : function(data) {
						alert("insertCheck() 완료");
						if(data=="true"){
							alert("등산로 등록 성공!");
						}else{
							alert("등산로 등록 실패");
						}
					},
					error : function() {
						alert("insertCheck() 통신실패");
					}
				});
			} else {
				alert("필수 입력란을 모두 입력해 주세요.");
			}

		}
	</script>
</body>
</html>