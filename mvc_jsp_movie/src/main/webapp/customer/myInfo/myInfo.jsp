<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>나의 정보</title>

<link href="${path}/resources/css/customer/myInfo/myInfo.css" rel="stylesheet">
</head>
<body>
	<div id="myInfoWrap">
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/common/header_SessionScope.jsp" %>
	
	<!-- 나의 정보 페이지 -->
	<div class="myInfo_container">
		<div id="myInfoTitle">
			<h2> 나의 정보 </h2>
		</div>
		
		<div id="myInfoSection">	
			<div id="myInfo">
				<div id="myInfo_Box">
					<div id="myInfoIcon">
						<i class="fa-solid fa-circle-user"></i>
					</div>
					<!-- 컨트롤러에서 담은 request.setAttribute("info", info) 데이터 정보를 el 태그로 불러온다. -->
						<div id="personInfoAll">
							<div id="personInfo">
								<strong>${info.user_name}님</strong>
								<span id="userId">${info.user_id}</span>
								<div id="userRegDate">가입일 : ${info.user_regDate} </div>
							</div>
							<div id="personGrade">
							<strong>고객님의 현재 등급은 <span> ${info.user_grade} </span> 입니다.</strong>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>