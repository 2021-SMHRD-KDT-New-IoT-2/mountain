
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>������ ������ ȸ������</title>

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
					<li><a href="notice.jsp">��������</a></li>
				
					<li><a href="Login.jsp">�α���</a></li>
					<li><a href="Join.jsp">ȸ������</a></li>
			
					<!-- <li><a href="LogOut.jsp">�α׾ƿ�</a></li>
					<li><a href="MemberInfo.jsp">ȸ������</a></li> -->
		
					<li><a href="#">�ѷ�����</a></li>

				</ul>
			</nav>
		</header>


		<!-- ���� -->
		<main>
			<form action="Join" method="post">

				<table id="ta">
					<tr>
						<td id="td">���̵�</td>
						<td><input type="text" name="id" required="required"></td>
					</tr>
					<tr>
						<td id="td">��й�ȣ</td>
						<td><input type="password" name="pw" required="required"></td>
					</tr>
					<tr>
						<td id="td">�̸�</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
						<td id="td">��ȭ��ȣ</td>
						<td><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
							title="###-####-#### �������� �Է�"></td>
					</tr>
					<tr>
						<td id="td">�̸�</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
           				 <td id="td">�������</td>
            			<td> <input type="date"> </td>
            	    </tr>
					<tr>
						<td id="td" align="right">����</td>
						<td id="td">�� <input type="radio" name="gender"> �� <input
							type="radio" name="gender"></td>
					</tr>
				</table>

				<button>ȸ������</button>
			</form>
		</main>

		<!-- �غκ� -->
		<footer> </footer>
	</section>

</body>
</html>