<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>CGV-header</title>

</head>
<body>
	<div id="header">
		<div id="headerContents">
			<a href="${path}/main.do"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV"></a>
			<ul>
				<li><a href="${path}/logout.do"><i class="fa-regular fa-circle-left"></i>로그아웃</a></li>
				<li><a href="${path}/myPage.do"><i class="fa-regular fa-user"></i>마이페이지</a></li>
				<li><a href="${path}/csr.do"><i class="fa-solid fa-phone-volume"></i>고객센터</a></li>
			</ul>			
		</div>
		<div id="nav">
			<div id="navContents">
				<a href="#">영화</a>
				<a href="${path}/theater.do">극장</a>
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