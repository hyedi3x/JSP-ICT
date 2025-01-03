package mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerSerivceImpl implements CustomerService{

	@Override
	// ID 중복 확인 처리 
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	// 회원 가입 처리 
	public void signInAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	// 로그인 처리 && 회원정보 인증(수정, 탈퇴 버튼 생성) 
	public void loginAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	// 회원정보 인증 후 탈퇴처리
	public void deleteCustomerAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	// 회원정보 인증 후 상세 페이지
	public void modifyDetailAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	// 회원정보 인증 후 탈퇴처리
	public void modifyCustomerAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
