<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 홈페이지</title>

<link href="./css/cinema.css" rel="stylesheet">
</head>
<body>
	<%-- header를 가지고 옴  --%>
	<%@ include file="header.jsp" %>

	<!-- 상영관 정보 조회 페이지 -->
	<div class="cinema_container">
		<div id="c_section">
			<div id="c_line">
				<div id="c_favorite">
					<h3> 자주 가는 CGV  </h3>
					<div id="c_city">
						<ul>
							<li><a href="seoul.jsp">서울</a></li>
							<li><a href="#">경기</a></li>
							<li><a href="#">인천</a></li>
							<li><a href="#">강원</a></li>
							<li><a href="#">대전/충청</a></li>
							<li><a href="#">대구</a></li>
							<li><a href="#">부산/울산</a></li>
							<li><a href="#">경상</a></li>
							<li><a href="#">광주/전라/제주</a></li>
						</ul>
					</div>
					<div class="c_area">
					 	<ul class="ul_space_between">
							<li><a href="seoul.jsp?cinema_area=CGV강남">CGV강남</a></li>
							<li><a href="seoul.jsp?cinema_area=CGV강변">CGV강변</a></li>
							<li><a href="seoul.jsp?cinema_area=CGV건대입구">CGV건대입구</a></li>
							<li><a href="#">CGV구로</a></li>
							<li><a href="#">CGV대학로</a></li>
							<li><a href="#">CGV동대문</a></li>
							<li><a href="#">CGV명동</a></li>
							<li><a href="#">CGV명동역 씨네라이브러리</a></li>
							<li><a href="#">CGV미아</a></li>
							<li><a href="#">CGV방학</a></li>
							<li><a href="#">CGV불광</a></li>
							<li><a href="#">CGV상봉</a></li>
							<li><a href="#">CGV성신여대입구</a></li>
							<li><a href="#">CGV송파</a></li>
							<li><a href="#">CGV수유</a></li>
							<li><a href="#">CGV신촌아트레온</a></li>
							<li><a href="#">CGV압구정</a></li>
							<li><a href="#">CGV여의도</a></li>
							<li><a href="#">CGV연남</a></li>
							<li><a href="#">CGV영등포</a></li>
							<li><a href="#">CGV왕십리</a></li>
							<li><a href="#">CGV용산아이파크몰</a></li>
							<li><a href="#">CGV중계</a></li>
							<li><a href="#">CGV천호</a></li>
							<li><a href="#">CGV청담씨네시티</a></li>
						</ul>
						<ul class="ul_flexStart">
							<li><a href="#">CGV홍대</a></li>
							<li><a href="#">CGV피카디리1958</a></li>
							<li><a href="#">CGV하계</a></li>
							<li><a href="#">CINE de CHEF 압구정</a></li>
							<li><a href="#">CINE de CHEF 용산아이파크몰</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>