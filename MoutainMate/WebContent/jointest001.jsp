<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	</ul>
		
			<br><br><br><br>
			<ul class="actions vertical">
				<li><h5>ȸ������</h5></li>
		<form action="Join" method="post">

				<table>
					<tr>
						<td><input type="text" name="id" required="required" placeholder="ID�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td><input type="password" name="pw" required="required" placeholder="PW�� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td><input type="text" name="name" required="required" placeholder="�̸��� �Է��ϼ���"></td>
					</tr>
					<tr>
						<td><input type="tel" name="tel" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
							placeholder="��ȭ ��ȣ�� �Է��ϼ���"></td>
					</tr>
					<tr>
            			<td> <input type="date"> </td>
            	    </tr>
					<tr>
						<td>�� <input type="radio" name="gender">
						�� <input type="radio" name="gender"></td>
					</tr>
				</table>
				<li><input type="submit" value="Join" class="button fit"></li>

			</form>
</body>
</html>