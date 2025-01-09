<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 반응형 웹 선언 (viewport: 기기, content: 기기의 너비를 부여 받음 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입 페이지</title>

<!-- [css] -->
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/common.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/cgvAd.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/header.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/common/footer.css">
<link rel="stylesheet" href="/mvc_jsp_movie/resources/css/customer/join/join.css">

<!-- [js] -->
<!-- fontawesome key -->
<script src="https://kit.fontawesome.com/cec98146e1.js" crossorigin="anonymous"></script>

<!-- 다음 API 우편주소 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/mvc_jsp_movie/resources/js/customer/join/daumAdressAPI.js" defer></script> 

<!-- join.js -->
<script src="/mvc_jsp_movie/resources/js/customer/join/join.js" defer></script> 

</head>
<body>
	<div id="joinWrap">
	<!-- ad banner page -->
	<%@ include file="/common/cgvAd.jsp" %>
	
	<!-- header page -->
	<%@ include file="/common/header.jsp" %>
	
	<!-- join page -->
	<div id="joinContainer">
		<div id="joinTitle">
			<h2>회원가입</h2>
		</div>
		
		<div class="section">
			<!-- href 링크 연결은 /mvc_jsp_movie/~.do이고, action 연결은 .do만 작성 -->		
			<form name="joinform" action="/mvc_jsp_movie/joinAction.do" method="post" onsubmit="return signInChk()">
				<!--  [1-1] signInChk(): 중복 확인 버튼 클릭 여부 체크 (0: 클릭 안함, 1: 클릭함) -->
				<input type="hidden" name="hiddenUserId" value="0">
				
				<!-- 필수 입력 폼 -->
				<div class="sectionForm">
					<div class="infoText">
						<span class="titleText">기본 정보</span>
						<span class="requiredText"> * 필수 사항</span>
					</div>
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
					
					<div class="infoInput">
						<div class="inputText">
							<span> 비밀번호 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<input type="password" class="input1" name="user_pwd" size="20" placeholder="공백없이 20자 이내로" required>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 비밀번호(확인) </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">						
							<input type="password" class="input1" name="re_pwd" size="20" placeholder="공백없이 20자 이내로" required>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 이름 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">		
							<input type="text" class="input2" name="user_name" size="50" required>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 생년월일 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<input type="date" class="input2" name="user_birth" required>
						</div>
						
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 핸드폰 번호 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<input type="text" class="input3" name="user_hp1" size="3" value="010" required>
							-
							<input type="text" class="input3" name="user_hp2" size="4" required>
							-
							<input type="text" class="input3" name="user_hp3" size="4" required>
						</div>
					</div>	
					
					<div class="infoInput">
						<div class="inputText">
							<span> 주소 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType2">
							<div id="areaNumber">
								<input type="text" class="input1"  id="sample6_postcode" name="user_address1" size="10" placeholder="우편번호" style="width: 100px; padding: 8px;" required>
								<!-- onclick : 객체를 클릭했을 때 발생하는 이벤트(지정한 함수로 이동) -->
								<input type="button" name="addressChk" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
							</div>
							<input type="text" class="input1" id="sample6_address" name="user_address2" size="50" placeholder="주소" required>
							<div id="detailExtra">
								<input type="text" class="input5" id="sample6_detailAddress" name="user_address3" size="50" placeholder="상세주소" required>
								<input type="text" class="input5" id="sample6_extraAddress" name="user_address4" size="50" placeholder="참고항목">
							</div>
						</div>
					</div>			
				</div>
				
				<!-- 선택사항 입력 폼 -->
				<div class="sectionForm">
					<div class="infoText">
						<span class="titleText">부가 정보</span>
						<span class="chooseText"> 선택사항</span>
					</div>
					
					<div class="infoInput">
						<span class="inputText">이메일</span>
						<div class="inputType">
							<input type="text" class="input4" name="user_email1">
							@
							<input type="text" class="input3" name="user_email2">
							<!-- onchange: 객체의 내용(이벤트)이 변경되었을 때 사용(주로 select문) -->
							<select name="user_email3" onchange="selectEmailChk()" style="width: 106px;">
								<option value=""> 직접입력 </option>
								<option value="google.com"> 구글 </option>
								<option value="naver.com"> 네이버 </option>
								<option value="kakao.com"> 카카오 </option>
								<option value="nate.com"> 네이트 </option>
							</select>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 전화번호 </span>
						</div>
						<div class="inputType">
							<!-- onchange: 객체의 내용(이벤트)이 변경되었을 때 사용(주로 select문) -->
							<select name="user_tel1" onchange="selectTel1Chk()">
								<!-- 총 16개의 지역 전화번호 -->
								<option value=""> 지역번호 선택 </option>
								<option value="02"> 02(서울) </option>
								<option value="031"> 031(경기) </option>
								<option value="032"> 032(인천) </option>
								<option value="033"> 033(강원) </option>
								<option value="041"> 041(충남) </option>
								<option value="042"> 042(대전) </option>
								<option value="043"> 043(충북) </option>
								<option value="051"> 051(부산) </option>
								<option value="052"> 052(울산) </option>
								<option value="053"> 053(대구) </option>
								<option value="054"> 054(경북) </option>
								<option value="055"> 055(경남) </option>
								<option value="061"> 061(전남) </option>
								<option value="062"> 062(광주) </option>
								<option value="063"> 063(전북) </option>
								<option value="064"> 064(제주) </option>
							</select>
							-
							<input type="text" class="input3" name="user_tel2" size="4" >
							-
							<input type="text" class="input3" name="user_tel3" size="4" >
						</div>
					</div>	
				</div>

				<!-- 제출 폼 -->
				<div id="inputSubmit">
					<input class="inputButton2" type="submit" value="회원가입">
				</div>
			</form>
		</div>
	</div>
	<!-- footer page -->
	<%@ include file="/common/footer.jsp" %>	
	</div>
</body>
</html>