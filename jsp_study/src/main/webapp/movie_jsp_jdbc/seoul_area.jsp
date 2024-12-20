<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 페이지 파라미터 체크</title>

<link href="./css/seoul.css" rel="stylesheet">
</head>
<body>
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		// 이전 페이지로부터 값을 받아와서 변수에 담는다. 
		String seoulArea = request.getParameter("cinema_area");
	%>	
	<jsp:include page="seoulImpI.jsp" flush="false">
		<jsp:param name="cinema_area" value="<%= seoulArea %>"/>
	</jsp:include>
</body>
</html>