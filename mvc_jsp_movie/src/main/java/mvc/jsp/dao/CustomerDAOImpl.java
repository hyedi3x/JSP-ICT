package mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO{
	
	// [커넥션 풀 객체를 보관] 
	DataSource dataSource = null;  // import javax.sql.DataSource;
	
	// 싱글톤 패턴으로 생성
	// [static으로 유일한 인스턴스 생성]
	private static CustomerDAOImpl custInstance = new CustomerDAOImpl();

	// [외부에서 인스터스 참조 가능한 public 메서드 만들기]
	public static CustomerDAOImpl getInstance() {
		if (custInstance == null) {
			custInstance = new CustomerDAOImpl();
		}
		return custInstance;
	}

	// 디폴트 생성자
	// 커넥션풀(DBCP : DataBase Connection Pool 방식) - context.xml에 설정
	private CustomerDAOImpl() {
		try {
			Context context = new InitialContext();
			// context.lookup("java:comp/env/리소스(Resource) name과 동일")
			// context.xml에 설정한 type이 javax.sql.DataSource 타입이라서 
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvc_jsp_movie");
		
		} catch(NamingException e){
			e.printStackTrace();
		}
	}

	// [라이브러리 변수 초기화]
	Connection conn = null; // 오라클 연결 라이브러리
	PreparedStatement pstmt = null; // sql 문장을 사용할 수 있게 해주는 라이브러리
	ResultSet rs = null;  // select 결과 
	
	@Override
	// ID 중복 확인 처리 
	public int userIdCheck(String strId) {
		System.out.println("CustomerDAOImpl - userIdCheck()");
		int selectCnt=0;
		
		try { 
			// 1. DB 연결 => 데이터베이스 커넥션 생성 
			conn = dataSource.getConnection();
			
			// 2. SQL 작성 => prepareStatement 작성 
			String sql = "SELECT * FROM movie_customer_tb WHERE user_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			rs = pstmt.executeQuery();  // executeQuery() : select문과 같은 쿼리문을 실행할 때 사용
			
			// 3. 실행 
			// rs가 존재할 때 
			if(rs.next()) {
				selectCnt = 1;
				System.out.println("selectCnt: " + selectCnt); // (1 : 성공 0: 실패)
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				if (rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	@Override
	// 회원 가입 처리 
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - insertCustomer()");
		int insertCnt = 0;
		
		try { 
			// 1. DB 연결 => 데이터베이스 커넥션 생성 
			conn = dataSource.getConnection();
			
			// 2. SQL 작성 => prepareStatement 작성 
			String sql = "INSERT INTO movie_customer_tb"
					+ "    VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'userNo_'||(SELECT NVL(MAX(TO_NUMBER(substr(user_no, 8)))+1, 1) FROM movie_customer_tb),  SYSDATE, DEFAULT)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pwd());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setDate(4, dto.getUser_birth());
			pstmt.setString(5, dto.getUser_phone());
			pstmt.setString(6, dto.getUser_address());
			pstmt.setString(7, dto.getUser_email());
			pstmt.setString(8, dto.getUser_tel());			
			
			insertCnt = pstmt.executeUpdate();   // executeUpdate() : Insert, Delete, Update의 SQL구문 실행 시 사용, 1 : 성공 0: 실패
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return insertCnt;
	}

	@Override
	// 로그인 처리 && 회원정보 인증(수정, 탈퇴) 
	public int userIdPwdChk(String strId, String strPwd) {
		return 0;
	}

	@Override
	// 회원정보 인증처리 && 탈퇴처리
	public int deleteCustomer(String strId) {
		return 0;
	}

	@Override
	// 회원정보 인증처리 && 상세 페이지 (return DTO)
	public CustomerDTO getCustomerDetail(String strId) {
		return null;
	}

	@Override
	// 회원정보 수정처리
	public int updateCustomer(CustomerDTO dto) {
		return 0;
	}

}
