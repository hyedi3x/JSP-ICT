package mvc.jsp.dao;

import mvc.jsp.dto.CustomerDTO;

// [데이터베이스의 data에 접근하기 위한 인터페이스]
// : 데이터베이스의 접근을 하기 위한 로직과 비즈니스 로직을 분리 
public interface CustomerDAO {

	// ID 중복 확인 처리 
	public int userIdCheck(String strId);
	
	// 회원 가입 처리 
	public int insertCustomer(CustomerDTO dto);
	
	// 로그인 처리 && 회원정보 인증(수정, 탈퇴) 
	public int userIdPwdChk(String strId, String strPwd);

	// 회원정보 인증처리 && 탈퇴처리
	public int deleteCustomer(String strId);
	
	// 회원정보 인증처리 && 상세 페이지 (return DTO)
	public CustomerDTO getCustomerDetail(String strId);
	
	// 회원정보 수정처리
	public int updateCustomer(CustomerDTO dto);

}
