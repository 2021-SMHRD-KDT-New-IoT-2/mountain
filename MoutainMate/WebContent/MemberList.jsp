<%@page import="model.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/css/Device.css">
<body>

	<%
		UserDAO dao = new UserDAO();
	ArrayList<UserVO> arr = dao.selectAll();
	%>

	<section>
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

			<div id="memberlistdiv">

				<table class="membertable" id="membercolumn">
					<caption>ȸ�� ���</caption>
					<tr>
						<td id="1">���̵�</td>
						<td id="2">�̸�</td>
						<td id="3">��ȭ��ȣ</td>
						<td id="4">�������</td>
						<td id="5">����</td>
						<td id="6">�Ŵ�������</td>
						<td id="7">����</td>
					</tr> 
				</table>
				<div id="listpage">
					<table class="membertable" id="memberlist">
						<%
							for (int i = 0; i < arr.size(); i++) {
							UserVO vo = arr.get(i);
							
						%>

						<tr>
							<td><%=vo.getid()%></td>
							<td><%=vo.getname()%></td>
							<td><%=vo.getphoneNumber()%></td>
							<td><%=vo.getbirth()%></td>
							<td><%=vo.getgender()%></td>
							<td><%=vo.getmgr()%></td>
							<td><a href="deleteService?id=<%=vo.getid()%>">����</a></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>


			</div>




		</main>


		<!-- �غκ� -->
		<footer> </footer>
	</section>




</body>
</html>