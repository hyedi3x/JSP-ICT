package mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// [컨트롤러 대신 고객 요청 정보를 처리하는 고객 인터페이스] 
public interface CustomerService {
	// 매개변수로 request, response를 받아, 고객 정보를 브라우저에서 전달 받는다.
	// ======================= [id 중복 확인 처리 페이지] =======================
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	// ======================= [회원가입 처리 페이지] =======================
	public void signUpAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	// ======================= [로그인 성공 처리 페이지] =======================
	public void loginAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

	// ======================= [마이페이지] =======================
	public void myInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	// ======================= [마이페이지 - 수정/삭제 페이지 진입 전 비밀번호 확인(인증) 처리 페이지] =======================
	public void userPwdChk(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	// ======================= [마이페이지 - 수정 페이지] =======================
	public void modifyInfo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;

	// ======================= [회원정보 인증 후 수정처리] =======================
	public void modifyInfoAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
	
	// ======================= [회원정보 인증 후 탈퇴처리] =======================
	public void deleteInfoAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}