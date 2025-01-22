package mvc.jsp.dao;

import mvc.jsp.dto.CustomerDTO;

// [데이터베이스의 data에 접근하기 위한 인터페이스]
// : 데이터베이스의 접근을 하기 위한 로직과 비즈니스 로직을 분리 
public interface CustomerDAO {

	// ======================= [id 중복 확인 처리 페이지] =======================
	public int userIdCheck(String strId);
	
	// ======================= [회원가입 처리 페이지] =======================
	public int insertCustomer(CustomerDTO dto);
	
	// ======================= [회원정보 인증(아이디, 비번)] =======================
	public int userIdPwdChk(String strId, String strPwd);

	// ======================= [회원정보 불러오기] =======================
	public CustomerDTO memberSelect(String strId);

	// ======================= [회원정보 수정처리] =======================
	public int updateCustomer(CustomerDTO dto);
	
	// ======================= [회원정보 탈퇴처리] =======================
	public int deleteCustomer(String strId);

}
