<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<body>
	<div id="headerWrap">
		<!-- ad banner page -->
		<%@ include file="/common/cgvAd.jsp" %>
		
		<!-- session에 따른 header page -->
		<c:choose>
			<c:when test="${sessionScope.login_session eq 'Customer'}">
				<%@ include file="/customer/common/customer_header.jsp" %>
			</c:when>
			<c:when test="${sessionScope.login_session eq 'Admin'}">
				<%@ include file="/admin/common/admin_header.jsp" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/common/header.jsp" %>
			</c:otherwise>
		</c:choose>
	</div>
</body>
