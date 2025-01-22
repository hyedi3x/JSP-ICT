<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원 탈퇴 페이지(약관 동의 철회)</title>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/customer/myInfo/deleteInfo/deleteInfo.css">

<!-- [js] -->
<script src="${path}/resources/js/customer/myInfo/deleteInfo/deleteInfo.js" defer></script> 

</head>
<body>
	<div id="deleteInfoWrap">
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/common/header_SessionScope.jsp" %>
	
	<!-- delete page -->
	<div id="deleteContainer">
		<div id="deleteTitle">
			<h2>약관 동의 철회 및 탈퇴</h2>
		</div>
		
		<div class="section">
			<!-- 철회 버튼 클릭시, ${path}/deleteAction.do로 이동-->
			<form name="deleteInfoform" action="${path}/deleteInfoAction.do" method="post">
				<div id="deleteGuide">
					<div class="font24"><p>약관동의 철회 전 꼭 읽어주세요!</p></div>
					<div class="font15">
						<p>CGV 웹사이트 약관 동의를 철회 하시면 CGV 웹사이트 약관 동의 및 개인정보 제공, 활용 동의가 철회됩니다.</p>
						<p>CGV 웹사이트의 이용이 제한되며, 웹사이트 약관 동의를 철회하지 않은 타 CJ ONE 제휴 브랜드는 계속 이용 가능합니다.</p>
						<input type="button" value="CJ ONE 서비스 이용약관 전문 >" onclick="deleteGuide('${path}')">	
					</div>
				</div>
				
				<div id="delPlusGuide">
					<div class="font24"><p>CJ ONE과 함께하는 브랜드</p></div>
					<div class="font15">
						<img src="${path}/resources/imgs/customer/myInfo/deleteInfo/cj_brand.png" alt="CGV 브랜드">				
					</div>
				</div>
				
				<div id="delButton">
					<input type="button" value="취소" onclick="window.location='${path}/main.do'">
					<input type="submit" value="탈퇴">	
				</div>
			</form>
		</div>
	</div>
	<!-- footer page -->
	<%@ include file="/common/footer.jsp" %>	
	</div>
</body>
</html>