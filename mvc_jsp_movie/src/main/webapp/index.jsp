<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- index.jsp가 다이나믹 프로젝트 생성때 만들어진 web.xml파일의 welcome 파일이기 때문에, index.jsp의 윈도우 함수가 자동 실행 -->
<title>index 페이지</title>

<script type="text/javascript">
	// 0.5초 후에 main.do로 이동(컨트롤러로 이동)
	// 서블릿 컨트롤러에서 실행하면 *.do로 실행되기 때문에, 시작 경로를 main.do로 표현하기 위해서
	setTimeout(function() {
		window.location="${path}/main.do"
	}, 500);
</script>
	
</head>
<body>
</body>
</html>