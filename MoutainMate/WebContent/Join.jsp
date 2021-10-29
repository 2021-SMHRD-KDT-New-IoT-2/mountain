
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
						<li><a href="MainPage.jsp">�Խ���</a></li>
						<li><a href="MainPage.jsp">����</a></li>
						<li><a href="MainPage.jsp">�ѷ�����</a></li>

					</ul>
				</nav>
			</header>
		</div>


		<div id="joindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>ȸ������</caption>
					<tr>
						<td class="jointd1">* ���̵�</td>
						<td class="jointd2"><input type="text"  id="input_id" name="id" required="required"
							placeholder="ID�� �Է��ϼ���">
							<input type="button" value="ID�ߺ�üũ" onclick="idCheck()">
							<span id="sp_result"></span>
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

	</section>

<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<script>
			function idCheck(){
				//����� ���� ���� ������ ���� ���
				//1. innerText : �±� ���̿� �ؽ�Ʈ�� ������ ���� ���<p> ����Ʈ�׸���</p> ->����Ʈ �׸���
				//2. innerHTML : �±� ���̿� ��� ��Ҹ� ������ ���� ��� <p><span>SP</span></p> -> <span>SP</span>
				//3. value : input �±��� value �Ӽ��� ������ �ö� 
				var input =document.getElementById("input_id");
				/* alert(input.value); //-> vanilla js ���
				
				alert($('#input_id').val()); //jqery ��� */
				
				//ajax 
				$.ajax({
					type: "post", // ������ ���� �޽�
					data: {"id" : input.value}, // �����ϴ� ������
					url : "idCheckService", //�����͸� �����ϴ� (��û�ϴ�) ���������� url
					dataType : "text", //���䵥������ ����
					success : function(data){ //��ż���
						var sp_result=document.getElementById("sp_result");
						//alert(data)
						if(data=="true"){
							sp_result.innerText="���Ұ����� ���̵�";
							
						}else{
							$("#sp_result").text("��� ������ ���̵�");
						}
					},
					error: function(){
						alert("��Ž���!")
					}
				});
			}
			</script>
</body>
</html>