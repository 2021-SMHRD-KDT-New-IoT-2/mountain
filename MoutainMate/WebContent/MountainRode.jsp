<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������ ����</title>
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
						<li><a href="#">�����</a></li>
						<li><a href="#">ȸ������</a></li>
						<li><a href="#">���ΰ���</a></li>
					</ul>
				</nav>
			</header>
		</div>
		
			<div id="joindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>���� ���</caption>
					<tr>
						<td class="jointd1">* �� �̸�</td>
						<td class="jointd2"><input type="text" required="required"
							placeholder="�� �̸��� �Է��ϼ���"></td>
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
						<td class="jointd2"><input type="tel" name="phoneNumber" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="��ȭ ��ȣ�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td class="jointd1">����</td>
						<td class="jointd2"><input type="date" name="birth"></td>
					</tr>
					<tr>
						<td class="jointd1">����</td>
						<td class="jointd2">
						�� <input type="radio" name="gender" value="0">
						�� <input type="radio" name="gender" value="1">
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
			
			
		<!-- ���� -->
		<main>
		
		</main>


		<!-- �غκ� -->
		<footer> </footer>
	</section>
		
		
		
</body>
</html>