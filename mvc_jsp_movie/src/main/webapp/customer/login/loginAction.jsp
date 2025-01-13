<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 선언 (viewport: 기기, content: 기기의 너비를 부여 받음 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 처리 페이지</title>

</head>
<body>
	<c:set var="userId" value="${sessionScope.sessionID}"/>
	<c:out value="${userId}"/>

	<c:if test="${userId == null}">
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다!");
			window.location="${path}/login.do";
		</script>
	</c:if>
	<c:if test="${userId != null}">
		<script type="text/javascript">
			alert(${userId}+"님 로그인 성공하였습니다.");
			location.href="${path}/loginMain.do";
		</script>
	</c:if>
</body>
</html>