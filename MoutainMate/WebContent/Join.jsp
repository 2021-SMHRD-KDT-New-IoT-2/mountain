
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>산으로 오세영 회원가입</title>

<link rel="stylesheet" href="assets/css/Main.css">

</head>
<body>
	
	<section>
		<header>
			<h1>
				<a href="MainPage.jsp"><div class="logo"></div>  </a>
			</h1>
			<nav>
				<ul>
					<li><a href="notice.jsp">공지사항</a></li>
				
					<li><a href="Login.jsp">로그인</a></li>
					<li><a href="Join.jsp">회원가입</a></li>
			
					<!-- <li><a href="LogOut.jsp">로그아웃</a></li>
					<li><a href="MemberInfo.jsp">회원정보</a></li> -->
		
					<li><a href="#">둘러보기</a></li>

				</ul>
			</nav>
		</header>


		<!-- 메인 -->
		<main>
			<form action="Join" method="post">

				<table id="ta">
					<tr>
						<td id="td">아이디</td>
						<td><input type="text" name="id" required="required"></td>
					</tr>
					<tr>
						<td id="td">비밀번호</td>
						<td><input type="password" name="pw" required="required"></td>
					</tr>
					<tr>
						<td id="td">이름</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
						<td id="td">전화번호</td>
						<td><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
							title="###-####-#### 형식으로 입력"></td>
					</tr>
					<tr>
						<td id="td">이름</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
           				 <td id="td">생년월일</td>
            			<td> <input type="date"> </td>
            	    </tr>
					<tr>
						<td id="td" align="right">성별</td>
						<td id="td">남 <input type="radio" name="gender"> 여 <input
							type="radio" name="gender"></td>
					</tr>
				</table>

				<button>회원가입</button>
			</form>
		</main>

		<!-- 밑부분 -->
		<footer> </footer>
	</section>

</body>
</html>