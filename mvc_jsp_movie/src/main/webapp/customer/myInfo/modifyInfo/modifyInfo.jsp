<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="/common/settings.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>회원정보 수정 페이지</title>

<!-- [css] -->
<link rel="stylesheet" href="${path}/resources/css/customer/myInfo/modifyInfo/modifyInfo.css">

<!-- [js] -->
<!-- 다음 API 우편주소 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/customer/join/daumAdressAPI.js" defer></script> 

<!-- modifyInfo.js -->
<script src="${path}/resources/js/customer/myInfo/modifyInfo/modifyInfo.js" defer></script> 

</head>
<body>
	<div id="modifyWrap">
	<!-- header_SessionScope.jsp : banner page & header page -->
	<%@ include file="/common/header_SessionScope.jsp" %>
	
	<!-- modify page -->
	<div id="modifyContainer">
		<div id="modifyTitle">
			<h2>회원정보 수정 페이지</h2>
		</div>
		
		<div class="section">
			<!-- 수정 버튼 클릭시 ${path}/modifyInfoAction.do로 이동-->
			<form name="modifyInfoform" action="${path}/modifyInfoAction.do" method="post" onsubmit="return signInChk()">
				
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
							<input type="text" class="input1" name="user_id" placeholder="공백없이 20자 이내로" value="${info.getUser_id()}" readonly autofocus>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 비밀번호 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<input type="password" class="input1" name="user_pwd" size="20" placeholder="공백없이 20자 이내로" value="${info.getUser_pwd()}" required autofocus>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 비밀번호(확인) </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">						
							<input type="password" class="input1" name="re_pwd" size="20" placeholder="공백없이 20자 이내로" value="${info.getUser_pwd()}" required>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 이름 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">		
							<input type="text" class="input2" name="user_name" size="50" value="${info.getUser_name()}" required>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 생년월일 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<input type="date" class="input2" name="user_birth" value="${info.getUser_birth()}" required>
						</div>
						
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 핸드폰 번호 </span><span class="requiredAll">*</span>
						</div>
						<div class="inputType">
							<c:set var="hpArr" value="${fn:split(info.getUser_phone(),'-')}"/>
							<input type="text" class="input3" name="user_hp1" value="${hpArr[0]}" size="3" value="010" required>
							-
							<input type="text" class="input3" name="user_hp2" value="${hpArr[1]}" size="4" required>
							-
							<input type="text" class="input3" name="user_hp3" value="${hpArr[2]}" size="4" required>
						</div>
					</div>	
					
					<div class="infoInput">
						<div class="inputText">
							<span> 주소 </span><span class="requiredAll">*</span>
						</div>
						<c:set var="addArr" value="${fn:split(info.getUser_address(), ',')}"/>
						<div class="inputType2">
							<div id="areaNumber">
								<input type="text" class="input1"  id="sample6_postcode" value="${addArr[0]}" name="user_address1" size="10" placeholder="우편번호" style="width: 100px; padding: 8px;" required>
								<!-- onclick : 객체를 클릭했을 때 발생하는 이벤트(지정한 함수로 이동) -->
								<input type="button" name="addressChk" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
							</div>
							<input type="text" class="input1" id="sample6_address" name="user_address2" value="${addArr[1]}" size="50" placeholder="주소" required>
							<div id="detailExtra">
								<input type="text" class="input5" id="sample6_detailAddress" name="user_address3" value="${addArr[2]}" size="50" placeholder="상세주소" required>
								<input type="text" class="input5" id="sample6_extraAddress" name="user_address4" value="${addArr[3]}" size="50" placeholder="참고항목">
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
							<c:choose>
								<c:when test="${info.getUser_email() == null}">
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
								</c:when>
								<c:otherwise>
									<c:set var="emailArr" value="${fn:split(info.getUser_email(),'@')}"/>
									<input type="text" class="input4" name="user_email1" value="${emailArr[0]}" >
									@
									<input type="text" class="input3" name="user_email2" value="${emailArr[1]}">
									<!-- onchange: 객체의 내용(이벤트)이 변경되었을 때 사용(주로 select문) -->
									<select name="user_email3" onchange="selectEmailChk()" style="width: 106px;">
										<option value=""> 직접입력 </option>
										<option <c:if test="${emailArr[1] == 'gmail.com'}">selected</c:if> value="gmail.com"> 구글 </option>
										<option <c:if test="${emailArr[1] == 'naver.com'}">selected</c:if> value="naver.com"> 네이버 </option>
										<option <c:if test="${emailArr[1] == 'kakao.com'}">selected</c:if> value="kakao.com"> 카카오 </option>
										<option <c:if test="${emailArr[1] == 'nate.com'}">selected</c:if> value="nate.com"> 네이트 </option>
									</select>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<div class="infoInput">
						<div class="inputText">
							<span> 전화번호 </span>
						</div>
						<div class="inputType">
							<c:choose>
								<c:when test="${info.getUser_tel() == null}">
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
								</c:when>
								<c:otherwise>
									<!-- onchange: 객체의 내용(이벤트)이 변경되었을 때 사용(주로 select문) -->
									<c:set var="telArr" value="${fn:split(info.getUser_tel(),'-')}"/>
									<select name="user_tel1" onchange="selectTel1Chk()">
										<!-- 총 16개의 지역 전화번호 -->	
										<option value=""> 지역번호 선택 </option>
										<option <c:if test="${telArr[0] == '02'}">selected</c:if> value="02"> 02(서울) </option>
										<option <c:if test="${telArr[0] == '031'}">selected</c:if> value="031"> 031(경기) </option>
										<option <c:if test="${telArr[0] == '032'}">selected</c:if> value="032"> 032(인천) </option>
										<option <c:if test="${telArr[0] == '033'}">selected</c:if> value="033"> 033(강원) </option>
										<option <c:if test="${telArr[0] == '041'}">selected</c:if> value="041"> 041(충남) </option>
										<option <c:if test="${telArr[0] == '042'}">selected</c:if> value="042"> 042(대전) </option>
										<option <c:if test="${telArr[0] == '043'}">selected</c:if> value="043"> 043(충북) </option>
										<option <c:if test="${telArr[0] == '051'}">selected</c:if> value="051"> 051(부산) </option>
										<option <c:if test="${telArr[0] == '052'}">selected</c:if> value="052"> 052(울산) </option>
										<option <c:if test="${telArr[0] == '053'}">selected</c:if> value="053"> 053(대구) </option>
										<option <c:if test="${telArr[0] == '054'}">selected</c:if> value="054"> 054(경북) </option>
										<option <c:if test="${telArr[0] == '055'}">selected</c:if> value="055"> 055(경남) </option>
										<option <c:if test="${telArr[0] == '061'}">selected</c:if> value="061"> 061(전남) </option>
										<option <c:if test="${telArr[0] == '062'}">selected</c:if> value="062"> 062(광주) </option>
										<option <c:if test="${telArr[0] == '063'}">selected</c:if> value="063"> 063(전북) </option>
										<option <c:if test="${telArr[0] == '064'}">selected</c:if> value="064"> 064(제주) </option>
									</select>
									-
									<input type="text" class="input3" name="user_tel2" value="${telArr[1]}" size="4" >
									-
									<input type="text" class="input3" name="user_tel3" value="${telArr[2]}" size="4" >
								</c:otherwise>
							</c:choose>
						</div>
					</div>	
				</div>

				<!-- 제출 폼 -->
				<div id="inputSubmit">
					<input class="inputButton2" type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
	<!-- footer page -->
	<%@ include file="/common/footer.jsp" %>	
	</div>
</body>
</html>