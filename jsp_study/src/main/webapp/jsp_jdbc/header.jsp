<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<link href="./css/header.css" rel="stylesheet">
</head>
<body>
	<div class="header">
		<div class="headerContents">
			<a href="#"><img src="./imgs/CGV.jpg" alt="CGV"></a>
			<ul>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="#">회원가입</a></li>
				<li><a href="#">MY CGV</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>			
		</div>
		<div class="nav">
			<div class="navContents">
				<a href="#">영화</a>
				<a href="cinema.jsp">극장</a>
				<a href="#">예매</a>
				<a href="#">스토어</a>
				<a href="#">이벤트</a>
				<a href="#">혜택</a>
			</div>	
			<div class="navSearch">
				<input type="text" placeholder="짱구 극장판"> <input type="submit" value="검색">
			</div>
		</div>
	</div>

</body>
</html>