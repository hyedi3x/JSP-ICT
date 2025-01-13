<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 반응형 웹 선언 (viewport: 기기, content: 기기의 너비를 부여 받음 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인 홈페이지</title>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/common/main.css">

</head>
<body>
	<div id="cgvWrap">
		<!-- ad banner page -->
		<%@ include file="/common/cgvAd.jsp" %>
		
		<!-- header page -->
		<%@ include file="login_header.jsp" %>

		<!-- main page -->
		<div id="main"> <h3>mainpage</h3></div>
		
		<!-- footer page -->
		<%@ include file="/common/footer.jsp" %>		
	</div>
</body>
</html>