<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������ �����</title>

<link rel="stylesheet" href="assets/css/Device.css">


</head>
<body>


	<div id="top_header">
		<header id="header" class="">
			<a id="san_logo" href="MainPage.jsp"></a>

			<nav>
				<ul>
					<li><a href="MainPage.jsp">����������</a></li>
					<li><a href="#RegistrationDevice">�����</a></li>
					<li><a href="#MemberInfo.jsp">ȸ����������</a></li>
				</ul>
			</nav>
		</header>
	</div>

	<!-- ���� -->
	<main>

			<div id="device-left">
				<form>
					<table class="devicetable">
						<caption>���뿩����</caption>
						
						<tr>
							<td class="devicetd">* ���ID&nbsp;</td>
							<td class="deviceinputtd"><input type="text"></td>
						</tr>
						<tr>
							<td class="devicetd">* �����ID&nbsp;</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td colspan="2" class="send"><input type="submit" value="�뿩����"></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="device-right">
				<form>
					<table class="devicetable">
						<caption>���ݳ��Ϸ�</caption>
						<tr>
							<td class="devicetd">* ���ID&nbsp;</td>
							<td class="deviceinputtd"><input type="text"></td>
						</tr>
						<tr>
							<td class="devicetd">* �����ID&nbsp;</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td colspan="2"  class="send"><input type="submit" value="�ݳ��Ϸ�"></td>
						</tr>
					</table>
				</form>
			</div>


	</main>


	<!-- �غκ� -->
	<footer> </footer>
</body>
</html>