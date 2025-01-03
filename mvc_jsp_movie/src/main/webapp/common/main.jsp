<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 반응형 웹 선언 (viewport: 기기, content: 기기의 너비를 부여 받음 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인 홈페이지</title>

<!-- [css] -->
<!-- el, jstl로 선언한 링크를 setting.jsp 변수에 담고 링크를 수정할 수 있어서, 
     include file로 선언한 링크 빼고, 모든 링크를 프로젝트명부터 시작한다. -->
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/common.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/cgvAd.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/header.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/footer.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/main.css">

<!-- [js] -->
<!-- fontawesome key -->
<script src="https://kit.fontawesome.com/cec98146e1.js" crossorigin="anonymous"></script>

</head>
<body>
	<div id="cgvWrap">
		<!-- ad banner page -->
		<%@ include file="/common/cgvAd.jsp" %>
		
		<!-- header page -->
		<%@ include file="/common/header.jsp" %>
	
		<!-- main page -->
		<div id="main"> <h3>mainpage</h3></div>
		
		<!-- footer page -->
		<%@ include file="/common/footer.jsp" %>		
	</div>
</body>
</html>