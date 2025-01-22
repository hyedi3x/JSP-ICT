
// 1. onclick="deleteGuide" : 서비스 이용 약관 버튼 클릭시
function deleteGuide(path) {
	// 컨트롤러로 url 전달
	let url = path + "/deleteGuide.do";
	
	// window.open( ) :  웹브라우저에서 새창(팝업창)을 여는 함수 
	// open() 함수의 속성들 | 1. 팝업 주소 : url(위에 선언한 변수 사용), 2. 새로 열리는 창(팝업창)의 이름을 지정 : "confirm" 
	// , 3. 팝업창 설정 : "menubar=no" : 메뉴바 없이 창 생성, 창 위치 조정: left=900, top=250
	window.open(url, "deleteGuide", "menubar=no, width=400, height=400, left=900, top=250");  
}

// 약관동의 창 닫기
function delClose(){
	self.close();
}

