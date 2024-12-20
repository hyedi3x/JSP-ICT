<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 서버 연동 페이지</title>
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
		
		// input 입력값 변수에 저장하기
		String userId = request.getParameter("u_id");
		String userPwd = request.getParameter("u_password"); 
	
	    try {
	        // [DB 접속/연결]
	        // Oracle JDBC 드라이버는 oracle.jdbc.driver.OracleDriver라는 클래스에 구현
	        // Class.forName() => 지정한 클래스 정보를 담고 있는 인스턴스를 반환 메서드
	        Class.forName("oracle.jdbc.driver.OracleDriver");  
	        
	        // DB 연결 : 데이터베이스 커넥션 생성 
	        conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
					
	        // [SQL 쿼리 수정]
	        // 아이디와 비번을 검사하는 구문
	        String query = "SELECT * FROM movie_member WHERE id = ? AND password = ?";
	
	        // [쿼리 연결 및 값 바인딩]
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, userId);
	        pstmt.setString(2, userPwd);
	
	        rs = pstmt.executeQuery();  // 조회 결과를 담는다.
	
	        // [로그인 결과 검증]
	        // 데이터가 일치하면 cinema.jsp 페이지로 이동
	        if (rs.next()) {
	%>
				<jsp:include page="cinema.jsp" />
	<%
        	} 
        	// 데이터가 일치하지 않으면 fail.jsp 페이지로 이동
        	else {
    %>
				<jsp:include page="fail.jsp" />
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
