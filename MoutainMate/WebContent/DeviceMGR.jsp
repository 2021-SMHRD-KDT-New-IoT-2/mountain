<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������ �����</title>

<link rel="stylesheet" href="assets/css/DeviceMGR.css">


</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>
					<li><a href="MainPage.jsp">����������</a></li>
					<li><a href="DeviceMGR.jsp">�����</a></li>
					<li><a href="RegistrationDevice.jsp">���뿩</a></li>
					<li><a href="MemberList.jsp">ȸ����������</a></li>
				</ul>
			</nav>
		</header>
	</div>

	<!-- ���� -->
	<main>
		<div id="maindiv">
			<form>
				<table class="devicetable">
					<caption>��� ���</caption>

					<tr>
						<td class="devicetd">* ���ID&nbsp;</td>
						<td class="deviceinputtd"><input type="text"></td>
					</tr>
					<tr>
						<td class="devicetd">* �� ID&nbsp;</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td colspan="2" class="send"><input type="submit"
							value="�����"></td>
					</tr>
				</table>
			</form>
		</div>

	</main>


	<!-- �غκ� -->
	<footer> </footer>
</body>
</html>