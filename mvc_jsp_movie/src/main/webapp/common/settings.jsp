<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- jstl 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- contextPath : 플젝명 "mvc_jsp_movie"을 var="path 변수에 설정 --%>
<%-- mvc_jsp_movie --%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/common/common.css">
<link rel="stylesheet" href="${path}/resources/css/common/cgvAd.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">

<!-- js : 네트워크 전송방식(CDN 방식)으로 연동 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- fontawesome key js -->
<script src="https://kit.fontawesome.com/cec98146e1.js" crossorigin="anonymous"></script>