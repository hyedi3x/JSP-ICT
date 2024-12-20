<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="./css/login.css" rel="stylesheet">
</head>
<body>
	<%-- include file은 getParameter값을 가지고 오는게 아니라 바로 파일을 복사해 붙인거랑 같다. --%>
	<%-- <jsp:include>나 <jsp:foward>만 getParameter값을 가지고 와서 데이터가 get, set으로 이동하는거랑 같다 --%>
	<%@ include file="header.jsp" %>
	
	<!-- 로그인 페이지 -->
	<div class="login_container">
		<div class="loginSection">
			<h3> 로그인 페이지 </h3>
			<div class="loginArticle">
				<form action="memberDAOImpI.jsp" method="post">
					<div class="loginInput">
						<p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.<p>
						<input type="text" name="u_id" placeholder="id">
						<input type="password" name="u_password" placeholder="password">	
						<input type="submit" value="로그인">	
						<input type="checkbox" value="saveId">아이디 저장
					</div>
				</form>
				<div class="login_ad">
					<a href="#"><img src="./imgs/wicked_poster.jpg" alt="wicked poster"></a>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>