
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������</title>
    
<link rel="stylesheet" href="assets/css/Main.css">

</head>
<body>

	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>
						<li><a href="notice.jsp">��������</a></li>
						<li><a href="Login.jsp">�α���</a> <!--<a href="Login.jsp">�α���</a>  -->
						</li>
						<li><a href="Join.jsp">ȸ������</a></li>

						<!-- <li><h2><a href="LogOut.jsp">�α׾ƿ�</a></h2></li>
				<li><h2><a href="MemberInfo.jsp">ȸ������</a></h2></li> -->
						<li><a href="#">�ѷ�����</a></li>
						<li><a href="#menu">��</a></li>
					</ul>
				</nav>

			</header>
		</div>

		<!-- menu -->
		<!-- 
		<nav id="menu">
			<ul class="links">
				<li><h5>�α���</h5></li>
				<form action="LoginService" method="post">
					<li><input name="email" type="text" placeholder="Email�� �Է��ϼ���"></li>
					<li><input name="pw" type="password" placeholder="PW�� �Է��ϼ���"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
				</form>
			</ul>
			<ul class="actions vertical">
				<li><h5>ȸ������</h5></li>
				<form action="JoinService" method="post">
					<li><input name="email" id="input_email" type="text"
						placeholder="Email�� �Է��ϼ���" onkeydown="inputEChk()"></li>
					<li><input type="button" value="�ߺ�Ȯ��" class="button fit"
						onclick="emailCheck()"></li>
					<li><sapn id="emailCheck"></sapn></li>
					<li><input name="pw" type="password" placeholder="PW�� �Է��ϼ���"></li>
					<li><input name="tel" type="text" placeholder="��ȭ��ȣ�� �Է��ϼ���"></li>
					<li><input name="address" type="text" placeholder="���ּҸ� �Է��ϼ���"></li>

					<li><input type="submit" id="submit" value="JoinUs"
						class="button fit"></li>

					<li><input type="button" id="submit" value="JoinUs"
						class="button fit"></li>
					<li><span>���̵� �ߺ� �˻縦 ���ּ���.</span></li>

				</form>
			</ul>
		</nav>
		-->

		<!-- ���� -->
		<main>
			<div id="centerlogo">
				<img id="mainlogo" src="images/mainLogo.png"> <img
					id="underbar" src="images/underbar.png">
			</div>
		</main>


		<!-- �غκ� -->
		<footer> </footer>
	</section>


</body>
</html>