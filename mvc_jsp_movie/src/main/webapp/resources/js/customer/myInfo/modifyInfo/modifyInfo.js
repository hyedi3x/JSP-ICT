
// 1. onsubmit - 회원가입 페이지 필수 체크
// : form 태그 내부에서 <input type='submit'>로 인해 발생하는 이벤트를 처리
function signInChk() {
	// [1-2]비밀번호 불일치 체크 (비밀번호 입력값과 비밀번호 확인 입력값이 동일한지 비교)
	if(document.modifyInfoform.user_pwd.value != document.modifyInfoform.re_pwd.value) {
		alert("비밀번호 불일치!");
		document.modifyInfoform.re_pwd.focus();  // 비밀번호 불일치 시, user_pwd(input name)로 포커스
		return false;
	}
}


// 4. onchange="selectEmailChk()" - 이메일 타입 체크
function selectEmailChk() {
	// [4-1]user_email3.value가 null일때,
	if(!document.modifyInfoform.user_email3.value){  
		document.modifyInfoform.user_email2.value = "";   // 직접 입력 선택 시, user_email2 값 초기화 (공백없어야 함, null != 공백)
		document.modifyInfoform.user_email2.focus();  // user_email2로 focus 
	}
	// [4-2]user_email3 value 선택 시, 
	else {
		// user_email2 value에 user_email3 value 담기
		document.modifyInfoform.user_email2.value = document.modifyInfoform.user_email3.value;
		return false;
	}
}

// 5. onchange="selectTel1Chk()" - 지역 번호 체크
function selectTel1Chk() {
	// [5-1]user_tel1.value가 null일 때, (지역번호 선택 옵션) 
	if(!document.modifyInfoform.user_tel1.value){
		document.modifyInfoform.user_tel1.value = "";  // 지역번호 선택 시, user_tel1 null로 초기화 (공백없어야 함, null != 공백)
	}
}
