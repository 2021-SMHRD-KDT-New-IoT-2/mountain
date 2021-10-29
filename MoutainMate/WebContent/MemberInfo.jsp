
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산으로 오세영 회원정보</title>

<link rel="stylesheet" href="assets/css/join.css">

</head>
<body>

	<section>
		<div id="top_header">
			<header id="header" class="">
				<a id="san_logo" href="MainPage.jsp"></a>

				<nav>
					<ul>

						<li><a href="#menu">로그아웃</a></li>
						
						<li><a href="#page2">게시판</a></li>
						<li><a href="#page3">등산로</a></li>
						<li><a href="#page4">둘러보기</a></li>
					<li><a class="btn trigger" href="#menu">≡</a></li>
					</ul>
				</nav>
			</header>
		</div>
		
		
		<div id="joindiv">
			<form id="joinform" action="joinService" method="post">

				<table id="jointable">
					<caption>마이페이지</caption>
					
					<tr>
						<td class="jointd1">* 비밀번호</td>
						<td class="jointd2"><input type="password" name="pw" required="required"
							placeholder="PW를 입력하세요"></td>
					</tr>
						<tr>
						<td colspan="2" align="center">
							<input type="submit" value="비밀번호확인">
						</td>						
					<tr>
						<td colspan="2" align="center"><strong>정보 수정</strong></td>
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
							<input type="submit" value="수정완료">
						</td>
					</tr>
				</table>

			</form>


		</div>
		
		
		<!-- 메인 -->
		<main>

		</main>


		<!-- 밑부분 -->
		<footer> </footer>
	</section>
	
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
	}</script>
		
		
</body>
</html>