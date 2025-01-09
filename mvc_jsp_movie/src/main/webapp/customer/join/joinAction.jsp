<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 페이지</title>
</head>
<body>
<% 
	int insertCnt = (Integer)request.getAttribute("insertCnt");
	
	if(insertCnt == 1){
%>
	<script type="text/javascript">
		alert("회원 가입 성공");
		window.location="/mvc_jsp_movie/login.do"
	</script>
<%
	}

	else{
%>
				
	<script type="text/javascript">
		alert("회원 가입 실패");
		window.location="/mvc_jsp_movie/join.do"
	</script>
<%
	}

%>
		
</body>
</html>