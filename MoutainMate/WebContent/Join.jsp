
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
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">�α���</a> <!--<a href="Login.jsp">�α���</a>  -->
						</li>
						<li><a href="#">ȸ������</a></li>

						<li><a href="MainPage.jsp">�Խ���</a></li>
						<li><a href="MainPage.jsp">����</a></li>
						<li><a href="MainPage.jsp">�ѷ�����</a></li>
					
					</ul>
				</nav>
			</header>
		</div>


			
				<li><h5>ȸ������</h5></li>
		<form action="Join" method="post">

				<table>
					<tr>
						<td><input type="text" name="id" required="required" placeholder="ID�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td><input type="password" name="pw" required="required" placeholder="PW�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td><input type="text" name="name" required="required" placeholder="�̸��� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
							placeholder="��ȭ ��ȣ�� �Է��ϼ���"></td>
					</tr>
					<tr>
            			<td> <input type="date"> </td>
            	    </tr>
					<tr>
						<td>�� <input type="radio" name="gender">
						�� <input type="radio" name="gender"></td>
					</tr>
				</table>
				<li><input type="submit" value="Join" class="button fit"></li>

			</form>

		<!-- ���� -->

		<main>
		</main>

		<!-- �غκ� -->
		<footer> </footer>
	</section>

</body>
</html>