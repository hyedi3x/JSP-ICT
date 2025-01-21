<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>    
<!DOCTYPE html>
<html>
<head>

<title>메인 홈페이지</title>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/common/main.css">

</head>
<body>
	<div id="cgvWrap">
		<!-- header_SessionScope.jsp : banner page & header page -->
		<%@ include file="/common/header_SessionScope.jsp" %>
	
		<!-- main page -->
		<div id="main"> <h3>mainpage</h3></div>
		
		<!-- footer page -->
		<%@ include file="/common/footer.jsp" %>		
	</div>
</body>
</html>