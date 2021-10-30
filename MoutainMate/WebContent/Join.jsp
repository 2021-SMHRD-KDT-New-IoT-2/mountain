
<%@page import="model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>산으로 오세영 회원가입</title>

<link rel="stylesheet" href="assets/css/join.css">

</head>
<body>

	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="MainPage.jsp">로그인</a></li>
						<li><a href="MainPage.jsp">게시판</a></li>
						<li><a href="MainPage.jsp">등산로</a></li>
						<li><a href="MainPage.jsp">둘러보기</a></li>

					</ul>
				</nav>
			</header>
		</div>


		<div id="joindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>회원가입</caption>
					<tr>
						<td class="jointd1">* 아이디</td>
						<td class="jointd2">
						<input type="text"  id="input_id" name="id" required="required" placeholder="ID를 입력하세요">
							<input type="button" value="ID중복체크" onclick="idCheck()">
							
					</tr>
					<tr>
						<td colspan="2" align="center" color="red">
							<span id="sp_result"></span>
						</td>
					</tr>
					<tr>
						<td class="jointd1">* 비밀번호</td>
						<td class="jointd2"><input type="password" id="input_pw"name="pw" required="required"
							placeholder="PW를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 이름</td>
						<td class="jointd2"><input type="text" id="input_name" name="name" required="required"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 전화번호</td>
						<td class="jointd2"><input type="tel" id="input_tel" name="phoneNumber" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000"></td>
					</tr>
					<tr>
						<td class="jointd1">* 생일</td>
						<td class="jointd2"><input type="date" id="input_birth" name="birth"></td>
					</tr>
					<tr>
						<td class="jointd1">* 성별</td>
						<td class="jointd2" >
						남 <input type="radio" name="gender" id="input_gender0" value="0">
						여 <input type="radio" name="gender" id="input_gender1"  value="1">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="Join" onClick="join()">
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
				var input = $("#input_id").val();
				$.ajax({
					type: "post", // 데이터 전송 받식
					data: {"id" : input}, // 전송하는 데이터
					url : "IdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
					dataType : "text", //응답데이터의 형식
					success : function(data){
						if(data=="true"){
							$("#sp_result").html("이미 사용중인 id입니다.");
						}else{
							$("#sp_result").html("사용가능한 id 입니다.");
						}
					},
					error : function(){
						alert("통신실패");
		           	}
				});
			}
			
			
			function joinCheck(){
				var input_id = $("#input_id").val();
				var input_pw = $("#input_pw").val();
				var input_name = $("#input_name").val();
				var input_tel = $("#input_tel").val();
				var input_birth = $("#input_birth").val();
				var input_gender = $(":input:radio[name='gender']:checked").val();
			
					
				if((input_id!="")&&(input_pw!="")&&(input_name!="")&&(input_tel!="")&&(input_birth!="")&&(input_gender!="")){
					alert("빈칸없음");
					alert("if문 안에 들어옴");
					$.ajax({
						type: "post", // 데이터 전송 받식
						data: { // 전송하는 데이터
							"id" : input_id,
							"pw":input_pw,
							"name":input_name,
							"phoneNumber":input_tel,
							"birth":input_birth,
							"gender":input_gender
							},
						url : "joinService", //데이터를 전송하는 (요청하는) 서버페이지 url
						dataType : "text", //응답데이터의 형식
						success : function(data){
							alert("joincheck완료");
							window.location.assign("joinsuccess.jsp");
						},
						error : function(){
							alert("통신실패");
			           	}
					});
				}else{
					alert("필수 입력란을 모두 입력해 주세요.");
				}
				
			}
			
			function radioCheck(){
				var rcheck = $(":input:radio[name='gender']").length;
				var checkval = $(":input:radio[name='gender']:checked").val();
			}
			
			function join(){
				var input = $("#input_id").val();
				$.ajax({
					type: "post", // 데이터 전송 받식
					data: {"id" : input}, // 전송하는 데이터
					url : "IdCheck", //데이터를 전송하는 (요청하는) 서버페이지 url
					dataType : "text", //응답데이터의 형식
					success : function(data){
						if(data=="true"){
							alert("중복된 아이디가 존재합니다.");
							$("#sp_result").html("이미 사용중인 id입니다.");
						}else{
							joinCheck();
						}
					},
					error : function(){
						alert("통신실패");
		           	}
				});
			}
			</script>
</body>
</html>