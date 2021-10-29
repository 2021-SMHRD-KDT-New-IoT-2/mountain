
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
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

						<li><a href="MainPage.jsp">로그인</a> <!--<a href="Login.jsp">로그인</a>  -->
						</li>
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
						<td class="jointd2"><input type="text"  id="input_id" name="id" required="required"
							placeholder="ID를 입력하세요">
							<input type="button" value="ID중복체크" onclick="idCheck()">
							<span id="sp_result"></span>
					</tr>
					<tr>
						<td class="jointd1">* 비밀번호</td>
						<td class="jointd2"><input type="password" name="pw" required="required"
							placeholder="PW를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 이름</td>
						<td class="jointd2"><input type="text" name="name" required="required"
							placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">* 전화번호</td>
						<td class="jointd2"><input type="tel" name="phoneNumber" required="required"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화 번호를 입력하세요"></td>
					</tr>
					<tr>
						<td class="jointd1">생일</td>
						<td class="jointd2"><input type="date" name="birth"></td>
					</tr>
					<tr>
						<td class="jointd1">성별</td>
						<td class="jointd2">
						남 <input type="radio" name="gender" value="0">
						여 <input type="radio" name="gender" value="1">
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
				//요소의 실제 값을 가지고 오는 방법
				//1. innerText : 태그 사이에 텍스트를 가지오 오는 방법<p> 스마트그리드</p> ->스마트 그리드
				//2. innerHTML : 태그 사이에 모든 요소를 가지고 오는 방법 <p><span>SP</span></p> -> <span>SP</span>
				//3. value : input 태그의 value 속성값 가지고 올때 
				var input =document.getElementById("input_id");
				/* alert(input.value); //-> vanilla js 사용
				
				alert($('#input_id').val()); //jqery 사용 */
				
				//ajax 
				$.ajax({
					type: "post", // 데이터 전송 받식
					data: {"id" : input.value}, // 전송하는 데이터
					url : "idCheckService", //데이터를 전송하는 (요청하는) 서버페이지 url
					dataType : "text", //응답데이터의 형식
					success : function(data){ //통신성공
						var sp_result=document.getElementById("sp_result");
						//alert(data)
						if(data=="true"){
							sp_result.innerText="사용불가능한 아이디";
							
						}else{
							$("#sp_result").text("사용 가능한 아이디");
						}
					},
					error: function(){
						alert("통신실패!")
					}
				});
			}
			</script>
</body>
</html>