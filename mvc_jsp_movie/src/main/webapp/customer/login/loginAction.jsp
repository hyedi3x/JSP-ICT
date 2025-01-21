<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>로그인 처리 페이지</title>

</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login_session eq 'Admin'}">
			<script type="text/javascript">
			    // alert("${sessionScope.sessionID}님 로그인 성공하였습니다.");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:when test="${sessionScope.login_session eq 'Customer'}">
			<script type="text/javascript">
				// alert("${sessionScope.sessionID}님 로그인 성공하였습니다.");
				window.location="${path}/main.do";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("아이디와 비밀번호가 일치하지 않습니다!");
				window.location="${path}/login.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>