<%@page import="model.DeviceDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>산으로 오세영 기기등록</title>

<link rel="stylesheet" href="assets/css/Device.css">


</head>
<!-- 제이쿼리추가 -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>
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

		<div id="device-left">
			<form>
				<table class="devicetable" action="RentalDevice" method="post">
					<caption>기기대여시작</caption>

					<tr>
						<td class="devicetd">* 기기ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text" name="deviceid"
							id="input_deviceid"></td>
					</tr>
					<tr>
						<td class="devicetd">* 사용자ID&nbsp;</td>
						<td><input type="text" name="id" id="input_id"></td>
					</tr>
					<tr>

						<td colspan="2" class="send"><input type="button"
							value="대여시작" onClick="rentalCheck()"></td>
					</tr>
				</table>
			</form>
		</div>



		<div id="device-right">
			<form>
				<table class="devicetable">
					<caption>기기반납완료</caption>
					<tr>
						<td class="devicetd">* 기기ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text" name="pid2"
							id="input_deviceid2"></td>
					</tr>
					<tr>
						<td class="devicetd">* 사용자ID&nbsp;</td>
						<td><input type="text" name="id2" id="input_id2"></td>
					</tr>
					<tr>
						<td colspan="2" class="send"><input type="button"
							value="반납완료" onClick="rentalCheck2()"></td>
					</tr>
				</table>
			</form>
		</div>


	</main>

	<script>
		function rentalCheck() {
			var input_id = $("#input_id").val();
			var input_deviceid = $("#input_deviceid").val();

			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // 전송하는 데이터
				url : "RentalCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
						alert("이미 대여중인 기기입니다.");
					} else {
						idCheck();
					}
				},
				error : function() {
					alert("rentalCheck() 통신실패");
				}
			});
		}
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
						deviceIdCheck();
					} else {
						alert("존재하지 않는 아이디입니다.");
					}
				},
				error : function() {
					alert("idCheck() 통신실패");
				}
			});
		}

		function deviceIdCheck() {
			var input = $("#input_deviceid").val();
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"deviceid" : input
				}, // 전송하는 데이터
				url : "deviceIdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
						rentalStart();

					} else {
						alert("존재하지 않는 아이디입니다.");
					}
				},
				error : function() {
					alert("deviceIdCheck() 통신실패");
				}
			});
		}

		function rentalStart() {
			var input_id = $("#input_id").val();
			var input_deviceid = $("#input_deviceid").val();

			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // 전송하는 데이터
				url : "RentalDeviceS", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					alert("대여시작");
					
				},
				error : function() {
					alert("rentalStart() 통신실패");
				}
			});
		}

		
		
		
		
		function rentalCheck2() {
			var input_id = $("#input_id2").val();
			var input_deviceid = $("#input_deviceid2").val();

			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // 전송하는 데이터
				url : "RentalCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
						idCheck2();
					} else {
						alert("기기의 대여 내역이 없습니다.");
					}
				},
				error : function() {
					alert("rentalCheck() 통신실패");
				}
			});
		}

		function idCheck2() {
			var input = $("#input_id2").val();
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input
				}, // 전송하는 데이터
				url : "IdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
					
						deviceIdCheck2();
					} else {
						alert("존재하지 않는 아이디입니다.");
					}
				},
				error : function() {
					alert("idCheck() 통신실패");
				}
			});
		}

		function deviceIdCheck2() {
			var input = $("#input_deviceid2").val();
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"deviceid" : input
				}, // 전송하는 데이터
				url : "deviceIdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					if (data == "true") {
				
						rentalFinish();
					} else {
						alert("존재하지 않는 아이디입니다.");
					}
				},
				error : function() {
					alert("deviceIdCheck() 통신실패");
				}
			});
		}

		function rentalFinish() {
			var input_id = $("#input_id2").val();
			var input_deviceid = $("#input_deviceid2").val();
			$.ajax({
				type : "post", // 데이터 전송 받식
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // 전송하는 데이터
				url : "RentalDeviceF", //데이터를 전송하는 (요청하는) 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) {
					alert("반납완료");
				},
				error : function() {
					alert("rental() 통신실패");
				}
			});
		}
	</script>
</body>
</html>