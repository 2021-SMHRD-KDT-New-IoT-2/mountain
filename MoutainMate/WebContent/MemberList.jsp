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

						<li><a href="MainPage.jsp">메인페이지</a></li>
						<li><a href="RegistrationDevice.jsp">기기등록</a></li>
						<li><a href="MemberList.jsp">회원정보</a></li>
					</ul>
				</nav>
			</header>
		</div>

		<div id="joindiv">

			<table id="jointable">
				<caption>회원 목록</caption>
				<tr>
					<td>아이디</td>
					<td>이름</td>
					<td>전화번호</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>매니저여부</td>
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
					<td><a href="deleteService?id=<%=vo.getid()%>">삭제</a>
				</tr>
				<%
					}
				%>
			</table>



		</div>


		<!-- 메인 -->
		<main></main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>
	
	
	

</body>
</html>