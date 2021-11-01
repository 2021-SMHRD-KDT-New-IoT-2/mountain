<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������ ���ε��</title>

<link rel="stylesheet" href="assets/css/DeviceMGR.css">


</head>
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
		<div id="maindiv">
			<form action="TrailUpdate" method="post">
				<table class="devicetable">
					<caption>�����ڽ� ���</caption>

					<tr>
						<td class="devicetd">* �����ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text" id="input_id"
							name="deviceid" required="required" placeholder="ID�� �Է��ϼ���">
							&nbsp;<input class="btn" type="button" value="ID�ߺ�üũ"
							onclick="idCheck()"></td>
					</tr>

					<tr>
						<td colspan="2" id="sp_result"></td>
					</tr>


					<tr>
						<td class="devicetd">* ����&nbsp;</td>
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
							value="�����ڽ� ���" onClick="RegiSuccess()"></td>
					</tr>
				</table>
			</form>
		</div>

	</main>


	<!-- �غκ� -->
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
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input
				}, // �����ϴ� ������
				url : "IdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					if (data == "true") {
						$("#sp_result").html("�̹� ������� id�Դϴ�.");
					} else {
						$("#sp_result").html("��밡���� id �Դϴ�.");
					}
				},
				error : function() {
					alert("��Ž���");
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
				alert("��ĭ����");
				alert("if�� �ȿ� ����");
				$.ajax({
					type : "post", // ������ ���� �޽�
					data : { // �����ϴ� ������
						"id" : input_id,
						"pw" : input_pw,
						"name" : input_name,
						"phoneNumber" : input_tel,
						"birth" : input_birth,
						"gender" : input_gender
					},
					url : "joinService", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
					dataType : "text", //���䵥������ ����
					success : function(data) {
						alert("joincheck�Ϸ�");
						window.location.assign("joinsuccess.jsp");
					},
					error : function() {
						alert("��Ž���");
					}
				});
			} else {
				alert("�ʼ� �Է¶��� ��� �Է��� �ּ���.");
			}

		}

		function join() {
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
						alert("�ߺ��� ���̵� �����մϴ�.");
						$("#sp_result").html("�̹� ������� id�Դϴ�.");
					} else {
						joinCheck();
					}
				},
				error : function() {
					alert("��Ž���");
				}
			});
		}
	</script>
</body>
</html>