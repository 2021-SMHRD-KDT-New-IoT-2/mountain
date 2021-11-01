<%@page import="model.UserDAO"%>
<%@page import="model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>����������</title>

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
	
		if (vogender.equals("0")) {// ����
			gender = "man";
		} else if (vogender.equals("1")) {
			gender = "woman";
		}

		if ((vo.getmgr()).equals("1")) {
			mgr = "������";
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

						<li><a href="MainPage.jsp">�α׾ƿ�</a></li>
						<li><a href="UserInfo.jsp">����������</a></li>
						<li><a href="MainPage.jsp#page2">�Խ���</a></li>
						<li><a href="MainPage.jsp#page3">����</a></li>
						<li><a href="MainPage.jsp#page4">�ѷ�����</a></li>
						<li><a class="btn trigger" href="#menu">��</a></li>
					</ul>
				</nav>

			</header>

		</div>



		<main>
			<div id="joindiv">
				<form id="joinform" action="updateService" method="post">

					<table id="jointable">
						<caption>���� ������</caption>
						<tr>
							<td class="jointd1">* ���̵�</td>
							<td class="jointd2" name="id"><%=vo.getid()%></td>
						</tr>
						<tr>
							<td class="jointd1">* ��й�ȣ</td>
							<td class="jointd2"><input type="password" name="pw"
								required="required" id="input_pw">&nbsp; <input
								type="button" id="pwcheck" class="btn" onClick="pwCheck()"
								value="check"></td>
						</tr>
						<tr>
							<td colspan="2"><span id="sp_result"></span></td>
						</tr>


						<tr>
							<td class="jointd1">* �̸�</td>
							<td class="jointd2">
								<input placeholder="<%=vo.getname()%>" type="text" id="input_name" name="name">
							</td>
						</tr>
						<tr>
							<td class="jointd1">* ��ȭ��ȣ</td>
							<td class="jointd2">
								<input placeholder="<%=vo.getphoneNumber()%>" type="tel" name="phoneNumber"
								id="input_tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000">
							</td>
						</tr>
						<tr>
							<td class="jointd1">* ����</td>
							<td class="jointd2"><%=vo.getbirth()%></td>
						</tr>
						<tr>
							<td class="jointd1"></td>
							<td class="jointd2"><input type="date" id="input_birth"
								name="birth"></td>

						</tr>

						<tr>
							<td class="jointd1">* ����</td>
							<td class="jointd2"><%=gender%></td>
						</tr>
						<tr>
							<td class="jointd1"></td>
							<td class="jointd2">�� <input type="radio" name="gender"
								value="0"> �� <input type="radio" name="gender" value="1">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn"
								type="button" value="����" onClick="modify()"></td>
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
						$("#sp_result").html("��й�ȣ�� ��ġ�մϴ�.");
					} else {
						$("#sp_result").html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
					}
				},
				error : function() {
					alert("��ſ���");
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
				type : "post", // ������ ���� �޽�
				data : { // �����ϴ� ������
				
					"pw" : input_pw,
					"name" : input_name,
					"phoneNumber" : input_tel,
					"birth" : input_birth,
					"gender" : input_gender
				},
				url : "updateService", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) {
					alert("�����Ϸ�");
					window.location.href = "MainPage.jsp";
				},
				error : function() {
					alert("��Ž���");
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
						alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
						$("#sp_result").html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
						
					}
				},
				error : function() {
					alert("��ſ���");
				}
			});
		}
		
	</script>



</body>
</html>