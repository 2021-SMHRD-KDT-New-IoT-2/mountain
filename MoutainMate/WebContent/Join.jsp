
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>������ ������ ȸ������</title>

<link rel="stylesheet" href="assets/css/join.css">

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


		<div id="joindiv">
			<form id="joinform" action="Join" method="post">

				<table id="jointable">
					<caption>ȸ������</caption>
					<tr>
						<td class="jointd1">* ���̵�</td>
						<td class="jointd2"><input type="text" name="id" required="required"
							placeholder="ID�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">* ��й�ȣ</td>
						<td class="jointd2"><input type="password" name="pw" required="required"
							placeholder="PW�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">* �̸�</td>
						<td class="jointd2"><input type="text" name="name" required="required"
							placeholder="�̸��� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">* ��ȭ��ȣ</td>
						<td class="jointd2"><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="��ȭ ��ȣ�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">����</td>
						<td class="jointd2"><input type="date"></td>
					</tr>
					<tr>
						<td class="jointd1">����</td>
						<td class="jointd2">
						�� <input type="radio" name="gender" value="man">
						�� <input type="radio" name="gender" value="woman">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Join">
						</td>
					</tr>
				</table>

			</form>


		</div>

	</section>

</body>
</html>