<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>나의 정보 좌측 메뉴</title>

<script type="text/javascript" defer>

// DOMContentLoaded : 브라우저가 HTML을 전부 읽고 DOM 트리를 완성하는 즉시 발생
document.addEventListener("DOMContentLoaded", () => {

	const li_hovers = document.querySelectorAll('.on');  // hover를 적용할 li 클래스 on을 변수에 담는다.
    
	// (li_hover) => { }: 콜백 함수, 배열의 각 요소를 순회할 때마다 실행될 함수를 정의
	li_hovers.forEach((li_hover)=>{
       li_hover.addEventListener('mouseover', function(e) {
             // parentElement: 현재 요소의 부모 요소, previousElementSibling: 부모 요소의 자식 요소 중 현재 요소 바로 앞에 위치한 요소(형제 요소)를 가리킨다.
             this.parentElement.previousElementSibling.style.backgroundColor = '#1b1b1c' // 블랙에 가까운
       });
    });
    
    li_hovers.forEach((li_hover)=>{
       li_hover.addEventListener('mouseout', function(e) {
             this.parentElement.previousElementSibling.style.backgroundColor = '#fb4357'  // 원래 색깔로 초기화 
       })
    });
});

</script>

</head>
<body>
	<!-- 좌측 메뉴 -->
	<div id="leftWrap">
		<!-- 좌측 메뉴바 -->
		<ul id="left_menubar">
			<!-- 나의 예매 내역 -->
			<li>
				<h4> 나의 예매 내역</h4>
				<ul class="info_menu">
					<li class="on"><a href="#">☞ 신용카드 영수증 출력</a></li>
				</ul>
			</li>
			
			<!-- 관람권/할인쿠폰 관리 -->			
			<li>
				<h4> 관람권/할인쿠폰 관리</h4>
				<ul class="info_menu">
					<li class="on"><a href="#">☞ CGV 영화 관람권</a></li>
					<li class="on"><a href="#">☞ CGV 할인 쿠폰</a></li>
					<li class="on"><a href="#">☞ CGV 무비패스 카드</a></li>
					<li class="on"><a href="#">☞ CGV 기프트 카드</a></li>
					<li class="on"><a href="#">☞ CJ ONE 쿠폰</a></li>
					<li class="on"><a href="#">☞ 간편결제/카드사 할인쿠폰</a></li>
				</ul>
			</li>
			
			<!-- CJ ONE 포인트 -->
			<li>
				<h4> CJ ONE 포인트</h4>
				<ul class="info_menu">
					<li class="on"><a href="#">☞ 포인트 적립/사용 안내</a></li>
					<li class="on"><a href="#">☞ CGV 이용 내역</a></li>
				</ul>
			</li>				
			
			<!-- 기프트샵 -->
			<li>
				<h4> 기프트샵</h4>
				<ul class="info_menu">
					<li class="on"><a href="#">☞ 내 기프트콘</a></li>
					<li class="on"><a href="#">☞ 결제 내역</a></li>
				</ul>
			</li>	
			
			<!-- 회원정보 -->
			<li>
				<h4> 회원정보 </h4>
				<ul class="info_menu">
					<li class="on"><a href="${path}/modifyInfoChk.do">☞ 개인정보 설정</a></li>
					<li class="on"><a href="#">☞ 선택정보 설정</a></li>
					<li class="on"><a href="#">☞ 간편 로그인 설정</a></li>
					<li class="on"><a href="${path}/deleteInfoChk.do">☞ 회원 탈퇴</a></li>
				</ul>
			</li>	
			
			
			<!-- 나의 문의내역 -->
			<li>
				<h4> 나의 문의내역 </h4>
				<ul class="info_menu">
					<li class="on"><a href="#">☞ 1:1 문의</a></li>
					<li class="on"><a href="#">☞ 분실물 문의</a></li>
				</ul>
			</li>	
		</ul>
	</div>
	
</body>
</html>