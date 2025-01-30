<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원탈퇴 처리 페이지</title>

</head>
<body>
	<c:choose>
		<c:when test="${deleteCnt == 1}">
			<script type="text/javascript">
			    alert("회원 탈퇴 성공하였습니다.");
				window.location="${path}/main.do";
			</script>
		</c:when>
		
		<c:otherwise>
			<script type="text/javascript">
				alert("${sessionScope.sessionID}님 회원 탈퇴 실패하였습니다!");
				window.location="${path}/deleteInfo.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>