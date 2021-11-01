
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
							name="id" required="required" placeholder="ID�� �Է�"></td>
					</tr>


					<tr>
						<td class="devicetd">* ����&nbsp;</td>
						<td><input type="text" id="input_mroad" name="mroad"
							required="required" placeholder="SDī�� ������ �Է�">
						</td>

					</tr>
					<tr>
						<td colspan="2" id="send"><input type="button" class="btn"
							value="�����ڽ� ���" onClick="insert()"></td>
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
		function insert() {
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
						alert("insert() idüũ�Ϸ�");
						insertCheck();

					} else {
						alert("�������� �ʴ� ������Դϴ�.");
					}
				},
				error : function() {
					alert("��Ž���");
				}
			});
		}
		
		
		function insertCheck() {
			var input_id = $("#input_id").val();
			var input_mroad = $("#input_mroad").val();

			if ((input_id != "") && (input_mroad != "")) {
				alert("��ĭ����");
				$.ajax({
					type : "post", // ������ ���� �޽�
					data : { // �����ϴ� ������
						"id" : input_id,
						"arduino" : input_mroad
					},
					url : "TrailUpdate", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
					dataType : "text", //���䵥������ ����
					success : function(data) {
						alert("insertCheck() �Ϸ�");
						if(data=="true"){
							alert("���� ��� ����!");
						}else{
							alert("���� ��� ����");
						}
					},
					error : function() {
						alert("insertCheck() ��Ž���");
					}
				});
			} else {
				alert("�ʼ� �Է¶��� ��� �Է��� �ּ���.");
			}

		}
	</script>
</body>
</html>