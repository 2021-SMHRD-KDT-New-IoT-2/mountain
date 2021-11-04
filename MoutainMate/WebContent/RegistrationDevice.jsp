<%@page import="model.DeviceDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������ �����</title>

<link rel="stylesheet" href="assets/css/Device.css">


</head>
<!-- ���������߰� -->
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
					<li><a href="DeviceMGR.jsp">�����</a></li>
					<li><a href="RegistrationDevice.jsp">���뿩</a></li>
					<li><a href="Trail.jsp">�����ڽ����</a></li>
					<li><a href="MemberList.jsp">ȸ����������</a></li>
				</ul>
			</nav>
		</header>
	</div>

	<!-- ���� -->
	<main>

		<div id="device-left">
			<form>
				<table class="devicetable" action="RentalDevice" method="post">
					<caption>���뿩����</caption>

					<tr>
						<td class="devicetd">* ���ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text" name="deviceid"
							id="input_deviceid"></td>
					</tr>
					<tr>
						<td class="devicetd">* �����ID&nbsp;</td>
						<td><input type="text" name="id" id="input_id"></td>
					</tr>
					<tr>

						<td colspan="2" class="send"><input type="button"
							value="�뿩����" onClick="rentalCheck()"></td>
					</tr>
				</table>
			</form>
		</div>



		<div id="device-right">
			<form>
				<table class="devicetable">
					<caption>���ݳ��Ϸ�</caption>
					<tr>
						<td class="devicetd">* ���ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text" name="pid2"
							id="input_deviceid2"></td>
					</tr>
					<tr>
						<td class="devicetd">* �����ID&nbsp;</td>
						<td><input type="text" name="id2" id="input_id2"></td>
					</tr>
					<tr>
						<td colspan="2" class="send"><input type="button"
							value="�ݳ��Ϸ�" onClick="rentalCheck2()"></td>
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
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // �����ϴ� ������
				url : "RentalCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
						alert("�̹� �뿩���� ����Դϴ�.");
					} else {
						idCheck();
					}
				},
				error : function() {
					alert("rentalCheck() ��Ž���");
				}
			});
		}
		function idCheck() {
			var input = $("#input_id").val();
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input
				}, // �����ϴ� ������
				url : "IdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
						deviceIdCheck();
					} else {
						alert("�������� �ʴ� ���̵��Դϴ�.");
					}
				},
				error : function() {
					alert("idCheck() ��Ž���");
				}
			});
		}

		function deviceIdCheck() {
			var input = $("#input_deviceid").val();
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"deviceid" : input
				}, // �����ϴ� ������
				url : "deviceIdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
						rentalStart();

					} else {
						alert("�������� �ʴ� ���̵��Դϴ�.");
					}
				},
				error : function() {
					alert("deviceIdCheck() ��Ž���");
				}
			});
		}

		function rentalStart() {
			var input_id = $("#input_id").val();
			var input_deviceid = $("#input_deviceid").val();

			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // �����ϴ� ������
				url : "RentalDeviceS", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					alert("�뿩����");
					
				},
				error : function() {
					alert("rentalStart() ��Ž���");
				}
			});
		}

		
		
		
		
		function rentalCheck2() {
			var input_id = $("#input_id2").val();
			var input_deviceid = $("#input_deviceid2").val();

			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // �����ϴ� ������
				url : "RentalCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
						idCheck2();
					} else {
						alert("����� �뿩 ������ �����ϴ�.");
					}
				},
				error : function() {
					alert("rentalCheck() ��Ž���");
				}
			});
		}

		function idCheck2() {
			var input = $("#input_id2").val();
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input
				}, // �����ϴ� ������
				url : "IdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
					
						deviceIdCheck2();
					} else {
						alert("�������� �ʴ� ���̵��Դϴ�.");
					}
				},
				error : function() {
					alert("idCheck() ��Ž���");
				}
			});
		}

		function deviceIdCheck2() {
			var input = $("#input_deviceid2").val();
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"deviceid" : input
				}, // �����ϴ� ������
				url : "deviceIdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
				
						rentalFinish();
					} else {
						alert("�������� �ʴ� ���̵��Դϴ�.");
					}
				},
				error : function() {
					alert("deviceIdCheck() ��Ž���");
				}
			});
		}

		function rentalFinish() {
			var input_id = $("#input_id2").val();
			var input_deviceid = $("#input_deviceid2").val();
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input_id,
					"deviceid" : input_deviceid
				}, // �����ϴ� ������
				url : "RentalDeviceF", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					alert("�ݳ��Ϸ�");
				},
				error : function() {
					alert("rental() ��Ž���");
				}
			});
		}
	</script>
</body>
</html>