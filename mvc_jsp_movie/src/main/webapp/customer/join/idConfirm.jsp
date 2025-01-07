<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<!-- [css] -->
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/common.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/customer/join/idConfirm.css">

</head>
<body>
	<!-- join page -->
	<div id="idConfirmContainer">
		<div id="idConfirmTitle">
			<h3>아이디 중복 체크</h3>
		</div>
		
		<div class="section">
			<!-- href 링크 연결은 /mvc_jsp_movie/~.do이고, action 연결은 .do만 작성 -->		
			<form name="confirmForm" action="/mvc_jsp_movie/joinAction.do" method="post" onsubmit="return signInChk()">
				<!--  [1-1] signInChk(): 중복 확인 버튼 클릭 여부 체크 (0: 클릭 안함, 1: 클릭함) -->
				<input type="hidden" name="hiddenUserId" value="0">
				<!-- 필수 입력 폼 -->
				<div class="sectionForm">
					<div class="infoInput">
						<div class="inputText">
							<span> 아이디 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<input type="text" class="input1" name="user_id" placeholder="공백없이 20자 이내로" required autofocus>
								<!-- [2-1] onclick : 객체를 클릭했을 때 발생하는 이벤트(지정한 함수로 이동) -->
							<input type="button" name="dubChk" value="중복확인" onclick="confirmId()">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>	
</body>
</html>