## COMMON 폴더 구성 
<img src="./imgs-README/img1.png" alt="common 폴더 로직" style="width:120px"> <br/>
> ☑️ cgvAd.jsp(최신 상영 영화 광고 배너) <br/>
> ☑️ header.jsp(최상단 내비게이션 바를 담은 헤더 페이지) <br/>
> ✖️ main.jsp(영화관 메인페이지) <br/>
> ☑️ footer.jsp(최하단 회사 소개 및 정보 페이지) <br/>
> ☑️ settings.jsp(공통 리소스들을 모아둔 파일) <br/>

<br/>

### ⚙️ settings.jsp
> - `공통 리소스들을 모아둔 파일`
> - **[JSTL 문법]** 을 사용해, **'contextPath(프로젝트명 추출 메서드)'을 변수화**한다.
```jsp
<head>
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
```
<br/>

### 🎬 cgvAd.jsp
최신 상영 영화 광고 배너 페이지<br/><br/>
<img src="./imgs-README/img2.png" alt="영화 배너" style="width:600px"><br/>
> ✖️ `[#cgv-ad-wrap]` : 상영 영화 예매 페이지로 이동  <br/>

<br/>

### 👻 header.jsp 
최상단 내비게이션 바를 담은 헤더 페이지 <br/><br/>
<img src="./imgs-README/img3.png" alt="header" style="width:600px"><br/>
> ☑️ `[#headerContents]` : 로그인(login.do), 회원가입(join.do), 고객센터(csr.do) <br/>
> ✖️ `[#navContents]` : 영화(미완성), 극장(상영관, theater.do), 예매(미완성), 스토어(미완성), 이벤트(미완성), 혜택(미완성) <br/>
>  ✖️ `[#navSearch]` : 검색창 <br/>

<br/>

### 🍿  main.jsp 
영화관 메인페이지(홈페이지, 미완성) <br/><br/>
<img src="./imgs-README/img4.png" alt="main" style="width:600px"><br/>
```jsp
<head>
<!-- [css] -->
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/main.css">
</head>
<body>
	<div id="cgvWrap">
		<!-- ad banner page -->
		<%@ include file="/common/cgvAd.jsp" %>
		
		<!-- header page -->
		<%@ include file="/common/header.jsp" %>
	
		<!-- main page -->
		<div id="main"> <h3>mainpage</h3></div>
		
		<!-- footer page -->
		<%@ include file="/common/footer.jsp" %>		
	</div>
</body>
```
<br/>

### 🏢 footer.jsp 
최하단 회사 소개 및 정보 페이지<br/><br/>
<img src="./imgs-README/img5.png" alt="footer" style="width:600px"><br/>
> ✖️ `[#footerContents]` : 회사소개, 지속가능경영, IR .... <br/>
> ☑️ `[#companyInfo]` : 회사 위치, 회사대표 정보, 저작권 표시  <br/>

<br/>