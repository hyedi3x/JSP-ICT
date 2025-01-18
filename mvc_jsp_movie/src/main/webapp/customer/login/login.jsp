<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>로그인</title>

<link href="${path}/resources/css/customer/login/login.css" rel="stylesheet">
</head>
<body>
	<div id="loginWrap">
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/common/header_SessionScope.jsp" %>
	
	<!-- 로그인 페이지 -->
	<div class="login_container">
		<div id="loginTitle">
			<h2> 로그인 페이지 </h2>
		</div>
		
		<div id="loginSection">	
			<div id="loginArticle">
				<form action="${path}/loginAction.do" method="post">
					<div id="loginInput">
						<p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
						<input type="text" name="user_id" placeholder="id">
						<input type="password" name="user_pwd" placeholder="password">	
						<input type="submit" value="로그인">	
						<input type="checkbox" value="saveId"> 아이디 저장
					</div>
				</form>
				<div id="login_ad">
					<a href="#"><img src="${path}/resources/imgs/login/joker_poster.jpg" alt="joker_poster"></a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer page -->
	<%@ include file="/common/footer.jsp" %>	
	</div>
</body>
</html>