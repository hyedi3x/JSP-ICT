package mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// [컨트롤러 대신 고객 요청 정보를 처리하는 고객 인터페이스] 
public interface CustomerService {
	// 매개변수로 request, response를 받아, 고객 정보를 브라우저에서 전달 받는다.
	// ID 중복 확인 처리 
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	// 회원 가입 처리 
	public void signInAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	// 로그인 처리 && 회원정보 인증(수정, 탈퇴 버튼 생성) 
	public void loginAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	// 회원정보 인증 후 탈퇴처리
	public void deleteCustomerAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

	// 회원정보 인증 후 상세 페이지
	public void modifyDetailAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

	// 회원정보 수정 처리 페이지
	public void modifyCustomerAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}