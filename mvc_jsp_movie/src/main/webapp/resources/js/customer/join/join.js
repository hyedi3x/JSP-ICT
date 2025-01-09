 
// 1. onsubmit - 회원가입 페이지 필수 체크
// : form 태그 내부에서 <input type='submit'>로 인해 발생하는 이벤트를 처리
function signInChk() {
	// [1-2] joinform의 form 태그 내부 hiddenUserId(input name)의 value가 0일 때, 
	if(document.joinform.hiddenUserId.value == "0") {
		alert("중복 확인 해주세요.");
		document.joinform.dubChk.focus();  // dubChk(input name)로 포커스 
		return false;  // click 이벤트 조건이 실행되면, false값을 반환해 위 기능들 동작 반복 중지
	}

	// [1-2]비밀번호 불일치 체크 (비밀번호 입력값과 비밀번호 확인 입력값이 동일한지 비교)
	if(document.joinform.user_pwd.value != document.joinform.re_pwd.value) {
		alert("비밀번호 불일치!");
		document.joinform.re_pwd.focus();  // 비밀번호 불일치 시, user_pwd(input name)로 포커스
		return false;
	}
}

// 2. onclick="confirmId" : 아이디 입력 후, 중복 확인 버튼 클릭
function confirmId() {
	// [2-1] joinform의 form 태그 내부 user_id(input name)의 value가 없을 때 if문 실행
	if(!document.joinform.user_id.value) {
		alert("아이디를 입력해주세요!");
		document.joinform.user_id.focus();   // user_id(input name)로 포커스 
		return false;  // user_id의 value가 발생하면, false값을 반환해, if문 탈출
	}
	
	// [2-2] 아이디 입력 후, 중복 확인 버튼 클릭 시 : 컨트롤러로 url 전달
	// 쿼리스트링 사용 (URL의 뒤에 입력 데이터를 함께 제공하는 가장 단순한 데이터 전달 방법 - url 주소?key=value&key2=value2) 
	// : user_id= + 입력한 value값을 url 변수에 담음 
	let url = "/mvc_jsp_movie/idConfirm.do?user_id=" + document.joinform.user_id.value;
	
	// window.open( ) :  웹브라우저에서 새창(팝업창)을 여는 함수 
	// open() 함수의 속성들 | 1. 팝업 주소 : url(위에 선언한 변수 사용), 2. 새로 열리는 창(팝업창)의 이름을 지정 : "confirm" , 3. 팝업창 설정 : "menubar=no" : 메뉴바 없이 창 생성
	window.open(url, "confirm", "menubar=no, width=450, height=250");  
	
}

// 3. idConfirm(자식)창에서 join(부모)창으로 userId 값 전달
/*
    - setUserId(userId)의 userID 매개변수는 idConfirm.jsp에서 setUserId('<%=strId%>')와 동일
	- opener : window 객체의 open() 메서드로 열린 자식창(=중복 확인 창)에서 부모창(=회원가입창)에 접근할 때 사용 
*/ 
function setUserId(userId){
	alert("아이디를 "+userId+"으로 변경합니다.");
	
	// [3-1] join.jsp의 joinform의 user_id value 값을 setUserId(userId)로 전달받은 값으로 대입
	opener.document.joinform.user_id.value = userId;
	
	// [3-2] 중복확인 버튼 클릭 여부 체크 (0: 클릭 안함, 1: 클릭함)
	opener.document.joinform.hiddenUserId.value = "1";  
	
	// idConfirm(자식)창 닫기
	self.close();
}


// 4. onchange="selectEmailChk()" - 이메일 타입 체크
function selectEmailChk() {
	// [4-1]user_email3.value가 null일때,
	if(!document.joinform.user_email3.value){  
		document.joinform.user_email2.value = "";   // 직접 입력 선택 시, user_email2 값 초기화 (공백없어야 함, null != 공백)
		document.joinform.user_email2.focus();  // user_email2로 focus 
	}
	// [4-2]user_email3 value 선택 시, 
	else {
		// user_email2 value에 user_email3 value 담기
		document.joinform.user_email2.value = document.joinform.user_email3.value;
		return false;
	}
}

// 5. onchange="selectTel1Chk()" - 지역 번호 체크
function selectTel1Chk() {
	// [5-1]user_tel1.value가 null일 때, (지역번호 선택 옵션) 
	if(!document.joinform.user_tel1.value){
		document.joinform.user_tel1.value = "";  // 지역번호 선택 시, user_tel1 null로 초기화 (공백없어야 함, null != 공백)
	}
}
