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
	
	<%
	UserDAO dao = new UserDAO();
	ArrayList<UserVO> arr = dao.selectAll();
	System.out.println(arr.size());
	%>
	
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
					for (UserVO vo : arr) {
				%>
				<tr>
					<td><%=vo.getid()%></td>
					<td><%=vo.getname()%></td>
					<td><%=vo.getphoneNumber()%></td>
					<td><%=vo.getbirth()%></td>
					<td><%=vo.getgender()%></td>
					<td><%=vo.getmgr()%></td>
					<td><a href="deleteService?id=<%=vo.getid()%>">����</a>
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