
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

						<li><a href="#menu">�α���</a></li>
						<!-- �����,������ �Ѵ� �α��ν� �α׾ƿ� -->
						<li><a href="#menu">�α׾ƿ�</a></li>
						<li><a href="Join.jsp">ȸ������</a></li>
						<!-- ����� �α��ν� ȸ������ = ���������� �� ������ ������ ��ũ -->
						<li><a href="MemberInfo.jsp">����������</a></li>
						<!-- ������ �α��ν� ȸ������=ȸ�������� ���� �� �������� �̵� -->
						<li><a href="RegistrationDevice.jsp">������������</a></li>
						<li class="scrollmoving"><a href="#page2">�Խ���</a></li>
						<li class="scrollmoving"><a href="#page3">����</a></li>
						<li class="scrollmoving"><a href="#page4">�ѷ�����</a></li>
						<li><a class="btn trigger" href="#menu">��</a></li>
					</ul>
				</nav>
			</header>
		</div>


		<!-- menu -->

		<nav id="menu">
			<ul class="links">
				<li><h5>�α���</h5></li>
				<form action="loginService" method="post">
					<li><input name="id" type="text" required="required"
						placeholder="ID�� �Է��ϼ���"></li>
					<li><input name="pw" type="password" required="required"
						placeholder="PW�� �Է��ϼ���"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
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
									<img class="search" src="images/search.png">
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
									<img class="search" src="images/search.png">
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
	<section id="page5">
		<footer id="footer">
			<div id="page5-left">
				<div>
					<!--��ǰ ������ �ֱ�-->
					<img id="footer_side-left" src="images/side_left.png">
					<img id="footer_side-right" src="images/side_right.png">
					<!-- �̹��� cover�� �ֱ� -->
				</div>
				<div>
					<span id="explane"> &nbsp;&nbsp;&nbsp;�� �츮 ��ǰ�� ��谴���� ����
						��ȣ���� Ȯ�� �� �� ������ ��갴�� ��� ����, �Ϸ� �ð��� ����Ͽ� �湮�� ��� �ڵ� ����˴ϴ�. ���Ҿ� �������
						����Ŀ�� ������ �����Ͽ� ��갴���� �ڹ��� ������ �����մϴ�. 'mountainmate'�� �Բ� �긲 ������ ������
						���غ�����. </span>
				</div>

			</div>

			<div id="page5-right">

				<table>
					<caption id="company">(��)�����ο�����</caption>
					<tr>
						<td id="phoneimgtd" rowspan="2"><img id="phoneimg"
							src="images/phonephoto.png"></td>
						<td id="phonenum" rowspan="2">��ǥ��ȭ</td>
						<td class="phonenumber">062-123-4567</td>
					</tr>
					<tr>
						<td class="phonenumber">010-1111-2222</td>
					</tr>
					<tr>
						<td class="companyinfo" colspan="3">��~�� PM 1 ~ PM 5</td>
					</tr>
					<tr>
						<td class="companyinfo" colspan="3">���ֱ����� ���� ����Ʈ ���� ���߿� B��</td>

					</tr>
				</table>


				<div>
					<form>
						<table id="Asktable">
							<tr>
								<td id="asktabletd1">�̸���</td>
								<td id="asktabletd2">
								<input id="writerid" type="text" placeholder="�̸����� �Է����ּ���."> @
								<input id="select_email_input" type="text" list="select_email">
									<datalist id="select_email">
										<option>�����Է�</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
									</datalist></td>
							</tr>
							<tr id="asktexttr">
								<td colspan="2"><textarea id="asktext">
                                        ���ǻ����� �����ֽø� ������ �����帳�ϴ�.
                                    </textarea></td>
							</tr>
							<tr>
								<td id="send" colspan="2"><input type="submit" value="������">
								</td>
							</tr>
						</table>
					</form>
				</div>

			</div>
		</footer>
	</section>





	<div id="quickscroll">
		<a href="#top_header"><img id="side_up" src="images/side_up.png"></a>
		<a class="scrollmoving" href="#page5"><img id="side_down"
			src="images/side_down.png"></a>
	</div>



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