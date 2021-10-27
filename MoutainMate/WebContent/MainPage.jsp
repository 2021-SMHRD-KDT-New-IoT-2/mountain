
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
	<div>
		<img src="images/side_up.png">
		<img src="images/side_down.png">
	</div>



	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="Login.jsp">�α���</a> <!--<a href="Login.jsp">�α���</a>  -->
						</li>
						<li><a href="Join.jsp">ȸ������</a></li>

						<!-- <li><h2><a href="LogOut.jsp">�α׾ƿ�</a></h2></li>
				<li><h2><a href="MemberInfo.jsp">ȸ������</a></h2></li> -->
						<li><a href="#page2">�Խ���</a></li>
						<li><a href="#page3">����</a></li>
						<li><a href="#page4">�ѷ�����</a></li>
						<li><a class="btn trigger" href="#menu">��</a></li>

					</ul>
				</nav>
			</header>
		</div>


		<!-- menu -->

		<nav id="menu">
			<ul class="links">
				<li><h5>�α���</h5></li>
				<form action="LoginService" method="post">
					<li><input name="id" type="text" required="required"
						placeholder="ID�� �Է��ϼ���"></li>
					<li><input name="pw" type="password" required="required"
						placeholder="PW�� �Է��ϼ���"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
				</form>
			</ul>
			<br> <br>
			<ul class="actions vertical">
				<li><h5>ȸ������</h5></li>
				<form action="Join" method="post">

					<table>
						<tr>
							<td><input type="text" name="id" required="required"
								placeholder="ID�� �Է��ϼ���"></td>
						</tr>
						<tr>
							<td><input type="password" name="pw" required="required"
								placeholder="PW�� �Է��ϼ���"></td>
						</tr>
						<tr>
							<td><input type="text" name="name" required="required"
								placeholder="�̸��� �Է��ϼ���"></td>
						</tr>
						<tr>
							<td><input type="tel" name="tel" required="required"
								pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="��ȭ ��ȣ�� �Է��ϼ���"></td>
						</tr>
						<tr>
							<td><input type="date"></td>
						</tr>
						<tr>
							<td id="td" align="right">����</td>
							<td>�� <input type="radio" name="gender"> �� <input
								type="radio" name="gender"></td>
						</tr>
					</table>

					<button>ȸ������</button>
				</form>
			</ul>
		</nav>


		<!-- ���� -->
		<main>
			<div id="centerlogo">
				<img id="mainlogo" src="images/mainLogo.png"> <img
					id="underbar" src="images/underbar.png">
			</div>
		</main>
	</section>


	<section id="page2">�Խ���</section>



	<section id="page3">
		<div id="page3-left">
			<div id="selectroad">
				<table id="roadtable">
					<caption>
						<b>���� ���� Ž��</b>
					</caption>
					<tr>
						<td><label for="searchM">��</label></td>
						<td>
							<div class="searchbox">
								<input id="searchM" type="text" placeholder="�˻�� �Է����ּ���.">
								<button>
									<img class="search" src="images/search.jpg">
								</button>
							</div>
						</td>
					</tr>
					<tr>
						<td><label for="searchR">����</label></td>
						<td>
							<div class="searchbox">
								<input id="searchR" type="text" list="mroad"
									placeholder="���θ� �������ּ���.">
								<datalist id="mroad">
									<option value="1">����1</option>
									<option value="2">����2</option>
									<option value="3">����3</option>
									<option value="4">����4</option>
								</datalist>
							</div>
						</td>
					</tr>
				</table>

				<table id="top5">
					<caption>
						<b>�ְ� TOP5 ����</b>
					</caption>
					<tr>
						<td>1</td>
						<td>�����16�ڽ�</td>
					</tr>
					<tr>
						<td>2</td>
						<td>�����16�ڽ�</td>
					</tr>
					<tr>
						<td>3</td>
						<td>�����16�ڽ�</td>
					</tr>
					<tr>
						<td>4</td>
						<td>�����16�ڽ�</td>
					</tr>
					<tr>
						<td>5</td>
						<td>�����16�ڽ�</td>
					</tr>

				</table>
			</div>
		</div>

		<div id="page3-right">
			<div id="roadimgbox">
				<p id="coursename">
					<�����16�ڽ�>
				</p>
				<div id="courselevel">
					<img>
				</div>
			</div>
		</div>

	</section>

	<section id="page4">
		<div id="page4inner">
			<div id="page4-up">
				<table id="searchIdtable">
					<tr>
						<td id="idtd1"><label id="idlabel" for="searchId">���̵�
								�˻�</label></td>
						<td id="idtd2">
							<div class="searchidbox">
								<input id="searchId" type="text" placeholder="�˻��� ���̵� �Է����ּ���.">
								<button>
									<img class="search" src="images/search.jpg">
								</button>
							</div>
						</td>
					</tr>
				</table>
			</div>


			<div id="page4-down">
				<div id="down-left">
					<p id="mname">���̸�</p>
					<img id="side-left" class="side" src="images/side_left.png">
					<img id="side-right" class="side" src="images/side_right.png">
				</div>


				<div id="down-right">
					<img id="profile_back" src="images/profile_back.png">
					<ul id="select_user">
						<li>�����id(����)</li>
						<li>�޵���2(����) ����</li>
						<li>�� ���ð�</li>
					</ul>
					<p id="select_user_time">155h</p>
				</div>
			</div>
		</div>


	</section>


	<!-- �غκ� -->
	<footer> </footer>
















	<!-- ���������߰� -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>