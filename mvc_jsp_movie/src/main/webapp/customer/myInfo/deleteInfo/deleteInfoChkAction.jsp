<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원정보 인증 페이지</title>

</head>
<body>
	<c:choose>
		<c:when test="${selectCnt == 1}">
			<script type="text/javascript">
			    alert("${sessionScope.sessionID}님 회원정보 인증 성공하였습니다.");
				window.location="${path}/deleteInfo.do";
			</script>
		</c:when>
		
		<c:otherwise>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다!");
				window.location="${path}/deleteInfoChk.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>