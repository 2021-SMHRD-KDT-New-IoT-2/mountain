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
<link rel="stylesheet" href="assets/css/join.css">
<body>
	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">����������</a></li>
						<li><a href="RegistrationDevice.jsp">�����</a></li>
						<li><a href="MemberList.jsp">ȸ������</a></li>
					</ul>
				</nav>
			</header>
		</div>

		<div id="joindiv">

				<table id="jointable">
					<caption>ȸ�� ���</caption>
					<tr>
						<td>���̵�</td>
						<td>�̸�</td>
						<td>��ȭ��ȣ</td>
						<td>�������</td>
						<td>����</td>
						<td>�Ŵ�������</td>
					</tr>
					<%
						UserDAO dao = new UserDAO();
					ArrayList<UserVO> al = dao.selectAll();
					for (int i = 0; i < al.size(); i++) {
						UserVO vo = al.get(i);
					%>
					<tr>
						<td><%=vo.getid() %></td>
						<td><%=vo.getname() %></td>
						<td><%=vo.getphoneNumber() %></td>
						<td><%=vo.getbirth() %></td>
						<td><%=vo.getgender() %></td>
						<td><%=vo.getmgr() %></td>


					</tr>
					<%
					}
					%>
				</table>



		</div>


		<!-- ���� -->
		<main></main>


		<!-- �غκ� -->
		<footer> </footer>
	</section>

</body>
</html>