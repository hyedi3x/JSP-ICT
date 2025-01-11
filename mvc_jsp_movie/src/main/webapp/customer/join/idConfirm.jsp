<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/customer/join/idConfirm.css">

<!-- join.js -->
<script src="${path}/resources/js/customer/join/join.js" defer></script> 

</head>
<body>
	<!-- join page -->
	<div id="idConfirmContainer">
		<div id="idConfirmTitle">
			<h3>아이디 중복 체크</h3>
		</div>

		<div class="section">
			<!-- submit의 위치가 아이디가 중복되었을 때이므로, submit 클릭 시 → 다시 idConfirm.do로 이동한다.  -->		
			<form name="confirmForm" action="${path}/idConfirm.do" method="post">
				<!-- 중복확인 폼 -->
				<div class="confirmForm">
					<c:choose>
					<%-- 아이디가 중복일 때 --%>
						<c:when test="${selectCnt == 1}">
							<div class="infoInput">
								<div id="comfirmId"> 사용 불가한 아이디(${strId})입니다. </div>
							</div>
							<div class="infoInput">
								<div class="inputText">
									<span> 아이디 </span><span class="requiredAll">*</span>
								</div>
								<div class="inputType">
									<input type="text" class="input1" name="user_id" placeholder="공백없이 20자 이내로" required autofocus>
									<input type="submit" value="중복확인" >
								</div>
							</div>
						</c:when>
					
						<c:otherwise>
							<div class="infoInput">
								<div id="comfirmId"> 사용 가능한 아이디(${strId}) 입니다. </div>
							</div>
							<div class="infoInput">
								<div class="inputType2">
									<!-- onclick : 객체를 클릭했을 때 발생하는 이벤트(지정한 함수로 이동) -->
									<input type="button" value="확인" onclick="setUserId('${strId}')">
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>	
</body>
</html>