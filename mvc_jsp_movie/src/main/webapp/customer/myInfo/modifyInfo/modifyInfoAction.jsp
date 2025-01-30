<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원정보 수정 페이지</title>

</head>
<body>
	<c:choose>
		<c:when test="${updateCnt == 1}">
			<script type="text/javascript">
			    alert("${sessionScope.sessionID}님 회원정보 수정을 완료하였습니다.");
				window.location="${path}/myInfoTicket.do";
			</script>
		</c:when>
		
		<c:otherwise>
			<script type="text/javascript">
				alert("${sessionScope.sessionID}님 회원정보 수정을 실패하였습니다!");
				window.location="${path}/modifyInfo.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>