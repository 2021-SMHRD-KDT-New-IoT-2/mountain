
<%@page import="model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������ ȸ������</title>

<link rel="stylesheet" href="assets/css/join.css">

</head>
<body>

	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">�α���</a></li>
						<li><a href="MainPage.jsp">�Խ���</a></li>
						<li><a href="MainPage.jsp">����</a></li>
						<li><a href="MainPage.jsp">�ѷ�����</a></li>

					</ul>
				</nav>
			</header>
		</div>


		<div id="joindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>ȸ������</caption>
					<tr>
						<td class="jointd1">* ���̵�</td>
						<td class="jointd2">
						<input type="text"  id="input_id" name="id" required="required" placeholder="ID�� �Է��ϼ���">
							<input type="button" value="ID�ߺ�üũ" onclick="idCheck()">
							
					</tr>
					<tr>
						<td colspan="2" align="center" color="red">
							<span id="sp_result"></span>
						</td>
					</tr>
					<tr>
						<td class="jointd1">* ��й�ȣ</td>
						<td class="jointd2"><input type="password" id="input_pw"name="pw" required="required"
							placeholder="PW�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">* �̸�</td>
						<td class="jointd2"><input type="text" id="input_name" name="name" required="required"
							placeholder="�̸��� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">* ��ȭ��ȣ</td>
						<td class="jointd2"><input type="tel" id="input_tel" name="phoneNumber" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000"></td>
					</tr>
					<tr>
						<td class="jointd1">* ����</td>
						<td class="jointd2"><input type="date" id="input_birth" name="birth"></td>
					</tr>
					<tr>
						<td class="jointd1">* ����</td>
						<td class="jointd2" >
						�� <input type="radio" name="gender" id="input_gender0" value="0">
						�� <input type="radio" name="gender" id="input_gender1"  value="1">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="Join" onClick="join()">
						</td>
					</tr>
					
				</table>

			</form>


		</div>

	</section>

<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<script>
			function idCheck(){
				var input = $("#input_id").val();
				$.ajax({
					type: "post", // ������ ���� �޽�
					data: {"id" : input}, // �����ϴ� ������
					url : "IdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
					dataType : "text", //���䵥������ ����
					success : function(data){
						if(data=="true"){
							$("#sp_result").html("�̹� ������� id�Դϴ�.");
						}else{
							$("#sp_result").html("��밡���� id �Դϴ�.");
						}
					},
					error : function(){
						alert("��Ž���");
		           	}
				});
			}
			
			
			function joinCheck(){
				var input_id = $("#input_id").val();
				var input_pw = $("#input_pw").val();
				var input_name = $("#input_name").val();
				var input_tel = $("#input_tel").val();
				var input_birth = $("#input_birth").val();
				var input_gender = $(":input:radio[name='gender']:checked").val();
			
					
				if((input_id!="")&&(input_pw!="")&&(input_name!="")&&(input_tel!="")&&(input_birth!="")&&(input_gender!="")){
					alert("��ĭ����");
					alert("if�� �ȿ� ����");
					$.ajax({
						type: "post", // ������ ���� �޽�
						data: { // �����ϴ� ������
							"id" : input_id,
							"pw":input_pw,
							"name":input_name,
							"phoneNumber":input_tel,
							"birth":input_birth,
							"gender":input_gender
							},
						url : "joinService", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
						dataType : "text", //���䵥������ ����
						success : function(data){
							alert("joincheck�Ϸ�");
							window.location.assign("joinsuccess.jsp");
						},
						error : function(){
							alert("��Ž���");
			           	}
					});
				}else{
					alert("�ʼ� �Է¶��� ��� �Է��� �ּ���.");
				}
				
			}
			
			function radioCheck(){
				var rcheck = $(":input:radio[name='gender']").length;
				var checkval = $(":input:radio[name='gender']:checked").val();
			}
			
			function join(){
				var input = $("#input_id").val();
				$.ajax({
					type: "post", // ������ ���� �޽�
					data: {"id" : input}, // �����ϴ� ������
					url : "IdCheck", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
					dataType : "text", //���䵥������ ����
					success : function(data){
						if(data=="true"){
							alert("�ߺ��� ���̵� �����մϴ�.");
							$("#sp_result").html("�̹� ������� id�Դϴ�.");
						}else{
							joinCheck();
						}
					},
					error : function(){
						alert("��Ž���");
		           	}
				});
			}
			</script>
</body>
</html>