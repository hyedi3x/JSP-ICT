<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 페이지</title>
</head>
<body>
	<c:choose>
		<c:when test="${insertCnt==1}">
			<script type="text/javascript">
				alert("회원 가입 성공");
				
				// location.href 보다는 window.location을 권장한다. 
				// location을 쓰면 스코프 범위에 따라서 잘못된 지역 변수를 참조할 수 있다.
				// 현재 창의 URL만 변경하여 페이지를 이동(새로고침 개념) → window.open() : 새로운 브라우저 창이나 탭을 열 때 사용.
				window.location="${path}/login.do"  
			</script>
		</c:when>
		<c:otherwise>	
			<script type="text/javascript">
				alert("회원 가입 실패");
				window.location="${path}/join.do"
			</script>
		</c:otherwise>
	</c:choose>
		
</body>
</html>