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

			<div id="memberlistdiv">

				<table class="membertable" id="membercolumn">
					<caption>회원 목록</caption>
					<tr>
						<td id="1">아이디</td>
						<td id="2">이름</td>
						<td id="3">전화번호</td>
						<td id="4">생년월일</td>
						<td id="5">성별</td>
						<td id="6">매니저여부</td>
						<td id="7">삭제</td>
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
							<td><a href="deleteService?id=<%=vo.getid()%>">삭제</a></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>


			</div>




		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>




</body>
</html>