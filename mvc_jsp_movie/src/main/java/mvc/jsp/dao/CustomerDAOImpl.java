package mvc.jsp.dao;

import mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO{

	@Override
	// ID 중복 확인 처리 
	public int userIdCheck(String strId) {
		return 0;
	}

	@Override
	// 회원 가입 처리 
	public int insertCustomer(CustomerDTO dto) {
		return 0;
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
