<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>관람권/할인쿠폰 관리 정보</title>

<link href="${path}/resources/css/customer/myInfo/myInfoTicket.css" rel="stylesheet">
<link href="${path}/resources/css/customer/myInfo/myInfo.css" rel="stylesheet">
<link href="${path}/resources/css/customer/myInfo/myInfo_left.css" rel="stylesheet">

</head>
<body>
	<div id="myInfoTicketWrap">
	<%@ include file="/customer/myInfo/myInfo.jsp" %>
	
	<!-- 세부 정보 페이지 -->
	<div id="myInfoDetail">
		<div id="myInfo_left">
			<%@ include file="/customer/myInfo/myInfo_left.jsp" %>
		</div>
		<div id="myInfo_right">
			 관람권/할인쿠폰 관리
		</div>
	</div>		
	
	<!-- footer page -->
	<%@ include file="/common/footer.jsp" %>	
	</div>	
</body>
</html>