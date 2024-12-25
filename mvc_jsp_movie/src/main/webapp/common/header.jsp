<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV-header</title>

</head>
<body>
	<div id="header">
		<div id="headerContents">
			<a href="#"><img src="/mvc_jsp_movie/resources/imgs/common/header/CGV.jpg" alt="CGV-logo"></a>
			<ul>
				<li><a href="/mvc_jsp_movie/login.do"><i class="fa-solid fa-user"></i>로그인</a></li>
				<li><a href="/mvc_jsp_movie/join.do"><i class="fa-solid fa-user-plus"></i>회원가입</a></li>
				<li><a href="/mvc_jsp_movie/csr.do"><i class="fa-solid fa-headset"></i>고객센터</a></li>
			</ul>			
		</div>
		<div id="nav">
			<div id="navContents">
				<a href="#">영화</a>
				<a href="/mvc_jsp_movie/theater.do">극장</a>
				<a href="#">예매</a>
				<a href="#">스토어</a>
				<a href="#">이벤트</a>
				<a href="#">혜택</a>
			</div>	
			<div id="navSearch">
				<input type="text" placeholder="짱구 극장판"> 
				<input type="submit" value="검색">
			</div>
		</div>
	</div>

</body>
</html>