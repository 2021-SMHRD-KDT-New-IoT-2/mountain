<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������ �����</title>

<link rel="stylesheet" href="assets/css/join.css">
<link rel="stylesheet" href="assets/css/Device.css">



</head>
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

		<section id="page3">
			<div id="page3-left">
				<div id="joindiv">
					<form id="joinform" action="Join" method="post">

						<table id="jointable">
							<caption>���뿩����</caption>
							<tr>
								<td class="jointd1">* ���ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="���ID�� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td class="jointd1">* �����ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="�����ID�� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td class="jointd1">* �뿩��</td>
								<td class="jointd2"><input type="date" required="required"
									placeholder="�뿩���� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td class="jointd1">* �뿩 ���۽ð�</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="�뿩 ���۽ð��� �Է��ϼ���"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="���뿩����"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>
			
			<div id="page3-right">
				<div id="joindiv">
				
					<form id="joinform" action="Join" method="post">

						<table id="jointable">
							<caption>���뿩����</caption>
							<tr>
								<td class="jointd1">* ���ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="���ID�� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td class="jointd1">* �����ID</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="�����ID�� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td class="jointd1">* �뿩��</td>
								<td class="jointd2"><input type="date" required="required"
									placeholder="�뿩���� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td class="jointd1">* �뿩 ���۽ð�</td>
								<td class="jointd2"><input type="text" required="required"
									placeholder="�뿩 ���۽ð��� �Է��ϼ���"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="���뿩����"></td>
							</tr>
						</table>

					</form>
				</div>
			
			</div>
			
		</section>
			
			
			

			<!-- ���� -->
			<main></main>


			<!-- �غκ� -->
			<footer> </footer>
</body>
</html>