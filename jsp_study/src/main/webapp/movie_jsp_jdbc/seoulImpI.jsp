<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시네마 정보 테이블</title>
</head>
<body>
	<%
		// [DB 연결 정보]
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클과 연동하는 호스트 번호
		String dbID = "scott_04";     // 오라클 계정 
		String dbPassword = "tiger";  // 오라클 비번
		
		// [라이브러리 변수 초기화] : jsp는 자동 초기화를 지원하지 않아, null로 초기화
		Connection conn = null;       // 오라클 연결 라이브러리
		PreparedStatement pstmt = null;  // sql 문을 사용하게 해주는 라이브러리
		ResultSet rs = null;     // sql 실행결과를 가지고 오는 라이브러리
	
	 	// 한글 처리
	 	request.setCharacterEncoding("UTF-8");
	 
	    // input 값 불러오기
	    String Area = request.getParameter("cinema_area");
	
	    try {
			// [DB 접속/연결]
			// Oracle JDBC 드라이버는 oracle.jdbc.driver.OracleDriver라는 클래스에 구현
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			// [SQL 쿼리 수정]
			String query = "SELECT * FROM cinema WHERE cinema_area = ?";
			
			// [쿼리 연결 및 값 바인딩]
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, Area);
			
			rs = pstmt.executeQuery();
			
			// [로그인 결과 검증]
			if (rs.next()) {
		        String cinemaId = rs.getString("cinema_id");
		        String cinemaCity = rs.getString("cinema_city");
		        String cinemaArea = rs.getString("cinema_area");
		        String cinemaLoc = rs.getString("cinema_loc");
		        String cinemaTel = rs.getString("cinema_tel");
		        String cinemaRoom = rs.getString("cinema_room");
		        String cinemaSeat = rs.getString("cinema_seat");            
	%>
	<tr>
		<th>영화관 고유 번호</th>
		<td><%= cinemaId %></td>
	</tr>
	<tr>
		<th>영화관 도시</th>
		<td><%= cinemaCity %></td>
	</tr>
	<tr>
		<th>영화관 지역</th>
		<td><%= cinemaArea %></td>
	</tr>
	<tr>
		<th>영화관 위치정보</th>
		<td><%= cinemaLoc %></td>
	</tr>
	<tr>
		<th>영화관 전화번호</th>
		<td><%= cinemaTel %></td>
	</tr>
	<tr>
		<th>영화관 상영관 수</th>
		<td><%= cinemaRoom %></td>
	</tr>
	<tr>
		<th>영화관 좌석 수</th>
		<td><%= cinemaSeat %></td>
	</tr>

	<%
			} 
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	%>
</body>
</html>
