
<%@page import="model.MountainVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MountainDAO"%>
<%@page import="model.UserVO"%>
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
	<!-- ���������߰� -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<%
		UserVO vo = (UserVO) session.getAttribute("User");
	%>

	<section>

		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>
						<%
							if (vo == null) {
						%>
						<li><a href="#menu">�α���</a></li>
						<li><a href="Join.jsp">ȸ������</a></li>
						<%
							} else {
						if ((vo.getmgr()).equals("0")) {
						%>
						<!-- �����,������ �Ѵ� �α��ν� �α׾ƿ� -->
						<li><a href="logoutService">�α׾ƿ�</a></li>
						<li><a href="UserInfo.jsp">����������</a></li>
						<%
							} else if ((vo.getmgr()).equals("1")) {
						%>
						<li><a href="logoutService">�α׾ƿ�</a></li>
						<li><a href="DeviceMGR.jsp">������������</a></li>
						<%
							}
						}
						%>


						<!-- ����� �α��ν� ȸ������ = ���������� �� ������ ������ ��ũ -->





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

				<div id="lidiv">
					<li id="logintitle"><b><h2>�α���</h2></b></li>
					<br>
					<div id="innerlidiv">
						<form action="loginService" method="post">
							<li id="llid1"><input class="log" name="id" type="text"
								required="required" placeholder="ID�� �Է��ϼ���"></li>
							<li id="llid2"><input class="log" name="pw" type="password"
								required="required" placeholder="PW�� �Է��ϼ���"></li>
							<li id="llid3"><input id="loginbtn" type="submit"
								value="LogIn" class="button fit"></li>
						</form>
					</div>
				</div>
			</ul>

		</nav>

		<!-- ���� -->
		<main>
			<div id="centerlogo">
				<img id="mainlogo" src="images/mainLogo.png"> <img
					id="underbar" src="images/underbar.png">
			</div>


			<div id="introduce">
				<span> ģ����� �Բ� ���θ� Ž���� ������.<br> ������ ���θ� ģ����� �����ϸ�
					��ܺ�����.<br> ����� ���� ��ſ� ���ϴ�.
				</span> <img src="images/main_rightside.png">
				<button id="mainbtn" onclick="location.href='#page3'">����
					Ž���ϱ�</button>


			</div>
		</main>


	</section>

	<section id="page3">
		<div id="page3-left">
			<div id="selectroad">
				<form>
					<table id="roadtable">
						<caption>
							<b>���� ���� Ž��</b>
						</caption>
						<tr>
							<td><label for="searchM">��</label></td>
							<td>
								<div class="searchbox">
									<input id="searchM" type="text" list="select_mountain"
										name="select_mountain" placeholder="���� �������ּ���.">

									<datalist id="select_mountain">
										<%
											MountainDAO dao = new MountainDAO();
										ArrayList<MountainVO> al = dao.selectAll();

										for (int i = 0; i < al.size(); i++) {
											MountainVO M_vo = al.get(i);
										%>
										<option value="<%=M_vo.getM_id()%>"><%=M_vo.getM_name()%></option>
										<%
											}
										%>
									</datalist>
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

										<!--<option id="sp_result" value=""></option>  -->

									</datalist>
								</div>
							</td>
						</tr>
					</table>
				</form>

				<table id="top5">
					<caption>
						<b>�ְ� TOP5 ����</b>
					</caption>
					<%
						String backgroundColor = "rgba(119, 146, 145, 0.8)";
					String[] top5 = dao.top5();
					for (int i = 0; i < top5.length; i++) {
						if (i % 2 == 0) {
							backgroundColor = "rgba(139, 170, 169, 0.8)";
						}
					%>
					<tr id="top5tr<%=i + 1%>">
						<td><%=i + 1%></td>
						<td><%=top5[i]%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>

		<div id="page3-right">
			<div id="roadimgbox">
				<div id="selectimg">

					<img id="selectRimgBack"> <img id="selectRimg">
				</div>
				<div id="courselevel">
					<img src="images/roadlevel.png">
				</div>

			</div>
		</div>

	</section>


	<section id="page4">
	
		<div id="page4inner">
			<div id="page4-up">

				<table id="searchIdtable">
					<tr>
						<td id="idtd1"><b><label id="idlabel" for="searchId">���̵�
									�˻�</label></b></td>
						<td id="idtd2">
							<div class="searchidbox">
								<input id="searchId" type="text" placeholder="�˻��� ���̵� �Է����ּ���.">
								<button id="searchIdbtn" onClick="findUser()">
									<img class="search" src="images/search.png">
								</button>
							</div>
						</td>
					</tr>
				</table>

			</div>


			<div id="page4-down">
				<div id="down-left">
					<p id="mname"></p>
					<div id="clearrod"></div>
					<!-- <img id="side-left" class="side" src="images/side_left.png">
					<img id="side-right" class="side" src="images/side_right.png">-->
				</div>


				<div id="down-right">
					<img id="profile"> <img id="profile_back"
						src="images/profile_background.png">
					<ul id="select_user">

					</ul>
					<p id="select_user_time"></p>
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
					<img id="Santa"> <img id="footer_side-left"
						src="images/side_left.png" onClick="back()"> <img
						id="footer_side-right" src="images/side_right.png"
						onClick="forward()">
					<!-- �̹��� cover�� �ֱ� -->
				</div>
				<div>
					<span id="explane"> <b>&nbsp;��꿡 ��ſ��� ���ϴ�! ����Ҷ�! ��r������</b> <br>
					<br>&nbsp;&nbsp;&nbsp;�� �츮 ��ǰ�� ��谴���� ���� ��ȣ���� Ȯ�� �� �� ������ ��갴��
						��� ����, �Ϸ� �ð��� ����Ͽ� �湮�� ����� �ڵ� ����˴ϴ�. ���Ҿ� ���ٹ߱��� ���Խ� �Ҹ� �˸����� ������ �������ݴϴ�.
						'��r������'�� �Բ� �긲 ������ ������ ���غ�����.
					</span>
				</div>

			</div>

			<div id="page5-right">

				<table>
					<caption id="company">
						<b>(��)�����ο�����</b>
					</caption>
					<tr>
						<td id="phoneimgtd" rowspan="2"><img id="phoneimg"
							src="images/phonephoto.png"></td>
						<td id="phonenum" rowspan="2">��ǥ��ȭ</td>
						<td class="phonenumber">062-123-4567</td>
					</tr>
					<tr>
						<td class="phonenumber">010-1111-2222</td>
					</tr>
					<tr></tr>
					<tr>
						<td class="companyinfo" colspan="3">��~�� PM 1 ~ PM 5</td>
					</tr>
					<tr>
						<td class="companyinfo" colspan="3">���ֱ����� ���� ����Ʈ ���� ���߿� B��</td>

					</tr>
				</table>


				<div id="lastdiv">
					<form>
						<table id="Asktable">
							<tr id="emailtr">
								<td id="asktabletd1">�̸���</td>

								<td id="asktabletd2"><input id="writerid" type="text"
									placeholder="�̸����� �Է����ּ���."> <span id="lastspan">@</span>
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

	<script>
		$(document).ready(function() {
			$("#Santa").attr("src", "images/Santa3.png");
		})
		function back() {
			var src = $("#Santa").attr("src");
			var i = parseInt(src.substring(12, 13));
			if (i == 1) {
				i = 3;
			} else {
				i--;
			}
			$("#Santa").attr("src", "images/Santa" + i + ".png");
		}

		function forward() {
			var src = $("#Santa").attr("src");
			var i = parseInt(src.substring(12, 13));
			if (i == 3) {
				i = 1;
			} else {
				i++;
			}
			$("#Santa").attr("src", "images/Santa" + i + ".png");
		}
		
		
		
		$("#searchM").change(
				function() {

					var selectM = $("#searchM").val();

					if (selectM != "") {
						//alert("if�� �ȿ� ����");
						$.ajax({
							type : "post", // ������ ���� �޽�
							data : {
								"select_mountain" : selectM
							}, // �����ϴ� ������
							url : "selectRoad", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
							dataType : "json", //���䵥������ ����
							success : function(data) {

								//alert("��� ����!!");
								console.log(data[0]);
								console.log(data.length);
								for (var i = 0; i < data.length; i++) {
									console.log(data[i].mroad_name);
									var temp_html = "<option value='" + (i + 1)
											+ "'>" + data[i].mroad_name
											+ "</option>";
									$("#mroad").append(temp_html);
								}
							},
							error : function() {
								alert("��Ž���");
							}
						});
					}

				});

		$("#searchR").change(function() {
			var selectR = $("#searchR").val();
			console.log("selectR : " + selectR);
			$("#selectRimg").attr("src", "images/" + selectR + ".png");

		});

		function findUser() {
			var input = $("#searchId").val();
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input
				}, // �����ϴ� ������
				url : "FindUser", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "json", //���䵥������ ����
				success : function(data) {
					var obj = data;

					$("#clearrod").empty();
					$("#mname").text("")
					if ($("#li1").val) {
						$("#profile").attr("src", "");
						for (var i = 1; i <= 3; i++) {
							$("#li" + i).remove();
						}
						$("#select_user_time").text("");
					}
					$("#profile").attr("src", "images/profile1.jpg");
					$("#select_user").append(
							"<li id='li1'><b> ID : " + data.id + "</b></li>");
					$("#select_user").append(
							"<li id='li2'><b> LEVEL : " + data.level
									+ "</b></li>");
					$("#select_user").append(
							"<li id='li3'><b> Total Time :</b></li>");
					$("#select_user_time").text(data.totalTime + "h");

					findRoad();
					//return false;
				},
				error : function() {
					alert("��Ž���");
				}
			});
		}

		function findRoad() {
			var input = $("#searchId").val();
			console.log("findRoad() : " + input);
			$.ajax({
				type : "post", // ������ ���� �޽�
				data : {
					"id" : input
				}, // �����ϴ� ������
				url : "FindUserRoad", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
				dataType : "json", //���䵥������ ����
				success : function(data) {

					console.log(data);
					if (data.length > 0) {
						$("#mname").text("�����");
					}
					console.log(data.length);
					for (var i = 0; i < data.length; i++) {
						console.log("src : " + data[i])
						$("#clearrod").append(
								"<img style='top:0%; width:100%; heigth:100%;	position:absolute;'src='images/"
										+ data[i] + ".png'>");
					}

				},
				error : function() {
					alert("��Ž���");
				}
			});

		}
	</script>



</body>
</html>