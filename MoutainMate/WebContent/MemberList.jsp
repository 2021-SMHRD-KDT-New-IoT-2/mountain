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
	System.out.println(arr.size());
	%>

	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">메인페이지</a></li>
						<li><a href="DeviceMGR.jsp">기기등록</a></li>
						<li><a href="RegistrationDevice.jsp">기기대여</a></li>
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
						<td>아이디</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>생년월일</td>
						<td>성별</td>
						<td>매니저여부</td>
						<td>삭제</td>
					</tr>
				</table>
				<table class="membertable" id="memberlist">
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
						<td><button>삭제</button></td>
					</tr>
					<%
						}
					%>
				</table>



			</div>




		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>




</body>
</html>